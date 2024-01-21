Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972B1C47422
	for <qemu-riscv@archiver.kernel.org>; Sun, 21 Jan 2024 07:14:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRS20-0001tg-Ap; Sun, 21 Jan 2024 02:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rRS1y-0001sq-Cw; Sun, 21 Jan 2024 02:14:10 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1rRS1w-0000lA-IY; Sun, 21 Jan 2024 02:14:10 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5578485fc0eso2059358a12.1; 
 Sat, 20 Jan 2024 23:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705821246; x=1706426046; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wHlpOcv02DwrrX6WvncuMRoVIQ5OQyEnOP0Kgmns+98=;
 b=m66WnaHaDONsllXvHMc1jC1RNRAg4EVD1Mo/BjyC/3fnJtpTgQm/z/XEUaPhfu5vWW
 RGDH3b0dFLUubBvKDc8aX4yEgudkC3YvaTevIAAgRPNTKWTPPEbwaJEGFNexrAKCA2b8
 KN+pNJNbfIHTAtbXqK3ZFfVvFY/jO1+IhHUzpV/7ko8rezk+y5Ob8zZgNJtdcdzqj3L4
 Jw6IJmbwnrYvsQJ7JAeeus4I/AJmODmjV857Ujym8VOjP/CesRG8qYnSCP+zxtDUdH3K
 SsLQTsbfZgs4WY93uQoiSoXGj1XkSbr49mXu/wI2UzgeWOEN8d1rXiIalFdruG1wf1vk
 a3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705821246; x=1706426046;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wHlpOcv02DwrrX6WvncuMRoVIQ5OQyEnOP0Kgmns+98=;
 b=bSwR2XR7VcckEEXtOYhyvIxp+kOJ3D7X+8B2HXhaIQJE/kx4pfPTo2sDO1t11E7LOO
 4nYXYjIm4QGVIgHvn9uZ0S4/drIQKm4U9/jsHiIZrKoVVp31fWDA+7dWOz4j+20Tk6ly
 hg6U9Y/IMkxn/Nxz4RmhnBUI+o6KjmlNh5BAsgxPlXnel+61iMDn4uCy97OedRDQnZ2l
 bvASEjE8n0euF4D8yo3JX4qn9jAz0ie8r/ZtIQR/g/qZgsDUgHXBs4T2RW4+drspyO3a
 f1IwaJadF4DfhztUo/lTCpOcMejyxJbRUAQaAkyXoRHIruA8/D2c+/NVmL7tQNZQ1l1q
 cxmQ==
X-Gm-Message-State: AOJu0YyuvN2TazGiz1E8+oPTjyqhCkKnRA8YMG0BpdIx7Vp09zno9CLy
 ja227kRUfGKFHmM/1uLrf9WkE2x5tnEYLbMc04PwYfSRjQ5RYm/aQ1FnDFDfW2X66Hz7dSSCDro
 xp9u94Xe0rzsnPqx8cTe6+2HN5vY=
X-Google-Smtp-Source: AGHT+IGu+XNmCR16hb6YCOeQpnuYPdTDQ278fIdj65a7GYeQmPxy+HPWJ+/agUSY5sKjTix4G6jkk9SXolvFbQp0uIQ=
X-Received: by 2002:a05:6402:50d3:b0:55a:c0e7:1e03 with SMTP id
 h19-20020a05640250d300b0055ac0e71e03mr1029655edb.71.1705821246061; Sat, 20
 Jan 2024 23:14:06 -0800 (PST)
MIME-Version: 1.0
References: <20240109102930.405323-1-me@deliversmonkey.space>
 <20240109102930.405323-4-me@deliversmonkey.space>
 <CAKC1njSLR614zQk0_DAgYN1jjdg=0eUa7N1AEwwXZVNN6BwjmA@mail.gmail.com>
 <3cb918ca-27cd-4f1e-8738-306dc5280f42@linaro.org>
 <CAKC1njRXPi1Roch=T+NwQk-TOzN=gSjmPh2KCVsemKdex9CamA@mail.gmail.com>
 <5b6571d3-f654-488d-9dc5-0d18ba542e05@linaro.org>
In-Reply-To: <5b6571d3-f654-488d-9dc5-0d18ba542e05@linaro.org>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Sun, 21 Jan 2024 10:13:54 +0300
Message-ID: <CAFukJ-Cf51kS17BOCkuPpxGXS+h4-MENKqBH5EW7Bj0mz+KPRQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] target/riscv: Add helper functions to calculate
 current number of masked bits for pointer masking
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Deepak Gupta <debug@rivosinc.com>, zhiwei_liu@linux.alibaba.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006c00b1060f6f754f"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x533.google.com
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

--0000000000006c00b1060f6f754f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Having the feature to run binaries with pointer masking on qemu-user is
really nice, but I see this patch series as an initial support.
Obviously there'll be more patches and fixes for pointer masking as soon as
arch tests are ready.
I suggest supporting qemu-user in the next patches, but make sure we do
this before claiming 100% support for pointer masking.
@Deepak Gupta <debug@rivosinc.com> what do you think?

