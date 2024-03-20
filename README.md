# Datamatrix

## Descrição
Este projeto implementa a infraestrutura necessária para processamento de dados utilizando Terraform e integração com serviços do Google Cloud Platform (GCP), como Google Cloud Storage e Google BigQuery.

## Requisitos
- [Terraform](https://www.terraform.io/downloads.html)
- Conta no Google Cloud Platform com as permissões necessárias
- Credenciais de serviço do GCP (arquivo `creds.json`)
- Python 3.12 ou superior

## Instalação
1. Clone este repositório.
2. Certifique-se de ter o Terraform instalado em sua máquina.
3. Configure suas credenciais de serviço do GCP no arquivo `creds.json`.
4. Instale as dependências Python executando `poetry install`.

## Configuração do Terraform
Certifique-se de ter configurado as variáveis necessárias no arquivo `terraform.tfvars`:
- `project_id`: O ID do projeto no GCP.
- `region`: A região onde os recursos serão criados.
- `ent_terraform`: O nome do bucket para os esquemas.
- `schema_bucket`: O nome do bucket para os esquemas.
- `entrada_manual`: O nome do bucket para entrada manual.
- `entrada_auto`: O nome do bucket para entrada automática.

## Uso
1. Execute `terraform init` para inicializar o diretório do Terraform.
2. Execute `terraform apply` para criar a infraestrutura no GCP.
3. Carregue os dados nos buckets do Google Cloud Storage utilizando o script `load_data.sh`.
4. Execute o script Python `fn_st_xlsx.py` para processar e carregar os dados no Google BigQuery.

## Estrutura do Projeto
- `main.tf`: Define a infraestrutura no Terraform, incluindo buckets do Google Cloud Storage e datasets do Google BigQuery.
- `schema.tf`: Define os esquemas das tabelas do BigQuery.
- `tables.tf`: Define as tabelas do BigQuery.
- `terraform.tfvars`: Arquivo de configuração das variáveis do Terraform.
- `variables.tf`: Define as variáveis do Terraform.
- `load_data.sh`: Script para carregar dados nos buckets do Google Cloud Storage.
- `fn_st_xlsx.py`: Script Python para ler dados de um arquivo Excel no Google Cloud Storage e carregar no Google BigQuery.

## Autor
RodolfoxvData <136007122+Rodolfoxxv@users.noreply.github.com>

---
Este projeto faz parte do meu portfólio de aprendizado e desenvolvimento. Sinta-se à vontade para contribuir ou fornecer feedback.
