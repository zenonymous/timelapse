#!/usr/bin/perl
@timeStampTmp=localtime();
$timeStampFinal=sprintf("%04d-%02d-%02d", $timeStampTmp[5]+1900,$timeStampTmp[4]+1,$timeStampTmp[3]);
chomp $timeStampFinal;
print "$timeStampFinal\n";

$command = "tar --remove-files -pczf timelapse/$timeStampFinal.tar.gz camera/*.jpg";

system($command);

$command = "ncftpput -DD -u username_goes_here -p password_goes_here hostname_goes_here /home/timelapse/backups timelapse/$timeStampFinal.tar.gz";

system($command); 

$command = "lftp -e 'chmod 777 /home/timelapse/backups/$timeStampFinal.tar.gz' -u timelapse,password_goes_here hostname_goes_here";

system($command);

