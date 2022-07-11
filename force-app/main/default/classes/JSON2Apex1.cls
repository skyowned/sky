public class JSON2Apex1 {

	public class Activities {
		public String uri;
		public List<String> options;
	}

	public class Connections {
		public Activities activities;
		public Albums albums;
		public Albums appearances;
		public Albums categories;
		public Albums channels;
		public Activities feed;
		public Albums followers;
		public Albums following;
		public Albums groups;
		public Albums likes;
		public Albums moderated_channels;
		public Albums portfolios;
		public Albums videos;
		public Albums watchlater;
		public Albums shared;
		public Albums pictures;
		public Albums watched_videos;
		public Albums block;
	}

	public class Space {
		public Integer free;
		public Integer max;
		public Integer used;
	}

	public class User {
		public String uri;
		public String name;
		public String link;
		public Object location;
		public Object bio;
		public String created_time;
		public String account;
		public Object pictures;
		public List<Websites> websites;
		public Metadata metadata;
		public Preferences preferences;
		public List<String> content_filter;
		public Upload_quota upload_quota;
		public String resource_key;
	}

	public class JSON2Apex {
		public String uri;
		public String ticket_id;
		public User user;
		public String upload_link;
		public String form;
		public String upload_link_secure;
	}

	public class Websites {
	}

	public class Quota {
		public Boolean hd;
		public Boolean sd;
	}

	public class Upload_quota {
		public Space space;
		public Quota quota;
	}

	public class Metadata {
		public Connections connections;
	}

	public class Preferences {
		public Videos videos;
	}

	public class Albums {
		public String uri;
		public List<String> options;
		public Integer total;
	}

	public class Videos {
		public String privacy;
	}

	
	public static JSON2Apex1 parse(String json) {
		return (JSON2Apex1) System.JSON.deserialize(json, JSON2Apex1.class);
	}
}