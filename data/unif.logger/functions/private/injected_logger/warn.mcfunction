data remove storage unif.logger:cache Logger.Cache

# Message, 放在这而不是 message_process 中为了防止过度转义
$data modify storage unif.logger:cache Logger.Cache.Message set value '$(msg)'

# 数据处理
function unif.logger:private/cache/remove_outdated
$function unif.logger:private/cache/injected_message_process {"namespace":"$(namespace)","level":"WARN","levelColor":"gold"}

# 写入游戏 Logs 内
data modify storage unif.logger:logs Logs append from storage unif.logger:cache Logger.Cache
data modify storage unif.logger:warn_logs Logs append from storage unif.logger:cache Logger.Cache

# 打印
execute as @a[tag=unif.debug] if score $level unif.logger matches ..3 run function unif.logger:private/injected_logger/_injected_printer with storage unif.logger:warn_logs Logs[-1]