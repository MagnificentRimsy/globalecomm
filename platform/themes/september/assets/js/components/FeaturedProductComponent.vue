<template>
    <div class="row">
        <div class="half-circle-spinner" v-if="isLoading">
            <div class="circle circle-1"></div>
            <div class="circle circle-2"></div>
        </div>
        <div class="col-lg-3 col-md-4 col-6" v-for="item in data" :key="item.id" v-if="!isLoading && data.length" v-html="item">
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
            }
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
