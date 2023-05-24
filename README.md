# KubernetesOnPremise

# Bash Script README

This bash script provides a set of variables and functions for managing a Kubernetes cluster. It includes configurations for text colors, background colors, font styles, and various versions of Kubernetes and container runtimes.

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

### Text Colors

The script defines variables for different text colors, such as red, green, yellow, blue, magenta, and cyan. These variables can be used to display colored text in the terminal.

### Background Colors

Similarly, the script defines variables for different background colors, including black, white, red, green, yellow, blue, magenta, and cyan. These variables can be used to set the background color of text in the terminal.

### Font Styles

The script provides variables for different font styles, such as bold, underline, blink, reverse, and hidden. These variables can be used to format text with the desired font style.

### Kubernetes Cluster Configuration

The script prompts for input to configure a Kubernetes cluster. It asks for the master IP address, master host name, workers' IP addresses, workers' host names, and the pod's network ID or subnet. These values are used to set up the cluster and deploy Kubernetes resources.

### Functions

The script includes several functions:

- `pod-wait-status`: This function waits for a pod to reach the "Running" status and performs some actions. It takes a partial namespace and pod name as input.

- `Install-kubernetes-prerequisite`: This function installs the prerequisite packages for Kubernetes. It uses the version specified in the script's `Versions` array.

- `Install-Cri-o-prerequisite`: This function installs the prerequisite packages for the CRI-O container runtime. It configures the appropriate package sources based on the operating system version.

## License

This script is licensed under the [MIT License](LICENSE).
