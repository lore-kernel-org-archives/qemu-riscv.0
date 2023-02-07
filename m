Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPF7C-0000sC-7j
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 22:57:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pPF7B-0000rx-DK; Mon, 06 Feb 2023 22:57:53 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pPF79-0001Ti-PJ; Mon, 06 Feb 2023 22:57:53 -0500
Received: by mail-ej1-x62e.google.com with SMTP id hx15so39890446ejc.11;
 Mon, 06 Feb 2023 19:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1QGUszpJeXC9WE0yY4G0muVa8oTrHmvKxcFmZwhzfA=;
 b=plzMNCMCnYmzJ7ia2HuhtvNd2iH+LDWLNVtWpXc7mKjOhpOZNZccbpRLDIme/Fk2/K
 maXqaOD/IvnsjbS0gTjKzfVBWg/qIAapAyRL4cu6009eALlTRWzH56b7GllvnREW1DJw
 s+XIGHEiLWwAieHsUHbH7UlP8GTMqE2inTPE/lrfb9p9WhMHiiekpYoequJUwba6iswL
 V8tniELiAJ8iCkB0njQ24eVWiqaKSDt6siRCrNWkIFHBusB2Bzr6SepOyKJzfX/MJTwh
 HeoS0NNFmOEb98PPba1UfOKCXKPDdAFtmLrwCdpwotfdCpiLN43nFAwWUEjm28Moqct+
 Bmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l1QGUszpJeXC9WE0yY4G0muVa8oTrHmvKxcFmZwhzfA=;
 b=U9bf9qi1iy61wHervN8ooavMviT630KEAmI3LOC1RL4Qk5BpjBgF32zd1fnD0HEU4L
 kQkOnZk+V8OeVui4sMNa80J74sdPTQ+xlR/M0z5EwE/IqRaYe7aKAy1BH3SZ232OOsxZ
 8uG2n9USW/NkGXje4+8Jeec9YBj01LWA1MI7KuI5vpcExyRQIdJKfV7hVUTMnrd1EEEF
 mHVwi+Z4QkZJmolY2XSsAOwaJldPmjdye2WqdPizG1g36mOAZ4dYnZgSb4HpEAiCf5Kb
 5RV3Js9pQ1U199Zu+VuC/i4lEOUuWtyfR75tEc6XM0HWXa1NGVIR5hYtLQD1s4GIPhBq
 loTw==
X-Gm-Message-State: AO0yUKVDb1dcd9TZR3t6rRzhrm6lww3IE5jMpesj04xvMx5uq1vhDOsR
 Z4rW8/JxKh2XiySAd7aRQPcp7WVzWkhs+KwCW14=
X-Google-Smtp-Source: AK7set/iagUxUvxNDlCBO81qsSjDh0LlQCZQUoeHEA2+kxeveL9+4Ld6SF7BwxwQC9PSZqFnpgLkzT5caM8oVkdkxmY=
X-Received: by 2002:a17:906:7816:b0:888:f761:87aa with SMTP id
 u22-20020a170906781600b00888f76187aamr503913ejm.163.1675742261081; Mon, 06
 Feb 2023 19:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230206123520.feomnevavp4olbie@orel>
In-Reply-To: <20230206123520.feomnevavp4olbie@orel>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 7 Feb 2023 11:57:29 +0800
Message-ID: <CAEUhbmUDuH47SFyvHRzB6ZD_Ofs0DZpQDCpcyVELZgF+cTat9g@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Andrea Bolognani <abologna@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 07 Feb 2023 03:57:53 -0000

On Mon, Feb 6, 2023 at 8:36 PM Andrew Jones <ajones@ventanamicro.com> wrote=
:
>
> On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > On 6/2/23 11:54, Andrea Bolognani wrote:
> > > On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
> > > > +    object_class_property_add(oc, "acpi", "OnOffAuto",
> > > > +                              virt_get_acpi, virt_set_acpi,
> > > > +                              NULL, NULL);
> > > > +    object_class_property_set_description(oc, "acpi",
> > > > +                                          "Enable ACPI");
> > >
> > > The way this works on other architectures (x86_64, aarch64) is that
> > > you get ACPI by default and can use -no-acpi to disable it if
> > > desired. Can we have the same on RISC-V, for consistency?
>
> Default on, with a user control to turn off, can be done with a boolean.
> I'm not sure why/if Auto is needed for acpi. Auto is useful when a
> configuration doesn't support a default setting for a feature. If the
> user hasn't explicitly requested the feature to be on or off, then the
> configuration can silently select what works. If, however, the user
> explicitly chooses what doesn't work, then qemu will fail with an error
> instead.

I have a confusion about "OnOffAuto" vs. "bool" type.

Both "OnOffAuto" vs. "bool" type property can have a default value if
user does not assign a value to it from command line. The default
value is:

- ON_OFF_AUTO_AUTO for "OnOffAuto"
- false for "bool"

But the default value can be overridden in the machine's init
function, like in this patch.

So I am not really sure how these 2 types of properties are different.
Why did we introduce a "OnOffAuto" type, and how is that type supposed
to be used in which scenario?

>
> >
> > -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
> > has a high maintenance cost / burden.
> >
> > If hardware provides ACPI support, QEMU should expose it to the guest.
> >
> > Actually, what is the value added by '-no-acpi'?
>
> IIRC, when booting, at least arm guests, with edk2 and ACPI tables,
> then edk2 will provide the guest ACPI tables instead of DT. To ensure
> we can boot with edk2, but still allow the guest to boot with DT, we
> need a way to disable the generation of ACPI tables.
>

Regards,
Bin

