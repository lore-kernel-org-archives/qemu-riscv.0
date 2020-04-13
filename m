Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jO7M4-0001Ku-6z
	for mharc-qemu-riscv@gnu.org; Mon, 13 Apr 2020 18:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45237)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7M1-0001EI-2X
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 18:14:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7Lz-0004l0-IQ
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 18:14:57 -0400
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:35817)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7Lk-0004ia-2F; Mon, 13 Apr 2020 18:14:42 -0400
Received: by mail-vs1-xe42.google.com with SMTP id r7so3550196vso.2;
 Mon, 13 Apr 2020 15:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5eB1z8c5kK9kvW0a6iujT6vXRX9S8fGFoN6RJDHnU2g=;
 b=TI0Calf2IxOfsyHK2xiLLnkprfuUQZ3rec4E0Pkows5wNSZzE+kFamJx03TcD8yytM
 +PmQUcTuSLU/Ujb1i8o6P54jgreamUbYltgTg6N8mLPZWQ/+phGZ3MJ/5beryeROv6Wq
 MeVe3ia9ChISGinAPI3RoLam/Ohz1Z2KxvaWL0A+Lv0rWruY1J3gsD24+ETUVUCjZw79
 kOtB3XMkAeKNnOgRFbwVgzZBdYbMxasyFTEUt51C1fESqQPUoGLFEDn2ZJVo9DMFJoVp
 9CLusdX3k8qPVNGNG2biM+CHwoDwc9toaZz3qTyOQv4oP6jwl7FgdO+it01nV0kzIYfl
 q/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5eB1z8c5kK9kvW0a6iujT6vXRX9S8fGFoN6RJDHnU2g=;
 b=f5zRKLB7jWSUZZaSvbCEaP+1b462nZA2CegQR/bcZ9c8iwqKyJWZtXFLrh2S9YTm0E
 lL2XFujgVM1G3DCRCrojIUrzgozpK/ccayRq3LF3z5M+FoaelzBvvrgmUBVxmpnCAkff
 Q2rm0WRBQjgyA3OASCUQS/ev9oi6m6YJRhNmVT5tgrLuPh1TgCVXMtPJjSDd55ql3tRI
 8eh0uuvduLvWB0kxbTXDXGyfF866WQTptybe6LdkelmzFVKnTCkX7D5lXID6D2l5r4XC
 U4YsUtwm0tn+uDJzJLOWOHifocUCYeQM0atd9qsGWL+gQvQqBh6A8vDcgjnK6jfoAVYX
 Tzog==
X-Gm-Message-State: AGi0PuYhU9dTS4e5IRbr8mMKS6cM4sbNOVcvbIYwAW4hkzMoqNdmmPBw
 H6JLeIpQh+lE/PZ5DuHzQ8J+fFGZ/NB5RMSF+e4=
X-Google-Smtp-Source: APiQypLObMJB5KGfvx8eqmUvlJyWtzXJPVcel83Hl2IydFW0aD/us9mAT8+du+g1gFIylr5J/S0ETsQkcTdu9h5BKx4=
X-Received: by 2002:a67:902:: with SMTP id 2mr14851445vsj.133.1586816079263;
 Mon, 13 Apr 2020 15:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-17-f4bug@amsat.org>
In-Reply-To: <20200412223619.11284-17-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:06:22 -0700
Message-ID: <CAKmqyKN=2tkTyPY6d5a_T1Lnd0-m6tFPw2fdes2a0C+_erYXeQ@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 16/24] hw/arm/xlnx-zynqmp: Move some code from
 realize() to init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Wen Congyang <wencongyang2@huawei.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "open list:New World" <qemu-ppc@nongnu.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e42
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Apr 2020 22:14:58 -0000

