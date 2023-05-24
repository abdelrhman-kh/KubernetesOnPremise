#!/bin/bash

# Variables of Text Color's
export NOCOLOR='\033[0m'    #'0;0' is NoColor's ANSI color code          ${NOCOLOR}
export RED='\033[0;31m'     #'0;31' is Red's ANSI color code                 ${RED}
export GREEN='\033[0;32m'   #'0;32' is Green's ANSI color code             ${GREEN}${BOLD}
export YELLOW='\033[1;33m'  #'1;33' is Yellow's ANSI color code           ${YELLOW}
export BLUE='\033[0;34m'    #'0;34' is Blue's ANSI color code               ${BLUE}
export MAGENTA='\033[0;35m' #'0;35' is Magenta's ANSI color code         ${MAGENTA}
export CYAN='\033[0;36m'    #'0;36' is Cyan's ANSI color code               ${CYAN}

# Variables of Background Color's
export BACKGROUND_BLACK='\033[0;30m'    #'0;30' is Black's ANSI color code             ${BACKGROUND_BLACK}
export BACKGROUND_WHITE='\033[0;30;47m' #'0;30;47' is White's ANSI color code          ${BACKGROUND_WHITE}
export NOCOLOR='\033[0m'                #'0;0' is NoColor's ANSI color code                     ${NOCOLOR}
export BACKGROUND_RED='\033[0;41m'      #'0;31' is Red's ANSI color code                 ${BACKGROUND_RED}
export BACKGROUND_GREEN='\033[0;42m'    #'0;32' is Green's ANSI color code             ${BACKGROUND_GREEN}
export BACKGROUND_YELLOW='\033[0;43m'   #'1;33' is Yellow's ANSI color code           ${BACKGROUND_YELLOW}
export BACKGROUND_BLUE='\033[0;44m'     #'0;34' is Blue's ANSI color code               ${BACKGROUND_BLUE}
export BACKGROUND_MAGENTA='\033[0;45m'  #'0;35' is Magenta's ANSI color code         ${BACKGROUND_MAGENTA}
export BACKGROUND_CYAN='\033[0;46m'     #'0;36' is Cyan's ANSI color code               ${BACKGROUND_CYAN}

# Variables of Font Style's
export RESET='\033[0m'      #'0' is Reset's ANSI color code                      ${RESET}
export BOLD='\033[1m'       #'1' is Bold's ANSI color code                        ${BOLD}
export UNDERLINE='\033[4m'  #'4' is Underline's ANSI color code              ${UNDERLINE}
export BLINK='\033[5m'      #'5' is Blink's ANSI color code                      ${BLINK}
export REVERSE='\033[7m'    #'7' is Reverse's ANSI color code                  ${REVERSE}
export HIDDEN='\033[8m'     #'8' is Hidden's ANSI color code                    ${HIDDEN}


# Variables of Array for Different Versions
export Versions=( "1.21.5-00" "1.24.13-00" "1.25.9-00" "1.26.4-00" "latest" )
export Nodes=( "Master" "Workers" )
export Container_Runtimes=( "CRI-O" "Containerd" )

# Variables of Files for Configuration
export Hosts_File=/etc/hosts
export Kube_Admin_Config=/etc/kubernetes/admin.conf
export Kube_Config_non_root=$HOME/.kube/config
export Sysctl_Parameters=/etc/sysctl.d/kubernetes.conf
export fstab=/etc/fstab
export containerd_daemon=/etc/containerd/config.toml
export bashrc=~/.bashrc

# Define dynamic variables
partial_namespace=""
partial_pod_name=""


# Get OS Version Number
export VERSION_ID=`grep -E '^(VERSION_ID)=' /etc/os-release`
export IFS='=' # setting space as delimiter
read -ra VERSION <<<"${VERSION_ID}"
export VERSION_No=${VERSION[1]:1:-1}
    if [ ${VERSION_No} = 22.04 ];
        then
            export OS_VERSION=xUbuntu_20.04
        else
            export OS_VERSION=xUbuntu_${VERSION_No}
    fi
