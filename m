Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntarh-0007LM-Bi
	for mharc-qemu-riscv@gnu.org; Tue, 24 May 2022 16:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntarN-0007DL-Sk
 for qemu-riscv@nongnu.org; Tue, 24 May 2022 16:10:45 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ntarJ-0002ZC-OF
 for qemu-riscv@nongnu.org; Tue, 24 May 2022 16:10:28 -0400
Received: by mail-ej1-x62d.google.com with SMTP id ck4so33278469ejb.8
 for <qemu-riscv@nongnu.org>; Tue, 24 May 2022 13:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lnpx2w6hgRjk2fSwfipIkCFa5m7JWfQ2A6xJnvD2FYw=;
 b=Yh5qA4u7s7/0c8tiYPea2gVhZ/hXkInrncZvAup4skkOQV3FP6I5K8OQusF44Odw0T
 Int6U79Q2OBrYagr3ufumwESc38LguuVD8LKjFgZrKuLVM1Tm+OWG+5WkrH6vbBUOdeG
 WQwyvbAQuJHI1S88A6nctejayNbbeHV4HuqrfxznKwpFIigCQCngQnwVvbHFp3gR+HcJ
 6maoSp2xfOrHx9ENXlxPWWW4YbBa1ksZ4hDPOsK261or1gXb+reD/90HZPRcTRCwvv0P
 Uwt4EN+9HolV8B1Amu96Xyazm1DjsU4uf+bsJ7Ks7y4JetBmu2oVm9wewBOT2yWpb38z
 l4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lnpx2w6hgRjk2fSwfipIkCFa5m7JWfQ2A6xJnvD2FYw=;
 b=zdV7ok1a4eCz/5yKcY7O1/Stf1Dn6EDg3rRtjfMYHQRjQ6mMrmoK0ifngFAfOnbsyw
 sQLnZSVeasCp890NKr+cMTf+Po2wbH1r9vec1rqQqnR/H5ogi3BhqKZ3sl2OxSKePAke
 C3PDZKuHpmxjn4YhAQFxlhnz+8+oVNyccmmehrRAFuIsFMrErwV8EomPi64YaiZsiXvq
 y7fTym0AFULcro9xbQY94Z3wok6wny8YfUj8o6xj4wJDgzD5R7SrfVR/UmJeZ9ivDyZ2
 hoVVkuF6Uq1Vn2/PHNiKuMSdwnT5e1FkUTpu31tJwFCEkIEbGjYZu/GTVT+9IbA+9ED4
 A1Qw==
X-Gm-Message-State: AOAM533YT++bklfEbcdBdmH/dM97VMydOljXHw1FE9htU1sd8NEGP4+e
 lxxkk/CqeezJsY+3QhF47+azcXJ69QioKPMOqxdFTg==
X-Google-Smtp-Source: ABdhPJzYUff9q4FxBVc99bOobp9isNlHAMoZezDv6w/G4iGtQmyfziB6CtYqVtbb5VojbXBxgiX8sSXIO3I4vuqPFxU=
X-Received: by 2002:a17:907:7248:b0:6fe:a121:d060 with SMTP id
 ds8-20020a170907724800b006fea121d060mr22595069ejc.9.1653423024481; Tue, 24
 May 2022 13:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-15-damien.hedde@greensocs.com>
 <5eadd17a-9fb4-4a0a-2608-c2ca08b18645@gmail.com>
In-Reply-To: <5eadd17a-9fb4-4a0a-2608-c2ca08b18645@gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Wed, 25 May 2022 04:10:11 +0800
Message-ID: <CALw707oqr+aYHo0BScJffcsSA7=wLdkDb2iXVVNEh-ghkxeDmQ@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] hw: set user_creatable on opentitan/sifive_e
 devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Cc: Damien Hedde <damien.hedde@greensocs.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 mark.burton@greensocs.com, edgari@xilinx.com, 
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:OpenTitan" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: multipart/alternative; boundary="00000000000009ca3905dfc78c55"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 24 May 2022 20:10:47 -0000

--00000000000009ca3905dfc78c55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Jim Shu <jim.shu@sifive.com>

On Fri, Mar 4, 2022 at 11:23 PM Philippe Mathieu-Daud=C3=A9 <
philippe.mathieu.daude@gmail.com> wrote:

