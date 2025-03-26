DROP TEMPORARY TABLE IF EXISTS Total_Amount_per_engager;
CREATE temporary TABLE Total_Amount_per_engager AS 
SELECT donation.Donator, sum(donation.amount) AS Total_Amount from donation
group by donation.Donator;
select engager.Email, engager.Fullname, Total_Amount_per_engager.Total_Amount from engager
join Total_Amount_per_engager on engager.Email=Total_Amount_per_engager.Donator
where Total_Amount>6;

/* In the example given in report, the query returns email ,fullname,Total amount
for users that have spent more than 100 euros (in total) for donations. Due to lack of data,
the query returns email ,fullname,Total amount for users that have spent more than 6 euros.*/
