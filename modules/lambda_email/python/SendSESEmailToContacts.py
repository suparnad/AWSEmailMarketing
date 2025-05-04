import boto3
import csv
import os

# Initialize boto3 clients
s3_client = boto3.client('s3')
ses_client = boto3.client('ses')

# These can be configured as Lambda environment variables
BUCKET_NAME = os.environ.get('BUCKET_NAME')         # e.g., 'your-bucket-name'
CSV_KEY = os.environ.get('CSV_KEY')                 # e.g., 'contacts/emails.csv'
TEMPLATE_KEY = os.environ.get('TEMPLATE_KEY')       # e.g., 'templates/email_template.html'
SOURCE_EMAIL = os.environ.get('SOURCE_EMAIL')       # e.g., 'verified_sender@example.com'
EMAIL_SUBJECT = os.environ.get('EMAIL_SUBJECT')     # e.g., 'Welcome to Suparna\'s Kitchen'

def lambda_handler(event, context):
    try:
        # Fetch CSV from S3
        csv_obj = s3_client.get_object(Bucket=BUCKET_NAME, Key=CSV_KEY)
        lines = csv_obj['Body'].read().decode('utf-8').splitlines()
        contacts = csv.DictReader(lines)

        # Fetch HTML template from S3
        template_obj = s3_client.get_object(Bucket=BUCKET_NAME, Key=TEMPLATE_KEY)
        email_html_template = template_obj['Body'].read().decode('utf-8')

        # Send email to each contact
        for contact in contacts:
            # Replace placeholder with actual data
            personalised_email = email_html_template.replace('{{FirstName}}', contact['FirstName'])

            response = ses_client.send_email(
                Source=SOURCE_EMAIL,
                Destination={'ToAddresses': [contact['Email']]},
                Message={
                    'Subject': {
                        'Data': EMAIL_SUBJECT,
                        'Charset': 'UTF-8'
                    },
                    'Body': {
                        'Html': {
                            'Data': personalised_email,
                            'Charset': 'UTF-8'
                        }
                    }
                }
            )

            print(f"Email sent to {contact['Email']}: MessageId={response['MessageId']}")

    except Exception as e:
        print(f"An error occurred: {e}")
