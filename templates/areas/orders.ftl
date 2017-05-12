[#assign pageContent = cmsfn.page(content)]


<div id="orders">
    {{test}}
    <table class="pure-table pure-table-horizontal">
        <thead>
        <tr>
            <th>Datum</th>
            <th>Var. symb.</th>
            <th>Zákazník</th>
            <th>Cena celkem</th>
        </tr>
        </thead>

        <tbody>
        <tr  v-for="(item,index) in orders">
            <td>{{ item['mgnl:created'] | moment }}</td>
            <td>{{ item['@name'] }}</td>
            <td>{{ item.user_name }}</td>
            <td>{{ item.totalWithShipping }},-</td>
        </tr>


        </tbody>
    </table>
</div>


${resfn.js(["/ragbag-admin/webresources/js/orders.js"])!}

<script src="${cmsfn.link(pageContent)?replace('.html','.js')}?type=orders" type="javascript"></script>