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
# Add the Cloud SDK distribution URI as a package source
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get install google-cloud-sdk

# Initialize the SDK
gcloud init


curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl






