mixin YongChun {
  attack();
}

class JackChenAttack with YongChun {
  @override
  attack() {
    // 实现方法
    print('给你一拳');
  }
}

class JackChen<T extends YongChun> {
  T fighter;
  JackChen(this.fighter);
  action() {
    print('我是杰克陈');
    fighter.attack();
  }
}

void main() {
  var jca = JackChenAttack();
  var jc = JackChen(jca);
  jc.action();
}
