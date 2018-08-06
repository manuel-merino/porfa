#include <netlib.h>

#include "netlib_inline.c"


#ifdef __cplusplus
extern "C" {
#endif

	//Static Variables

#ifdef WIN32

	#include <mstcpip.h>
	#define MSG_NOSIGNAL 0

#endif

	uint32_t sslStarted = 0;

	int tcp_connect_to(const char *ip, uint16_t port)
	{
		int sockfd ;

		if (strchr(ip, ':')) { // IPv6
			sockfd = socket(AF_INET6, SOCK_STREAM, 0);

			if (sockfd == -1) {
				return -1;
			}

			struct sockaddr_in6 cli_addr;

			memset(&cli_addr, 0, sizeof(cli_addr));

			cli_addr.sin6_family = AF_INET6;

			cli_addr.sin6_port = htons(port);

			#ifndef WIN32
			inet_pton(AF_INET6, ip, &(cli_addr.sin6_addr));
			#else
			InetPton(AF_INET6, ip, &(cli_addr.sin6_addr));
			#endif

			if (connect(sockfd, (struct sockaddr *) &cli_addr, sizeof(cli_addr)) < 0) {
				close(sockfd);
				return -1;
			}

		} else { //IPv4
			sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

			if (sockfd == -1) {
				return -1;
			}

			struct sockaddr_in cli_addr;

			memset(&cli_addr, 0, sizeof(cli_addr));

			cli_addr.sin_family = AF_INET;

			cli_addr.sin_port = htons(port);

			cli_addr.sin_addr.s_addr = inet_addr(ip);

			if (connect(sockfd, (struct sockaddr *) &cli_addr, sizeof(cli_addr)) < 0) {
				close(sockfd);
				return -1;
			}
		}

		return sockfd;
	}

	int tcp_listen_on_port(uint16_t port)
	{
		int sockfd;

		sockfd = socket(AF_INET6, SOCK_STREAM, 0);

		if (sockfd == -1) {
			perror("socket");
			return -1;
		}

		int yes = 1;

		if (setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, (char *)(&yes), sizeof(yes)) == -1) {
			perror("setsockopt");
			return -1;
		}

		struct sockaddr_in6 serv_addr;

		memset((char *) &serv_addr, 0, sizeof(serv_addr));

		serv_addr.sin6_family = AF_INET6;

		serv_addr.sin6_port = htons(port);

		serv_addr.sin6_addr = in6addr_any;

		if (bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) != 0) {
			perror("bind");
			return -1;
		}

		if (listen(sockfd, 50) != 0) {
			perror("listen");
			return -1;
		}

		return sockfd;
	}

	int tcp_acceptext(int listen_socket, struct timeval *timeout, struct sockaddr_storage *st)
	{
		//TIMEOUT
		if (timeout) {
			if (setsockopt(listen_socket, SOL_SOCKET, SO_RCVTIMEO, (char *)timeout,
						   sizeof(struct timeval)) < 0) {
				fputs("setsockopt failed\n", stderr);
			}

			if (setsockopt(listen_socket, SOL_SOCKET, SO_SNDTIMEO, (char *)timeout,
						   sizeof(struct timeval)) < 0) {
				fputs("setsockopt failed\n", stderr);
			}
		}

		socklen_t clilen = sizeof(struct sockaddr_storage);

		int newsockfd = accept(listen_socket, (struct sockaddr *) st, &clilen);

		return newsockfd;
	}

	int tcp_accept(int listen_socket, struct timeval *timeout)
	{
		struct sockaddr_storage cli_addr;

		return tcp_acceptext(listen_socket, timeout, &cli_addr);
	}

	int tcp_message_send(int socket, const void *message, size_t len)
	{
		ssize_t sent = 0;
		ssize_t sent_now;

		do {
			sent_now = send(socket, (char *)message + sent, len - sent, MSG_NOSIGNAL);

			if (sent_now > 0) {
				sent += sent_now;

			} else if (sent_now == -1 && (errno == EPIPE || errno == ENOTCONN)) {
				return -1;
			}
		} while (sent != (ssize_t)len && sent_now != -1 && sent_now != 0);

		if (sent_now == -1 || sent_now == 0) {
			if (sent == 0) {
				return -2;

			} else {
				return sent;
			}
		}

		return 0;
	}

	ssize_t tcp_message_recv(int socket, void *message, size_t len, uint8_t sync)
	{
		ssize_t received = 0;
		ssize_t received_now;

		do {
			received_now = recv(socket, (char *)message + received, len - received, MSG_NOSIGNAL);

			if (received_now > 0) {
				received += received_now;

			} else if (received_now == 0 || (received_now == -1 && (errno == EPIPE || errno == ENOTCONN))) {
				if (received > 0) {
					return received;

				} else {
					return -1;
				}
			}
		} while (received != (ssize_t)len && (
			sync ?
			((received_now == -1 || received_now == 0) && (errno == EAGAIN || errno == EWOULDBLOCK))
			: (received_now != -1 && received_now != 0)));

		return received;
	}


	/** tcp_setKeepAlive
	 * Sets the keepalive params
	 * @param socket The shocket itself
	 * @param cnt The maximum number of keepalive probes TCP should send before dropping the connection.
	 * @param idl The time (in seconds) the connection needs to remain idle before TCP starts sending keepalive probes.
	 * @param intlv The time (in seconds) between individual keepalive probes.
	 * @return 0 if OK, something else if error.
	 */
	int tcp_setKeepAlive(const int socket, const int cnt, const int idl, const int intvl)
	{
		int optval = 1;
		socklen_t optlen = sizeof(int);

		if (setsockopt(socket, SOL_SOCKET, SO_KEEPALIVE, (char *)(&optval), optlen) < 0) {
			return -1;
		}

	#if defined(WIN32)
		struct tcp_keepalive keepalive_conf;
		keepalive_conf.onoff = 1;
		keepalive_conf.keepalivetime = idl * 1000;
		keepalive_conf.keepaliveinterval = intvl * 1000;

		if (WSAIoctl(socket, SIO_KEEPALIVE_VALS, &keepalive_conf, sizeof(keepalive_conf), 0, 0, 0, 0, 0) != 0) {
			return -2;
		}
	#elif defined(__APPLE__)
		if (setsockopt(socket, IPPROTO_TCP, TCP_KEEPALIVE, &idl, sizeof(idl)) < 0) {
			return -2;
		}

		(void)cnt;
		(void)intvl;
	#else
		if (setsockopt(socket, SOL_TCP, TCP_KEEPCNT, &cnt, optlen) < 0) {
			return -2;
		}

		if (setsockopt(socket, SOL_TCP, TCP_KEEPIDLE, &idl, optlen) < 0) {
			return -3;
		}

		if (setsockopt(socket, SOL_TCP, TCP_KEEPINTVL, &intvl, optlen) < 0) {
			return -4;
		}
	#endif	

		return 0;
	}

	/** tcp_getKeepAlive
	 * Gets the keepalive params
	 * @param socket The shocket itself
	 * @param cnt The maximum number of keepalive probes TCP should send before dropping the connection.
	 * @param idl The time (in seconds) the connection needs to remain idle before TCP starts sending keepalive probes.
	 * @param intlv The time (in seconds) between individual keepalive probes.
	 * @return 0 if OK, something else if error (like keepAlive is disabled).
	 */
	int tcp_getKeepAlive(const int socket, int *cnt, int *idl, int *intvl)
	{
		int optval = 1;
		socklen_t optlen = sizeof(int);

		if (getsockopt(socket, SOL_SOCKET, SO_KEEPALIVE, (char *)(&optval), &optlen) < 0) {
			return -1;
		}

		if (optval == 0) {
			return 1;
		}

		optlen = sizeof(int);

	#if !(defined(WIN32) || defined(__APPLE__))
		if (getsockopt(socket, SOL_TCP, TCP_KEEPCNT, cnt, &optlen) < 0) {
			return -2;
		}

		optlen = sizeof(int);

		if (getsockopt(socket, SOL_TCP, TCP_KEEPIDLE, idl, &optlen) < 0) {
			return -3;
		}

		optlen = sizeof(int);

		if (getsockopt(socket, SOL_TCP, TCP_KEEPINTVL, intvl, &optlen) < 0) {
			return -4;
		}
	#else
		(void)cnt;
		(void)idl;
		(void)intvl;
	#endif	

		return 0;
	}







	const char *ciphers =
		"ECDHE-RSA-AES256-GCM-SHA384"
		":ECDHE-ECDSA-AES256-GCM-SHA384"
		":ECDHE-RSA-AES256-SHA384"
		":ECDHE-ECDSA-AES256-SHA384"
