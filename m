Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E13606A319
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 04:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RHsHv9SL
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJk3a-00056D-5e; Thu, 22 Oct 2026 00:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebasjosue84@gmail.com>)
 id 1xJk3X-00055m-1V
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 00:05:31 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sebasjosue84@gmail.com>)
 id 1xJk3U-0006Ws-PX
 for qemu-riscv@nongnu.org; Thu, 22 Oct 2026 00:05:30 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6b1f31c63ebso886282a12.0
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 21:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792641927; cv=none;
 d=google.com; s=arc-20260327;
 b=dJ/z3/zwKsBBYikr1pU0mMODwWG3FVBQlw9R6iqlCvWp4DqsgHVqUTvdC/18FgFihr
 oAk1Q6pQHgRbyD4umLqypsXf1CKaF4ZqS0flHijeb+DZgvqVS3Tq/s25l3Un7d97F1al
 16APdk+XHDMCjYEPfLQNzIPv2Gp9UVpquv6VVe3nQ5DooN9gB4UJzAUpXrS6RunC1N2K
 fFuQzTTuPIz02sqhAPNB7/4NYK7vRPsp+YlziFJ7lu1DkDHZJb8GHXLLAcWBp3+DKq8k
 iKvpzMjPqNWXpNoVTbjOauPxzG0exSe4ONhaApRiegVxJM/II2aaA6x9flf7FE36K2sv
 TwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TFQgWMamAJZMz10nIImx75Z9gy7XEUPfb+0E1okITUY=;
 fh=Mj2i10aLf3jAciEUR/nkT+53g2Nm3v+aOOumceEd9ec=;
 b=fvcI+r8+wENOB/DThq3ZKFHEtm4XqweOlS1U/D0CVbjJm5qOyLnQHH+TKZFd4VVVKD
 VS2DKAWt73H5cxvI1NackwDYw4QyZv3QAP1T2hI2ss5UOp/RG8JZ08Dx9rzOBFYNipot
 blc/6xPHwbGiuxHmj2U4s3RjVvnHCYabRDb8sCXDBsJcfIIvDcHC/Wpe9ScquBI2b9GL
 kxYl+0wa/mRfS5ImCUi1dvKYFCE5rJAmr3g9zFf+hSYyfkwrw3qrfeKAbAQy/SCbK8be
 6V/r4u5bC+BVXIq8WW4sF3H8f7gSqVquog2S6zz7QYGwEb9ns6kRrFVhRpvnx108+Gtj
 lnfA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792641927; x=1793246727; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TFQgWMamAJZMz10nIImx75Z9gy7XEUPfb+0E1okITUY=;
 b=RHsHv9SLJXJPrr8TjePn0VrcA9aHjfPOas8xT60VBe+Im3luQQ4AUSgt9JLeLK5pcU
 AF+Awj9WM6/U3WcMhmY1K8Wq2QbtOF+Sytijv+m/TAdiDpkYPB0MU6LbdI3SCbBINCcL
 sP6Q4yhisIriKrW2At+PVKSYpFPaPZ0fcNwXqrN9MKp9FWL8aEy4/zBAjyil8LcgUo33
 iRS6FoT/n0rEpPKl7f5aBg32nGDjeTJddTc1bovx/DW0Z43+/ofGWUPTVGzpZD68RxZy
 LwXcFWG6oAIEQewOmW54HAoxMsurolEwqvbv0WETCgYycj/8irDMy3N2HdZ7ODUnoKM9
 yy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792641927; x=1793246727;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TFQgWMamAJZMz10nIImx75Z9gy7XEUPfb+0E1okITUY=;
 b=U4Kup9/1b9wHmoL1TLMkgEkDMRAE7qNMBIKJhwoKWK3wM/9mHbEGREMzdlmDoyA2Vl
 5vpfY9ezu1XsivWbMgLJpkZ1Vo5wV04s+sws866GQn37J4Y5AZ0vmIVazk/Y7SYqhNQU
 q4iA3ASSzY3fOHUkqvTRrTuHwy/nxPeu9kgHZ9uao4wwerEALlWM7LWSz6w4SstDP6ua
 oQUXi0UoTr0kvRj5YVznpQyBYyJ5Q13wdMnGXQ3XJW08rhe5puhgOOX8rCj4Ttcw03T9
 LEmyw2EVcxEX+dDwRfpxvnvEGoS2tRnFUgTUbIHROWypa9goWuD2M0M7HrXKq5d5sS1x
 JQeg==
