<template>
    <div class="row">
        <div class="half-circle-spinner" v-if="isLoading">
            <div class="circle circle-1"></div>
            <div class="circle circle-2"></div>
        </div>
        <div class="col-xl-4 col-lg-4 col-12" v-for="item in data" :key="item.id" v-if="!isLoading && data.length">
            <article class="post">
                <div class="post__wrapper">
                    <div class="post__thumbnail"><a class="post__overlay" :href="item.url"></a><img :src="item.image" :alt="item.name" /></div>
                    <div class="post__content">
                        <div class="post__header">
                            <h4 class="post__title"><a :href="item.url">{{ item.name }}</a></h4><span> {{ item.created_at }}</span>
                        </div>
                        <p>{{ item.description }}</p>
                    </div>
                </div>
            </article>
        </div>
    </div>
</template>

<script>
    export default {
        data: function() {
            return {
                isLoading: true,
                data: []
            };
        },

        mounted() {
            this.getData();
        },

        props: {
            url: {
                type: String,
                default: () => null,
                required: true
            },
        },

        methods: {
            getData() {
                this.data = [];
                this.isLoading = true;
                axios.get(this.url)
                    .then(res => {
                        this.data = res.data.data;
                        this.isLoading = false;
                    })
                    .catch(res => {
                        this.isLoading = false;
                        console.log(res);
                    });
            },
        }
    }
</script>
