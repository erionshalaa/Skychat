package Dashboard_Messages;

public class Friends {
	private int id;
    private String name;
    private String surname;
    private int friendId1;
    private int friendId2;

    public Friends(int id, String name, String surname) {
        this.id = id;
        this.name = name;
        this.surname = surname;
    }
	    public Friends(int friendId1, int friendId2) {
	        this.friendId1 = friendId1;
	        this.friendId2 = friendId2;
	    }
	
	    public int getId() {
	        return id;
	    }
	
	    public String getName() {
	        return name;
	    }
	
	    public String getSurname() {
	        return surname;
	    }
		public int getFriendId1() {
			return friendId1;
		}

		public void setFriendId1(int friendId1) {
			this.friendId1 = friendId1;
		}

		public int getFriendId2() {
			return friendId2;
		}

		public void setFriendId2(int friendId2) {
			this.friendId2 = friendId2;
		}

	    
	}