//	":RC4-SHA"
//	":ECDH-ECDSA-RC4-SHA"
//	":ECDH-RSA-RC4-SHA"
//	":ECDHE-ECDSA-RC4-SHA"
//	":ECDHE-RSA-RC4-SHA"
//	":ECDH-ECDSA-AES128-SHA256"
//	":ECDH-ECDSA-AES128-GCM-SHA256"
//	":ECDH-RSA-AES128-SHA256"
//	":ECDH-RSA-AES128-GCM-SHA256"
//	":AES128-SHA256"
//	":DH-RSA-AES128-SHA256"
//	":ECDH-RSA-AES256-SHA384"
		;
//const char *ciphers = "RC4-SHA";

	/** tcp_upgrade2syncSocket
		 * upgrades a simple socket to SyncSocket
		 * @param socket : the older socket
		 * @param mode : the SSL mode
		 * @param sslConfig : Can be NULL (even with ssl=1). Sets the SSL config. connection.
		 * @return a new SyncSocket
		 */
	SyncSocket *tcp_upgrade2syncSocket(int socket, enum syncSocketType mode, SSL_CTX *config)
	{
		if (socket < 0) { // check if the socket is valid
			return NULL;
		}

		SyncSocket *ret = (SyncSocket *)malloc(sizeof(SyncSocket));

		if (!ret) {
			return ret;
		}

		if (mode != NOSSL) {
			if (!sslStarted) {
				SSL_load_error_strings();
				SSL_library_init();
				sslStarted = 1;
			}

			if (!config) {

				ret->config = getDefaultSSocketSSLconfig(mode, 1);

				if (ret->config == NULL) {
					ERR_print_errors_fp(stderr);
					fprintf(stderr, "[NETLIB] [SSL]: SSL_CTX_new error\n");
					exit(1);
				}

			} else {
				ret->config = config;
			}

			SSL_CTX_set_mode(ret->config, SSL_MODE_ENABLE_PARTIAL_WRITE);
			SSL_CTX_set_mode(ret->config, SSL_MODE_ACCEPT_MOVING_WRITE_BUFFER);

			ret->tls = SSL_new(ret->config);
			SSL_set_fd(ret->tls, socket);

			if (mode == SRVSSL) {
				int ssl_ret;
				int ssl_err;

				do {
					ssl_ret = SSL_accept(ret->tls);
					ssl_err = SSL_get_error(ret->tls, ssl_ret);
				} while (ssl_err == SSL_ERROR_WANT_READ  || ssl_err == SSL_ERROR_WANT_WRITE);

				if (ssl_ret <= 0) {
					perror("SSL ERROR");
					ERR_print_errors_fp(stderr);
					SSL_shutdown(ret->tls);
					SSL_free(ret->tls);
					return NULL;
				}

			} else {
				int ssl_ret;
				int ssl_err;

				do {
					ssl_ret = SSL_connect(ret->tls);
					ssl_err = SSL_get_error(ret->tls, ssl_ret);
				} while (ssl_err == SSL_ERROR_WANT_READ  || ssl_err == SSL_ERROR_WANT_WRITE);

				if (ssl_ret <= 0) {
					perror("SSL ERROR");
					ERR_print_errors_fp(stderr);
					SSL_shutdown(ret->tls);
					SSL_free(ret->tls);
					return NULL;
				}
			}

#ifdef NL_DEBUG
			fprintf(stderr, "Connection established with algorithm: %s\n", SSL_get_cipher_name(ret->tls));
#endif

		} else {
			ret->tls = NULL;
			ret->config = NULL;
		}

		ret->sockfd = socket;

		return ret;
	}

	/** getDefaultSSocketSSLconfig
	 * @return the default SSL config
	 */
	SSL_CTX *getDefaultSSocketSSLconfig(enum syncSocketType mode, int freeOnError)
	{
		SSL_CTX *ret;

		if (!sslStarted) {
			SSL_load_error_strings();
			SSL_library_init();
			sslStarted = 1;
		}

		if (mode == SRVSSL) {
			ret = SSL_CTX_new(TLSv1_2_server_method());

		} else {
			ret = SSL_CTX_new(TLSv1_2_client_method());
		}

		if (!ret) {
			return NULL;
		}

		if (!SSL_CTX_set_ecdh_auto(ret, 1) && freeOnError) {
			ERR_print_errors_fp(stderr);
			SSL_CTX_free(ret);
			return NULL;
		}

		if (!SSL_CTX_load_verify_locations(ret, "certs/ca.pem", NULL) && freeOnError) {
			ERR_print_errors_fp(stderr);
			return NULL;
		}

		if (!SSL_CTX_use_certificate_file(ret, "certs/worm.pem", SSL_FILETYPE_PEM) && freeOnError) {
			ERR_print_errors_fp(stderr);
			return NULL;
		}

		if (!SSL_CTX_use_PrivateKey_file(ret, "certs/prv/worm.key.pem", SSL_FILETYPE_PEM) && freeOnError) {
			ERR_print_errors_fp(stderr);
			return NULL;
		}

		/* verify private key */
		if (!SSL_CTX_check_private_key(ret) && freeOnError) {
			fprintf(stderr, "Private key does not match the public certificate\n");
			return NULL;
		}

		if (!SSL_CTX_set_cipher_list(ret, ciphers) && freeOnError) {
			fprintf(stderr, "No cipher could be selected\n");
			return NULL;
		}

		SSL_CTX_set_verify(ret, SSL_VERIFY_PEER, NULL);
		SSL_CTX_set_verify_depth(ret, 3);

		return ret;
	}

	/** tcp_message_ssend
	 * Sends a full message to a socket
	 * @return 0 if OK, something else if error.
	 */
	int tcp_message_ssend(SyncSocket *socket, const void *message, size_t len)
	{
		if (socket->config == NULL) {
			return tcp_message_send(socket->sockfd, message, len);

		} else {
			ssize_t sent = 0;
			ssize_t sent_now;

			do {
				sent_now = SSL_write(socket->tls, (uint8_t *)message + sent, len - sent);

				if (sent_now > 0) {
					sent += sent_now;

				} else if ((sent_now == 0 || sent_now == -1) && (errno == EPIPE || errno == ENOTCONN || SSL_get_error(socket->tls,sent_now) == SSL_ERROR_ZERO_RETURN)) {
					return -1;
				}
			} while (sent != (ssize_t)len && sent_now != -1 && sent_now != 0);

			return 0;
		}
	}

	/** tcp_message_srecv
	 * Receives a full message from a socket
	 * @return number of bytes read.
	 */
	ssize_t tcp_message_srecv(SyncSocket *socket, void *message, size_t len, uint8_t sync)
	{
		if (socket->config == NULL) {
			return tcp_message_recv(socket->sockfd, message, len, sync);

		} else {
			ssize_t received = 0;
			ssize_t received_now;

			do {
				received_now = SSL_read(socket->tls, (uint8_t *)message + received, len - received);

				if (received_now > 0) {
					received += received_now;

				} else if (received_now == 0 || (received_now == -1 && (errno == EPIPE || errno == ENOTCONN))) {
					if (received > 0) {
						return received;

					} else {
						return -1;
					}
				}
			} while (received != (ssize_t)len && (
				sync ?
				((received_now == -1 || received_now == 0) && (errno == EAGAIN || errno == EWOULDBLOCK))
				: (received_now != -1 && received_now != 0)));

			return received;
		}
	}

	/** tcp_sclose
	 * Receives a full message from a socket
	 * @return number of bytes read.
	 */
	void tcp_sclose(SyncSocket *socket)
	{
		if (socket) {
			if (socket->tls) {
//			tls_close(socket->tls);
//			tls_free(socket->tls);
//			tls_config_free(socket->config);
				SSL_shutdown(socket->tls);
				SSL_free(socket->tls);
			}

			close(socket->sockfd); //TODO check if necesary
			free(socket);
		}
	}

	/** syncSocketStartSSL
	 * Changes the syncsocketMode in order to start a SSL session.
	 * @return 0 if ssl has successfully started or 1 if not.
	 */
	int syncSocketStartSSL(SyncSocket *socket, enum syncSocketType mode, SSL_CTX *sslConfig)
	{
		if (!socket->tls) { //If there is no SSL connection
			SyncSocket *newSocket = tcp_upgrade2syncSocket(socket->sockfd, mode, sslConfig);

			if (newSocket) {
				socket->config	= newSocket->config;
				socket->tls		= newSocket->tls;
				//socket->sockfd  = newSocket->sockfd;
				//socket->tlsIO	= newSocket->tlsIO;
				free(newSocket);
				return 0;

			} else {
				fprintf(stderr, "Error creating SSL session...\n");
				return 1;
			}

		} else {
			return 1;
		}
	}

	/************
	 * ASYNC LIB *
	 ************/

