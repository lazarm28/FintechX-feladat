# FintechX-feladat

A feladat:
Telepíts egy Kubernetes clustert az alábbi paraméterek szerint Microsoft Azure vagy Google Cloud környezetbe:
- 1 master node
- 2 worker nodes
- operációs rendszer Ubuntu (preferáltan Xenial)
- Kubernetes Ingress Controllernek használj Kong API Gateway-t
- a Kubernetesre telepíts egy MongoDB-t 1 poddal
- a Kubernetesre a MongoDB-hez telepíts egy mongo-express admin gui podot 
- a mongo-express legyen publikálva a Kong-on keresztül a külvilág felé
- bónusz pont, ha a Kong-on beállítasz egy HTTP Basic Auth plugint a publikált URL-re, hogy csak jelszóval lehessen elérni

A telepítést (és lehetőleg a konfigurálást is) automatizáld Ansible segítségével.

Use:

ansible-playbook gcpplaybook.yml

Before run:

Add the Cloud SDK distribution URI as a package source:

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

Import the Google Cloud Platform public key:

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

Update the package list and install the Cloud SDK:

sudo apt-get update && sudo apt-get install google-cloud-sdk

Initialize the SDK:

gcloud init

Install kubectl binary with using native package management:

sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

Install pip3, ansible and GCP modules requires:

sudo apt-get install python3-pip
pip3 install ansible
pip3 install requests google-auth






