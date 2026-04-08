Write-Host "Deploying to Kubernetes..." -ForegroundColor Cyan

kubectl apply -f k8s/base/namespace.yml
kubectl apply -f k8s/base/backend/
kubectl apply -f k8s/base/nginx/

Write-Host "Waiting for pods to be ready..." -ForegroundColor Yellow
kubectl wait --for=condition=ready pod --all -n effective-mobile --timeout=120s

Write-Host "`n Deployment complete!" -ForegroundColor Green
kubectl get all -n effective-mobile
Write-Host "`n App available at: http://localhost:30080" -ForegroundColor Cyan