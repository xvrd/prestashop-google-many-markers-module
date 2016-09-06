<div class="google-maps-module">
    <div class="searcher"> 
      <div class="form-group"> 
        <label> Search by City or zipcode </label>
        <div class="search-input">
          <input type="text" name="gmSearch"/>
          <div class="results"> </div>
        </div>
      </div>
    </div>

    <div class="locations-holder"> 
    {if isset($markers)}
        {foreach from=$markers key=key item=marker}
          <div class="address-row" data-marker="{$key}"> 
              <h4> {$marker->marker_name}</h4>
              <address>
                <div class="street"> {$marker->street}</div>
                <div class="city-code">
                  <span class="zipcode"> {$marker->postcode}</span>
                  <span class="city"> {$marker->city} </span>
                </div>
                <div class="phone">Phone: {$marker->phone} </div>
                <div class="site">Site: <a href="{$marker->url}" target="_blank"> visit site </a>
              </address>
          </div>
        {/foreach}
    {/if}
    </div>
    <div id="map" ></div>


  </div>