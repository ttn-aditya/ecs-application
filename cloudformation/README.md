## Cloudformation ECS application
This Cloudformattion code handles all the initial steps to configure and setup running environment with bluegreen deployment as well as Disaster Recovery in case the application deployment fails.

## Usage
Start with the following steps for ECS Bluegreen application
Since I have used AWS ecs sample app you need to fork that repo.
STEP 1
```
cd cloudformation
bin/deploy
```
Put in all the required inputs.

## DR 
Simply copy and paste the infra-setup.yaml in the Cloudformation designer and then add a task definition to the resources created
NOTE:- DR plan is the miniature version of the actual CF code

## Diretory Structure
```
.
├── README-cf.md
└── cloudformation
    ├── bin
    │   └── deploy
    ├── deploy
    │   ├── scripts.zip
    │   └── templates.zip
    ├── ecs-blue-green-deployment.yaml
    ├── infra-setup.yaml
    ├── scripts
    │   ├── blue_green_flip.py        
    │   └── deployer.py
    └── templates
        ├── deployment-pipeline.yaml  
        ├── ecs-cluster.yaml
        ├── load-balancer.yaml        
        ├── service.yaml
        └── vpc.yaml
```
# .\ecs-blue-green-deployment
# Description
This template illustrates reference architecture for Blue/Green Deployment on ECS.


## Parameters
The list of parameters for this template:

### GitHubUser 
Type: String  
Description: Your username on GitHub. 
### GitHubRepo 
Type: String 
Default: ecs-demo-php-simple-app 
Description: The repo name of the sample service. 
### GitHubBranch 
Type: String 
Default: master 
Description: The branch of the repo to continuously deploy. 
### GitHubToken 
Type: String  
Description: Token for the user specified above.
 
### TemplateBucket 
Type: String  
Description: S3 Bucket used for nested templates
 

## Resources
The list of resources this template creates:

### DeploymentPipeline 
Type: AWS::CloudFormation::Stack  
### VPC 
Type: AWS::CloudFormation::Stack  

## Outputs
The list of outputs this template exposes:

### PipelineUrl 
Description: The continuous deployment pipeline in the AWS Management Console.  


========================================================================================================================
# .\infra-setup
# Description
AWS CloudFormation template to create a new VPC or use an existing VPC for ECS deployment

## Parameters
The list of parameters for this template:

### VPCCIDR 
Type: String 
Default: 10.1.0.0/16 
Description: CIDR Block for VPC 
### PublicSubnet1Param 
Type: String 
Default: 10.1.11.0/24 
Description: Public Subnet 1 
### PublicSubnet2Param 
Type: String 
Default: 10.1.12.0/24 
Description: Public Subnet 2 
### KeyName 
Type: AWS::EC2::KeyPair::KeyName  
Description: Name of an existing EC2 KeyPair to enable SSH access to the ECS instances 
### ECSAMI 
Type: AWS::SSM::Parameter::Value<AWS::EC2::Image::Id> 
Default: /aws/service/ecs/optimized-ami/amazon-linux/recommended/image_id 
Description: AMI ID 
### ECSInstanceType 
Type: String 
Default: t2.medium 
Description: Enter t2.micro, m1.small, or m1.large. Default is t2.micro. 

## Resources
The list of resources this template creates:

### ECSCluster 
Type: AWS::ECS::Cluster  
### MyPrivateDnsNamespace 
Type: AWS::ServiceDiscovery::PrivateDnsNamespace  
### VPC 
Type: AWS::EC2::VPC  
### InternetGateway 
Type: AWS::EC2::InternetGateway  
### AttachGateway 
Type: AWS::EC2::VPCGatewayAttachment  
### PublicSubnet1 
Type: AWS::EC2::Subnet  
### PublicSubnet2 
Type: AWS::EC2::Subnet  
### PublicRouteTable 
Type: AWS::EC2::RouteTable  
### PublicRoute 
Type: AWS::EC2::Route  
### PublicSubnet1RouteTableAssociation 
Type: AWS::EC2::SubnetRouteTableAssociation  
### PublicSubnet2RouteTableAssociation 
Type: AWS::EC2::SubnetRouteTableAssociation  
### MySecurityGroup 
Type: AWS::EC2::SecurityGroup  
### MyAutoScallingGroup 
Type: AWS::AutoScaling::AutoScalingGroup  
### myLoadBalancer 
Type: AWS::ElasticLoadBalancingV2::LoadBalancer  
### FirstEIP 
Type: AWS::EC2::EIP  
### SecondEIP 
Type: AWS::EC2::EIP  
### myListener 
Type: AWS::ElasticLoadBalancingV2::Listener  
### myTargetGroup 
Type: AWS::ElasticLoadBalancingV2::TargetGroup  
### ECSEC2RoleInstanceProfile 
Type: AWS::IAM::InstanceProfile  
### ECSEC2Role 
Type: AWS::IAM::Role  
### EcsInstanceLaunchConfiguration 
Type: AWS::AutoScaling::LaunchConfiguration  
### ecsServiceRole 
Type: AWS::IAM::Role  

## Outputs
The list of outputs this template exposes:
