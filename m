Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13426C7EE29
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 16:56:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7Iw0-0004Zj-VV; Thu, 08 Jun 2023 12:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q7Ivy-0004Ys-OB
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 12:56:26 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1q7Ivw-0000Ei-ON
 for qemu-riscv@nongnu.org; Thu, 08 Jun 2023 12:56:26 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-783f88ce557so324653241.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Jun 2023 09:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1686243383; x=1688835383;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CgJTtYLIn70wb52LsiMk1A1J4Mu0c0WIB/RYop7paxs=;
 b=hrw+/mnq28syfSOQFqJG44WutqBwk/nhNNXerib+h/5DcIpJLvP0BOQORfl534ea+q
 vk68kJPNEgWMCNm+tV7cRZpF+lZ53BlhpiF1o8Apfk27C/FdV+KO08XPE28jGNMA11v7
 NGYvuIU7aAIAqyLa7iShf6Guwk8q5rBLD/ufzHbX00zt9YcOrsT5lJeeFcaVZhI5D9Nv
 B7w1pyCrR//J4g18txP3vjafM5qLfmQLUAtdTDPEtQ8lVZUHuWXKlgTjUo0NHlYRfyTf
 9Tn0uGIeaN3tUsv6IumGMb90f/FEzQ7I1duO3NUNqphKXveUJKmhYmllFNl8CdLx38iJ
 Ul/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686243383; x=1688835383;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CgJTtYLIn70wb52LsiMk1A1J4Mu0c0WIB/RYop7paxs=;
 b=GlAbop4HC3IGoNDw7g7q1GdsUXCCsjNZSD4g/9qF7EAe7cBk4i8LqAY2p0grvuL/9F
 nWshHNGyrOmJTVoGfWyHb5rIzaVMcQ19I1QkXcLNgbPIxUreS673pec5SRs3w4Ruxjsf
 FP5qPNyQzkSdGNkd+iF0eJst4SChghkpUmQG/zr9DVOPvzmcgsmh+0lyubHDuhoXsH/K
 NoyOlcfp3to1HRWtDPLJYi7+yf/r24ZFceZwYLXp+APBgCvOoUZHxQyshiRKhCsemt3l
 vImAmcWczAwKBq+hYt8H353t8IjFhfPVuEmzx6eRBMqNR3V7h+RoA2+ibCURZaZyvCPz
 +zmg==
X-Gm-Message-State: AC+VfDw+ze6Q4C4SfCB4GA1YH6hrW0G8TpoJAysLPk+YUxmsE1mUacC2
 VngBIL7ITzZMXd48r/o/16JqqK0c1y1FZw5Qx3nv+A==
X-Google-Smtp-Source: ACHHUZ4Krc0aaleJUOgqMu8s1BpyzMYUAaMSNXFb9DrIR84CtNxzTzaj8KcarrHBVzdouorzDRYHA0ZBRVIXOWqshYs=
X-Received: by 2002:a67:b905:0:b0:439:3128:587d with SMTP id
 q5-20020a67b905000000b004393128587dmr2271309vsn.28.1686243383492; Thu, 08 Jun
 2023 09:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230523084910.304679-1-tommy.wu@sifive.com>
 <20230523084910.304679-2-tommy.wu@sifive.com>
 <e9ab4620-2878-45c1-264b-305c41958213@linaro.org>
In-Reply-To: <e9ab4620-2878-45c1-264b-305c41958213@linaro.org>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Fri, 9 Jun 2023 00:56:14 +0800
Message-ID: <CANj3q_kX2+XX7L=fJQ9DcOuXv2Ry5yrcfQTxVU662z8a2pk18Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] hw/misc: sifive_e_aon: Support the watchdog timer
 of HiFive 1 rev b.
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com, thuth@redhat.com, liweiwei@iscas.ac.cn
Content-Type: multipart/alternative; boundary="000000000000e0e6a205fda1219a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=tommy.wu@sifive.com; helo=mail-ua1-x933.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000e0e6a205fda1219a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Phil,
Thanks for all the suggestions, I'll send patch v5 to fix all the issues.

Best Regards,
Tommy

On Thu, May 25, 2023 at 8:05=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd=
@linaro.org>
wrote:

