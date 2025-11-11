API_URL="https://cointradermonitor.com/api/pbb/v1/ticker" 

value=$(curl -s $API_URL | jq '.last')

echo "Preço atual do Bitcoin: $value"

if [ $(echo "$value < 560000" | bc) -eq 1 ]; then
    echo "Alerta: Valor do Bitcoin caiu abaixo de 560.000"
fi