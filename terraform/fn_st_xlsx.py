import os
from google.cloud import storage
from google.cloud import bigquery
import pandas as pd
import duckdb
import io

def main():
    # Configuração do Cliente GCP
    project_id = os.getenv('PROJECT_ID')
    bucket_name = os.getenv('BUCKET_NAME')
    dataset_id = os.getenv('DATASET_ID')
    table_id = os.getenv('TABLE_ID')
    folder_name = os.getenv('FOLDER_NAME')
    filename = os.getenv('FILENAME')

    return controller(project_id, bucket_name, dataset_id, table_id, folder_name, filename)

def read_excel_from_gcs(project_id, bucket_name, folder_name, filename):
    """
    Read an Excel file from Google Cloud Storage.

    Args:
        project_id (str): The project ID.
        bucket_name (str): The name of the bucket.
        folder_name (str): The name of the folder.
        filename (str): The name of the file.

    Returns:
        pandas.DataFrame: The data from the Excel file.
    """
    client = storage.Client(project_id)
    bucket = client.get_bucket(bucket_name)
    blob = storage.Blob(os.path.join(folder_name, filename), bucket)
    content = blob.download_as_bytes()
    df = pd.read_excel(io.BytesIO(content))
    con = duckdb.connect(database=':memory:', read_only=False)
    con.register('df', df)
    df = con.execute("SELECT CAST(*) AS STRING FROM df").fetchall()
    return pd.DataFrame(df)

def upload_dataframe_to_bigquery(project_id, dataset_id, table_id, df):
    client = bigquery.Client(project_id)
    dataset_ref = client.dataset(dataset_id)
    table_ref = dataset_ref.table(table_id)
    job_config = bigquery.LoadJobConfig()
    job_config.write_disposition = bigquery.WriteDisposition.WRITE_TRUNCATE
    client.load_table_from_dataframe(df, table_ref, job_config=job_config)

def controller(project_id, bucket_name, dataset_id, table_id, folder_name, filename):
    df = read_excel_from_gcs(project_id, bucket_name, folder_name, filename)
    upload_dataframe_to_bigquery(project_id, dataset_id, table_id, df)
    return 'Processo concluído com sucesso'
