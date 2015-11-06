/**
 * Function de vérification des inputs
 * @form 	Element contenant les inputs à vérifier
 * @return 	True si tous les inputs sont valides, faux sinon
 */
function checkInputs(form)
{
	if(form.find('input.error').length) {
		return false;
	}
	if(form.find('input.required').length) {
		return false;
	}
	return true;
}



/**
 * Plugin
 */
$.widget('daris.validate', {
	options: {
		required: false,
		length: {
			enabled: false,
			message: 'Nombre de caractères invalides',
			minLength: undefined,
			maxLength: undefined
		},
		bound: {
			enabled: false,
			message: 'Invalide',
			minValue: undefined,
			maxValue: undefined
		},
		email: {
			enabled: false,
			message: 'Doit être un email'
		},
		password: {
			enabled: false,
			message: 'Différent',
			equalsTo: undefined
		}
	},
	

	_create: function()
	{
		// Création du tooltip
		var tooltip = $('<div>')
			.addClass('input-error-tooltip')
			.hide();
		this.element.after(tooltip);
		this.tooltip = this.element.next();
		
		// Si on vérifie les inputs pour un mot de passe, créer le tooltip de l'input de confirmation
		this.pwdConfirm_input = $(this.options.password.equalsTo);
		this.pwdConfirm_input.after(tooltip);
		this.pwdConfirm_tooltip = this.pwdConfirm_input.next();
		
		// Traitement champs requis
		if(this.options.required) {
			this.element.addClass('required');
			
			if(this.options.password.enabled) {
				this.pwdConfirm_input.addClass('required');
			}
			
			// Requis <=> length > 1 
			if(!this.options.length.minLength == undefined) {
				this.options.length.enabled = true;
				this.options.length.message = 'Ce champs est requis';
				this.options.length.minLength = 1;
			}
		}
		
		// Activer les vérifications
		var value = this.element.val();
		
		if(this.options.email.enabled) {
			if(value.length > 0) 
				this._checkEmail();
			
			this._on(this.element, {
	            change: function () {
	            	this._checkEmail();
	            }
			});
		}
		
		if(this.options.length.enabled) {
			if(value.length > 0)
				this._checkLength();
			
			this._on(this.element, {
	            change: function () {
	            	this._checkLength();
	            }
			});
		}
		
		if(this.options.password.enabled) 	this._checkPassword();
	},
	
	
	_checkPassword: function()
	{
		var pwd1_val = this.element.val();
		var pwd2_val = this.pwdConfirm_input.val();
		
		this._on(this.element, {
            change: function () {
           		pwd1_val = this.element.val();

				if(pwd1_val ===  pwd2_val) {
					this._removeError(this.element, this.tooltip, 'password');
					this._removeError(this.pwdConfirm_input, this.pwdConfirm_tooltip, 'password');
				}
				else {
					this._addError(this.element, this.tooltip, 'password', this.options.password.message);
					this._addError(this.pwdConfirm_input, this.pwdConfirm_tooltip, 'password', this.options.password.message);
				}
            }
		});
		this._on(this.pwdConfirm_input, {
            change: function () {
            	pwd2_val = this.pwdConfirm_input.val();
            	
				if(pwd1_val ===  pwd2_val) {
					this._removeError(this.element, this.tooltip, 'password');
					this._removeError(this.pwdConfirm_input, this.pwdConfirm_tooltip, 'password');
				}
				else {
					this._addError(this.element, this.tooltip, 'password', this.options.password.message);
					this._addError(this.pwdConfirm_input, this.pwdConfirm_tooltip, 'password', this.options.password.message);
				}
			}
		});
	},
	
	
	_checkEmail: function()
	{
		var value = this.element.val();
		var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		
		if(regex.test(value)) {
			this._removeError(this.element, this.tooltip, 'email');
		}
		else {
			this._addError(this.element, this.tooltip, 'email', this.options.email.message);
		}
	},
	
	
	_checkLength: function()
	{
    	var value = this.element.val();

    	if(this.options.length.minLength && value.length < this.options.length.minLength) {
    		this._addError(this.element, this.tooltip, 'length', this.options.length.message);
    	}
    	else if(this.options.length.maxLength && value.length > this.options.length.maxLength) {
    		this._addError(this.element, this.tooltip, 'length', this.options.length.message);
    	}
    	else {
    		this._removeError(this.element, this.tooltip, 'length');
    	}
	
	},
	
	/**
	 * @input 	Input ne contenant plus l'erreur de type @type
	 * @tooltip Tooltip associé
	 * @type 	Designe le type de confirmation (length, password, email, ect...)
	 * 			Ce qui permet, à un même tooltip, de contenir plusieurs messages que 
	 * 			l'on pourra ainsi identifier pour les supprimer/ajouter indépendament
	 */
	_removeError: function(input, tooltip, type)
	{
		// On supprimer le message correspondant à @type
		tooltip.children('.' + type).remove();
		
		// Si il n'y a plus de message alors l'input est valide
		if(tooltip.children().length == 0) {
			input
				.unbind('mouseenter mouseleave')
				.removeClass('error')
				.removeClass('required')
				.removeClass('validate-invalid')
				.addClass('valid');
			tooltip
				.hide();
		}
	},
	

	/**
	 * @input 	Input contenant l'erreur de type @type
	 * @tooltip Tooltip associé
	 * @type 	Designe le type de confirmation (length, password, email, ect...)
	 * 			Ce qui permet, à un même tooltip, de contenir plusieurs messages que 
	 * 			l'on pourra ainsi identifier pour les supprimer/ajouter indépendament
	 * @message	Message à ajouter au tooltip. Sera contenu dans un element identifié
	 * 			par @type afin de pouvoir être manipuler indépendament des autres
	 */
	_addError: function(input, tooltip, type, message)
	{
		// Si le message n'existe pas, l'ajouter
		if(tooltip.find('.' + type).length == 0) {
			tooltip.append('<div class="' + type + '">' + message + '</div>');
		}
		
		input
			.removeClass('valid')
			.removeClass('required')
			.addClass('error')
			.addClass('validate-invalid')
			.hover(
				function() {tooltip.fadeIn('fast');},
				function() {tooltip.fadeOut();}
			);
	},
});
	