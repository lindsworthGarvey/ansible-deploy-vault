$TTL 1D
@       IN SOA  usctvletcd01v.curbstone.com. root.curbstone.com. (
                                        0       ; serial
                                        1D      ; refresh
                                        1H      ; retry
                                        1W      ; expire
                                        3H      ; minimum
)
@                               IN      NS      usctvletcd01v.curbstone.com.
@                               IN      A       10.13.3.15
@                               IN      A       10.13.3.16
@                               IN      A       10.13.3.17
@                               IN      A       10.13.3.10
@                               IN      A       10.13.3.11
usctvletcd01v                   IN      A       10.13.3.15
usctvletcd02v                   IN      A       10.13.3.16
usctvletcd03v                   IN      A       10.13.3.17
utrutstvault01v                 IN      A       10.13.3.10
utrutstvault02v                 IN      A       10.13.3.11
