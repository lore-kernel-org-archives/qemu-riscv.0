Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D080C47072
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 16:54:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJG7M-0006BD-R8; Fri, 29 Dec 2023 11:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rJG7H-0006AC-AK; Fri, 29 Dec 2023 11:53:47 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rJG7F-0001zL-BW; Fri, 29 Dec 2023 11:53:47 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ccebd0377fso10952171fa.3; 
 Fri, 29 Dec 2023 08:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703868822; x=1704473622; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8qfEDck5kyHBX0UHJywAMJKPi/7xq7xpdZxmwO4GYGQ=;
 b=QUzCnmvNfEq3Wj1lqOhbfNQ2DHphcAQ7xg6UElWa39lQOOOjLAFdXi+ZSmZ6vYoccN
 1Yqqdj+U3rKYp6z1lFIIerJNBXwiBzWWz68Xu3XghiHf7gqMRzUA3yUZOw1bGp5khA2Q
 8ZtWeShLAn2lu61TIt0boE22bXZo4AODB1rQjPsbkVTBZ7wFlZPAPEBJjPnCU4rm7pz0
 HcgiPqOl+J9wF0dSLmp4hatgWkc3jqdamHWsEN8IrMG3WQ+XNPpdtGJSka6XLtl5GWkB
 7km7iWV40xXzbbo66YGltDFLpfoEFBIC89AQr+6UfEton1pFqxFpJ4RLDjRDBfKxVLY9
 ru6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703868822; x=1704473622;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8qfEDck5kyHBX0UHJywAMJKPi/7xq7xpdZxmwO4GYGQ=;
 b=UlvnDb5oClfHlFLB/zcEL/HFTBEve7xjO6CdDZCGrvu3t4lA/atuE99GCd+faF09m4
 Y/DOF7A1TKZm/XTqhI2QW05Dl8WElVayazJp0yTtU2MOXKNWI+Jxvpt6bf/j3Ct+OqyA
 Gcv0chUacaRo97Yy6mSmt29pw+fvo5cl7Sryww2ovWYYwPw1Ot+5BCRAK73Ctq59OOpu
 5geZF12k9Fq09B15Bh+dlVSoxnFDB7my19Bq1H9YjtG8aPXHXWC5WlEv65ATacs1tfm5
 NeKhamgdfC7ClLiOLNcjaB9Nc9TAGHC5/Xix41pLQQFotWuBMVZk02CQhFaf7zWbv+v1
 8fAg==
X-Gm-Message-State: AOJu0YztC4aLOzukRZIYzL17kJovLJNPpBGwq5TQNQjyDe7d2YyhaBKY
 BmJpIY9RSEsorTl1zBnTAWz3/H514HIrvuZbqgs=
X-Google-Smtp-Source: AGHT+IEaywadKJ13/hJeVfptifjm39ROJCrX/kLo96YjRDNkrssleP07bJBLWoZPd5Mn6Pp58AnEa1UGxzMPoxlAXmA=
X-Received: by 2002:a2e:2284:0:b0:2cc:df3f:9f71 with SMTP id
 i126-20020a2e2284000000b002ccdf3f9f71mr822326lji.87.1703868822097; Fri, 29
 Dec 2023 08:53:42 -0800 (PST)
MIME-Version: 1.0
References: <20231224044812.2072140-1-me@deliversmonkey.space>
 <20231224044812.2072140-5-me@deliversmonkey.space>
 <10c1404a-dff6-4f1e-95f6-9273d4e53c75@linaro.org>
In-Reply-To: <10c1404a-dff6-4f1e-95f6-9273d4e53c75@linaro.org>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Fri, 29 Dec 2023 19:53:30 +0300
Message-ID: <CAFukJ-DbDRLM8-hYOk0fthj=1BvpkY-Jgokrq5tmXOhvmMGxNw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] target/riscv: Add pointer masking tb flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e291f6060da8df51"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000e291f6060da8df51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>Any particular reason to add these in the middle?
No actual reason except for previously those flags were there in the
middle. I'll move them to the end of the list, that sounds reasonable.

>Something to consider as a somewhat unrelated cleanup would be to add an..=
.
That's a good idea and I agree we could do it as part of future clean up.

Thanks, Richard

=D0=BF=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 02:33, Ric=
hard Henderson <richard.henderson@linaro.org
>:

