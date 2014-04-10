# def four_sq_response
#   res = Hash.new()
#   res[:meta] = {code: 200}
#   res[:response] = {
#     groups: [{
#       items: [],
#       name: "recommended",
#       type: "Recommended Places"
#     }],
#     headerFullLocation: "Greenpoint, Brooklyn",
#     query: "food"
#   }
# 
#   10.times do |i|
#     venue = {
#       name: "Example #{i}",
#       location: {
#         address: "18 Bedford Ave",
#         crossStreet: "at Lormier St"
#       },
#       hours: {
#         isOpen: true,
#         status: "Open until 1:00am"
#       }
#     }
#     res[:response][:groups][0][:items][i] = venue
