# ec2-instance-creation-by-terraform
*This repository contains terraform files to create an EC2 instance with a provisioner which hosts a website.*

1. Install Terraform on your machine using the documentation.
2. Clone this repository using the command
   
   ```
   git clone https://github.com/psp-4/ec2-instance-creation-by-terraform.git
   ```
3. Change the value of MYIP variable in ```vars.tf``` file according to your machine's public IP(ipv4).
4. Login into your AWS account.
5. There go to IAM and create a new user named ```terraform-admin```. Attach ***Administrator Access*** policy. Create Access Keys for this user.
6. Go to your machine and install ```awscli```.
7. After installing ```awscli``` authorize your device access to your AWS account using the Access keys generated. Use the following command.
   ```
   aws configure
   ```
   There enter the **Access Key ID**, **Secret Access Key**, set the default region as ```us-east-1``` and the output format as ```json```.

   ***(Setting the default region to ```us-east-1``` is mandatory since the AMI IDs are mentioned in the Terraform files that belong to ```us-east-1```)***
8. Now create a S3 bucket with a unique name and change the ```bucket``` value in the ```backend.tf``` to that name.
9. Now in the terminal of your machine use the following command to initialize Terraform.
    ```
     terraform init
    ```
11. After that use the following command to check for any syntax error in any Terraform files.
    ```
     terraform validate
    ```
12. After that use the following command to format the Terraform files.
    ```
     terraform fmt
    ```
13. After that use the following command to see the changes that would be made to your AWS account after you execute the script.
    ```
     terraform plan
    ```
    *(```terraform plan``` is always recommended as it gives an idea about which resources would be created, modified or destroyed)*
13. Finally apply the changes using the command
    ```
     terraform apply
    ```
14. Verify the deployment by going into the public IP displayed in the terminal at last.
15. After verification destroy all the resources using the command

    ```
    terraform destroy
    ```
    *(It is always recommended to use ```terraform destroy``` rather than manually deleting resources which might become a tedious job for complex architectures.)*
