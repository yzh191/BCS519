%%
a = [];
cue_types = ["valid", "neutral", "invalid"];
soas = [1 100 1 1 490 1 1];

cue_type = [];
soa = [];
pc = [];

for i = 1:size(data.rt, 2)
    for j = 1:size(data.rt, 3)
        for k = 1:size(data.rt, 1)
            if (j == 2 || j == 5)
                if (k ~= 1)
                    pc = [pc data.perf(k, i, j)];
                    cue_type = [cue_type cue_types(i)];
                    soa = [soa soas(j)];
                end
            end
        end
    end
end
%%
t = table(cue_type', soa', pc', VariableNames= ["cue_type", "soa", "pc"]);
writetable(t, "data_rt_soa.csv", WriteRowNames=true);