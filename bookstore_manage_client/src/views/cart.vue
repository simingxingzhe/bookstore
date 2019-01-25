<template>
    <div class="cart">
        <div class="cart-header">
            <div class="cart-header-title">购物清单</div>
            <div class="cart-header-main">
                <div class="cart-info">商品信息</div>
                <div class="cart-price">单价</div>
                <div class="cart-count">数量</div>
                <div class="cart-cost">小计</div>
                <div class="cart-delete">删除</div>
            </div>
        </div>
        <div class="cart-content">
            <div class="cart-content-main" v-for="(item, index) in cartList"> 
                <div class="cart-info">
                    <img :src="productDictList[item.id].image">
                    <span>{{ productDictList[item.id].name }}</span>
                </div>
                <div class="cart-price">¥ {{ productDictList[item.id].price }}</div>
                <div class="cart-count">
                    <span class="cart-control-minus" @click="handleCount(index, -1)">-</span>
                    {{ item.count }}
                    <span class="cart-control-add" @click="handleCount(index, 1)">+</span>
                </div>
                <div class="cart-cost">¥ {{ productDictList[item.id].price * item.count }}</div>
                <div class="cart-delete">
                    <span class="cart-control-delete" @click="handleDelete(index)">删除</span>
                </div>
            </div>
            <div class="cart-empty" v-if="!cartList.length">购物车为空</div>
        </div>
         <!-- <div class="cart-promotion" v-show="cartList.length">
            <span>使用优惠码：</span>
            <input type="text" v-model="promotionCode">
            <span class="cart-control-promotion" @click="handleCheckCode">验证</span>
        </div>   -->
       <div class="cart-footer" v-show="cartList.length">
            <div class="cart-footer-desc">
                共计 <span>{{ countAll }}</span> 件商品
            </div>
            <div class="cart-footer-desc">
                应付总额 <span>¥ {{ costAll - promotion }}</span>
                <br>
                <template v-if="promotion">
                    （优惠 <span>¥ {{ promotion }}</span>）
                </template>
            </div>
            <div class="cart-footer-desc">
                <div class="cart-control-order" @click="handleOrder">现在结算</div>
            </div>
        </div>
    </div>
</template>
<script>
    import '../../static/css/cart.css';
    //import axios from 'axios';
    //import qs from 'qs';
    export default {
        computed: {
            cartList () {//购物车列表
                return this.$store.state.cartList;
            },
            productDictList () {
                // const dict = {};
                // this.productList.forEach(item => {                  
                //     dict[item.id] = item;
                // });alert(JSON.stringify(dict));
                // return dict;
                return this.productList;
            },
            countAll () {
                let count = 0;
                this.cartList.forEach(item => {
                    count += item.count;
                });
                return count;
            },
            costAll () {
                let cost = 0;
                this.cartList.forEach(item => {
                    cost += this.productDictList[item.id].price * item.count;
                });
                return cost;
            }
        },
        data () {
            return {
                productList: [],
                promotionCode: '',
                promotion: 0
            }
        },
        methods: {
            //修改购买书籍的数量
            handleCount (index, count) {
                if (count < 0 && this.cartList[index].count === 1) return;
                this.$store.commit('editCartCount', {
                    id: this.cartList[index].id,
                    count: count
                });
            },
            //删除购物车书籍
            handleDelete (index) {
                this.$store.commit('deleteCart', this.cartList[index].id);
            },
            handleCheckCode () {
                if (this.promotionCode === '') {
                    window.alert('请输入优惠码');
                    return;
                }
                if (this.promotionCode !== 'Vue.js') {
                    window.alert('优惠码验证失败');
                } else {
                    this.promotion = 500;
                }
            },
            //提交订单
            handleOrder () {
                this.$store.dispatch('buy').then(() => {
                    window.alert('购买成功');
                })
            },
            getProductList() {
                /*
                var _this = this;
                axios.get('http://localhost:8005/list2')
                    .then(function (response) {
                        _this.productList = response.data;
                        //console.log('this.productList=' + JSON.stringify(_this.productList));
                    })
                    .catch(function (error) {
                        // handle error
                        console.log(error);
                    });
                */
                this.productList = this.$store.state.productList;
            }
        },
        mounted: function(){
            this.getProductList();            
        }
    }
</script>
