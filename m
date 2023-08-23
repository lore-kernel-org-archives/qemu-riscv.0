Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFE8EE49A0
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 08:05:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qYira-0003Sf-12; Wed, 23 Aug 2023 04:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qYirY-0003SN-UN
 for qemu-riscv@nongnu.org; Wed, 23 Aug 2023 04:05:12 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qYirW-0005UJ-Du
 for qemu-riscv@nongnu.org; Wed, 23 Aug 2023 04:05:12 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b72161c6e9so72551341fa.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Aug 2023 01:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1692777908; x=1693382708;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i0gUa3ZYdo8MdUnTzZIgFbaTq3wmGkpHQ9opv/AfAP8=;
 b=dCiofPyDIQhyEgq1Y54N0t7/PV/39OBLh9dFU1nRL9or241QujMZY2CSEoiGn7JmzQ
 w/ZukxDWc+s9gk/KhpsRpxzApGCxPOIdD9tjYeBOwO4xO4pDtxqBmS2QdUK8ojHz92bZ
 feJcPX0Cl+2XgLeqAQLlKTzzGn2tLVIr97k9aoE3yNR2f+nLm17cs2lLlJPDbo7RUDT/
 8CF3JA/Y/5cwU2EeNmlRhrzlLIMH6EuoYrrepBBRWYKiKv40NIxFTUnQ2DTbYTIXqeEq
 m0i3g/WrvMuxW/WKMhastLsvJPv7XdGL+qB07cuCRmVTXkwzhSZAOyS2s8kP9fjg04o+
 W2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692777908; x=1693382708;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i0gUa3ZYdo8MdUnTzZIgFbaTq3wmGkpHQ9opv/AfAP8=;
 b=WBjMj0MLNkPhsdDBYoGbwo6Oc5X3y41KTrp/+ZlJcdSXhNgTDrQmSqvTejLXdxUx1U
 821AutdyNpFhRzur1fYw1rm++jrDocR6UsLP3KQAED0KAT3O+rcN0WP1eUz1m0IvTjqR
 o3oTHrvIBtdkLbMfntykVVUXBEwMqBJ1CVDwPUW+RrRvg5EUtkuw2m9Ug23DuBLF2nJg
 ZFww5vC8dNJOzns2RzOanRhGctU/UKQYVzzkJw8sLZ5TWGcmOgkO7QYlSOKsXbSHGMAI
 T2qUHbdigVe/iulDo0PTp+uZe8dRSbWTKHCQ55WkKZZ9072TwLexsCjo/fsjhjQDPZYt
 ZbIw==
X-Gm-Message-State: AOJu0Yyt8Wvn9+ccM4j/suNHQ9/3lgTS6NZsgjO14OYBkZB8QDZVMb8/
 60pXGVDMsPiTWFbhyVS3hePiasfgbkULtzgiAM8tvg==
X-Google-Smtp-Source: AGHT+IHaGGYnIwX1OZ/bZtugn4KL17lHFP61f8Tzmg0s3+0L3+CkyeQDHtwIpJKtyp6YDKbS03sA9pvEs1SIw9Pu+BE=
X-Received: by 2002:a2e:914e:0:b0:2bc:bc6f:e296 with SMTP id
 q14-20020a2e914e000000b002bcbc6fe296mr4040773ljg.13.1692777907555; Wed, 23
 Aug 2023 01:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230728082502.26439-1-jason.chien@sifive.com>
 <20230728082502.26439-2-jason.chien@sifive.com>
 <CAKmqyKMX=Q3+kdaKAJrQHeya7ctnyt0HSt=NUQWUAOj9JEPZ8g@mail.gmail.com>
 <CADr__8rmCu9F2ktxYGtZfUeD_z+pNVa4KKsZ8XvxxVGmMJfrcw@mail.gmail.com>
 <CAKmqyKPCyx0fbiBzFDACDPHGYAdkjBJgcqHCVPFx0ETzRYpk3Q@mail.gmail.com>
In-Reply-To: <CAKmqyKPCyx0fbiBzFDACDPHGYAdkjBJgcqHCVPFx0ETzRYpk3Q@mail.gmail.com>
From: Jason Chien <jason.chien@sifive.com>
Date: Wed, 23 Aug 2023 16:04:55 +0800
Message-ID: <CADr__8oe0BP7vXLddwZYijkiogC6BgnRk_5hx0YzfBkWuwEqaQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/intc: Make rtc variable names consistent
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: multipart/alternative; boundary="000000000000dd348306039291db"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=jason.chien@sifive.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--000000000000dd348306039291db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the update.

On Tue, Aug 22, 2023 at 1:53=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com>
wrote:

