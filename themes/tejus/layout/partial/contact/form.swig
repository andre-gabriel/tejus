<!-- Contact Form -->
<h3>Deixe-nos a sua mensagem:</h3>
<form name="sentMessage" id="contactForm" novalidate>
    <div class="control-group form-group">
        <div class="controls">
            <label>* Nome:</label>
            <input type="text" class="form-control" id="name" required data-validation-required-message="Introduza o seu nome">
            <p class="help-block"></p>
        </div>
    </div>
    <div class="control-group form-group">
        <div class="controls">
            <label>Entidade:</label>
            <input type="text" class="form-control" id="company">
        </div>
    </div>
    <div class="control-group form-group">
        <div class="controls">
            <label>* Contacto telefónico:</label>
            <input type="tel" class="form-control" id="phone" required data-validation-required-message="Introduza o seu número de telefone ou telemóvel">
        </div>
    </div>
    <div class="control-group form-group">
        <div class="controls">
            <label>* Email:</label>
            <input type="email" class="form-control" id="email" required data-validation-required-message="Introduza o seu email">
        </div>
    </div>
    <div class="control-group form-group">
        <div class="controls">
            <label>* Mensagem:</label>
            <textarea rows="10" cols="100" class="form-control" id="message" required data-validation-required-message="Introduza a sua mensagem" maxlength="999" style="resize:none"></textarea>
        </div>
    </div>
    <p>* Campo de preenchimento obrigatório</p>
    <div id="success"></div>
    <!-- For success/fail messages -->
    <button type="submit" class="btn btn-primary">Enviar</button>
</form>
