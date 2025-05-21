select * from constituencywise_details

select * from constituencywise_results


select * from partywise_results

select * from statewise_results

select * from states 

----------------------

--total seats

select
Distinct count(Parliament_Constituency) as total_seats
from constituencywise_results

--what are the total number of seats available  for election in each state

select 
s.state as state_name,
count(cr.parliament_constituency) as total_seats
from 
constituencywise_results cr
inner join statewise_results sr on cr.parliament_constituency = sr.parliament_constituency
inner join states s on sr.state_id = s.state_id
group by s.state


--total seats won by NDA alliance

SELECT 
    SUM(CASE 
            WHEN party IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            ) THEN [Won]
            ELSE 0 
        END) AS NDA_Total_Seats_Won
FROM 
    partywise_results


--seats won by NDA party alliance

 select 
    party as party_name,
    won as seats_won
	from partywise_results
	where
	 party in (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')
				order by seats_won desc


--total seats won by I.N.D.I.A. alliance (I.N.D.I.A.)

select 
sum( case
 when party in (
	            'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
           ) then [Won]
		   else 0
		   end) as INDIA_total_seats_won
		   from partywise_results
		
--seats won by I.N.D.I.A. alliance

select 
party,
won from partywise_results
    where party in (
	            'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
           )
		  order by Won desc

--Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

alter table partywise_results
add party_alliance varchar(100)

   -- I.N.D.I.A.
update partywise_results
set party_alliance = 'I.N.D.I.A.'
WHERE Party IN ( 'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
				);

  --NDA
  update partywise_results
set party_alliance = 'I.N.D.I.A.'
WHERE Party IN ('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
				);

--OTHERS
UPDATE partywise_results
set party_alliance='others'
where party_alliance is null


SELECT 
party_alliance
,sum(won)
from partywise_results
group by party_alliance

select 
party,won
from partywise_results
where party_alliance= 'NDA'
ORDER BY won desc

--Winning candidate's name, their party name, total votes, and the margin of victory for a -- specific state and constituency?

select cr.winning_candidate
,pr.party
,party_alliance
,cr.total_votes
,cr.margin
,s.state
,cr.constituency_name
from constituencywise_results cr inner join partywise_results pr on cr.party_id = pr.party_id
inner join statewise_results sr on cr.parliament_constituency = sr.parliament_constituency
inner join states s on sr.state_id = s.state_id
where constituency_name = 'ANANTHAPUR'


--What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

select
cd. EVM_votes,
cd. postal_votes,
cd.total_votes,
cd.candidate,
cr.constituency_name
from constituencywise_results cr join constituencywise_details cd
on cr.Constituency_ID= cd.Constituency_ID
where CR.Constituency_Name='ANANTHAPUR'

--Which parties won the most seats in s State, and how many seats did each party win?

select 
     p.party,
	 count(cr.constituency_id) as seats_won
from
    constituencywise_results cr
join partywise_results p on cr.Party_ID= p.Party_ID
join statewise_results sr on cr.Parliament_Constituency=sr.Parliament_Constituency
join states s on sr.State_ID=s.state_id
where 
    s.State='Andhra Pradesh'
group by
    p.Party
order by
    seats_won desc;


--What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) 
--in each state for the India Elections 2024


select 
  s.state as state_name,
  sum(case when pr.party_alliance = 'I.N.D.I.A.' then 1 else 0 end) as India_seats_won,
  sum(case when pr.party_alliance = 'NDA' then 1 else 0 end) as NDA_seats_won,
  sum(case when pr.party_alliance = 'others' then 1 else 0 end) as other_seats_won
  from constituencywise_results cr
      join
         partywise_results pr on cr.party_id = pr.party_id
      join
	     statewise_results sr on cr.parliament_constituency = sr.Parliament_Constituency 
      join
	     states s on sr.state_id = s.state_id
 
    group by 
	     s.state
    order by 
	    s.state;


--Which candidate received the highest number of EVM votes in each constituency (Top 10)?

select top 10
   cr.constituency_name,
   cd.constituency_id,
   cd.candidate,
   cd.evm_votes
   from
     constituencywise_details cd
inner join
    constituencywise_results cr on cd.constituency_id = cr.Constituency_ID
where 
   cd.evm_votes = (
     select max(cd1.evm_votes)
	 from constituencywise_details cd1
	 where cd1.Constituency_ID=cd.Constituency_ID
	 )
order by
   cd.EVM_Votes desc

--Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'Maharashtra'
)

SELECT 
    cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate,
	max(case when rc.voterank = 3 then rc.candidate end) as second_runnerup
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;


	  ----------------------------------------
 -- For the state of Maharashtra, what are the total number of seats
 -- total number of candidates,
 --total number of parties, 
 --total votes (including EVM and postal), 
 --and the breakdown of EVM and postal votes?


 select 
 count(distinct cr.constituency_id) as total_seats,
 count(distinct cd.Candidate) as total_candidates,
 count(distinct pr.party) as total_parties,
 sum(cd.evm_votes + cd.postal_votes) as total_votes,
 sum(cd.evm_votes) as total_evm_votes,
 sum(cd.postal_votes) as total_postal_votes
 from constituencywise_results cr
 join
    constituencywise_details cd on cr.Constituency_ID = cd.Constituency_ID
join
    statewise_results sr on cr.Parliament_Constituency = sr.Parliament_Constituency
join
    states s on sr.State_ID = s.State_ID
join
   partywise_results pr on cr.Party_ID = pr.Party_ID
where 
  s.State='Maharashtra';


