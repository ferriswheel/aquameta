create extension if not exists plpythonu;
create extension if not exists multicorn schema public;
create extension if not exists hstore schema public;
create extension if not exists hstore_plpythonu schema public;
create extension if not exists dblink schema public;
create extension if not exists "uuid-ossp";
create extension if not exists pgcrypto schema public;
create extension if not exists pg_catalog_get_defs schema pg_catalog;
create extension if not exists plv8;

create extension meta;
create extension bundle;

------------------------------------------------------------------------
-- bundle
------------------------------------------------------------------------
set search_path=bundle;

insert into bundle.bundle (name) values ('org.aquameta.core.bundle');

-- TODO: track the ignored_rows

-- track bundle entities
select bundle.tracked_row_add('org.aquameta.core.bundle', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='schema' and (((row_id).pk_value)::meta.schema_id).name = 'bundle';
select bundle.tracked_row_add('org.aquameta.core.bundle', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='table' and ((((row_id).pk_value)::meta.relation_id)::meta.schema_id).name = 'bundle';
select bundle.tracked_row_add('org.aquameta.core.bundle', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='column' and ((((row_id).pk_value)::meta.column_id)::meta.schema_id).name = 'bundle';

-- TODO: stage and commit


------------------------------------------------------------------------
-- email
------------------------------------------------------------------------
create extension email;


-- track meta entities
insert into bundle.bundle (name) values ('org.aquameta.core.email');

-- schema
select bundle.tracked_row_add('org.aquameta.core.email', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='schema' and (((row_id).pk_value)::meta.schema_id).name = 'email';
-- type_definition
select bundle.tracked_row_add('org.aquameta.core.email', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='type_definition' and ((((row_id).pk_value)::meta.type_id).schema_id).name = 'email';
-- table
select bundle.tracked_row_add('org.aquameta.core.email', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='table' and ((((row_id).pk_value)::meta.relation_id)::meta.schema_id).name = 'email';
-- view
select bundle.tracked_row_add('org.aquameta.core.email', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='view' and ((((row_id).pk_value)::meta.relation_id)::meta.schema_id).name = 'email';
-- column
select bundle.tracked_row_add('org.aquameta.core.email', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='column' and ((((row_id).pk_value)::meta.column_id)::meta.schema_id).name = 'email';
-- constraint_check
select bundle.tracked_row_add('org.aquameta.core.email', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='constraint_check' and (((((row_id).pk_value)::meta.constraint_id).table_id)::meta.schema_id).name = 'email';
-- foreign_key
select bundle.tracked_row_add('org.aquameta.core.email', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='foreign_key' and (((((row_id).pk_value)::meta.constraint_id).table_id)::meta.schema_id).name = 'email';
-- function_definition
select bundle.tracked_row_add('org.aquameta.core.email', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='function_definition' and ((((row_id).pk_value)::meta.function_id).schema_id).name = 'email';

select bundle.stage_row_add('org.aquameta.core.email', (row_id::meta.schema_id).name, (row_id::meta.relation_id).name, 'id', (row_id).pk_value) from bundle.tracked_row_added where bundle_id=(select id from bundle.bundle where name='org.aquameta.core.email');


select bundle.commit('org.aquameta.core.email','initial import');

drop extension email;
drop schema email;

select bundle.checkout((select head_commit_id from bundle.bundle where name='org.aquameta.core.email'));




------------------------------------------------------------------------
-- endpoint
------------------------------------------------------------------------
create extension endpoint;


-- track meta entities
insert into bundle.bundle (name) values ('org.aquameta.core.endpoint');

select bundle.tracked_row_add('org.aquameta.core.endpoint', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='schema' and (((row_id).pk_value)::meta.schema_id).name = 'endpoint';
select bundle.tracked_row_add('org.aquameta.core.endpoint', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='type_definition' and ((((row_id).pk_value)::meta.type_id).schema_id).name = 'endpoint';
select bundle.tracked_row_add('org.aquameta.core.endpoint', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='table' and ((((row_id).pk_value)::meta.relation_id)::meta.schema_id).name = 'endpoint';
select bundle.tracked_row_add('org.aquameta.core.endpoint', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='view' and ((((row_id).pk_value)::meta.relation_id)::meta.schema_id).name = 'endpoint';
select bundle.tracked_row_add('org.aquameta.core.endpoint', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='column' and ((((row_id).pk_value)::meta.column_id)::meta.schema_id).name = 'endpoint';
select bundle.tracked_row_add('org.aquameta.core.endpoint', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='constraint_check' and (((((row_id).pk_value)::meta.constraint_id).table_id)::meta.schema_id).name = 'endpoint';
select bundle.tracked_row_add('org.aquameta.core.endpoint', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='foreign_key' and (((((row_id).pk_value)::meta.constraint_id).table_id)::meta.schema_id).name = 'endpoint';
select bundle.tracked_row_add('org.aquameta.core.endpoint', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='function_definition' and ((((row_id).pk_value)::meta.function_id).schema_id).name = 'endpoint';


select bundle.stage_row_add('org.aquameta.core.endpoint', (row_id::meta.schema_id).name, (row_id::meta.relation_id).name, 'id', (row_id).pk_value) from bundle.tracked_row_added where bundle_id=(select id from bundle.bundle where name='org.aquameta.core.endpoint');

select bundle.commit('org.aquameta.core.endpoint','initial import');

drop extension endpoint;
drop schema endpoint;

select bundle.checkout((select head_commit_id from bundle.bundle where name='org.aquameta.core.endpoint'));





------------------------------------------------------------------------
-- event
------------------------------------------------------------------------
create extension event;

-- track meta entities
insert into bundle.bundle (name) values ('org.aquameta.core.event');
select bundle.tracked_row_add('org.aquameta.core.event', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='schema' and (((row_id).pk_value)::meta.schema_id).name = 'event';
select bundle.tracked_row_add('org.aquameta.core.event', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='type_definition' and ((((row_id).pk_value)::meta.type_id).schema_id).name = 'event';
select bundle.tracked_row_add('org.aquameta.core.event', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='table' and ((((row_id).pk_value)::meta.relation_id)::meta.schema_id).name = 'event';
select bundle.tracked_row_add('org.aquameta.core.event', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='view' and ((((row_id).pk_value)::meta.relation_id)::meta.schema_id).name = 'event';
select bundle.tracked_row_add('org.aquameta.core.event', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='column' and ((((row_id).pk_value)::meta.column_id)::meta.schema_id).name = 'event';
select bundle.tracked_row_add('org.aquameta.core.event', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='constraint_check' and (((((row_id).pk_value)::meta.constraint_id).table_id)::meta.schema_id).name = 'event';
select bundle.tracked_row_add('org.aquameta.core.event', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='foreign_key' and (((((row_id).pk_value)::meta.constraint_id).table_id)::meta.schema_id).name = 'event';
select bundle.tracked_row_add('org.aquameta.core.event', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='function_definition' and ((((row_id).pk_value)::meta.function_id).schema_id).name = 'event';

select bundle.stage_row_add('org.aquameta.core.event', (row_id::meta.schema_id).name, (row_id::meta.relation_id).name, 'id', (row_id).pk_value) from bundle.tracked_row_added where bundle_id=(select id from bundle.bundle where name='org.aquameta.core.event');

select bundle.commit('org.aquameta.core.event','initial import');
drop extension event;
drop schema event;
select bundle.checkout((select head_commit_id from bundle.bundle where name='org.aquameta.core.event'));


------------------------------------------------------------------------
-- widget
------------------------------------------------------------------------
create extension widget;

-- track meta entities
insert into bundle.bundle (name) values ('org.aquameta.core.widget');
select bundle.tracked_row_add('org.aquameta.core.widget', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='schema' and (((row_id).pk_value)::meta.schema_id).name = 'widget';
select bundle.tracked_row_add('org.aquameta.core.widget', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='type_definition' and ((((row_id).pk_value)::meta.type_id).schema_id).name = 'widget';
select bundle.tracked_row_add('org.aquameta.core.widget', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='table' and ((((row_id).pk_value)::meta.relation_id)::meta.schema_id).name = 'widget';
select bundle.tracked_row_add('org.aquameta.core.widget', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='view' and ((((row_id).pk_value)::meta.relation_id)::meta.schema_id).name = 'widget';
select bundle.tracked_row_add('org.aquameta.core.widget', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='column' and ((((row_id).pk_value)::meta.column_id)::meta.schema_id).name = 'widget';
select bundle.tracked_row_add('org.aquameta.core.widget', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='constraint_check' and (((((row_id).pk_value)::meta.constraint_id).table_id)::meta.schema_id).name = 'widget';
select bundle.tracked_row_add('org.aquameta.core.widget', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='foreign_key' and (((((row_id).pk_value)::meta.constraint_id).table_id)::meta.schema_id).name = 'widget';
select bundle.tracked_row_add('org.aquameta.core.widget', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='function_definition' and ((((row_id).pk_value)::meta.function_id).schema_id).name = 'widget';

select bundle.stage_row_add('org.aquameta.core.widget', (row_id::meta.schema_id).name, (row_id::meta.relation_id).name, 'id', (row_id).pk_value) from bundle.tracked_row_added where bundle_id=(select id from bundle.bundle where name='org.aquameta.core.widget');

select bundle.commit('org.aquameta.core.widget','initial import');
drop extension widget;
drop schema widget;
select bundle.checkout((select head_commit_id from bundle.bundle where name='org.aquameta.core.widget'));



------------------------------------------------------------------------
-- semantics
------------------------------------------------------------------------
create extension semantics;

-- track meta entities
insert into bundle.bundle (name) values ('org.aquameta.core.semantics');
select bundle.tracked_row_add('org.aquameta.core.semantics', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='schema' and (((row_id).pk_value)::meta.schema_id).name = 'semantics';
select bundle.tracked_row_add('org.aquameta.core.semantics', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='type_definition' and ((((row_id).pk_value)::meta.type_id).schema_id).name = 'semantics';
select bundle.tracked_row_add('org.aquameta.core.semantics', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='table' and ((((row_id).pk_value)::meta.relation_id)::meta.schema_id).name = 'semantics';
select bundle.tracked_row_add('org.aquameta.core.semantics', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='view' and ((((row_id).pk_value)::meta.relation_id)::meta.schema_id).name = 'semantics';
select bundle.tracked_row_add('org.aquameta.core.semantics', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='column' and ((((row_id).pk_value)::meta.column_id)::meta.schema_id).name = 'semantics';
select bundle.tracked_row_add('org.aquameta.core.semantics', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='constraint_check' and (((((row_id).pk_value)::meta.constraint_id).table_id)::meta.schema_id).name = 'semantics';
select bundle.tracked_row_add('org.aquameta.core.semantics', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='foreign_key' and (((((row_id).pk_value)::meta.constraint_id).table_id)::meta.schema_id).name = 'semantics';
select bundle.tracked_row_add('org.aquameta.core.semantics', row_id) from bundle.untracked_row where (row_id::meta.schema_id).name = 'meta' and (row_id::meta.relation_id).name='function_definition' and ((((row_id).pk_value)::meta.function_id).schema_id).name = 'semantics';

select bundle.stage_row_add('org.aquameta.core.semantics', (row_id::meta.schema_id).name, (row_id::meta.relation_id).name, 'id', (row_id).pk_value) from bundle.tracked_row_added where bundle_id=(select id from bundle.bundle where name='org.aquameta.core.semantics');

select bundle.commit('org.aquameta.core.semantics','initial import');
drop extension semantics;
drop schema semantics;
select bundle.checkout((select head_commit_id from bundle.bundle where name='org.aquameta.core.semantics'));




