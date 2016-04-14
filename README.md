# Sobre #

Programa para c�lculo de pedidos levando em conta quantidade de itens e seus valores separados tal como aplica��o de desconto com base em cupons.
Feito em Ruby(testado na vers�o 2.3.0p0) para fins de teste para contrata��o pela empresa LUZ(luz.vc) para cargo de desenvolvedor Senior.

# executando o programa #

Para que o programa rode perfeitamente, se faz necess�rio chama-lo via linha de comando(ou terminal, como preferir..)
passando os par�metros certos para seu correto funcionamento. Todos os arquivos que devem ser passados j� est�o versionados.
S�o eles:

* coupons.csv: planilha com dados sobre os cupons de desconto
* order_items.csv: planilha com dados dos itens referentes aos pedidos
* order.csv: planilha com dados dos pedidos e seus cupons de desconto
* products.csv: planilha com dados dos produtos e seus pre�os
* output.csv: arquivo onde s�o gravados os resultados do programa, o id do pedido e seu pre�o final com os descontos aplicados

Para o prorama rodar perfeitamente, basta chamar a linha abaixo:
* ruby csv_program.rb coupons.csv order_items.csv orders.csv products.csv output.csv

Os descontos s�o aplicados seguindo as regras propostas;
* s�o dividos entre percentuais e absolutos
* descontos absolutos d�o um desconto bruto no valor final do pedido
* descontos percentuais s�o calculados em 5% por item, a partir de dois e n�o ultrapassando 40%
* um ticket de desconto n�o pode ser usado mais de 3x

Ao rodar o programa e passar os dados corretamente, o programa ser� executado e seu resultado gravado no arquivo output.csv
para confer�ncia.

# Observa��es finais #

Vale ressaltar que, para fins de progressividade e continuidade nos testes do programa, os arquivos .csv n�o s�o alterados
com exce��o do output.csv, desta forma, o limite de uso dos cupons de desconto permanece inalterado ao t�rmino do programa
permitindo assim sua execu��o posterior sem ser necess�rio restaurar o arquivo coupons.csv.