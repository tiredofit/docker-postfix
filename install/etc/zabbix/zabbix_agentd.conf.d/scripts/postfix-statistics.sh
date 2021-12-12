#!/usr/bin/with-contenv bash

source /assets/defaults/03-monitoring
source /assets/defaults/09-rsyslog
source /assets/defaults/10-postfix

log_offset="${LOG_PATH}/.zabbix-postfix-offset.dat"
log_tmp="$(mktemp)"

logtail -l "${LOG_PATH}"/"${LOG_FILE}" -o ${log_offset} | pflogsumm -h 0 -u 0 --smtpd-stats --bounce-detail=0 --deferral-detail=0 --reject-detail=0 --no-no-msg-size --smtpd-warning-detail=0 > ${log_tmp}

echo "$(TZ=${TIMEZONE} date +'%Y-%m-%d %H:%M:%S %Z')                 Postfix Statistics"
echo "Queue=$(mailq | grep -v "Mail queue is empty" | grep -c '^[0-9A-F]{10}]')"                                    # postfix.queue
echo "Queue Active=$(postqueue -p | grep -Ec "^[0-9A-F]{10}[*]")"                                                   # postfix.queue_active
echo "Queue Deferred=$(postqueue -p | grep -Ec "^[0-9A-F]{10}[^*]")"                                                # postfix.queue_deferred
echo "Queue Incoming=$(find ${DATA_LOCATION}/incoming -type f | wc -l)"                                             # postfix.queue_incoming
echo "Queue Maildrop=$(find ${DATA_LOCATION}/maildrop -type f | wc -l)"                                             # postfix.queue_maildrop
echo "Stats Bytes Delivered=$(grep -m 1 "bytes delivered" ${log_tmp} | awk '{print $1}' | tr -cd [0-9_])"           # postfix.bytes_delivered
echo "Stats Bytes Received=$(grep -m 1 "bytes received" ${log_tmp} | awk '{print $1}' | tr -cd [0-9_])"             # postfix.bytes_received
echo "Stats Reject Warnings=$(grep -m 1 "reject warnings" ${log_tmp} | awk '{print $1}')"                           # postfix.reject_warnings
echo "Stats Bounced=$(grep -m 1 "bounced" ${log_tmp} | awk '{print $1}')"                                           # postfix.bounced
echo "Stats Connections=$(grep -m 1 "connections" ${log_tmp} | awk '{print $1}')"                                   # postfix.connections
echo "Stats Deferred=$(grep -m 1 "deferred" ${log_tmp} | awk '{print $1}')"                                         # postfix.deferred
echo "Stats Delivered=$(grep -m 1 "delivered" ${log_tmp} | awk '{print $1}')"                                       # postfix.delivered
echo "Stats Discarded=$(grep -m 1 "discarded" ${log_tmp} | awk '{print $1}')"                                       # postfix,discarded
echo "Stats Forwarded=$(grep -m 1 "forwarded" ${log_tmp} | awk '{print $1}')"                                       # postfix.forwarded
echo "Stats Held=$(grep -m 1 "held" ${log_tmp} | awk '{print $1}')"                                                 # postfix.held
echo "Stats Received=$(grep -m 1 "received" ${log_tmp} | awk '{print $1}')"                                         # postfix.received
echo "Stats Recipients=$(grep -m 1 "recipients" ${log_tmp} | awk '{print $1}')"                                     # postfix.recipients
echo "Stats Rejected=$(grep -m 1 "rejected" ${log_tmp} | awk '{print $1}')"                                         # postfix.rejected
echo "Stats Senders=$(grep -m 1 "senders" ${log_tmp} | awk '{print $1}')"                                           # postfix.senders

rm -f "${log_tmp}"