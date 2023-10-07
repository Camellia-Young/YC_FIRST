
package Bean;
import java.io.Serializable;

/**
 * @author Administrator
 * @version 1.0
 * @created 18-4ÔÂ-2021 10:15:53
 */
public class UserInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	String account="";
	String address;
	int age;
	String imageUrl;
	String password;
	String tel;

	public UserInfo(){

	}

	public void finalize() throws Throwable {

	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "UserInfo [account=" + account + ", address=" + address + ", age=" + age + ", imageUrl=" + imageUrl
				+ ", password=" + password + ", tel=" + tel + "]";
	}

}