// Reactive plans for events generated by the group management console (decisions of my user)
+cmd("createSubGroup",Group,SubGroup,SubGroupName) : my_org(Os) & my_org_wsp(Wsp)
    <-      .println("Going to create ",SubGroup," in ",Group);
            joinWorkspace(Wsp,_);
            lookupArtifact(Group,GroupId);
            makeArtifact(SubGroupName,"ora4mas.nopl.GroupBoard",[Os, SubGroup, false, true ],SGId);
            focus(SGId);
            setParentGroup(Group)[artifact_id(SGId)];
    //  adoptRole(Role)[artifact_id(GroupId)];
        .println("SubGroup created").

+cmd("deleteSubGroup",SubGroup)
    <-  .println("Going to delete ",SubGroup);
    //  lookupArtifact(Group,GroupId);
    //  adoptRole(Role)[artifact_id(GroupId)];
        destroy[artifact_name(SubGroup)];
        lookupArtifact(SubGroup, G3);
        disposeArtifact(G3);
        .println("SubGroup deleted").

+cmd("adoptRole",Group,Role)
    <-  .println("Going to adopt ",Role," in ",Group);
        lookupArtifact(Group,GroupId);
        adoptRole(Role)[artifact_id(GroupId)];
        .println("Role adopted").

-cmd("adoptRole",Group,Role)
    <-  .println("Going to adopt ",Role," in ",Group);
        lookupArtifact(Group,GroupId);
        adoptRole(Role)[artifact_id(GroupId)];
        focus(GroupId);
        .println("Role adopted").

+cmd("leaveRole",Group,Role)
    <-  .println("Going to leave ",Role," in ",Group);
        lookupArtifact(Group,GroupId);
        leaveRole(Role)[artifact_id(GroupId)];
        stopFocus(GroupId);
        .println("Role left").

+cmd("focusGroup",Group)
    <-  .println("Going to focus on",Group);
        lookupArtifact(Group,GroupId);
        focus(GroupId);
        .println("Focus done").

+cmd("unfocusGroup",Group)
    <-  .println("Going to unfocus of",Group);
        lookupArtifact(Group,GroupId);
        stopFocus(GroupId);
        .println("Unfocus done").

+cmd("focusScheme",Scheme)
    <-  .println("Going to focus on",Scheme);
        lookupArtifact(Scheme,SchemeId);
        focus(SchemeId);
        .println("Focus done").

+cmd("unfocusScheme",Scheme)
    <-  .println("Going to unfocus of",Scheme);
        lookupArtifact(Scheme,SchemeId);
        stopFocus(SchemeId);
        .println("Unfocus done").

+cmd("createScheme",Scheme,SchemeName) : my_org(Os)
    <-  .println("Going to create ",SchemeName," of ",Scheme);
        makeArtifact(SchemeName,"ora4mas.nopl.SchemeBoard",[Os, Scheme, false, true], SchArtId);
        focus(SchArtId);
        .println("Scheme created").

+cmd("deleteScheme",Scheme)
    <-  .println("Going to delete ",Scheme);
        destroy[artifact_name(Scheme)];
        lookupArtifact(Scheme,SchId);
        disposeArtifact(SchId);
        .println("Scheme deleted").

+cmd("addScheme",Group,Scheme)
    <-  .println("Going to add scheme ",Scheme," in ",Group);
        lookupArtifact(Scheme,SchemeId);
        lookupArtifact(Group,GroupId);
        addScheme(Scheme)[artifact_id(GroupId)];
        .println("Scheme added").

+cmd("removeScheme",Group,Scheme)
    <-  .println("Going to remove scheme ",Scheme," from ",Group);
        lookupArtifact(Scheme,SchemeId);
        lookupArtifact(Group,GroupId);
        removeScheme(Scheme)[artifact_id(GroupId)];
        .println("Scheme removed").

// Reactive plans for events generated by the scheme management console (decisions of my user)
+cmd("commitMission",Scheme,Mission)
    <-  .println("Going to commit ",Mission," in ",Scheme);
        lookupArtifact(Scheme,SchemeId);
        commitMission(Mission)[artifact_id(SchemeId)];
        .println("Committed to mission").

+cmd("leaveMission",Scheme,Mission)
    <-  .println("Going to leave ",Mission," in ",Scheme);
        lookupArtifact(Scheme,SchemeId);
        leaveMission(Mission)[artifact_id(SchemeId)];
        .println("Mission left.").

+cmd("goalAchieved",Scheme,Goal)
    <-  .println("Goal ", Goal, " has been achieved in ",Scheme);
        lookupArtifact(Scheme,SchemeId);
        goalAchieved(Goal)[artifact_id(SchemeId)];
        .println("Goal achieved").
