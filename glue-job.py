import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

## @params: [JOB_NAME]
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

## @type: DataSource
DataSource0 = glueContext.create_dynamic_frame.from_options(
    connection_type="s3",
    connection_options = {
        "paths": ["s3://sh10-datalake-bucket/input/csv/sales/"]
    },
    format = "csv",
    format_options = {
        "withHeader": "true"
    }
)


print('Count: {0}'.format(DataSource0.count()))

## @type: DataSink
DataSink0 = glueContext.write_dynamic_frame.from_options(
    frame = DataSource0,
    connection_type = "s3", 
    connection_options = {
        "path": "s3://sh10-datalake-bucket/output/parquet/sales/o/",
        "compression": "snappy"
    }, 
    format = "parquet", 
    transformation_ctx = "DataSink0"
)

job.commit()