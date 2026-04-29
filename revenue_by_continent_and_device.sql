--| Continent | Revenue | Revenue from Mobile | Revenue from Desktop | % Revenue from Total | Account Count | Verified Account | Session Count |


with revenue_info as (
      select
      continent,
      sum(p.price) as revenue,
      sum(case when device = 'mobile' then p.price end) as revenue_from_mobile,
      sum(case when device = 'desktop' then p.price end) as revenue_from_desktop,
      from `DA.session_params` sp
      left join `DA.order` o
      on sp.ga_session_id = o.ga_session_id
      left join `DA.product` p
      on o.item_id = p.item_id
      group by continent
),
account_info as (
      select
      continent,
      count(sp.ga_session_id) as session_count,
      count(acs.account_id) as account_count,
      count(case when is_verified = 1 then account_id end) as verified_account
      from `DA.session_params` sp
      left join `DA.account_session` acs
      on sp.ga_session_id = acs.ga_session_id
      left join `DA.account` a
      on acs.account_id = a.id
      group by continent
)
select
      revenue_info.continent,
      revenue_info.revenue,
      revenue_info.revenue_from_mobile,
      revenue_info.revenue_from_desktop,
      revenue / sum(revenue) OVER() * 100 as percent_from_total,
      account_info.account_count,
      account_info.verified_account,
      account_info.session_count
      from revenue_info
      left join account_info
      on revenue_info.continent = account_info.continent