export OS_VERSION=xUbuntu_${VERSION_No}

# Set Container Runtime Interface Version
export CRIO_VERSION=1.23

# Paths for Container Runtime Interface
export CRI_O_sock=unix:///var/run/crio/crio.sock
export Containerd_sock=unix:///run/containerd/containerd.sock

# Variables of Assets for Kubernetes
export flannel=https://github.com/coreos/flannel/raw/master/Documentation/kube-flannel.yml
export dashboard=https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
export metallb=https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml
export metrics_server=https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# Variables of Kubernetes Cluster like IP's and Host Names and etc.
read -p "Enter Master IP: " Master_IP
    if [ -z ${Master_IP} ]
        then
            echo -e "${BLUE}${BOLD}Your Master IP is Empty Please Rewrite it again which is must"
            read -p "Enter Master IP: " Master_IP
            echo -e "${YELLOW}${BOLD}Your Master IP is ${Master_IP} ${NOCOLOR}"
        else
            echo -e "${YELLOW}${BOLD}Your Master IP is ${Master_IP} ${NOCOLOR}"
    fi
read -p "Enter Master Host Name: " Master_Host
    if [ -z ${Master_Host} ]
        then
            echo -e "${BLUE}${BOLD}Your Master Host is Empty. Please Rewrite it again which is must"
            read -p "Enter Master Host Name: " Master_Host
            echo -e "${YELLOW}${BOLD}Your Master Host is ${Master_Host} ${NOCOLOR}"
        else
            echo -e "${YELLOW}${BOLD}Your Master Host is ${Master_Host} ${NOCOLOR}"
    fi
read -p "Enter Workers IP: " Workers_IP
    if [ -z ${Workers_IP} ]
        then     
            echo -e "${YELLOW}${BOLD}Your Worker IP is ${Workers_IP} ${NOCOLOR}"
            echo -e "${YELLOW}${BOLD}Your Worker IP is Empty. Please Rewrite it again"
            read -p "Enter Workers IP Name: " Workers_IP
        else
            echo -e "${YELLOW}${BOLD}Your Worker IP is ${Workers_IP} ${NOCOLOR}"
    fi
read -p "Enter Workers Host Name: " Workers_Host
    if [ -z ${Workers_Host} ]
        then
            echo -e "${YELLOW}${BOLD}Your Worker Host is ${Workers_Host} ${NOCOLOR}"
            echo -e "${YELLOW}${BOLD}Your Worker Host is Empty. Please Rewrite it again"
            read -p "Enter Workers Host Name: " Workers_Host
        else
            echo -e "${YELLOW}${BOLD}Your Worker Host is ${Workers_Host} ${NOCOLOR}"
    fi
read -p "Enter Pod's Network ID / Subnet: " CIDR
    if [ -z ${CIDR} ]
        then
            echo -e "${BLUE}${BOLD}Your Pod's Network ID / Subnet is Empty. Please Rewrite it again which is must ${NOCOLOR}"
            read -p "Enter Pod's Network ID / Subnet: " CIDR
            echo -e "${YELLOW}${BOLD}Your Pod's Network ID / Subnet is ${CIDR} ${NOCOLOR}"
        else
            echo -e "${YELLOW}${BOLD}Your Pod's Network ID / Subnet is ${CIDR} ${NOCOLOR}"
    fi

