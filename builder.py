import boto, os, time

def print_result(subject, action, success):
  modifier = ' not '
  if success == True:
    modifier = ' '
  print subject + modifier + action + '.'

def build_javascripts():
  success = False
  # code here

  return print_result('Javascripts', 'built', success)

def build_stylesheets():
  success = False
  # code here

  return print_result('Stylesheets', 'built', success)

def format_s3_date(s3_date):
  s3_time_format = '%a, %d %b %Y %H:%M:%S %Z'
  return time.mktime(time.strptime(s3_date, s3_time_format))

def commit_to_s3():
  success = False

  try:
    # Requires S3 creds, which I set as environment variables
    connection = boto.connect_s3();
    bucket = connection.lookup('www.michgarbacz.com')

    for directory, subdirectories, files in os.walk('web-content'):
      for filename in files:
        local_file_path = os.path.join(directory, filename)
        # For s3, we don't want the 'web-content' part of file path
        s3_file_path = local_file_path[12:]

        print filename,
        local_last_modified = os.path.getmtime(local_file_path)
        s3_last_modified = format_s3_date(bucket
          .get_key(s3_file_path).last_modified)

        # Is the local modified date newer than s3 modified date?
        if (local_last_modified > s3_last_modified):
          key_file = boto.s3.key.Key(bucket)
          key_file.key = s3_file_path
          print 'is updating...'
          key_file.set_contents_from_filename(local_file_path)
          key_file.make_public()
        else:
          print 'is up to date.'

    success = True

  except Exception, e:
    print e

  return print_result('Changes', 'committed', success)

build_javascripts()
build_stylesheets()
commit_to_s3()
print 'Task done.'
