from builder import javascript_builder, stylesheet_builder, s3_committer

javascript_builder.build_javascripts()
stylesheet_builder.build_stylesheets()
s3_committer.commit_to_s3()
print 'Task done.'
