// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace ZynithIT.nishantest;

using Microsoft.Finance.Currency;

pageextension 50125 currencyExt extends "Currencies"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hi this is nishan ');
    end;
}