> On 12/24/23 15:48, Alexey Baturo wrote:
> > From: Alexey Baturo <baturo.alexey@gmail.com>
> >
> > Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
> > ---
> >   target/riscv/cpu.h        | 15 +++++++++------
> >   target/riscv/cpu_helper.c |  3 +++
> >   target/riscv/translate.c  |  5 +++++
> >   3 files changed, 17 insertions(+), 6 deletions(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index c607a94bba..038b86db4b 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -538,14 +538,17 @@ FIELD(TB_FLAGS, VILL, 14, 1)
> >   FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)
> >   /* The combination of MXL/SXL/UXL that applies to the current cpu
> mode. */
> >   FIELD(TB_FLAGS, XL, 16, 2)
> > -FIELD(TB_FLAGS, VTA, 18, 1)
> > -FIELD(TB_FLAGS, VMA, 19, 1)
> > +/* If pointer masking should be applied and address sign extended */
> > +FIELD(TB_FLAGS, PM_PMM, 18, 2)
> > +FIELD(TB_FLAGS, PM_SIGNEXTEND, 20, 1)
> > +FIELD(TB_FLAGS, VTA, 21, 1)
> > +FIELD(TB_FLAGS, VMA, 22, 1)
> >   /* Native debug itrigger */
> > -FIELD(TB_FLAGS, ITRIGGER, 20, 1)
> > +FIELD(TB_FLAGS, ITRIGGER, 23, 1)
> >   /* Virtual mode enabled */
> > -FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
> > -FIELD(TB_FLAGS, PRIV, 22, 2)
> > -FIELD(TB_FLAGS, AXL, 24, 2)
> > +FIELD(TB_FLAGS, VIRT_ENABLED, 24, 1)
> > +FIELD(TB_FLAGS, PRIV, 25, 2)
> > +FIELD(TB_FLAGS, AXL, 27, 2)
>
> Any particular reason to add these in the middle?
>
> Something to consider as a somewhat unrelated cleanup would be to add an
> eighth MMUIdx for
> MMUIdx_M + no translation.  This would be used both for MBARE and
> internally within
> get_physical_address for accessing PTEs.  See also the ptw_translate
> cleanups in
> target/i386 for atomic PTE updates (4a1e9d4d11cd).
>
> At which point PM_SIGNEXTEND can be replaced by a test vs mmu_idx, saving
> a bit in tb_flags.
>
> Something for later, anyway.
>
>
> r~
>

--000000000000e291f6060da8df51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;Any particular reason to add these in the middle?<div>=
No actual reason except for previously=C2=A0those flags were there in the m=
iddle. I&#39;ll move them to the end of the list, that sounds reasonable.</=
div><div><br></div><div>&gt;Something to consider as a somewhat unrelated c=
leanup would be to add an...<br></div><div>That&#39;s a good idea and I agr=
ee we could do it as part of future clean up.</div><div><br></div><div>Than=
ks, Richard</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">=D0=BF=D1=82, 29 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =
=D0=B2 02:33, Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lin=
aro.org">richard.henderson@linaro.org</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 12/24/23 15:48, Alexey Baturo wrote:<br=
>
&gt; From: Alexey Baturo &lt;<a href=3D"mailto:baturo.alexey@gmail.com" tar=
get=3D"_blank">baturo.alexey@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Alexey Baturo &lt;<a href=3D"mailto:baturo.alexey@gmail=
.com" target=3D"_blank">baturo.alexey@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 +++++++=
++------<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu_helper.c |=C2=A0 3 +++<br>
&gt;=C2=A0 =C2=A0target/riscv/translate.c=C2=A0 |=C2=A0 5 +++++<br>
&gt;=C2=A0 =C2=A03 files changed, 17 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index c607a94bba..038b86db4b 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -538,14 +538,17 @@ FIELD(TB_FLAGS, VILL, 14, 1)<br>
&gt;=C2=A0 =C2=A0FIELD(TB_FLAGS, VSTART_EQ_ZERO, 15, 1)<br>
&gt;=C2=A0 =C2=A0/* The combination of MXL/SXL/UXL that applies to the curr=
ent cpu mode. */<br>
&gt;=C2=A0 =C2=A0FIELD(TB_FLAGS, XL, 16, 2)<br>
&gt; -FIELD(TB_FLAGS, VTA, 18, 1)<br>
&gt; -FIELD(TB_FLAGS, VMA, 19, 1)<br>
&gt; +/* If pointer masking should be applied and address sign extended */<=
br>
&gt; +FIELD(TB_FLAGS, PM_PMM, 18, 2)<br>
&gt; +FIELD(TB_FLAGS, PM_SIGNEXTEND, 20, 1)<br>
&gt; +FIELD(TB_FLAGS, VTA, 21, 1)<br>
&gt; +FIELD(TB_FLAGS, VMA, 22, 1)<br>
&gt;=C2=A0 =C2=A0/* Native debug itrigger */<br>
&gt; -FIELD(TB_FLAGS, ITRIGGER, 20, 1)<br>
&gt; +FIELD(TB_FLAGS, ITRIGGER, 23, 1)<br>
&gt;=C2=A0 =C2=A0/* Virtual mode enabled */<br>
&gt; -FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)<br>
&gt; -FIELD(TB_FLAGS, PRIV, 22, 2)<br>
&gt; -FIELD(TB_FLAGS, AXL, 24, 2)<br>
&gt; +FIELD(TB_FLAGS, VIRT_ENABLED, 24, 1)<br>
&gt; +FIELD(TB_FLAGS, PRIV, 25, 2)<br>
&gt; +FIELD(TB_FLAGS, AXL, 27, 2)<br>
<br>
Any particular reason to add these in the middle?<br>
<br>
Something to consider as a somewhat unrelated cleanup would be to add an ei=
ghth MMUIdx for <br>
MMUIdx_M + no translation.=C2=A0 This would be used both for MBARE and inte=
rnally within <br>
get_physical_address for accessing PTEs.=C2=A0 See also the ptw_translate c=
leanups in <br>
target/i386 for atomic PTE updates (4a1e9d4d11cd).<br>
<br>
At which point PM_SIGNEXTEND can be replaced by a test vs mmu_idx, saving a=
 bit in tb_flags.<br>
<br>
Something for later, anyway.<br>
<br>
<br>
r~<br>
</blockquote></div>

--000000000000e291f6060da8df51--

