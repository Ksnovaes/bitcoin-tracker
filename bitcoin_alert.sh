API_URL="https://cointradermonitor.com/api/pbb/v1/ticker" 
VALOR_ATUALIZADO=${1:-550000}

value=$(curl -s $API_URL | jq '.last')

echo "Preço atual do Bitcoin: $value"

if [ $(echo "$value < $VALOR_ATUALIZADO" | bc) -eq 1 ]; then
    echo "Alerta: Valor do Bitcoin caiu abaixo de $VALOR_ATUALIZADO"
    export TZ="America/Sao_Paulo"
    echo "value=$value" >> $GITHUB_ENV
    echo "datetime=$(date -u +'%d/%m/%Y %H:%M')" >> $GITHUB_ENV
    exit 2
else
    echo "O valor do Bitcoin está acima de $VALOR_ATUALIZADO"
    exit 0
fi