Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED57C001B0
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 18:41:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qTRdE-0001Za-LL; Tue, 08 Aug 2023 14:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qTRdB-0001WP-RT
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 14:40:33 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1qTRdA-0002l2-0B
 for qemu-riscv@nongnu.org; Tue, 08 Aug 2023 14:40:33 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b9d3dacb33so97140351fa.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Aug 2023 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1691520029; x=1692124829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EBL/394En3TFgg5hXf3zvRoe4YyOVxe3ntLWODwwFLE=;
 b=aYJIN1brkaMVSCu+VNv3bL7N31CoolUzOOdtO5GQlx+dS7eaGaHGVQ1vhIOHHaodvJ
 f8NExtTF2nigF4LoYrSMbHQYrV8h8CSNKb5VUg+XRW7SE4z3++VLrPpNMNWmOH4HZ30r
 fWnp74ZWslveNurB7gPPsLTILV/KCnh2FPqwYggjHpdVyM4fqsnJMwh8b17rC6gHazDQ
 FCweydqrFgr23HTk2FCOOmU6WvjQkGadclhGDLHyTUQrq3e0Hh1mcc6qR4QSCunHZntN
 3kjl16lHCEr/8z9xcpykN3UpwreDeuxg8mmApZPAo5Xn/N/mcVhvzjo8AN5kNQ5ABtKh
 ng/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691520029; x=1692124829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EBL/394En3TFgg5hXf3zvRoe4YyOVxe3ntLWODwwFLE=;
 b=DFe2zFUMF1B93Fz2Qk+mZbr3T+u6yDJ0o8SvNtnWzb79QuhmemAPEBYVGk4r21AaYS
 PG8Ur83yp8sj/RDBFOAtOJuBuiAeUNwnKGjiCB6xvyqBwcqIxuGGPbm5xgvGl7lOYY/B
 GNAlDYJtfh7rlCcJ0ow3NxtehEeXRO24uTK0sNPgN5eswPLIu+hMw22QftnJ3QmKGWHd
 xSp3DjmZqMMmogsCu+oobAuxb/QujFFga735hZZ0Lt9qfiaptePa3o7pmHECOIzefMCP
 0x9oGMNKya7FxVtGqTm/ag9N2VnUUzJFRt1oudSHJfBH7ppCzutnaYcSxyq0TJfbleFc
 c0Iw==
X-Gm-Message-State: AOJu0YxPJIzickJJSLslD5eeryhCuUalI+kVV7A25moi227ia83xbbwd
 9kgwZwc+cWgip9brASiG2nW0FjjJNteQd/RVr9r9Bw==
X-Google-Smtp-Source: AGHT+IGIazrIx9NWgPCT7GlKXB83AE+tZbkRF/1/zsuGFbsKA9V+crw9Js/z0Q4yT8HZcmDMGmBWwq98NCh7b5j3cgA=
X-Received: by 2002:a2e:9902:0:b0:2b9:eb9d:cc51 with SMTP id
 v2-20020a2e9902000000b002b9eb9dcc51mr229040lji.49.1691520029218; Tue, 08 Aug
 2023 11:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230728082502.26439-1-jason.chien@sifive.com>
 <20230728082502.26439-2-jason.chien@sifive.com>
In-Reply-To: <20230728082502.26439-2-jason.chien@sifive.com>
From: Jason Chien <jason.chien@sifive.com>
Date: Wed, 9 Aug 2023 02:40:17 +0800
Message-ID: <CADr__8qQxfJTFsj0k59i9KZQAiZ8NGUqXhgDq0hPqXid-vUyWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/intc: Make rtc variable names consistent
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: multipart/alternative; boundary="00000000000078fe4506026db272"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=jason.chien@sifive.com; helo=mail-lj1-x22d.google.com
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

--00000000000078fe4506026db272
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
The patch seems to be ignored. I am not sure who to ping. Could someone
please review this patch? Thank you!
patch link:
https://lore.kernel.org/qemu-devel/20230728082502.26439-2-jason.chien@sifiv=
e.com/

Jason

On Fri, Jul 28, 2023 at 4:25=E2=80=AFPM Jason Chien <jason.chien@sifive.com=
> wrote:

