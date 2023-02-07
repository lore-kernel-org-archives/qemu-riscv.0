Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPKzm-00015N-Jb
	for mharc-qemu-riscv@gnu.org; Tue, 07 Feb 2023 05:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pPKzj-0000oz-JI
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 05:14:35 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pPKzh-00048t-LD
 for qemu-riscv@nongnu.org; Tue, 07 Feb 2023 05:14:35 -0500
Received: by mail-ej1-x629.google.com with SMTP id hx15so41751302ejc.11
 for <qemu-riscv@nongnu.org>; Tue, 07 Feb 2023 02:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3pjjceatJIncK2q3ah92DQJl3vhq+A75Q98cBXvH02Q=;
 b=n195x277FZQjIaMhV6fyovqna5rG13y13EOuyBGtUzIdWkpFr9Yysp6veQT5GqjMwG
 KBKnKHnBeYXiAw9gkeY102lCzEzZPopjq0KsQ6RkY38BDefGcQbWKmNex+fMitTTno6b
 SjoiIsqgGJn6HBgxnl2cZj3XL9C/p6iGOsXYAZGnUxngFO+5WOteNxZVLbrGHFyqT6BB
 ggC0u4vocy1Widq0NOx2I8DFrjhzGChwrylghpepnNWvNSlfgXWAKiRqWUDDwtEL8FlU
 Kq7SFGZ7e4ImCkWgLrNCHw4rF4K66PEJWo5XJkhx22hLP0S6sRZJb9uKrr2d0d/UF9Ca
 di7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3pjjceatJIncK2q3ah92DQJl3vhq+A75Q98cBXvH02Q=;
 b=tGe/DfMUeDLudpXbDLOZBcMEK+vgoqru0cLJeQxC0SxxpkbDYz7LIH6tWNHuGOhvsU
 mI9CDnCyHNTTGdS+KkVpNnnyBM+E0fIM5dShW2OOdiPvG+/g/A4HfYK+lJbBEW5mGMKs
 QPxkoNHd0stvap3loqFlmFkJxTvInroGNXvoB6HK4HGVkZq/rXdpvB/7oa4olTjyUl/W
 58fW4ULw2Jaxgj8+20bQICPpdp2NeJ3ykoCUkmYMolkQtRAv7/8wnunw+IYbhEiAl02D
 cmGuRL5Hz6nBN3K1OnivYSpbXOFJZRhRfEFAAzxZEM+rsDQLGEtQvaSCIpASvnaVBjn8
 +xUg==
X-Gm-Message-State: AO0yUKV+J81YZXqVPFX7/ir/qpQfE3Vr5oSHMuuevsQFKc2Tva0XmfDU
 TtrRSgwqcSsAftQeHtOTDsUPaA==
X-Google-Smtp-Source: AK7set/r9IELqpnQW1KkJye6qYWkBD7VVkl+5TvzGXQzAv1qaLHaS0GnuffYm0gs6T5gYieevzoFsw==
X-Received: by 2002:a17:906:4344:b0:7c0:d609:6f9b with SMTP id
 z4-20020a170906434400b007c0d6096f9bmr2565018ejm.27.1675764872093; 
 Tue, 07 Feb 2023 02:14:32 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a1709066dc200b008787e94c5ccsm6628331ejt.184.2023.02.07.02.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 02:14:31 -0800 (PST)
Date: Tue, 7 Feb 2023 11:14:30 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Message-ID: <20230207101430.k3asm7s3f6gz54i4@orel>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230206125610.nmo2bbbd5kosihav@sirius.home.kraxel.org>
 <25504aa3-20e3-d7e6-4111-c956370949ba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25504aa3-20e3-d7e6-4111-c956370949ba@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 07 Feb 2023 10:14:36 -0000

On Tue, Feb 07, 2023 at 09:50:29AM +0100, Philippe Mathieu-Daudé wrote:
> On 6/2/23 13:56, Gerd Hoffmann wrote:
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
> > > 
> > > -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
> > > has a high maintenance cost / burden.
> > 
> > Under the hood it is actually a OnOffAuto machine property and -no-acpi
> > is just a shortcut to set that.
> > 
> > > Actually, what is the value added by '-no-acpi'?
> > 
> > On arm(64) the linux kernel can use either device trees or ACPI to find
> > the hardware.  Historical reasons mostly, when the platform started
> > there was no ACPI support.  Also the edk2 firmware uses Device Trees
> > for hardware discovery, likewise for historical reasons.
> > 
> > When ACPI is available for a platform right from the start I see little
> > reason to offer an option to turn it off though ...
> 
> Yeah I concur. There is no point in disabling ACPI on the RISCV virt
> machine IMO.

edk2 will only present DT or ACPI to the guest, not both. However, RISCV
Linux supports both. If we don't offer '-no-acpi' as a way to switch to
DT, then edk2+DT users will need to configure the varstore to select it.
And, since testing needs to be done with both, that varstore change will
need to be added to all the testcases which need DT (or a varstore with
DT already selected will need to be maintained and used by the testsuites)

IMO, the generation of the ACPI tables should be 'on' by default, but then
the, already present, '-no-acpi' command line option should be made
available in order to easily inform edk2 to present DT instead of ACPI.

Thanks,
drew

