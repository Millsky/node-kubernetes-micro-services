export REDIS_HOST=127.0.0.1
export REDIS_PORT=6379
export REDIS_PASSWORD=$(kubectl get secret --namespace default redis-store -o jsonpath="{.data.redis-password}" | base64 --decode)
