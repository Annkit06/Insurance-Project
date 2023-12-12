Show databases;
create database insurance_project;
use insurance_project;
select* from brokerage;
select* from fees;
select* from `individual budgets`;
select* from invoice ;
select* from meeting;
select* from opportunity;

## --------No of Invoice By Acc Exce

select count(invoice_number)invoice_no,`Account Executive` from invoice
group by `Account Executive`
order by invoice_no desc ;
##------- Oppty By Revenue Top 4

select opportunity_name,revenue_amount from opportunity order by revenue_amount desc limit 4 ; 
##------ No of Meeting By Acc Exce

select count(meeting_date),`Account Executive`from meeting 
group by `Account Executive`;

##--- Stage Funnel By Revenue

select distinct(stage),sum(revenue_amount) total from opportunity 
 group by stage ;
 
 ##-- Oppty- Production Distribution
 
 select count(opportunity_name)opportunity,product_group
 from opportunity 
 group by product_group ;
 
##--- Open oppty Top 4
 
 select opportunity_name,sum(revenue_amount)opp_name  from opportunity
   where stage <> 'Negotiate'
   group by opportunity_name
   order by opp_name desc limit 4 ;
  
 ##---- Indivisual Buduget
 
select sum(`Cross sell bugdet`)cross_target,
sum(`New Budget`)new_target,sum(`Renewal Budget`)renewal_target from `individual budgets` ;
  ##--- Income Class
  
select sum(amount) Taret_Amount,income_class from invoice
group by income_class;

##----- Brokerage   
select sum(amount)Taret_Amount, income_class from brokerage
group by income_class;

##------- Cross Sell
Create table  Crosssell
					(Income_class varchar(30) ,Target int, Achivement int, Invoice int);
Insert into Crosssell values('Crosssell','7290000','12644773.3','2853842');

select * from Crosssell;
drop table Crosssell;

##------ Renewal
Create table Renewal
				(Income_class varchar(30),Target int, Achivement int, Invoice int);
 Insert into Renewal values('Renewal','9520000','18489219.640000015','8244310');
 
 select * from Renewal;
 drop table Renewal;
 
 ##------ New
 Create table  New
					(Income_class varchar(30),Target int, Achivement int, Invoice int);
Insert into New values('New','4100000','3431629.309999999','569815');

Select * from New;
Drop table New;

##------- Crs Sell plcd Achived
select((Achivement+396480)/Target)*100 as achivement_per, (Invoice/Target)*100 as Invoice_per from Crosssell;
##-----------New Plcd Achived
select((Achivement+100000)/Target)*100 as achivement_per, (Invoice/Target)*100 as Invoice_per from New;
##------ Renewal Plcd Achived
select((Achivement+18051)/Target)*100 as achivement_per, (Invoice/Target)*100 as Invoice_per from Renewal;

##--------------Toatal Meeting
select count(meeting_date),year(meeting_date) total_meet from meeting
group by total_meet;

##-------Total opportunity
select  count(stage)total_opportunity from opportunity;

##------ Total Open opportunity
 select  count(stage)open_opportunity from opportunity
      where stage <> 'Negotiate';
                    