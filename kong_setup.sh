#!/bin/bash

echo -n "
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: cluster-admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: User
  name: lazar.mate97@gmail.com # usually the Google account
                                         # eg: harry@konghq.com
  namespace: kube-system" | kubectl apply -f -

export PROXY_IP=$(kubectl get -o jsonpath="{.status.loadBalancer.ingress[0].ip}" service -n kong kong-proxy)
curl -i $PROXY_IP
kubectl apply -f https://bit.ly/echo-service
sleep 15
echo "
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: demo
spec:
  rules:
  - http:
      paths:
      - path: /foo
        backend:
          serviceName: echo
          servicePort: 80
" | kubectl apply -f -
ingress.extensions/demo created
sleep 15
curl -i $PROXY_IP/foo
