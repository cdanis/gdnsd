use _GDT ();
use Net::DNS;
use Test::More tests => 9;

_GDT->test_spawn_daemon();
_GDT->test_dns(
    qname => 'ns1.example.com',
    answer => 'ns1.example.com 86400 A 192.0.2.42',
);

_GDT->test_run_gdnsdctl("status");
_GDT->test_dns(
    qname => 'ns1.example.com',
    answer => 'ns1.example.com 86400 A 192.0.2.42',
);

_GDT->test_run_gdnsdctl("reload-zones");
_GDT->test_dns(
    qname => 'ns1.example.com',
    answer => 'ns1.example.com 86400 A 192.0.2.42',
);

_GDT->test_run_gdnsdctl("stats");
_GDT->test_dns(
    qname => 'ns1.example.com',
    answer => 'ns1.example.com 86400 A 192.0.2.42',
);

_GDT->test_run_gdnsdctl("stop");
