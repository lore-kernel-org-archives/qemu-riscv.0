Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B95DC5AE59
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 07:55:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uN5RG-0008Nm-W0; Thu, 05 Jun 2025 03:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uN5RD-0008NB-Ag
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 03:54:59 -0400
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1uN5RB-0001x6-NU
 for qemu-riscv@nongnu.org; Thu, 05 Jun 2025 03:54:59 -0400
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-60634f82c77so191536eaf.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Jun 2025 00:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1749110095; x=1749714895; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HF0IElq1Rav86RADaCO6kDBYd4JFsL65+E44asCoz2g=;
 b=IYFT/bCH6DK9eWa1NtBUue8P5jYnaqnOPZdmBwtpn83GOUnwaybhCaBQ29asRgL9R4
 cVidipuKjRZCa+nZLk3nBapqFpLpmaQK7tI0JM00zawwNhTRv3wWWQ1s8agNH6SyhBxR
 yw9v4Ael7uahyHRzA9DZYBD8cNMXbwSErh9pIQW8GWyV9gBCT75eeMNEd6AGADM2AJjr
 PJQCVgdkyj6oQvkwRZspMtyB09eKpPqkPPDuTkhRXfM8mBboCt9op+D0UnxAC9Edzb5O
 dOhd0ijdDFKBJeJaxL1X/v1xJOj0Sb33yZZQ4R/3zVGvUeFFxtO3R22yaThaa9pN+eF6
 3YPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749110095; x=1749714895;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HF0IElq1Rav86RADaCO6kDBYd4JFsL65+E44asCoz2g=;
 b=NY1RwWbtOu4PpBsuhViB+9RMFx4jSKnAXVoMzQCtWTwu3mHKulKLovELrvwGZK9zeu
 XY61ZB9dMhN0MGhndBg/mQ83f119n5CHN6k3ySMLVh+SLSI4NVYXMHk/tmRPNK16Hmrp
 4oJqT0uW5C/vtD8F+r6t6vtpBrwhz/j3UuPX8JuZhZj+1C1mqNRsribKGV7wtj4ps+zj
 hQ+4RmjfZfP2FqoYJDIH7xl7VhZvzcqWVV8iOmEtJSD4MFV+huOkRzSeURpAiZ8Ie5bC
 rlO+7U6AtpehqV1RuA1iR7+lvkkkfm8Mtu0t9rjOcnsK7LnnfGPGerbwWQaXjjbJaLPt
 yDlA==
X-Gm-Message-State: AOJu0Yy2eprh6NBD6F5nVc4v9jKbX/MOo5FfkGH56rc7vmbdER/8wT6n
 2SVcb3kkgTBUm7z+OkCGbQx78pT1eOTVSs/dsrG6L4Jyt8VLo4RzxgPTwj9vXWUYFGXjXs/sJWy
 axyUHHOgLtPoI/q1wsETeXV6mLCBTLH41wdahnOd8lw==
X-Gm-Gg: ASbGncvbK7ihU9zCFKSxmH/xsgkLdaO2y5S60rAuIVKMIkLeadlZJVOn4L0RVrsVXmB
 TESZtFnE6fsJ2k4Vf56V4GDXFyHLIhOVjz+QEPRoC0iyeNA31eKcQw3akmJxRjwG7AG4ZRG9+1U
 c/gtG4am4nA6ucsF/dFos2gaTVNnQ/1x2tYy+HdnpKnuNgBg==
X-Google-Smtp-Source: AGHT+IFrqV+Cb58QumV270FOQKFCz/np/Ol8+ts5OGI/DgJRlidyMvhbdDtCfFsafceCeaBvKlcyrSqi2VLZQYK3TwY=
X-Received: by 2002:a05:6808:448c:b0:404:b5c6:46f3 with SMTP id
 5614622812f47-408f0f6d022mr5477773b6e.21.1749110095166; Thu, 05 Jun 2025
 00:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250415043207.3512209-1-antonb@tenstorrent.com>
