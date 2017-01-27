class DisciplineUniversity < ActiveRecord::Base
    belongs_to :university
	belongs_to :discipline
	belongs_to :subdiscipline
    belongs_to :degreeprogram, foreign_key: "degreeprogram_id"
    
    
    filterrific(
	  default_filter_params: { sorted_by: 'created_at_desc'},
	  available_filters: [
	  	:sorted_by,
	  	:search_query,
	    :with_university_id,
	    :with_discipline_id
	  ]
	)
	
	scope :with_university_id, lambda { |university_id|
    	where(university_id: [*university_ids])
  	}
  	scope :by_uni_id,-> ids {where(university_id: ids) if ids.present? }
  	scope :by_discipline_id,-> ids {where(discipline_id: ids) if ids.present? }
end
