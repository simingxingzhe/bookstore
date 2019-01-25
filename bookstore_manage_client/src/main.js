// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import VueRouter from 'vue-router';
import Routers from './router/router';
import Vuex from 'vuex';
import App from './app.vue';
import '../static/css/style.css';
import axios from 'axios';
import qs from 'qs';

//import product_data from './views/data/book';
//import VueAxios from 'vue-axios';

Vue.use(VueRouter);
Vue.use(Vuex);
Vue.prototype.$axios = axios;    //全局注册，使用方法为:this.$axios
Vue.prototype.qs = qs;           //全局注册，使用方法为:this.qs
// 路由配置
const RouterConfig = {
    // 使用 HTML5 的 History 路由模式
    mode: 'history',
    routes: Routers
};
const router = new VueRouter(RouterConfig);
/*在跳转之前执行*/
router.beforeEach((to, from, next) => {
    //设置页面的title
    window.document.title = to.meta.title;
    next();
});
/*在跳转之后判断*/
router.afterEach((to, from, next) => {
    //当路由跳转完后滚动到页面的开始位置
    window.scrollTo(0, 0);
});

// 数组排重
function getFilterArray (array) {
    const res = [];
    const json = {};
    for (let i = 0; i < array.length; i++){
        const _self = array[i];
        if(!json[_self]){
            res.push(_self);
            json[_self] = 1;
        }
    }
    return res;
}

const store = new Vuex.Store({
    state: {
        productList: [],
        cartList: []
    },
    getters: {
        types: state => {
            //debugger
            console.log(state);
            //const brands = state.productList.map(item => item.brand);
            const types = state.productList.map(function(item) {
                console.log(item);
                return item.type;
            });
            return getFilterArray(types);
        }
    },
    mutations: {
        // 添加商品列表
        setProductList (state, data) {
            state.productList = data;
        },
        // 添加到购物车
        addCart (state, id) {
            // 先判断购物车是否已有，如果有，数量+1
            const isAdded = state.cartList.find(item => item.id === id);
            if (isAdded) {
                isAdded.count ++;
            } else {
                state.cartList.push({
                    id: id,
                    count: 1
                })
                axios.post('http://localhost:8005/test', {
                    // params: {
                    //     ID: 12345,
                    //     name: 2,
                        cart: JSON.stringify(state.cartList)
                    //}
                }
                )                              
            }
        },
        // 修改商品数量
        editCartCount (state, payload) {
            const product = state.cartList.find(item => item.id === payload.id);
            product.count += payload.count;
        },
        // 删除商品
        deleteCart (state, id) {
            const index = state.cartList.findIndex(item => item.id === id);
            state.cartList.splice(index, 1);
        },
        // 清空购物车
        emptyCart (state) {
            state.cartList = [];
        }
    },
    actions: {
        // 请求商品列表
        getProductList (context) {
            // 真实环境通过 ajax 获取，这里用异步模拟
            setTimeout(() => {                
                axios.get('http://localhost:8005/list2')
                .then(function (response) {               
                    context.commit('setProductList', response.data);
                    console.log('response.data=' + response.data);
                })
                .catch(function (error) {
                    // handle error
                    console.log(error);
                });
                
            }, 500);
        },
        // 购买
        buy (context) {
            // 真实环境应通过 ajax 提交购买请求后再清空购物列表
            return new Promise(resolve=> {
                setTimeout(() => {
                    context.commit('emptyCart');
                    resolve();
                }, 500)
            });
        }
    }
});

/* eslint-disable no-new */
new Vue({
    el: '#app',
    axios: axios,
    router: router,
    store: store,
    render: h => {
        return h(App)
    }
});