# This file contains infor and links that are useful
'''Color Codes : https://matplotlib.org/examples/color/colormaps_reference.html'''
fig = px.bar(df_2018['City'].value_counts(),
             title='Climate Region Value counts').update_layout(xaxis_title='Climate Region',yaxis_title='count')
fig.update_traces(marker_color='violet')
fig.show()