# function for waiting for pod to reach running status and do some actions
function pod-wait-status() {

    # Retrieve the name space based on the partial match
    namespace=$(kubectl get ns -A -o json | jq -r '.items[] | select(.metadata.name | contains("'"${partial_namespace}"'")) | .metadata.name')
 
    # Get the list of pod names matching the partial name
    pod_names=$(kubectl get pods -n "${namespace}" -o json | jq -r '.items[] | select(.metadata.name | contains("'"${partial_pod_name}"'")) | .metadata.name')

    # Split the pod names into an array
    IFS=$'\n' read -rd '' -a pod_names_array <<<"$pod_names"

    # Iterate over the array and handle multiple pod names
    if [[ ${#pod_names_array[@]} -eq 1 ]]; then
        # Only one pod found, assign it to the variable
        pod_name="${pod_names_array[0]}"
        echo "Pod name: ${pod_name}"
        # Display the parent function name
        echo -e "${BOLD}${YELLOW}we are wait now which is ${FUNCNAME[1]} Step waiting ${pod_name} to reach running status and to do some actions${NOCOLOR}${RESET}"

        # Wait for the pod to reach the "Running" status
        while true; do
            # Check the status of the pod
            status=$(kubectl get pod "${pod_name}" -n "${namespace}" -o jsonpath='{.status.phase}')
            if [[ "${status}" == "Running" ]]; then
                break
            fi
            sleep 5
        done

    elif [[ ${#pod_names_array[@]} -gt 1 ]]; then
        # Multiple pods found, handle the situation (e.g., choose one randomly)
        random_index=$((RANDOM % ${#pod_names_array[@]}))

        pod_name="${pod_names_array[random_index]}"

        echo "Multiple pods found. Selected pod name: $pod_name"

        # Display the parent function name
        echo -e "${BOLD}${YELLOW}we are wait now which is ${FUNCNAME[1]} function waiting ${pod_name} to reach running status and do some actions${NOCOLOR}${RESET}"

        # Wait for the pod to reach the "Running" status
        while true; do
            # Check the status of the pod
            status=$(kubectl get pod "${pod_name}" -n "${namespace}" -o jsonpath='{.status.phase}')
            if [[ "${status}" == "Running" ]]; then
                break
            fi
            sleep 5
        done

    else
        # No pods found
        echo "No pods found matching the partial name."
    fi

}
# function for installing kubernetes prerequisite
function Install-kubernetes-prerequisite() {

        sudo sudo apt update -y && sudo apt upgrade -y 

        source ${bashrc}

        sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg2 jq

        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
        
        echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

        case ${Version} in
            1.21.5-00)
                sudo sudo apt update -y

                source ${bashrc}

                sudo apt-get install -y kubelet=${Version} kubectl=${Version} kubeadm="${Version}" --allow-change-held-packages

                source ${bashrc}
            ;;
            1.24.13-00)
                sudo sudo apt update -y

                source ${bashrc}

                sudo apt-get install -y kubelet=${Version} kubectl=${Version} kubeadm="${Version}" --allow-change-held-packages

                source ${bashrc}
            ;;
            1.25.9-00)
                sudo sudo apt update -y

                source ${bashrc}

                sudo apt-get install -y kubelet=${Version} kubectl=${Version} kubeadm="${Version}" --allow-change-held-packages

                source ${bashrc}
            ;;
            1.26.4-00)
                sudo sudo apt update -y

                source ${bashrc}

                sudo apt-get install -y kubelet=${Version} kubectl=${Version} kubeadm="${Version}" --allow-change-held-packages

                source ${bashrc}
            ;;
            latest)
                sudo sudo apt update -y

                source ${bashrc}

                sudo apt-get install -y kubelet kubectl kubeadm --allow-change-held-packages

                source ${bashrc}
            ;;
            *)
                echo "Usage : 1 for 1.21.5-00 or 2 for 1.24.13-00 or 3 for 1.25.9-00 or 4 for 1.26.4-00 or 5 for 1.27.1-00"
            ;;
        esac     
        
        sudo apt-mark hold kubelet kubeadm kubectl

        kubectl version --client && kubeadm version   
}

# function for installing cri-o prerequisite
function Install-Cri-o-prerequisite() {

        sudo apt update

        sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

        curl -fsSL https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS_VERSION/Release.key | sudo gpg --dearmor -o /usr/share/keyrings/libcontainers-archive-keyring.gpg

        curl -fsSL https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$CRIO_VERSION/$OS_VERSION/Release.key | sudo gpg --dearmor -o /usr/share/keyrings/libcontainers-crio-archive-keyring.gpg

        echo "deb [signed-by=/usr/share/keyrings/libcontainers-archive-keyring.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/$OS_VERSION/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list

        echo "deb [signed-by=/usr/share/keyrings/libcontainers-crio-archive-keyring.gpg] https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable:/cri-o:/$CRIO_VERSION/$OS_VERSION/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable:cri-o:$CRIO_VERSION.list

        sudo apt update

        sudo apt install -y cri-o cri-o-runc

        sudo systemctl daemon-reload

        sudo systemctl enable crio

        sudo systemctl start crio

        sudo apt install -y containernetworking-plugins

        sudo systemctl restart crio

        sudo apt install -y cri-tools


        
}

# function for installing containerd prerequisite
function Install-Containerd-prerequisite() {

        sudo apt-get update -y

        sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

        sudo install -m 0755 -d /etc/apt/keyrings

        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

        sudo chmod a+r /etc/apt/keyrings/docker.gpg

        echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        
        sudo apt-get update -y

        sudo apt-get install -y containerd.io

        sudo mkdir -p /etc/containerd

        sudo containerd config default | sudo tee /etc/containerd/config.toml

        sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml

        printf "overlay\nbr_netfilter\n" | sudo tee /etc/modules-load.d/containerd.conf

        sudo systemctl restart containerd

        sudo systemctl enable containerd
}

# function for Configuring Kubernetes Nodes like Master and Workers
function Configure-Nodes() {

        sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' ${fstab}

        sudo swapoff -a

        sudo modprobe overlay

        sudo modprobe br_netfilter

        sudo sh -c "printf '\nnet.bridge.bridge-nf-call-ip6tables = 1\nnet.bridge.bridge-nf-call-iptables = 1\nnet.ipv4.ip_forward = 1\n' >> ${Sysctl_Parameters}"

        sudo sysctl --system

        lsmod | grep br_netfilter

        sudo systemctl enable kubelet

        sudo sh -c "printf '\n${Master_IP}\t${Master_Host}\n${Workers_IP}\t${Workers_Host}' >> ${Hosts_File}"
}

# function for initializing Kubernetes Cluster
function Init-Kubernetes-Cluster() {

        sudo kubeadm config images pull

        case ${Runtime} in
            Containerd)
                sudo kubeadm init \
                --pod-network-cidr=${CIDR} \
                --upload-certs \
                --control-plane-endpoint=${Master_Host} \
                --cri-socket ${Main_Sock}
            ;;
            CRI-O)
                sudo kubeadm init \
                --pod-network-cidr=${CIDR} \
                --upload-certs \
                --control-plane-endpoint=${Master_Host} \
                --cri-socket ${Main_Sock}
            ;;
            *)
                echo -e "${RED}Usage: 1 for ${Container_Runtimes[0]} or 2 for ${Container_Runtimes[1]} ${NOCOLOR}"
            ;;
        esac
}