> Hi Tommy,
>
> On 23/5/23 10:49, Tommy Wu wrote:
> > The watchdog timer is in the always-on domain device of HiFive 1 rev b,
> > so this patch added the AON device to the sifive_e machine. This patch
> > only implemented the functionality of the watchdog timer.
> >
> > Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> > Reviewed-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >   hw/misc/Kconfig                |   3 +
> >   hw/misc/meson.build            |   1 +
> >   hw/misc/sifive_e_aon.c         | 326 ++++++++++++++++++++++++++++++++=
+
> >   include/hw/misc/sifive_e_aon.h |  60 ++++++
> >   4 files changed, 390 insertions(+)
> >   create mode 100644 hw/misc/sifive_e_aon.c
> >   create mode 100644 include/hw/misc/sifive_e_aon.h
>
>
> > +REG32(AON_WDT_WDOGCFG, 0x0)
> > +    FIELD(AON_WDT_WDOGCFG, SCALE, 0, 4)
> > +    FIELD(AON_WDT_WDOGCFG, RSVD0, 4, 4)
> > +    FIELD(AON_WDT_WDOGCFG, RSTEN, 8, 1)
> > +    FIELD(AON_WDT_WDOGCFG, ZEROCMP, 9, 1)
> > +    FIELD(AON_WDT_WDOGCFG, RSVD1, 10, 2)
> > +    FIELD(AON_WDT_WDOGCFG, EN_ALWAYS, 12, 1)
> > +    FIELD(AON_WDT_WDOGCFG, EN_CORE_AWAKE, 13, 1)
> > +    FIELD(AON_WDT_WDOGCFG, RSVD2, 14, 14)
> > +    FIELD(AON_WDT_WDOGCFG, IP0, 28, 1)
> > +    FIELD(AON_WDT_WDOGCFG, RSVD3, 29, 3)
> > +REG32(AON_WDT_WDOGCOUNT, 0x8)
>
> Adding:
>
>         FIELD(AON_WDT_WDOGCOUNT, VALUE, 0, 31)
>
> ...
>
> > +REG32(AON_WDT_WDOGS, 0x10)
> > +REG32(AON_WDT_WDOGFEED, 0x18)
> > +REG32(AON_WDT_WDOGKEY, 0x1c)
> > +REG32(AON_WDT_WDOGCMP0, 0x20)
> > +
> > +static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)
> > +{
> > +    int64_t now;
> > +    if (0 =3D=3D FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALWAYS) &&
> > +        0 =3D=3D FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE=
)) {
> > +        return;
> > +    }
> > +
> > +    now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +    r->wdogcount +=3D muldiv64(now - r->wdog_restart_time,
> > +                             r->wdogclk_freq, NANOSECONDS_PER_SECOND);
> > +
> > +    /* Clean the most significant bit. */
> > +    r->wdogcount =3D ((r->wdogcount << 1) >> 1);
>
> ... you could use:
>
>         r->wdogcount &=3D R_AON_WDT_WDOGCOUNT_VALUE_MASK
>
> > +    r->wdog_restart_time =3D now;
> > +}
> > +
> > +static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)
> > +{
> > +    uint16_t wdogs;
> > +    bool cmp_signal =3D false;
> > +    sifive_e_aon_wdt_update_wdogcount(r);
> > +    wdogs =3D (uint16_t)(r->wdogcount >>
> > +                           FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG,
> SCALE));
> > +
> > +    if (wdogs >=3D r->wdogcmp0) {
> > +        cmp_signal =3D true;
> > +        if (1 =3D=3D FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, ZEROCMP))=
 {
> > +            r->wdogcount =3D 0;
> > +            wdogs =3D 0;
> > +        }
> > +    }
> > +
> > +    if (cmp_signal) {
> > +        if (1 =3D=3D FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, RSTEN)) {
>
> You sometimes check bit equality, ...
>
> > +            watchdog_perform_action();
> > +        }
> > +        r->wdogcfg =3D FIELD_DP32(r->wdogcfg, AON_WDT_WDOGCFG, IP0, 1)=
;
> > +    }
> > +
> > +    qemu_set_irq(r->wdog_irq, FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG,
> IP0));
> > +
> > +    if (wdogs < r->wdogcmp0 &&
> > +        (FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_ALWAYS) ||
>
> ... sometimes you don't. Code style consistency would be better.
>
> (Also, most of QEMU code base check equality using constant value
> on the right side of the comparaison).
>
> > +         FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, EN_CORE_AWAKE))) {
> > +        int64_t next =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> > +        next +=3D muldiv64((r->wdogcmp0 - wdogs) <<
> > +                         FIELD_EX32(r->wdogcfg, AON_WDT_WDOGCFG, SCALE=
),
> > +                         NANOSECONDS_PER_SECOND, r->wdogclk_freq);
> > +        timer_mod(r->wdog_timer, next);
> > +    } else {
> > +        timer_mod(r->wdog_timer, INT64_MAX);
> > +    }
> > +}
>
> > +static void sifive_e_aon_init(Object *obj)
> > +{
> > +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> > +    SiFiveEAONState *r =3D SIFIVE_E_AON(obj);
> > +
> > +    memory_region_init_io(&r->mmio, OBJECT(r), &sifive_e_aon_ops, r,
> > +                          TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);
> > +    sysbus_init_mmio(sbd, &r->mmio);
> > +
> > +    /* watchdog timer */
> > +    r->wdogclk_freq =3D SIFIVE_E_LFCLK_DEFAULT_FREQ;
> > +    sysbus_init_irq(sbd, &r->wdog_irq);
> > +}
> > +
> > +static void sifive_e_aon_realize(DeviceState *dev, Error **errp)
> > +{
> > +    SiFiveEAONState *r =3D SIFIVE_E_AON(dev);
> > +
> > +    /* watchdog timer */
> > +    r->wdog_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > +                                 sifive_e_aon_wdt_expired_cb, r);
>
> You should be able to create the timer in sifive_e_aon_init().
>
> > +}
>
> Regards,
>
> Phil.
>

