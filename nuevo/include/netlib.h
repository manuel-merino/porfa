#ifndef __NETLIB_H__
#define __NETLIB_H__

#include "netlib_config.h"

#ifdef __APPLE__

#define pthread_spinlock_t pthread_mutex_t

#define pthread_spin_init pthread_mutex_init
#define pthread_spin_destroy pthread_mutex_destroy

#define pthread_spin_lock pthread_mutex_lock
#define pthread_spin_unlock pthread_mutex_unlock
#define pthread_spin_trylock pthread_mutex_trylock

#define MSG_NOSIGNAL SO_NOSIGPIPE

#endif

#ifdef WIN32
#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif

#include <winsock2.h>
#include <windows.h>
#include <ws2tcpip.h>
#include <iphlpapi.h>

#ifdef _MSC_VER

#define close closesocket

#endif


#pragma comment(lib, "Ws2_32.lib")

#else

#include <arpa/inet.h>
#include <netdb.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <arpa/inet.h>
#include <dlfcn.h>

#endif

#ifndef _MSC_VER

#include <unistd.h>
#include <sys/time.h>
#include <pthread.h>
#include <strings.h>

#endif

#
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <signal.h>
#include <stdlib.h>
#include <stddef.h>
#include <time.h>
#include <errno.h>

#include <openssl/ssl.h>
#include <openssl/crypto.h>
#include <openssl/err.h>

#ifdef _MSC_VER
#include <basetsd.h>
#define ssize_t SSIZE_T
#endif

#define WH_COMMON_LIMITW8_RECV (1) //(1<<2) //Wait time in cycles if no more data retrived
#define WH_COMMON_LIMITW8_SEND (1<<15) //Wait time in cycles if no more data retrived

#define UNUSED(x) (void)(x)

//#define NL_DEBUG //debug msgs