# function for post installation steps 
function Kubernetes-Post-Installation() {

    mkdir -p ${HOME}/.kube

    sudo cp -i ${Kube_Admin_Config} ${Kube_Config_non_root} 

    sudo chown $(id -u):$(id -g) ${Kube_Config_non_root}

    export KUBECONFIG=${Kube_Config_non_root}

    alias kubectl='kubectl --kubeconfig=${Kube_Config_non_root}'

    source ${bashrc}

    sudo kubectl apply -f ${flannel} --kubeconfig=${Kube_Admin_Config}

    sudo kubectl cluster-info --kubeconfig=${Kube_Admin_Config}

    sudo kubectl get all -A --kubeconfig=${Kube_Admin_Config}

    sudo kubectl get node -o wide --kubeconfig=${Kube_Admin_Config}

    kubectl describe node $(hostname) | grep "node-role.kubernetes.io/control-plane" | grep "NoSchedule" &> /dev/null

    if [ $? -eq 0 ]; then
        kubectl taint node $(hostname) node-role.kubernetes.io/control-plane:NoSchedule-
    else
        echo -e "${GREEN}Node is untainted ${NOCOLOR}"
    fi

    kubectl describe node $(hostname) | grep "node-role.kubernetes.io/master" | grep "NoSchedule" &> /dev/null

    if [ $? -eq 0 ]; then
        kubectl taint node $(hostname) node-role.kubernetes.io/master:NoSchedule-
    else
        echo -e "${GREEN}Node is untainted ${NOCOLOR}"
    fi

    partial_namespace="kube-system" # partial namespace name passed to pod-wait-status function

    partial_pod_name="coredns" # partial pod name passed to pod-wait-status function

    pod-wait-status # call function 
 
}
# function for installing metrics-server for kubernetes
function metrics-server() {

    kubectl apply -f ${metrics_server} --kubeconfig=${Kube_Config_non_root}

    partial_namespace="kube-system"

    partial_pod_name="metrics-server"

    pod-wait-status # call function 

    kubectl patch deployment metrics-server -n kube-system --type=json -p='[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-preferred-address-types=InternalIP"}, {"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"}]' --kubeconfig=${Kube_Config_non_root}
    
}
# function for installing MetalLB for kubernetes
function MetalLB() {

    kubectl apply -f ${metallb} --kubeconfig=${Kube_Config_non_root}

    partial_namespace="metallb-system"

    partial_pod_name="speaker"
    
    pod-wait-status # frist call function to wait script for speaker pod to reach running status  

    partial_namespace="metallb"

    partial_pod_name="controller"

    pod-wait-status # second call function to wait script for controller pod to reach running status

    echo -e "we will sleep for 15 seconds to make sure that metallb pods are running"

    sleep 15

    cat <<EOF | kubectl apply -f -
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: default-pool
  namespace: metallb-system
spec:
  addresses:
  - 192.168.1.240-192.168.1.250
EOF
     

    cat <<EOF | kubectl apply -f -
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: default
  namespace: metallb-system
spec:
  ipAddressPools:
  - default-pool
EOF

}

