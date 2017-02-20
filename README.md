# README

Skyhub is a microservice that imports photos from an endpoint (http://54.152.221.29/images.json)
to an mongoDB instance through a service that creates small (320x240), medium (384x288) and large (640x480)
versions of the images and then serve this photos in a API.

# Tech Specifications

To this microservice, an rails instance was created instead of a simpler framework (eg: sinatra) to make any further 
development simpler. A paperclip gem was used to maintain the Photo model clean since it uses rmagick to resize pictures.

mongoID gem was used as ORM to de mongoDB queries in order to maintain the project readability and maintenance.

For the next step, the import service should import images from the endpoint asyncronically in order to improve the 
availability of the API

For testing, RSpec was used due its high compatibility and large testing cases possibilities for the product future
development.

# Setup

Install gems:
```
$ bundle install  
```

Index models:

```
$ rake db:mongoid:create_indexes  
```

Start the Server:

```
$ rails s
```

To import the remote photos, use the rake task:

```
$ rake import_photos:import
``` 

In order to use the API:

* Index of photos:

```
http://localhost:3000/api/v1/photos.json
```

* Show a photo:

```
http://localhost:3000/api/v1/photos/{id}
```

# Testing

```
$ rake spec
```