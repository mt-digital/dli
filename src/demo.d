import std.stdio;

import dli.index_menu;
import dli.menu_items.simple_menu_item;
import dli.menu_items.nested_menu_menu_item;

import std.stdio;

void main()
{
	auto mainMenu = createIndexMenu();
	mainMenu.welcomeMsg = "Welcome to the demo menu. Please, choose an option below:";
	mainMenu.onMenuExitMsg = "We hope you enjoyed the demo!";

	mainMenu.addItem(
		createSimpleMenuItem(
			"Write \"Hello world!\"",
			{mainMenu.writeln("Hello world!");}
		),
		1
	);

	mainMenu.addItem(
		createSimpleMenuItem(
			"Change item printing style to something fancy",
			{mainMenu.itemPrintFormat = "[" ~ mainMenu.printItemIdKeyword ~ "] => " ~ mainMenu.printItemTextKeyword;}
		),
		2
	);

	mainMenu.addItem(
		createSimpleMenuItem(
			"Change item printing style to something simple",
			{mainMenu.itemPrintFormat = mainMenu.printItemIdKeyword ~ " - " ~ mainMenu.printItemTextKeyword;}
		),
		3
	);

	auto uselessItem = createSimpleMenuItem("I do nothing", {});
	mainMenu.addItem(uselessItem, 4);

	mainMenu.addItem(
		createSimpleMenuItem(
			"Toggle item 4",
			{uselessItem.enabled = !uselessItem.enabled;}
		),
		5
	);

	auto nestedMenu = createIndexMenu();
	nestedMenu.welcomeMsg = "This is an example of a nested menu, not much to see here";
	nestedMenu.onMenuExitMsg = "Exiting the sample nested menu...";

	nestedMenu.addItem(
		createSimpleMenuItem(
			"Print awesome videogame quote",
			{nestedMenu.writeln("The cake is a lie");}
		),
		1
	);

	mainMenu.addItem(
		new NestedMenuMenuItem(nestedMenu, "Open nested menu"),
		6
	);

	mainMenu.run();
}
