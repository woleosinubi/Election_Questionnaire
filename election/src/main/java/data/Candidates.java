package data;

public class Candidates {
	private int id;
	private String fullname;
	private String email;
	private String age;
	private String party;
	private String proffesion;

	public Candidates(String id, String fullname, String email, String age, String party, String proffesion) {
		// TODO Auto-generated constructor stub
		setId(id);
		this.fullname=fullname;
		this.email=email;
		this.age=age;
		this.party=party;
		this.proffesion=proffesion;

	}
	 public Candidates() {
	    }
	 
	    public Candidates(int id) {
	        this.id = id;
	    }
	 
	
	     
	    public Candidates(String fullname, String email, String age, String party, String proffesion) {
	        this.fullname = fullname;
	        this.email= email;
	        this.age =age;
	        this.party =party;
	        this.proffesion =proffesion;

	    }

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
			
		}
		public void setId(String id) {
			try {
				this.id = Integer.parseInt(id);
			}
			catch(NumberFormatException | NullPointerException e) {
				//Do nothing - the value of id won't be changed
			}
		}

		public String getFullname() {
			return fullname;
		}

		public void setFullname(String fullname) {
			this.fullname = fullname;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getAge() {
			return age;
		}

		public void setAge(String age) {
			this.age = age;
		}

		public String getParty() {
			return party;
		}

		public void setParty(String party) {
			this.party = party;
		}

		public String getProffesion() {
			return proffesion;
		}

		public void setProffesion(String proffesion) {
			this.proffesion = proffesion;
		}	

	}

