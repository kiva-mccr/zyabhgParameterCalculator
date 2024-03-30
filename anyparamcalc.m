% clear
clc

set(0,'DefaultFigureWindowStyle','docked')

% Ask a question and get a response
response = input('Which set of parameters do you have? (z, y, a, b, h , g)?   > ', 's');

% Use the response in a conditional statement
if strcmp(response, 'z')
    disp('You chose option z.');
    z11 = input('What is the value of z11?   > ');
    z12 = input('What is the value of z12?   > ');
    z21 = input('What is the value of z21?   > ');
    z22 = input('What is the value of z22?   > ');
    z = [z11 z12 ; z21 z22]

    % define delta z to prepare for conversion
    deltaz =  z11*z22-z12*z21;
    
    % calculate values of y
    y11 = z22/deltaz;
    y12 = -z12/deltaz;
    y21 = -z21/deltaz;
    y22 = z11/deltaz;
    
    % define y matrix
    y = [y11 y12 ; y21 y22];
    
    % calculate values of a
    a11 = z11/z21;
    a12 = deltaz/z21;
    a21 = 1/z21;
    a22 = z22/z21;
    
    % define a matrix
    a = [a11 a12 ; a21 a22];
    
    % calculate values of b
    b11 = z22/z12;
    b12 = deltaz/z12;
    b21 = 1/z12;
    b22 = z11/z12;
    
    % define b matrix
    b = [b11 b12 ; b21 b22];
    
    % calculate values of h
    h11 = deltaz/z22;
    h12 = z12/z22;
    h21 = -z21/z22;
    h22 = 1/z22;
    
    % define h matrix
    h = [h11 h12 ; h21 h22];
    
    % calculate values of g
    g11 = 1/z11;
    g12 = -z12/z11;
    g21 = z21/z11;
    g22 = deltaz/z11;
    
    % define g matrix
    g = [g11 g12 ; g21 g22];
    
    % convert to a symbolic matrix
    z_sym = sym(z);
    y_sym = sym(y);
    a_sym = sym(a);
    b_sym = sym(b);
    h_sym = sym(h);
    g_sym = sym(g);
    
    % convert to LaTeX
    z_latex = latex(z_sym);
    y_latex = latex(y_sym);
    a_latex = latex(a_sym);
    b_latex = latex(b_sym);
    h_latex = latex(h_sym);
    g_latex = latex(g_sym);
    
    % Render results in latex
    figure
    set(gcf, 'color', 'white'), axis off     %# Remove axes and set white background
    
    % Format your LaTeX strings with variables
    my_text = {sprintf('$$z=%s   y=%s$$', z_latex, y_latex), '', sprintf('$$a=%s   b=%s$$', a_latex, b_latex), '', sprintf('$$h=%s   g=%s$$', h_latex, g_latex)};
    
    text('units', 'inch', 'position', [1 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text);

    % Format...
    deltaz_latex = latex(sym(deltaz));

    my_text2 = ['$$ \Delta z=' deltaz_latex '$$'];

    text('units', 'inch', 'position', [0 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text2);


elseif strcmp(response, 'y')
    disp('You chose option y.');
    y11 = input('What is the value of y11?   > ');
    y12 = input('What is the value of y12?   > ');
    y21 = input('What is the value of y21?   > ');
    y22 = input('What is the value of y22?   > ');
    y = [y11 y12 ; y21 y22]

    % define delta z to prepare for conversion
    deltay =  y11*y22-y12*y21;
    
    % calculate values of z
    z11 = y22/deltay;
    z12 = -y12/deltay;
    z21 = -y21/deltay;
    z22 = y11/deltay;
    
    % define y matrix
    z = [z11 z12 ; z21 z22];
    
    % calculate values of a
    a11 = -y22/y21;
    a12 = -1/y21;
    a21 = -deltay/y21;
    a22 = -y11/y21;
    
    % define a matrix
    a = [a11 a12 ; a21 a22];
    
    % calculate values of b
    b11 = -y11/y12;
    b12 = -1/y12;
    b21 = -deltay/y12;
    b22 = y22/y12;
    
    % define b matrix
    b = [b11 b12 ; b21 b22];
    
    % calculate values of h
    h11 = 1/y11;
    h12 = -y12/y11;
    h21 = y21/y11;
    h22 = deltay/y11;
    
    % define h matrix
    h = [h11 h12 ; h21 h22];
    
    % calculate values of g
    g11 = deltay/y22;
    g12 = y12/y22;
    g21 =  -y21/y22;
    g22 = 1/y22;
    
    % define g matrix
    g = [g11 g12 ; g21 g22];
    
    % convert to a symbolic matrix
    z_sym = sym(z);
    y_sym = sym(y);
    a_sym = sym(a);
    b_sym = sym(b);
    h_sym = sym(h);
    g_sym = sym(g);
    
    % convert to LaTeX
    z_latex = latex(z_sym);
    y_latex = latex(y_sym);
    a_latex = latex(a_sym);
    b_latex = latex(b_sym);
    h_latex = latex(h_sym);
    g_latex = latex(g_sym);
    
    % Render results in latex
    figure
    set(gcf, 'color', 'white'), axis off     %# Remove axes and set white background
    
    % Format your LaTeX strings with variables
    my_text = {sprintf('$$z=%s   y=%s$$', z_latex, y_latex), '', sprintf('$$a=%s   b=%s$$', a_latex, b_latex), '', sprintf('$$h=%s   g=%s$$', h_latex, g_latex)};
    
    text('units', 'inch', 'position', [1 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text);

    % Format...
    deltay_latex = latex(sym(deltay));

    my_text2 = ['$$ \Delta y=' deltay_latex '$$'];

    text('units', 'inch', 'position', [0 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text2);

elseif strcmp(response, 'a')
    disp('You chose option a.');
    a11 = input('What is the value of a11?   > ');
    a12 = input('What is the value of a12?   > ');
    a21 = input('What is the value of a21?   > ');
    a22 = input('What is the value of a22?   > ');
    a = [a11 a12 ; a21 a22]

    % define delta z to prepare for conversion
    deltaa =  a11*a22-a12*a21;
    
    % calculate values of z
    z11 = a11/a21;
    z12 = deltaa/a21;
    z21 = 1/a21;
    z22 = a22/a21;
    
    % define z matrix
    z = [z11 z12 ; z21 z22];

    % calculate values of y
    y11 = a22/a12;
    y12 = -deltaa/a12;
    y21 = -1/a12;
    y22 = a11/a12;

    % define y matrix
    y = [y11 y12 ; y21 y22];
    
    % calculate values of b
    b11 = a22/deltaa;
    b12 = a12/deltaa;
    b21 = a21/deltaa;
    b22 = a11/deltaa;
    
    % define b matrix
    b = [b11 b12 ; b21 b22];
    
    % calculate values of h
    h11 = a12/a22;
    h12 = deltaa/a22;
    h21 = -1/a22;
    h22 = a21/a22;
    
    % define h matrix
    h = [h11 h12 ; h21 h22];
    
    % calculate values of g
    g11 = a21/a11;
    g12 = -deltaa/a11;
    g21 =  1/a11;
    g22 = a12/a11;
    
    % define g matrix
    g = [g11 g12 ; g21 g22];
    
    % convert to a symbolic matrix
    z_sym = sym(z);
    y_sym = sym(y);
    a_sym = sym(a);
    b_sym = sym(b);
    h_sym = sym(h);
    g_sym = sym(g);
    
    % convert to LaTeX
    z_latex = latex(z_sym);
    y_latex = latex(y_sym);
    a_latex = latex(a_sym);
    b_latex = latex(b_sym);
    h_latex = latex(h_sym);
    g_latex = latex(g_sym);
    
    % Render results in latex
    figure
    set(gcf, 'color', 'white'), axis off     %# Remove axes and set white background
    
    % Format your LaTeX strings with variables
    my_text = {sprintf('$$z=%s   y=%s$$', z_latex, y_latex), '', sprintf('$$a=%s   b=%s$$', a_latex, b_latex), '', sprintf('$$h=%s   g=%s$$', h_latex, g_latex)};
    
    text('units', 'inch', 'position', [1 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text);

    % Format...
    deltaa_latex = latex(sym(deltaa));

    my_text2 = ['$$ \Delta a=' deltaa_latex '$$'];

    text('units', 'inch', 'position', [0 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text2);

elseif strcmp(response, 'b')
    disp('You chose option b.');
    b11 = input('What is the value of b11?   > ');
    b12 = input('What is the value of b12?   > ');
    b21 = input('What is the value of b21?   > ');
    b22 = input('What is the value of b22?   > ');
    b = [b11 b12 ; b21 b22]

    % define delta z to prepare for conversion
    deltab =  b11*b22-b12*b21;
    
    % calculate values of z
    z11 = b22/b21;
    z12 = 1/b21;
    z21 = deltab/b21;
    z22 = b11/b21;
    
    % define z matrix
    z = [z11 z12 ; z21 z22];

    % calculate values of y
    y11 = b11/b12;
    y12 = -1/b12;
    y21 = -deltab/b12;
    y22 = b22/b12;

    % define y matrix
    y = [y11 y12 ; y21 y22];
    
    % calculate values of a
    a11 = b22/deltab;
    a12 = b12/deltab;
    a21 = b21/deltab;
    a22 = b11/deltab;
    
    % define a matrix
    a = [a11 a12 ; a21 a22];
    
    % calculate values of h
    h11 = b12/b11;
    h12 = 1/b11;
    h21 = -deltab/b11;
    h22 = b21/b11;
    
    % define h matrix
    h = [h11 h12 ; h21 h22];
    
    % calculate values of g
    g11 = b21/b22;
    g12 = -1/b22;
    g21 = deltab/b22;
    g22 = b12/b22;
    
    % define g matrix
    g = [g11 g12 ; g21 g22];
    
    % convert to a symbolic matrix
    z_sym = sym(z);
    y_sym = sym(y);
    a_sym = sym(a);
    b_sym = sym(b);
    h_sym = sym(h);
    g_sym = sym(g);
    
    % convert to LaTeX
    z_latex = latex(z_sym);
    y_latex = latex(y_sym);
    a_latex = latex(a_sym);
    b_latex = latex(b_sym);
    h_latex = latex(h_sym);
    g_latex = latex(g_sym);
    
    % Render results in latex
    figure
    set(gcf, 'color', 'white'), axis off     %# Remove axes and set white background
    
    % Format your LaTeX strings with variables
    my_text = {sprintf('$$z=%s   y=%s$$', z_latex, y_latex), '', sprintf('$$a=%s   b=%s$$', a_latex, b_latex), '', sprintf('$$h=%s   g=%s$$', h_latex, g_latex)};
    
    text('units', 'inch', 'position', [1 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text);   

    % Format...
    deltab_latex = latex(sym(deltab));

    my_text2 = ['$$ \Delta b=' deltab_latex '$$'];

    text('units', 'inch', 'position', [0 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text2);

elseif strcmp(response, 'h')
    disp('You chose option h.');
    h11 = input('What is the value of h11?   > ');
    h12 = input('What is the value of h12?   > ');
    h21 = input('What is the value of h21?   > ');
    h22 = input('What is the value of h22?   > ');
    h = [h11 h12 ; h21 h22]

    % define delta z to prepare for conversion
    deltah =  h11*h22-h12*h21;
    
    % calculate values of z
    z11 = deltah/h22;
    z12 = h12/h22;
    z21 = -h21/h22;
    z22 = 1/h22;
    
    % define z matrix
    z = [z11 z12 ; z21 z22];

    % calculate values of y
    y11 = 1/h11;
    y12 = -h12/h11;
    y21 = h21/h11;
    y22 = deltah/h11;

    % define y matrix
    y = [y11 y12 ; y21 y22];
    
    % calculate values of a
    a11 = -deltah/h21;
    a12 = -h11/h21;
    a21 = -h22/h21;
    a22 = -1/h21;
    
    % define a matrix
    a = [a11 a12 ; a21 a22];

    % calculate values of b
    b11 = 1/h12;
    b12 = h11/h12;
    b21 = h22/h12;
    b22 = deltah/h12;
    
    % define b matrix
    b = [b11 b12 ; b21 b22];
    
    % calculate values of g
    g11 = h22/deltah;
    g12 = -h12/deltah;
    g21 = -h21/deltah;
    g22 = h11/deltah;
    
    % define g matrix
    g = [g11 g12 ; g21 g22];
    
    % convert to a symbolic matrix
    z_sym = sym(z);
    y_sym = sym(y);
    a_sym = sym(a);
    b_sym = sym(b);
    h_sym = sym(h);
    g_sym = sym(g);
    
    % convert to LaTeX
    z_latex = latex(z_sym);
    y_latex = latex(y_sym);
    a_latex = latex(a_sym);
    b_latex = latex(b_sym);
    h_latex = latex(h_sym);
    g_latex = latex(g_sym);
    
    % Render results in latex
    figure
    set(gcf, 'color', 'white'), axis off     %# Remove axes and set white background
    
    % Format your LaTeX strings with variables
    my_text = {sprintf('$$z=%s   y=%s$$', z_latex, y_latex), '', sprintf('$$a=%s   b=%s$$', a_latex, b_latex), '', sprintf('$$h=%s   g=%s$$', h_latex, g_latex)};
    
    text('units', 'inch', 'position', [1 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text);   

    % Format...
    deltah_latex = latex(sym(deltah));

    my_text2 = ['$$ \Delta h=' deltah_latex '$$'];

    text('units', 'inch', 'position', [0 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text2);

elseif strcmp(response, 'g')
    disp('You chose option g.');
    g11 = input('What is the value of g11?   > ');
    g12 = input('What is the value of g12?   > ');
    g21 = input('What is the value of g21?   > ');
    g22 = input('What is the value of g22?   > ');
    g = [g11 g12 ; g21 g22]

    % define delta z to prepare for conversion
    deltag =  g11*g22-g12*g21;
    
    % calculate values of z
    z11 = 1/g11;
    z12 = -g12/g11;
    z21 = g21/g11;
    z22 = deltag/g11;
    
    % define z matrix
    z = [z11 z12 ; z21 z22];

    % calculate values of y
    y11 = deltag/g22;
    y12 = g12/g22;
    y21 = -g21/g22;
    y22 = 1/g22;

    % define y matrix
    y = [y11 y12 ; y21 y22];
    
    % calculate values of a
    a11 = 1/g21;
    a12 = g22/g21;
    a21 = g11/g21;
    a22 = deltag/g21;
    
    % define a matrix
    a = [a11 a12 ; a21 a22];

    % calculate values of b
    b11 = -deltag/g12;
    b12 = -g22/g12;
    b21 = -g11/g12;
    b22 = -1/g12;
    
    % define b matrix
    b = [b11 b12 ; b21 b22];

    % calculate values of h
    h11 = g22/deltag;
    h12 = -g12/deltag;
    h21 = -g21/deltag;
    h22 = g11/deltag;
    
    % define h matrix
    h = [h11 h12 ; h21 h22];
    
    % convert to a symbolic matrix
    z_sym = sym(z);
    y_sym = sym(y);
    a_sym = sym(a);
    b_sym = sym(b);
    h_sym = sym(h);
    g_sym = sym(g);
    
    % convert to LaTeX
    z_latex = latex(z_sym);
    y_latex = latex(y_sym);
    a_latex = latex(a_sym);
    b_latex = latex(b_sym);
    h_latex = latex(h_sym);
    g_latex = latex(g_sym);
    
    % Render results in latex
    figure
    set(gcf, 'color', 'white'), axis off     %# Remove axes and set white background
    
    % Format your LaTeX strings with variables
    my_text = {sprintf('$$z=%s   y=%s$$', z_latex, y_latex), '', sprintf('$$a=%s   b=%s$$', a_latex, b_latex), '', sprintf('$$h=%s   g=%s$$', h_latex, g_latex)};
    
    text('units', 'inch', 'position', [1 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text);   

    % Format...
    deltag_latex = latex(sym(deltag));

    my_text2 = ['$$ \Delta g=' deltag_latex '$$'];

    text('units', 'inch', 'position', [0 1], 'fontsize', 12, 'color', 'k', ...
    'interpreter', 'latex', 'string', my_text2);

else
    disp('Invalid option');
    % Add your logic here
end