<template>
  <div>
    <el-select>
      <el-option v-for="(item, index) in selectOptions" :key="item[key]" :label="item[label]" :value="item[key]"/>
    </el-select>
  </div>
</template>

<script>
export default {
  props: {
    selectOptions: {
      type: Array,
      required: true
    },
    key: {
      type: String,
      required: true,
      default: 'key'
    },
    label: {
      type: String,
      required: true,
      default: 'label'
    },
  },
  computed: {},
  methods: {}
}
</script>
