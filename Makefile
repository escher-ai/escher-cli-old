# ec2
list:
	aws ec2 describe-instances --instance-ids --query 'Reservations[*].Instances[*].[InstanceId,PublicIpAddress]'
log:
	# this log is *only* updated 1. after bootup 2. before termination 3. after reboot. So it is pretty much useless.
	aws ec2 get-console-output --instance-id i-012cf4868339e88d7
launch:
	 aws ec2 run-instances --image-id ami-6057e21a --count 1 --instance-type t2.micro --key-name escherpad --security-group-ids sg-c689f2a3 --subnet-id subnet-78d3d250
destroy:
	aws ec2 terminate-instances --instance-id i-012cf4868339e88d7

# buckets
list-buckets:
	aws s3 ls
create-bucket:
	aws s3 mb s3://ge-project-bucket >> make.log
	tail -f make.log
destory-bucket:
	aws s3 rb s3://ge-project-bucket --force
sync-source:
	aws s3 sync ./ s3://ge-project-bucket/experiment/source
sync-data:
	aws s3 sync ./ s3://ge-project-bucket/experiment/output
ssh:
	ssh ec2-user@54.173.116.71 -i ~/.ec2/escherpad.pem
