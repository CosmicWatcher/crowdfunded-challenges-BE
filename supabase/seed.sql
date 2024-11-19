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
	('00000000-0000-0000-0000-000000000000', 'aba52950-ca04-4055-b0c0-cc2d0e5a2041', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-27 01:17:31.524834+00', ''),
	('00000000-0000-0000-0000-000000000000', '502d49db-ade2-4de2-8a6f-a8814b2c29ca', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 15:59:12.999461+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b9aab596-7817-4d10-9f7f-41dc20beed7f', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 15:59:13.000279+00', ''),
	('00000000-0000-0000-0000-000000000000', '88206472-1de7-4eb3-85b8-d19372bd25f3', '{"action":"logout","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-10-28 16:05:56.37272+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad3c52e7-7cc0-41b3-abd4-287846894451', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-28 16:06:11.490299+00', ''),
	('00000000-0000-0000-0000-000000000000', '07e2bde1-4cfc-4dac-ba64-a1ed92d65654', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-28 18:06:04.787044+00', ''),
	('00000000-0000-0000-0000-000000000000', '54214d14-d895-4548-a2f6-3eb4a95e8f5f', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 19:18:47.249285+00', ''),
	('00000000-0000-0000-0000-000000000000', '4b200a7e-e316-4119-b2ce-92b076f5c39c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 19:18:47.250037+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd31b68c2-bf90-432f-8a51-3bf68ad41e45', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 20:17:13.424267+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b6df9139-2259-47a0-9d0c-3ffeae5f4e3f', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 20:17:13.424771+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd5390053-cbcb-4d58-bcbf-b2101fadf0a6', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 20:45:37.243231+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b40692a0-03b9-44f5-99ac-d194bc1db86c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 20:45:37.243721+00', ''),
	('00000000-0000-0000-0000-000000000000', '21fe1d24-f274-40c0-ab95-9c86aaa57ca8', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 21:43:40.828345+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aa82e375-ab6b-499f-baf7-af25ec4d89aa', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 21:43:40.828828+00', ''),
	('00000000-0000-0000-0000-000000000000', '4d593647-25a1-46c9-b8c5-d00267f7d549', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 22:41:54.49584+00', ''),
	('00000000-0000-0000-0000-000000000000', '8afac5d4-7fc4-40db-a269-1f1a5cd242e2', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 22:41:54.496363+00', ''),
	('00000000-0000-0000-0000-000000000000', '10e6fa6c-2eb2-4377-8dcd-adfd4c9f9a2a', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 23:42:53.021228+00', ''),
	('00000000-0000-0000-0000-000000000000', '2d9b4e6f-5398-4fe4-8f16-e49fa3d9f2a1', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-28 23:42:53.021741+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bd2466e7-5155-497e-9bfc-3fed4a7b75d9', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 00:55:44.981649+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cce2a768-deb3-4620-8a38-b1a2cf7e37fb', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 00:55:44.982457+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd4b0e0be-0090-45e0-86f5-8f418758ac99', '{"action":"logout","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-10-29 01:28:54.572969+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e1768d53-c1a8-4f78-b06d-92016b55485e', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-29 01:33:01.160568+00', ''),
	('00000000-0000-0000-0000-000000000000', '82669669-98c1-4ea6-a85b-258de057c655', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 16:28:47.356678+00', ''),
	('00000000-0000-0000-0000-000000000000', '965009df-e4c8-4f14-bea4-e165f7269ecf', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 16:28:47.358586+00', ''),
	('00000000-0000-0000-0000-000000000000', '30cfd63e-805d-41d2-b39c-651f06dbc92e', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 17:53:38.386838+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fd4d3c66-ba66-48de-ae65-1eeaf4b7ab77', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 17:53:38.387284+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b0a31615-4d38-4559-8ede-7bbc346aecb9', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 18:52:01.647321+00', ''),
	('00000000-0000-0000-0000-000000000000', '4d9025b8-e798-4067-a8a7-538b7d38a75d', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 18:52:01.647849+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a701b45c-17f4-46e3-89fa-1d3c58bd3185', '{"action":"logout","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-10-29 18:57:39.086384+00', ''),
	('00000000-0000-0000-0000-000000000000', '2ba9fe68-ea10-4476-a75a-0dcadb82ec1c', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-29 18:58:10.684172+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bf8df9fe-d1b8-4bed-91da-3a9690034222', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 20:03:28.059003+00', ''),
	('00000000-0000-0000-0000-000000000000', '14ad410b-0e70-4573-a1f5-f019e1a831ff', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 20:03:28.059616+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b5a9bd2-e612-4be4-95ec-eb4ad965778e', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-29 20:42:13.506672+00', ''),
	('00000000-0000-0000-0000-000000000000', '406395d4-68db-4693-bdcf-416c9003f16a', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 21:01:56.945384+00', ''),
	('00000000-0000-0000-0000-000000000000', '5c83df21-ff08-4741-b07e-2559b658ba1e', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 21:01:56.945802+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b52deec6-45fa-48bd-8bd5-1cb6bb84dda1', '{"action":"logout","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-10-29 21:38:43.421397+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ed931d55-a8b4-4525-b37b-c71136b81105', '{"action":"user_signedup","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2024-10-29 21:39:09.249154+00', ''),
	('00000000-0000-0000-0000-000000000000', '5380f458-c94c-4749-8c4f-af57f459df47', '{"action":"login","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-29 21:39:09.252688+00', ''),
	('00000000-0000-0000-0000-000000000000', '4358c693-8708-4df8-8d46-c8c6234a01f4', '{"action":"logout","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-10-29 21:40:16.350405+00', ''),
	('00000000-0000-0000-0000-000000000000', '80e6f666-dd1b-4c3f-a009-5ac14ec58dd2', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-29 21:40:30.216911+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e9d63f8-9a8d-4a1f-858c-b6b53de77702', '{"action":"login","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-29 21:55:10.884279+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f184e48-6ea8-4fba-94ea-b6007ab6d30a', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 23:59:55.435576+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b7b3c04c-09a9-42e6-816f-8ec6b70d463c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-29 23:59:55.436164+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b926cc20-8a14-4f86-b499-1e3722168c5b', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 01:16:58.727333+00', ''),
	('00000000-0000-0000-0000-000000000000', '29b41634-5e59-4018-9ab4-6fe612e179ab', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 01:16:58.727823+00', ''),
	('00000000-0000-0000-0000-000000000000', 'adf8733a-075e-46c6-a6c7-64ca326434d8', '{"action":"logout","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-10-30 01:34:03.342508+00', ''),
	('00000000-0000-0000-0000-000000000000', '4dc074e1-e995-4fe0-8ac7-9ad777c8c6e3', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-10-30 01:56:47.22749+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b32990ab-9975-4db0-bbd6-d1c7742e5acd', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 17:13:03.138422+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cd00e1cc-1d3a-462d-8324-cfce7137070b', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 17:13:03.140412+00', ''),
	('00000000-0000-0000-0000-000000000000', '31d5f66d-63ae-46d0-b43f-ab5c3ab60225', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 18:17:51.924397+00', ''),
	('00000000-0000-0000-0000-000000000000', '8a383206-34ea-489b-a4b0-cba917e10407', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 18:17:51.924844+00', ''),
	('00000000-0000-0000-0000-000000000000', '2cb8c884-d0b0-43c6-a641-34ca30930481', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 19:16:16.073257+00', ''),
	('00000000-0000-0000-0000-000000000000', '75237c2c-0be2-4ecd-8e31-565b02b4d2bd', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 19:16:16.074019+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a244cdde-1fbd-415f-83a5-e36c2ff86422', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 20:39:35.863217+00', ''),
	('00000000-0000-0000-0000-000000000000', '5ecc2460-33ca-42cc-9fa3-db1fa4d8df0c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 20:39:35.863661+00', ''),
	('00000000-0000-0000-0000-000000000000', '35d3da34-d016-4e3c-8c1f-51665cd7cf10', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 21:39:35.097671+00', ''),
	('00000000-0000-0000-0000-000000000000', '9354bb0b-61e2-44c9-a346-11f898d4781e', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 21:39:35.098264+00', ''),
	('00000000-0000-0000-0000-000000000000', '8ae92c33-4db0-4886-a68a-8e9ae2234308', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 23:32:11.928047+00', ''),
	('00000000-0000-0000-0000-000000000000', '4ccac0fd-a400-4772-b150-dd3764e3b66a', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-30 23:32:11.928631+00', ''),
	('00000000-0000-0000-0000-000000000000', '43dcceaf-2134-4780-83dd-c53ac56aa64c', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 01:48:54.760442+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f5102e10-bf11-4c54-80f4-5d8274f9b781', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 01:48:54.760932+00', ''),
	('00000000-0000-0000-0000-000000000000', '27edd482-d7a2-426b-a819-36f711d62286', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 13:37:08.547913+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f42b00c4-4fe1-4e73-8062-fccf08657517', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 13:37:08.549493+00', ''),
	('00000000-0000-0000-0000-000000000000', '8a36ed78-1f48-4e0a-a7c8-c7eb80c604b0', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 14:42:55.602866+00', ''),
	('00000000-0000-0000-0000-000000000000', '6a2fecb2-4a90-4ae9-98ff-e5abb4c2200d', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 14:42:55.603525+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aead0fd9-eb67-4d37-ad58-7538b72f41ec', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 16:04:28.976231+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c189265d-4a4b-4a1a-bed6-d0dfcb890d15', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 16:04:28.976726+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b1fabf70-d402-403f-8f60-14677c4ffed8', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 17:02:52.188148+00', ''),
	('00000000-0000-0000-0000-000000000000', '8a556068-1b23-4449-9504-33d5a89ff28a', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 17:02:52.18865+00', ''),
	('00000000-0000-0000-0000-000000000000', '8980e807-0d37-49ba-a73a-849357783176', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 18:19:05.35451+00', ''),
	('00000000-0000-0000-0000-000000000000', '2a705216-0506-492b-83d6-4d386fb5c957', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 18:19:05.354968+00', ''),
	('00000000-0000-0000-0000-000000000000', '7c82ee5b-6a84-4e4f-8e93-fc799b79aeb9', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 19:32:01.706331+00', ''),
	('00000000-0000-0000-0000-000000000000', '9e96598d-d122-4f38-b96a-5fb68d64eec8', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 19:32:01.706789+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e91a7f07-8ccc-4ee8-a9a4-40e0286df89a', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 20:47:57.237351+00', ''),
	('00000000-0000-0000-0000-000000000000', '9edd846b-d331-4115-9a11-0c51670c5cce', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 20:47:57.237768+00', ''),
	('00000000-0000-0000-0000-000000000000', '6b1f2991-63af-4d9e-82ac-4bcae5949f3a', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 21:23:35.952388+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a4bb59ab-9c66-41e0-a6a3-427ee945f346', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 21:23:35.953021+00', ''),
	('00000000-0000-0000-0000-000000000000', '7d9e69cc-3f18-4c3e-a526-2963281b322c', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 21:48:27.076366+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a1638521-7925-45ae-a495-b61fdbf4eace', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 21:48:27.076986+00', ''),
	('00000000-0000-0000-0000-000000000000', '2ff224b3-368b-493c-948f-670fe8769a94', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 22:23:07.136298+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e146478-2fc9-447a-8ed9-ba9753c07ccf', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 22:23:07.136924+00', ''),
	('00000000-0000-0000-0000-000000000000', '0f672973-ce46-4522-aaa8-492249d62366', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 22:46:40.258761+00', ''),
	('00000000-0000-0000-0000-000000000000', '33662a10-7f41-438c-8e17-e79564baadb9', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-10-31 22:46:40.259281+00', ''),
	('00000000-0000-0000-0000-000000000000', '553f954c-a94a-4354-8c86-1319117c8267', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 14:51:54.761831+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e49852e5-c44c-4c10-a59e-980a29eeace7', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 14:51:54.76337+00', ''),
	('00000000-0000-0000-0000-000000000000', '6f7df68d-7a6a-43aa-91ca-7aacdf2a7b8e', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 15:52:26.890324+00', ''),
	('00000000-0000-0000-0000-000000000000', '6b46936d-e4aa-431c-b91a-c804f77d3844', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 15:52:26.890919+00', ''),
	('00000000-0000-0000-0000-000000000000', '98b7f85a-dd7a-461c-9b22-54e942b158e6', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 16:58:21.671876+00', ''),
	('00000000-0000-0000-0000-000000000000', '1bf4b843-3465-4777-be73-ef68234531bb', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 16:58:21.672548+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b13df9d9-5da3-4a5f-bedf-40c0c4fed452', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 17:59:24.847556+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c76aa004-c3b8-4837-9b02-3a5d9bacaa41', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 17:59:24.848032+00', ''),
	('00000000-0000-0000-0000-000000000000', '020fe511-6a2d-4962-bb83-fe3a604a484f', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 18:57:37.49474+00', ''),
	('00000000-0000-0000-0000-000000000000', '64dfac39-11f6-44a9-92c7-4925fa75106f', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 18:57:37.495358+00', ''),
	('00000000-0000-0000-0000-000000000000', '9172e287-4018-440a-9e6b-c7960a85754f', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-01 19:56:43.056224+00', ''),
	('00000000-0000-0000-0000-000000000000', '98799a97-1484-494b-91cd-f4e1c1b2fa68', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 20:01:00.271342+00', ''),
	('00000000-0000-0000-0000-000000000000', '879c4379-e853-40d1-99b7-0c2f813f0a15', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 20:01:00.271878+00', ''),
	('00000000-0000-0000-0000-000000000000', '51b3f463-eb46-4e07-9a0d-314dcdaf5a6a', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 21:19:03.363813+00', ''),
	('00000000-0000-0000-0000-000000000000', '6e789005-0cda-474b-bce4-d349ad4ab576', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 21:19:03.364655+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a7ae2078-e393-49eb-9602-847af8575751', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 21:20:37.737589+00', ''),
	('00000000-0000-0000-0000-000000000000', '15d807df-670f-46e1-9378-df2e0c460cf3', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 21:20:37.738173+00', ''),
	('00000000-0000-0000-0000-000000000000', '63c4752b-ee5f-44a8-b558-7ef2300b63f6', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 22:20:32.0165+00', ''),
	('00000000-0000-0000-0000-000000000000', '90c3bfe2-8944-4328-9299-c8861680260d', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 22:20:32.01721+00', ''),
	('00000000-0000-0000-0000-000000000000', '29921f53-10f4-4438-8675-17a137a1ec59', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 22:22:00.048748+00', ''),
	('00000000-0000-0000-0000-000000000000', '9c111cee-035c-4910-8662-f607629b24af', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 22:22:00.049215+00', ''),
	('00000000-0000-0000-0000-000000000000', '9230f657-95a5-4188-b7db-04ea52f030bf', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 23:27:45.588419+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c3bb18ab-3379-4e0b-bbe5-db4c994e4ed9', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-01 23:27:45.589+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b1332a4f-21fc-4fc5-bfd7-754869615bda', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 00:07:56.405718+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a56c85ad-faa3-479a-b359-12764ae11739', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 00:07:56.406243+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fc1133ec-719d-4144-bc77-021bdf8ba3f0', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 12:59:05.266801+00', ''),
	('00000000-0000-0000-0000-000000000000', '575a97e3-eddf-452d-9bc5-e43e1b9b4156', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 12:59:05.268487+00', ''),
	('00000000-0000-0000-0000-000000000000', '0c20f351-5ef2-4f64-ab70-e8a50ef4494a', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 14:02:10.559662+00', ''),
	('00000000-0000-0000-0000-000000000000', '09c2c565-d03f-47df-ba6e-3231a4423e47', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 14:02:10.560191+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd5f82fb2-1504-48c4-89c3-afe5c6fb6c8b', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 15:12:17.121772+00', ''),
	('00000000-0000-0000-0000-000000000000', '4139e8f4-c6ab-4280-8dc2-042d0c5dd1ee', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 15:12:17.122236+00', ''),
	('00000000-0000-0000-0000-000000000000', '52d10334-f1b6-4e5c-ac00-bde13120c726', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 16:12:59.450186+00', ''),
	('00000000-0000-0000-0000-000000000000', '51f0264d-e7b5-4aca-adfe-cbcf681d8998', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 16:12:59.450989+00', ''),
	('00000000-0000-0000-0000-000000000000', '3a53006c-f583-44c7-8f86-e88c97faa39f', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 17:14:16.645254+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ade04898-a88f-4718-b13e-45be2b80b2cd', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 17:14:16.645809+00', ''),
	('00000000-0000-0000-0000-000000000000', '735efdf9-c113-4c3b-9689-ab12cf581995', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 18:01:21.667488+00', ''),
	('00000000-0000-0000-0000-000000000000', '652fd113-8796-4ef3-87af-c02c67aa40ea', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 18:01:21.668165+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cf09d8c3-0b5a-4cf5-82ea-9aafce3cc8e3', '{"action":"logout","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-02 18:01:29.436921+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ccd48399-a878-4c9b-a411-543aba12383d', '{"action":"login","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-02 18:01:58.783718+00', ''),
	('00000000-0000-0000-0000-000000000000', '701feabe-1037-4370-ac5b-4a13e80b34b8', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 18:14:09.384983+00', ''),
	('00000000-0000-0000-0000-000000000000', '33aed628-e62c-4927-b40c-cfb9dd546bd6', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 18:14:09.385461+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7120042-496b-47c2-b78b-f9951f4647d2', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 19:09:22.164094+00', ''),
	('00000000-0000-0000-0000-000000000000', '2158b4f6-0062-4df1-8f58-9ddc581faeeb', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 19:09:22.164609+00', ''),
	('00000000-0000-0000-0000-000000000000', '885d02b1-dd2d-43ef-9eca-8358ede5810b', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 19:30:49.912467+00', ''),
	('00000000-0000-0000-0000-000000000000', '6b7338f8-4a25-4050-8d99-bbe59205abfd', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 19:30:49.912936+00', ''),
	('00000000-0000-0000-0000-000000000000', '4de17e5b-9bac-40ac-aef7-b22c054947d3', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 20:28:51.791572+00', ''),
	('00000000-0000-0000-0000-000000000000', '7b4f2040-40d8-42cd-8557-adb66a0e9c5f', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 20:28:51.792077+00', ''),
	('00000000-0000-0000-0000-000000000000', '8921e222-484e-485a-906e-0bb6df7fd8eb', '{"action":"logout","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-02 20:54:26.157621+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b6141fad-f875-47af-bbc0-93edb6787812', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-02 20:55:04.194493+00', ''),
	('00000000-0000-0000-0000-000000000000', '12766c55-cc9a-4f0e-8937-bd049d75f539', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 22:05:01.429741+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bd69f1f1-f201-4d07-8cf1-d707f725e630', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 22:05:01.430258+00', ''),
	('00000000-0000-0000-0000-000000000000', '05023cf2-e0a8-4476-a96d-62ee5b35f066', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 23:03:10.59353+00', ''),
	('00000000-0000-0000-0000-000000000000', '109a316a-0a27-4478-9d35-e7e3072b2bb3', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-02 23:03:10.594096+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7c5352e-f287-4449-a3d0-808cc474899c', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-03 00:01:19.912913+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f53c2331-1e27-4a25-ac05-ec28d60e8a3b', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-03 00:01:19.91339+00', ''),
	('00000000-0000-0000-0000-000000000000', 'eaf33653-618e-4d30-8cc7-f8114c952eda', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-04 00:03:34.467526+00', ''),
	('00000000-0000-0000-0000-000000000000', '81a112a7-9795-425d-9688-9d0076bed3bf', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-04 00:03:34.469505+00', ''),
	('00000000-0000-0000-0000-000000000000', '31e9e47b-4236-4815-977a-8f99b7877490', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-04 19:59:20.432482+00', ''),
	('00000000-0000-0000-0000-000000000000', '85a1e3e5-16a6-46ee-bdae-9f66d0b29013', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-04 19:59:20.434326+00', ''),
	('00000000-0000-0000-0000-000000000000', '3a6b8e4b-e634-418e-9e03-3a2ff5497ea4', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-04 20:59:25.55556+00', ''),
	('00000000-0000-0000-0000-000000000000', '38a67f96-f2eb-4e1f-88d4-86fda6ec8d0b', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-04 20:59:25.556036+00', ''),
	('00000000-0000-0000-0000-000000000000', '0a1735eb-00aa-4480-b220-fbde062d0fa0', '{"action":"logout","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-04 21:05:30.21097+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e40f02d-50bf-4218-a3fb-62d1d7165621', '{"action":"login","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-04 21:05:43.944841+00', ''),
	('00000000-0000-0000-0000-000000000000', '8431bb1b-68ad-4aba-b421-0c2002da99e3', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-04 22:06:20.49271+00', ''),
	('00000000-0000-0000-0000-000000000000', '4a7889c9-2c15-40b1-b318-61cbd1afe983', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-04 22:06:20.493164+00', ''),
	('00000000-0000-0000-0000-000000000000', '81257cb6-6d95-4f0b-9d10-9d64fa5b3a88', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-04 23:04:38.810819+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd03daafe-8dba-4f7f-9426-f355fff85822', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-04 23:04:38.811265+00', ''),
	('00000000-0000-0000-0000-000000000000', '753ac28a-44a8-42b0-b37b-0478c7c4c032', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 01:09:14.132924+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c1e8ff5e-2572-4d02-8693-1fe7a54a8263', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 01:09:14.133426+00', ''),
	('00000000-0000-0000-0000-000000000000', '359ba6ed-08cc-47da-b198-5e58714b6e46', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 16:03:13.45506+00', ''),
	('00000000-0000-0000-0000-000000000000', '36b9b111-e988-4079-bbdc-b18a7e75335d', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 16:03:13.456898+00', ''),
	('00000000-0000-0000-0000-000000000000', '80315908-a8a6-4e02-b958-5e691e77f79e', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 17:01:16.916805+00', ''),
	('00000000-0000-0000-0000-000000000000', '77ae9d99-5396-4b0a-a11e-8f173b37b76a', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 17:01:16.917303+00', ''),
	('00000000-0000-0000-0000-000000000000', '921e9166-3da7-4292-94d3-36a4f40fb13f', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 18:14:01.809365+00', ''),
	('00000000-0000-0000-0000-000000000000', '3774a14d-a8ee-4f73-84f9-195e0aa3ff4d', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 18:14:01.809811+00', ''),
	('00000000-0000-0000-0000-000000000000', '068a50dd-7bbc-48df-8702-aec3cf2f5b42', '{"action":"logout","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-05 18:19:15.571476+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cd05a384-9fb8-440f-85bd-49edef651515', '{"action":"login","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-05 18:20:38.8992+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c5f33af4-02d7-476c-9502-d73dc3377348', '{"action":"logout","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-05 18:21:57.014685+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f56ac5d5-6129-4c51-be53-9a1258f961be', '{"action":"login","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-05 18:22:08.291515+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d28f000-6fe6-4718-b2f1-49721146ef00', '{"action":"logout","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-05 18:22:22.152497+00', ''),
	('00000000-0000-0000-0000-000000000000', 'de4f6255-f408-4f88-a8a6-9498d0146182', '{"action":"login","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-05 18:22:26.393398+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c87398ec-498f-4e4f-9d58-9c5772305e16', '{"action":"logout","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-05 18:22:31.453853+00', ''),
	('00000000-0000-0000-0000-000000000000', '4b28f6b6-0a5a-4bdc-bee9-713c97c8c684', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-05 18:22:50.85858+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b4aa1314-a1e8-4c32-8c24-b210f2fd201e', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-05 20:09:35.343404+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c514e5cf-082e-48fd-b929-f9d35bbbab6f', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 21:07:42.76462+00', ''),
	('00000000-0000-0000-0000-000000000000', '17afe1fc-c34d-4178-816a-2f151d4d8ef5', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 21:07:42.765253+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd70e1252-a649-47ab-bef3-e7a0ad4bd559', '{"action":"login","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-05 22:00:36.046246+00', ''),
	('00000000-0000-0000-0000-000000000000', '6ac78b97-96d6-4cb6-b4ca-3094a6e95e12', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 22:08:07.151672+00', ''),
	('00000000-0000-0000-0000-000000000000', '1744dab1-a69b-4dc3-b2e5-a112f7d857a4', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 22:08:07.152401+00', ''),
	('00000000-0000-0000-0000-000000000000', '6cb17d9d-3c8d-4a04-9a72-b64ff691e4c9', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 23:04:30.321959+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ec0b25d9-f979-4c39-bbab-29995d43177b', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 23:04:30.32275+00', ''),
	('00000000-0000-0000-0000-000000000000', '2d190a3c-8811-4d47-a3f6-cbed3dce8675', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 23:08:04.127741+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd5f6b1dd-c510-4b44-8bda-e01574847a42', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-05 23:08:04.128325+00', ''),
	('00000000-0000-0000-0000-000000000000', '00a15617-1687-4efc-aa5a-fba3927d9e62', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 00:02:38.774974+00', ''),
	('00000000-0000-0000-0000-000000000000', '70194038-2bb2-4828-a0d1-cac6fd907105', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 00:02:38.775509+00', ''),
	('00000000-0000-0000-0000-000000000000', '41ab0a6f-70f0-477f-a031-defa86c57d3b', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 00:07:28.526611+00', ''),
	('00000000-0000-0000-0000-000000000000', '349d65ba-86bb-4034-8836-61ff1e97fc35', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 00:07:28.52734+00', ''),
	('00000000-0000-0000-0000-000000000000', '0700db1c-d16d-4a25-9ed9-52bd16f42557', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 02:11:04.480655+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a5d66a0c-0ae4-4e18-a09a-9807a2d9f34f', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 02:11:04.484535+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f89ee7db-e5b4-4692-90b4-d2f7fcc45095', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 03:10:37.967561+00', ''),
	('00000000-0000-0000-0000-000000000000', '3e6b6ebb-1e28-42e9-abea-3a16e4a75fbf', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 03:10:37.968127+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f5813a6e-20ef-491c-a9b4-292e13a2e6bb', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 04:54:27.087934+00', ''),
	('00000000-0000-0000-0000-000000000000', '5349f05a-abf1-43cc-883c-06c8ed414112', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 04:54:27.088489+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c61f25a6-3371-413e-b2d3-b85b0d26ad0e', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 15:34:23.494823+00', ''),
	('00000000-0000-0000-0000-000000000000', '2f956e04-9e9b-4fda-8dff-dcb0c3d75d39', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 15:34:23.524104+00', ''),
	('00000000-0000-0000-0000-000000000000', '2cfcd5f3-1429-414a-a3a0-c07db1522a10', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 16:32:40.310798+00', ''),
	('00000000-0000-0000-0000-000000000000', '894bb5e7-9db8-4195-968a-e47b417dcbcd', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 16:32:40.311223+00', ''),
	('00000000-0000-0000-0000-000000000000', '0254a483-b5cd-439c-b88d-98c6b050b6fd', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 20:49:27.86437+00', ''),
	('00000000-0000-0000-0000-000000000000', '0d5ba056-6acb-45c2-abb1-248f580dbaea', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 20:49:27.864899+00', ''),
	('00000000-0000-0000-0000-000000000000', '0e634336-23e7-4fc0-9a57-028d83991d35', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 21:04:13.341722+00', ''),
	('00000000-0000-0000-0000-000000000000', '92a2e029-95d5-4ab2-9730-2831b73735ef', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 21:04:13.34219+00', ''),
	('00000000-0000-0000-0000-000000000000', '082a1b54-1005-4f5b-9d79-63b84bdc22c4', '{"action":"logout","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-06 21:13:30.66364+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd528ffca-8be2-4026-a3a9-98eff67e77f2', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-06 21:25:48.754281+00', ''),
	('00000000-0000-0000-0000-000000000000', '49e28a08-21fd-4d58-a76f-182ac6231073', '{"action":"login","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-06 21:33:24.117057+00', ''),
	('00000000-0000-0000-0000-000000000000', '9ce2ef84-2026-4f43-8ba4-8f9d2fddde37', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 22:18:07.765426+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a4e6e7ae-830f-48a2-9e11-fd3039e7591b', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 22:18:07.765928+00', ''),
	('00000000-0000-0000-0000-000000000000', '02a3f4ae-5bc5-48a5-8c00-17f2c9bdf2bf', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 22:24:03.71522+00', ''),
	('00000000-0000-0000-0000-000000000000', '786d9cbc-9bba-4801-8e53-9fbdc96dc634', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 22:24:03.715659+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cc98af19-c0a8-43a0-8949-f38f4ad46563', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 22:41:33.83066+00', ''),
	('00000000-0000-0000-0000-000000000000', '9863a4c5-ad6b-4373-bae0-be4053c100ef', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 22:41:33.831177+00', ''),
	('00000000-0000-0000-0000-000000000000', '07d319b1-50c1-415c-9cd5-c763b8ddcf0a', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 23:22:03.716749+00', ''),
	('00000000-0000-0000-0000-000000000000', '026444f6-b8db-452d-9b9b-e604eca00c55', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 23:22:03.717505+00', ''),
	('00000000-0000-0000-0000-000000000000', '282cba54-cfae-443a-9f3a-d1008a26a996', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 23:40:26.675887+00', ''),
	('00000000-0000-0000-0000-000000000000', '4521fa05-038c-47ee-bdb5-6abcfe6bcf7f', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 23:40:26.676342+00', ''),
	('00000000-0000-0000-0000-000000000000', '41347d1d-d48b-42ae-b1a1-f09db679ab27', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 23:40:31.247026+00', ''),
	('00000000-0000-0000-0000-000000000000', '3c13204b-1062-41ff-9c5c-2cf3c54e1e48', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-06 23:40:31.247515+00', ''),
	('00000000-0000-0000-0000-000000000000', '9db65a66-47d4-4825-9f3c-2f5fb2f227f6', '{"action":"login","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-06 23:40:46.875332+00', ''),
	('00000000-0000-0000-0000-000000000000', '0cb050b3-cc05-46b8-afd6-e858a9cdb6cf', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 00:20:10.05732+00', ''),
	('00000000-0000-0000-0000-000000000000', '604102a2-5b60-4ee7-8359-b2a7066fac75', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 00:20:10.057742+00', ''),
	('00000000-0000-0000-0000-000000000000', '19a43178-cb6c-48c4-87a7-841d321d93a9', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 00:57:30.391719+00', ''),
	('00000000-0000-0000-0000-000000000000', '4365e319-36da-4c47-87f8-68a85ce6e094', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 00:57:30.39228+00', ''),
	('00000000-0000-0000-0000-000000000000', '856f230a-f3ff-45a6-a851-9350b6294f51', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 01:18:10.071336+00', ''),
	('00000000-0000-0000-0000-000000000000', '4fc83580-43f8-4aed-9ec0-7ef4c56dd7c3', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 01:18:10.071766+00', ''),
	('00000000-0000-0000-0000-000000000000', '1506eae1-aae8-4a05-81e0-a8d57d4b97d5', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 01:37:14.285925+00', ''),
	('00000000-0000-0000-0000-000000000000', '2a503aee-8acb-4aba-8d5a-d71476db6e7c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 01:37:14.28641+00', ''),
	('00000000-0000-0000-0000-000000000000', '23a82a22-0b23-41c2-9d01-f580c7a7ab04', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 02:08:17.989654+00', ''),
	('00000000-0000-0000-0000-000000000000', '853ae4d0-3677-43df-a043-decd3d2f8e24', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 02:08:17.990095+00', ''),
	('00000000-0000-0000-0000-000000000000', '5f73c858-2f6e-471d-ae4b-ca8a98f12ace', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 02:16:10.063977+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e305be4b-b233-4c6a-848f-36fc5aab2c01', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 02:16:10.064602+00', ''),
	('00000000-0000-0000-0000-000000000000', '5b7ff9d1-9234-4dad-9c76-ea664eb65499', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 14:40:05.531563+00', ''),
	('00000000-0000-0000-0000-000000000000', '66e96bf6-b9c9-4ad6-938e-a9836687ac6a', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 14:40:05.535248+00', ''),
	('00000000-0000-0000-0000-000000000000', '524c2347-352e-4586-be3f-c4666715597f', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 15:10:05.021929+00', ''),
	('00000000-0000-0000-0000-000000000000', '68e2ee5a-6a97-4db9-8733-044c0844b17c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 15:10:05.022344+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd2d30705-2684-4bfd-ad44-75d6d5a84c9a', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 16:00:16.359064+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e87f20e1-fa85-435b-b421-b801e5cb5208', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 16:00:16.359731+00', ''),
	('00000000-0000-0000-0000-000000000000', '18e820a8-cc3b-4653-8ecc-f9c30f03b094', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 16:00:59.224295+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fcafe413-67c9-4be9-b347-419983b5b6dd', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 16:00:59.224687+00', ''),
	('00000000-0000-0000-0000-000000000000', '84ee866c-9a5b-4f19-a494-4dccb11e4e98', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 16:08:24.705577+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a9a15e36-2297-48ee-afda-4c6f62de3498', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 16:08:24.705972+00', ''),
	('00000000-0000-0000-0000-000000000000', '208a2684-8759-4542-b8b8-9a6d0ffe6216', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 16:58:51.840785+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd772830a-aab6-4426-aec1-80223e10e3b3', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 16:58:51.841286+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a2fc0a55-e876-4892-997e-18b21c88454e', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 17:06:35.916402+00', ''),
	('00000000-0000-0000-0000-000000000000', '384a9a2b-abcd-40f0-893d-f100ff757311', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 17:06:35.916854+00', ''),
	('00000000-0000-0000-0000-000000000000', '1769b8b6-85cd-49ad-b8af-7ef9774be444', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 20:02:51.632628+00', ''),
	('00000000-0000-0000-0000-000000000000', '6131992c-1dee-479f-866c-ffdb02d6ddd8', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 20:02:51.633135+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fb353600-41c4-42bb-b78e-900403e138e5', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 21:01:51.042074+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a876c8fb-e740-4da5-abd9-3d4f0db321be', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 21:01:51.042571+00', ''),
	('00000000-0000-0000-0000-000000000000', '70955643-c983-4193-a74a-b86db8e14f5b', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 21:33:20.221558+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a9d72d9e-d22b-4dc5-8022-8fc9a787f6ea', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 21:33:20.222074+00', ''),
	('00000000-0000-0000-0000-000000000000', '0b3f882b-9af8-4767-a403-d9f31e5853c4', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 22:46:02.602029+00', ''),
	('00000000-0000-0000-0000-000000000000', '3ca8027f-618f-4063-92c2-94a7e7789593', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 22:46:02.602475+00', ''),
	('00000000-0000-0000-0000-000000000000', '0c9c1519-cf09-4b8b-9f76-85fafcd6ab48', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 22:48:14.393379+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ae305f23-a36c-44be-88d9-0a09e2f04d7f', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-07 22:48:14.393784+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cbefba4a-854c-41d2-9d57-bf9447dcca29', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 00:52:56.41615+00', ''),
	('00000000-0000-0000-0000-000000000000', '3cec459e-f35a-4a21-81c0-f2c5a9a702f5', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 00:52:56.416646+00', ''),
	('00000000-0000-0000-0000-000000000000', '5eb588ef-ac54-4b95-b237-7f9a7d891fef', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 01:05:24.561304+00', ''),
	('00000000-0000-0000-0000-000000000000', '51a39b24-c127-4a24-8c1c-e640a0bde0cc', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 01:05:24.561735+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dc78e290-ccf9-4eb9-a91d-c97171762fdc', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 03:43:37.763658+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fa7d3296-4fd6-4883-a701-3e092344d5c2', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 03:43:37.764143+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b4e209e9-4a22-4ecf-a181-ee4df244de5a', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 15:42:09.299374+00', ''),
	('00000000-0000-0000-0000-000000000000', '13a499ce-44c9-442a-8b63-a1d14f71583a', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 15:42:09.320858+00', ''),
	('00000000-0000-0000-0000-000000000000', '75a35492-5076-4fbd-8f50-9d6b5c88c16f', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 17:27:22.726002+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc037bd4-11d1-4292-af86-6713d099b1c5', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 17:27:22.726539+00', ''),
	('00000000-0000-0000-0000-000000000000', '8878494d-f73b-4d8a-b69b-305cd9c72bbf', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 22:17:02.496627+00', ''),
	('00000000-0000-0000-0000-000000000000', '4fe6fb15-85c8-49e3-9d13-5004fa5363b4', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-08 22:17:02.49726+00', ''),
	('00000000-0000-0000-0000-000000000000', '77e92c90-d027-4546-a3da-6359dbd9d15e', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-11 17:58:16.995892+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f9674501-283c-4c45-a2e7-a18a1e9eb417', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-11 17:58:16.997908+00', ''),
	('00000000-0000-0000-0000-000000000000', '7e9fcd53-5cd7-4d9f-a3cc-b155512bf7d3', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-11 19:10:40.838765+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd5e34931-b36b-4026-a895-3cdad34ef32c', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-11 19:10:40.839271+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd586abff-007c-47b8-9791-fffad06b740b', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-11 20:53:02.266721+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a4a2ec75-ba3e-4e58-90f5-7016d91008d6', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-11 20:53:02.267373+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e49f65d3-ab46-408e-a71d-45e9b3a5a7ef', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-11 21:51:29.378582+00', ''),
	('00000000-0000-0000-0000-000000000000', '7c44cb96-bc1d-4651-98c3-b1fe38c5e3fa', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-11 21:51:29.379086+00', ''),
	('00000000-0000-0000-0000-000000000000', '15e706c5-04cc-42fa-992e-832a6a02b671', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-11 22:49:29.310114+00', ''),
	('00000000-0000-0000-0000-000000000000', '8cc250e4-d634-488b-8806-b271fe542320', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-11 22:49:29.31072+00', ''),
	('00000000-0000-0000-0000-000000000000', '1c189cee-6c52-4d1c-8867-c2644cc630a6', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 00:05:41.905824+00', ''),
	('00000000-0000-0000-0000-000000000000', '7737d8d2-c7fd-4ac3-88c9-e1425b7dc02f', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 00:05:41.906238+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f2de8fa-e8fe-4d50-8f1d-1fd4e55c5b11', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 01:36:07.775765+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e6173036-1fe3-49e2-89b0-78430b31af44', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 01:36:07.776293+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b81e58e4-4dd5-4fd5-b347-c45b17475616', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 15:46:35.095727+00', ''),
	('00000000-0000-0000-0000-000000000000', '233da931-3bc4-4df2-84de-8b2dce9e9c2a', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 15:46:35.097744+00', ''),
	('00000000-0000-0000-0000-000000000000', '3d3e24eb-01e2-458e-93b5-a0ca3f091ae6', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 17:14:57.233662+00', ''),
	('00000000-0000-0000-0000-000000000000', '83ffd03a-772e-4e04-a069-ff28090081a0', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 17:14:57.234351+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b83137f6-26c8-4a2e-8a6e-ca9b9a8b087f', '{"action":"token_refreshed","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 18:03:44.288642+00', ''),
	('00000000-0000-0000-0000-000000000000', '25e8b1c6-9495-44dd-b9d0-396feafc67f1', '{"action":"token_revoked","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 18:03:44.289194+00', ''),
	('00000000-0000-0000-0000-000000000000', '535ac5b1-405c-4e3e-b966-145a6a04d6c2', '{"action":"logout","actor_id":"222ef0a9-957b-47d6-a896-685347876113","actor_username":"aryan.kh88@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-12 18:03:48.462679+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ce37ec75-b894-4680-b8b5-503312d2c6b9', '{"action":"user_signedup","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2024-11-12 18:04:10.964184+00', ''),
	('00000000-0000-0000-0000-000000000000', '93e3aace-8b17-4aa5-b344-29df46e59fac', '{"action":"login","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-12 18:04:10.967724+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ff58e0df-0898-4469-bc5b-0e6ee4129e73', '{"action":"logout","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-12 18:04:39.178693+00', ''),
	('00000000-0000-0000-0000-000000000000', '090a232c-0ae7-4b8c-951f-ee94baf6bf5b', '{"action":"user_signedup","actor_id":"25e26ce5-a2a6-4d22-b275-830c891d0a63","actor_username":"2@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2024-11-12 18:04:50.731048+00', ''),
	('00000000-0000-0000-0000-000000000000', '6e7a4e1e-2b6f-4c74-a379-0c8c068ea231', '{"action":"login","actor_id":"25e26ce5-a2a6-4d22-b275-830c891d0a63","actor_username":"2@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-12 18:04:50.733279+00', ''),
	('00000000-0000-0000-0000-000000000000', '945985b2-faf7-4245-88ce-eaf53127c5d7', '{"action":"logout","actor_id":"25e26ce5-a2a6-4d22-b275-830c891d0a63","actor_username":"2@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-12 18:04:59.439491+00', ''),
	('00000000-0000-0000-0000-000000000000', '9e17725b-f448-4a75-9871-62a440e58087', '{"action":"user_signedup","actor_id":"0b3dd402-4edb-45d7-b359-08c421b89bcb","actor_username":"3@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2024-11-12 18:05:12.97074+00', ''),
	('00000000-0000-0000-0000-000000000000', '8c3a75a5-d91e-4fc5-bc77-98eea4cf8ec3', '{"action":"login","actor_id":"0b3dd402-4edb-45d7-b359-08c421b89bcb","actor_username":"3@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-12 18:05:12.973391+00', ''),
	('00000000-0000-0000-0000-000000000000', '9df0f2af-c89c-40c7-a12a-ec33ad8cdcae', '{"action":"token_refreshed","actor_id":"0b3dd402-4edb-45d7-b359-08c421b89bcb","actor_username":"3@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 19:16:38.800485+00', ''),
	('00000000-0000-0000-0000-000000000000', '33d38b34-d03d-44f3-b0f0-8923dca79179', '{"action":"token_revoked","actor_id":"0b3dd402-4edb-45d7-b359-08c421b89bcb","actor_username":"3@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 19:16:38.801064+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cbfeb198-fdf2-4b64-8aef-8c8847ecd8ef', '{"action":"logout","actor_id":"0b3dd402-4edb-45d7-b359-08c421b89bcb","actor_username":"3@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-12 19:26:15.732451+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ebd3d441-62b2-437e-ac11-b4c8b2f4ede5', '{"action":"login","actor_id":"25e26ce5-a2a6-4d22-b275-830c891d0a63","actor_username":"2@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-12 19:26:28.460587+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c6a98257-42cd-4f38-90b5-6e52a15311ce', '{"action":"logout","actor_id":"25e26ce5-a2a6-4d22-b275-830c891d0a63","actor_username":"2@gmail.com","actor_via_sso":false,"log_type":"account"}', '2024-11-12 19:32:42.862802+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7740922-83a5-4bfa-b0df-4891b55676bd', '{"action":"login","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-12 19:32:50.117042+00', ''),
	('00000000-0000-0000-0000-000000000000', '40fe7614-ebad-4b10-8bc6-c5e6dc2420aa', '{"action":"login","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-12 20:35:49.535632+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c72e0904-a981-49a2-b580-ed7786f1f543', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-13 01:01:14.183639+00', ''),
	('00000000-0000-0000-0000-000000000000', '0b763022-bba0-484f-81e3-6f3a4d443621', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-13 01:01:14.18414+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f58b5c8-6402-4b02-aba4-b43bce8d3ae0', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 21:43:52.036391+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f3fea435-7da7-40f6-94d3-8f35d08a4ca3', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-12 21:43:52.036904+00', ''),
	('00000000-0000-0000-0000-000000000000', '0d7841f3-7e37-4097-8d08-333d5edb11a8', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-13 16:45:29.192894+00', ''),
	('00000000-0000-0000-0000-000000000000', '7e46f57a-f5a4-4171-b497-40a841eba630', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-13 16:45:29.194896+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a21c30bc-692e-4901-bb64-a2957a4ac348', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-13 18:35:59.155217+00', ''),
	('00000000-0000-0000-0000-000000000000', 'abc894ab-373e-4b84-9b4b-266c180f215d', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-13 18:35:59.155819+00', ''),
	('00000000-0000-0000-0000-000000000000', '21e1dcbd-cad3-4524-8525-0842a06fe82c', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-13 22:04:14.403295+00', ''),
	('00000000-0000-0000-0000-000000000000', '4f0a0750-7e9e-4d7d-9a37-dd95ea227e44', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-13 22:04:14.40387+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ab44bf1e-55f3-4d5b-8139-6eac49228b81', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-13 23:32:37.838366+00', ''),
	('00000000-0000-0000-0000-000000000000', '34acda9c-2727-4a60-968e-d6ee729e23a6', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-13 23:32:37.838885+00', ''),
	('00000000-0000-0000-0000-000000000000', '92d8d9c0-9e04-4283-ae7a-7b3869a4f643', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 16:53:55.965345+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7494c98-92a4-4af5-91ee-bcd27b3f85b0', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 16:53:55.967287+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ecdaaccc-764c-4b22-94b2-f8131ad4ab69', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 19:08:13.918575+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ebeddfcb-4cec-4c47-9135-6f5fce6c9d87', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 19:08:13.919354+00', ''),
	('00000000-0000-0000-0000-000000000000', '54fd0f87-0193-4def-adfd-61c46def5a57', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 20:12:08.861167+00', ''),
	('00000000-0000-0000-0000-000000000000', '22e534ea-382e-4924-98f3-98759cfb72c3', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 20:12:08.861895+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a3a479ea-8d63-4763-8271-dae405e567c3', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 21:48:33.614891+00', ''),
	('00000000-0000-0000-0000-000000000000', '6403b5eb-37c5-4b13-980e-e8b3c1942ee7', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 21:48:33.61536+00', ''),
	('00000000-0000-0000-0000-000000000000', '633b9c8e-4864-43cc-965f-9b702f87df99', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 22:46:46.743965+00', ''),
	('00000000-0000-0000-0000-000000000000', '0bd4ca19-905b-44c6-9d18-217831d04f4f', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-14 22:46:46.744481+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bce0a1c6-8b21-477a-baed-d46ef49abedd', '{"action":"token_refreshed","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-18 23:12:37.995648+00', ''),
	('00000000-0000-0000-0000-000000000000', '990da07a-49e0-41b3-b3d0-6dce6cdc111f', '{"action":"token_revoked","actor_id":"a9db0379-1978-4450-8af3-3c07bfa2f7c4","actor_username":"susk@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-18 23:12:37.997814+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e59db02a-4949-481d-98f5-d9226eabf8ca', '{"action":"token_refreshed","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-18 23:29:49.358522+00', ''),
	('00000000-0000-0000-0000-000000000000', '4b287aa1-12df-4431-88f8-a00a49a7a968', '{"action":"token_revoked","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-18 23:29:49.370421+00', ''),
	('00000000-0000-0000-0000-000000000000', '885b05f7-7a49-4626-8ee3-c9e6890ee839', '{"action":"token_refreshed","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 01:55:24.660271+00', ''),
	('00000000-0000-0000-0000-000000000000', '2b9dedb5-207e-4d2d-9ac0-685fd36d65fd', '{"action":"token_revoked","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 01:55:24.661107+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c5503f48-5c00-454b-aca1-0ad0695b5a2f', '{"action":"token_refreshed","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 04:22:27.764907+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fa187ba8-960d-4fcf-b748-0b2927561bda', '{"action":"token_revoked","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 04:22:27.765467+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a089273a-295b-43fa-8707-38075612d809', '{"action":"token_refreshed","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 15:00:33.049121+00', ''),
	('00000000-0000-0000-0000-000000000000', '6f8f6a10-90a3-4ceb-9be7-072dc88c8a1f', '{"action":"token_revoked","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 15:00:33.050982+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a19d32e4-ca40-4edf-a929-c10d832e457a', '{"action":"token_refreshed","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 16:09:34.383605+00', ''),
	('00000000-0000-0000-0000-000000000000', '8cd97f93-7b1e-4747-9864-b52e35d47450', '{"action":"token_revoked","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 16:09:34.384901+00', ''),
	('00000000-0000-0000-0000-000000000000', '45e3e50d-5bed-4dbf-aaee-ba655a3ec677', '{"action":"token_refreshed","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 17:09:33.320901+00', ''),
	('00000000-0000-0000-0000-000000000000', '274f02b7-780f-4a05-b3d4-1126e19343e8', '{"action":"token_revoked","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 17:09:33.321481+00', ''),
	('00000000-0000-0000-0000-000000000000', '8ea0a307-fa61-4567-b9a3-66f1f810da9d', '{"action":"login","actor_id":"25e26ce5-a2a6-4d22-b275-830c891d0a63","actor_username":"2@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2024-11-19 17:21:47.939626+00', ''),
	('00000000-0000-0000-0000-000000000000', '80f6f4b6-e04d-4cd9-9b00-07f191a32a23', '{"action":"token_refreshed","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 19:18:07.534891+00', ''),
	('00000000-0000-0000-0000-000000000000', '05627622-30ab-4874-b7b1-23532dddc5ee', '{"action":"token_revoked","actor_id":"d654237f-11ea-49d0-91c5-ddc83dbe2127","actor_username":"1@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 19:18:07.535394+00', ''),
	('00000000-0000-0000-0000-000000000000', '305422a2-3c83-451e-8b57-c9f22cdeed47', '{"action":"token_refreshed","actor_id":"25e26ce5-a2a6-4d22-b275-830c891d0a63","actor_username":"2@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 19:18:07.534931+00', ''),
	('00000000-0000-0000-0000-000000000000', '1e5522dd-702c-4625-bd21-955be04ace85', '{"action":"token_revoked","actor_id":"25e26ce5-a2a6-4d22-b275-830c891d0a63","actor_username":"2@gmail.com","actor_via_sso":false,"log_type":"token"}', '2024-11-19 19:18:07.535611+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', 'authenticated', 'authenticated', '1@gmail.com', '$2a$10$A4uZy5.igKkpl.vHhlILFu.7qjH4NO7sLNpa/yt8I0Tlbx1YG8eVi', '2024-11-12 18:04:10.964666+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-11-12 19:32:50.117621+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "d654237f-11ea-49d0-91c5-ddc83dbe2127", "email": "1@gmail.com", "email_verified": false, "phone_verified": false}', NULL, '2024-11-12 18:04:10.958705+00', '2024-11-19 19:18:07.536779+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '25e26ce5-a2a6-4d22-b275-830c891d0a63', 'authenticated', 'authenticated', '2@gmail.com', '$2a$10$ejoKhPDgfFIRWqdicixQy.Qal08J.jG3Wpb6RB0ptkaF.nJIAFa2a', '2024-11-12 18:04:50.731418+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-11-19 17:21:47.940279+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "25e26ce5-a2a6-4d22-b275-830c891d0a63", "email": "2@gmail.com", "email_verified": false, "phone_verified": false}', NULL, '2024-11-12 18:04:50.727988+00', '2024-11-19 19:18:07.537084+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '222ef0a9-957b-47d6-a896-685347876113', 'authenticated', 'authenticated', 'aryan.kh88@gmail.com', '$2a$10$IHQ1o4Rn/Lpx3IoaH5AWwe5ZKNytceTBsDgU1dX.DSeoslXuZf9AG', '2024-10-13 00:09:46.31406+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-11-06 21:33:24.117703+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "222ef0a9-957b-47d6-a896-685347876113", "email": "aryan.kh88@gmail.com", "email_verified": false, "phone_verified": false}', NULL, '2024-10-13 00:09:46.304328+00', '2024-11-12 18:03:44.290554+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '0b3dd402-4edb-45d7-b359-08c421b89bcb', 'authenticated', 'authenticated', '3@gmail.com', '$2a$10$n96I4JcEeBr9d5HfNP/k8.xdfCI8gHj2GEeETeZkKJmMoxGZCnyOO', '2024-11-12 18:05:12.971185+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-11-12 18:05:12.974099+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "0b3dd402-4edb-45d7-b359-08c421b89bcb", "email": "3@gmail.com", "email_verified": false, "phone_verified": false}', NULL, '2024-11-12 18:05:12.967619+00', '2024-11-12 19:16:38.802867+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', 'authenticated', 'authenticated', 'susk@gmail.com', '$2a$10$2A7csE.V64CYAAz08mFnge4VnyIrTdDQpzaILoriR3vPYxKr.iawa', '2024-10-29 21:39:09.249636+00', NULL, '', NULL, '', NULL, '', '', NULL, '2024-11-12 20:35:49.536226+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "a9db0379-1978-4450-8af3-3c07bfa2f7c4", "email": "susk@gmail.com", "email_verified": false, "phone_verified": false}', NULL, '2024-10-29 21:39:09.243593+00', '2024-11-18 23:12:38.000971+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('222ef0a9-957b-47d6-a896-685347876113', '222ef0a9-957b-47d6-a896-685347876113', '{"sub": "222ef0a9-957b-47d6-a896-685347876113", "email": "aryan.kh88@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-10-13 00:09:46.309591+00', '2024-10-13 00:09:46.309618+00', '2024-10-13 00:09:46.309618+00', 'ab371971-fd85-4d09-9683-96223e067d5b'),
	('a9db0379-1978-4450-8af3-3c07bfa2f7c4', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', '{"sub": "a9db0379-1978-4450-8af3-3c07bfa2f7c4", "email": "susk@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-10-29 21:39:09.247111+00', '2024-10-29 21:39:09.247135+00', '2024-10-29 21:39:09.247135+00', 'ad205a46-b5ed-4f6b-bf81-43941ebadfa6'),
	('d654237f-11ea-49d0-91c5-ddc83dbe2127', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', '{"sub": "d654237f-11ea-49d0-91c5-ddc83dbe2127", "email": "1@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-11-12 18:04:10.962093+00', '2024-11-12 18:04:10.962117+00', '2024-11-12 18:04:10.962117+00', '8ff7d181-8565-4b7a-a941-e90fd3bd5eb1'),
	('25e26ce5-a2a6-4d22-b275-830c891d0a63', '25e26ce5-a2a6-4d22-b275-830c891d0a63', '{"sub": "25e26ce5-a2a6-4d22-b275-830c891d0a63", "email": "2@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-11-12 18:04:50.729701+00', '2024-11-12 18:04:50.729738+00', '2024-11-12 18:04:50.729738+00', '2381f7ae-bb08-4d0d-a499-516ad8376b27'),
	('0b3dd402-4edb-45d7-b359-08c421b89bcb', '0b3dd402-4edb-45d7-b359-08c421b89bcb', '{"sub": "0b3dd402-4edb-45d7-b359-08c421b89bcb", "email": "3@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2024-11-12 18:05:12.969353+00', '2024-11-12 18:05:12.969379+00', '2024-11-12 18:05:12.969379+00', '95b97bea-df55-4dbb-a39a-e62734afb845');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('881197e6-d151-4585-b655-51ebdb199ba2', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', '2024-11-06 23:40:46.875936+00', '2024-11-08 01:05:24.563388+00', NULL, 'aal1', NULL, '2024-11-08 01:05:24.563339', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', '172.18.0.1', NULL),
	('00c9eaef-8e15-4afa-a11a-fde39d8b8a91', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', '2024-11-12 20:35:49.536261+00', '2024-11-18 23:12:38.001852+00', NULL, 'aal1', NULL, '2024-11-18 23:12:38.001816', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '172.18.0.1', NULL),
	('2e0d41fd-6ba7-4366-b158-c95393f87ec4', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', '2024-11-12 19:32:50.117655+00', '2024-11-19 19:18:07.537454+00', NULL, 'aal1', NULL, '2024-11-19 19:18:07.537418', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '172.18.0.1', NULL),
	('a4a6252d-9b6b-445a-8c81-6aa145c63c88', '25e26ce5-a2a6-4d22-b275-830c891d0a63', '2024-11-19 17:21:47.940317+00', '2024-11-19 19:18:07.537961+00', NULL, 'aal1', NULL, '2024-11-19 19:18:07.537896', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '172.18.0.1', NULL),
	('cc4e7841-127e-4a04-86ef-37797e0fe8f0', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', '2024-11-05 22:00:36.046954+00', '2024-11-07 16:00:59.226474+00', NULL, 'aal1', NULL, '2024-11-07 16:00:59.226441', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36', '172.18.0.1', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('cc4e7841-127e-4a04-86ef-37797e0fe8f0', '2024-11-05 22:00:36.04851+00', '2024-11-05 22:00:36.04851+00', 'password', '2789a99c-e058-4764-b1f4-4f39377299c0'),
	('881197e6-d151-4585-b655-51ebdb199ba2', '2024-11-06 23:40:46.877615+00', '2024-11-06 23:40:46.877615+00', 'password', 'fd1b64fe-2dcc-4237-a875-2748d1ded609'),
	('2e0d41fd-6ba7-4366-b158-c95393f87ec4', '2024-11-12 19:32:50.119177+00', '2024-11-12 19:32:50.119177+00', 'password', '8a7de491-84e4-4718-917b-f903edaa4510'),
	('00c9eaef-8e15-4afa-a11a-fde39d8b8a91', '2024-11-12 20:35:49.537879+00', '2024-11-12 20:35:49.537879+00', 'password', '47be32b6-0ce2-4d53-9c5b-41410f765f29'),
	('a4a6252d-9b6b-445a-8c81-6aa145c63c88', '2024-11-19 17:21:47.94205+00', '2024-11-19 17:21:47.94205+00', 'password', '08699e2c-9fc0-44d0-bb01-4ccff370d10c');


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
	('00000000-0000-0000-0000-000000000000', 339, 'gmWX6FHa_Q6SFgoDu-YuoQ', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-12 21:43:52.03762+00', '2024-11-13 01:01:14.184546+00', 'cJFgN1K5rDM-kRP6fL9jjA', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 341, 'P8aSg0mkGaqH3pUJps-jxg', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-13 16:45:29.195808+00', '2024-11-13 18:35:59.156251+00', '7ctrNMz0KWj51svZfsD4bQ', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 343, 'I4wLErnCuz60trNhDn5NCg', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-13 22:04:14.404646+00', '2024-11-13 23:32:37.839357+00', 'nWlM1WqTR9Bp7yfxnpICIw', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 344, 'vNjnNOz42KrwCEj5a4ocjw', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-13 23:32:37.839663+00', '2024-11-14 16:53:55.96768+00', 'I4wLErnCuz60trNhDn5NCg', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 345, '8bq00aN6wVQh3hdtlFm_BA', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-14 16:53:55.968197+00', '2024-11-14 19:08:13.91982+00', 'vNjnNOz42KrwCEj5a4ocjw', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 346, 'aRNbeDk8N7cGc61tbef1sQ', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-14 19:08:13.920085+00', '2024-11-14 20:12:08.862392+00', '8bq00aN6wVQh3hdtlFm_BA', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 349, 'sunSHYpoCjBLG7Ljn8lYvw', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-14 22:46:46.745128+00', '2024-11-18 23:12:37.998225+00', 'FYbapAomuvcJqrTMCrX3dw', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 350, 'XExClNfDlX6RHznYkYA9xQ', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', false, '2024-11-18 23:12:37.998746+00', '2024-11-18 23:12:37.998746+00', 'sunSHYpoCjBLG7Ljn8lYvw', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 386, 'iP574NplK-PycwFYMrAPiA', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', true, '2024-11-19 15:00:33.052121+00', '2024-11-19 16:09:34.385475+00', 'WNQG95ZMQtnz9lKZovBWYQ', '2e0d41fd-6ba7-4366-b158-c95393f87ec4'),
	('00000000-0000-0000-0000-000000000000', 391, 'rqdup_KQgFJQn22g-ZFH3g', '25e26ce5-a2a6-4d22-b275-830c891d0a63', false, '2024-11-19 19:18:07.536291+00', '2024-11-19 19:18:07.536291+00', 'LCLujkZAD5GUCsr7kXgP4w', 'a4a6252d-9b6b-445a-8c81-6aa145c63c88'),
	('00000000-0000-0000-0000-000000000000', 244, 'alRxLEMY697QNIwUSAQgig', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-05 22:00:36.047629+00', '2024-11-05 23:04:30.323257+00', NULL, 'cc4e7841-127e-4a04-86ef-37797e0fe8f0'),
	('00000000-0000-0000-0000-000000000000', 246, 'CYqRIZgq2-bDLiFvpqn3Nw', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-05 23:04:30.323797+00', '2024-11-06 00:02:38.776101+00', 'alRxLEMY697QNIwUSAQgig', 'cc4e7841-127e-4a04-86ef-37797e0fe8f0'),
	('00000000-0000-0000-0000-000000000000', 248, 'R73L84gOhgPYRBSYTv_sOw', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-06 00:02:38.776377+00', '2024-11-06 03:10:37.968513+00', 'CYqRIZgq2-bDLiFvpqn3Nw', 'cc4e7841-127e-4a04-86ef-37797e0fe8f0'),
	('00000000-0000-0000-0000-000000000000', 251, 'I0oBz4IfD1VbOYkFK-mRww', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-06 03:10:37.968766+00', '2024-11-06 21:04:13.342621+00', 'R73L84gOhgPYRBSYTv_sOw', 'cc4e7841-127e-4a04-86ef-37797e0fe8f0'),
	('00000000-0000-0000-0000-000000000000', 288, 'ttHfGpRMgBbQB06d_jYFkQ', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-06 21:04:13.342845+00', '2024-11-06 22:18:07.766332+00', 'I0oBz4IfD1VbOYkFK-mRww', 'cc4e7841-127e-4a04-86ef-37797e0fe8f0'),
	('00000000-0000-0000-0000-000000000000', 291, 'SUZQINOnwxW224fcwcpj9g', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-06 22:18:07.766545+00', '2024-11-06 23:40:26.676729+00', 'ttHfGpRMgBbQB06d_jYFkQ', 'cc4e7841-127e-4a04-86ef-37797e0fe8f0'),
	('00000000-0000-0000-0000-000000000000', 314, 'hkPiAzcSaL1oV-gOd7FXlg', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-07 22:46:02.603047+00', '2024-11-08 01:05:24.56205+00', '0eNW2NOHs-ixy_uYKVw9IQ', '881197e6-d151-4585-b655-51ebdb199ba2'),
	('00000000-0000-0000-0000-000000000000', 338, 'cJFgN1K5rDM-kRP6fL9jjA', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-12 20:35:49.536936+00', '2024-11-12 21:43:52.03734+00', NULL, '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 340, '7ctrNMz0KWj51svZfsD4bQ', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-13 01:01:14.184829+00', '2024-11-13 16:45:29.195299+00', 'gmWX6FHa_Q6SFgoDu-YuoQ', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 342, 'nWlM1WqTR9Bp7yfxnpICIw', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-13 18:35:59.156704+00', '2024-11-13 22:04:14.404352+00', 'P8aSg0mkGaqH3pUJps-jxg', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 347, 'lvuLRhzyIW9428SINT5QGA', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-14 20:12:08.862871+00', '2024-11-14 21:48:33.615731+00', 'aRNbeDk8N7cGc61tbef1sQ', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 348, 'FYbapAomuvcJqrTMCrX3dw', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-14 21:48:33.615963+00', '2024-11-14 22:46:46.744868+00', 'lvuLRhzyIW9428SINT5QGA', '00c9eaef-8e15-4afa-a11a-fde39d8b8a91'),
	('00000000-0000-0000-0000-000000000000', 337, 'uVXsX-Fu2B0MAlMMwv9R4g', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', true, '2024-11-12 19:32:50.118287+00', '2024-11-18 23:29:49.377879+00', NULL, '2e0d41fd-6ba7-4366-b158-c95393f87ec4'),
	('00000000-0000-0000-0000-000000000000', 297, '1K2A0RZvR48afb_IPkWuiA', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-06 23:40:46.876698+00', '2024-11-07 00:57:30.393171+00', NULL, '881197e6-d151-4585-b655-51ebdb199ba2'),
	('00000000-0000-0000-0000-000000000000', 351, 'bWP-I4JJNwulCh3X0yGQkw', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', true, '2024-11-18 23:29:49.378416+00', '2024-11-19 01:55:24.661691+00', 'uVXsX-Fu2B0MAlMMwv9R4g', '2e0d41fd-6ba7-4366-b158-c95393f87ec4'),
	('00000000-0000-0000-0000-000000000000', 352, 'F4u_2zKxwl7sRr2QXmEE6g', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', true, '2024-11-19 01:55:24.662102+00', '2024-11-19 04:22:27.765991+00', 'bWP-I4JJNwulCh3X0yGQkw', '2e0d41fd-6ba7-4366-b158-c95393f87ec4'),
	('00000000-0000-0000-0000-000000000000', 299, 'OsS5ZDSZTxM6jKTE-wDwbQ', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-07 00:57:30.393471+00', '2024-11-07 02:08:17.990517+00', '1K2A0RZvR48afb_IPkWuiA', '881197e6-d151-4585-b655-51ebdb199ba2'),
	('00000000-0000-0000-0000-000000000000', 353, 'WNQG95ZMQtnz9lKZovBWYQ', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', true, '2024-11-19 04:22:27.766447+00', '2024-11-19 15:00:33.051505+00', 'F4u_2zKxwl7sRr2QXmEE6g', '2e0d41fd-6ba7-4366-b158-c95393f87ec4'),
	('00000000-0000-0000-0000-000000000000', 387, 'Kfu-M_utRQA-ivTVnrawQg', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', true, '2024-11-19 16:09:34.386097+00', '2024-11-19 17:09:33.321981+00', 'iP574NplK-PycwFYMrAPiA', '2e0d41fd-6ba7-4366-b158-c95393f87ec4'),
	('00000000-0000-0000-0000-000000000000', 302, 'YCXCBjt2AJPv-DOrsoasAw', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-07 02:08:17.99075+00', '2024-11-07 16:00:16.36025+00', 'OsS5ZDSZTxM6jKTE-wDwbQ', '881197e6-d151-4585-b655-51ebdb199ba2'),
	('00000000-0000-0000-0000-000000000000', 295, 'oOjvUJyhmVF4MLl5V_0NTA', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-06 23:40:26.676965+00', '2024-11-07 16:00:59.22507+00', 'SUZQINOnwxW224fcwcpj9g', 'cc4e7841-127e-4a04-86ef-37797e0fe8f0'),
	('00000000-0000-0000-0000-000000000000', 307, 'RD3HUAOmdU3n76ndqtpF5A', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', false, '2024-11-07 16:00:59.225272+00', '2024-11-07 16:00:59.225272+00', 'oOjvUJyhmVF4MLl5V_0NTA', 'cc4e7841-127e-4a04-86ef-37797e0fe8f0'),
	('00000000-0000-0000-0000-000000000000', 306, 'cjHKNp8euSdOZgzf10Dswg', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-07 16:00:16.360752+00', '2024-11-07 16:58:51.841701+00', 'YCXCBjt2AJPv-DOrsoasAw', '881197e6-d151-4585-b655-51ebdb199ba2'),
	('00000000-0000-0000-0000-000000000000', 388, '9x0yIhKHAk-y4C17QUwutQ', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', true, '2024-11-19 17:09:33.322268+00', '2024-11-19 19:18:07.535791+00', 'Kfu-M_utRQA-ivTVnrawQg', '2e0d41fd-6ba7-4366-b158-c95393f87ec4'),
	('00000000-0000-0000-0000-000000000000', 389, 'LCLujkZAD5GUCsr7kXgP4w', '25e26ce5-a2a6-4d22-b275-830c891d0a63', true, '2024-11-19 17:21:47.941069+00', '2024-11-19 19:18:07.536006+00', NULL, 'a4a6252d-9b6b-445a-8c81-6aa145c63c88'),
	('00000000-0000-0000-0000-000000000000', 390, 'J0Ak-FkDUjembtGJxp9y2Q', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', false, '2024-11-19 19:18:07.53608+00', '2024-11-19 19:18:07.53608+00', '9x0yIhKHAk-y4C17QUwutQ', '2e0d41fd-6ba7-4366-b158-c95393f87ec4'),
	('00000000-0000-0000-0000-000000000000', 309, 'CxMHlWWpHP-DAM-u-FmDjw', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-07 16:58:51.841955+00', '2024-11-07 21:33:20.22253+00', 'cjHKNp8euSdOZgzf10Dswg', '881197e6-d151-4585-b655-51ebdb199ba2'),
	('00000000-0000-0000-0000-000000000000', 313, '0eNW2NOHs-ixy_uYKVw9IQ', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', true, '2024-11-07 21:33:20.222847+00', '2024-11-07 22:46:02.602832+00', 'CxMHlWWpHP-DAM-u-FmDjw', '881197e6-d151-4585-b655-51ebdb199ba2'),
	('00000000-0000-0000-0000-000000000000', 317, 'sZWR_4lqaeMKBNBGWP6FPA', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4', false, '2024-11-08 01:05:24.562241+00', '2024-11-08 01:05:24.562241+00', 'hkPiAzcSaL1oV-gOd7FXlg', '881197e6-d151-4585-b655-51ebdb199ba2');


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
-- Data for Name: solana_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."solana_accounts" ("id", "private_key", "public_key", "created_at") VALUES
	('5e630480-a2d0-4388-b9db-477753552833', '[221,121,138,181,103,146,4,55,143,255,236,36,140,238,204,122,14,185,251,222,208,35,249,49,164,177,39,128,138,71,185,104,124,228,173,158,241,164,50,90,235,113,240,56,225,6,24,199,222,45,2,250,172,124,141,220,29,186,160,85,121,127,254,21]', '9QXoKnX6EBdTUswHAYs1iiUp2PR93ZBBRRuo37qHSb9N', '2024-10-22 18:48:09.743706+00'),
	('14ae62fc-8c27-4363-aa2c-6701f4f8e209', '[205,209,33,82,143,214,28,101,194,197,121,111,11,163,131,54,241,254,18,172,170,108,251,29,219,16,146,46,91,168,213,228,71,208,6,198,34,167,212,60,207,193,86,99,31,175,82,68,200,9,134,86,153,149,78,10,241,102,74,228,97,107,22,77]', '5qKvijFsmYierK8SwoVSuii9UmARJsFrhvMXYzfLhD3z', '2024-11-12 01:42:44.36963+00'),
	('811494f3-21c7-40bd-9243-f281010d5cc8', '[222,94,164,182,32,167,17,234,11,117,35,184,38,154,118,153,238,164,184,73,137,238,201,246,138,237,195,206,182,123,244,126,40,151,251,10,176,51,17,176,42,89,138,94,210,6,93,164,94,63,125,101,103,233,206,65,224,107,73,218,158,209,120,213]', '3jTinGG6e2S1s3Nw99dACPMDhyt7K1U7ZvvXTWpLNmVv', '2024-11-12 01:42:44.373591+00'),
	('55de027b-b7dc-4d3e-91fc-28367b2ca362', '[63,22,218,127,9,245,215,232,87,155,146,115,67,189,99,39,120,15,192,250,9,222,108,107,8,244,2,78,157,160,217,124,147,179,151,39,28,98,127,161,135,174,64,126,175,86,198,177,221,110,38,93,127,121,45,60,72,150,121,92,250,106,51,86]', 'AwZmDGRbup1PAJhQofVJhFHnXJGnPrvT8aYiGLAYgtAy', '2024-11-14 22:33:20.703187+00');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."users" ("id", "username", "deposit_address") VALUES
	('222ef0a9-957b-47d6-a896-685347876113', 'aryan', 'GE9MfQ3xfGBxAoAv7iAFeSGNmht5U6m77AzKWFPb24Uj'),
	('a9db0379-1978-4450-8af3-3c07bfa2f7c4', 'susk', 'EeEnZCXEFgSPhEy3MNgSq2dHCkLacHGp6egqtB3k3JfQ'),
	('d654237f-11ea-49d0-91c5-ddc83dbe2127', '11', '4tC3QXFqrG2Q529AdNUFymcy7sspVTtLBe93JK29DZCN'),
	('0b3dd402-4edb-45d7-b359-08c421b89bcb', '33', 'DWwAE2HTQFmj6J4BpsUUyWKqYd7NiVzLPRBXPiKEM3nS'),
	('25e26ce5-a2a6-4d22-b275-830c891d0a63', '22', 'BYUGp7tsnQthjNFMGN5Vh8GYBUetb56gZdJU9RVx2nhx');


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."tasks" ("id", "created_by", "kind", "status", "title", "details", "max_winners", "created_at", "edited_at", "ended_at", "deleted_at", "deposit_address") VALUES
	('9e42a709-3f43-4aff-a1b7-2ba4aa20d609', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'Create a file .github/workflows/update-types.yml with the following snippet to define the action along with the environment variables. This script will commit new type changes to your repo every night', 'Using Row Level Security policies may not always be adequate or sufficient to protect APIs.

Here are some common situations where additional protections are necessary:

 - Enforcing per-IP or per-user rate limits.
 - Checking custom or additional API keys before allowing further access.
 - Rejecting requests after exceeding a quota or requiring payment.
 - Disallowing direct access to certain tables, views or functions in the public schema.

You can build these cases in your application by creating a Postgres function that will read information from the request and perform additional checks, such as counting the number of requests received or checking that an API key is already registered in your database before serving the response.', 1, '2024-10-28 18:06:17.399472+00', NULL, NULL, NULL, '811494f3-21c7-40bd-9243-f281010d5cc8'),
	('bb56b9bf-5933-45df-822d-779f1b7e52ae', '222ef0a9-957b-47d6-a896-685347876113', 'community', 'active', 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than 2.5 times that of all the other planets in the Solar System combined', 'Jupiter is believed to be the oldest planet in the Solar System, having formed just one million years after the Sun and roughly 50 million years before Earth.[25] Current models of Solar System formation suggest that Jupiter formed at or beyond the snow line: a distance from the early Sun where the temperature was sufficiently cold for volatiles such as water to condense into solids.[26] First forming a solid core, the planet then accumulated its gaseous atmosphere. Therefore, the planet must have formed before the solar nebula was fully dispersed.[27] During its formation, Jupiter''s mass gradually increased until it had 20 times the mass of the Earth, approximately half of which was made up of silicates, ices and other heavy-element constituents.[25] When the proto-Jupiter grew larger than 50 Earth masses it created a gap in the solar nebula.[25] Thereafter, the growing planet reached its final mass in 3–4 million years.[25][27] Since Jupiter is made of the same elements as the Sun (hydrogen and helium) it has been suggested that the Solar System might have been early in its formation a system of multiple protostars, which are quite common, with Jupiter being the second but failed protostar. But the Solar System never developed into a system of multiple stars and Jupiter does not qualify as a protostar or brown dwarf since it does not have enough mass to fuse hydrogen.[28][29]

According to the "grand tack hypothesis", Jupiter began to form at a distance of roughly 3.5 AU (520 million km; 330 million mi) from the Sun. As the young planet accreted mass, its interaction with the gas disk orbiting the Sun and the orbital resonances from Saturn caused it to migrate inward.[26][30] This upset the orbits of several super-Earths orbiting closer to the Sun, causing them to collide destructively.[31] Saturn would later have begun to migrate inwards at a faster rate than Jupiter until the two planets became captured in a 3:2 mean motion resonance at approximately 1.5 AU (220 million km; 140 million mi) from the Sun.[32] This changed the direction of migration, causing them to migrate away from the Sun and out of the inner system to their current locations.[31] All of this happened over a period of 3–6 million years, with the final migration of Jupiter occurring over several hundred thousand years.[30][33] Jupiter''s migration from the inner solar system eventually allowed the inner planets—including Earth—to form from the rubble.[34]

There are several unresolved issues with the grand tack hypothesis. The resulting formation timescales of terrestrial planets appear to be inconsistent with the measured elemental composition.[35] Jupiter would likely have settled into an orbit much closer to the Sun if it had migrated through the solar nebula.[36] Some competing models of Solar System formation predict the formation of Jupiter with orbital properties that are close to those of the present-day planet.[27] Other models predict Jupiter forming at distances much farther out, such as 18 AU (2.7 billion km; 1.7 billion mi).[37][38]

According to the Nice model, the infall of proto-Kuiper belt objects over the first 600 million years of Solar System history caused Jupiter and Saturn to migrate from their initial positions into a 1:2 resonance, which caused Saturn to shift into a higher orbit, disrupting the orbits of Uranus and Neptune, depleting the Kuiper belt, and triggering the Late Heavy Bombardment.[39]

Based on Jupiter''s composition, researchers have made the case for an initial formation outside the molecular nitrogen (N2) snow line, which is estimated at 20–30 AU (3.0–4.5 billion km; 1.9–2.8 billion mi) from the Sun, and possibly even outside the argon snow line, which may be as far as 40 AU (6.0 billion km; 3.7 billion mi).[40][41] Having formed at one of these extreme distances, Jupiter would then have, over a roughly 700,000-year period, migrated inwards to its current location,[37][38] during an epoch approximately 2–3 million years after the planet began to form. In this model, Saturn, Uranus, and Neptune would have formed even further out than Jupiter, and Saturn would also have migrated inwards.[37]', 3, '2024-11-06 00:15:24.000684+00', NULL, NULL, NULL, '14ae62fc-8c27-4363-aa2c-6701f4f8e209'),
	('87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', 'personal', 'active', 'modifiers to target media queries like responsive breakpoints, dark mode, prefers-reduced-motion, and more', 'import { QueryResult, QueryData, QueryError } from ''@supabase/supabase-js''

const countriesWithCitiesQuery = supabase.from(''countries'').select(`
  id,
  name,
  cities (
    id,
    name
  )
`)
type CountriesWithCities = QueryData<typeof countriesWithCitiesQuery>

const { data, error } = await countriesWithCitiesQuery
if (error) throw error
const countriesWithCities: CountriesWithCities = data
', 1, '2024-10-22 18:58:13.991484+00', NULL, NULL, NULL, '5e630480-a2d0-4388-b9db-477753552833');


--
-- Data for Name: solutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."solutions" ("id", "task_id", "created_by", "details", "is_winner", "created_at", "edited_at", "deleted_at", "title") VALUES
	('96607aad-b834-4835-a95e-267269d06fe5', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '19 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:19:38.640475+00', NULL, NULL, 'By default, views are accessed with their creator''s permission ("security definer"). If a privileged role creates a view, others accessing it will use that role''s elevated permissions'),
	('6f0ef9f7-d01d-4bf6-8ac0-cf92e01c6e32', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '14 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:02:21.534198+00', NULL, NULL, 'Creating a materialized view is not a solution to inefficient queries. You should always seek to optimize a slow running query even if you are implementing a materialized view.'),
	('280d392c-9509-4661-b291-dcda2375a49a', '9e42a709-3f43-4aff-a1b7-2ba4aa20d609', '222ef0a9-957b-47d6-a896-685347876113', 'ncbvmnxcbvnmcxbvnmxcbvmncbvmnxcbvnmxcbvxmncbvcmxnbvxmcnbvmxcv', false, '2024-10-29 20:08:21.530074+00', NULL, NULL, NULL),
	('9cbd6d1a-0740-43ed-bbab-74442637a043', 'bb56b9bf-5933-45df-822d-779f1b7e52ae', '222ef0a9-957b-47d6-a896-685347876113', 'Saturn''s atmosphere exhibits a banded pattern similar to Jupiter''s, but Saturn''s bands are much fainter and are much wider near the equator. The nomenclature used to describe these bands is the same as on Jupiter. Saturn''s finer cloud patterns were not observed until the flybys of the Voyager spacecraft during the 1980s. Since then, Earth-based telescopy has improved to the point where regular observations can be made.[61]

The composition of the clouds varies with depth and increasing pressure. In the upper cloud layers, with temperatures in the range of 100–160 K and pressures extending between 0.5–2 bar, the clouds consist of ammonia ice. Water ice clouds begin at a level where the pressure is about 2.5 bar and extend down to 9.5 bar, where temperatures range from 185 to 270 K. Intermixed in this layer is a band of ammonium hydrosulfide ice, lying in the pressure range 3–6 bar with temperatures of 190–235 K. Finally, the lower layers, where pressures are between 10 and 20 bar and temperatures are 270–330 K, contains a region of water droplets with ammonia in aqueous solution.[62]

Saturn''s usually bland atmosphere occasionally exhibits long-lived ovals and other features common on Jupiter. In 1990, the Hubble Space Telescope imaged an enormous white cloud near Saturn''s equator that was not present during the Voyager encounters, and in 1994 another smaller storm was observed. The 1990 storm was an example of a Great White Spot, a short-lived phenomenon that occurs once every Saturnian year, roughly every 30 Earth years, around the time of the northern hemisphere''s summer solstice.[63] Previous Great White Spots were observed in 1876, 1903, 1933, and 1960, with the 1933 storm being the best observed.[64] The latest giant storm was observed in 2010. In 2015, researchers used Very Large Array telescope to study Saturnian atmosphere, and reported that they found "long-lasting signatures of all mid-latitude giant storms, a mixture of equatorial storms up to hundreds of years old, and potentially an unreported older storm at 70°N".[65]

The winds on Saturn are the second fastest among the Solar System''s planets, after Neptune''s. Voyager data indicate peak easterly winds of 500 m/s (1,800 km/h).[66] In images from the Cassini spacecraft during 2007, Saturn''s northern hemisphere displayed a bright blue hue, similar to Uranus. The color was most likely caused by Rayleigh scattering.[67] Thermography has shown that Saturn''s south pole has a warm polar vortex, the only known example of such a phenomenon in the Solar System.[68] Whereas temperatures on Saturn are normally −185 °C, temperatures on the vortex often reach as high as −122 °C, suspected to be the warmest spot on Saturn.[68]', false, '2024-11-06 02:23:08.450903+00', NULL, NULL, 'Saturn''s interior is thought to be composed of a rocky core, surrounded by a deep layer of metallic hydrogen, an intermediate layer of liquid hydrogen and liquid helium, and an outer layer of gas'),
	('7542ce92-2b4f-4c63-80a5-085cbaba21a5', 'bb56b9bf-5933-45df-822d-779f1b7e52ae', '222ef0a9-957b-47d6-a896-685347876113', 'Submit Your Solution
 Submit Your Solution
Submit Your Solution
', false, '2024-11-06 02:27:48.184623+00', NULL, NULL, 'title'),
	('ca514a88-135e-427d-902b-5c4321726ca3', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '17 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:16:41.798346+00', NULL, NULL, 'In subsequent reads of a materialized view, the time taken to return its results would be much faster than a conventional view. This is because the data is readily available for a materialized view while the conventional view executes the underlying query each time it is called'),
	('7443f705-f817-41a9-8c90-53a366540df0', '87ccc3d1-c8c5-44f8-9efe-a4bac7bb3329', '222ef0a9-957b-47d6-a896-685347876113', '16 password-based auth safely, using secure configuration options an', false, '2024-10-25 02:16:06.075571+00', NULL, NULL, 'Materialized views are useful when execution times for queries or views are too slow. These could likely occur in views or queries involving multiple tables and billions of rows'),
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

If you don''t specify a redirect URL, the user is automatically redirected to your site URL. This defaults to localhost:3000, but you can also configure this.', false, '2024-10-26 22:16:48.184148+00', NULL, NULL, 'The Supabase CLI is a single binary Go application that provides everything you need to setup a local development environment.'),
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

If you don''t specify a redirect URL, the user is automatically redirected to your site URL. This defaults to localhost:3000, but you can also configure this.', false, '2024-10-26 22:17:07.397648+00', NULL, NULL, 'Sometimes the generated types are not what you expect'),
	('7f21d13a-492c-4c59-8e92-bf9c686bd40d', '9e42a709-3f43-4aff-a1b7-2ba4aa20d609', '222ef0a9-957b-47d6-a896-685347876113', 'Dh shush he he j e Jr he eh Jed he hit rifjdhebfjfjebrifhebrjrhrh', false, '2024-10-29 21:25:55.030943+00', NULL, NULL, 'hjglfjhflgihjfijhfijhljghlidjhgidhfksugdfkadbdshjbfnbcvmxnvbmznbckahgdkshegfksrhgksjbdfsnvbsfjdbnakjdfbskhvbhfbkdbfsk'),
	('348e47ee-180c-4b12-92d2-57e9b7873648', '9e42a709-3f43-4aff-a1b7-2ba4aa20d609', '222ef0a9-957b-47d6-a896-685347876113', 'Here are some points:

     - abc
     - 123
     - xyz

that is all

', false, '2024-11-11 21:27:36.814936+00', NULL, NULL, 'newline'),
	('fe5c61b8-ca7b-468a-bdda-d8334d87a8a5', 'bb56b9bf-5933-45df-822d-779f1b7e52ae', '0b3dd402-4edb-45d7-b359-08c421b89bcb', 'build one and travel build one and travel build one and travel', false, '2024-11-12 19:24:13.502778+00', NULL, NULL, 'spaceship'),
	('8fac2e13-c4e8-4031-8ef1-6b3d12ce2136', 'bb56b9bf-5933-45df-822d-779f1b7e52ae', '25e26ce5-a2a6-4d22-b275-830c891d0a63', 'find one and ascend find one and ascend find one and ascend', false, '2024-11-12 19:32:06.328409+00', NULL, NULL, 'wormhole'),
	('1fc5df5d-ea5f-49bf-9ced-909a30236bb8', 'bb56b9bf-5933-45df-822d-779f1b7e52ae', 'd654237f-11ea-49d0-91c5-ddc83dbe2127', 'the universe is mathematics come to life the universe is mathematics come to life', false, '2024-11-12 19:34:39.770099+00', NULL, NULL, 'math');


--
-- Data for Name: solution_votes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: task_funding; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: task_payout; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: temp_wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."temp_wallets" ("id", "private_key", "public_key", "created_at", "user_id") VALUES
	('9245979b-84b5-4cd9-b3c2-f3c57e5ac715', '[102,94,136,233,151,251,201,178,28,77,53,45,180,242,58,69,102,189,58,103,95,10,132,244,236,36,70,114,191,132,224,94,226,61,77,135,80,159,110,13,90,139,252,249,226,101,171,98,86,149,216,90,203,204,217,165,151,204,21,48,25,34,247,188]', 'GE9MfQ3xfGBxAoAv7iAFeSGNmht5U6m77AzKWFPb24Uj', '2024-11-12 19:18:14.874618+00', '222ef0a9-957b-47d6-a896-685347876113'),
	('c56b6375-4de0-4a79-bc40-8230833a60bc', '[121,143,66,221,190,157,243,170,8,113,127,68,246,66,133,111,137,104,25,13,170,222,5,175,252,135,14,45,62,146,235,40,202,178,1,217,7,4,50,75,250,242,18,198,129,54,200,60,142,90,138,123,150,201,221,42,204,61,12,141,149,19,225,87]', 'EeEnZCXEFgSPhEy3MNgSq2dHCkLacHGp6egqtB3k3JfQ', '2024-11-12 19:18:14.888054+00', 'a9db0379-1978-4450-8af3-3c07bfa2f7c4'),
	('5b8f6263-4cba-45fb-8c76-cdab516c3c03', '[52,109,113,177,118,124,94,188,10,35,71,159,194,185,139,204,238,114,211,216,145,154,86,76,251,138,214,170,83,188,184,147,57,176,42,171,94,127,201,75,127,109,181,238,101,50,127,253,65,34,118,197,122,255,189,121,217,18,236,198,56,27,232,19]', '4tC3QXFqrG2Q529AdNUFymcy7sspVTtLBe93JK29DZCN', '2024-11-12 19:18:14.902735+00', 'd654237f-11ea-49d0-91c5-ddc83dbe2127'),
	('f6f574e2-865d-42cc-9337-23a9988b8a28', '[190,153,247,174,84,198,86,251,146,241,51,208,145,183,8,204,160,15,97,140,89,120,107,169,130,77,1,52,188,24,134,77,156,164,182,43,158,68,17,64,205,74,224,155,217,195,109,215,216,48,216,162,185,234,136,144,249,6,90,148,68,126,253,179]', 'BYUGp7tsnQthjNFMGN5Vh8GYBUetb56gZdJU9RVx2nhx', '2024-11-12 19:18:14.919334+00', '25e26ce5-a2a6-4d22-b275-830c891d0a63'),
	('db4b54ad-ebb3-4bed-ace9-ed01cfdeb8a6', '[255,15,181,57,75,234,143,27,204,16,254,230,238,226,161,133,149,43,250,232,4,144,198,198,162,146,187,172,108,11,161,95,185,247,83,12,53,160,200,199,48,134,183,25,31,136,95,49,37,73,51,4,178,201,237,183,74,241,214,122,216,218,200,3]', 'DWwAE2HTQFmj6J4BpsUUyWKqYd7NiVzLPRBXPiKEM3nS', '2024-11-12 19:18:14.936389+00', '0b3dd402-4edb-45d7-b359-08c421b89bcb');


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

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 391, true);


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
