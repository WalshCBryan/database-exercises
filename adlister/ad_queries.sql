use ad;

select * from ads;

# For a given ad, what is the email address of the user that created it?
SELECT email FROM users
WHERE id = (
    SELECT user_id
    FROM ads
    WHERE title = 'beer'
);

# For a given ad, what category, or categories, does it belong to?
SELECT title FROM categories
WHERE id = (
    SELECT category_id
    FROM ad_category
    WHERE ad_id = (
        SELECT id
        FROM ads
        WHERE title = 'van'
    )
);

# For a given category, show all the ads that are in that category.
SELECT title FROM ads
WHERE id IN (
    SELECT ad_id
    FROM ad_category
    WHERE category_id IN (
        SELECT id
        FROM categories
        WHERE title = 'Help Wanted'
    )
);

# For a given user, show all the ads they have posted.
SELECT title FROM ads
WHERE user_id IN (
    SELECT id
    FROM users
    WHERE username = 'vkatte5'
);

# show user's names and the ad titles associated with them
SELECT users.username, ads.title
FROM users
         JOIN ads
              ON users.id = ads.user_id;


# who's got free stuff?!?
SELECT users.username, ads.title, categories.title
FROM users
         join ads
              on users.id = ads.user_id
         join ad_category
              on ads.id = ad_category.ad_id
         join categories;
#               on ad_category.ad_id = categories.id
# WHERE categories.title = 'For Free';