# function for installing Kubernetes Dashboard
function Kubernetes-Setup-Dashboard() {

    kubectl apply -f ${dashboard} --kubeconfig=${Kube_Config_non_root}

    partial_namespace="kubernetes-dashboard"

    partial_pod_name="kubernetes-dashboard"

    pod-wait-status # call function to wait script for kubernetes dashboard pod to reach running status

    cat <<EOF | kubectl --kubeconfig=${Kube_Config_non_root} apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
EOF

    cat <<EOF | kubectl --kubeconfig=${Kube_Config_non_root} apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
EOF

    case ${Version} in
        1.21.5-00)
            export Admin_Token=$(kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}" && echo "" )
            break
        ;;
        1.24.13-00)
            export Admin_Token=$(kubectl -n kubernetes-dashboard create token admin-user --kubeconfig=${Kube_Config_non_root})
            break
        ;;
        1.25.9-00)
            export Admin_Token=$(kubectl -n kubernetes-dashboard create token admin-user --kubeconfig=${Kube_Config_non_root})
            break
        ;;
        1.26.4-00)
            export Admin_Token=$(kubectl -n kubernetes-dashboard create token admin-user --kubeconfig=${Kube_Config_non_root})
            break
        ;;
        latest)
            export Admin_Token=$(kubectl -n kubernetes-dashboard create token admin-user --kubeconfig=${Kube_Config_non_root})
            break
        ;;
        *)
            echo -e "${RED}Usage : 1 for ${Versions[0]} or 2 for ${Versions[1]} or 3 for ${Versions[2]} or 4 for ${Versions[3]} or 5 for ${Versions[4]} ${NOCOLOR}"
        ;;
    esac

    echo -e "${BOLD}${GREEN}\nHere is it. Take your Token For Access Kubernetes Dashboard \n\n${RESET}${BOLD}${BLUE}${Admin_Token}${RESET}${NOCOLOR}\n"

    kubectl patch service kubernetes-dashboard -n kubernetes-dashboard --type=json -p='[{"op": "replace", "path": "/spec/type", "value": "LoadBalancer"}]' --kubeconfig=${Kube_Config_non_root}

    kubectl get service/kubernetes-dashboard -n kubernetes-dashboard --kubeconfig=${Kube_Config_non_root} -o=jsonpath='{.status.loadBalancer.ingress[0].ip}' | xargs -I {} echo -e "${BOLD}Here is your Kubernetes Dashboard link: ${RESET}${UNDERLINE}${MAGENTA}https://{}${NOCOLOR}${RESET}"

}

