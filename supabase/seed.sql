SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.7 (Ubuntu 15.7-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', 'df925de2-26fc-443b-ba1a-3b24451d60fc', '{"action":"user_signedup","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2024-10-13 00:09:46.311911+00', ''),
	('00000000-0000-0000-0000-000000000000', '952d6357-e7dd-4ebc-b020-406ecdc3d7de', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-13 00:09:46.317828+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b5f07687-fcc7-4116-b7e1-1aaee53c65a9', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-13 02:19:57.69212+00', ''),
	('00000000-0000-0000-0000-000000000000', '1b1192ab-7872-4441-a21c-3a0a922f59a2', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-13 02:19:57.692715+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e71a5668-1cc0-46b4-943d-42ae0e90bc5d', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-14 15:45:13.168608+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad11b9dc-7526-43bb-8d08-f9fcfb36c8da', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-14 15:45:13.169931+00', ''),
	('00000000-0000-0000-0000-000000000000', '2bfb46aa-9c28-471b-86a6-0bb99d866437', '{"action":"logout","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-10-14 16:28:36.382137+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f142a22e-133b-4c27-8cfd-3c652051b8fe', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-14 16:31:38.195333+00', ''),
	('00000000-0000-0000-0000-000000000000', '04cb79ac-b030-401a-a559-a90d1f997f94', '{"action":"logout","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-10-14 16:49:02.184299+00', ''),
	('00000000-0000-0000-0000-000000000000', '48082654-86aa-48a4-b6dc-bde788bdf1c2', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-14 16:49:30.397024+00', ''),
	('00000000-0000-0000-0000-000000000000', '52fe6d00-23c7-4ab5-a764-4b5f2bf00c26', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-14 17:50:17.802204+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f5016cd1-97a4-42bd-9150-e7e5705656a2', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-14 17:50:17.802654+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bedfae19-c95b-4e04-823c-6971b8f0c595', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-14 18:48:46.100506+00', ''),
	('00000000-0000-0000-0000-000000000000', 'da23bc21-b8c9-401e-96b0-2ad81d3e9f33', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-14 18:48:46.100961+00', ''),
	('00000000-0000-0000-0000-000000000000', '646e7c87-38d7-4253-ab77-9ea0758c8e90', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-14 22:42:39.663446+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a1c7eb71-55b6-452e-8463-50f530f919d1', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-14 22:42:39.663936+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd3c67037-2200-4198-825f-2905c61fe2c7', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-14 23:45:22.482883+00', ''),
	('00000000-0000-0000-0000-000000000000', '56394863-53cd-4bcc-ae12-ec30207851d0', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-14 23:45:22.483307+00', ''),
	('00000000-0000-0000-0000-000000000000', '5266f5c5-9f1f-4285-b3e1-5edc8560c1ec', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 16:05:30.01756+00', ''),
	('00000000-0000-0000-0000-000000000000', '7828afd6-6707-4e82-b757-84e5b03c6ebb', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 16:05:30.018851+00', ''),
	('00000000-0000-0000-0000-000000000000', '4dd8045e-a113-4f1a-8b2e-95c1d94d486e', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 17:13:34.748009+00', ''),
	('00000000-0000-0000-0000-000000000000', '5594b9bd-eb9c-496f-827a-34c1adf72c50', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 17:13:34.748453+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dba80680-3c4d-4b65-85f7-a5ca19d85a37', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 18:46:21.093218+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b2cdcea7-1469-41fd-85e6-1f4ff0663985', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 18:46:21.093755+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a2e6b9af-76e0-4233-a5f9-cdedd68300cb', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 20:36:40.716529+00', ''),
	('00000000-0000-0000-0000-000000000000', '4831b014-a693-4891-9296-f173e5a8d3b9', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 20:36:40.717017+00', ''),
	('00000000-0000-0000-0000-000000000000', '7fbf76f3-e41c-4fbf-90d8-11524ebf525f', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 21:46:13.910321+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e5aff6c3-1020-499f-8ede-ed349e188194', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 21:46:13.910751+00', ''),
	('00000000-0000-0000-0000-000000000000', '5d9bd81a-60b0-4f7f-b041-62e0a57379e6', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 22:54:55.221782+00', ''),
	('00000000-0000-0000-0000-000000000000', '6540b656-615a-4b71-b9f8-e5b275ae1641', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-15 22:54:55.222222+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c97d9e35-34bd-4d32-bf15-bab986887249', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-16 00:05:06.204785+00', ''),
	('00000000-0000-0000-0000-000000000000', '265ed766-f71b-43c5-80dc-6791fb8eca2b', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-16 00:05:06.205311+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e3ccfe3-3fbf-42b8-a871-3c0ac031d2b0', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-16 22:57:20.303454+00', ''),
	('00000000-0000-0000-0000-000000000000', '19b5680d-065f-4a36-bc6c-c622709a8f60', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-16 22:57:20.304872+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c3d7ad9a-9f4b-4386-b732-f4c90544edb4', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-16 23:22:21.872892+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e03b18e-c8c4-4ea5-b007-c323ec23f482', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-16 23:55:26.29216+00', ''),
	('00000000-0000-0000-0000-000000000000', '7f23ac0e-6185-4b47-808a-d8ca83771cec', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-16 23:55:26.292667+00', ''),
	('00000000-0000-0000-0000-000000000000', '4eed2ebb-2915-4cba-91c5-7a4e82ca2b68', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-17 01:18:29.940339+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c11fe779-09da-44a4-a94b-78bfb307960d', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-17 01:18:29.940807+00', ''),
	('00000000-0000-0000-0000-000000000000', '21f38900-0e5d-4869-9173-f262885579ad', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-17 19:44:07.586609+00', ''),
	('00000000-0000-0000-0000-000000000000', '089f6ca7-f9d6-4c77-ac23-ad3574fa33a4', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-17 19:44:07.588412+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fb4a36c7-f142-4a12-b7e5-4645b410a215', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-17 20:42:20.798646+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a0819337-253a-47fa-bc23-fa60506cf2be', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-17 20:42:20.799166+00', ''),
	('00000000-0000-0000-0000-000000000000', '9b70fbde-f794-4f42-a5b7-c258dc4cea6a', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-17 21:52:23.017696+00', ''),
	('00000000-0000-0000-0000-000000000000', '62d102e5-cd14-4aae-8473-01c7da09ddaa', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-17 21:52:23.018116+00', ''),
	('00000000-0000-0000-0000-000000000000', 'eda47e55-5633-4581-a17c-5d4f0640109c', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-17 23:20:53.214455+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ffa2a1d5-4ef6-4aed-9fb3-7b36d85d7984', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-17 23:20:53.214916+00', ''),
	('00000000-0000-0000-0000-000000000000', '751231de-ad06-4ffa-84cc-092dc279c99d', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 00:33:00.507949+00', ''),
	('00000000-0000-0000-0000-000000000000', '925aec5b-41fd-4f60-9855-4bb2b51c4110', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 00:33:00.508329+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dd0c0bdc-07b9-4cfe-95cc-3280f58ec88c', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 01:34:44.34761+00', ''),
	('00000000-0000-0000-0000-000000000000', '049eac86-b9b6-4085-8093-fc42e065fc87', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 01:34:44.347996+00', ''),
	('00000000-0000-0000-0000-000000000000', '6c8e4979-a929-4d55-977b-a11ce3dab1bb', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 18:18:14.63397+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7082f6b-6e60-46a9-845a-3281facfb3b5', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 18:18:14.635689+00', ''),
	('00000000-0000-0000-0000-000000000000', '186ddcdc-bdff-421d-a90c-8eea2240ac53', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 19:38:46.027346+00', ''),
	('00000000-0000-0000-0000-000000000000', '4a79cc38-18b3-468e-8fd8-b3e8856bc30c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 19:38:46.02782+00', ''),
	('00000000-0000-0000-0000-000000000000', '15d0c346-6909-4f2e-ae19-8d0aa71ec4e4', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 21:54:07.960601+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd5c3a29d-0544-41c8-b93b-f224b3843142', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 21:54:07.961071+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ede0aaf8-a800-4ec1-9ae9-ae118e2ca86e', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 23:09:08.222174+00', ''),
	('00000000-0000-0000-0000-000000000000', '17d79b3b-7a84-4c5a-8b4f-0a9bd5b206bf', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-18 23:09:08.222728+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd26ab577-2b7d-42c4-ba14-0f3f42348831', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-19 17:37:51.755757+00', ''),
	('00000000-0000-0000-0000-000000000000', '15de281e-d8d7-4b4a-b813-788cbe549bc8', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-19 17:37:51.757246+00', ''),
	('00000000-0000-0000-0000-000000000000', '17726b60-cb9a-4db6-86ac-7ebc4e80c383', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-19 19:30:40.855844+00', ''),
	('00000000-0000-0000-0000-000000000000', '9e2e9d20-1a30-4ad5-833b-b55ab57c8ed0', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-19 19:30:40.856413+00', ''),
	('00000000-0000-0000-0000-000000000000', '01731ee5-27fb-405b-a32c-ec7526c60873', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-19 20:31:05.08818+00', ''),
	('00000000-0000-0000-0000-000000000000', '08866f35-a3f9-4e28-82ea-284f2e1e1cac', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-19 20:31:05.088679+00', ''),
	('00000000-0000-0000-0000-000000000000', '68b3a0da-510d-4221-a175-5d76bebf72ad', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-19 23:06:30.981812+00', ''),
	('00000000-0000-0000-0000-000000000000', '3113afe3-c5d6-4fb1-9af2-8b93c893875c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-19 23:06:30.982239+00', ''),
	('00000000-0000-0000-0000-000000000000', '132d48af-3739-4dd3-8c98-24ba8ce594f3', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-20 00:19:35.445456+00', ''),
	('00000000-0000-0000-0000-000000000000', 'edf06e66-3bf1-4af9-96e3-ab46bdcdc9da', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-20 00:19:35.445867+00', ''),
	('00000000-0000-0000-0000-000000000000', '7ebd85d5-8c0f-465e-ab04-41cb48c787c5', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-22 02:46:13.617298+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd985bb31-91e7-4230-b8bf-e3e0ecc13262', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 14:04:55.330904+00', ''),
	('00000000-0000-0000-0000-000000000000', '3f59def3-ca1f-4b19-a624-da06fe0487bc', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 14:04:55.334485+00', ''),
	('00000000-0000-0000-0000-000000000000', '4b27284f-ac48-46d2-9941-ea3efa4ae953', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 15:03:11.460529+00', ''),
	('00000000-0000-0000-0000-000000000000', '4d6f3462-7457-4067-a006-9fb7572a5681', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 15:03:11.461006+00', ''),
	('00000000-0000-0000-0000-000000000000', '5335f192-6ddf-4f90-8964-eaff2073e667', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 16:36:09.457723+00', ''),
	('00000000-0000-0000-0000-000000000000', '5b68319e-855a-4f65-aecd-f6b1af256644', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 16:36:09.458137+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd9889f85-482e-474d-9206-eac0606d80a7', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 18:18:37.070292+00', ''),
	('00000000-0000-0000-0000-000000000000', '5067aa61-267b-40e5-849b-8f33e25840ec', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 18:18:37.070831+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fa152863-12fd-4c6d-9464-52c1aa1eff65', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 21:10:50.951009+00', ''),
	('00000000-0000-0000-0000-000000000000', '19a9e208-7d30-4065-8cd2-d8595d90138a', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 21:10:50.951592+00', ''),
	('00000000-0000-0000-0000-000000000000', '92be80ac-178a-44ee-a29d-5e80618b7da1', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 22:53:11.050065+00', ''),
	('00000000-0000-0000-0000-000000000000', '9b08762d-0c54-4b2d-a00d-42758e8680ef', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 22:53:11.05066+00', ''),
	('00000000-0000-0000-0000-000000000000', '80114295-e9aa-4a2f-8ac6-2d1b46460296', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 23:51:13.278388+00', ''),
	('00000000-0000-0000-0000-000000000000', '8f0d73db-dc66-4278-b6a4-beaaf4d0f7ce', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-22 23:51:13.278892+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc1a49f2-ffc9-403f-a596-7ed5d9d7f0ee', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 00:05:23.013166+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7ccebc4-3273-4000-9fcd-44389ee900a6', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 00:05:23.013872+00', ''),
	('00000000-0000-0000-0000-000000000000', '235a6bb6-acb7-4d95-bc3f-68384872fc17', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 01:45:25.410815+00', ''),
	('00000000-0000-0000-0000-000000000000', '6221a814-966f-49cd-b328-816f81603f50', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 01:45:25.411268+00', ''),
	('00000000-0000-0000-0000-000000000000', '1c31d537-6117-4081-8eee-250b6a0ee10c', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 02:56:02.303784+00', ''),
	('00000000-0000-0000-0000-000000000000', '54975561-a735-4cde-a12f-5c2c36364c6f', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 02:56:02.304245+00', ''),
	('00000000-0000-0000-0000-000000000000', '625014de-7a11-4a81-8cce-e94881549759', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 16:02:00.93149+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c68cf74f-e604-4b12-bd0b-6ef40c135f39', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 16:02:00.932872+00', ''),
	('00000000-0000-0000-0000-000000000000', '01290f58-da23-4473-8492-efcdf8834223', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 17:04:59.838997+00', ''),
	('00000000-0000-0000-0000-000000000000', '13acd78e-0f7d-4b97-a3d6-62f3d1b9c888', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 17:04:59.839427+00', ''),
	('00000000-0000-0000-0000-000000000000', '3a1b381b-ae44-49b9-8ace-350df9c4e7a4', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 17:52:43.409581+00', ''),
	('00000000-0000-0000-0000-000000000000', '518c92ab-9466-483a-83d0-ed4459dfe00e', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 17:52:43.410163+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e4abe37d-bbba-4d87-b771-ea95cd8fae53', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 18:09:43.777166+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e836874e-f6b3-49d6-8a22-273365e97a1e', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 18:09:43.777644+00', ''),
	('00000000-0000-0000-0000-000000000000', '94581d44-9b9c-4a05-aa0b-8f2ff9eb5692', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 19:08:04.571112+00', ''),
	('00000000-0000-0000-0000-000000000000', '9c22b53f-2389-49ab-bad0-3c8692e21b70', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 19:08:04.571539+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a1d619e8-5956-49c4-a633-7d039b2a7ed5', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 20:06:38.525065+00', ''),
	('00000000-0000-0000-0000-000000000000', '9e3f904a-272b-4424-8920-1bd6b9615807', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 20:06:38.525553+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a216c68a-aa58-47e9-83ef-462d3e14956f', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 21:16:45.330711+00', ''),
	('00000000-0000-0000-0000-000000000000', '2c8f2086-9718-40a2-ad1d-3f7c5031b1c0', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 21:16:45.331226+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b352ad6-6e0d-4ee2-8af1-6891e97b09df', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 22:15:08.142407+00', ''),
	('00000000-0000-0000-0000-000000000000', '82aed041-9a5e-4745-94d3-dcb449b462a4', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 22:15:08.142952+00', ''),
	('00000000-0000-0000-0000-000000000000', '442eaef7-3492-487d-8e22-47b196f5a0b4', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 23:13:25.716827+00', ''),
	('00000000-0000-0000-0000-000000000000', '135cad74-0120-4ccd-bf98-ee34ad722e5c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-23 23:13:25.717304+00', ''),
	('00000000-0000-0000-0000-000000000000', '0022e243-feb5-4a55-9c44-448ef346a682', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 00:11:28.39247+00', ''),
	('00000000-0000-0000-0000-000000000000', '3a7f0f46-1620-41ea-a5f2-8eeaadabb8de', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 00:11:28.392949+00', ''),
	('00000000-0000-0000-0000-000000000000', '3012f5b4-8bd3-492b-8512-c6baf3f0b8e5', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 02:40:29.728205+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bfda337f-bfa0-4e08-b7cb-d65394dffac7', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 02:40:29.728694+00', ''),
	('00000000-0000-0000-0000-000000000000', '2222f852-52a7-4de8-a26d-d199e06ee5f7', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 14:15:01.53197+00', ''),
	('00000000-0000-0000-0000-000000000000', '0899d567-04da-4a02-a8a4-c7566f8c1fed', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 14:15:01.533602+00', ''),
	('00000000-0000-0000-0000-000000000000', '9a04ea2e-f291-45a4-92be-bfefad8a7c6a', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 15:18:04.244823+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ae4239bd-336d-4181-afc7-19d6355ddc4b', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 15:18:04.245335+00', ''),
	('00000000-0000-0000-0000-000000000000', '80a7542d-28b5-4940-9619-f636160e36b3', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 18:36:24.888803+00', ''),
	('00000000-0000-0000-0000-000000000000', '44206431-243b-45f7-97d4-9f33e985f5b8', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 18:36:24.889269+00', ''),
	('00000000-0000-0000-0000-000000000000', '85f09433-9989-464f-8fef-838da12f0d19', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 20:23:15.902034+00', ''),
	('00000000-0000-0000-0000-000000000000', '98c0701b-f8e2-4e31-8053-232d61465ebc', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 20:23:15.90253+00', ''),
	('00000000-0000-0000-0000-000000000000', '30d485a4-ff20-48fa-bb3b-804376c7f318', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 21:21:32.795877+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b1db64d-296b-470b-8a63-81987f9a3ff5', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 21:21:32.796304+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b77bd59a-d220-4db4-903b-29d8654f6963', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 22:22:17.740152+00', ''),
	('00000000-0000-0000-0000-000000000000', '6059bb2e-8717-49ab-82b3-a32d173dab14', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 22:22:17.740698+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c449653f-f93d-4b5a-81b1-0d101f06a254', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 23:20:35.761061+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f4960283-8d7d-4b2f-8a0d-aab30c4cd6cf', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-24 23:20:35.761498+00', ''),
	('00000000-0000-0000-0000-000000000000', '9481d331-b901-4011-83bc-822184370e0d', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 00:39:45.326668+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a138a044-e44a-4637-90b1-a888b690837c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 00:39:45.327087+00', ''),
	('00000000-0000-0000-0000-000000000000', '5ad5e20a-d1c3-40ea-9fa6-9b5e36669762', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 01:46:16.292902+00', ''),
	('00000000-0000-0000-0000-000000000000', '3117afd5-d696-43d8-8536-9450ba053f69', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 01:46:16.293335+00', ''),
	('00000000-0000-0000-0000-000000000000', '67d336e4-688b-425c-9c85-c43f6f910ba8', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 02:44:43.281895+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ce6d7ae6-7dd8-4539-bd6b-e47dfef40d03', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 02:44:43.282365+00', ''),
	('00000000-0000-0000-0000-000000000000', '7ce9eba8-cd17-4eb8-a1fc-915135437609', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 14:43:16.735558+00', ''),
	('00000000-0000-0000-0000-000000000000', '777bd920-3bfa-432e-9b8e-3ca6ace0f74c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 14:43:16.737411+00', ''),
	('00000000-0000-0000-0000-000000000000', '83ad4f30-08c9-4e2d-9add-10249a179844', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 16:17:47.984368+00', ''),
	('00000000-0000-0000-0000-000000000000', '92ead70d-8909-48df-aff7-4b1069a58bd1', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 16:17:47.984901+00', ''),
	('00000000-0000-0000-0000-000000000000', '0eb940e7-35ac-48bc-b07a-726b6e2ea7a8', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 17:30:46.400736+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f19e90a8-c04b-4f22-839b-2ecd9ed0b2ee', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 17:30:46.401235+00', ''),
	('00000000-0000-0000-0000-000000000000', '13bf56e2-35f5-4665-939d-5b25aaa58b64', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 18:23:30.212188+00', ''),
	('00000000-0000-0000-0000-000000000000', '97b39af5-8877-41ac-bb45-67fc4bc37714', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 18:23:30.212897+00', ''),
	('00000000-0000-0000-0000-000000000000', '3afb9921-3e8f-4112-b1f2-5d4367636000', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 18:38:17.607458+00', ''),
	('00000000-0000-0000-0000-000000000000', '75da2fa1-9bd6-41d3-b7e9-f6db44e65176', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 18:38:17.607967+00', ''),
	('00000000-0000-0000-0000-000000000000', '1892769d-e241-4c7a-b071-749449067029', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 19:21:30.936224+00', ''),
	('00000000-0000-0000-0000-000000000000', '65fa11b7-f11d-4601-a5bb-efaba2776fe7', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 19:21:30.936839+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b4c64563-f795-454e-ba1b-a18b6ee64535', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 20:38:59.477973+00', ''),
	('00000000-0000-0000-0000-000000000000', '43c2ab05-ae0c-42a5-807c-f006c9b6d614', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 20:38:59.478621+00', ''),
	('00000000-0000-0000-0000-000000000000', '4c1f8b4b-e7ef-4c2a-954f-e2156d210573', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 20:59:24.216694+00', ''),
	('00000000-0000-0000-0000-000000000000', '2ba2013b-e699-410b-8a8e-389a38b4ad9a', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 20:59:24.217218+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a29d7401-b4a1-4b3e-aeb1-360de9d82ddd', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 21:57:30.915351+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd85708c8-c023-42f4-97de-1abd97e42a4c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 21:57:30.915819+00', ''),
	('00000000-0000-0000-0000-000000000000', '85e181ac-ee02-412b-b616-cb65656606e9', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 22:55:51.746946+00', ''),
	('00000000-0000-0000-0000-000000000000', '99d5eeb2-106a-4d6f-a274-39a27a475b88', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-25 22:55:51.747463+00', ''),
	('00000000-0000-0000-0000-000000000000', 'edf8d1b9-0847-4b6d-ac1e-c03c77fc3cde', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 16:21:28.934274+00', ''),
	('00000000-0000-0000-0000-000000000000', '151db108-5aec-4e43-8409-c6cef829accc', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 16:21:28.940035+00', ''),
	('00000000-0000-0000-0000-000000000000', '5a166e4b-4195-4c60-9ec3-927d2ec97693', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 17:32:51.258434+00', ''),
	('00000000-0000-0000-0000-000000000000', '1b1eb5de-e02f-43e2-abfc-b1a0c85a150c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 17:32:51.259122+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd3627e3d-0f35-4bb7-b45e-c878f52e0cdc', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 18:13:07.223139+00', ''),
	('00000000-0000-0000-0000-000000000000', '20dc9a39-7714-44fe-b261-d653c97dc1d3', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 18:13:07.223612+00', ''),
	('00000000-0000-0000-0000-000000000000', '9ce3258d-d4da-4ab0-b0d1-70338b36abaf', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 18:31:05.95468+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fa5f9abd-db48-4435-bae9-2fafcdc6dba3', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 18:31:05.95511+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b0471d9-dab3-4831-bf4d-ca34d362b920', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 19:12:58.232201+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f682d74e-ff26-4c40-af7f-0ab1b69c5e03', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 19:12:58.232684+00', ''),
	('00000000-0000-0000-0000-000000000000', '91572a0d-97d7-4b32-ad45-630f23f7d361', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 19:29:05.956409+00', ''),
	('00000000-0000-0000-0000-000000000000', 'db9d6a0d-7f90-4ce7-8090-a434f7b9e44e', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 19:29:05.956854+00', ''),
	('00000000-0000-0000-0000-000000000000', 'eb85be84-3156-446a-a7b5-6e8e322248d8', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 20:11:18.439117+00', ''),
	('00000000-0000-0000-0000-000000000000', '44c5dca7-7fe9-4980-a1b9-3f786b41c582', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 20:11:18.439656+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dc2279f7-9903-434f-9123-b1568225b66d', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 20:27:05.955737+00', ''),
	('00000000-0000-0000-0000-000000000000', '3c551519-9db9-406a-91e1-7aa7fcda9bed', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 20:27:05.95621+00', ''),
	('00000000-0000-0000-0000-000000000000', '29f72a78-7426-4c81-8c62-87e9001158ba', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 21:09:42.690796+00', ''),
	('00000000-0000-0000-0000-000000000000', '831ea95f-f938-4ac8-88e5-e8dd10e7d637', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 21:09:42.691257+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ac863c4b-c95f-4c4f-97f5-625142b754b3', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 21:25:05.946037+00', ''),
	('00000000-0000-0000-0000-000000000000', '03f9d195-eb29-4dca-a800-af4fd20dbaf9', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 21:25:05.946493+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c45937e0-1b51-4b71-ad49-56efcbebe5de', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 22:08:49.656298+00', ''),
	('00000000-0000-0000-0000-000000000000', '735f1b68-ef1d-4c70-a240-977d90398790', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 22:08:49.656761+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7fdab64-c6a3-4084-a288-eacd181e18f7', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 22:23:05.953742+00', ''),
	('00000000-0000-0000-0000-000000000000', '05d6ebb9-514d-43c7-b568-7e3c6a4d78bd', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 22:23:05.95425+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a9d0a283-edcb-4660-a16e-930f82597767', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 23:21:31.524135+00', ''),
	('00000000-0000-0000-0000-000000000000', '070ed704-d858-405c-96a2-0cde90d45e79', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 23:21:31.524576+00', ''),
	('00000000-0000-0000-0000-000000000000', '45cd5160-184e-4069-b0a3-a82fd2f4a1cd', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 23:24:45.220364+00', ''),
	('00000000-0000-0000-0000-000000000000', '2fc9fc00-5957-41c5-9c83-34e29b588395', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-26 23:24:45.220799+00', ''),
	('00000000-0000-0000-0000-000000000000', '5a54003a-cd0f-4b1f-a0ee-b4c515ee839b', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-27 00:19:31.514893+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fd7d9f23-0068-48ac-ab09-12e0819d0575', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-27 00:19:31.5153+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad8dd53e-79a1-4814-9fc4-8b8045fcce3b', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-27 01:17:31.524255+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aba52950-ca04-4055-b0c0-cc2d0e5a2041', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-27 01:17:31.524834+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', '222ef0a9-957b-47d6-a896-685347876113', 'authenticated', 'authenticated', 'aryan.kh88@gmail.com', '$2a$10$IHQ1o4Rn/Lpx3IoaH5AWwe5ZKNytceTBsDgU1dX.DSeoslXuZf9AG', '2024-10-13 00:09:46.31406+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-10-22 02:46:13.619507+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "222ef0a9-957b-47d6-a896-685347876113", "email": "aryan.kh88@gmail.com", "email_verified": false, "phone_verified": false}', NULL, '2024-10-13 00:09:46.304328+00', '2024-10-27 01:17:31.526383+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('222ef0a9-957b-47d6-a896-685347876113', '222ef0a9-957b-47d6-a896-685347876113', '{"sub": "222ef0a9-957b-47d6-a896-685347876113", "email": "aryan.kh88@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-10-13 00:09:46.309591+00', '2024-10-13 00:09:46.309618+00', '2024-10-13 00:09:46.309618+00', 'ab371971-fd85-4d09-9683-96223e067d5b');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('aa569d28-5caa-415d-a60e-8491bd8ff01e', '222ef0a9-957b-47d6-a896-685347876113', '2024-10-16 23:22:21.873517+00', '2024-10-17 01:18:29.943039+00', NULL, 'aal1', NULL, '2024-10-17 01:18:29.942999', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', '172.18.0.1', NULL),
	('be663800-146a-4121-8446-5a4b0a97d62b', '222ef0a9-957b-47d6-a896-685347876113', '2024-10-14 16:49:30.397664+00', '2024-10-26 23:24:45.222588+00', NULL, 'aal1', NULL, '2024-10-26 23:24:45.222546', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '172.18.0.1', NULL),
	('035420e0-1729-4b5b-b46f-e0fefcccaf81', '222ef0a9-957b-47d6-a896-685347876113', '2024-10-22 02:46:13.619547+00', '2024-10-27 01:17:31.52721+00', NULL, 'aal1', NULL, '2024-10-27 01:17:31.527172', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '172.18.0.1', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('be663800-146a-4121-8446-5a4b0a97d62b', '2024-10-14 16:49:30.399285+00', '2024-10-14 16:49:30.399285+00', 'password', 'b688d146-3913-414d-b61c-cc12030a9ec1'),
	('aa569d28-5caa-415d-a60e-8491bd8ff01e', '2024-10-16 23:22:21.875386+00', '2024-10-16 23:22:21.875386+00', 'password', '387f6526-6b29-4072-aed8-dc22390765d6'),
	('035420e0-1729-4b5b-b46f-e0fefcccaf81', '2024-10-22 02:46:13.626249+00', '2024-10-22 02:46:13.626249+00', 'password', '8dad66b9-4e66-444c-810f-ee7279336633');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 5, 'xBSSAFIKE4Wux3nua9Wq5g', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-14 16:49:30.398308+00', '2024-10-14 17:50:17.803007+00', NULL, 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 6, 'jpvPS0a9Z1KXmjmJR81bzg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-14 17:50:17.803231+00', '2024-10-14 18:48:46.101405+00', 'xBSSAFIKE4Wux3nua9Wq5g', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 7, 'jrcCTqJaa1DsQDefohUq_w', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-14 18:48:46.101637+00', '2024-10-14 22:42:39.664339+00', 'jpvPS0a9Z1KXmjmJR81bzg', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 8, 'tkBFSYS5_TYr5SR_rocR1w', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-14 22:42:39.664575+00', '2024-10-14 23:45:22.483703+00', 'jrcCTqJaa1DsQDefohUq_w', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 9, 'a2WaMUSw2QJTEqPoP36muQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-14 23:45:22.483918+00', '2024-10-15 16:05:30.019277+00', 'tkBFSYS5_TYr5SR_rocR1w', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 10, '-_dRrf_ukqlStx18AbbxOA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-15 16:05:30.019735+00', '2024-10-15 17:13:34.748876+00', 'a2WaMUSw2QJTEqPoP36muQ', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 11, 'ysSkfs4So2yLkxWgb4G0dg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-15 17:13:34.749068+00', '2024-10-15 18:46:21.094209+00', '-_dRrf_ukqlStx18AbbxOA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 12, 'ECoAlomJAELfS327hD4CXg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-15 18:46:21.094437+00', '2024-10-15 20:36:40.71743+00', 'ysSkfs4So2yLkxWgb4G0dg', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 13, 'xeoinVw-okOUr7r6cTATRg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-15 20:36:40.717698+00', '2024-10-15 21:46:13.911081+00', 'ECoAlomJAELfS327hD4CXg', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 14, 'XdCST8hOg5n1RWGEU2xREA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-15 21:46:13.911314+00', '2024-10-15 22:54:55.222619+00', 'xeoinVw-okOUr7r6cTATRg', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 15, 'f7qnIZMJPHV8UoxrdytXqw', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-15 22:54:55.222874+00', '2024-10-16 00:05:06.205776+00', 'XdCST8hOg5n1RWGEU2xREA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 16, '4xE20oapyfalKB_zVIOmXw', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-16 00:05:06.20597+00', '2024-10-16 22:57:20.305359+00', 'f7qnIZMJPHV8UoxrdytXqw', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 17, 'CC1I1D6hXEaYwu05l-zMHA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-16 22:57:20.305854+00', '2024-10-16 23:55:26.293133+00', '4xE20oapyfalKB_zVIOmXw', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 18, 'BHwQny4H95JNMdCok8LgJg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-16 23:22:21.87434+00', '2024-10-17 01:18:29.941246+00', NULL, 'aa569d28-5caa-415d-a60e-8491bd8ff01e'),
	('00000000-0000-0000-0000-000000000000', 20, 'zAjPGCSBE20BbVj9CDJ1Yg', '222ef0a9-957b-47d6-a896-685347876113', false, '2024-10-17 01:18:29.941491+00', '2024-10-17 01:18:29.941491+00', 'BHwQny4H95JNMdCok8LgJg', 'aa569d28-5caa-415d-a60e-8491bd8ff01e'),
	('00000000-0000-0000-0000-000000000000', 19, '7N7pViuVaxczwg3xhZzkDA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-16 23:55:26.293397+00', '2024-10-17 19:44:07.588857+00', 'CC1I1D6hXEaYwu05l-zMHA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 21, 'RnEUMgT8pCgytjrljdUPbQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-17 19:44:07.58933+00', '2024-10-17 20:42:20.799506+00', '7N7pViuVaxczwg3xhZzkDA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 22, 'NazVrCC1l620hy7mNpchRQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-17 20:42:20.79978+00', '2024-10-17 21:52:23.018469+00', 'RnEUMgT8pCgytjrljdUPbQ', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 23, 'WPhHec2Yu8Y4wWCHECIb8w', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-17 21:52:23.018684+00', '2024-10-17 23:20:53.215277+00', 'NazVrCC1l620hy7mNpchRQ', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 24, '6Lmkp9-2-o8uHb0FVYUD0w', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-17 23:20:53.215504+00', '2024-10-18 00:33:00.508696+00', 'WPhHec2Yu8Y4wWCHECIb8w', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 25, 'Vr10zl5cjOpq9kk9vMeLbg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-18 00:33:00.508932+00', '2024-10-18 01:34:44.348384+00', '6Lmkp9-2-o8uHb0FVYUD0w', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 26, '7OiJu-L5XUOolkMZeuv6YQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-18 01:34:44.348598+00', '2024-10-18 18:18:14.636112+00', 'Vr10zl5cjOpq9kk9vMeLbg', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 27, 'QRGOCT5ou21aBnjxnKTY0A', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-18 18:18:14.636579+00', '2024-10-18 19:38:46.028214+00', '7OiJu-L5XUOolkMZeuv6YQ', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 28, 'UoXW9zMgbEJXglw6bun1oA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-18 19:38:46.028454+00', '2024-10-18 21:54:07.961501+00', 'QRGOCT5ou21aBnjxnKTY0A', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 29, 'QetHnES8z0lJKPKCvH4iAw', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-18 21:54:07.961758+00', '2024-10-18 23:09:08.22322+00', 'UoXW9zMgbEJXglw6bun1oA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 30, 'luy1pWfJM46lnDvO40wkNg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-18 23:09:08.223515+00', '2024-10-19 17:37:51.757654+00', 'QetHnES8z0lJKPKCvH4iAw', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 31, '7t_RJOJOZgjR6vnfuUTkDw', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-19 17:37:51.758097+00', '2024-10-19 19:30:40.856848+00', 'luy1pWfJM46lnDvO40wkNg', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 32, 'bcWNeYpTAeV3sWOr5OnkRg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-19 19:30:40.857117+00', '2024-10-19 20:31:05.089097+00', '7t_RJOJOZgjR6vnfuUTkDw', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 33, 'LoPxH2cBtjPBcjs_rhB8kA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-19 20:31:05.089338+00', '2024-10-19 23:06:30.982917+00', 'bcWNeYpTAeV3sWOr5OnkRg', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 34, 'JRZpfoxajMoT4vI630hh3w', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-19 23:06:30.983138+00', '2024-10-20 00:19:35.446276+00', 'LoPxH2cBtjPBcjs_rhB8kA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 36, 'V4qmQ8Sb1mxh7pkHN_RrnQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-22 02:46:13.622224+00', '2024-10-22 14:04:55.334976+00', NULL, '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 69, 'M4YUJ_e03OQnn8DdSwa6HQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-22 14:04:55.335475+00', '2024-10-22 15:03:11.461426+00', 'V4qmQ8Sb1mxh7pkHN_RrnQ', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 35, 'lGkgFuWXNyXY6TytCw5s5A', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-20 00:19:35.446507+00', '2024-10-22 16:36:09.458488+00', 'JRZpfoxajMoT4vI630hh3w', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 71, 'PqmK_18KwKzOIxR0sGMzTw', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-22 16:36:09.458711+00', '2024-10-22 18:18:37.071284+00', 'lGkgFuWXNyXY6TytCw5s5A', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 70, 'qeQQJQeYQ4x19Xw-L_RZAA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-22 15:03:11.461631+00', '2024-10-22 21:10:50.952038+00', 'M4YUJ_e03OQnn8DdSwa6HQ', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 73, 'G3No1PuBwKzcOW1q5n1r9g', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-22 21:10:50.952316+00', '2024-10-22 22:53:11.051172+00', 'qeQQJQeYQ4x19Xw-L_RZAA', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 74, 'OpAWrVVQRmcCt7LaAI73Jg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-22 22:53:11.051559+00', '2024-10-22 23:51:13.27929+00', 'G3No1PuBwKzcOW1q5n1r9g', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 72, 'RDwUaWCSpp0rfvPRCUAX9Q', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-22 18:18:37.071566+00', '2024-10-23 00:05:23.014603+00', 'PqmK_18KwKzOIxR0sGMzTw', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 76, '6DFrKRZNxXw5eIwbRshm4w', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 00:05:23.014877+00', '2024-10-23 01:45:25.411678+00', 'RDwUaWCSpp0rfvPRCUAX9Q', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 75, 'qWZYTh1TmHFQ_QRf7uqaeQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-22 23:51:13.279484+00', '2024-10-23 02:56:02.304677+00', 'OpAWrVVQRmcCt7LaAI73Jg', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 77, 'yk3IMFpEc2NHGny8ZiDG3A', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 01:45:25.411849+00', '2024-10-23 16:02:00.933344+00', '6DFrKRZNxXw5eIwbRshm4w', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 111, '_vFc9X1cfsHLF8uaO4vbXA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 16:02:00.933843+00', '2024-10-23 17:04:59.839806+00', 'yk3IMFpEc2NHGny8ZiDG3A', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 78, 'SK3IP7AhqLFGhsZgTM4z4A', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 02:56:02.304907+00', '2024-10-23 17:52:43.410636+00', 'qWZYTh1TmHFQ_QRf7uqaeQ', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 112, '95El1x16AZJskIgNhwe9VQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 17:04:59.840046+00', '2024-10-23 18:09:43.778094+00', '_vFc9X1cfsHLF8uaO4vbXA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 113, 'MFZmc8bKN9ydVphp7VHabg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 17:52:43.410931+00', '2024-10-25 18:23:30.213528+00', 'SK3IP7AhqLFGhsZgTM4z4A', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 114, 'hgFFMjb5vBSrrrvEZq2ZXg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 18:09:43.778338+00', '2024-10-23 19:08:04.572345+00', '95El1x16AZJskIgNhwe9VQ', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 115, 'AYeG9NqwTOK56Q5dTaU5VQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 19:08:04.572592+00', '2024-10-23 20:06:38.526007+00', 'hgFFMjb5vBSrrrvEZq2ZXg', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 116, '-cMaT_eRfDPLNlpLC6ZfDA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 20:06:38.526253+00', '2024-10-23 21:16:45.331615+00', 'AYeG9NqwTOK56Q5dTaU5VQ', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 117, 'nLXqJHM0BR8IxYOotLV63Q', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 21:16:45.331823+00', '2024-10-23 22:15:08.143395+00', '-cMaT_eRfDPLNlpLC6ZfDA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 118, '3SnyfID0H3gcDfCeflBm8Q', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 22:15:08.143597+00', '2024-10-23 23:13:25.717677+00', 'nLXqJHM0BR8IxYOotLV63Q', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 119, '1GxAynpIE7wPA3li7187eQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-23 23:13:25.717882+00', '2024-10-24 00:11:28.393341+00', '3SnyfID0H3gcDfCeflBm8Q', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 120, 'bIL8UPW1sDT-5SeNqQRBjQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-24 00:11:28.393585+00', '2024-10-24 02:40:29.729155+00', '1GxAynpIE7wPA3li7187eQ', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 121, 'd021ovGV0FH4G2zcS4BJYw', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-24 02:40:29.729379+00', '2024-10-24 14:15:01.534+00', 'bIL8UPW1sDT-5SeNqQRBjQ', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 122, '0xkIS6lqZ4tXN8v2z2kDcA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-24 14:15:01.53516+00', '2024-10-24 15:18:04.245798+00', 'd021ovGV0FH4G2zcS4BJYw', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 123, 'seZYTHRl8zJ8LI94_08RVA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-24 15:18:04.246092+00', '2024-10-24 18:36:24.889689+00', '0xkIS6lqZ4tXN8v2z2kDcA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 124, 'UG2_1KQj4kVSF9MMDPmoRA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-24 18:36:24.889945+00', '2024-10-24 20:23:15.902989+00', 'seZYTHRl8zJ8LI94_08RVA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 125, '8vk6D-GG0aXSgj4TaXXAAA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-24 20:23:15.903238+00', '2024-10-24 21:21:32.796674+00', 'UG2_1KQj4kVSF9MMDPmoRA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 126, 'hvl-7pI6yAVVFoEUsMeLuA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-24 21:21:32.796916+00', '2024-10-24 22:22:17.741137+00', '8vk6D-GG0aXSgj4TaXXAAA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 127, '6PIlowinvixldRXrwz1ymA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-24 22:22:17.741883+00', '2024-10-24 23:20:35.761986+00', 'hvl-7pI6yAVVFoEUsMeLuA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 128, 'DQ0Wr1t9ukxguPSn37x28g', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-24 23:20:35.762231+00', '2024-10-25 00:39:45.327498+00', '6PIlowinvixldRXrwz1ymA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 129, '4rrJojtRiz8Ag7WnBv4bbg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 00:39:45.327686+00', '2024-10-25 01:46:16.29374+00', 'DQ0Wr1t9ukxguPSn37x28g', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 130, 'KY5yXWx-x7JZKTj5IF5dag', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 01:46:16.293976+00', '2024-10-25 02:44:43.282732+00', '4rrJojtRiz8Ag7WnBv4bbg', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 131, 'buI9TMbpV22DcIpSHHx4bA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 02:44:43.28292+00', '2024-10-25 14:43:16.737828+00', 'KY5yXWx-x7JZKTj5IF5dag', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 132, 'yYWszkZdHWhidZZzIGGhIQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 14:43:16.738296+00', '2024-10-25 16:17:47.985352+00', 'buI9TMbpV22DcIpSHHx4bA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 133, 'ra1tgYAr21tPoRlERJ-o0w', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 16:17:47.985634+00', '2024-10-25 17:30:46.401706+00', 'yYWszkZdHWhidZZzIGGhIQ', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 134, 'jKI5xiOEpvu2nqlXzliCKA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 17:30:46.401938+00', '2024-10-25 18:38:17.608401+00', 'ra1tgYAr21tPoRlERJ-o0w', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 135, 'QB8qjCcfpVnHIYWk1WaHmw', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 18:23:30.213831+00', '2024-10-25 19:21:30.937395+00', 'MFZmc8bKN9ydVphp7VHabg', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 137, 'mL3mCvQtBn7W34LhGvSmeg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 19:21:30.937695+00', '2024-10-25 20:38:59.479234+00', 'QB8qjCcfpVnHIYWk1WaHmw', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 136, 'pZrDy3RIc70wLvX6P-Colg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 18:38:17.608644+00', '2024-10-25 20:59:24.217686+00', 'jKI5xiOEpvu2nqlXzliCKA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 139, 'C6qeRCtBswwTU8q7jokLPQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 20:59:24.217883+00', '2024-10-25 21:57:30.916272+00', 'pZrDy3RIc70wLvX6P-Colg', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 140, '-jY-yPGjCFPjZHO7B1d_0g', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 21:57:30.916492+00', '2024-10-25 22:55:51.747904+00', 'C6qeRCtBswwTU8q7jokLPQ', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 138, 'c-UevfGbQ0ANklduZuEQpA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 20:38:59.479539+00', '2024-10-26 16:21:28.940642+00', 'mL3mCvQtBn7W34LhGvSmeg', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 142, 'kZs1TamjlXPYw6yooMgbKg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 16:21:28.941281+00', '2024-10-26 17:32:51.259723+00', 'c-UevfGbQ0ANklduZuEQpA', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 141, 'S-D_u8n27VD-pBXtCuN_hA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-25 22:55:51.748126+00', '2024-10-26 18:13:07.224103+00', '-jY-yPGjCFPjZHO7B1d_0g', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 143, 'pm8LmZAQKLChsBsIxUZT4g', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 17:32:51.260043+00', '2024-10-26 18:31:05.955466+00', 'kZs1TamjlXPYw6yooMgbKg', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 144, 'vXA9sfUHY6KBSjFgbskWKA', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 18:13:07.224372+00', '2024-10-26 19:12:58.233094+00', 'S-D_u8n27VD-pBXtCuN_hA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 145, 'EbxNjy724TG4wU8LlivMKQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 18:31:05.955685+00', '2024-10-26 19:29:05.957198+00', 'pm8LmZAQKLChsBsIxUZT4g', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 146, '9HIiyA3exiL8J1M_3tC7SQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 19:12:58.233327+00', '2024-10-26 20:11:18.440412+00', 'vXA9sfUHY6KBSjFgbskWKA', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 147, 'zOJI3zUtWtx9HbIFCh_9SQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 19:29:05.957477+00', '2024-10-26 20:27:05.956639+00', 'EbxNjy724TG4wU8LlivMKQ', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 148, 'ibMUk4BMxdtwxE9GQ7Wgpg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 20:11:18.440659+00', '2024-10-26 21:09:42.691735+00', '9HIiyA3exiL8J1M_3tC7SQ', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 149, '8h12D1vYczQS0KeoWyr2Bw', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 20:27:05.956857+00', '2024-10-26 21:25:05.946833+00', 'zOJI3zUtWtx9HbIFCh_9SQ', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 150, 'flK_gtAbRvm2-spKUK-a0Q', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 21:09:42.691961+00', '2024-10-26 22:08:49.657136+00', 'ibMUk4BMxdtwxE9GQ7Wgpg', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 151, 'PC_Ia-Do_CLCJSveioBJOg', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 21:25:05.947053+00', '2024-10-26 22:23:05.95463+00', '8h12D1vYczQS0KeoWyr2Bw', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 153, '3SS2ZZ6EuSDYtnrHdy3b0g', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 22:23:05.954832+00', '2024-10-26 23:21:31.524944+00', 'PC_Ia-Do_CLCJSveioBJOg', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 152, '3_vuWQJFtOhpxp80ZqGmyw', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 22:08:49.657331+00', '2024-10-26 23:24:45.221266+00', 'flK_gtAbRvm2-spKUK-a0Q', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 155, '_kEX6efqgcNsvlXr99fqcA', '222ef0a9-957b-47d6-a896-685347876113', false, '2024-10-26 23:24:45.221483+00', '2024-10-26 23:24:45.221483+00', '3_vuWQJFtOhpxp80ZqGmyw', 'be663800-146a-4121-8446-5a4b0a97d62b'),
	('00000000-0000-0000-0000-000000000000', 154, 'VofT_EGM5uwfb1MTfP6qjQ', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-26 23:21:31.525144+00', '2024-10-27 00:19:31.515649+00', '3SS2ZZ6EuSDYtnrHdy3b0g', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 156, 'whq40BEOCgKty_dNxjB91A', '222ef0a9-957b-47d6-a896-685347876113', true, '2024-10-27 00:19:31.515855+00', '2024-10-27 01:17:31.525341+00', 'VofT_EGM5uwfb1MTfP6qjQ', '035420e0-1729-4b5b-b46f-e0fefcccaf81'),
	('00000000-0000-0000-0000-000000000000', 157, 'eLjzmZwHuXU8C-RI2qxu6Q', '222ef0a9-957b-47d6-a896-685347876113', false, '2024-10-27 01:17:31.525614+00', '2024-10-27 01:17:31.525614+00', 'whq40BEOCgKty_dNxjB91A', '035420e0-1729-4b5b-b46f-e0fefcccaf81');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--



--
-- Data for Name: task_solana_keypairs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."task_solana_keypairs" ("id", "private_key", "public_key", "created_at") VALUES
	('c86bec96-388d-4bca-a32f-c0de08d431f4', '[79,172,196,198,28,216,221,108,27,179,255,254,18,215,45,22,16,193,178,194,9,111,231,185,48,189,17,57,30,85,245,94,184,188,254,145,90,57,89,45,64,218,91,110,255,21,60,97,158,22,247,251,230,180,228,47,86,175,124,236,80,157,140,107]', 'DS9AWh31mNGJAMYx17jm9WP4esTcz2eWHnKaauwUtgzW', '2024-10-18 23:26:55.385055+00'),
	('88711437-a5e2-46a9-946f-6a7d45f653e9', '[24,218,119,198,205,198,194,119,166,190,183,188,124,99,237,50,21,156,250,153,196,108,186,112,73,160,202,115,217,133,186,96,135,5,236,32,75,203,246,107,216,32,60,86,184,90,6,157,41,109,116,156,55,134,243,248,17,213,79,202,227,150,49,211]', 'A65H4j9TWuog9bqLfgWz8qiyeKmY1YmpT47SekhhNUux', '2024-10-18 23:27:52.784496+00'),
	('eeb20447-07a1-4e19-a30e-3d2021ed697e', '[56,189,149,135,34,176,119,244,74,227,23,250,28,92,205,33,30,57,91,141,14,194,111,99,19,51,200,26,201,185,104,127,236,211,104,107,31,88,107,82,111,141,95,117,189,248,64,72,201,106,108,133,54,149,187,63,241,202,8,171,179,180,155,227]', 'GwUBqeqmjQy7eDrPZQoT226mpk8guwaLAkzLPjow1Pd4', '2024-10-22 16:36:44.852912+00'),
	('5e630480-a2d0-4388-b9db-477753552833', '[221,121,138,181,103,146,4,55,143,255,236,36,140,238,204,122,14,185,251,222,208,35,249,49,164,177,39,128,138,71,185,104,124,228,173,158,241,164,50,90,235,113,240,56,225,6,24,199,222,45,2,250,172,124,141,220,29,186,160,85,121,127,254,21]', '9QXoKnX6EBdTUswHAYs1iiUp2PR93ZBBRRuo37qHSb9N', '2024-10-22 18:48:09.743706+00');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."users" ("id", "username", "deposit_address") VALUES
	('222ef0a9-957b-47d6-a896-685347876113', NULL, NULL);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."tasks" ("id", "created_by", "kind", "status", "title", "details", "max_winners", "created_at", "edited_at", "ended_at", "deleted_at", "deposit_address") VALUES
	('9302cde0-c60f-42df-ad87-16e552c1f9b5', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'A task that only you can do', 'You must complete this mission', 6, '2024-10-15 23:09:30.78121+00', NULL, NULL, NULL, NULL),
	('95411e46-d052-40fe-a8cb-1057ec968f74', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'dsfdsf', 'fsdfdsf', 1, '2024-10-16 00:29:28.868831+00', NULL, NULL, NULL, NULL),
	('5116039f-3aa1-43ea-89f5-599c02c88d29', '222ef0a9-957b-47d6-a896-685347876113', 'personal', 'active', 'personal one', 'sdfdgsf', 10, '2024-10-16 00:43:32.862579+00', NULL, NULL, NULL, NULL),
	('1f08e925-d900-4389-b393-bb3716b090d0', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'fgdg', 'fdgfdg', 1, '2024-10-16 23:00:20.660988+00', NULL, NULL, NULL, NULL),
	('b83b8a90-a37f-436a-bf7b-f99fbef4c833', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'fgdg', 'fdgfdg', 1, '2024-10-16 23:11:52.912609+00', NULL, NULL, NULL, NULL),
	('cbff82ce-0084-4284-892c-3a4ab47bcba0', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'fgdg', 'fdgfdg', 1, '2024-10-16 23:13:26.350792+00', NULL, NULL, NULL, NULL),
	('9b4dfcda-8a9d-4d7a-9e5f-9332c3a645fd', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'dfds', 'sdfds', 1, '2024-10-16 23:57:58.386846+00', NULL, NULL, NULL, NULL),
	('75bce4bf-6e01-4082-bdcb-92e0d31aed49', '222ef0a9-957b-47d6-a896-685347876113', 'personal', 'active', 'fegfd', 'hyhrt', 2, '2024-10-18 23:26:55.396139+00', NULL, NULL, NULL, 'c86bec96-388d-4bca-a32f-c0de08d431f4'),
	('f2a5f22c-f78c-43e7-9d0b-ec528f887975', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'hjhhg', 'cvdflkwreljlj', 7, '2024-10-18 23:27:52.79463+00', NULL, NULL, NULL, NULL),
	('ae982288-fe4a-4a3f-bfce-b24f4df2c785', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'gldkfjgkldjgl', 'dkfgdlkfgjdlfkgjf', 1, '2024-10-18 23:29:03.381792+00', NULL, NULL, NULL, '88711437-a5e2-46a9-946f-6a7d45f653e9'),
	('5dd1bd9d-3c6b-46f6-8427-116e067d20f4', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'lets see if req as AuthenticatedRequest works', 'lets see if req as AuthenticatedRequest works', 1, '2024-10-22 16:36:44.863893+00', NULL, NULL, NULL, 'eeb20447-07a1-4e19-a30e-3d2021ed697e'),
	('8561423e-e11b-474f-8d62-32fc191f3409', '222ef0a9-957b-47d6-a896-685347876113', 'personal', 'active', 'test', 'testttt', 1, '2024-10-22 18:48:09.754791+00', NULL, NULL, NULL, NULL),
	('87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'let''s see if not in use works', 'let''s see if not in use works', 1, '2024-10-22 18:58:13.991484+00', NULL, NULL, NULL, '5e630480-a2d0-4388-b9db-477753552833');


--
-- Data for Name: task_funding; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: solutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."solutions" ("id", "task_id", "created_by", "details", "is_winner", "created_at", "edited_at", "deleted_at") VALUES
	('12440323-470b-426f-b618-a78df4f0b19b', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '1 password-based auth safely, using secure configuration options an', false, '2024-10-24 20:50:14.946972+00', NULL, NULL),
	('dc2263c0-ea38-485f-8d79-2bd4b21d1704', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '2 password-based auth safely, using secure configuration options an', false, '2024-10-24 22:06:49.265452+00', NULL, NULL),
	('df31b85e-c304-4e05-a275-52409c7250bb', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '3 password-based auth safely, using secure configuration options an', false, '2024-10-24 23:24:20.629309+00', NULL, NULL),
	('4f4eead1-63d4-4689-9af4-54da99154992', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '4 password-based auth safely, using secure configuration options an', false, '2024-10-25 00:51:01.565961+00', NULL, NULL),
	('f740ed77-ee12-4d3f-80dd-f257617c463c', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '5 password-based auth safely, using secure configuration options an', false, '2024-10-25 00:52:23.938763+00', NULL, NULL),
	('8dc590ee-17fb-4b24-8e33-2eb4724e1654', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '6 password-based auth safely, using secure configuration options an', false, '2024-10-25 00:53:56.377797+00', NULL, NULL),
	('82fa119c-8de3-484c-abea-c101ce8c1a10', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '7 password-based auth safely, using secure configuration options an', false, '2024-10-25 01:19:27.661554+00', NULL, NULL),
	('6e403bd1-dddd-47bc-b24a-d09115ffec2e', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '8 password-based auth safely, using secure configuration options an', false, '2024-10-25 01:19:38.335963+00', NULL, NULL),
	('c63099f6-faad-4dad-8fd8-4fdcdf2ccf8f', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '9 password-based auth safely, using secure configuration options an', false, '2024-10-25 01:22:13.285823+00', NULL, NULL),
	('106ae698-b7f0-47f2-a7d3-545b6e0751f6', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '10 password-based auth safely, using secure configuration options an', false, '2024-10-25 01:22:25.969596+00', NULL, NULL),
	('88fa09d5-c532-453b-b98a-f960d9c18fe8', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '11 password-based auth safely, using secure configuration options an', false, '2024-10-25 01:34:37.13336+00', NULL, NULL),
	('88b473c9-63fc-48c9-b15a-a7ef98c94eeb', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '12 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:00:37.760144+00', NULL, NULL),
	('4149bddb-ea34-41b3-96cd-97a572fd9710', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '13 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:01:06.256074+00', NULL, NULL),
	('6f0ef9f7-d01d-4bf6-8ac0-cf92e01c6e32', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '14 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:02:21.534198+00', NULL, NULL),
	('5b3c5eac-667e-4022-afdf-d90625589fee', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '15 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:04:34.446192+00', NULL, NULL),
	('7443f705-f817-41a9-8c90-53a366540df0', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '16 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:16:06.075571+00', NULL, NULL),
	('ca514a88-135e-427d-902b-5c4321726ca3', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '17 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:16:41.798346+00', NULL, NULL),
	('87f20bb1-40ab-4c25-8b71-88fc2d5a3e2d', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '18 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:18:45.81918+00', NULL, NULL),
	('96607aad-b834-4835-a95e-267269d06fe5', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '19 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:19:38.640475+00', NULL, NULL),
	('574a9a64-f2af-4634-8400-3e2cfc8ab7b5', 'ae982288-fe4a-4a3f-bfce-b24f4df2c785', '222ef0a9-957b-47d6-a896-685347876113', '1 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:32:12.362065+00', NULL, NULL),
	('0f8aad05-1f42-4d13-8294-14bb65798111', 'ae982288-fe4a-4a3f-bfce-b24f4df2c785', '222ef0a9-957b-47d6-a896-685347876113', '2 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:32:22.639525+00', NULL, NULL),
	('e6d29f99-b597-480f-b2a3-252c7bd71368', 'ae982288-fe4a-4a3f-bfce-b24f4df2c785', '222ef0a9-957b-47d6-a896-685347876113', '3 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:33:45.061362+00', NULL, NULL),
	('89362a40-4212-4313-b25d-831c884601e7', 'ae982288-fe4a-4a3f-bfce-b24f4df2c785', '222ef0a9-957b-47d6-a896-685347876113', '4 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:33:53.901166+00', NULL, NULL),
	('b4db565b-0cac-4d0a-8314-04b70856f003', 'ae982288-fe4a-4a3f-bfce-b24f4df2c785', '222ef0a9-957b-47d6-a896-685347876113', '5 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:34:01.436434+00', NULL, NULL),
	('2a2858ef-8a73-4c58-a818-db01351bba74', 'ae982288-fe4a-4a3f-bfce-b24f4df2c785', '222ef0a9-957b-47d6-a896-685347876113', '6 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:34:14.379525+00', NULL, NULL),
	('fd43f318-d4c6-4271-a94d-8cf6e419ba32', 'ae982288-fe4a-4a3f-bfce-b24f4df2c785', '222ef0a9-957b-47d6-a896-685347876113', '7 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:34:37.933418+00', NULL, NULL),
	('3dc617d9-e559-4d16-9bae-8f99e3c6be98', 'ae982288-fe4a-4a3f-bfce-b24f4df2c785', '222ef0a9-957b-47d6-a896-685347876113', '8 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:34:59.792035+00', NULL, NULL),
	('1c095cd6-053b-4b50-a4de-d29920f1643c', 'ae982288-fe4a-4a3f-bfce-b24f4df2c785', '222ef0a9-957b-47d6-a896-685347876113', '9 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:35:11.714927+00', NULL, NULL),
	('83777b63-0eea-4d68-8334-d32915453b4c', 'ae982288-fe4a-4a3f-bfce-b24f4df2c785', '222ef0a9-957b-47d6-a896-685347876113', '10 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:35:32.784666+00', NULL, NULL),
	('57ab6571-5a97-4f48-93b5-8b6955bc8d7b', '8561423e-e11b-474f-8d62-32fc191f3409', '222ef0a9-957b-47d6-a896-685347876113', '1 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:44:05.872435+00', NULL, NULL),
	('08bec89a-d6b2-4fe0-8432-2cfb51c6a17f', '8561423e-e11b-474f-8d62-32fc191f3409', '222ef0a9-957b-47d6-a896-685347876113', '2 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:44:19.176854+00', NULL, NULL),
	('eac4de1e-73a6-4aca-b9d2-096d01d704d8', '8561423e-e11b-474f-8d62-32fc191f3409', '222ef0a9-957b-47d6-a896-685347876113', '3 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:45:08.673303+00', NULL, NULL),
	('0a96766f-6979-48f0-8fbc-172753d3e9ee', '8561423e-e11b-474f-8d62-32fc191f3409', '222ef0a9-957b-47d6-a896-685347876113', '4 password-based auth safely, using secure configuration options an', false, '2024-10-25 16:48:01.944535+00', NULL, NULL),
	('c9a6f50f-6b42-40e3-8f41-6b658be0d183', '8561423e-e11b-474f-8d62-32fc191f3409', '222ef0a9-957b-47d6-a896-685347876113', 'password-based auth safely, using secure configuration options an', false, '2024-10-25 16:48:03.218999+00', NULL, NULL),
	('ceb3d21a-1ccd-4ba1-9f8c-e3854b29541e', '8561423e-e11b-474f-8d62-32fc191f3409', '222ef0a9-957b-47d6-a896-685347876113', 'sdjhfsdkljhfsdkljfhsdsdfkjsdhfkjlsdhfkljsdsdfnksjdfhdskj', false, '2024-10-25 16:54:10.381278+00', NULL, NULL),
	('a384c16b-37f3-4a3b-a0e9-408b5c382984', '9302cde0-c60f-42df-ad87-16e552c1f9b5', '222ef0a9-957b-47d6-a896-685347876113', 'dskfbskjdbfkjsdbfskjdlfhlskjfbsdkjf sdjfbsdkjfbsdlkjfbhdslkjfbsdlkjfbdskljfb', false, '2024-10-25 22:28:30.498041+00', NULL, NULL),
	('46885bc4-67b7-4455-a597-26a9b2480c10', '9302cde0-c60f-42df-ad87-16e552c1f9b5', '222ef0a9-957b-47d6-a896-685347876113', 'slfijskdi sdifhlsifh dsifh ;ksdh f;sohf s;dhf ;skdhf; idshf idhsl ', false, '2024-10-25 22:29:01.935361+00', NULL, NULL),
	('f89d7194-6c75-4e20-9ccd-b62efd4e40c0', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', 'Allow users to sign in with a password connected to their email or phone number.
Users often expect to sign in to your site with a password. Supabase Auth helps you implement password-based auth safely, using secure configuration options and best practices for storing and verifying passwords.

Users can associate a password with their identity using their email address or a phone number.

With email#
Enabling email and password-based authentication#
Email authentication is enabled by default.

You can configure whether users need to verify their email to sign in. On hosted Supabase projects, this is true by default. On self-hosted projects or in local development, this is false by default.

Change this setting on the Auth Providers page for hosted projects, or in the configuration file for self-hosted projects.

Signing up with an email and password#
There are two possible flows for email signup: implicit flow and PKCE flow. If you''re using SSR, you''re using the PKCE flow. If you''re using client-only code, the default flow depends upon the client library. The implicit flow is the default in JavaScript and Dart, and the PKCE flow is the default in Swift.

The instructions in this section assume that email confirmations are enabled.


Implicit flow

PKCE flow
The implicit flow only works for client-only apps. Your site directly receives the access token after the user confirms their email.


JavaScript

Dart

Swift

Kotlin

Python
To sign up the user, call signUp() with their email address and password.

You can optionally specify a URL to redirect to after the user clicks the confirmation link. This URL must be configured as a Redirect URL, which you can do in the dashboard for hosted projects, or in the configuration file for self-hosted projects.

If you don''t specify a redirect URL, the user is automatically redirected to your site URL. This defaults to localhost:3000, but you can also configure this.', false, '2024-10-26 22:16:48.184148+00', NULL, NULL),
	('f695d48e-281a-4f06-b91a-6ad7377e0e25', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', 'Allow users to sign in with a password connected to their email or phone number.
Users often expect to sign in to your site with a password. Supabase Auth helps you implement password-based auth safely, using secure configuration options and best practices for storing and verifying passwords.

Users can associate a password with their identity using their email address or a phone number.

With email#
Enabling email and password-based authentication#
Email authentication is enabled by default.

You can configure whether users need to verify their email to sign in. On hosted Supabase projects, this is true by default. On self-hosted projects or in local development, this is false by default.

Change this setting on the Auth Providers page for hosted projects, or in the configuration file for self-hosted projects.

Signing up with an email and password#
There are two possible flows for email signup: implicit flow and PKCE flow. If you''re using SSR, you''re using the PKCE flow. If you''re using client-only code, the default flow depends upon the client library. The implicit flow is the default in JavaScript and Dart, and the PKCE flow is the default in Swift.

The instructions in this section assume that email confirmations are enabled.


Implicit flow

PKCE flow
The implicit flow only works for client-only apps. Your site directly receives the access token after the user confirms their email.


JavaScript

Dart

Swift

Kotlin

Python
To sign up the user, call signUp() with their email address and password.

You can optionally specify a URL to redirect to after the user clicks the confirmation link. This URL must be configured as a Redirect URL, which you can do in the dashboard for hosted projects, or in the configuration file for self-hosted projects.

If you don''t specify a redirect URL, the user is automatically redirected to your site URL. This defaults to localhost:3000, but you can also configure this.Allow users to sign in with a password connected to their email or phone number.
Users often expect to sign in to your site with a password. Supabase Auth helps you implement password-based auth safely, using secure configuration options and best practices for storing and verifying passwords.

Users can associate a password with their identity using their email address or a phone number.

With email#
Enabling email and password-based authentication#
Email authentication is enabled by default.

You can configure whether users need to verify their email to sign in. On hosted Supabase projects, this is true by default. On self-hosted projects or in local development, this is false by default.

Change this setting on the Auth Providers page for hosted projects, or in the configuration file for self-hosted projects.

Signing up with an email and password#
There are two possible flows for email signup: implicit flow and PKCE flow. If you''re using SSR, you''re using the PKCE flow. If you''re using client-only code, the default flow depends upon the client library. The implicit flow is the default in JavaScript and Dart, and the PKCE flow is the default in Swift.

The instructions in this section assume that email confirmations are enabled.


Implicit flow

PKCE flow
The implicit flow only works for client-only apps. Your site directly receives the access token after the user confirms their email.


JavaScript

Dart

Swift

Kotlin

Python
To sign up the user, call signUp() with their email address and password.

You can optionally specify a URL to redirect to after the user clicks the confirmation link. This URL must be configured as a Redirect URL, which you can do in the dashboard for hosted projects, or in the configuration file for self-hosted projects.

If you don''t specify a redirect URL, the user is automatically redirected to your site URL. This defaults to localhost:3000, but you can also configure this.Allow users to sign in with a password connected to their email or phone number.
Users often expect to sign in to your site with a password. Supabase Auth helps you implement password-based auth safely, using secure configuration options and best practices for storing and verifying passwords.

Users can associate a password with their identity using their email address or a phone number.

With email#
Enabling email and password-based authentication#
Email authentication is enabled by default.

You can configure whether users need to verify their email to sign in. On hosted Supabase projects, this is true by default. On self-hosted projects or in local development, this is false by default.

Change this setting on the Auth Providers page for hosted projects, or in the configuration file for self-hosted projects.

Signing up with an email and password#
There are two possible flows for email signup: implicit flow and PKCE flow. If you''re using SSR, you''re using the PKCE flow. If you''re using client-only code, the default flow depends upon the client library. The implicit flow is the default in JavaScript and Dart, and the PKCE flow is the default in Swift.

The instructions in this section assume that email confirmations are enabled.


Implicit flow

PKCE flow
The implicit flow only works for client-only apps. Your site directly receives the access token after the user confirms their email.


JavaScript

Dart

Swift

Kotlin

Python
To sign up the user, call signUp() with their email address and password.

You can optionally specify a URL to redirect to after the user clicks the confirmation link. This URL must be configured as a Redirect URL, which you can do in the dashboard for hosted projects, or in the configuration file for self-hosted projects.

If you don''t specify a redirect URL, the user is automatically redirected to your site URL. This defaults to localhost:3000, but you can also configure this.', false, '2024-10-26 22:17:07.397648+00', NULL, NULL);


--
-- Data for Name: solution_votes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 157, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
