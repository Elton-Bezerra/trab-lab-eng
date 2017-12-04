# Trabalho-Lab-Engenharia

Para testar o programa, abra o mysql workbench/phpmyadmin ou por onde quiser e importe o arquivo teams.sql, após isso, abra o eclipse em qualquer workspace,
importe o projeto e rode, talvez seja necessário criar um novo servidor, é só baixar o tomcat 8 por aqui: https://tomcat.apache.org/download-80.cgi
E adicionar ele na aba servers no eclipse, como já executado em aula.


Caso haja algum problema na hora do build e a pasta teams ficar como source folder, clique com o botão direito nela, vá até build path-> remove from build path. Irá aparecer uma pasta source, clique com o botão direito, build path-> use as source folder, após isso, vá até build path, verifique se as libraries estão devidamente listadas (jre, webapp e o apache), se não estiverem listados ou estiverem com erros, os adicione, após isso, clique com o botão direito no projeto, selecione a opção 'Properties', no canto direito, procure por Runtimes e selecione o apache tomcat, clique em apply, ok e pronto


No arquivo persistence.xml troque as configurações da string de conexão(user, password) pelas que você utiliza em sua máquina