
-- 4. Lead Gen Business
-- 1. What query would you run to get the total revenue for March of 2012?
use lead_gen_business;

-- select monthname(charged_datetime), year(charged_datetime), sum(amount) as total_revenue from billing
-- where (monthname(charged_datetime) = 'March' and year(charged_datetime) = 2012)

-- 2. What query would you run to get total revenue collected from the client with an id of 2?

-- select clients.client_id, sum(amount) as total_revenue from billing 
-- join clients on clients.client_id = billing.client_id
-- where clients.client_id = 2;

-- 3. What query would you run to get all the sites that client=10 owns?

-- select clients.client_id, sites.domain_name
-- from clients
-- join sites on clients.client_id = sites.client_id
-- where clients.client_id = 10


-- 4. What query would you run to get total # of sites created per month per year for the client with an id of 1? What about for client=20?
-- select year(sites.created_datetime) as year_created, monthname(sites.created_datetime) as month_created, clients.client_id, count(sites.site_id) as number_of_websites
-- from clients
-- join sites on clients.client_id = sites.client_id
-- where clients.client_id = 1 
-- -- where clients.client_id = 20
-- group by sites.created_datetime

-- 5. What query would you run to get the total # of leads generated for each of the sites between January 1, 2011 to February 15, 2011?

-- select date_format(leads.registered_datetime,'%M %d, %Y'), sites.domain_name as site_name, count(leads.leads_id) as total_number_of_leads_generated
-- from sites
-- join leads on sites.site_id = leads.site_id
-- where leads.registered_datetime between '2011-01-01' and '2011-02-15'
-- group by leads.registered_datetime 

 
-- 6. What query would you run to get a list of client names and the total # of leads we've generated for each of our clients between January 1, 2011 to December 31, 2011?

-- select clients.first_name, clients.last_name, date_format(leads.registered_datetime,'%M %d, %Y'), sites.domain_name as site_name, count(leads.leads_id) as total_number_of_leads_generated
-- from clients
-- join sites on clients.client_id = sites.client_id
-- join leads on sites.site_id = leads.site_id
-- where leads.registered_datetime between '2011-01-01' and '2011-12-31'
-- group by clients.client_id


-- 7. What query would you run to get a list of client names and the total # of leads we've generated for each client each month between months 1 - 6 of Year 2011?

-- select clients.first_name, clients.last_name, monthname(leads.registered_datetime) as month_generated, count(leads.leads_id) as total_number_of_leads_generated
-- from clients
-- join sites on clients.client_id = sites.client_id
-- join leads on sites.site_id = leads.site_id
-- where (leads.registered_datetime >= '2011-01-01' and leads.registered_datetime <= '2011-06-30')
-- group by leads.registered_datetime

-- 8. What query would you run to get a list of client names and the total # of leads we've generated for each of our clients' sites between January 1, 2011 to December 31, 2011? Order this query by client id.  Come up with a second query that shows all the clients, the site name(s), and the total number of leads generated from each site for all time.

-- (1)
-- select clients.first_name, clients.last_name, sites.domain_name, count(leads.leads_id) as number_of_leads_generated, date_format(leads.registered_datetime,'%M %d, %Y')
-- from clients
-- join sites on clients.client_id = sites.client_id
-- join leads on sites.site_id = leads.site_id
-- where (leads.registered_datetime >= '2011-01-01' and leads.registered_datetime <= '2011-12-31')
-- group by sites.domain_name
-- order by clients.client_id 

-- (2)
-- select clients.first_name, clients.last_name, sites.domain_name, count(leads.leads_id) as number_of_leads_generated, date_format(leads.registered_datetime,'%M %d, %Y')
-- from clients
-- join sites on clients.client_id = sites.client_id
-- join leads on sites.site_id = leads.site_id
-- group by sites.domain_name
-- order by clients.client_id 



-- 9. Write a single query that retrieves total revenue collected from each client for each month of the year. Order it by client id.

-- select clients.first_name, clients.last_name, sum(amount) as total_revenue, monthname(charged_datetime) as month_charged, year(charged_datetime) as year_charged
-- from billing
-- join clients on clients.client_id = billing.client_id
-- group by YEAR(charged_datetime), MONTH(charged_datetime), clients.client_id
-- order by clients.client_id, charged_datetime;

-- 10. Write a single query that retrieves all the sites that each client owns. Group the results so that each row shows a new client. It will become clearer when you add a new field called 'sites' that has all the sites that the client owns. (HINT: use GROUP_CONCAT)


-- select clients.client_id, clients.first_name, clients.last_name, group_concat(sites.domain_name,' ') as websites
-- from clients
-- left join sites on clients.client_id = sites.client_id
-- group by clients.client_id