--000000000000e0e6a205fda1219a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Phil,<div>Thanks for all the suggestions, I&#39;ll send=
 patch v5 to fix all the issues.</div><div><br></div><div>Best Regards,</di=
v><div>Tommy</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, May 25, 2023 at 8:05=E2=80=AFPM Philippe Mathieu-=
Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Tom=
my,<br>
<br>
On 23/5/23 10:49, Tommy Wu wrote:<br>
&gt; The watchdog timer is in the always-on domain device of HiFive 1 rev b=
,<br>
&gt; so this patch added the AON device to the sifive_e machine. This patch=
<br>
&gt; only implemented the functionality of the watchdog timer.<br>
&gt; <br>
&gt; Signed-off-by: Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" tar=
get=3D"_blank">tommy.wu@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.com"=
 target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0hw/misc/sifive_e_aon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
326 +++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0include/hw/misc/sifive_e_aon.h |=C2=A0 60 ++++++<br>
&gt;=C2=A0 =C2=A04 files changed, 390 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 hw/misc/sifive_e_aon.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 include/hw/misc/sifive_e_aon.h<br>
<br>
<br>
&gt; +REG32(AON_WDT_WDOGCFG, 0x0)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG, SCALE, 0, 4)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG, RSVD0, 4, 4)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG, RSTEN, 8, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG, ZEROCMP, 9, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG, RSVD1, 10, 2)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG, EN_ALWAYS, 12, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG, EN_CORE_AWAKE, 13, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG, RSVD2, 14, 14)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG, IP0, 28, 1)<br>
&gt; +=C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCFG, RSVD3, 29, 3)<br>
&gt; +REG32(AON_WDT_WDOGCOUNT, 0x8)<br>
<br>
Adding:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 FIELD(AON_WDT_WDOGCOUNT, VALUE, 0, 31)<br>
<br>
...<br>
<br>
&gt; +REG32(AON_WDT_WDOGS, 0x10)<br>
&gt; +REG32(AON_WDT_WDOGFEED, 0x18)<br>
&gt; +REG32(AON_WDT_WDOGKEY, 0x1c)<br>
&gt; +REG32(AON_WDT_WDOGCMP0, 0x20)<br>
&gt; +<br>
&gt; +static void sifive_e_aon_wdt_update_wdogcount(SiFiveEAONState *r)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int64_t now;<br>
&gt; +=C2=A0 =C2=A0 if (0 =3D=3D FIELD_EX32(r-&gt;wdogcfg, AON_WDT_WDOGCFG,=
 EN_ALWAYS) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =3D=3D FIELD_EX32(r-&gt;wdogcfg, AON_WD=
T_WDOGCFG, EN_CORE_AWAKE)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 r-&gt;wdogcount +=3D muldiv64(now - r-&gt;wdog_restart_=
time,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;wdogclk_freq, NANOSECONDS_PER_SECO=
ND);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Clean the most significant bit. */<br>
&gt; +=C2=A0 =C2=A0 r-&gt;wdogcount =3D ((r-&gt;wdogcount &lt;&lt; 1) &gt;&=
gt; 1);<br>
<br>
... you could use:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcount &amp;=3D R_AON_WDT_WDOGCOUNT_VA=
LUE_MASK<br>
<br>
&gt; +=C2=A0 =C2=A0 r-&gt;wdog_restart_time =3D now;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sifive_e_aon_wdt_update_state(SiFiveEAONState *r)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint16_t wdogs;<br>
&gt; +=C2=A0 =C2=A0 bool cmp_signal =3D false;<br>
&gt; +=C2=A0 =C2=A0 sifive_e_aon_wdt_update_wdogcount(r);<br>
&gt; +=C2=A0 =C2=A0 wdogs =3D (uint16_t)(r-&gt;wdogcount &gt;&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0FIELD_EX32(r-&gt;wdogcfg, AON_WDT_WDOGCFG, SCAL=
E));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (wdogs &gt;=3D r-&gt;wdogcmp0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp_signal =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (1 =3D=3D FIELD_EX32(r-&gt;wdogcfg, AO=
N_WDT_WDOGCFG, ZEROCMP)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcount =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wdogs =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (cmp_signal) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (1 =3D=3D FIELD_EX32(r-&gt;wdogcfg, AO=
N_WDT_WDOGCFG, RSTEN)) {<br>
<br>
You sometimes check bit equality, ...<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 watchdog_perform_action();<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;wdogcfg =3D FIELD_DP32(r-&gt;wdogcf=
g, AON_WDT_WDOGCFG, IP0, 1);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_set_irq(r-&gt;wdog_irq, FIELD_EX32(r-&gt;wdogcfg, =
AON_WDT_WDOGCFG, IP0));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (wdogs &lt; r-&gt;wdogcmp0 &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (FIELD_EX32(r-&gt;wdogcfg, AON_WDT_WDOGCF=
G, EN_ALWAYS) ||<br>
<br>
... sometimes you don&#39;t. Code style consistency would be better.<br>
<br>
(Also, most of QEMU code base check equality using constant value<br>
on the right side of the comparaison).<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FIELD_EX32(r-&gt;wdogcfg, AON_WDT_W=
DOGCFG, EN_CORE_AWAKE))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t next =3D qemu_clock_get_ns(QEMU_C=
LOCK_VIRTUAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 next +=3D muldiv64((r-&gt;wdogcmp0 - wdog=
s) &lt;&lt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0FIELD_EX32(r-&gt;wdogcfg, AON_WDT_WDOGCFG, SCALE),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0NANOSECONDS_PER_SECOND, r-&gt;wdogclk_freq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(r-&gt;wdog_timer, next);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod(r-&gt;wdog_timer, INT64_MAX);<b=
r>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
<br>
&gt; +static void sifive_e_aon_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);<br>
&gt; +=C2=A0 =C2=A0 SiFiveEAONState *r =3D SIFIVE_E_AON(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_io(&amp;r-&gt;mmio, OBJECT(r), &amp;=
sifive_e_aon_ops, r,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_mmio(sbd, &amp;r-&gt;mmio);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* watchdog timer */<br>
&gt; +=C2=A0 =C2=A0 r-&gt;wdogclk_freq =3D SIFIVE_E_LFCLK_DEFAULT_FREQ;<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_irq(sbd, &amp;r-&gt;wdog_irq);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sifive_e_aon_realize(DeviceState *dev, Error **errp)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SiFiveEAONState *r =3D SIFIVE_E_AON(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* watchdog timer */<br>
&gt; +=C2=A0 =C2=A0 r-&gt;wdog_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sifive_e_aon_wdt_expired_c=
b, r);<br>
<br>
You should be able to create the timer in sifive_e_aon_init().<br>
<br>
&gt; +}<br>
<br>
Regards,<br>
<br>
Phil.<br>
</blockquote></div>

--000000000000e0e6a205fda1219a--

