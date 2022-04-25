import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas_3/countries_model.dart';
import 'package:tugas_3/covid_data_source.dart';

class PageDetailCountries extends StatefulWidget {
  const PageDetailCountries({Key? key}) : super(key: key);

  @override
  _PageDetailCountriesState createState() => _PageDetailCountriesState();
}

class _PageDetailCountriesState extends State<PageDetailCountries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries Detail"),
      ),
      body: _buildDetailCountriesBody(),
    );
  }

  Widget _buildDetailCountriesBody() {
    return Container(
      child: FutureBuilder(
        future: CovidDataSource.instance.loadCountries(),
        builder: (
            BuildContext context,
            AsyncSnapshot<dynamic> snapshot,
            ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            CountriesModel countriesModel =
            CountriesModel.fromJson(snapshot.data);
            return _buildSuccessSection(countriesModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(CountriesModel data) {
    return ListView.builder(
      itemCount: data.countries?.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemCountries("${data.countries?[index].name}", "${data.countries?[index].iso3}");
      },
    );
  }

  Widget _buildItemCountries(String value, String value2) {
    return Card(
        margin: EdgeInsets.all(4.0),
        child: ListTile(
            contentPadding: EdgeInsets.all(6.0),
            title: Padding(
              padding: EdgeInsets.only(bottom: 10.0, left: 8.0),
              child: Text(
                      value,
                      style: const TextStyle(fontWeight: FontWeight.w500)
                    ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(value2),
            ),
          ),
      );
  }
}