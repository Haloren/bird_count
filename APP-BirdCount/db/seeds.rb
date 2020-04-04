users = [
    {username: "Jimmy Carter", email: "thirtyninth@president.com", password: "1977"},
    {username: "Wes Craven", email: "freddykrueger@elmstreet.com", password: "scream"},
    {username: "Phoebe Snetsinger", email: "seenthatone@allthebirds.com", password: "8398"}
]

users.each do |user|
    User.create(user)
end

guides = [
    {bird: "Egret", date: "1924-10-01", notes: "Why Birds Really Matter", location: "Plains, GA", user_id: 1},
    {bird: "California Condor", date: "1939-08-02", notes: "My FAVORITE!", location: "Cleveland, OH", user_id: 2},
    {bird: "Sandhill Crane", date: "2020-03-13", notes: "Saw it with David Yarnold", location: "LA, CA", user_id: 2},
    {bird: "Pheobe", date: "1931-06-09", notes: "The birth of a legend", location: "Lake Zurich, IL", user_id: 3},
    {bird: "Blackburnian Warbler", date: "1961-01-01", notes: "Inspiring Bird", location: "Madagascar", user_id: 3},
    {bird: "Spotted Owl", date: "1999-11-23", notes: "Susan's studying this one", location: "Webster Groves, MO", user_id: 3}
]

guides.each do |guide|
    Guide.create(guide)
end