variable "region" {
    description= "The region our instance will be in (i.e. us-east-1)"
    type= string
     default= "us-east-1"
}

variable "name" {
    description= "The name of the instance we are creating"
    type= string
    default= "hello"
}

variable "group" {
    description= "the name of the group we will be using for Ansible purposes"
    type= string
    default= "web"
}
