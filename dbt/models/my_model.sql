

  create or replace view `gcp-streaming-pipeline`.`project_parquet`.`my_model`
  OPTIONS()
  as SELECT * FROM `gcp-streaming-pipeline.project_parquet.cab_trips`;

