function unif.logger:private/logger/printer with storage unif.logger:cache Logs[0]

data remove storage unif.logger:cache Logs[0]

execute store result score $logs unif.10000 run data get storage unif.logger:cache Logs

execute if score $logs unif.10000 matches 1.. run function unif.logger:private/logger/reader