#!/usr/bin/perl
$command = "tar xvzf /home/timelapse/backups/*.gz -C /home/timelapse/";
system($command);

$command = "rm /home/timelapse/backups/*.gz";
system($command);

$command = "ls -1tr /home/timelapse/camera/*.jpg | grep -v files.txt > /home/timelapse/camera/files.txt";
system($command);

$command = "mencoder -nosound -noskip -oac copy -ovc copy -o /home/timelapse/camera/output.avi -mf fps=21 'mf://@/home/timelapse/camera/files.txt'";
print "$command\n";
system($command);

$command = "avconv -i /home/timelapse/camera/output.avi -c:v libx264 -preset slow -crf 15 /home/timelapse/camera/output-final.mp4";
system($command);

$command = "rm /home/timelapse/camera/output.avi";
system($command);

$command = "mv /home/timelapse/camera/output-final.mp4 /home/timelapse/public_html/";
system($command);






