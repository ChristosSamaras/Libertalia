select journalist.Email,journalist.Fullname,followers_per_journalist.NumFollowers from journalist 
join followers_per_journalist on journalist.Email=followers_per_journalist.JEmail
where NumFollowers>2;

/* In the example given in report, the query returns email ,fullname, NumFollowers
for journalists that have  more than 500 followers. Due to lack of data,
the query returns email ,fullname,NumFollowers for journalists that have  more than 2 followers.*/