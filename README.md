# KubernetesOnPremise

# Bash Script README

This bash script provides a set of variables and functions for managing a Kubernetes cluster. It includes configurations for text colors, background colors, font styles, and various versions of Kubernetes and container runtimes.


## Prerequisites
Before running the script, ensure that the following prerequisites are met:

- The script is being executed on an Ubuntu-based system like `18.04` , `20.04` , `22.04`

- The user has sudo privileges.

- Internet connectivity is available to download dependencies and Kubernetes assets.

## Usage

To use this script, follow the steps below:

1. Open a terminal and running the following command:


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

## Features


<ol>
  <li>Installation of Kubernetes prerequisites</li>
  <li>Configuration of container runtimes</li>
  <li>Deployment of essential Kubernetes assets like flannel, dashboard, metallb, metrics_server</li>
  <li>Dynamic input for Master IP, Master Host, Workers IP, Workers Host, and Pod's Network ID/Subnet</li>
</ol>

The script prompts for input to configure a Kubernetes cluster. It asks for the `master IP address`, `master host name`, `workers' IP addresses`, `workers' host names`, and the `pod's network ID or subnet`. These values are used to set up the cluster and deploy Kubernetes resources.

## Functions

The script includes several functions:

- `pod-wait-status`: This function waits for a pod to reach the "Running" status and performs some actions. It takes a partial namespace and pod name as input.

- `Install-kubernetes-prerequisite`: This function installs the prerequisite packages for Kubernetes. It uses the version specified in the script's `Versions` array.

- `Install-Cri-o-prerequisite`: This function installs the prerequisite packages for the CRI-O container runtime. It configures the appropriate package sources based on the operating system version.

## Script Variables
The script defines several variables that control its behavior. Here are some important variables:
<ol>
  <li>Text Color Variables: Variables defining ANSI color codes for text.</li>
  <li>Background Color Variables: Variables defining ANSI color codes for background colors.</li>
  <li>Font Style Variables: Variables defining ANSI codes for font styles.</li>
  <li>Configuration File Paths: Variables specifying the paths of various configuration files used by the script.</li>
   <li>Dynamic Variables: Variables derived from user input or system information, such as OS version, container runtime version, etc.</li>
   <li>Kubernetes Assets: Variables storing the URLs of essential Kubernetes assets (flannel, dashboard, metallb, metrics_server).</li>
</ol>


## Contributing
Contributions to the script are welcome. If you find any issues or have suggestions for improvement, please create an issue or submit a pull request.

## Contact
For any inquiries or questions, please contact [Me](https://abdelrhman.khamis.work/)

Feel free to modify this template to suit your specific requirements.


## License

This script is licensed under the [MIT License](LICENSE).
