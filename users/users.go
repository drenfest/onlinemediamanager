package users

type user struct {
	Userid        int    `db:"user_id"`
	Usertype      string `db:"user_type"`
	Parentid      int    `db:"parent_id"`
	Username      string `db:"username"`
	Password      string `db:"password"`
	Firstname     string `db:"first_name"`
	Lastname      string `db:"last_name"`
	Phone         int    `db:"phone"`
	Streetaddress string `db:"street_address"`
	City          string `db:"city"`
	State         string `db:"state"`
	Zip           int    `db:"zip"`
}

type users []user
