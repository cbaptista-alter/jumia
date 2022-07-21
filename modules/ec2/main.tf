
provider "aws" {
region = "eu-central-1"
}

resource "aws_instance" "ins1_ec2" {
    ami           = "ami-065deacbcaac64cf2"
    instance_type = "t2.micro"
    //id of the public subnet so that the instance is accessible via internet to do SSH
    subnet_id = "subnet-02e76b60429cdc87a"

    //id of the security group which has ports open to all the IPs
    vpc_security_group_ids=["sg-0178673a97b48b30a"]

    //assigning public IP to the instance is required.
    associate_public_ip_address=true
    key_name = "jumia-apps"

    provisioner "remote-exec" {
        inline = [
            //Executing command to creating a file on the instance
            "sudo sed -i 's/22/1337/g' /etc/ssh/sshd_config",
            "sudo service ssh restart",
            "curl -fsSL https://get.docker.com/ | bash"
        ]

        //Connection to be used by provisioner to perform remote executions
        connection {
            //Use public IP of the instance to connect to it.
            host          = "${aws_instance.ins1_ec2.public_ip}"
            type          = "ssh"
            user          = "ubuntu"
            private_key   = "${file("jumia-apps.pem")}"
            timeout       = "1m"
            agent         = false
        }
    }


    provisioner "file" {


        connection {
            //Use public IP of the instance to connect to it.
            host          = "${aws_instance.ins1_ec2.public_ip}"
            type          = "ssh"
            user          = "ubuntu"
            private_key   = "${file("jumia-apps.pem")}"
            timeout       = "1m"
            agent         = false
        }

        source = "jumia_phone_validator.zip"
        destination = "/tmp/jumia_phone_validator.zip"


    }

        provisioner "remote-exec" {
        inline = [
            //Executing command unzip and deploy the compose file
            "cd /tmp && sudo apt install zip -y",
            "unzip jumia_phone_validator.zip",
            "cd jumia_phone_validator/ && sudo docker compose up -d"
        ]
        connection {
            //Use public IP of the instance to connect to it.
            host          = "${aws_instance.ins1_ec2.public_ip}"
            type          = "ssh"
            user          = "ubuntu"
            private_key   = "${file("jumia-apps.pem")}"
            timeout       = "1m"
            agent         = false
        }

}
}

resource "aws_eip" "ins1_eip" {
    instance = "${aws_instance.ins1_ec2.id}"
    vpc      = true
}