Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHclv-0006QE-Bq
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 20:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56965)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jHbKQ-0007m8-Hd
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 18:50:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.qemu.devel@gmail.com>) id 1jHbKP-0008MN-5u
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 18:50:22 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55847)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jHbK6-000847-0J; Thu, 26 Mar 2020 18:50:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id z5so9324403wml.5;
 Thu, 26 Mar 2020 15:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PeLCjOaVqeYYwS/IUZfkYsgTPhyxTMuxM5QWmmej0mY=;
 b=CfrFHxNqD4k1UQN/lvHLk8uzW6/Q8aACQq/FomsJwCqc8U+iBZTlbq/h1EGiKvMdNH
 I8okR+sDOnNZqGxovaK6LoL0YvD9QvOdh1ZGYMNfaoI9SARFy0bOmTCGu2Ie5p9SvBtn
 ZZfs9ceUXETCjG7fAgyRNHA9R3KjjIJhcTTYdyh4HQRZVQIQz1sUfhnLDbUCXihH93yA
 22RNx7MFYvSpZjWJIcvEZTpCGfmHZbyXhv8h07sPF6AXAGHWk5zprj8syweaK2rbUKbr
 V5L4ZU+EnzKaqsxz5A02/zzRdj7tDw6Li6d41yQwVVpQcPhe5/OI73t9JftPWbMF8M/N
 GUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PeLCjOaVqeYYwS/IUZfkYsgTPhyxTMuxM5QWmmej0mY=;
 b=ex+CNTz25edqvsdOeaDhNwuX3N0/dWK43IHtUekv48UvMdLWlSI8X8Ky8/Ui73NmkU
 aJtnx24nhnRcgeBziIPWJASnDlwDvsMW3DI9g1PLzV9Dmlzx836wm75aTaHJQe+UUQsd
 LXlHu7vp6AXgVrKGtv/F5OZPJv8F30MqFZkfNmpPZK0BhdTL4Teylbat4uveC/vS2sz0
 mgPK1CIVXPpTWXgaLIVXwoMFT6U8rsuVJrk3clpemqlIOVPW7FkITEsoCypAt5/NGGkw
 Vy7SB8rI9NCOyMuw8UL8bBqABR53vi30Bi4Ice7GO3p76LFGkGeRo02C1upguLmSabXr
 IFwA==
X-Gm-Message-State: ANhLgQ1WRN+C/EYlE1fpnt63+WvuhgGnyUbdiZLaLxoE+WzpdxrI75/N
 LZ5Cx7h1/xvl0q7p9dyg/fS9Jixt4vYRcRul0xs=
X-Google-Smtp-Source: ADFU+vuuOq+i6qxaHiERznmLT0FZw8hmtVyOfq3ZfEqf7wJ4RG0wPYKjipp6/AABlnJS+Z6wVrJDxlRKa6A2o7i6CFQ=
X-Received: by 2002:adf:ba48:: with SMTP id t8mr11602743wrg.329.1585263000764; 
 Thu, 26 Mar 2020 15:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200325191830.16553-1-f4bug@amsat.org>
 <20200325191830.16553-10-f4bug@amsat.org>
In-Reply-To: <20200325191830.16553-10-f4bug@amsat.org>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Fri, 27 Mar 2020 00:49:46 +0200
Message-ID: <CAHiYmc59pEf=-couqAVKcSvCOwOJ2igvcFFWSRVDiDMhZjk36w@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 09/12] hw/mips/mips_malta: Add missing
 error-propagation code
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
Content-Type: multipart/alternative; boundary="00000000000009482e05a1c9ce2b"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::329
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
X-List-Received-Date: Thu, 26 Mar 2020 22:50:25 -0000

--00000000000009482e05a1c9ce2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

