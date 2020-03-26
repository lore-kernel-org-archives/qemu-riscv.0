Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHclx-0006RH-7J
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 20:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jHbJP-00072D-7E
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 18:49:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jHbJL-0007Fh-GF
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 18:49:17 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54679)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jHbJ7-000774-Qy; Thu, 26 Mar 2020 18:49:02 -0400
Received: by mail-wm1-x344.google.com with SMTP id c81so9318427wmd.4;
 Thu, 26 Mar 2020 15:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d1d7pdG/nXLLpqwfmCuYhtfvjUUGRAqtNLtV1+7kQ+s=;
 b=M3YGJ5bY+JzuA1Zw18qApXpuiNBxtk0YOtCdYXLJJMv4ZzFlwDVvR6nNvYfugwCfVk
 eJlg6+cwMP1obO9zmbX8Mu4wW2s2MXFa27IzUxpA+Ccvjfhzw8Jg0z/GJleOi303RNC5
 RH8V4xpAAKib2KkIwj48sJK5BocSKGsF4RnC+shr2+3VWT4wDpxG5DShdGFCngwcXPKW
 Ak2tBDxBGCIr2SCZNfAPc6SoSGXFHDn8h2bod/TBtS6gpuc6Q/vl616+sEdQgVwFTheh
 0+rUk1V8OsDihv1of4qP/DIiLDAuKeWbdM6BPNvMCCqoC5Y0/NOUR7FRk6ZA0cLYLmmx
 FDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d1d7pdG/nXLLpqwfmCuYhtfvjUUGRAqtNLtV1+7kQ+s=;
 b=P0slEU/2TbNNVBx2e42cwDPHWmxBny+liWB3QimyKU81TF1qZnG9GUyFLJI5rw1FTt
 50JB12XxtXJfzVZLLbx7M4Fbwk2EcYU/f25UDy1DI9cwC5CfIlUq5F1wIAYuGjozbREG
 uYVndNQ8zFquVWCt79kdMBvglbJRAsU3/p5teRoGjM+n5laxJefRW27pPmcmiTS8t+YA
 GFvex9Ntt8B9DnPZT344uYmLhNiumJrSoJa2Qlc3L8Dhtu+iS1KHL84alrAT4bFA3++h
 b32E95V/h/e50x8aSYdLjlSkE97xOHVyHQXnLBB71UtrWTwwWH8HTNUMj1A0102YVWMT
 vlvg==
X-Gm-Message-State: ANhLgQ2dYHLGvTum5FLrsNmBZXOgaZajjcG/VBn7PSY9HJOEyMqLOic7
 grLC6iYTytVEt06O6LMPYSgACYUH/IhxaXWHvPY=
X-Google-Smtp-Source: ADFU+vuj/RGdzwi0v+5F2iuSe0OUNVguGAf4BgcJchGig3QZU98SreJT4dat8e6++uR6esUB/62MjuX4kRw3/k351NA=
X-Received: by 2002:a1c:f407:: with SMTP id z7mr2188779wma.36.1585262940330;
 Thu, 26 Mar 2020 15:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-8-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-8-f4bug@amsat.org>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Fri, 27 Mar 2020 00:48:44 +0200
Message-ID: <CAHiYmc7_WVkDRWvF8+H3zBrPen6OfTxrOEjjG4dT_PAOJiiM_g@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 07/12] hw/mips/cps: Add missing error-propagation
 code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Paul Burton <pburton@wavecomp.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, 
 Jason Wang <jasowang@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Richard Henderson <rth@twiddle.net>, Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006f22f805a1c9cac4"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-Mailman-Approved-At: Thu, 26 Mar 2020 20:22:49 -0400
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
X-List-Received-Date: Thu, 26 Mar 2020 22:49:21 -0000

--0000000000006f22f805a1c9cac4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

