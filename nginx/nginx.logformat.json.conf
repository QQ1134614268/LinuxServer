map $upstream_response_time $upstream_response_timer {
    default $upstream_response_time;
    ""        0;
}
log_format json escape=json '{"@timestamp":"$time_iso8601",'
            '"@version":"1",'
            '"server_addr":"$server_addr",'
            '"remote_addr":"$remote_addr",'
            '"host":"$host",'
            '"uri":"$uri",'
            '"body_bytes_sent":$body_bytes_sent,'
            '"bytes_sent":$body_bytes_sent,'
            '"upstream_response_time":$upstream_response_timer,'
            '"request":"$request",'
            '"request_length":$request_length,'
            '"request_time":$request_time,'
            '"status":"$status",'
            '"http_referer":"$http_referer",'
            '"http_x_forwarded_for":"$http_x_forwarded_for",'
            '"http_user_agent":"$http_user_agent"'
            '}';