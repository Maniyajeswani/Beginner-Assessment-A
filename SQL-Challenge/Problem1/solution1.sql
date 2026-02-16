-- write your solution here
SELECT 
    (SELECT car FROM footer_values WHERE car IS NOT NULL ORDER BY id DESC LIMIT 1) AS car,
    (SELECT length FROM footer_values WHERE length IS NOT NULL ORDER BY id DESC LIMIT 1) AS length,
    (SELECT width FROM footer_values WHERE width IS NOT NULL ORDER BY id DESC LIMIT 1) AS width,
    (SELECT height FROM footer_values WHERE height IS NOT NULL ORDER BY id DESC LIMIT 1) AS height;