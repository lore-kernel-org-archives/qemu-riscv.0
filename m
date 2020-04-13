Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jO1aw-0002we-Mh
	for mharc-qemu-riscv@gnu.org; Mon, 13 Apr 2020 12:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO1at-0002qJ-PT
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 12:05:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO1as-00044A-Jw
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 12:05:55 -0400
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:44994)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO1al-00040d-JZ; Mon, 13 Apr 2020 12:05:47 -0400
Received: by mail-vs1-xe42.google.com with SMTP id z1so1690450vsn.11;
 Mon, 13 Apr 2020 09:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ncPNgMcOBImrfUo6oLIIgskvPlrGH005jpGafkmeKso=;
 b=X5A5CBEGTcxBjzkPGYAp8Golt/lm1O+kzmVFVSO2xiFWQ8W0e08K287qKOmvZH0MEv
 +v5Zfw1QZ8CyS/zUbjCGJXZRcscpN9HWWCzP7hEEu/5lu241WLUV38T2rgFl3ol7Woi7
 cGRlSQpPHzJvnukeaLVfHsTcayOD08Gd/FpyQi7EM1YT4frmhB1CRbv6yX+VYsbs3a8E
 DlMxmtHfc7oj6bZ0uT9fAed32tPKTSt7ZtizKG3kYHt3rah7N3ZK7c4u0IokDPqfjTZD
 9XznXHux2c5LlyBXmW8Q44RV2y44dHljWEyx9p9ZkmtZkUge88Y4MCDr9IFWcuSb5go+
 FdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ncPNgMcOBImrfUo6oLIIgskvPlrGH005jpGafkmeKso=;
 b=q/jCTX6V1pf8TjYqbS2ZALeiz6PwyRRy2BeSj2rh5NjILpUTirHU+dW7fzjoJUT827
 cE+VlVr3jIoMavnwEzydbraClmoAo7HsKVkWQMxQLdpioQAFvwTp36ZJVMec2iYMlaKR
 o4vqbLDA+/LPOCu+QuG8JuNhqopS3zFb54nWGy8fIWSnz/1NmbjgfB/RcnVixa9MfqhX
 OQ4mQiPLd/dwoUspjZqGRAVJVvF12xk4veGObhtVdmGTDpi7YDuTVo9PKHklyrjLnMqr
 Sr8py7uw9oxc1t8jA6APMDmGUjVda7b9t4FXHAKc8IHbBXlr33C0lI814vBsfIq5mh2U
 W4NA==
X-Gm-Message-State: AGi0Pubyl0vmrU8xTWsKwlwXbcexu2kKdivc2PSlM2fWSI0mJDDU0qkl
 gdKqin52UtHCs484X5IaJpjSl4Beg4OBKoHqbug=
X-Google-Smtp-Source: APiQypK1zRZAWrcnnYn09Yv1KKdC6yCqLh5g6wP0SNcLRBE9Fkbg+TZpA8dUd4yc6LCHGvF1YAiNjs2Il2/agKsRyg8=
X-Received: by 2002:a67:26c2:: with SMTP id
 m185mr13061477vsm.180.1586793944785; 
 Mon, 13 Apr 2020 09:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200412224144.12205-1-f4bug@amsat.org>
 <20200412224144.12205-7-f4bug@amsat.org>
In-Reply-To: <20200412224144.12205-7-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 08:57:29 -0700
Message-ID: <CAKmqyKMew7-p7=k3tAQYd94BEB_R+QThQbWKZFm8BMJXe9H3Ww@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 06/23] hw/arm/msf2-soc: Add missing
 error-propagation code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Michael Walle <michael@walle.cc>, "open list:New World" <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
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
X-List-Received-Date: Mon, 13 Apr 2020 16:05:57 -0000

On Sun, Apr 12, 2020 at 3:53 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/msf2-soc.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> index e448b0ab74..7619e71cfa 100644
> --- a/hw/arm/msf2-soc.c
> +++ b/hw/arm/msf2-soc.c
> @@ -93,7 +93,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, E=
rror **errp)
>      MemoryRegion *system_memory =3D get_system_memory();
>
>      memory_region_init_rom(&s->nvm, OBJECT(dev_soc), "MSF2.eNVM", s->env=
m_size,
> -                           &error_fatal);
> +                           &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      /*
>       * On power-on, the eNVM region 0x60000000 is automatically
>       * remapped to the Cortex-M3 processor executable region
> @@ -107,7 +111,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc,=
 Error **errp)
>      memory_region_add_subregion(system_memory, 0, &s->nvm_alias);
>
>      memory_region_init_ram(&s->sram, NULL, "MSF2.eSRAM", s->esram_size,
> -                           &error_fatal);
> +                           &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sr=
am);
>
>      armv7m =3D DEVICE(&s->armv7m);
> @@ -115,7 +123,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc,=
 Error **errp)
>      qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
>      qdev_prop_set_bit(armv7m, "enable-bitband", true);
>      object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memor=
y()),
> -                                     "memory", &error_abort);
> +                                     "memory", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err)=
;
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
> @@ -184,8 +196,12 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc,=
 Error **errp)
>          bus_name =3D g_strdup_printf("spi%d", i);
>          object_property_add_alias(OBJECT(s), bus_name,
>                                    OBJECT(&s->spi[i]), "spi",
> -                                  &error_abort);
> +                                  &err);
>          g_free(bus_name);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>      }
>
>      /* Below devices are not modelled yet. */
> --
> 2.21.1
>
>

