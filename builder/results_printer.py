# We are doing 3 separate tasks here, but we want a standard report
def print_result(subject, action, success):
  modifier = ' not '
  if success == True:
    modifier = ' '
  print subject + modifier + action + '.'
