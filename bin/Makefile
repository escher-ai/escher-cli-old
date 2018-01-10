# ec2
list:
	aws ec2 describe-instances --instance-ids --query 'Reservations[*].Instances[*].[InstanceId,PublicIpAddress]'
get-ip:
	aws ec2 describe-instances --filters Name=instance-id,Values=$(id) --query 'Reservations[*].Instances[*].[PublicIpAddress]'
log:
	# this log is *only* updated 1. after startup 2. before termination 3. after reboot. So it is pretty much useless.
	aws ec2 get-console-output --instance-id $(id)
launch:
	aws ec2 run-instances --image-id $(image) --count 1 --instance-type $(type) --key-name $(key) --security-group-ids $(security-group) --subnet-id $(subnet)
destroy:
	aws ec2 terminate-instances --instance-id $(id)

# buckets
list-buckets:
	aws s3 ls
create-bucket:
	aws s3 mb $(bucket) >> make.log
	tail -f make.log
destroy-bucket:
	aws s3 rb $(bucket) --force
sync-source:
	# optimization is to gzip and then upload. Makes a difference.
	aws s3 sync ./ $(bucket)/source
sync-data:
	aws s3 sync ./ $(bucket)/data
ssh:
	ssh $(user)@$(ip) -i $(key)