On Sun, Apr 12, 2020 at 3:41 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Coccinelle failed at processing this file:
>
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/arm/xlnx-zynqmp.c
>   EXN: Coccinelle_modules.Common.Timeout
>
> Move the calls using &error_abort which don't depend on input
> updated before realize() to init().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v3: Typo 'depend of' -> 'depend on' (eblake)
> ---
>  hw/arm/xlnx-zynqmp.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 457057198a..5ec9c24ee7 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -242,6 +242,11 @@ static void xlnx_zynqmp_init(Object *obj)
>                                  &s->apu_cpu[i], sizeof(s->apu_cpu[i]),
>                                  ARM_CPU_TYPE_NAME("cortex-a53"),
>                                  &error_abort, NULL);
> +
> +        object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUI=
T_SMC,
> +                                "psci-conduit", &error_abort);
> +        object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
> +                                "reset-cbar", &error_abort);
>      }
>
>      sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic),
> @@ -250,6 +255,10 @@ static void xlnx_zynqmp_init(Object *obj)
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
>          sysbus_init_child_obj(obj, "gem[*]", &s->gem[i], sizeof(s->gem[i=
]),
>                                TYPE_CADENCE_GEM);
> +        object_property_set_int(OBJECT(&s->gem[i]), GEM_REVISION, "revis=
ion",
> +                                &error_abort);
> +        object_property_set_int(OBJECT(&s->gem[i]), 2, "num-priority-que=
ues",
> +                                &error_abort);
>      }
>
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_UARTS; i++) {
> @@ -259,6 +268,8 @@ static void xlnx_zynqmp_init(Object *obj)
>
>      sysbus_init_child_obj(obj, "sata", &s->sata, sizeof(s->sata),
>                            TYPE_SYSBUS_AHCI);
> +    object_property_set_int(OBJECT(&s->sata), SATA_NUM_PORTS, "num-ports=
",
> +                            &error_abort);
>
>      for (i =3D 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
>          sysbus_init_child_obj(obj, "sdhci[*]", &s->sdhci[i],
> @@ -370,9 +381,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>      for (i =3D 0; i < num_apus; i++) {
>          char *name;
>
> -        object_property_set_int(OBJECT(&s->apu_cpu[i]), QEMU_PSCI_CONDUI=
T_SMC,
> -                                "psci-conduit", &error_abort);
> -
>          name =3D object_get_canonical_path_component(OBJECT(&s->apu_cpu[=
i]));
>          if (strcmp(name, boot_cpu)) {
>              /* Secondary CPUs start in PSCI powered-down state */
> @@ -387,8 +395,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>                                   s->secure, "has_el3", NULL);
>          object_property_set_bool(OBJECT(&s->apu_cpu[i]),
>                                   s->virt, "has_el2", NULL);
> -        object_property_set_int(OBJECT(&s->apu_cpu[i]), GIC_BASE_ADDR,
> -                                "reset-cbar", &error_abort);
>          object_property_set_int(OBJECT(&s->apu_cpu[i]), num_apus,
>                                  "core-count", &error_abort);
>          object_property_set_bool(OBJECT(&s->apu_cpu[i]), true, "realized=
",
> @@ -490,10 +496,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Er=
ror **errp)
>              qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
>              qdev_set_nic_properties(DEVICE(&s->gem[i]), nd);
>          }
> -        object_property_set_int(OBJECT(&s->gem[i]), GEM_REVISION, "revis=
ion",
> -                                &error_abort);
> -        object_property_set_int(OBJECT(&s->gem[i]), 2, "num-priority-que=
ues",
> -                                &error_abort);
>          object_property_set_bool(OBJECT(&s->gem[i]), true, "realized", &=
err);
>          if (err) {
>              goto out_propagate_error;
> @@ -514,8 +516,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>                             gic_spi[uart_intr[i]]);
>      }
>
> -    object_property_set_int(OBJECT(&s->sata), SATA_NUM_PORTS, "num-ports=
",
> -                            &error_abort);
>      object_property_set_bool(OBJECT(&s->sata), true, "realized", &err);
>      if (err) {
>          goto out_propagate_error;
> --
> 2.21.1
>
>

