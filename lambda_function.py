import boto3
import os
from PIL import Image
import io

s3 = boto3.client('s3')

def lambda_handler(event, context):
    # Read environment variable for output bucket
    destination_bucket = os.environ['processedimagetask']

    # Extract S3 event info
    source_bucket = event['Records'][0]['s3']['bucket']['name']
    object_key = event['Records'][0]['s3']['object']['key']

    print(f"Processing file {object_key} from bucket {source_bucket}")

    # Download image from S3
    download_path = f'/tmp/{object_key}'
    s3.download_file(source_bucket, object_key, download_path)

    # Open and process image
    with Image.open(download_path) as img:
        # Example: create a thumbnail (resize)
        img.thumbnail((256, 256))

        # Save to buffer
        buffer = io.BytesIO()
        img.save(buffer, 'JPEG')
        buffer.seek(0)

    # Upload the processed image back to destination S3 bucket
    processed_key = f"processed/{object_key}"
    s3.upload_fileobj(buffer, destination_bucket, processed_key)

    print(f"Successfully processed and uploaded {processed_key}")

    return {
        'statusCode': 200,
        'body': f"Image {object_key} processed successfully!"
    }