#ifndef _MSC_VER

	typedef void *(*async_fun_p)(void *);


	void *send_fun(void *args)
	{
		AsyncSocket *sock = (AsyncSocket *) args;

		size_t current_buf = 0;
		struct timespec ts = {.tv_sec = 0, .tv_nsec = 100};

		for (;; current_buf = (current_buf + 1) & 1) { // equivalent to %2
			int writing = 0;

			// Wait until the buffer can be sent
			do {
				nanosleep(&ts, 0);
				pthread_spin_lock(&(sock->lock));

				if (sock->to_access[current_buf]) {
					writing = 1;

				} else if (sock->finish) {
					pthread_spin_unlock(&(sock->lock));
					return 0;

				}

				pthread_spin_unlock(&(sock->lock));
			} while (!writing);

			if (sock->write_pos[current_buf] > 0) {
				if (tcp_message_ssend(sock->ssock, sock->buff[current_buf], sock->write_pos[current_buf]) == -1) {
					//socket closed
					pthread_spin_lock(&(sock->lock));
					sock->closed = 1;
					pthread_spin_unlock(&(sock->lock));
					return 0;
				}
			}

			pthread_spin_lock(&(sock->lock));
			sock->to_access[current_buf] = 0;
			pthread_spin_unlock(&(sock->lock));

		}
	}


	void *recv_fun(void *args)
	{
		AsyncSocket *sock = (AsyncSocket *) args;

		size_t current_buf = 0;
		uint32_t myLoad = 0;
		int32_t received = 0;

		for (;;) {
			do {
				int received_now = tcp_message_srecv(sock->ssock,
													 sock->buff[current_buf] + received,
													 sock->buf_len - received, 0);

				if (received_now > 0) {
					received += received_now;

				} else if (received_now < 0) {
					//closed socket
					pthread_spin_lock(&(sock->lock));
					sock->closed = 1;
					sock->to_access[current_buf] = 1;
					sock->write_pos[current_buf] = received;
					pthread_spin_unlock(&(sock->lock));
					return 0;
				}

				pthread_spin_lock(&(sock->lock));

				if (sock->finish) {
					sock->to_access[current_buf] = 1;
					sock->write_pos[current_buf] = received;
					pthread_spin_unlock(&(sock->lock));
					return 0;
				}

				if (received == (int32_t)sock->buf_len || sock->flush) {
					sock->to_access[current_buf] = 1;
					sock->write_pos[current_buf] = received;
					current_buf = (current_buf + 1) & 1; // equivalent to %2

					// Wait until the buffer has been sent
					while (sock->to_access[current_buf]) {
						pthread_spin_unlock(&(sock->lock));
						struct timespec ts = {.tv_sec = 0, .tv_nsec = 100};
						nanosleep(&ts, 0);
						pthread_spin_lock(&(sock->lock));
					}

					pthread_spin_unlock(&(sock->lock));

					sock->write_pos[current_buf] = 0;
					received = 0;
					myLoad = 0;

				} else {
					pthread_spin_unlock(&(sock->lock));
					myLoad++;

					if (myLoad > WH_COMMON_LIMITW8_RECV && received > 0) {
						sock->flush = 2;
					}
				}
			} while (!sock->flush);

			myLoad = 0;

			if (sock->flush) {
				sock->flush--;
			}
		}
	}


	int init_asyncSocket(AsyncSocket *sock, size_t buf_len, async_fun_p async_fun)
	{
		sock->buf_len = buf_len;

		sock->read_pos[0] = 0;
		sock->read_pos[1] = 0;

		sock->write_pos[0] = 0;
		sock->write_pos[1] = 0;

		sock->to_access[0] = 0;
		sock->to_access[1] = 0;

		sock->can_read = 0;

		sock->flush = 0;
		sock->finish = 0;
		sock->closed = 0;
		sock->inTransaction = 0;

		sock->buff[0] = (uint8_t *)malloc(sizeof(uint8_t) * buf_len);

		if (!sock->buff[0]) {
			return 1;
		}

		sock->buff[1] = (uint8_t *)malloc(sizeof(uint8_t) * buf_len);

		if (!sock->buff[1]) {
			free(sock->buff[0]);
			return 1;
		}

		sock->current_send_buf = 0;
		sock->current_recv_buf = 0;

		if (pthread_spin_init(&(sock->lock), 0) != 0) {
			free(sock->buff[0]);
			free(sock->buff[1]);
			return 1;
		}

		pthread_create(&(sock->thread), 0, async_fun, sock);

		return 0;
	}

	void flush_recv(AsyncSocket *sock)
	{
		pthread_spin_lock(&(sock->lock));
		sock->flush = 1;
		pthread_spin_unlock(&(sock->lock));
	}

	void destroy_asyncSocket(AsyncSocket *sock)
	{
		if (sock->socket_type == SEND_SOCKET) {
			flush_send_sync(sock, 1);
			flush_send_sync(sock, 1);

		} else {
			flush_recv(sock);
		}

		pthread_spin_lock(&(sock->lock));
		sock->finish = 1;
		pthread_spin_unlock(&(sock->lock));
		pthread_join(sock->thread, 0);
		pthread_spin_destroy(&(sock->lock));
		free(sock->buff[0]);
		free(sock->buff[1]);
		tcp_sclose(sock->ssock);
	}

	int tcp_connect_to_async(char *ip, uint16_t port, AsyncSocket *sock, enum syncSocketType mode, SSL_CTX *sslConfig)
	{
		size_t buf_len = OPTIMAL_BUFFER_SIZE;
		int sockfd = tcp_connect_to(ip, port);
		sock->ssock = tcp_upgrade2syncSocket(sockfd, mode, sslConfig);

		if (sock->ssock == NULL) {
			return 1;
		}

		if (init_asyncSocket(sock, buf_len, send_fun) != 0) {
			tcp_sclose(sock->ssock);
			return 1;
		}

		sock->socket_type = SEND_SOCKET;

		return 0;
	}

	int tcp_accept_async(int listen_socket, AsyncSocket *sock, struct timeval *timeout, enum syncSocketType mode, SSL_CTX *sslConfig)
	{
		size_t buf_len = OPTIMAL_BUFFER_SIZE;
		int sockfd = tcp_accept(listen_socket, timeout);
		sock->ssock = tcp_upgrade2syncSocket(sockfd, mode, sslConfig);

		if (sock->ssock == NULL) {
			return 1;
		}

		if (init_asyncSocket(sock, buf_len, recv_fun) != 0) {
			tcp_sclose(sock->ssock);
			return 1;
		}

		sock->socket_type = RECV_SOCKET;
		return 0;
	}

	void tcp_async_startTransaction(AsyncSocket *sock)
	{
		sock->inTransaction = 1;
	}

	void tcp_async_stopTransaction(AsyncSocket *sock)
	{
		sock->inTransaction = 0;
	}

	int socket_upgrade_to_async_send(AsyncSocket *async_sock, int sockfd)
	{
		size_t buf_len = OPTIMAL_BUFFER_SIZE;
		async_sock->ssock = tcp_upgrade2syncSocket(sockfd, NOSSL, NULL);

		if (init_asyncSocket(async_sock, buf_len, send_fun) != 0) {
			return 1;
		}

		async_sock->socket_type = SEND_SOCKET;
		return 0;
	}

	int socket_upgrade_to_async_recv(AsyncSocket *async_sock, int sockfd)
	{
		size_t buf_len = OPTIMAL_BUFFER_SIZE;
		async_sock->ssock = tcp_upgrade2syncSocket(sockfd, NOSSL, NULL);

		if (init_asyncSocket(async_sock, buf_len, recv_fun) != 0) {
			return 1;
		}

		async_sock->socket_type = RECV_SOCKET;
		return 0;
	}


	int socket_sync_to_async_send(AsyncSocket *async_sock, SyncSocket *ssock)
	{
		size_t buf_len = OPTIMAL_BUFFER_SIZE;
		async_sock->ssock = ssock;

		if (init_asyncSocket(async_sock, buf_len, send_fun) != 0) {
			return 1;
		}

		async_sock->socket_type = SEND_SOCKET;
		return 0;
	}

	int socket_sync_to_async_recv(AsyncSocket *async_sock, SyncSocket *ssock)
	{
		size_t buf_len = OPTIMAL_BUFFER_SIZE;
		async_sock->ssock = ssock;

		if (init_asyncSocket(async_sock, buf_len, recv_fun) != 0) {
			return 1;
		}

		async_sock->socket_type = RECV_SOCKET;
		return 0;
	}

	/** asyncSocketStartSSL
	 * Changes the syncsocketMode in order to start a SSL session.
	 * IMPORTANT NOTE: All data must be flushed before call this function, or data-loss can happen.
	 * @return 0 if ssl has successfully started or 1 if not.
	 * //TODO: this function is pretty Buggy, since there are a data race.
	 */
	int asyncSocketStartSSL(AsyncSocket *socket, enum syncSocketType mode, SSL_CTX *sslConfig)
	{
		int ret;

		struct timeval lasttimeout = {.tv_sec = 0, .tv_usec = 10};
		struct timeval timeout = {.tv_sec = 0, .tv_usec = 10};
		struct timeval ssltimeout = {.tv_sec = 3, .tv_usec = 0};

		pthread_spin_lock(&(socket->lock));
		socket->finish = 1;

		if (getsockopt(socket->ssock->sockfd, SOL_SOCKET, SO_RCVTIMEO, (char *)&lasttimeout,
					   NULL) < 0) {
			lasttimeout = timeout;
			lasttimeout.tv_usec = 250000;
		}

		if (setsockopt(socket->ssock->sockfd, SOL_SOCKET, SO_RCVTIMEO, (char *)&timeout,
					   sizeof(struct timeval)) < 0) {
			fputs("setsockopt failed\n", stderr);
		}

		if (setsockopt(socket->ssock->sockfd, SOL_SOCKET, SO_SNDTIMEO, (char *)&timeout,
					   sizeof(struct timeval)) < 0) {
			fputs("setsockopt failed\n", stderr);
		}

		pthread_spin_unlock(&(socket->lock));
		pthread_join(socket->thread, NULL);

		if (setsockopt(socket->ssock->sockfd, SOL_SOCKET, SO_RCVTIMEO, (char *)&ssltimeout,
					   sizeof(struct timeval)) < 0) {
			fputs("setsockopt failed\n", stderr);
		}

		if (setsockopt(socket->ssock->sockfd, SOL_SOCKET, SO_SNDTIMEO, (char *)&ssltimeout,
					   sizeof(struct timeval)) < 0) {
			fputs("setsockopt failed\n", stderr);
		}

		ret = syncSocketStartSSL(socket->ssock, mode, sslConfig);

		socket->finish = 0;
		socket->closed = 0;

		socket->to_access[0] = 0;
		socket->to_access[1] = 0;

		if (setsockopt(socket->ssock->sockfd, SOL_SOCKET, SO_RCVTIMEO, (char *)&lasttimeout,
					   sizeof(struct timeval)) < 0) {
			fputs("setsockopt failed\n", stderr);
		}

		if (setsockopt(socket->ssock->sockfd, SOL_SOCKET, SO_SNDTIMEO, (char *)&lasttimeout,
					   sizeof(struct timeval)) < 0) {
			fputs("setsockopt failed\n", stderr);
		}

		if (socket->socket_type == RECV_SOCKET) {
			pthread_create(&(socket->thread), 0, recv_fun, socket);

		} else {
			pthread_create(&(socket->thread), 0, send_fun, socket);
		}

		return ret;
	}

#endif

#ifdef __cplusplus
}
#endif
