<template>
    <div v-show="list.length">
        <div class="list-control">
            <div class="list-control-filter">
                <span>书籍类型：</span>
                <span
                    class="list-control-filter-item"
                    :class="{on: item === filterType}"
                    v-for="item in types"
                    @click="handleFilterType(item)">{{ item }}</span>
            </div>
            
            <div class="list-control-order">
                <span>排序：</span>
                <span
                    class="list-control-order-item"
                    :class="{on: order === ''}"
                    @click="handleOrderDefault">默认</span>
                <span
                    class="list-control-order-item"
                  
                    :class="{on: order.indexOf('sales') > -1}"
                    @click="handleOrderSales">
                    销量
                    <!-- <template v-if="order === 'sales'">↓</template> -->
                    <template v-if="order === 'sales-asc'">↑</template>
                    <template v-if="order === 'sales-desc'">↓</template>
                </span>
                <span
                    class="list-control-order-item"
                    :class="{on: order.indexOf('price') > -1}"
                    @click="handleOrderPrice">
                    价格
                    <template v-if="order === 'price-asc'">↑</template>
                    <template v-if="order === 'price-desc'">↓</template>
                </span>
            </div>
        </div>
        <Product v-for="item in filteredAndOrderedList" :info="item" :key="item.id"></Product>
        <div class="product-not-found" v-show="!filteredAndOrderedList.length">暂无相关商品</div>
    </div>
</template>
<script>
    import Product from '../components/product.vue';
    export default {
        components: { Product },
        computed: {
            list () {
                return this.$store.state.productList;
            },
            types () {
                return this.$store.getters.types;
            },
            colors () {
                return this.$store.getters.colors;
            },
            filteredAndOrderedList () {
                let list = [...this.list];
                // 按品牌过滤
                if (this.filterType !== '') {
                    list = list.filter(item => item.type === this.filterType);
                }
                
                // 排序
                if (this.order !== '') {
                    if (this.order === 'sales-desc') {
                        list = list.sort((a, b) => b.sales - a.sales);
                    } else if (this.order === 'sales-asc') {
                        list = list.sort((a, b) => a.sales - b.sales);
                    } else if (this.order === 'price-desc') {
                        list = list.sort((a, b) => b.price - a.price);
                    } else if (this.order === 'price-asc') {
                        list = list.sort((a, b) => a.price - b.price);
                    }
                }
                return list;
            }
        },
        data () {
            return {
                filterType: '',
                filterColor: '',
                order: ''
            }
        },
        methods: {
            handleFilterType (type) {
                if (this.filterType === type) {
                    this.filterType = '';
                } else {
                    this.filterType = type;
                }
            },
            handleFilterColor (color) {
                if (this.filterColor === color) {
                    this.filterColor = '';
                } else {
                    this.filterColor = color;
                }
            },
            handleOrderDefault () {
                this.order = '';
            },
            handleOrderSales () {
                //this.order = 'sales';
                 if (this.order === 'sales-desc') {
                    this.order = 'sales-asc';
                } else {
                    this.order = 'sales-desc';
                }
            },
            handleOrderPrice () {
                if (this.order === 'price-desc') {
                    this.order = 'price-asc';
                } else {
                    this.order = 'price-desc';
                }
            }
        },
        mounted () {
            this.$store.dispatch('getProductList');
        }
    }
</script>
<style scoped>
    .list-control{
        background: #fff;
        border-radius: 6px;
        margin: 16px;
        padding: 16px;
        box-shadow: 0 1px 1px rgba(0,0,0,.2);
    }
    .list-control-filter{
        margin-bottom: 16px;
    }
    .list-control-filter-item,
    .list-control-order-item {
        cursor: pointer;
        display: inline-block;
        border: 1px solid #e9eaec;
        border-radius: 4px;
        margin-right: 6px;
        padding: 2px 6px;
    }
    .list-control-filter-item.on,
    .list-control-order-item.on{
        background: #f2352e;
        border: 1px solid #f2352e;
        color: #fff;
    }
    .product-not-found{
        text-align: center;
        padding: 32px;
    }
</style>