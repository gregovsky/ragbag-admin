
<div id="orders">
    <div>
        <isotope ref="cpt" id="root_isotope" class="isoDefault" :options='isotopeOptions()' :list="orderedOrders">
            <div class="card" v-for="item in orderedOrders" :key="item['@name']" v-bind:class="[ {'cardBig': item == opened}, item.status ]">
                <div class="content" v-on:click="openOrder(item)">
                    <div class="row">
                        <div class="col-xs-3">
                            <div class="icon-big icon-warning">
                                <i v-bind:class="orderStatusIcon(item)"></i>
                            </div>
                            <div class="change-status bigCardOnly">
                                <div class="dropdown">
                                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    Změnit status
                                    <b class="caret"></b>
                                  </a>
                                  <ul class="dropdown-menu">
                                    <li v-for="orderStatus in orderStatusOptions">
                                      <a v-on:click="changeOrderStatus(item,orderStatus.status)">
                                        <i v-bind:class="orderStatus.icon"></i> {{ orderStatus.title }}
                                      </a>
                                    </li>
                                  </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-9">
                            <div class="user_name text-right bigCardHidden">
                              <p>{{ item.user_name }}</p>
                            </div>

                            <div class="user_address text-right bigCardOnly">

                              <div class="text-right">
                                  <label>Jméno a přijmení:</label>
                                  <input type="text" class="form-control border-input" v-bind:value="item.user_name" v-on:input="inputChanged(item,'user_name',$event)">
                              </div>

                              <div class="text-right">
                                  <label>Ulice a číslo popisné:</label>
                                  <input type="text" class="form-control border-input" v-bind:value="item.user_street" v-on:input="inputChanged(item,'user_street',$event)">
                              </div>

                              <div class="text-right">
                                  <label>Město:</label>
                                  <input type="text" class="form-control border-input" v-bind:value="item.user_city" v-on:input="inputChanged(item,'user_city',$event)">
                              </div>

                              <div class="text-right">
                                  <label>Psč:</label>
                                  <input type="text" class="form-control border-input" v-bind:value="item.user_zip" v-on:input="inputChanged(item,'user_zip',$event)">
                              </div>

                              <div class="text-right">
                                  <label>Mobil:</label>
                                  <input type="text" class="form-control border-input" v-bind:value="item.user_phone" v-on:input="inputChanged(item,'user_phone',$event)">
                              </div>

                              <div class="text-right">
                                  <label>E-mail:</label>
                                  <input type="text" class="form-control border-input" v-bind:value="item.user_email" v-on:input="inputChanged(item,'user_email',$event)">
                              </div>

                              <div>
                                <textarea rows="5" class="form-control border-input" v-on:input="inputChanged(item,'user_message',$event)">{{ item.user_message }}</textarea>
                              </div>
                              {{ item.dataToUpdate }}
                              <div v-if="item.dataToUpdate.lenght > 0">
                                <button class="btn btn-info btn-fill btn-wd">Uložit změny</button>
                              </div>

                            </div>
                            <div class="numbers bigCardHidden">
                                {{ item.totalWithShipping }},-
                            </div>
                        </div>
                    </div>
                    <div>
                        <hr />
                        <table width='100%'>
                          <tr v-for="orderedItem in item.orderedItems">
                            <td class='small'>{{orderedItem.pcs}}x&nbsp;</td>
                            <td>{{orderedItem.name}}</td>
                            <td class='small'>&nbsp;{{orderedItem.variant}}</td>
                            <td class='small bigCardOnly text-right'>{{orderedItem.price}},-</td>
                          </tr>
                          <tr class='bigCardOnly'>
                            <td>&nbsp;</td>
                            <td>{{ item.shipping }}</td>
                            <td>&nbsp;</td>
                            <td class='small text-right'>{{ item.shippingPrice }},-</td>
                          </tr>
                          <tr class='bigCardOnly' v-if="item.discount > 0">
                            <td>&nbsp;</td>
                            <td>{{ item.discountCode }}</td>
                            <td>&nbsp;</td>
                            <td class='small text-right'>{{ item.discount }},-</td>
                          </tr>
                          <tr class='bigCardOnly'>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class='numbers text-right'>{{ item.totalWithShipping }},-</td>
                          </tr>
                        </table>
                    </div>
                    <div class="footer">
                        <hr />
                        <div class="stats" v-html="dateOfOrder(item)"></div>
                        <div class="stats bigCardHidden">
                            {{ item.shipping }}
                        </div>
                    </div>
                </div>
                <div class="card_exit bigCardOnly"><i v-on:click="closeOrder()" class="ti-close"></i></div>
            </div>
        </isotope>
    </div>

</div>

<script src="${cmsfn.link(content)?replace('.html','.js')}"></script>
