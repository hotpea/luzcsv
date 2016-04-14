# Sobre #

Programa para cálculo de pedidos levando em conta quantidade de itens e seus valores separados tal como aplicação de desconto com base em cupons.
Feito em Ruby(testado na versão 2.3.0p0) para fins de teste para contratação pela empresa LUZ(luz.vc) para cargo de desenvolvedor Senior.

# executando o programa #

Para que o programa rode perfeitamente, se faz necessário chama-lo via linha de comando(ou terminal, como preferir..)
passando os parâmetros certos para seu correto funcionamento. Todos os arquivos que devem ser passados já estão versionados.
São eles:

* coupons.csv: planilha com dados sobre os cupons de desconto
* order_items.csv: planilha com dados dos itens referentes aos pedidos
* order.csv: planilha com dados dos pedidos e seus cupons de desconto
* products.csv: planilha com dados dos produtos e seus preços
* output.csv: arquivo onde são gravados os resultados do programa, o id do pedido e seu preço final com os descontos aplicados

Para o prorama rodar perfeitamente, basta chamar a linha abaixo:
* ruby csv_program.rb coupons.csv order_items.csv orders.csv products.csv output.csv

Os descontos são aplicados seguindo as regras propostas;
* são dividos entre percentuais e absolutos
* descontos absolutos dão um desconto bruto no valor final do pedido
* descontos percentuais são calculados em 5% por item, a partir de dois e não ultrapassando 40%
* um ticket de desconto não pode ser usado mais de 3x

Ao rodar o programa e passar os dados corretamente, o programa será executado e seu resultado gravado no arquivo output.csv
para conferência.

# Observações finais #

Vale ressaltar que, para fins de progressividade e continuidade nos testes do programa, os arquivos .csv não são alterados
com exceção do output.csv, desta forma, o limite de uso dos cupons de desconto permanece inalterado ao término do programa
permitindo assim sua execução posterior sem ser necessário restaurar o arquivo coupons.csv.