> The variables whose values are given by cpu_riscv_read_rtc() should be
> named
> "rtc". The variables whose value are given by cpu_riscv_read_rtc_raw()
> should be named "rtc_r".
>
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---
>  hw/intc/riscv_aclint.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index bf77e29a70..25cf7a5d9d 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -64,13 +64,13 @@ static void
> riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
>      uint64_t next;
>      uint64_t diff;
>
> -    uint64_t rtc_r =3D cpu_riscv_read_rtc(mtimer);
> +    uint64_t rtc =3D cpu_riscv_read_rtc(mtimer);
>
>      /* Compute the relative hartid w.r.t the socket */
>      hartid =3D hartid - mtimer->hartid_base;
>
>      mtimer->timecmp[hartid] =3D value;
> -    if (mtimer->timecmp[hartid] <=3D rtc_r) {
> +    if (mtimer->timecmp[hartid] <=3D rtc) {
>          /*
>           * If we're setting an MTIMECMP value in the "past",
>           * immediately raise the timer interrupt
> @@ -81,7 +81,7 @@ static void
> riscv_aclint_mtimer_write_timecmp(RISCVAclintMTimerState *mtimer,
>
>      /* otherwise, set up the future timer interrupt */
>      qemu_irq_lower(mtimer->timer_irqs[hartid]);
> -    diff =3D mtimer->timecmp[hartid] - rtc_r;
> +    diff =3D mtimer->timecmp[hartid] - rtc;
>      /* back to ns (note args switched in muldiv64) */
>      uint64_t ns_diff =3D muldiv64(diff, NANOSECONDS_PER_SECOND,
> timebase_freq);
>
> --
> 2.17.1
>
>

--00000000000078fe4506026db272
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>The patch seems to be ignored. I am not sure who t=
o ping. Could someone please review this patch? Thank you!</div><div>patch =
link:=C2=A0<a href=3D"https://lore.kernel.org/qemu-devel/20230728082502.264=
39-2-jason.chien@sifive.com/">https://lore.kernel.org/qemu-devel/2023072808=
2502.26439-2-jason.chien@sifive.com/</a><br></div><div><br></div><div>Jason=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, Jul 28, 2023 at 4:25=E2=80=AFPM Jason Chien &lt;<a href=3D"ma=
ilto:jason.chien@sifive.com" target=3D"_blank">jason.chien@sifive.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The va=
riables whose values are given by cpu_riscv_read_rtc() should be named<br>
&quot;rtc&quot;. The variables whose value are given by cpu_riscv_read_rtc_=
raw()<br>
should be named &quot;rtc_r&quot;.<br>
<br>
Signed-off-by: Jason Chien &lt;<a href=3D"mailto:jason.chien@sifive.com" ta=
rget=3D"_blank">jason.chien@sifive.com</a>&gt;<br>
---<br>
=C2=A0hw/intc/riscv_aclint.c | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c<br>
index bf77e29a70..25cf7a5d9d 100644<br>
--- a/hw/intc/riscv_aclint.c<br>
+++ b/hw/intc/riscv_aclint.c<br>
@@ -64,13 +64,13 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAcli=
ntMTimerState *mtimer,<br>
=C2=A0 =C2=A0 =C2=A0uint64_t next;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t diff;<br>
<br>
-=C2=A0 =C2=A0 uint64_t rtc_r =3D cpu_riscv_read_rtc(mtimer);<br>
+=C2=A0 =C2=A0 uint64_t rtc =3D cpu_riscv_read_rtc(mtimer);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Compute the relative hartid w.r.t the socket */<br>
=C2=A0 =C2=A0 =C2=A0hartid =3D hartid - mtimer-&gt;hartid_base;<br>
<br>
=C2=A0 =C2=A0 =C2=A0mtimer-&gt;timecmp[hartid] =3D value;<br>
-=C2=A0 =C2=A0 if (mtimer-&gt;timecmp[hartid] &lt;=3D rtc_r) {<br>
+=C2=A0 =C2=A0 if (mtimer-&gt;timecmp[hartid] &lt;=3D rtc) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * If we&#39;re setting an MTIMECMP value=
 in the &quot;past&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * immediately raise the timer interrupt<=
br>
@@ -81,7 +81,7 @@ static void riscv_aclint_mtimer_write_timecmp(RISCVAclint=
MTimerState *mtimer,<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* otherwise, set up the future timer interrupt */<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq_lower(mtimer-&gt;timer_irqs[hartid]);<br>
-=C2=A0 =C2=A0 diff =3D mtimer-&gt;timecmp[hartid] - rtc_r;<br>
+=C2=A0 =C2=A0 diff =3D mtimer-&gt;timecmp[hartid] - rtc;<br>
=C2=A0 =C2=A0 =C2=A0/* back to ns (note args switched in muldiv64) */<br>
=C2=A0 =C2=A0 =C2=A0uint64_t ns_diff =3D muldiv64(diff, NANOSECONDS_PER_SEC=
OND, timebase_freq);<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--00000000000078fe4506026db272--