21:19 Sre, 25.03.2020. Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =D1=98=
=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> Running the coccinelle script produced:
>
>   $ spatch \
>     --macro-file scripts/cocci-macro-file.h --include-headers \
>     --sp-file
scripts/coccinelle/object_property_missing_error_propagate.cocci \
>     --keep-comments --smpl-spacing --dir hw
>
>   [[manual check required: error_propagate() might be missing in
object_property_set_int() hw/mips/mips_malta.c:1193:4]]
>   [[manual check required: error_propagate() might be missing in
object_property_set_str() hw/mips/mips_malta.c:1192:4]]
>
> Add the missing error_propagate() after manual review by adding
> a Error* parameter to create_cps().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/mips/mips_malta.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> index e4c4de1b4e..8d43cfd41b 100644
> --- a/hw/mips/mips_malta.c
> +++ b/hw/mips/mips_malta.c
> @@ -1183,22 +1183,31 @@ static void create_cpu_without_cps(MachineState
*ms,
>  }
>
>  static void create_cps(MachineState *ms, MaltaState *s,
> -                       qemu_irq *cbus_irq, qemu_irq *i8259_irq)
> +                       qemu_irq *cbus_irq, qemu_irq *i8259_irq,
> +                       Error **errp)
>  {
>      Error *err =3D NULL;
>
>      sysbus_init_child_obj(OBJECT(s), "cps", OBJECT(&s->cps),
sizeof(s->cps),
>                            TYPE_MIPS_CPS);
>      object_property_set_str(OBJECT(&s->cps), ms->cpu_type, "cpu-type",
&err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_int(OBJECT(&s->cps), ms->smp.cpus, "num-vp",
&err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>      object_property_set_bool(OBJECT(&s->cps), true, "realized", &err);
> -    if (err !=3D NULL) {
> -        error_report("%s", error_get_pretty(err));
> -        exit(1);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
>      }
>
>      sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->cps), 0, 0, 1);
>
>      *i8259_irq =3D get_cps_irq(&s->cps, 3);
>      *cbus_irq =3D NULL;
>  }
> @@ -1206,9 +1215,9 @@ static void create_cps(MachineState *ms, MaltaState
*s,
>  static void mips_create_cpu(MachineState *ms, MaltaState *s,
>                              qemu_irq *cbus_irq, qemu_irq *i8259_irq)
>  {
>      if ((ms->smp.cpus > 1) && cpu_supports_cps_smp(ms->cpu_type)) {
> -        create_cps(ms, s, cbus_irq, i8259_irq);
> +        create_cps(ms, s, cbus_irq, i8259_irq, &error_fatal);
>      } else {
>          create_cpu_without_cps(ms, cbus_irq, i8259_irq);
>      }
>  }
> --
> 2.21.1
>

Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>

--00000000000009482e05a1c9ce2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">21:19 Sre, 25.03.2020. Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; =D1=98=D0=B5 =D0=BD=
=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; Running the coccinelle script produced:<br>
&gt;<br>
&gt; =C2=A0 $ spatch \<br>
&gt; =C2=A0 =C2=A0 --macro-file scripts/cocci-macro-file.h --include-header=
s \<br>
&gt; =C2=A0 =C2=A0 --sp-file scripts/coccinelle/object_property_missing_err=
or_propagate.cocci \<br>
&gt; =C2=A0 =C2=A0 --keep-comments --smpl-spacing --dir hw<br>
&gt;<br>
&gt; =C2=A0 [[manual check required: error_propagate() might be missing in =
object_property_set_int() hw/mips/mips_malta.c:1193:4]]<br>
&gt; =C2=A0 [[manual check required: error_propagate() might be missing in =
object_property_set_str() hw/mips/mips_malta.c:1192:4]]<br>
&gt;<br>
&gt; Add the missing error_propagate() after manual review by adding<br>
&gt; a Error* parameter to create_cps().<br>
&gt;<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug=
@amsat.org">f4bug@amsat.org</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0hw/mips/mips_malta.c | 19 ++++++++++++++-----<br>
&gt; =C2=A01 file changed, 14 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c<br>
&gt; index e4c4de1b4e..8d43cfd41b 100644<br>
&gt; --- a/hw/mips/mips_malta.c<br>
&gt; +++ b/hw/mips/mips_malta.c<br>
&gt; @@ -1183,22 +1183,31 @@ static void create_cpu_without_cps(MachineStat=
e *ms,<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; =C2=A0static void create_cps(MachineState *ms, MaltaState *s,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0qemu_irq *cbus_irq, qemu_irq *i8259_irq)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0qemu_irq *cbus_irq, qemu_irq *i8259_irq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0Error **errp)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0Error *err =3D NULL;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0sysbus_init_child_obj(OBJECT(s), &quot;cps&quot;, =
OBJECT(&amp;s-&gt;cps), sizeof(s-&gt;cps),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_MIPS_CPS);<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_str(OBJECT(&amp;s-&gt;cps), ms=
-&gt;cpu_type, &quot;cpu-type&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_int(OBJECT(&amp;s-&gt;cps), ms=
-&gt;smp.cpus, &quot;num-vp&quot;, &amp;err);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; =C2=A0 =C2=A0 =C2=A0object_property_set_bool(OBJECT(&amp;s-&gt;cps), t=
rue, &quot;realized&quot;, &amp;err);<br>
&gt; -=C2=A0 =C2=A0 if (err !=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s&quot;, error_get_pr=
etty(err));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; +=C2=A0 =C2=A0 if (err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&amp;s-&gt;=
cps), 0, 0, 1);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0*i8259_irq =3D get_cps_irq(&amp;s-&gt;cps, 3);<br>
&gt; =C2=A0 =C2=A0 =C2=A0*cbus_irq =3D NULL;<br>
&gt; =C2=A0}<br>
&gt; @@ -1206,9 +1215,9 @@ static void create_cps(MachineState *ms, MaltaSt=
ate *s,<br>
&gt; =C2=A0static void mips_create_cpu(MachineState *ms, MaltaState *s,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_irq *cbus_irq, qemu_irq *i8259_irq)<=
br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0if ((ms-&gt;smp.cpus &gt; 1) &amp;&amp; cpu_suppor=
ts_cps_smp(ms-&gt;cpu_type)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_cps(ms, s, cbus_irq, i8259_irq);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_cps(ms, s, cbus_irq, i8259_irq, &a=
mp;error_fatal);<br>
&gt; =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_cpu_without_cps(ms, cbus_irq,=
 i8259_irq);<br>
&gt; =C2=A0 =C2=A0 =C2=A0}<br>
&gt; =C2=A0}<br>
&gt; -- <br>
&gt; 2.21.1<br>
&gt;</p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:aleks=
andar.qemu.devel@gmail.com">aleksandar.qemu.devel@gmail.com</a>&gt;</p>

--00000000000009482e05a1c9ce2b--

