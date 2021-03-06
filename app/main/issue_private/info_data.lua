local issue = param.get("issue", "table")

ui.container {
    attr = { class = "row-fluid" },
    content = function()
        ui.container {
            attr = { class = "span5" },
            content = function()
                ui.heading {
                    level = 3,
                    content = function()
                        ui.tag { content = _ "Unit:" }
                        slot.put(" ")
                        ui.tag { tag = "strong", content = issue.area.unit.name }
                    end
                }
                slot.put("<br>")
                ui.heading {
                    level = 3,
                    content = function()
                        ui.tag { content = _ "Area:" }
                        slot.put(" ")
                        ui.tag { tag = "strong", content = issue.area.name }
                    end
                }
                slot.put("<br>")
                ui.heading {
                    level = 3,
                    content = function()
                        ui.tag { content = _ "Policy:" }
                        slot.put(" ")
                        ui.tag { tag = "strong", content = issue.policy.name }
                    end
                }
                slot.put("<br>")
                ui.heading {
                    level = 3,
                    content = function()
                        ui.tag { content = _ "Issue created at:" }
                        ui.tag { tag = "strong", content = "  " .. format.timestamp(issue.created) }
                    end
                }
            --                slot.put("<br>")
            --                ui.heading {
            --                    level = 3,
            --                    attr = { class = "spaceline" },
            --                    content = function()
            --                        ui.tag { content = _ "Time limit to reach the next phase:" }
            --                        ui.tag { tag = "strong", content = "  " .. format.interval_text(issue.state_time_left, { mode = "time_left" }) }
            --                    end
            --                }
            end
        }
        ui.container {
            attr = { class = "span7" },
            content = function()
                if app.session.member then
                    ui.container {
                        attr = { class = "row-fluid" },
                        content = function()
                            ui.container {
                                attr = { class = "span12" },
                                content = function()
                                    ui.heading {
                                        level = 3,
                                        attr = { class = "label label-warning" },
                                        content = function()
                                            ui.tag { content = _ "By user" }
                                        end
                                    }
                                end
                            }
                        end
                    }
                    ui.container {
                        attr = { class = "row-fluid" },
                        content = function()
                            ui.container {
                                attr = { class = "span12" },
                                content = function()
                                    if issue.member_id and issue.member_id > 0 then
                                        execute.view { module = "member", view = "_info_data", id = issue.member_id, params = { module = "issue", view = "show_ext_bs", content_id = issue.id } }
                                    else
                                        ui.heading { level = 6, content = _ "No author for this issue" }
                                    end
                                end
                            }
                        end
                    }
                end
            end
        }
    end
}