21:18 Sre, 25.03.2020. Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =D1=98=
=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> Patch created mechanically by running:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file
scripts/coccinelle/object_property_missing_error_propagate.cocci \
>     --keep-comments --smpl-spacing --in-place --dir hw
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/mips/cps.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index 92b9b1a5f6..d682633401 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -68,100 +68,152 @@ static bool cpu_mips_itu_supported(CPUMIPSState
*env)
>  static void mips_cps_realize(DeviceState *dev, Error **errp)
>  {
>      MIPSCPSState *s =3D MIPS_CPS(dev);
>      CPUMIPSState *env;
>      MIPSCPU *cpu;
>      int i;
>      Error *err =3D NULL;
>      target_ulong gcr_base;
>      bool itu_present =3D false;
>      bool saar_present =3D false;
>
>      for (i =3D 0; i < s->num_vp; i++) {
>          cpu =3D MIPS_CPU(cpu_create(s->cpu_type));
>
>          /* Init internal devices */
>          cpu_mips_irq_init_cpu(cpu);
>          cpu_mips_clock_init(cpu);
>
>          env =3D &cpu->env;
>          if (cpu_mips_itu_supported(env)) {
>              itu_present =3D true;
>              /* Attach ITC Tag to the VP */
>              env->itc_tag =3D mips_itu_get_tag_region(&s->itu);
>              env->itu =3D &s->itu;
>          }
>          qemu_register_reset(main_cpu_reset, cpu);
>      }
>
>      cpu =3D MIPS_CPU(first_cpu);
>      env =3D &cpu->env;
>      saar_present =3D (bool)env->saarp;
>
>      /* Inter-Thread Communication Unit */
>      if (itu_present) {
>          sysbus_init_child_obj(OBJECT(dev), "itu", &s->itu,
sizeof(s->itu),
>                                TYPE_MIPS_ITU);
>          object_property_set_int(OBJECT(&s->itu), 16, "num-fifo", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_int(OBJECT(&s->itu), 16, "num-semaphores",
&err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          object_property_set_bool(OBJECT(&s->itu), saar_present,
"saar-present",
>                                   &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          if (saar_present) {
>              s->itu.saar =3D &env->CP0_SAAR;
>          }
>          object_property_set_bool(OBJECT(&s->itu), true, "realized",
&err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
>          if (err !=3D NULL) {
>              error_propagate(errp, err);
>              return;
>          }
>
>          memory_region_add_subregion(&s->container, 0,
>
sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->itu), 0));
>      }
>
>      /* Cluster Power Controller */
>      sysbus_init_child_obj(OBJECT(dev), "cpc", &s->cpc, sizeof(s->cpc),
>                            TYPE_MIPS_CPC);
>      object_property_set_int(OBJECT(&s->cpc), s->num_vp, "num-vp", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_int(OBJECT(&s->cpc), 1, "vp-start-running",
&err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->cpc), true, "realized", &err);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>
>      memory_region_add_subregion(&s->container, 0,
>
 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cpc), 0));
>
>      /* Global Interrupt Controller */
>      sysbus_init_child_obj(OBJECT(dev), "gic", &s->gic, sizeof(s->gic),
>                            TYPE_MIPS_GIC);
>      object_property_set_int(OBJECT(&s->gic), s->num_vp, "num-vp", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_int(OBJECT(&s->gic), 128, "num-irq", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->gic), true, "realized", &err);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>
>      memory_region_add_subregion(&s->container, 0,
>
 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gic), 0));
>
>      /* Global Configuration Registers */
>      gcr_base =3D env->CP0_CMGCRBase << 4;
>
>      sysbus_init_child_obj(OBJECT(dev), "gcr", &s->gcr, sizeof(s->gcr),
>                            TYPE_MIPS_GCR);
>      object_property_set_int(OBJECT(&s->gcr), s->num_vp, "num-vp", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_int(OBJECT(&s->gcr), 0x800, "gcr-rev", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_int(OBJECT(&s->gcr), gcr_base, "gcr-base", &err)=
;
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->gic.mr), "gic",
&err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_link(OBJECT(&s->gcr), OBJECT(&s->cpc.mr), "cpc",
&err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->gcr), true, "realized", &err);
>      if (err !=3D NULL) {
>          error_propagate(errp, err);
>          return;
>      }
>
>      memory_region_add_subregion(&s->container, gcr_base,
>
 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gcr), 0));
