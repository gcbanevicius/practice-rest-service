This project implements a RESTful API for doing basic CRUD operations on a
JobCast (job listing) object.

Below is an outline of the API, using the example of JobCasts (it would
obviously be similar for the other two controllers):

Action:        HTTP Verb:           URL: 
=======================================================

List           GET                  /job_casts

Retrieve       GET                  /job_casts/:id

Create         POST                 /job_casts

Update         PUT/PATCH            /job_casts/:id

Destroy        DELETE               /job_casts/:id


There are also 2 "convenience forms" available as HTML pages at the
following URLS:


Action:          URL:
==========================================================

Edit            /job_casts/:id/edit

New             /job_casts/new


I test the API mainly through the rspecs in "spec/requests/" to show that 
the 5 actions of the interface (List, Retrieve, Create, Update, Destroy)
work as expect, and use JSON for data transfer.

Obviously the project isn't as fully fleshed out as it could be. This includes
the fact that the relationships between models are only partially functional.
Still, there is enough functionality to create and interact with each of the
model types via the RESTful API.

Please see the design_decisions.txt document for some analysis of design
decisions that I made.
