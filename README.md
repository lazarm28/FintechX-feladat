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

