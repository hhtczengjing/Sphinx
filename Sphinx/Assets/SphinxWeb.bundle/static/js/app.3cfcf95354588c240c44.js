webpackJsonp([1],{16:function(t,e,n){"use strict";function a(t,e,n){var a=o.a.getContextPath();r.a.ajax({url:a+t,timeout:18e4,type:"get",dataType:"json",data:e,success:function(t){n(t||null)}})}function l(t,e,n){var a=o.a.getContextPath();r.a.ajax({url:a+t,timeout:18e4,type:"post",dataType:"json",data:e,success:function(t){n(t||null)}})}var o=n(54),i=n(87),r=n.n(i);e.a={get:a,post:l}},25:function(t,e,n){"use strict";var a=n(2),l=n(85),o=n(80),i=n.n(o),r=n(81),s=n.n(r);a.default.use(l.a),e.a=new l.a({routes:[{path:"/",name:"Index",component:i.a},{path:"/table/:name",name:"List",component:s.a}]})},27:function(t,e){},28:function(t,e,n){n(76);var a=n(14)(n(51),n(83),null,null);t.exports=a.exports},51:function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default={name:"app"}},52:function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var a=n(16);e.default={data:function(){return{loading:!1,columns:[],tableData:[],sql:""}},created:function(){this.fetchData()},methods:{fetchData:function(){var t=this;this.loading=!0,a.a.get("/tables",{},function(e){t.tableData=e.data,t.columns=e.column,t.loading=!1})},executeSql:function(){var t=this;this.loading=!0,a.a.post("/execute",{sql:this.sql},function(e){"1"===e.type?(t.tableData=e.data,t.columns=e.column):(t.tableData=nil,t.columns=nil),t.loading=!1})},previewRow:function(t){this.$router.push("/table/"+t)},editRow:function(){},deleteRow:function(){}}}},53:function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var a=n(16);e.default={data:function(){return{loading:!1,columns:[],tableData:[],sql:""}},created:function(){this.fetchData()},methods:{fetchData:function(){var t=this;this.loading=!0;var e=this.$route.params.name;a.a.get("/table/"+e,{},function(e){t.tableData=e.data,t.columns=e.column,t.loading=!1})},executeSql:function(){var t=this;this.loading=!0,a.a.post("/execute",{sql:this.sql},function(e){"1"===e.type?(t.tableData=e.data,t.columns=e.column):(t.tableData=nil,t.columns=nil),t.loading=!1})},previewRow:function(){},editRow:function(){},deleteRow:function(){}}}},54:function(t,e,n){"use strict";var a={};a.getUrlParam=function(t){var e=new RegExp("(^|&)"+t+"=([^&]*)(&|$)"),n=window.location.search.substr(1).match(e);return null!==n?decodeURI(n[2]):null},a.getUrlParams=function(){var t=location.search,e={};if(-1!=t.indexOf("?"))for(var n=t.substr(1),a=n.split("&"),l=0;l<a.length;l++)e[a[l].split("=")[0]]=decodeURI(a[l].split("=")[1]);return e},a.getContextPath=function(){var t=window.location.href;return t.substring(0,-1!==t.indexOf("/api")?t.indexOf("/api"):"")},a.getBoolean=function(t){return!!t&&(1==t||"true"==t||!0===t)},a.getArray=function(t,e){var n=[];if(t&&t.length>0)for(var a=0;a<t.length;a++)n.push(t[a][e]);return n},e.a=a},55:function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var a=n(2),l=n(28),o=n.n(l),i=n(25),r=n(26),s=n.n(r),u=n(27);n.n(u);a.default.config.productionTip=!1,a.default.use(s.a),new a.default({el:"#app",router:i.a,template:"<App/>",components:{App:o.a}})},75:function(t,e){},76:function(t,e){},77:function(t,e){},80:function(t,e,n){n(77);var a=n(14)(n(52),n(84),null,null);t.exports=a.exports},81:function(t,e,n){n(75);var a=n(14)(n(53),n(82),null,null);t.exports=a.exports},82:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"container"}},[n("el-row",{attrs:{gutter:20}},[n("el-col",{attrs:{span:21}},[n("el-input",{attrs:{type:"textarea",autosize:{minRows:2,maxRows:4},placeholder:"请输入SQL语句"},model:{value:t.sql,callback:function(e){t.sql=e},expression:"sql"}})],1),t._v(" "),n("el-col",{attrs:{span:3}},[n("el-button",{attrs:{type:"primary",size:"large",icon:"search"},nativeOn:{click:function(e){t.executeSql()}}},[t._v("查询")])],1)],1),t._v(" "),n("el-row",{attrs:{gutter:20}},[n("el-col",{attrs:{span:24}},[n("el-table",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticStyle:{width:"100%"},attrs:{data:t.tableData,fit:"",border:"","element-loading-text":"拼命加载中"}},[t._l(t.columns,function(t){return n("el-table-column",{key:t.prop,attrs:{prop:t.prop,label:t.label}})}),t._v(" "),n("el-table-column",{attrs:{fixed:"right",label:"操作",width:"200"},scopedSlots:t._u([["default",function(e){return[n("el-button",{attrs:{type:"primary",size:"small"},nativeOn:{click:function(n){t.previewRow(e.row.name)}}},[t._v("查看")]),t._v(" "),n("el-button",{attrs:{type:"primary",size:"small"},nativeOn:{click:function(n){t.editRow(e.row.name)}}},[t._v("编辑")]),t._v(" "),n("el-button",{attrs:{type:"danger",size:"small"},nativeOn:{click:function(n){t.deleteRow(e.row.name)}}},[t._v("删除")])]}]])})],2)],1)],1)],1)},staticRenderFns:[]}},83:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"app"}},[n("router-view")],1)},staticRenderFns:[]}},84:function(t,e){t.exports={render:function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"container"}},[n("el-row",{attrs:{gutter:20}},[n("el-col",{attrs:{span:21}},[n("el-input",{attrs:{type:"textarea",autosize:{minRows:2,maxRows:4},placeholder:"请输入SQL语句"},model:{value:t.sql,callback:function(e){t.sql=e},expression:"sql"}})],1),t._v(" "),n("el-col",{attrs:{span:3}},[n("el-button",{attrs:{type:"primary",size:"large",icon:"search"},nativeOn:{click:function(e){t.executeSql(e)}}},[t._v("查询")])],1)],1),t._v(" "),n("el-row",{attrs:{gutter:20}},[n("el-col",{attrs:{span:24}},[n("el-table",{directives:[{name:"loading",rawName:"v-loading",value:t.loading,expression:"loading"}],staticStyle:{width:"100%"},attrs:{data:t.tableData,fit:"",border:"","element-loading-text":"拼命加载中"}},[t._l(t.columns,function(t){return n("el-table-column",{key:t.prop,attrs:{prop:t.prop,label:t.label}})}),t._v(" "),n("el-table-column",{attrs:{fixed:"right",label:"操作",width:"200"},scopedSlots:t._u([["default",function(e){return[n("el-button",{attrs:{type:"primary",size:"small"},nativeOn:{click:function(n){t.previewRow(e.row.name)}}},[t._v("查看")]),t._v(" "),n("el-button",{attrs:{type:"primary",size:"small"},nativeOn:{click:function(n){t.editRow(e.row.name)}}},[t._v("编辑")]),t._v(" "),n("el-button",{attrs:{type:"danger",size:"small"},nativeOn:{click:function(n){t.deleteRow(e.row.name)}}},[t._v("删除")])]}]])})],2)],1)],1)],1)},staticRenderFns:[]}}},[55]);
//# sourceMappingURL=app.3cfcf95354588c240c44.js.map