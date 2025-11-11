API_URL="https://cointradermonitor.com/api/pbb/v1/ticker" 
VALOR_ATUALIZADO=$1

value=$(curl -s $API_URL | jq '.last')

echo "Preço atual do Bitcoin: $value"

if [ $(echo "$value < $VALOR_ATUALIZADO" | bc) -eq 1 ]; then
    echo "Alerta: Valor do Bitcoin caiu abaixo de $VALOR_ATUALIZADO"
fi