In-Reply-To: <20250415043207.3512209-1-antonb@tenstorrent.com>
From: Max Chou <max.chou@sifive.com>
Date: Thu, 5 Jun 2025 15:54:44 +0800
X-Gm-Features: AX0GCFuSv3ynZ93ir_fSfbbTp9TkTk75sG7My18YRaWwBe1JKVZxTzJT5cMm_eY
Message-ID: <CANiaA1t2t-O3eo=EUia=6atdj0c1zp7p1h7OTAS5gCn4DBcoVg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix some more RVV source overlap issues
To: Anton Blanchard <antonb@tenstorrent.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.or, dbarboza@ventanamicro.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com
Content-Type: multipart/alternative; boundary="000000000000e553db0636ce6dd2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=max.chou@sifive.com; helo=mail-oo1-xc31.google.com
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

--000000000000e553db0636ce6dd2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anton,

I hope you=E2=80=99re doing well.

I have fixed the issue mentioned in the previous review.
And I also have some commits related to this issue.
I think it would be better to merge these fixes into this
patchset to maintain the series=E2=80=99 cohesion and keep up to date.

I can help to integrate the fixes and update this patchset.
Please let me know your thoughts, and we can discuss the details further.

Thanks,
Max


On Tue, Apr 15, 2025 at 12:32=E2=80=AFPM Anton Blanchard <antonb@tenstorren=
t.com>
wrote:

> Thanks Max and Daniel for helping to resolve the RVV source register
> overlap issues. I ran some random patterns against the Max's latest
> patch series (comparing QEMU to the Tenstorrent version of whisper)
> and spotted a couple more. Max: can you please check if the fixes I
> made look right?
>
> Anton
> --
>
> Anton Blanchard (3):
>   target/riscv: rvv: Apply vext_check_input_eew to vector integer/fp
>     compare instructions
>   target/riscv: rvv: Apply vext_check_input_eew to vector reduction
>     instructions
>   target/riscv: vadc and vsbc are vm=3D0 instructions
>
>  target/riscv/insn32.decode              | 10 +++++-----
>  target/riscv/insn_trans/trans_rvv.c.inc | 23 +++++++++++++----------
>  2 files changed, 18 insertions(+), 15 deletions(-)
>
> --
> 2.34.1
>
>

--000000000000e553db0636ce6dd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Anton,<br><br>I hope you=E2=80=99re doing well.<br=
><br>I have fixed the issue mentioned in the previous review.<br>And I also=
 have some commits related to this issue.<br>I think it would be better to =
merge these fixes into this<br>patchset to maintain the series=E2=80=99 coh=
esion and keep up to date.<br><br>I can help to integrate the fixes and upd=
ate this patchset.<br>Please let me know your thoughts, and we can discuss =
the details further.<br><br>Thanks,<br>Max</div><br></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Apr 15, 2025 at 12:32=E2=80=AFPM Anton Blanchard &lt;<a href=3D"mail=
to:antonb@tenstorrent.com">antonb@tenstorrent.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);pa=
dding-left:1ex">Thanks Max and Daniel for helping to resolve the RVV source=
 register<br>
overlap issues. I ran some random patterns against the Max&#39;s latest<br>
patch series (comparing QEMU to the Tenstorrent version of whisper)<br>
and spotted a couple more. Max: can you please check if the fixes I<br>
made look right?<br>
<br>
Anton<br>
--<br>
<br>
Anton Blanchard (3):<br>
=C2=A0 target/riscv: rvv: Apply vext_check_input_eew to vector integer/fp<b=
r>
=C2=A0 =C2=A0 compare instructions<br>
=C2=A0 target/riscv: rvv: Apply vext_check_input_eew to vector reduction<br=
>
=C2=A0 =C2=A0 instructions<br>
=C2=A0 target/riscv: vadc and vsbc are vm=3D0 instructions<br>
<br>
=C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 10 +++++-----<br>
=C2=A0target/riscv/insn_trans/trans_rvv.c.inc | 23 +++++++++++++----------<=
br>
=C2=A02 files changed, 18 insertions(+), 15 deletions(-)<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000e553db0636ce6dd2--