> On Mon, Aug 21, 2023 at 12:15=E2=80=AFPM Jason Chien <jason.chien@sifive.=
com>
> wrote:
> >
> > Ping.
>
> This has been applied to the RISC-V tree. It will go in after the QEMU
> release freeze is over (probably a week or two).
>
> Alistair
>
> >
> > On Fri, Aug 11, 2023 at 2:25=E2=80=AFAM Alistair Francis <alistair23@gm=
ail.com>
> wrote:
> >>
> >> On Fri, Jul 28, 2023 at 4:57=E2=80=AFAM Jason Chien <jason.chien@sifiv=
e.com>
> wrote:
> >> >
> >> > The variables whose values are given by cpu_riscv_read_rtc() should
> be named
> >> > "rtc". The variables whose value are given by cpu_riscv_read_rtc_raw=
()
> >> > should be named "rtc_r".
> >> >
> >> > Signed-off-by: Jason Chien <jason.chien@sifive.com>
> >>
> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >>
> >> Alistair
> >>
> >> > ---
> >> >  hw/intc/riscv_aclint.c | 6 +++---
> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> >> > index bf77e29a70..25cf7a5d9d 100644
> >> > --- a/hw/intc/riscv_aclint.c
> >> > +++ b/hw/intc/riscv_aclint.c
> >> > @@ -64,13 +64,13 @@ static void
> riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> >> >      uint64_t next;
> >> >      uint64_t diff;
> >> >
> >> > -    uint64_t rtc_r =3D cpu_riscv_read_rtc(mtimer);
> >> > +    uint64_t rtc =3D cpu_riscv_read_rtc(mtimer);
> >> >
> >> >      /* Compute the relative hartid w.r.t the socket */
> >> >      hartid =3D hartid - mtimer->hartid_base;
> >> >
> >> >      mtimer->timecmp[hartid] =3D value;
> >> > -    if (mtimer->timecmp[hartid] <=3D rtc_r) {
> >> > +    if (mtimer->timecmp[hartid] <=3D rtc) {
> >> >          /*
> >> >           * If we're setting an MTIMECMP value in the "past",
> >> >           * immediately raise the timer interrupt
> >> > @@ -81,7 +81,7 @@ static void
> riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
> >> >
> >> >      /* otherwise, set up the future timer interrupt */
> >> >      qemu_irq_lower(mtimer->timer_irqs[hartid]);
> >> > -    diff =3D mtimer->timecmp[hartid] - rtc_r;
> >> > +    diff =3D mtimer->timecmp[hartid] - rtc;
> >> >      /* back to ns (note args switched in muldiv64) */
> >> >      uint64_t ns_diff =3D muldiv64(diff, NANOSECONDS_PER_SECOND,
> timebase_freq);
> >> >
> >> > --
> >> > 2.17.1
> >> >
> >> >
>

--000000000000dd348306039291db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the update.=C2=A0<br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 22, 2023 at 1:=
53=E2=80=AFAM Alistair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">=
alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Mon, Aug 21, 2023 at 12:15=E2=80=AFPM Jason Chien &l=
t;<a href=3D"mailto:jason.chien@sifive.com" target=3D"_blank">jason.chien@s=
ifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Ping.<br>
<br>
This has been applied to the RISC-V tree. It will go in after the QEMU<br>
release freeze is over (probably a week or two).<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt; On Fri, Aug 11, 2023 at 2:25=E2=80=AFAM Alistair Francis &lt;<a href=
=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Jul 28, 2023 at 4:57=E2=80=AFAM Jason Chien &lt;<a href=3D=
"mailto:jason.chien@sifive.com" target=3D"_blank">jason.chien@sifive.com</a=
>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The variables whose values are given by cpu_riscv_read_rtc() =
should be named<br>
&gt;&gt; &gt; &quot;rtc&quot;. The variables whose value are given by cpu_r=
iscv_read_rtc_raw()<br>
&gt;&gt; &gt; should be named &quot;rtc_r&quot;.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Jason Chien &lt;<a href=3D"mailto:jason.chien@=
sifive.com" target=3D"_blank">jason.chien@sifive.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.franc=
is@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Alistair<br>
&gt;&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 hw/intc/riscv_aclint.c | 6 +++---<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c<=
br>
&gt;&gt; &gt; index bf77e29a70..25cf7a5d9d 100644<br>
&gt;&gt; &gt; --- a/hw/intc/riscv_aclint.c<br>
&gt;&gt; &gt; +++ b/hw/intc/riscv_aclint.c<br>
&gt;&gt; &gt; @@ -64,13 +64,13 @@ static void riscv_aclint_mtimer_write_tim=
ecmp(RISCVAclintMTimerState *mtimer,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint64_t next;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint64_t diff;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 uint64_t rtc_r =3D cpu_riscv_read_rtc(mtimer);=
<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 uint64_t rtc =3D cpu_riscv_read_rtc(mtimer);<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* Compute the relative hartid w.r.t the =
socket */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 hartid =3D hartid - mtimer-&gt;hartid_bas=
e;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 mtimer-&gt;timecmp[hartid] =3D value;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 if (mtimer-&gt;timecmp[hartid] &lt;=3D rtc_r) =
{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 if (mtimer-&gt;timecmp[hartid] &lt;=3D rtc) {<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If we&#39;re settin=
g an MTIMECMP value in the &quot;past&quot;,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* immediately raise t=
he timer interrupt<br>
&gt;&gt; &gt; @@ -81,7 +81,7 @@ static void riscv_aclint_mtimer_write_timec=
mp(RISCVAclintMTimerState *mtimer,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* otherwise, set up the future timer int=
errupt */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(mtimer-&gt;timer_irqs[hart=
id]);<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 diff =3D mtimer-&gt;timecmp[hartid] - rtc_r;<b=
r>
&gt;&gt; &gt; +=C2=A0 =C2=A0 diff =3D mtimer-&gt;timecmp[hartid] - rtc;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 /* back to ns (note args switched in muld=
iv64) */<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 uint64_t ns_diff =3D muldiv64(diff, NANOS=
ECONDS_PER_SECOND, timebase_freq);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.17.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
</blockquote></div>

--000000000000dd348306039291db--