# function to load mandatory functions for installing kubernetes master
function Master_Main() {
    echo -e "${GREEN}${BOLD}Choose Container Runtime do you want to install ${NOCOLOR}"
    select Runtime in "${Container_Runtimes[@]}"
        do
            case ${Runtime} in
                Containerd)
                    echo -e "${GREEN}${BOLD}Start to Install Containerd prerequisite ${NOCOLOR}"
                    Install-Containerd-prerequisite ; #call function
                    echo -e "${GREEN}${BOLD}Installed Containerd prerequisite successfully ${NOCOLOR}"
                    export Main_Sock=${Containerd_sock}
                    break
                ;;
                CRI-O)
                    echo -e "${GREEN}${BOLD}Start to Install CRI-O prerequisite ${NOCOLOR}"
                    Install-Cri-o-prerequisite ; #call function
                    echo -e "${GREEN}${BOLD}Installed CRI-O prerequisite successfully ${NOCOLOR}"
                    export Main_Sock=${CRI_O_sock}
                    break
                ;;
                *)
                    echo -e "${RED}Usage: 1 for ${Container_Runtimes[0]} or 2 for ${Container_Runtimes[1]} ${NOCOLOR}"
                ;;
            esac
        done
    echo -e "${GREEN}${BOLD}Start to Install Kubernetes prerequisite ${NOCOLOR}"
    Install-kubernetes-prerequisite ; #call function
    echo -e "${GREEN}${BOLD}Installed Kubernetes prerequisite successfully ${NOCOLOR}"
    echo -e "${GREEN}${BOLD}Start Configure Kubernetes ${Node}${NOCOLOR}"
    Configure-Nodes ; #call function
    echo -e "${GREEN}${BOLD}Finished Configure Kubernetes ${Node} successfully ${NOCOLOR}"
    echo -e "${GREEN}${BOLD}Start initialize Kubernetes ${Node}${NOCOLOR}"
    Init-Kubernetes-Cluster ; #call function
    sleep 70
    echo -e "${GREEN}${BOLD}Finished initialize Kubernetes ${Node} successfully ${NOCOLOR}"
    echo -e "${GREEN}${BOLD}Start Kubernetes Post Installation for ${Node}${NOCOLOR}"
    Kubernetes-Post-Installation ; #call function
    echo -e "${GREEN}${BOLD}Finished Kubernetes Post Installation for ${Node} successfully ${NOCOLOR}"
    echo -e "${GREEN}${BOLD}Start metallb Setup Load Balancer ${NOCOLOR}"
    MetalLB ; #call function
    echo -e "${GREEN}${BOLD}Finished metallb Setup Load Balancer successfully ${NOCOLOR}"
    echo -e "${GREEN}${BOLD}Start Kubernetes Setup Dashboard ${NOCOLOR}"
    Kubernetes-Setup-Dashboard ; #call function
    echo -e "${GREEN}${BOLD}Finished Kubernetes Setup Dashboard successfully ${NOCOLOR}"
    echo -e "${GREEN}${BOLD}Start Kubernetes Setup Metrics Server ${NOCOLOR}"
    metrics-server ; #call function
    echo -e "${GREEN}${BOLD}Finished Kubernetes Setup Metrics Server successfully ${NOCOLOR}"
    
}
# function to load mandatory functions for installing kubernetes worker
function Worker_Main() {
    echo -e "${GREEN}${BOLD}Start to Install Kubernetes prerequisite ${NOCOLOR}"
    Install-kubernetes-prerequisite ; #call function
    echo -e "${GREEN}${BOLD}Installed Kubernetes prerequisite successfully ${NOCOLOR}"
    echo -e "${GREEN}${BOLD}Choose Container Runtime do you want to install ${NOCOLOR}"
    select Runtime in "${Container_Runtimes[@]}"
        do
            case ${Runtime} in
                Containerd)
                    echo -e "${GREEN}${BOLD}Start to Install Containerd prerequisite ${NOCOLOR}"
                    Install-Containerd-prerequisite ; #call function
                    echo -e "${GREEN}${BOLD}Installed Containerd prerequisite successfully ${NOCOLOR}"
                    export Main_Sock=${Containerd_sock}
                    break
                ;;
                CRI-O)
                    echo -e "${GREEN}${BOLD}Start to Install CRI-O prerequisite ${NOCOLOR}"
                    Install-Cri-o-prerequisite ; #call function
                    echo -e "${GREEN}${BOLD}Installed CRI-O prerequisite successfully ${NOCOLOR}"
                    export Main_Sock=${CRI_O_sock}
                    break
                ;;
                *)
                    echo -e "${RED}Usage: 1 for ${Container_Runtimes[0]} or 2 for ${Container_Runtimes[1]} ${NOCOLOR}"
                ;;
            esac
        done

    echo -e "${GREEN}${BOLD}Start Configure Kubernetes ${Node} ${NOCOLOR}"
    Configure-Nodes ; #call function
    echo -e "${GREEN}${BOLD}Finished Configure Kubernetes ${Node} successfully ${NOCOLOR}"
}

