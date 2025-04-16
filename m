Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D44C369BA
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 08:29:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4y98-00004u-AT; Wed, 16 Apr 2025 04:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u4y92-0008Gt-45
 for qemu-riscv@nongnu.org; Wed, 16 Apr 2025 04:29:20 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1u4y8z-0008NC-ML
 for qemu-riscv@nongnu.org; Wed, 16 Apr 2025 04:29:19 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-5259327a937so2614130e0c.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Apr 2025 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1744792153; x=1745396953; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jteE/slCOTpGgvDFX4KPSwiat3jPOkuFeCsESh8Dhm4=;
 b=aUScvrhJhSCNwIRsebqD6ta7//tYyySG9OAMqeUMa4FkNj/ccnWeFUSUcoBceXFijW
 eMHFD+nXsah173g9Wx/g9MRlmzf17NYEko2rL2xlKXJdyYElXtwhvuvl1DKc9jC1VtzL
 REv5eCTw9eQK0YyulnqGUgumQl/r2QLATfw2OrmhM4ElNqSkUhccTCKjTjm+NKo3QJZn
 6NVNugdJlVUTRdwIg0JykHxsy8ubMeaGTz1tLfdM+NmJInJJlNm83q5RM+Gh0wygDTmH
 KQ/ma86c5JUr+HA84RCPQAumPHIfmrFo3m+zoqjReQEcJqGMC1EuQKyimIeIDimcpS0N
 nl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744792153; x=1745396953;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jteE/slCOTpGgvDFX4KPSwiat3jPOkuFeCsESh8Dhm4=;
 b=mEDAvLl55RvEQ2c9RYwqMdHnV/xkhBb0OTM/e82qMVSnlmIU8VSgZyJ61hPdt1+nrh
 p7kho45RBxpV7v1rwjWsorqz+zJkqxDnA9ntZm16xoL+XjrmUvcSS0SsXAioLv4jDz65
 PNMN0kZUX0JONPfIqofJPbGN+rh0mILXfEmJBp7kv9Hh51mTH5n6d+G5SeiYX+Hkk3PP
 /NsASU46AYHsT2nir8KT2URsh8JK/bptJKMfm4OPiRvxLoxgY3NxbZhCmumACDRt9W7J
 U7tWwwSmUT3aJXxCefzelaijxZ7qtyxrf1IEjUFSQjngDwnP4dImMJnSGrzOu2C1NkpV
 YApw==
X-Gm-Message-State: AOJu0YxrnsWe2L9GeDBtCtW0fad2PKtb5Bw8oWZTmjdQdCddF6hF0Agx
 qXiz5GuWRIRVJiNzcFDd8vdfIh5yzdZLUdx9gDvBz8fYZgUU7hjnqLrM7dVFR/kyXuqzu1IXRSk
 N0+qpWNqG+sX3AUS/0/4mt2nvG0jQjQKRD2fthw==
X-Gm-Gg: ASbGnctot40IE6Prmb08hPDKA6qKvpGxAAaZ1in+79GxlDLFfzhd6WlCJqrl0CKBJow
 2fk4bUBGubwdO2xlGnnY1wo7LcAZDw7OBq3SW22J0tLCcsVTFiyuMgA2RgaU7B2WdLUmjsbKaE/
 ccXGRI3xaJXtK5IiITd7xbE7hV
X-Google-Smtp-Source: AGHT+IFSg5JMhAEEpoCveXjAK3HO69F7+jtk3lCp3HgSAWfDOCYe5M+gcvy4xTcM06NVFskuUrfHIiT8cHUm12eBvHo=
X-Received: by 2002:a05:6122:2a13:b0:51f:fc9d:875d with SMTP id
 71dfb90a1353d-5290e1c8689mr302930e0c.8.1744792153574; Wed, 16 Apr 2025
 01:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250415043207.3512209-1-antonb@tenstorrent.com>
In-Reply-To: <20250415043207.3512209-1-antonb@tenstorrent.com>
From: Max Chou <max.chou@sifive.com>
Date: Wed, 16 Apr 2025 16:29:02 +0800
X-Gm-Features: ATxdqUGVngf-6a4dS2GDQDL1TXmy04zwZ2wTAHBfR4_1P7pWOGzqI_IxSCIJn9Y
Message-ID: <CANiaA1tWuvkj3L-PE6=UGaYqxPp0GP4357VPjgHFgpQOKUb_kQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix some more RVV source overlap issues
To: Anton Blanchard <antonb@tenstorrent.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.or, dbarboza@ventanamicro.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com
Content-Type: multipart/alternative; boundary="000000000000856ab80632e114cb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=max.chou@sifive.com; helo=mail-vk1-xa32.google.com
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

--000000000000856ab80632e114cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anton,

Sure, I'll check this patchset.

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

--000000000000856ab80632e114cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Anton,<br><br>Sure, I&#39;ll check this patchset.<=
br><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">Thanks,<br>Max</div></div></div><br><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 15, 2025 at 12:32=E2=80=AFPM Anton Blancha=
rd &lt;<a href=3D"mailto:antonb@tenstorrent.com">antonb@tenstorrent.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Than=
ks Max and Daniel for helping to resolve the RVV source register<br>
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

--000000000000856ab80632e114cb--

