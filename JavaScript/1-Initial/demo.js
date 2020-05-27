function execute() {                               
    d3.csv( "data.txt" )
      .then( function( data ) {
          d3.select( "#demo1" )
                .selectAll( "circle" )
                .data( data ) 
                .enter()
                .append( "circle" )
                .attr( "r", 5 ).attr( "fill", "blue" )
                .attr( "cx", function(d) { return d.x } )
                .attr( "cy", function(d) { return d["y"] } );
        } );
}