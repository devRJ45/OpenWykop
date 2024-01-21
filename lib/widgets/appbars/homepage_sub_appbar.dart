import 'package:flutter/material.dart';
import 'package:openwykop/widgets/widgets.dart';

class HomepageSubAppbar extends StatefulWidget {

  final String sort;
  final Function(String sort)? onChangeProperty;

  final Map<String, String> sortTypes = {
    'newest': 'Najnowsze',
    'active': 'Aktywne',
  };

  HomepageSubAppbar({
    super.key,
    this.sort = 'newest',
    this.onChangeProperty,
  });

  @override
  State<HomepageSubAppbar> createState() => _HomepageSubAppbarState();
}

class _HomepageSubAppbarState extends State<HomepageSubAppbar> {

  List<String> sortList = [];
  String currentSort = 'newest';

  @override
  void initState () {
    super.initState();

    sortList = widget.sortTypes.keys.toList();

    currentSort = widget.sort;
  }

  void _changeSort (String newSort) {
    setState(() {
      currentSort = newSort;
    });

    _onChangeProperty();
  }

  void _openChangeSortDialog (BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Zmień sortowanie', style: Theme.of(context).textTheme.titleLarge),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: sortList.map((sortType) => InkWell(
                onTap: () {
                  _changeSort(sortType);
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(widget.sortTypes[sortType] ?? '', 
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: sortType == currentSort ? FontWeight.bold : FontWeight.normal,
                    )
                  )
                )
              )).toList(),
            ),
          )
        );
      }
    );
  }

  List<Widget> _getLeftSideButtons (BuildContext context, String sort) {
    List<Widget> leftSideButtons = [];

    if (widget.sortTypes[sort] == null) {
      return leftSideButtons;
    }

    leftSideButtons.add(SubAppbarButton(label: widget.sortTypes[sort]!, isDropdown: true, onTap: () => _openChangeSortDialog(context)));

    return leftSideButtons;
  }

  List<Widget> _getRightSideButtons (BuildContext context, String sort) {
    List<Widget> rightSideButtons = [];

    if (widget.sortTypes[sort] == null) {
      return rightSideButtons;
    }

    return rightSideButtons;
  }

  void _onChangeProperty() {
    if (widget.onChangeProperty == null) {
      return;
    }

    widget.onChangeProperty!(currentSort);
  }

  @override
  Widget build(BuildContext context) {
    return SubAppbar(
      leftSideButtons: _getLeftSideButtons(context, currentSort), 
      rightSideButtons: _getRightSideButtons(context, currentSort),
    );
  }
}



