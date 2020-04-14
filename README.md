# VM for profiling 
This packer configuration creates a VM provisioned with tools need for profiling analysis.

- Python and R packages
- cytominer and dependencies
- Distributed-CellProfiler and dependencies
- Docker

In addition, it mounts an S3 bucket and an Amazon Elastic File System (EFS). 

## Install packer

OS X:
```
brew install packer
```

Windows:
- Get it [here](https://www.packer.io/downloads.html)

## Building the VM


### Authenticate

```
aws configure
```

### Edit EFS and S3 configurations

Edit `EFS_ID` in `efs.sh`, and `S3_ROLE` and `BUCKET_ID` appropriately.

### Validate and build

Note that although instance specifics are included in `cytominer_ami.json` (`c4.large`), and an instance will be created, the instance only exists to create the AMI and will be destroyed upon completion, `delete_on_termination: true`, leaving only the newly created AMI.


```
packer validate cytominer_ami.json
```

Specify `security_group_ids`, `subnet_id` and `vpc_id` on which the builder should be run (get these from AWS console)

```
packer build  -var 'security_group_ids=sg-NNNNNNNN,sg-NNNNNNNN' -var 'subnet_id=subnet-NNNNNNNN' -var 'vpc_id=vpc-NNNNNNNN' cytominer_ami.json
```

