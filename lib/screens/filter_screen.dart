import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter';

  final Function saveFilters;
  FiltersScreen(this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool __vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListeTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parametrage'),
        actions: <Widget> [
          IconButton(icon: Icon(Icons.save), onPressed: widget.saveFilters,)
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Parametrage de compte',
                style: Theme.of(context).textTheme.headline6,
              )),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListeTile(
                    'Les répas de class', 'repas doux', _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListeTile(
                    'Seulement les repas laiteux', 'repas doux', _lactoseFree,
                    (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListeTile('seulement les repas vegetarien',
                    'repas doux', __vegetarian, (newValue) {
                  setState(() {
                    __vegetarian = newValue;
                  });
                }),
                _buildSwitchListeTile(
                    'seulement les repas gras', 'repas doux', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
