import boto, os, time
from builder import results_printer

# Boto provides s3 date in string format, we need seconds since the epoch
def format_s3_date(s3_date):
  # S3 string format is 'Sun, 01 Jan 2012 00:00:00 GMT'
  s3_time_format = '%a, %d %b %Y %H:%M:%S %Z'
  # Using the s3 given date and its format, strptime gives us a struct_time
  # which is made into time (seconds since the epoch) using mktime
  return time.mktime(time.strptime(s3_date, s3_time_format))

# We want to commit all modified files to the s3 bucket for the site
def commit_to_s3():
  success = False

  try:
    # Requires S3 creds, which I set as environment variables
    connection = boto.connect_s3();
    bucket = connection.lookup('www.michgarbacz.com')

    # Iterating over all files in the web-content folder
    for directory, subdirectories, files in os.walk('web-content'):
      for filename in files:
        # We want the path to get each file
        local_file_path = os.path.join(directory, filename)
        # For s3, we don't want the 'web-content' part of file path
        s3_file_path = local_file_path[12:]

        # Printing the filename to track progress
        print filename,
        # We need the times for local and s3 last modified
        local_last_modified = os.path.getmtime(local_file_path)
        s3_last_modified = format_s3_date(bucket
          .get_key(s3_file_path).last_modified)

        # Is the local modified date newer than s3 modified date?
        if (local_last_modified > s3_last_modified):
          print 'is updating...'
          key_file = boto.s3.key.Key(bucket)
          key_file.key = s3_file_path
          key_file.set_contents_from_filename(local_file_path)
          key_file.make_public()
        else:
          print 'is up to date.'

    # If we got here with no exceptions, changes have been committed
    success = True

  # Boto provides little in the way of exception handling, need a blanket
  except Exception, e:
    print e

  return results_printer.print_result('Changes', 'committed', success)