#ifdef __cplusplus
extern "C" {
#endif

#define likely(x)    __builtin_expect (!!(x), 1)
#define unlikely(x)  __builtin_expect (!!(x), 0)

#define OPTIMAL_BUFFER_SIZE (512*1024)

	enum syncSocketType {
		NOSSL, SRVSSL, CLISSL
	};

#ifndef _MSC_VER

	enum asyncSocketType {
		SEND_SOCKET, RECV_SOCKET
	};

#endif

	typedef struct {
		int sockfd;
		SSL *tls;
		//struct tls *tlsIO;
		SSL_CTX *config;
	} SyncSocket;

#ifndef _MSC_VER

	typedef struct {
		SyncSocket *ssock;
		size_t buf_len;
		size_t read_pos[2];
		size_t write_pos[2];
		int_fast8_t to_access[2];
		uint8_t *buff[2];
		size_t current_send_buf;
		size_t current_recv_buf;

		enum asyncSocketType socket_type;
		int_fast8_t can_read;
		int_fast8_t finish;
		int_fast8_t flush;
		int_fast8_t closed;
		int_fast8_t inTransaction;
		pthread_spinlock_t lock;
		pthread_t thread;
	} AsyncSocket;

#endif

	/** tcp_connect_to
	 * Connects to a host using TCP over IPv4/v6
	 * @return -1 if ERROR, else the socket file descriptor.
	 */
	int tcp_connect_to(const char *ip, uint16_t port);

	/** tcp_listen_on_port
	 * Starts listening in a socket using TCP over IPv4/v6
	 * @return -1 if ERROR, else the socket file descriptor.
	 */
	int tcp_listen_on_port(uint16_t port);

	/** tcp_accept
	 * Accepts a new connection from a listen socket
	 * @return -1 if ERROR, else the socket file descriptor.
	 */
	int tcp_accept(int listen_socket, struct timeval *timeout);

	/** tcp_accept
	 * Accepts a new connection from a listen socket
	 * @return -1 if ERROR, else the socket file descriptor.
	 */
	int tcp_acceptext(int listen_socket, struct timeval *timeout, struct sockaddr_storage *st);

	/** tcp_message_send
	 * Sends a full message to a socket
	 * @return 0 if OK, something else if error.
	 * ERROR CODES:
	 * -1 if socket is closed.
	 */
	int tcp_message_send(int socket, const void *message, size_t len);

	/** tcp_message_recv
	 * Receives a full message from a socket
	 * @return number of bytes read.
	 * ERROR CODES:
	 * -1 if socket is closed.
	 */
	ssize_t tcp_message_recv(int socket, void *message, size_t len, uint8_t sync);

	/** tcp_setKeepAlive
	 * Sets the keepalive params
	 * @param socket The shocket itself
	 * @param cnt The maximum number of keepalive probes TCP should send before dropping the connection.
	 * @param idl The time (in seconds) the connection needs to remain idle before TCP starts sending keepalive probes.
	 * @param intlv The time (in seconds) between individual keepalive probes.
	 * @return 0 if OK, something else if error.
	 */
	int tcp_setKeepAlive(const int socket, const int cnt, const int idl, const int intvl);

	/** tcp_getKeepAlive
	 * Gets the keepalive params
	 * @param socket The shocket itself
	 * @param cnt The maximum number of keepalive probes TCP should send before dropping the connection.
	 * @param idl The time (in seconds) the connection needs to remain idle before TCP starts sending keepalive probes.
	 * @param intlv The time (in seconds) between individual keepalive probes.
	 * @return 0 if OK, something else if error (like keepAlive is disabled).
	 */
	int tcp_getKeepAlive(const int socket, int *cnt, int *idl, int *intvl);

	/** tcp_upgrade2syncSocket
	 * upgrades a simple socket to SyncSocket
	 * @param socket : the older socket
	 * @param mode : the SSL mode
	 * @param sslConfig : Can be NULL (even with ssl=1). Sets the SSL config. connection.
	 * @return a new SyncSocket
	 */
	SyncSocket *tcp_upgrade2syncSocket(int socket, enum syncSocketType mode, SSL_CTX *sslConfig);

	/** tcp_message_ssend
	 * Sends a full message to a socket
	 * @return 0 if OK, something else if error.
	 * ERROR CODES:
	 * -1 if socket is closed.
	 */
	int tcp_message_ssend(SyncSocket *socket, const void *message, size_t len);

	/** tcp_message_srecv
	 * Receives a full message from a socket
	 * @return number of bytes read.
	 * ERROR CODES:
	 * -1 if socket is closed.
	 */
	ssize_t tcp_message_srecv(SyncSocket *socket, void *message, size_t len, uint8_t sync);

	/** tcp_sclose
	 * Receives a full message from a socket
	 * @return number of bytes read.
	 */
	void tcp_sclose(SyncSocket *socket);

	/** syncSocketStartSSL
	 * Changes the syncsocketMode in order to start a SSL session.
	 * @return 0 if ssl has successfully started or 1 if not.
	 */
	int syncSocketStartSSL(SyncSocket *socket, enum syncSocketType mode, SSL_CTX *sslConfig);

	/** getDefaultSSocketSSLconfig
	 * The param "freeOnError", would stop and free everything on error.
	 * @return the default SSL config
	 */
	SSL_CTX *getDefaultSSocketSSLconfig(enum syncSocketType mode, int freeOnError);

#ifndef _MSC_VER

	/** asyncSocketStartSSL
	 * Changes the syncsocketMode in order to start a SSL session.
	 * IMPORTANT NOTE: All data must be flushed before call this function, or data-loss can happen.
	 * @return 0 if ssl has successfully started or 1 if not.
	 * //TODO: this function is pretty Buggy, since there are a data race.
	 */
	int asyncSocketStartSSL(AsyncSocket *socket, enum syncSocketType mode, SSL_CTX *sslConfig);

	/** tcp_connect_to_async
	 * Connects to a host using TCP over IPv4
	 * @return -1 if ERROR, else the socket file descriptor.
	 */
	int tcp_connect_to_async(char *ip, uint16_t port, AsyncSocket *sock, enum syncSocketType mode, SSL_CTX *sslConfig);

	/** tcp_accept_async
	 * Accepts a new connection from a listen socket
	 * @return -1 if ERROR, else the socket file descriptor.
	 */
	int tcp_accept_async(int listen_socket, AsyncSocket *sock, struct timeval *timeout, enum syncSocketType mode, SSL_CTX *sslConfig);

	/** tcp_async_startTransaction
	 * Starts a transaction
	 * Useful to reduce locks
	 */
	void tcp_async_startTransaction(AsyncSocket *sock);

	/** tcp_async_stopTransaction
	 * Stops a transaction
	 * Useful to reduce locks
	 */
	void tcp_async_stopTransaction(AsyncSocket *sock);


	int socket_upgrade_to_async_send(AsyncSocket *async_sock, int sockfd);
	int socket_upgrade_to_async_recv(AsyncSocket *async_sock, int sockfd);

	int socket_sync_to_async_send(AsyncSocket *async_sock, SyncSocket *ssock);
	int socket_sync_to_async_recv(AsyncSocket *async_sock, SyncSocket *ssock);

	void destroy_asyncSocket(AsyncSocket *sock);

	void flush_recv(AsyncSocket *sock);

#endif

#ifdef __cplusplus
}
#endif
#endif
