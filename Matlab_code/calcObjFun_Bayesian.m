function objfun = calcObjFun_Bayesian(xmat, pts, wts, cset)
    objfun = 0;
    for idx = 1:length(wts)
        b = pts(:, idx);
        info = InfoMNL(xmat, b, cset);
        det_info = det(info);
        if det_info <= 0
            objfun = -100000;
        else
            objfun = objfun + log(det_info) * wts(idx);
        end
    end
end
