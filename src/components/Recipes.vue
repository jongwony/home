<template>
    <div id="Recipes">
        <h1>🍽️ Cooking Diary</h1>
        <p></p>
        <hr>
        <div>
            <b-card-group v-for="(items, idx) in zipItem(images)" :key="idx" columns>
                <b-card
                        v-for="image in items" :key=image.media_url
                        :img-src="image.media_url"
                        class="mb-3"
                >
                    <b-card-text>
                        {{ image.caption }}
                    </b-card-text>
                </b-card>
            </b-card-group>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Recipes",
        data() {
            return {
                images: []
            }
        },
        created() {
            let vm = this;
            let instagram_url = 'https://9e240d7v0k.execute-api.ap-northeast-2.amazonaws.com/api/instagram'
            this.$http
                .get(instagram_url)
                .then(function (response) {
                    vm.images = response.data.filter(
                        x => x.caption && x.media_type !== 'VIDEO' && x.caption.includes('#cooking')
                    )
                    vm.images.forEach((x, index) => {
                        let element = x;
                        element.caption = element.caption.replace('#cooking', '');
                        vm.images[index] = element;
                    });
                });
        },
        methods: {
            zipItem(items) {
              return items.reduce((c, n, i) => {
                console.log(c, n, i)
                if (i % (Math.ceil(items.length / 3)) === 0) c.push([]);
                c[c.length - 1].push(n);
                return c;
              }, []);
            }
        }
    }
</script>

<style scoped>
    #Recipes {
        margin-top: 120px;
    }

    img {
        max-width: 240px;
        display: flex;
        margin-left: auto;
        margin-right: auto;
    }

    .card-columns {
        max-width: 240px;
        padding: 20px;
        position: relative;
        display: inline-block;
        overflow: auto;
    }

</style>
