library globals;

int _index;
bool first = true;
List<int> _point = List();
List<String> _name = List();

init() {
  if (first) _start();
}

_start() {
  _point.add(80);
  _point.add(77);
  _point.add(85);
  _point.add(60);
  _name.add('JJ');
  _name.add('Poon');
  _name.add('Geng');
  _name.add('John');
  _index = 4;
  first = false;
}

get_index() {
  return _index;
}

get_point(int index) {
  return _point[index].toString();
}

get_name(int index) {
  return _name[index];
}

get_length() {
  return _index + 1;
}

addNew(String input, int number) {
  _name.add(input);
  _point.add(number);
  _index++;
}

updatePoint(int index, int number) {
  _point[index] = number;
}
