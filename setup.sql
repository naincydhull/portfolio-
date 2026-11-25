-- ============================================================
--  Naincy Portfolio — Supabase setup
--  Run this ONCE:
--    Supabase Dashboard -> SQL Editor -> New query -> paste -> Run
--  Safe to run again (it does not delete anything).
-- ============================================================

-- ------------------------------------------------------------
-- 1) Table that holds ALL website information
--    (profile / hero, about, education, skills, contact, settings)
--    key = section name, value = the JSON data of that section
-- ------------------------------------------------------------
create table if not exists public.site_content (
  key        text primary key,
  value      jsonb   not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

grant usage on schema public to anon, authenticated;
grant select on table public.site_content to anon;
grant select, insert, update, delete on table public.site_content to authenticated;

alter table public.site_content enable row level security;

-- website visitors can read it
drop policy if exists "public read site_content" on public.site_content;
create policy "public read site_content"
  on public.site_content for select
  to anon
  using (true);

-- the logged-in admin can do everything
drop policy if exists "admin all site_content" on public.site_content;
create policy "admin all site_content"
  on public.site_content for all
  to authenticated
  using (true) with check (true);

-- ------------------------------------------------------------
-- 2) FIX: the website could not read the projects table
--    (error: permission denied for table projects)
-- ------------------------------------------------------------
grant select on table public.projects to anon;
grant select, insert, update, delete on table public.projects to authenticated;
alter table public.projects enable row level security;

drop policy if exists "public read projects" on public.projects;
create policy "public read projects"
  on public.projects for select
  to anon
  using (true);

-- admin (logged in) can manage projects
drop policy if exists "admin all projects" on public.projects;
create policy "admin all projects"
  on public.projects for all
  to authenticated
  using (true) with check (true);

-- ------------------------------------------------------------
-- 3) FIX: website visitors must be able to send contact messages
-- ------------------------------------------------------------
grant insert on table public.messages to anon;
grant select, delete on table public.messages to authenticated;
alter table public.messages enable row level security;

drop policy if exists "public send messages" on public.messages;
create policy "public send messages"
  on public.messages for insert
  to anon
  with check (true);

drop policy if exists "admin read messages" on public.messages;
create policy "admin read messages"
  on public.messages for select
  to authenticated
  using (true);

drop policy if exists "admin delete messages" on public.messages;
create policy "admin delete messages"
  on public.messages for delete
  to authenticated
  using (true);

-- ------------------------------------------------------------
-- Done. Quick check (optional):
--   select key, updated_at from public.site_content;
-- ------------------------------------------------------------
