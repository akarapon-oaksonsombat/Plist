library globals;

import 'theme/CustomTheme.dart';
import 'data/example_data.dart';
import 'data/personal_data.dart';

CustomTheme theme;
int currentIndex = 0;
bool _startEnable = true;
List<PersonalData> _data = List();
ExampleData _exampleData;
bool _exampleEnable = true;

void start(){
  if(_startEnable){
    theme = CustomTheme();
    if(_exampleEnable){
      startWithExample();
    }
  }
  ranking();
  _startEnable = false;
}
// ranking process functions
void ranking(){
  quickSort(0, _data.length-1);
  //give a ranking number
  for(int i=0;i<_data.length;i++){
    _data[i].rank = i+1;
  }
}
void quickSort(int l, int r){
  if(l<r){
    PersonalData pivot = _data[r];
    int cnt = l;
    for(int i=l;i<=r;i++){
      if(_data[i].point >= pivot.point){
        swap(cnt, i); cnt++;
      }
    }
    quickSort(l, cnt-2);
    quickSort(cnt, r);
  }
}
void swap(int a, int b){
  PersonalData temp = _data[a];
  _data[a] = _data[b];
  _data[b] = temp;
}
// for run as Demo
void startWithExample(){
  _exampleData = new ExampleData();
  for(int i=0;i<_exampleData.point.length;i++){
    _data.add(new PersonalData(_exampleData.name[i], _exampleData.point[i],i+1));
    _data[i].customIndex = i+1;
  }
}
// Get Personal Data
delete(int index){
  List<PersonalData> temp = List();
  for(int i=0;i<_data.length;i++){
    if(index!=i){
      temp.add(_data[i]);
    }
  }
  _data = temp;
}
hasData(int index){
  if(index >= 0 && index < getLength()){
    return true;
  }else return false;
}
getPoint(int index) {
  return _data[index].point;
}
getName(int index) {
  return _data[index].name;
}
getRank(int index){
  return _data[index].rank;
}
getLength(){
  return _data.length;
}
getUpperRank(int index){
  if(index != 0){
    return index-1;
  }else return 0;
}
// Edit Personal Data
addNew(String name, int point) {
  _data.add(new PersonalData(name, point, 0));
  ranking();
}
updatePoint(int index, int point) {
  _data[index].point = point;
}
updateName(int index, String name) {
  _data[index].name = name;
  ranking();
}
