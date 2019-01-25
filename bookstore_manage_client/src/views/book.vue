<template>
    <div v-if="book">
        <div class="book">
            <div class="book-image">
                <img :src="book.image"><br/>  
                <span class="book-cost">库存：{{ book.inventory }}&nbsp;&nbsp;&nbsp;售出：{{ book.sales }}</span>       
            </div>
            
            <div class="book-info">
                <h1 class="book-name">{{ book.name }}</h1>            
                <div class="book-cost">¥ {{ book.price }}</div>
                <div class="book-add-cart" @click="handleAddToCart">加入购物车</div>
            </div>
        </div>
        <div class="book-desc">
            <h2>产品介绍</h2>
            <img v-for="n in 10" :src="'http://ordfm6aah.bkt.clouddn.com/shop/' + n + '.jpeg'">
        </div>
    </div>
</template>
<script>
    import '../../static/css/book.css';
    //import axios from 'axios';
    //import qs from 'qs';
    export default {
        data () {
            return {
                // 获取路由中的参数
                id: parseInt(this.$route.params.id),
                book: null
            }
        },
        methods: {
            getBook () {
                // 真实环境通过 ajax 获取，这里用异步模拟
                /*
                var _this = this;
                setTimeout(() => {
                    axios.get('http://localhost:8005/list2')
                    .then(function (response) {                   
                        _this.book = response.data.find(function (item) {                      
                        return item.id === _this.id;
                    });
                        console.log('book=' + JSON.stringify(_this.book));
                    })
                    .catch(function (error) {
                        // handle error
                        console.log(error);
                    });                                       
                }, 500);
                */
               //使用es6的=>书写简单的逻辑
               //this.book = this.$store.state.productList.find(item => item.id === this.id);
               var _this = this;
               this.book = this.$store.state.productList.find(function (item) {                      
                        //return item.id === _this.id;//if(item.id == _this.id) return item.id;
                        if(item.id == _this.id) return item.id;
                    });

            },
            // 加入购物车
            handleAddToCart () {
                this.$store.commit('addCart', this.id);
            }
        },
        mounted () {
            this.getBook();
        }
    }
</script>
