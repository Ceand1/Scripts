##################TESTE 2####################
#Autor: Antonio César
#Data: 29/05/2022
#Converter as tabelas do arquivo anexo1.pdf para CSV e comprimir no arquivo
#Teste_Cesar.zip

import zipfile
import urllib.request
import tabula
import os

#variável que recebe a url do pdf do anexo1
url = "https://www.gov.br/ans/pt-br/arquivos/assuntos/consumidor/o-que-seu-plano-deve-cobrir/Anexo_I_Rol_2021RN_465.2021_RN473_RN478_RN480_RN513_RN536.pdf"


#função que converte o o pdf para csv e comprime em Teste_Cesar.zip
def convertCompress():
    #baixa anexo1.pdf em testes/cacheTeste2
    file = urllib.request.urlretrieve(url=url, filename="../cacheTeste2/anexo1.pdf")
    
    #cria o arquivo Teste_Cesar.zip, com permissão de escrita, em testes/cacheTeste2
    zp_fl = zipfile.ZipFile("../cacheTeste2/Teste_Cesar.zip", "w", compression=zipfile.ZIP_DEFLATED, compresslevel=9)

    #converte as tabelas do arquivo anexo1.pdf para csv e salva em testes/cacheTeste2
    table = tabula.convert_into("../cacheTeste2/anexo1.pdf", "../cacheTeste2/anexo1.csv", output_format="csv", pages="all") 

    #coloca anexo1.csv no arquivo zipado Teste_Cesar.zip
    zp_fl.write("../cacheTeste2/anexo1.csv", arcname="anexo1.csv")

    #remove anexo1.pdf e anexo1.csv de cacheTeste2
    os.remove("../cacheTeste2/anexo1.pdf")
    os.remove("../cacheTeste2/anexo1.csv")

    #fecha o arquivo zipado
    zp_fl.close()

if __name__ == "__main__":

    convertCompress()
