module fil_2d_o(r, angle=90) {
intersection() {
circle(r=r);
polygon([
[0, 0],
[0, r],
[r * tan(angle/2), r],
[r * sin(angle), r * cos(angle)]
]);
}
}
// 2d primitive for inside fillets.
module fil_2d_i(r, angle=90) {
difference() {
polygon([
[0, 0],
[0, -r],
[-r * tan(angle/2), -r],
[-r * sin(angle), -r * cos(angle)]
]);
circle(r=r);
}
}
fil_2d_i(5);