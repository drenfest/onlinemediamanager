package users

type user struct{
	Userid int `db:"user_id"`
	Usertype string `db:"user_type"`
	Parentid int `db:"parent_id"`
	Username string `db:"username"`
	Password string `db:"password"`
	Firstname string `db:"first_name"`
	Lastname string `db:"last_name"`
	Phone int `db:"phone"`
	Streetaddress string `db:"street_address"`
	city string `db:"city"`
	state string `db:"state"`
	zip int `db:"zip"`
}
Successfully created project 'onlinemediamanager' on GitHub, but initial commit failed: Author identity unknown *** Please tell me who you are. Run git config --global user.email "drenfest@gmail.com" git config --global user.name "drenfest" to set your account's default identity. Omit --global to set the identity only in this repository. unable to auto-detect email address (got 'drenf@Gs-Pc.(none)')