>  }
> --
> 2.21.1
>

If you remove the duplicate check that Peter spotted:

Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>

--0000000000006f22f805a1c9cac4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">21:18 Sre, 25.03.2020. Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; =D1=98=D0=B5 =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; Patch created mechanically by running:<br>
&gt;<br>
&gt; =C2=A0 $ spatch \<br>
&gt; =C2=A0 =C2=A0 --macro-file scripts/cocci-macro-file.h --include-header=
s \<br>
&gt; =C2=A0 =C2=A0 --sp-file scripts/coccinelle/object_property_missing_err=
or_propagate.cocci \<br>
&gt; =C2=A0 =C2=A0 --keep-comments --smpl-spacing --in-place --dir hw<br>
&gt;<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug=
@amsat.org">f4bug@amsat.org</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0hw/mips/cps.c | 52 +++++++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt; =C2=A01 file changed, 52 insertions(+)<br>
&gt;<br>
&gt; diff --git a/hw/mips/cps.c b/hw/mips/cps.c<br>
&gt; index 92b9b1a5f6..d682633401 100644<br>
&gt; --- a/hw/mips/cps.c<br>
&gt; +++ b/hw/mips/cps.c<br>
&gt; @@ -68,100 +68,152 @@ static bool cpu_mips_itu_supported(CPUMIPSState =
*env)<br>
&gt; =C2=A0static void mips_cps_realize(DeviceState *dev, Error **errp)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0MIPSCPSState *s =3D MIPS_CPS(dev);<br>
&gt; =C2=A0 =C2=A0 =C2=A0CPUMIPSState *env;<br>
&gt; =C2=A0 =C2=A0 =C2=A0MIPSCPU *cpu;<br>
&gt; =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; =C2=A0 =C2=A0 =C2=A0Error *err =3D NULL;<br>
&gt; =C2=A0 =C2=A0 =C2=A0target_ulong gcr_base;<br>
&gt; =C2=A0 =C2=A0 =C2=A0bool itu_present =3D false;<br>
&gt; =C2=A0 =C2=A0 =C2=A0bool saar_present =3D false;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; s-&gt;num_vp; i++) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu =3D MIPS_CPU(cpu_create(s-&gt;cp=
u_type));<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Init internal devices */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_mips_irq_init_cpu(cpu);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_mips_clock_init(cpu);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D &amp;cpu-&gt;env;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_mips_itu_supported(env)) {<b=
r>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0itu_present =3D true;<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Attach ITC Tag to t=
he VP */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;itc_tag =3D mi=
ps_itu_get_tag_region(&amp;s-&gt;itu);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;itu =3D &amp;s=
-&gt;itu;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_register_reset(main_cpu_reset, =
cpu);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0cpu =3D MIPS_CPU(first_cpu);<br>
&gt; =C2=A0 =C2=A0 =C2=A0env =3D &amp;cpu-&gt;env;<br>
&gt; =C2=A0 =C2=A0 =C2=A0saar_present =3D (bool)env-&gt;saarp;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* Inter-Thread Communication Unit */<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (itu_present) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_init_child_obj(OBJECT(dev), &=
quot;itu&quot;, &amp;s-&gt;itu, sizeof(s-&gt;itu),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_MIPS_ITU);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_property_set_int(OBJECT(&amp;=
s-&gt;itu), 16, &quot;num-fifo&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_property_set_int(OBJECT(&amp;=
s-&gt;itu), 16, &quot;num-semaphores&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_property_set_bool(OBJECT(&amp=
;s-&gt;itu), saar_present, &quot;saar-present&quot;,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (saar_present) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;itu.saar =3D &am=
p;env-&gt;CP0_SAAR;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_property_set_bool(OBJECT(&amp=
;s-&gt;itu), true, &quot;realized&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err !=3D NULL) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, =
err);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(&amp;s-&=
gt;container, 0,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_get_region(SYS_BUS_DEVICE(&amp;s-&g=
t;itu), 0));<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* Cluster Power Controller */<br>
&gt; =C2=A0 =C2=A0 =C2=A0sysbus_init_child_obj(OBJECT(dev), &quot;cpc&quot;=
, &amp;s-&gt;cpc, sizeof(s-&gt;cpc),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_MIPS_CPC);<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_int(OBJECT(&amp;s-&gt;cpc), s-=
&gt;num_vp, &quot;num-vp&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_int(OBJECT(&amp;s-&gt;cpc), 1,=
 &quot;vp-start-running&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_bool(OBJECT(&amp;s-&gt;cpc), t=
rue, &quot;realized&quot;, &amp;err);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (err !=3D NULL) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, err);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(&amp;s-&gt;container, =
0,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_mmio_get_region(SYS_BUS_DEVICE(&am=
p;s-&gt;cpc), 0));<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* Global Interrupt Controller */<br>
&gt; =C2=A0 =C2=A0 =C2=A0sysbus_init_child_obj(OBJECT(dev), &quot;gic&quot;=
, &amp;s-&gt;gic, sizeof(s-&gt;gic),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_MIPS_GIC);<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_int(OBJECT(&amp;s-&gt;gic), s-=
&gt;num_vp, &quot;num-vp&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_int(OBJECT(&amp;s-&gt;gic), 12=
8, &quot;num-irq&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_bool(OBJECT(&amp;s-&gt;gic), t=
rue, &quot;realized&quot;, &amp;err);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (err !=3D NULL) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, err);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(&amp;s-&gt;container, =
0,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_mmio_get_region(SYS_BUS_DEVICE(&am=
p;s-&gt;gic), 0));<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0/* Global Configuration Registers */<br>
&gt; =C2=A0 =C2=A0 =C2=A0gcr_base =3D env-&gt;CP0_CMGCRBase &lt;&lt; 4;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0sysbus_init_child_obj(OBJECT(dev), &quot;gcr&quot;=
, &amp;s-&gt;gcr, sizeof(s-&gt;gcr),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_MIPS_GCR);<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_int(OBJECT(&amp;s-&gt;gcr), s-=
&gt;num_vp, &quot;num-vp&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_int(OBJECT(&amp;s-&gt;gcr), 0x=
800, &quot;gcr-rev&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_int(OBJECT(&amp;s-&gt;gcr), gc=
r_base, &quot;gcr-base&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_link(OBJECT(&amp;s-&gt;gcr), O=
BJECT(&amp;s-&gt;<a href=3D"http://gic.mr">gic.mr</a>), &quot;gic&quot;, &a=
mp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_link(OBJECT(&amp;s-&gt;gcr), O=
BJECT(&amp;s-&gt;<a href=3D"http://cpc.mr">cpc.mr</a>), &quot;cpc&quot;, &a=
mp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_bool(OBJECT(&amp;s-&gt;gcr), t=
rue, &quot;realized&quot;, &amp;err);<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (err !=3D NULL) {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, err);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0memory_region_add_subregion(&amp;s-&gt;container, =
gcr_base,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysbus_mmio_get_region(SYS_BUS_DEVICE(&am=
p;s-&gt;gcr), 0));<br>
&gt; =C2=A0}<br>
&gt; -- <br>
&gt; 2.21.1<br>
&gt;<br></p>
<p dir=3D"ltr">If you remove the duplicate check that Peter spotted:</p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:aleks=
andar.qemu.devel@gmail.com">aleksandar.qemu.devel@gmail.com</a>&gt;</p>

--0000000000006f22f805a1c9cac4--

