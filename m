Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPGfZ-0006tN-CH
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 00:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pPGfX-0006re-GH
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 00:37:27 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pPGfU-0000mH-Hc
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 00:37:27 -0500
Received: by mail-ej1-x62c.google.com with SMTP id qw12so40386091ejc.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Feb 2023 21:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IXNSAmlt9qLzxgp27xvAti8qNzIPOgfIJtZxyNbs1lg=;
 b=dg5cw+mcwDwW/6Mxq9GmGe2jrlF9ajPaZ+LmXYIaj7ov6NxAcIKoGnMTrthyn6jEGs
 6OapGy6V5N//FqvpvLdFAwnh20FiWDXQoa/FB3NNwdSZG4gFdlRpys0SFrxi01cemB/G
 swlWp9piId4H6lxKq/y0TMY/iKTFeb/ez3itSWSNmlDJ7hQ6RVFJF8JbJMcntRmDR80l
 2ZTGLkN7OMxauEX2TIceGRz6roqmWz0vS3gEZj3ABS2rWNCWRRm5OYHrb/bHFRPd6IQF
 1HZ5W8wCAu0t6r1Upqp0UfyyO8sql0vUJj0DoRYmqkug8/UhLhwRQNpYNJftTScmRCrY
 djgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IXNSAmlt9qLzxgp27xvAti8qNzIPOgfIJtZxyNbs1lg=;
 b=vA+VcyPFtQr7YdGJL70xmQpxfpq/19HHoRY3AM44SBzzw5M7+RQl/EQEXjCXA/cS0b
 FaJ6fgCWSQqyCb/K4gwukugZvpdqp2g61pGSuOiKPBX353I+Nc1hANZXIJ/SVhMfH/B9
 k5wXR3mTRqdj778J7FtRyta99ueJY4f+lBnJ6Cupd2uJB5ZFbupmkGfi52ATlEFqOwqp
 n/9g9cT8kL0EdDj8S/cfG2iTd+xRHh6eiFRN4fuR9FiOAZjPwAhTVF+Z0jpdC9xJEmEl
 C7ePPVuKSdUQ52uBUGFDhhu4ZSFprtKyzYJbI5kKll3LHV56LqL6uvPiArRRQoIhqFOd
 yQXQ==
X-Gm-Message-State: AO0yUKU6hJKgZwyEB88OPIT4HcE3FVe3E/pCMn8rxnmVKPSTfKhyKXyp
 HX8PC7t4gPyvmcokfRAau8EQ8A==
X-Google-Smtp-Source: AK7set/U8v8BIO1+61AZeDbiuUX8twqDQh9Rtobokr+P/vQMolc+nuy4Uax6ZyFpLFFxZ4vzsLC0ww==
X-Received: by 2002:a17:906:6a27:b0:88d:ba89:1833 with SMTP id
 qw39-20020a1709066a2700b0088dba891833mr22340612ejc.4.1675748237935; 
 Mon, 06 Feb 2023 21:37:17 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 lt14-20020a170906fa8e00b00880dbd4b6d7sm6477244ejb.170.2023.02.06.21.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 21:37:17 -0800 (PST)
Date: Tue, 7 Feb 2023 06:37:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Message-ID: <20230207053716.bihsj4uleridnhc6@orel>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230206123520.feomnevavp4olbie@orel>
 <CAEUhbmUDuH47SFyvHRzB6ZD_Ofs0DZpQDCpcyVELZgF+cTat9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEUhbmUDuH47SFyvHRzB6ZD_Ofs0DZpQDCpcyVELZgF+cTat9g@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2023 05:37:27 -0000

On Tue, Feb 07, 2023 at 11:57:29AM +0800, Bin Meng wrote:
> On Mon, Feb 6, 2023 at 8:36 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 6/2/23 11:54, Andrea Bolognani wrote:
> > > > On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
> > > > > +    object_class_property_add(oc, "acpi", "OnOffAuto",
> > > > > +                              virt_get_acpi, virt_set_acpi,
> > > > > +                              NULL, NULL);
> > > > > +    object_class_property_set_description(oc, "acpi",
> > > > > +                                          "Enable ACPI");
> > > >
> > > > The way this works on other architectures (x86_64, aarch64) is that
> > > > you get ACPI by default and can use -no-acpi to disable it if
> > > > desired. Can we have the same on RISC-V, for consistency?
> >
> > Default on, with a user control to turn off, can be done with a boolean.
> > I'm not sure why/if Auto is needed for acpi. Auto is useful when a
> > configuration doesn't support a default setting for a feature. If the
> > user hasn't explicitly requested the feature to be on or off, then the
> > configuration can silently select what works. If, however, the user
> > explicitly chooses what doesn't work, then qemu will fail with an error
> > instead.
> 
> I have a confusion about "OnOffAuto" vs. "bool" type.
> 
> Both "OnOffAuto" vs. "bool" type property can have a default value if
> user does not assign a value to it from command line. The default
> value is:
> 
> - ON_OFF_AUTO_AUTO for "OnOffAuto"
> - false for "bool"
> 
> But the default value can be overridden in the machine's init
> function, like in this patch.
> 
> So I am not really sure how these 2 types of properties are different.
> Why did we introduce a "OnOffAuto" type, and how is that type supposed
> to be used in which scenario?

Auto makes sense for options which have dependencies on other options.
For example, if we have two options, A and B, where A is an Auto and
B is a boolean, then, when A is initialized to AUTO and has a dependency
on B being X, then have the following

	B=X	A=AUTO -> T	(works)
	B=!X	A=AUTO -> F	(works)

(This is the same whether B was set to X by default or explicitly by the
user.)

Now, if the user explicitly sets A, we have

	B=X	A=T		(works)
	B=X	A=F		(works)
	B=!X	A=T		(emit error about B!=X with A=T and fail)
	B=!X	A=F		(works)

We can't have that behavior with A just being a boolean, defaulting to
true, because we don't know if it's true because of the default or
because it was explicitly set

	B=X	A=T		(works, by default or by user)
	B=X	A=F		(works)
	B=!X	A=T		(doesn't work, but if the user didn't
				 select A=T, then we could have silently
				 flipped it to F and continued)
	B=!X	A=F		(works)


IOW, Auto just adds one more bit of info, allowing default vs. user
selection to be determined, which can then be used for different
behaviors.

Back to the "acpi" property, I'm not sure what it depends on that
requires it to be an Auto vs. a boolean.

Thanks,
drew

