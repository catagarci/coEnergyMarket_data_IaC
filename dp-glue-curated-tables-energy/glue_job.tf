# Referencia al rol IAM existente
data "aws_iam_role" "existing_glue_role" {
  name = "co-energy-transversal-gl-role-pdn"
}

# Job 1: co_energy_market_curado_providers
resource "aws_glue_job" "glue_job_providers" {
  name     = "co_energy_market_curado_providers"
  role_arn = data.aws_iam_role.existing_glue_role.arn

  command {
    name            = "glueetl"
    script_location = "s3://co-energy-marketer-artifacts-569587453910-pdn/scripts/co_energy_market_curado_providers.py"  # Ubicación del script en S3
    python_version  = "3"
  }

  default_arguments = {
    "--TempDir" = "s3://bucket-glue-temp/"
    "--job-language" = "python"
    "--ACCOUNT"      = "569587453910"
    "--PROCESS_DATE" = ""
    "--TYPE_PROCESS" = "INC"
    "--ENV"          = "pdn"
    "--data_quality" = "summary"
    "--enable-glue-datacatalog" = "true"
    "--datalake-formats"        = "hudi"
    "--enable-auto-scaling"     = "true"
    "--extra-py-files"          = "s3://co-energy-marketer-artifacts-569587453910-pdn/extra/extra-0.1-py3-none-any.whl"
  }

  worker_type      = "G.1X"
  number_of_workers = 2
}

# Job 2: co_energy_market_curado_customers
resource "aws_glue_job" "glue_job_customers" {
  name     = "co_energy_market_curado_customers"
  role_arn = data.aws_iam_role.existing_glue_role.arn

  command {
    name            = "glueetl"
    script_location = "s3://co-energy-marketer-artifacts-569587453910-pdn/scripts/co_energy_market_curado_customers.py"  # Ubicación del script en S3
    python_version  = "3"
  }

  default_arguments = {
    "--TempDir" = "s3://bucket-glue-temp/"
    "--job-language" = "python"
    "--ACCOUNT"      = "569587453910"
    "--PROCESS_DATE" = ""
    "--TYPE_PROCESS" = "INC"
    "--ENV"          = "pdn"
    "--data_quality" = "summary"
    "--enable-glue-datacatalog" = "true"
    "--datalake-formats"        = "hudi"
    "--enable-auto-scaling"     = "true"
    "--extra-py-files"          = "s3://co-energy-marketer-artifacts-569587453910-pdn/extra/extra-0.1-py3-none-any.whl"
  }

  worker_type      = "G.1X"
  number_of_workers = 2
}

# Job 3: co_energy_market_curado_transactions
resource "aws_glue_job" "glue_job_transactions" {
  name     = "co_energy_market_curado_transactions"
  role_arn = data.aws_iam_role.existing_glue_role.arn

  command {
    name            = "glueetl"
    script_location = "s3://co-energy-marketer-artifacts-569587453910-pdn/scripts/co_energy_market_curado_transactions.py"  # Ubicación del script en S3
    python_version  = "3"
  }

  default_arguments = {
    "--TempDir" = "s3://bucket-glue-temp/"
    "--job-language" = "python"
    "--ACCOUNT"      = "569587453910"
    "--PROCESS_DATE" = ""
    "--TYPE_PROCESS" = "INC"
    "--ENV"          = "pdn"
    "--data_quality" = "summary"
    "--enable-glue-datacatalog" = "true"
    "--datalake-formats"        = "hudi"
    "--enable-auto-scaling"     = "true"
    "--extra-py-files"          = "s3://co-energy-marketer-artifacts-569587453910-pdn/extra/extra-0.1-py3-none-any.whl"
  }

  worker_type      = "G.1X"
  number_of_workers = 2
}
