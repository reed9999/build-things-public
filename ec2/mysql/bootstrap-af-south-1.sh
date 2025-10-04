
aws s3 cp s3://pjr2/preferences/preferences/unix/.vimrc-unix .vimrc
mkdir automation
aws s3 cp "s3://pjr2/cape-town-t3medium/scripts/mysql-build.sh" automation
aws s3 cp "s3://pjr2/cape-town-t3medium/scripts/mysql-prereq.sh" automation

chmod +x automation/*

echo "*** now beginning $(date)"
mkdir output
automation/mysql-prereq.sh | tee output/mysql-prereq-nano-output.txt
automation/mysql-build.sh | tee output/mysql-build-nano-output.txt
