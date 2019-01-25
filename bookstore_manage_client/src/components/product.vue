<template>
    <div class="product">
        <router-link :to="'/product/' + info.id" class="product-main">
            <img :src="info.image">
            <h4>{{ info.name }}</h4>
            <!-- <div class="product-color" :style="{ background: colors[info.color]}"></div> -->
            <span class="product-inventory">库存：{{ info.inventory }}&nbsp;&nbsp;&nbsp;售出：{{ info.sales }}</span>
            <div class="product-cost">¥ {{ info.price }}</div>
            <div class="product-add-cart" @click.prevent="handleCart">加入购物车</div>
        </router-link>
    </div>
</template>
<script>
    import '../../static/css/product.css';
    export default {
        props: {
            info: Object
        },   
        methods: {
            handleCart () {
                this.$store.commit('addCart', this.info.id);
            }
        }
    };
</script>