X-Forwarded-Encrypted: i=1;
 AKwUvByRVaEnpXpC84BeVxof223t0cHrLgbdfcZQ1PCSbhv6ajWu5dv3h2Guk4CEuGx6971rL7RlLULFGRTK@nongnu.org
X-Gm-Message-State: AFq9FYLmOEP0PzBtALdd25SuPd40io1StBHm8FH2inonWx/0zWDzln+J
 O1BW8HAhHL41kAEoIjxImGbV1qrexwPJAZ9gb5d3FFM03HKU5JBkMubhffWBwReXZD1+HAu3qlC
 bT9qZ3b2I3romsCKBQJa5bxi7f1wGjW0=
X-Gm-Gg: AYBFou11UxIHQw2JEkKYZ7LDX7Pk/RDaNm4R1LuwSWFBFXLUHm7Oo7GTUCdSVxA4IJj
 DFa+A3Gc7xW64altvNrfT5B7sGbq5sU14umMgRiKuoyYIMtgcJH8ZB4QFGSbpLQZOadS1rorx96
 E+5/BzIP+RLRisji3K8Ao6za9zvswEJlis3NPCmvAy8fu3ilWeZxK4rsQZQOUdml7XUzvWfoNfh
 7o/TTbosglQx+8tF7Ku1sA0WP28xIrPADVjqz/osvD4pORVEa5156Z5NPOfkRIQ1Ap4XZDO9+6j
 vJ+1IQHMoD9JYPEVEUiUedKpNhsS0V5NlrqDH9ZhxP8c0CZzW/VsEQ7vPkB2ZGhYMF0R1ORsGno
 jSrGp0qwEkfCQH/JlrFrsorT1ytinqbB3bM2pOLYuCpTKZnrlueUK6bzbZBu+Zgj6BWIc1aD2HW
 F26gPVCAypFI7J8MY=
X-Received: by 2002:a05:6402:4246:10b0:6ae:1895:3b3e with SMTP id
 4fb4d7f45d1cf-6b41d5cfd2emr855861a12.6.1792641926665; Wed, 21 Oct 2026
 21:05:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260916034331.2390427-1-sebasjosue84@gmail.com>
 <0ebf4cdd-d5be-41f0-adaf-d540f3dd0793@linaro.org>
 <ba06d1597bb8e7f3c68e77d4b8c999fec3b410d3.camel@wdc.com>
In-Reply-To: <ba06d1597bb8e7f3c68e77d4b8c999fec3b410d3.camel@wdc.com>
From: =?UTF-8?Q?Sebasti=C3=A1n_Alba?= <sebasjosue84@gmail.com>
Date: Wed, 21 Oct 2026 22:05:15 -0600
X-Gm-Features: AclHuK85aaqHY0mRhxNYbsrMNNJ9K7DjXsUA9jhw7tFj5t5Ds5OHVqcGONAgvr4
Message-ID: <CAJD=UNdaqRj30PLbGpQ-EAue=h3i0TfaQjxYL+SPH62U9V79xw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/pmp: unlock all PMP entries on reset
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>, 
 "liwei1518@gmail.com" <liwei1518@gmail.com>, 
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="0000000000003f98e2065e65f900"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=sebasjosue84@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--0000000000003f98e2065e65f900
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent a v3 a few minutes ago, before seeing this. It splits the change in
two:

  1/2  this fix, with a reworded commit message. Functionally the
       same, though I kept the variable as pmp_num instead of
       renaming it, so let me know whether you'd rather I carry your
       Reviewed-by across or just take v1 from this thread.

  2/2  clears pmp_state.addr[] and num_rules. The spec doesn't cover
       those, but they stay stale across reset and the difference is
       observable from a guest. There's a measurement in the v3
       cover letter.

v3:
https://lore.kernel.org/qemu-devel/20261022040258.1509306-1-sebasjosue84@gm=
ail.com/

Sebasti=C3=A1n

El mi=C3=A9, 21 oct 2026 a las 21:40, Alistair Francis (<Alistair.Francis@w=
dc.com>)
escribi=C3=B3:

