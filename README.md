# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

GRANT ALL PRIVILEGES ON TABLE properties TO postgres;
GRANT ALL PRIVILEGES ON SEQUENCE ar_internal_metadata_id_seq TO postgres;

GRANT ALL PRIVILEGES ON DATABASE r_ruby TO postgres;
GRANT ALL PRIVILEGES ON TABLE ar_internal_metadata TO postgres;

ALTER DATABASE r_ruby OWNER TO postgres;
GRANT ALL PRIVILEGES ON DATABASE svp-r_ruby to postgres;
GRANT ALL PRIVILEGES ON TABLE ar_internal_metadata TO postgres;


