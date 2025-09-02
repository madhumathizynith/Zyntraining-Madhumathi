namespace Training.Training;

pageextension 50141 Indexsubpage extends "Index card"
{
    layout
    {
        addlast(General)
        {
            part(Indexsubpage; "Index Listpart page")
            {
                ApplicationArea = all;
                SubPageLink = Code = field(Code);
            }
        }

    }

}