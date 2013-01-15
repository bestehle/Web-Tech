package models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;

import play.db.ebean.Model;
import play.db.ebean.Model.Finder;

@Entity
public class Boot extends Model {
	
	@Id
	public String bootsname;
	public String registernr;
	public String segelzeichen;
	public String heimathafen;
	public String yachtclub;
	public String eigner;
	public String versicherung;
	public String rufzeichen;
	public String typ;
	public String konstrukteur;
	public float laenge;
	public float breite;
	public float tiefgang;
	public float masthoehe;
	public float verdraengung;
	public String rigart;
	public int baujahr;
	public String motor;
	public float tankgroesse;
	public float wassertankgroesse;
	public float abwassertankgroesse;
	public float grosssegelgroesse;
	public float genuagroesse;
	public float spigroesse;
	
	public static Finder<String, Boot> find = new Finder(String.class, Boot.class);
	
	public static List<Boot> all() {
		return find.all();
	}

	public static void create(Boot boot) {
		boot.save();
	}
	
	public static void deleteBoot(String bootsname) {
		find.ref(bootsname).delete();
	}
}