Thanks

=D1=81=D0=B1, 20 =D1=8F=D0=BD=D0=B2. 2024=E2=80=AF=D0=B3. =D0=B2 10:37, Ric=
hard Henderson <richard.henderson@linaro.org
>:

> On 1/19/24 09:40, Deepak Gupta wrote:
> > On Thu, Jan 18, 2024 at 12:50=E2=80=AFPM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >> At some point pointer masking will be in hardware, and the kernel will
> gain support for
> >> it, and there will likely be a prctl() added for it.  At the point the
> kernel finalizes
> >> the API, you will be able to enable pointer masking for qemu-user.
> >
> > I am sure I am missing some important detail here, BUT...
> >
> > How is it different from aarch64 "top byte ignore".
>
> It is very similar, yes.
>
> > I think commit: 16c8497 enables top byte ignore for user pointers and
> > by default for qemu-user for aarch64 target.
>
> Not quite, no.
>
> commit 0e0c030c681730f3ec55ba3b223b608a8f3e8282
> Author: Richard Henderson <richard.henderson@linaro.org>
> Date:   Fri Feb 12 10:48:51 2021 -0800
>
>      linux-user/aarch64: Implement PR_TAGGED_ADDR_ENABLE
>
> is more relevant.
>
> > IIRC, user <--> kernel abi is only needed for pointers that are passed
> > to the kernel.
>
> It is also needed to *enable* pointer masking at all.
>
> For aarch64, TBI has been enabled for user-space since the beginning, but
> that is not true
> for riscv.  Therefore there will be a need for a syscall to opt in and
> enable pointer masking.
>
> > And in the case of qemu-user, we are talking about the host kernel.
>
> No, we are not.  We are always emulating the guest kernel.
>
>
> r~
>

--0000000000006c00b1060f6f754f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Having the feature to run binaries =
with pointer masking on qemu-user is really nice, but I see this patch seri=
es as an initial support.</div><div>Obviously there&#39;ll be more patches =
and fixes for pointer=C2=A0masking as soon as arch tests are ready.</div><d=
iv>I suggest supporting qemu-user in the next patches, but make sure we do =
this before claiming 100% support for pointer masking.</div><div><a class=
=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D"mailto:debug@rivosinc.c=
om" tabindex=3D"-1">@Deepak Gupta</a>=C2=A0what do you think?<br></div><div=
><br></div><div>Thanks</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">=D1=81=D0=B1, 20 =D1=8F=D0=BD=D0=B2. 2024=E2=
=80=AF=D0=B3. =D0=B2 10:37, Richard Henderson &lt;<a href=3D"mailto:richard=
.henderson@linaro.org">richard.henderson@linaro.org</a>&gt;:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On 1/19/24 09:40, Deepak Gupta=
 wrote:<br>
&gt; On Thu, Jan 18, 2024 at 12:50=E2=80=AFPM Richard Henderson<br>
&gt; &lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_blank">=
richard.henderson@linaro.org</a>&gt; wrote:<br>
&gt;&gt; At some point pointer masking will be in hardware, and the kernel =
will gain support for<br>
&gt;&gt; it, and there will likely be a prctl() added for it.=C2=A0 At the =
point the kernel finalizes<br>
&gt;&gt; the API, you will be able to enable pointer masking for qemu-user.=
<br>
&gt; <br>
&gt; I am sure I am missing some important detail here, BUT...<br>
&gt; <br>
&gt; How is it different from aarch64 &quot;top byte ignore&quot;.<br>
<br>
It is very similar, yes.<br>
<br>
&gt; I think commit: 16c8497 enables top byte ignore for user pointers and<=
br>
&gt; by default for qemu-user for aarch64 target.<br>
<br>
Not quite, no.<br>
<br>
commit 0e0c030c681730f3ec55ba3b223b608a8f3e8282<br>
Author: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.or=
g" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
Date:=C2=A0 =C2=A0Fri Feb 12 10:48:51 2021 -0800<br>
<br>
=C2=A0 =C2=A0 =C2=A0linux-user/aarch64: Implement PR_TAGGED_ADDR_ENABLE<br>
<br>
is more relevant.<br>
<br>
&gt; IIRC, user &lt;--&gt; kernel abi is only needed for pointers that are =
passed<br>
&gt; to the kernel.<br>
<br>
It is also needed to *enable* pointer masking at all.<br>
<br>
For aarch64, TBI has been enabled for user-space since the beginning, but t=
hat is not true <br>
for riscv.=C2=A0 Therefore there will be a need for a syscall to opt in and=
 enable pointer masking.<br>
<br>
&gt; And in the case of qemu-user, we are talking about the host kernel.<br=
>
<br>
No, we are not.=C2=A0 We are always emulating the guest kernel.<br>
<br>
<br>
r~<br>
</blockquote></div>

--0000000000006c00b1060f6f754f--