if [ -z "${Master_Host}" -o -z "${Master_Host}" -o -z "${CIDR}" ];
  then
        echo -e "${RED}usage of${BOLD}${BLUE}${0}${RESET}${NOCOLOR} have must been set value of 'Master_IP' and 'Master_Host' and 'Pod's Network ID / Subnet' and this value are oiptional 'Worker_IP' and 'Workers_Host' ${NOCOLOR}"
        exit -1 # exit 0 like exit without error or use exit -1 for highlight error
  else
        sudo echo -e "${GREEN}${BOLD}Choose Node do you want to install Kubernetes on it ${NOCOLOR}"
        select Node in "${Nodes[@]}"
        do
            case ${Node} in
                Master)
                    echo -e "${GREEN}${BOLD}Choose Kubernetes Version do you want to install ${NOCOLOR}"
                    select Version in "${Versions[@]}"
                        do
                            case ${Version} in
                                1.21.5-00)
                                    Master_Main #call function
                                    break
                                ;;
                                1.24.13-00)
                                    Master_Main #call function
                                    break
                                ;;
                                1.25.9-00)
                                    Master_Main #call function
                                    break
                                ;;
                                1.26.4-00)
                                    Master_Main #call function
                                    break
                                ;;
                                latest)
                                    Master_Main #call function
                                    break
                                ;;
                                *)
                                    echo -e "${RED}Usage : 1 for ${Versions[0]} or 2 for ${Versions[1]} or 3 for ${Versions[2]} or 4 for ${Versions[3]} or 5 for ${Versions[4]} ${NOCOLOR}"
                                ;;
                            esac     
                        done
                    exit 0
                ;;
                Workers)
                    echo -e "${GREEN}${BOLD}Choose Kubernetes Version do you want to install ${NOCOLOR}"
                    select Version in "${Versions[@]}"
                        do
                            case ${Version} in
                                1.21.5-00)
                                    Worker_Main #call function
                                    break
                                ;;
                                1.24.13-00)
                                    Worker_Main #call function
                                    break
                                ;;
                                1.25.9-00)
                                    Worker_Main #call function
                                    break
                                ;;
                                1.26.4-00)
                                    Worker_Main #call function
                                    break
                                ;;
                                latest)
                                    Worker_Main #call function
                                    break
                                ;;
                                *)
                                    echo -e "${RED}Usage : 1 for ${Versions[0]} or 2 for ${Versions[1]} or 3 for ${Versions[2]} or 4 for ${Versions[3]} or 5 for ${Versions[4]} ${NOCOLOR}"
                                ;;
                            esac     
                        done
                    exit 0
                ;;
                *)
                    echo -e "${RED}Usage: 1 for ${Nodes[0]} or 2 for ${Nodes[1]} ${NOCOLOR}"
                ;;
            esac   
        done
fi


