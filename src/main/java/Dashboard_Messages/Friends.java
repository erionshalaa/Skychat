package Dashboard_Messages;

public class Friends {
	    private int friendId1;
	    private int friendId2;

	    public Friends(int friendId1, int friendId2) {
	        this.friendId1 = friendId1;
	        this.friendId2 = friendId2;
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

}
