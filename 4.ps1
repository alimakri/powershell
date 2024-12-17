function ValeurCrypto
{
    param ($symbol)

}
ValeurCrypto 'BTC'
ValeurCrypto 'ETH'
ValeurCrypto 'SOL'
ValeurCrypto 'AXL'


function Get-CryptoPrices {
    $symbols = "[""" + ($args -join '","') + """]" # Transforme le tableau en string pour url
    $url = "https://api.binance.com/api/v3/ticker/price?symbols=$symbols"
    $responses = Invoke-RestMethod -Uri $url -Method Get
    return $responses | select -Property symbol, price
}

# Exemple d'utilisation
$prices = Get-CryptoPrices "BTCUSDT" "ETHUSDC" "AXLUSDT"
Write-Output $prices


