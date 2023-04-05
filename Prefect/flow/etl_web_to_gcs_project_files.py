from pathlib import Path
import pandas as pd
from prefect import flow, task
from prefect_gcp.cloud_storage import GcsBucket


@task(retries=3)
def fetch(file_path: str) -> pd.DataFrame:
    """Read CSV file into pandas DataFrame"""
    df = pd.read_csv(file_path)
    return df


@task(log_prints=True)
def clean(df: pd.DataFrame) -> pd.DataFrame:
    print(df.head(2))
    print(f"columns: {df.dtypes}")
    print(f"rows: {len(df)}")
    return df


@task()
def write_local(df: pd.DataFrame, dataset_file: str) -> Path:
    """Write DataFrame out locally as CSV file"""
    path = Path(f"/data/{dataset_file}.csv")
    df.to_csv(path, index=False)
    return path


@task()
def write_gcs(path: Path) -> None:
    """Upload local CSV file to GCS"""
    gcs_block = GcsBucket.load("etl-gcs")
    gcs_block.upload_from_path(from_path=path, to_path=path.name)
    return


@flow
def etl_web_to_gcs() -> None:
    """The main ETL function"""
    folder_path = Path("C:/data")  # change this to your folder path
    for file_path in folder_path.glob("*.csv"):
        dataset_file = file_path.stem  # use the file name without extension as dataset_file
        df = fetch(file_path)
        df_clean = clean(df)
        path = write_local(df_clean, dataset_file)
        write_gcs(path)


if __name__ == "__main__":
    etl_web_to_gcs()
