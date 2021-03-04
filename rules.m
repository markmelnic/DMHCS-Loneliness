function [ fncs ] = rules()
    % DO NOT EDIT
    fncs = l2.getRules();
    for i=1:length(fncs)
        fncs{i} = str2func(fncs{i});
    end
end

function result = r4 (trace, params, t)
	result = {};

	%get level of loneliness of agent A
	for feeling_of_loneliness = trace(t).feeling_of_loneliness
		agent = feeling_of_loneliness.arg{1}; %agent name
		loneliness_state = feeling_of_loneliness.arg{2}; %loneliness state

        for reduced_performance = trace(t).reduced_performance
            performance = reduced_performance.arg{2};

            for alcoholism = trace(t).alcoholism
                alcohol = alcoholism.arg{2};

                for cardiovascular_diseases = trace(t).cardiovascular_diseases
                    diseases = cardiovascular_diseases.arg{2};   

                    if loneliness_state > params.loneliness_value1 && loneliness_state < params.loneliness_value2
                        performance = 0.9 * performance;
                        result = {result{:} {t+1, 'reduced_performance', {agent, performance}}};
                    elseif loneliness_state > params.loneliness_value2 && loneliness_state < 1
                         alcohol = 1.1 * alcohol;
                         result = {result{:} {t+1, 'alcoholism', {agent, alcohol}}};
                    elseif loneliness_state == 1
                        diseases = 1.1 * diseases;
                        result = {result{:} {t+1, 'cardiovascular_diseases', {agent, diseases}}};
                    end
                end
            end
        end
    end
end
