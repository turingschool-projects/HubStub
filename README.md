## HubStub

This application provides a peer-to-peer marketplace for buying and
selling Live Event Tickets.

Visit us at [http://hubstub.herokuapp.com](http://hubstub.herokuapp.com)

### Project Dependencies

* Mandrill -- required for transactional emails -- needs `MANDRILL_USERNAME` and `MANDRILL_APIKEY` ENV vars
* Amazon S3 -- used for file uploads -- needs `S3_BUCKET_NAME`, `AWS_ACCESS_KEY_ID`, and `AWS_SECRET_ACCESS_KEY` ENV vars
* Skylight IO -- used for production performance monitoring -- Configure this by setting a `SKYLIGHT_AUTHENTICATION` environment variable
* ImageMagick -- used for resizing and cropping images in development; make sure you have it installed: `brew install imagemagick`

You'll also need to make sure Paperclip is configured in production to use
the appropriate region for the S3 Bucket you provided. This setting is found
in `config/environments/production.rb`:

```
  config.paperclip_defaults = {
    storage: :s3,
    s3_host_name: 's3.amazonaws.com', # <-- SET THIS TO YOUR REGION
    s3_credentials: {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    },
    bucket: ENV['S3_BUCKET_NAME']
  }
```

Finally, if you created a dedicated AWS "IAM" user account for this application's
S3 access, don't forget to set up an "Access Policy" for that user, giving them
"Full Access" to AWS S3 resources. More info on this step can be found [here](http://rexstjohn.com/how-to-solve-access-denied-with-heroku-paperclip-s3-ror/).

#### Contributor Log

* [ Scott Crawford ]( https://github.com/ScottCrawford03 )
* [ Bhargavi Satpathy ]( https://github.com/bhargavisatpathy )
* [ Krista Nelson ]( https://github.com/KristaANelson )
* [ Nathan Owsiany ]( https://github.com/ndwhtlssthr )
