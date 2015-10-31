class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      redirect_to :back
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    binding.pry
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def download
    Axlsx::Package.new do |p|
      p.workbook.add_worksheet(:name => "All Items") do |sheet|
        sheet.add_row ["Item Name", "Category_Id", "Entry_id", "Comment", "Created At", "Amount"]
        @items = Item.all
        @items.each do |item|
          sheet.add_row [item.name, item.category_id, item.entry_id, item.comment, item.created_at, item.amount]
        end
      end
      p.workbook.add_worksheet(:name => "Category Table") do |sheet|
        sheet.add_row ["Category Name", "Category_Id"]
        @categories = Category.all
        @categories.each do |category|
          sheet.add_row [category.name, category.id]
        end
      end
      p.workbook.add_worksheet(:name => "Entry Table") do |sheet|
        sheet.add_row ["Entry Name", "Category_ID", "Entry_ID"]
        @entries = Entry.all
        @entries.each do |entry|
          sheet.add_row [entry.name, entry.category_id, entry.id]
        end
      end
      p.serialize("moneytrack_#{Date.today}.xlsx")
    end
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :entry_id, :amount)
  end

end
