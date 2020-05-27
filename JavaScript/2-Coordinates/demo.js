function execute() {                               
    d3.csv( "data.txt" )
      .then( function( data ) {
          var height = d3.select("#demo2").style("height").replace("px", "")
          console.log(height)
          console.log(JSON.stringify(data,4));
          d3.select( "#demo2" )
                .selectAll( "circle" )
                .data( data ) 
                .enter()
                .append( "circle" )
                .attr( "r", 5 ).attr( "fill", "blue" )
                .attr( "cx", function(d) { return d.x } )
                .attr( "cy", function(d) { console.log(d.y);
                                           return Math.max(height - d["y"],0) } );
        } );
}