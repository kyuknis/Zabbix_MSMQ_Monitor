################################################################################
# get_queues.ps1
#
################################################################################

$queues = Get-MsmqQueue
$index = 1

Write-Host "{"
Write-Host " `"data`":[`n"
ForEach($q in $queues) {

  $preparedQueueName = $q.QueueName -replace "^[A-Za-z0-9\$]+\\", ""

    if ($index -lt $queues.count)
    {
        $line= "{ `"{#QUEUE}`" : `"" + $preparedQueueName + "`" },"
        write-host $line
    }
    elseif ($index -ge $queues.count)
    {
        $line= "{ `"{#QUEUE}`" : `"" + $preparedQueueName + "`" }"
        write-host $line
    }

    $index++;

}
Write-Host
Write-Host " ]"
Write-Host "}"
