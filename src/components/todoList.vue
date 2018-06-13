<template>
    <div>
        <input @keypress.enter='handleAdd' type='text' v-model='plan'></input>
        <button :disabled='!plan' @click='handleAdd'>添加</button>
        <button :disabled='remainPlan>=todoList.length' @click='cancelPlan'>清空</button>
        <span>{{remainPlan}}/{{todoList.length}}</span>
        <ul>
            <li @click='labelPlan(key)' :class='{done: todo.done}' v-for="(todo, key) in todoList">{{todo.label}}</li>
        </ul>
    </div>
</template>

<script>
export default {
  name: 'todoList',
  data () {
      return {
          plan: '',
          todoList: []
      }
  },
  methods: {
    handleAdd(){
        this.plan && this.todoList.push({label: this.plan, done: false});
        this.plan = '';
    },
    cancelPlan(){
        this.todoList = this.todoList.filter(item => !item.done);
    },
    labelPlan(index){
        this.todoList[index].done = !this.todoList[index].done;
    }
  },
  computed: {
      remainPlan(){
          return this.todoList.filter(item => !item.done).length;
      }
  },
  mounted() {
      this.todoList = [{
          label: '踢足球',
          done: false
      },{
          label: '吃鸡',
          done: false
      },{
          label: '敲代码',
          done: false
      }]
  }
}
</script>

<style>
    .done {
        text-decoration: line-through
    }
</style>
