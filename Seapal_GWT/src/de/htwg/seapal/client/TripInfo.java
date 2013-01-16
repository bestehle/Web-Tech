package de.htwg.seapal.client;

import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.ui.Anchor;
import com.google.gwt.user.client.ui.Button;
import com.google.gwt.user.client.ui.FlexTable;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.HTMLTable.Cell;
import com.google.gwt.user.client.ui.ListBox;
import com.google.gwt.user.client.ui.RootPanel;
import com.google.gwt.user.client.ui.TextBox;

/**
 * Entry point classes define <code>onModuleLoad()</code>.
 */
public class TripInfo implements EntryPoint {

	public void onModuleLoad() {
		final FlexTable table = new FlexTable();
		table.setCellSpacing(5);
		table.setCellPadding(3);

//		table heading columns
		table.setText(6, 0, "Tripname");
		table.setText(6, 1, "Startpunkt");
		table.setText(6, 2, "Ziel");
		table.setText(6, 3, "Distanz");
		table.setText(6, 4, "Start");
		table.setText(6, 5, "Ende");
		table.setText(6, 6, "Dauer");
		table.setText(6, 7, "Skipper");
		table.setText(6, 8, "Crew");
		table.setText(6, 9, "MotorMin");
		table.setText(6, 10, "Tank");
		table.setText(6, 11, "");
		

		//TextBoxes for entering Informationen
		final TextBox tripName = new TextBox();
		final TextBox source = new TextBox();
		final TextBox destination = new TextBox();
		final TextBox start = new TextBox();
		final TextBox end = new TextBox();
		final TextBox skipper = new TextBox();
		final TextBox duration = new TextBox();
		final TextBox motorMin = new TextBox();
		final TextBox distance = new TextBox();
		final TextBox crew = new TextBox();
		
		final HTML tripNameHTML = new HTML("<p>Tripname</p>");
		final HTML sourceHTML = new HTML("<p>Startpunkt</p>");
		final HTML destinationHTML = new HTML("<p>Ziel</p>");
		final HTML startHTML = new HTML("<p>Start</p>");
		final HTML endHTML = new HTML("<p>Ende</p>");
		final HTML skipperHTML = new HTML("<p>Skipper</p>");
		final HTML durationHTML = new HTML("<p>Dauer</p>");
		final HTML motorMinHTML = new HTML("<p>Motormin</p>");
		final HTML tankHTML = new HTML("<p>Tank gefuellt</p>");
		final HTML distanceHTML = new HTML("<p>Distanz</p>");
		final HTML crewHTML = new HTML("<p>Crew</p>");
		
		final ListBox tank = new ListBox(false);
		tank.addItem("Select", "select");
		tank.addItem("1/4", "1");
		tank.addItem("1/2", "2");
		tank.addItem("3/4", "3");
		tank.addItem("Voll", "3");


		Button add = new Button("Add"); 
		
		
		//adding input controls to table
		table.setWidget(1, 0, tripNameHTML);
		table.setWidget(1, 1, tripName);
		table.setWidget(2, 0, sourceHTML);
		table.setWidget(2, 1, source);
		table.setWidget(2, 2, destinationHTML);
		table.setWidget(2, 3, destination);
		table.setWidget(2, 4, distanceHTML);
		table.setWidget(2, 5, distance);
		table.setWidget(3, 0, startHTML);
		table.setWidget(3, 1, start);
		table.setWidget(3, 2, endHTML);
		table.setWidget(3, 3, end);
		table.setWidget(3, 4, durationHTML);
		table.setWidget(3, 5, duration);
		table.setWidget(4, 0, skipperHTML);
		table.setWidget(4, 1, skipper);
		table.setWidget(4, 2, crewHTML);
		table.setWidget(4, 3, crew);
		table.setWidget(5, 0, motorMinHTML);
		table.setWidget(5, 1, motorMin);
		table.setWidget(5, 2, tankHTML);
		table.setWidget(5, 3, tank);
		table.setWidget(5, 4, add);
		

		//adding handlers

		//table handler
		table.addClickHandler(new ClickHandler() {
			@Override
			public void onClick(ClickEvent event) {

				FlexTable ft = (FlexTable) event.getSource();
				Cell c = ft.getCellForEvent(event);
				if(c != null) {

					int cellIndex = c.getCellIndex();
					int rowIndex = c.getRowIndex();

					if(cellIndex == 11) {
						if(rowIndex != 0 && rowIndex != (ft.getRowCount()-1)) {
							ft.removeRow(rowIndex);
						}
					}
				}
			}
		}
		);

		//Add button handler
		add.addClickHandler(new ClickHandler() {

			public void onClick(ClickEvent event) {

				
				int numRows = table.getRowCount();

				numRows = table.insertRow(numRows);

				table.setText(numRows, 0, tripName.getText());
				table.setText(numRows, 1, source.getText());
				table.setText(numRows, 2, destination.getText());
				table.setText(numRows, 3, distance.getText());
				table.setText(numRows, 4, start.getText());
				table.setText(numRows, 5, end.getText());
				table.setText(numRows, 6, duration.getText());
				table.setText(numRows, 7, skipper.getText());
				table.setText(numRows, 8, crew.getText());
				table.setText(numRows, 9, motorMin.getText());
				table.setText(numRows, 10, tank.getItemText(tank.getSelectedIndex()));

				Anchor anchor = new Anchor("Remove");
				table.setWidget(numRows, 11, anchor);

				tripName.setText("");
				tank.setSelectedIndex(0);
				source.setText("");
				distance.setText("");
				start.setText("");
				end.setText("");
				duration.setText("");
				crew.setText("");
				skipper.setText("");
				motorMin.setText("");
				destination.setText("");
				
			}
		}
		);

		RootPanel.get("table").add(table);
	}


}