> On Wed, 2026-09-16 at 00:10 -1000, Richard Henderson wrote:
> > On 9/15/26 17:43, Sebastian Alba Vives wrote:
> > > pmp_unlock_entries() bounds its loop with pmp_get_num_rules(),
> > > which is
> > > the count of entries whose A field is not OFF, not the number of
> > > implemented PMP entries. When the active rules are not contiguous
> > > from
> > > index 0, every entry at an index greater than or equal to num_rules
> > > keeps its lock bit across a CPU reset.
> > >
> > > Those entries stay locked after the reset has cleared mseccfg, so
> > > mseccfg.RLB is no longer set and pmp_is_readonly() silently
> > > discards
> > > subsequent pmpcfg writes. Firmware started after the reset finds
> > > PMP
> > > entries it did not configure and cannot clear.
> > >
> > > Reproduced on -machine virt -cpu rv64,smepmp=3Dtrue with a bare-metal
> > > payload that sets pmpcfg0 =3D 0x99990000 (entries 2 and 3 as
> > > L | NAPOT | R, entries 0 and 1 left OFF) and then resets through
> > > the
> > > sifive_test device. On the second boot pmpcfg0 reads back
> > > 0x99990000
> > > and writing 0 to it leaves the value unchanged. With this patch the
> > > same payload reads 0x01010000 on the second boot and clearing
> > > pmpcfg0
> > > succeeds.
> > >
> > > Iterate over the implemented entries instead.
> > >
> > > Fixes: 4bf501dc0118 ("target/riscv: pmp: Clear pmp/smepmp bits on
> > > reset")
> > > Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
> > > ---
> > >   target/riscv/tcg/pmp.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c
> > > index 41b55519a8..5286c6aa90 100644
> > > --- a/target/riscv/tcg/pmp.c
> > > +++ b/target/riscv/tcg/pmp.c
> > > @@ -201,10 +201,10 @@ static bool pmp_write_cfg(CPURISCVState *env,
> > > uint32_t pmp_index, uint8_t val)
> > >
> > >   void pmp_unlock_entries(CPURISCVState *env)
> > >   {
> > > -    uint32_t pmp_num =3D pmp_get_num_rules(env);
> > > +    uint8_t pmp_regions =3D riscv_cpu_cfg(env)->pmp_regions;
> > >       int i;
> > >
> > > -    for (i =3D 0; i < pmp_num; i++) {
> > > +    for (i =3D 0; i < pmp_regions; i++) {
> > >           env->pmp_state.pmp[i].cfg_reg &=3D ~(PMP_LOCK |
> > > PMP_AMATCH);
> > >       }
> > >   }
> >
> > Why is the entire env->pmp_state not zeroed instead?
>
> The RISC-V spec specifically states that on reset:
>
> "Writable PMP registers=E2=80=99 A and L fields are set to 0...", so this=
 does
> seem to be the correct approach
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> >
> >
> > r~
>


--=20
Sebasti=C3=A1n Alba

--0000000000003f98e2065e65f900
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I sent a v3 a few minutes ago, before seeing this. It spli=
ts the change in two:<br><br>=C2=A0 1/2 =C2=A0this fix, with a reworded com=
mit message. Functionally the<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0same, though I =
kept the variable as pmp_num instead of<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0renam=
ing it, so let me know whether you&#39;d rather I carry your<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0Reviewed-by across or just take v1 from this thread.<br><b=
r>=C2=A0 2/2 =C2=A0clears pmp_state.addr[] and num_rules. The spec doesn&#3=
9;t cover<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0those, but they stay stale across r=
eset and the difference is<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0observable from a =
guest. There&#39;s a measurement in the v3<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0co=
ver letter.<br><br>v3: <a href=3D"https://lore.kernel.org/qemu-devel/202610=
22040258.1509306-1-sebasjosue84@gmail.com/">https://lore.kernel.org/qemu-de=
vel/20261022040258.1509306-1-sebasjosue84@gmail.com/</a><br><br>Sebasti=C3=
=A1n<br></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">El mi=C3=A9, 21 oct 2026 a las 21:40, Alistai=
r Francis (&lt;<a href=3D"mailto:Alistair.Francis@wdc.com">Alistair.Francis=
@wdc.com</a>&gt;) escribi=C3=B3:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex">On Wed, 2026-09-=
16 at 00:10 -1000, Richard Henderson wrote:<br>
&gt; On 9/15/26 17:43, Sebastian Alba Vives wrote:<br>
&gt; &gt; pmp_unlock_entries() bounds its loop with pmp_get_num_rules(),<br=
>
&gt; &gt; which is<br>
&gt; &gt; the count of entries whose A field is not OFF, not the number of<=
br>
&gt; &gt; implemented PMP entries. When the active rules are not contiguous=
<br>
&gt; &gt; from<br>
&gt; &gt; index 0, every entry at an index greater than or equal to num_rul=
es<br>
&gt; &gt; keeps its lock bit across a CPU reset.<br>
&gt; &gt; <br>
&gt; &gt; Those entries stay locked after the reset has cleared mseccfg, so=
<br>
&gt; &gt; mseccfg.RLB is no longer set and pmp_is_readonly() silently<br>
&gt; &gt; discards<br>
&gt; &gt; subsequent pmpcfg writes. Firmware started after the reset finds<=
br>
&gt; &gt; PMP<br>
&gt; &gt; entries it did not configure and cannot clear.<br>
&gt; &gt; <br>
&gt; &gt; Reproduced on -machine virt -cpu rv64,smepmp=3Dtrue with a bare-m=
etal<br>
&gt; &gt; payload that sets pmpcfg0 =3D 0x99990000 (entries 2 and 3 as<br>
&gt; &gt; L | NAPOT | R, entries 0 and 1 left OFF) and then resets through<=
br>
&gt; &gt; the<br>
&gt; &gt; sifive_test device. On the second boot pmpcfg0 reads back<br>
&gt; &gt; 0x99990000<br>
&gt; &gt; and writing 0 to it leaves the value unchanged. With this patch t=
he<br>
&gt; &gt; same payload reads 0x01010000 on the second boot and clearing<br>
&gt; &gt; pmpcfg0<br>
&gt; &gt; succeeds.<br>
&gt; &gt; <br>
&gt; &gt; Iterate over the implemented entries instead.<br>
&gt; &gt; <br>
&gt; &gt; Fixes: 4bf501dc0118 (&quot;target/riscv: pmp: Clear pmp/smepmp bi=
ts on<br>
&gt; &gt; reset&quot;)<br>
&gt; &gt; Signed-off-by: Sebastian Alba Vives &lt;<a href=3D"mailto:sebasjo=
sue84@gmail.com" target=3D"_blank">sebasjosue84@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0 target/riscv/tcg/pmp.c | 4 ++--<br>
&gt; &gt; =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/target/riscv/tcg/pmp.c b/target/riscv/tcg/pmp.c<br>
&gt; &gt; index 41b55519a8..5286c6aa90 100644<br>
&gt; &gt; --- a/target/riscv/tcg/pmp.c<br>
&gt; &gt; +++ b/target/riscv/tcg/pmp.c<br>
&gt; &gt; @@ -201,10 +201,10 @@ static bool pmp_write_cfg(CPURISCVState *en=
v,<br>
&gt; &gt; uint32_t pmp_index, uint8_t val)<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; =C2=A0 void pmp_unlock_entries(CPURISCVState *env)<br>
&gt; &gt; =C2=A0 {<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0 uint32_t pmp_num =3D pmp_get_num_rules(env);<=
br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 uint8_t pmp_regions =3D riscv_cpu_cfg(env)-&g=
t;pmp_regions;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i;<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i &lt; pmp_num; i++) {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i &lt; pmp_regions; i++) {<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env-&gt;pm=
p_state.pmp[i].cfg_reg &amp;=3D ~(PMP_LOCK |<br>
&gt; &gt; PMP_AMATCH);<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; =C2=A0 }<br>
&gt; <br>
&gt; Why is the entire env-&gt;pmp_state not zeroed instead?<br>
<br>
The RISC-V spec specifically states that on reset:<br>
<br>
&quot;Writable PMP registers=E2=80=99 A and L fields are set to 0...&quot;,=
 so this does<br>
seem to be the correct approach<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Alistair<br>
<br>
&gt; <br>
&gt; <br>
&gt; r~<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"=
text-align:left">Sebasti=C3=A1n Alba</div><div style=3D"text-align:center">=
</div></div></div></div></div>

--0000000000003f98e2065e65f900--

