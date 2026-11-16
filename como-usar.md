# Como utilizar o repositório:
### Aviso: Quando for executar o roda-experimento.sh tenha certeza de ter reiniciado o computador previamente e de ter entrado no modo texto do Linux (ctrl+alt+F1 ao F6).
## 1. Entre na pasta libs/tbb-2020.1/.
```shell
cd libs/tbb-2020.1/
```
## 2. Utilize o comando make dentro da pasta.
```shell
make
```
## 3. Rode o comando gera-shell.py a partir da raíz do diretório.
```shell
cd ../../
```
e depois
```shell
python3 scripts/gera-shell.py
```
ou
```shell
python scripts/gera-shell.py
```
### 3.1 Escolha um nome para a pasta onde serão armazenados os resultados dos experimentos e a carga de trabalho utilizada na hora de compilar os códigos (S, W, A, B, C).
## 4. Modifique a permissão de execução do arquivo roda-experimento.sh que foi criado pelo gera-shell.py.
```shell
chmod +x scripts/roda-experimento.sh
```
## 5. Execute o arquivo roda-experimento.sh que vai compilar os códigos e realizar os experimentos de medição do consumo energético de forma automatizada.
```shell
./scripts/roda-experimento.sh
```