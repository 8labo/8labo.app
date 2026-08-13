-- ８LABO common platform
-- Admin import/export permissions for authenticated SYSTEM_ADMIN users.
-- Apply this migration to the Supabase project before using admin imports.

-- PERSONS
create policy "system_admin_insert_persons"
on public.persons for insert to authenticated
with check ((select public.is_system_admin()));

create policy "system_admin_update_persons"
on public.persons for update to authenticated
using ((select public.is_system_admin()))
with check ((select public.is_system_admin()));

create policy "system_admin_delete_persons"
on public.persons for delete to authenticated
using ((select public.is_system_admin()));

-- RELATIONSHIPS
create policy "system_admin_select_relationships"
on public.person_relationships for select to authenticated
using ((select public.is_system_admin()));

create policy "system_admin_insert_relationships"
on public.person_relationships for insert to authenticated
with check ((select public.is_system_admin()));

create policy "system_admin_update_relationships"
on public.person_relationships for update to authenticated
using ((select public.is_system_admin()))
with check ((select public.is_system_admin()));

create policy "system_admin_delete_relationships"
on public.person_relationships for delete to authenticated
using ((select public.is_system_admin()));

-- SERVICES
create policy "system_admin_insert_services"
on public.services for insert to authenticated
with check ((select public.is_system_admin()));

create policy "system_admin_update_services"
on public.services for update to authenticated
using ((select public.is_system_admin()))
with check ((select public.is_system_admin()));

-- SERVICE MEMBERSHIPS
create policy "system_admin_insert_memberships"
on public.service_memberships for insert to authenticated
with check ((select public.is_system_admin()));

create policy "system_admin_update_memberships"
on public.service_memberships for update to authenticated
using ((select public.is_system_admin()))
with check ((select public.is_system_admin()));

create policy "system_admin_delete_memberships"
on public.service_memberships for delete to authenticated
using ((select public.is_system_admin()));

-- ASSESSMENT ITEMS
create policy "system_admin_insert_assessment_items"
on public.assessment_items for insert to authenticated
with check ((select public.is_system_admin()));

create policy "system_admin_update_assessment_items"
on public.assessment_items for update to authenticated
using ((select public.is_system_admin()))
with check ((select public.is_system_admin()));

-- ASSESSMENT SESSIONS
create policy "system_admin_select_assessment_sessions"
on public.assessment_sessions for select to authenticated
using ((select public.is_system_admin()));

create policy "system_admin_insert_assessment_sessions"
on public.assessment_sessions for insert to authenticated
with check ((select public.is_system_admin()));

create policy "system_admin_update_assessment_sessions"
on public.assessment_sessions for update to authenticated
using ((select public.is_system_admin()))
with check ((select public.is_system_admin()));

create policy "system_admin_delete_assessment_sessions"
on public.assessment_sessions for delete to authenticated
using ((select public.is_system_admin()));

-- ASSESSMENT RESULTS
create policy "system_admin_insert_assessment_results"
on public.assessment_results for insert to authenticated
with check ((select public.is_system_admin()));

create policy "system_admin_update_assessment_results"
on public.assessment_results for update to authenticated
using ((select public.is_system_admin()))
with check ((select public.is_system_admin()));

create policy "system_admin_delete_assessment_results"
on public.assessment_results for delete to authenticated
using ((select public.is_system_admin()));

-- CONSENTS
create policy "system_admin_select_consent_definitions"
on public.consent_definitions for select to authenticated
using ((select public.is_system_admin()));

create policy "system_admin_insert_consent_definitions"
on public.consent_definitions for insert to authenticated
with check ((select public.is_system_admin()));

create policy "system_admin_update_consent_definitions"
on public.consent_definitions for update to authenticated
using ((select public.is_system_admin()))
with check ((select public.is_system_admin()));

create policy "system_admin_select_person_consents"
on public.person_consents for select to authenticated
using ((select public.is_system_admin()));

create policy "system_admin_insert_person_consents"
on public.person_consents for insert to authenticated
with check ((select public.is_system_admin()));

create policy "system_admin_update_person_consents"
on public.person_consents for update to authenticated
using ((select public.is_system_admin()))
with check ((select public.is_system_admin()));

-- Optional helper view for a human-readable export of service memberships.
create or replace view public.admin_membership_export
with (security_invoker = true)
as
select
  p.labo_id,
  p.last_name,
  p.first_name,
  s.service_code,
  s.service_name,
  sm.membership_status,
  sm.applied_at,
  sm.started_at,
  sm.ended_at,
  sm.notes
from public.service_memberships sm
join public.persons p on p.id = sm.person_id
join public.services s on s.id = sm.service_id;