> On 23/2/22 10:07, Damien Hedde wrote:
> > The devices are:
> > + ibex-timer
> > + ibex-uart
> > + riscv.aclint.swi
> > + riscv.aclint.mtimer
> > + riscv.hart_array
> > + riscv.sifive.e.prci
> > + riscv.sifive.plic
> > + riscv.sifive.uart
> > + sifive_soc.gpio
> > + unimplemented-device
> >
> > These devices are clean regarding error handling in realize.
> >
> > They are all sysbus devices, so setting user-creatable will only
> > enable cold-plugging them on machine having explicitely allowed them
> > (only _none_ machine does that).
> >
> > Note that this commit include the ricv_array which embeds cpus. There
>
> Typo "includes" I guess.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> > are some deep internal constraints about them: you cannot create more
> > cpus than the machine's maxcpus. TCG accelerator's code will for exampl=
e
> > assert if a user try to create too many cpus.
> >
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > ---
> >
> > I can also split this patch if you think it's better.
> > But it is mostly a one-line fix per file.
> >
> > This patch requires first some cleanups in order to fix error errors
> > and some more memory leaks that could happend in legit user-related
> > life cycles: a miss-configuration should not be a fatal error anymore.
> >
> https://lore.kernel.org/qemu-devel/20220218164646.132112-1-damien.hedde@g=
reensocs.com
> > ---
> >   hw/char/ibex_uart.c     | 1 +
> >   hw/char/sifive_uart.c   | 1 +
> >   hw/gpio/sifive_gpio.c   | 1 +
> >   hw/intc/riscv_aclint.c  | 2 ++
> >   hw/intc/sifive_plic.c   | 1 +
> >   hw/misc/sifive_e_prci.c | 8 ++++++++
> >   hw/misc/unimp.c         | 1 +
> >   hw/riscv/riscv_hart.c   | 1 +
> >   hw/timer/ibex_timer.c   | 1 +
> >   9 files changed, 17 insertions(+)
>
>

--00000000000009ca3905dfc78c55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Jim Shu &lt;<a href=3D"mailto:jim.shu@sifive.co=
m" target=3D"_blank">jim.shu@sifive.com</a>&gt;<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 4, 2022 at 1=
1:23 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philippe.mathieu.=
daude@gmail.com" target=3D"_blank">philippe.mathieu.daude@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 23/2/=
22 10:07, Damien Hedde wrote:<br>
&gt; The devices are:<br>
&gt; + ibex-timer<br>
&gt; + ibex-uart<br>
&gt; + riscv.aclint.swi<br>
&gt; + riscv.aclint.mtimer<br>
&gt; + riscv.hart_array<br>
&gt; + riscv.sifive.e.prci<br>
&gt; + riscv.sifive.plic<br>
&gt; + riscv.sifive.uart<br>
&gt; + sifive_soc.gpio<br>
&gt; + unimplemented-device<br>
&gt; <br>
&gt; These devices are clean regarding error handling in realize.<br>
&gt; <br>
&gt; They are all sysbus devices, so setting user-creatable will only<br>
&gt; enable cold-plugging them on machine having explicitely allowed them<b=
r>
&gt; (only _none_ machine does that).<br>
&gt; <br>
&gt; Note that this commit include the ricv_array which embeds cpus. There<=
br>
<br>
Typo &quot;includes&quot; I guess.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
&gt; are some deep internal constraints about them: you cannot create more<=
br>
&gt; cpus than the machine&#39;s maxcpus. TCG accelerator&#39;s code will f=
or example<br>
&gt; assert if a user try to create too many cpus.<br>
&gt; <br>
&gt; Signed-off-by: Damien Hedde &lt;<a href=3D"mailto:damien.hedde@greenso=
cs.com" target=3D"_blank">damien.hedde@greensocs.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; I can also split this patch if you think it&#39;s better.<br>
&gt; But it is mostly a one-line fix per file.<br>
&gt; <br>
&gt; This patch requires first some cleanups in order to fix error errors<b=
r>
&gt; and some more memory leaks that could happend in legit user-related<br=
>
&gt; life cycles: a miss-configuration should not be a fatal error anymore.=
<br>
&gt; <a href=3D"https://lore.kernel.org/qemu-devel/20220218164646.132112-1-=
damien.hedde@greensocs.com" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/qemu-devel/20220218164646.132112-1-damien.hedde@greensocs.com=
</a><br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/char/ibex_uart.c=C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0hw/char/sifive_uart.c=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0hw/gpio/sifive_gpio.c=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0hw/intc/riscv_aclint.c=C2=A0 | 2 ++<br>
&gt;=C2=A0 =C2=A0hw/intc/sifive_plic.c=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0hw/misc/sifive_e_prci.c | 8 ++++++++<br>
&gt;=C2=A0 =C2=A0hw/misc/unimp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0hw/riscv/riscv_hart.c=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0hw/timer/ibex_timer.c=C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A09 files changed, 17 insertions(+)<br>
<br>
</blockquote></div>

--00000000000009ca3905dfc78c55--

