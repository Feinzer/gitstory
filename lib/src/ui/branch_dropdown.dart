import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:gitstory/src/internal/models/branch.dart';

class BranchDropdown extends StatelessWidget {
  const BranchDropdown({
    super.key,
    required this.branches,
    this.selected,
    required this.onChanged,
  });

  final List<GithubBranch> branches;

  final GithubBranch? selected;

  final Function(GithubBranch?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<GithubBranch>(
        isExpanded: true,
        value: selected,
        hint: Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: branches
            .map<DropdownMenuItem<GithubBranch>>(
              (branch) => DropdownMenuItem<GithubBranch>(
                value: branch,
                child: Text(branch.name),
              ),
            )
            .toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
