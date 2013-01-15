package controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Boot;
import models.Task;

import play.*;
import play.data.Form;
import play.mvc.*;
import play.libs.F;
import play.libs.Json;
import scala.util.parsing.json.JSON;

import views.html.*;

public class Logbuch extends Controller {

	private static String[][] list = { { "Bootsname", "Typ", "Baujahr" }, { "Registernr", "Konstrukteur", "Motor" },
			{ "Segelzeichen", "Laenge", "Tankgroesse" }, { "Heimathafen", "Breite", "Wassertankgroesse" },
			{ "Yachtclub", "Tiefgang", "Abwassertankgroesse" }, { "Eigner", "Masthoehe", "Grosssegelgroesse" },
			{ "Versicherung", "Verdraengung", "Genuagroesse" }, { "Rufzeichen", "Rigart", "Spigroesse" } };
	private static Map<String, String> seiten, buttons;
	
	public static Result logbuch() {
		seiten = new HashMap<String, String>();
		seiten.put("/logbuch", "Boot Info");
		buttons = new HashMap<String, String>();
		buttons.put("http://localhost/Map/map.php", "Map");
		return ok(logbuch.render(bootForm, list, seiten, buttons));
	}

	public static Result createBoot() {
		Form<Boot> filledForm = bootForm.bindFromRequest();
		if (filledForm.hasErrors()) {
			return badRequest(logbuch.render(filledForm, list, seiten, buttons));
		} else {
			Boot.create(filledForm.get());
			return redirect(routes.Logbuch.logbuch());
		}
	}

	public static Result listBoote2() {
		return ok(Json.toJson(Boot.all()));
	}

	 public static WebSocket<String> socketHandler() {
	      return new WebSocket<String>() {
	          // called when the websocket is established
	          public void onReady(WebSocket.In<String> in, final WebSocket.Out<String> out) {
	              // register a callback for processing instream events
	              in.onMessage(new F.Callback<String>() {
	                  public void invoke(String event) {
	                	  Logger.info(event);
	                      if (event.equals("GET"))
	                      		out.write(Json.toJson(Boot.all()).toString());
                      	  else if (Json.parse(event).has("DELETE")) {
                      		  Boot.deleteBoot(Json.parse(event).findValue("DELETE").getValueAsText());
                      		  out.write(Json.toJson(Boot.all()).toString());
                      		  Logger.info(Json.parse(event).findValue("DELETE").getValueAsText());
                      	  }
	                  } 
	               });
	              
	              // write out a greeting
	              out.write("");
	          }
	      };
	  }


	static Form<Boot> bootForm = form(Boot.class);
}