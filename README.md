# KubernetesOnPremise

### This bash script is fully automated provides a set of variables and functions for install a Kubernetes cluster On Premise like `bare-metal` or `virtual machine`. It includes install many versions of Kubernetes cluster and configura it and various versions of container runtimes. and setup essential Kubernetes assets like flannel, dashboard, metallb, metrics_server 


## Prerequisites
Before running the script, ensure that the following prerequisites are met:

- The script is being executed on an Ubuntu-based system like `18.04` , `20.04` , `22.04`

- The user has sudo privileges.

- Internet connectivity is available to download dependencies and Kubernetes assets.

## Usage

#### To use this script, follow the steps below:

##### Open a terminal and running the following command:


### Clone the repository:

```bash
git clone https://github.com/abdelrhman-kh/KubernetesOnPremise.git
```

### Change to the repository directory:

```bash
cd KubernetesOnPremise
```
### Make the script executable:
```bash
chmod +x Kubernetes.sh
```
### Run the script:
```bash
./Kubernetes.sh
```
### Follow the prompts and experience the time-saving magic!
```bash
Enter Master IP: 192.168.1.50
Your Master IP is 192.168.1.50 
Enter Master Host Name: master.kube.test
Your Master Host is master.kube.test 
Enter Workers IP: 192.168.1.51
Your Worker IP is 192.168.1.51 
Enter Workers Host Name: worker.kube.test
Your Worker Host is worker.kube.test 
Enter Pod's Network ID / Subnet: 10.244.0.0/16
Your Pod's Network ID / Subnet is 10.244.0.0/16 
[sudo] password for master: 
Choose Node do you want to install Kubernetes on it 
1) Master
2) Workers
#? 1
Choose Kubernetes Version do you want to install 
1) 1.21.5-00
2) 1.24.13-00
3) 1.25.9-00
4) 1.26.4-00
5) latest
#? 5
Choose Container Runtime do you want to install 
1) CRI-O
2) Containerd
#? 2

```
![Screenshot from 2023-05-24 15-46-54.png](/Screenshot from 2023-05-24 15-46-54.png)

## Contributing
Contributions to the script are welcome. If you find any issues or have suggestions for improvement, please create an issue or submit a pull request.

## Contact
For any inquiries or questions, please contact [Me](https://abdelrhman.khamis.work/)

Feel free to modify this template to suit your specific requirements.


## License

This script is licensed under the [MIT License](LICENSE).
