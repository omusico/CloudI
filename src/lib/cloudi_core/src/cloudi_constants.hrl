%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Safe to tune without causing major internal problems
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% recv_async null UUID strategy
-define(RECV_ASYNC_STRATEGY, recv_async_select_oldest).
%-define(RECV_ASYNC_STRATEGY, recv_async_select_random). % fastest

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reasonable constants that are unlikely to need modification.
% Possibly, in different environments, tuning may be beneficial, though
% it has not yet been necessary to modify these settings during testing.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% interval at which asynchronous messages are checked
-define(RECV_ASYNC_INTERVAL, 500). % milliseconds

% interval at which asynchronous messages are sent
-define(SEND_ASYNC_INTERVAL, 500). % milliseconds

% interval at which synchronous messages are sent
-define(SEND_SYNC_INTERVAL, 500). % milliseconds

% interval at which multicast asynchronous messages are sent
-define(MCAST_ASYNC_INTERVAL, 500). % milliseconds

% interval at which synchronous forwarded messages are sent
-define(FORWARD_SYNC_INTERVAL, 500). % milliseconds

% interval at which asynchronous forwarded messages are sent
-define(FORWARD_ASYNC_INTERVAL, 500). % milliseconds

% decrement the timeout of each successful forward, to prevent infinite messages
% (i.e., this is the timeout penalty a request takes when forwarding a request)
-define(FORWARD_DELTA, 100). % milliseconds

% blocking operations must decrement the timeout to make sure timeouts
% have time to unravel all synchronous calls
-define(TIMEOUT_DELTA, 100). % milliseconds

% maximum wait time before a reconnect is attempted with a node
-define(NODE_RECONNECT, 60000). % milliseconds

% time to wait before the first reconnect is attempted with a node
-define(NODE_RECONNECT_START, 300000). % milliseconds

% maximum average time inbetween CloudI logger calls during 10 seconds
% to trigger logger flooding prevention, so that logging messages are discarded
% since they are coming from source code that is misbehaving that has already
% logged enough
-define(LOGGER_FLOODING_DELTA, 10). % microseconds

% periodic connection checks to determine if the udp connection is still active
% must be a short time since this impacts MaxR and MaxT.  However, this time
% becomes a hard maximum (minus a delta for overhead) for a task time target
% used in a service (i.e., the maximum amount of time spent not responding
% to incoming API calls).
-define(KEEPALIVE_UDP, 5000). % milliseconds

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constants that should never be changed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pqueue4 usage limited by the signed byte integer storage
-define(PRIORITY_HIGH, -128).
-define(PRIORITY_LOW, 127).

