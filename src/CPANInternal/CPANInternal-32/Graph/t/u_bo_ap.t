use Test::More tests => 25;

use Graph;

use strict;

my $g = Graph::Undirected->new;

while (<DATA>) {
    chomp;
    my ($v1,$v2) = split ',';
    $g->add_edge($v1, $v2);
}

my @rts = sort $g->articulation_points;

is("@rts", "DIP:3047N DIP:3051N DIP:3053N DIP:3056N DIP:3059N DIP:3069N DIP:3075N DIP:3089N DIP:3095N DIP:3101N DIP:3103N DIP:3109N DIP:3120N") for 1..20;

my $h = Graph::Undirected->new;

$h->add_edge(qw(a b));
$h->add_edge(qw(a c));
$h->add_edge(qw(b c));
$h->add_edge(qw(b d));
$h->add_edge(qw(d e));
$h->add_edge(qw(d f));
$h->add_edge(qw(e f));

my @a1 = sort $h->articulation_points();

is("@a1", "b d");

$h->add_edge(qw(b b));

my @a2 = sort $h->articulation_points();

is("@a2", "b d");

$h->add_edge(qw(d d));

my @a3 = sort $h->articulation_points();

is("@a3", "b d");

$h->add_edge(qw(a a));

my @a4 = sort $h->articulation_points();

is("@a4", "b d");

$h->add_edge(qw(f f));

my @a5 = sort $h->articulation_points();

is("@a5", "b d");

__END__
DIP:3048N,DIP:3047N
DIP:3050N,DIP:3047N
DIP:3051N,DIP:3051N
DIP:3052N,DIP:3051N
DIP:3053N,DIP:3051N
DIP:3054N,DIP:3051N
DIP:3055N,DIP:3056N
DIP:3057N,DIP:3056N
DIP:3058N,DIP:3056N
DIP:3059N,DIP:3056N
DIP:3060N,DIP:3056N
DIP:3061N,DIP:3056N
DIP:3062N,DIP:3056N
DIP:3063N,DIP:3056N
DIP:3064N,DIP:3056N
DIP:3065N,DIP:3056N
DIP:3066N,DIP:3056N
DIP:3067N,DIP:3056N
DIP:3053N,DIP:3056N
DIP:3068N,DIP:3056N
DIP:3070N,DIP:3069N
DIP:3071N,DIP:3069N
DIP:3072N,DIP:3069N
DIP:3073N,DIP:3069N
DIP:3074N,DIP:3074N
DIP:3053N,DIP:3074N
DIP:3075N,DIP:3075N
DIP:3076N,DIP:3075N
DIP:3077N,DIP:3075N
DIP:3078N,DIP:3075N
DIP:3079N,DIP:3075N
DIP:3080N,DIP:3075N
DIP:3081N,DIP:3075N
DIP:3082N,DIP:3075N
DIP:3083N,DIP:3075N
DIP:3084N,DIP:3075N
DIP:3085N,DIP:3075N
DIP:3086N,DIP:3075N
DIP:3087N,DIP:3075N
DIP:3088N,DIP:3075N
DIP:3090N,DIP:3089N
DIP:3091N,DIP:3089N
DIP:3092N,DIP:3089N
DIP:3093N,DIP:3089N
DIP:3094N,DIP:3089N
DIP:3082N,DIP:3089N
DIP:3083N,DIP:3089N
DIP:3095N,DIP:3089N
DIP:3096N,DIP:3089N
DIP:3097N,DIP:3089N
DIP:3087N,DIP:3089N
DIP:3098N,DIP:3089N
DIP:3099N,DIP:3089N
DIP:3100N,DIP:3089N
DIP:3102N,DIP:3101N
DIP:3103N,DIP:3101N
DIP:3104N,DIP:3101N
DIP:3095N,DIP:3101N
DIP:3105N,DIP:3101N
DIP:3106N,DIP:3101N
DIP:3107N,DIP:3107N
DIP:3108N,DIP:3108N
DIP:3110N,DIP:3109N
DIP:3111N,DIP:3109N
DIP:3112N,DIP:3109N
DIP:3112N,DIP:3111N
DIP:3059N,DIP:3109N
DIP:3113N,DIP:3109N
DIP:3114N,DIP:3109N
DIP:3115N,DIP:3109N
DIP:3116N,DIP:3109N
DIP:3117N,DIP:3109N
DIP:3118N,DIP:3109N
DIP:3119N,DIP:3119N
DIP:3053N,DIP:3119N
DIP:3120N,DIP:3120N
DIP:3121N,DIP:3120N
DIP:3122N,DIP:3120N
DIP:3103N,DIP:3123N
DIP:3103N,DIP:3123N
DIP:3103N,DIP:3123N
DIP:3122N,DIP:3120N
DIP:3122N,DIP:3120N
