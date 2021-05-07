<div class="shop__sort">
    <div class="form-group--inline">
        <label for="sort-by">{{ __('Sort by') }}</label>
        <div class="form-group__content">
            <div class="select--arrow">
                <select name="sort-by" id="sort-by" class="form-control">
                    <option value="default_sorting" @if (request()->input('sort-by') == 'default_sorting') selected @endif>{{ __('Default') }}</option>
                    <option value="date_asc" @if (request()->input('sort-by') == 'date_asc') selected @endif>{{ __('Oldest') }}</option>
                    <option value="date_desc" @if (request()->input('sort-by') == 'date_desc') selected @endif>{{ __('Newest') }}</option>
                    <option value="price_asc" @if (request()->input('sort-by') == 'price_asc') selected @endif>{{ __('Price') }}: {{ __('low to high') }}</option>
                    <option value="price_desc" @if (request()->input('sort-by') == 'price_desc') selected @endif>{{ __('Price') }}: {{ __('high to low') }}</option>
                    <option value="name_asc" @if (request()->input('sort-by') == 'name_asc') selected @endif>{{ __('Name') }}: {{ __('A-Z') }}</option>
                    <option value="name_desc" @if (request()->input('sort-by') == 'name_desc') selected @endif>{{ __('Name') }}: {{ __('Z-A') }}</option>
                </select>
                <i class="feather icon icon-chevron-down"></i>
            </div>
        </div>
    </div>
</div>
