-- Club Shelter: seguridad para que la web pueda usar las tablas sin exponer datos.
-- Pegar en Supabase → SQL Editor → Run.

-- Clientes: la web solo puede CARGAR. Nadie de afuera puede leer, editar ni borrar.
alter table public."Clientes" enable row level security;

drop policy if exists "La web puede sumar clientes" on public."Clientes";
create policy "La web puede sumar clientes"
  on public."Clientes" for insert
  to anon
  with check ("ID_cliente" is null and "Frecuencia Mensual" is null);

-- Gama de clientes: la web solo puede LEER los niveles (puntos y descuento).
alter table public."Gama de clientes" enable row level security;

drop policy if exists "La web puede ver los niveles" on public."Gama de clientes";
create policy "La web puede ver los niveles"
  on public."Gama de clientes" for select
  to anon
  using (true);
