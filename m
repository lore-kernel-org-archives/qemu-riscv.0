Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5D8C001DE
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 22:02:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qT8IR-0005TG-Gp; Mon, 07 Aug 2023 18:01:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbagley@ventanamicro.com>)
 id 1qT8IN-0005SU-Lz
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 18:01:48 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbagley@ventanamicro.com>)
 id 1qT8IL-0000aS-0h
 for qemu-riscv@nongnu.org; Mon, 07 Aug 2023 18:01:46 -0400
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-406b9bcad5dso23893161cf.2
 for <qemu-riscv@nongnu.org>; Mon, 07 Aug 2023 15:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691445700; x=1692050500;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iKl9lsH1P1fo5svgWafgkJpB7I9OEKFXSUNGXWdOsJM=;
 b=f4f4wQx4mEnl4QfSNsizykkxi/l6tSMOr212pxsggTZMGpPMHesK9Au2xGy7XTVSxm
 F5VUHGVXeIGMc5oGsTF9BG9MBArDDhpxFurwvW88v0H5mzIF8wOK/QGyOVYtoOtS92at
 7JXHM82c0UhWeG+1k8eIMtHUZ3YMHHCUpEZni4YXuCuzKD2ANPhH2o5DqHaBYRTeApVw
 b+Ybryn9IfOsHA0Q/H05EZLZckzN9eV4BIVpw6fSnX0qLExYp2804wuN+orPiSq+sGmM
 TGTdNayEhIxK4GY+90qN/gsnXyLEo+YVqcXxHxWqzbY9jG0bAGgjDkWuIsx8b7YDwhVo
 KIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691445700; x=1692050500;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iKl9lsH1P1fo5svgWafgkJpB7I9OEKFXSUNGXWdOsJM=;
 b=gjqE2uLJidtHfIc3KVjY7KJOXAbE9fWsLWJYleD4j3hXTjvKSS5iPYNyvGGDM00Bie
 DiFBA1z8bIZzqDVMAreUxSiGnAj4dUkjjYbCyep3YpuXryKdmEuOebZe+9al01wHs84O
 VYYqiPFptuKqlK7Pr9OPi3nrw0o7/ftTxX6m2qOW2PiFS7xMuaiclVf2bfqlBBLql1zF
 sL5q1fuHxAynRvE13+p22kjuLU89H2ngak3/MtfwADT5dsqjawqjsBSdD5kwAV7kGcEY
 fubZiUXyokOtxhv9y1RBdDVRRnTtfvBuWCDTBma9QIKPQlPj6Q8mGm2nEi6N32g1c0rS
 duFw==
X-Gm-Message-State: AOJu0YyraXpmfg+UFrBJWTyQZvFYIKunjqC8bRG3TwRT7r11+51UsAZ4
 IKgC2Z5p6liuJkUM6vEwcM0N08rVbgG8HViR+CrMaQ==
X-Google-Smtp-Source: AGHT+IEmHqWDEuVC7sazCZxWOannpM445FAblBhXu9M7Ps8juI5u9vZgqpgGd/NgQx5zqjoXSi961Rq1kHLRMtRshOc=
X-Received: by 2002:a05:622a:148f:b0:403:a0a4:97d5 with SMTP id
 t15-20020a05622a148f00b00403a0a497d5mr8791660qtx.36.1691445699926; Mon, 07
 Aug 2023 15:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230731183320.410922-1-rbagley@ventanamicro.com>
 <4b38596d-1db6-e03f-8b42-65c4464132ab@linaro.org>
In-Reply-To: <4b38596d-1db6-e03f-8b42-65c4464132ab@linaro.org>
From: Richard Bagley <rbagley@ventanamicro.com>
Date: Mon, 7 Aug 2023 15:01:28 -0700
Message-ID: <CAARkPA_6=u6fM6F4RYC9Zdfw0iQ6sE5Zp1649gAr3_BBR-GRMg@mail.gmail.com>
Subject: Re: [PATCH] disas/riscv: Further correction to LUI disassembly
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, dbarboza@ventanamicro.com
Content-Type: multipart/alternative; boundary="00000000000019f21306025c648d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=rbagley@ventanamicro.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--00000000000019f21306025c648d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I do apologize, but I do not understand your remark at all. Could I trouble
you to spell this out.

In:
+                snprintf(tmp, sizeof(tmp), "%d", dec->imm >> 12 & 0xfffff)=
;
0xfffff is a mask which recovers the 20 bit field used to represent the
immediate in the instruction encoding.

You seem to be responding to the syntax, which is unrelated to my change.
But I did notice it is the case that both GCC and LLVM disassemblers do not
accept signed integer arguments to LUI:
lui r1, -1
but instead require
lui r1, 0xfffff
I don't see why the former is more accurate, but it would be an aid to the
assembly programmer.

I have recommended internally that if the current format cannot support
both, then it might be worthwhile to propose a pseudo instruction for RISCV
for precisely this syntax variant:
lui.s r1.-1

Richard

On Mon, Jul 31, 2023 at 1:37=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 7/31/23 11:33, Richard Bagley wrote:
> > The recent commit 36df75a0a9 corrected one aspect of LUI disassembly
> > by recovering the immediate argument from the result of LUI with a
> > shift right by 12. However, the shift right will left-fill with the
> > sign. By applying a mask we recover an unsigned representation of the
> > 20-bit field (which includes a sign bit).
>
> Why would you want that?  Surely
>
>      lui r1, -1
>
> is more accurate than
>
>      lui r1, 0xfffff
>
>
> r~
>

--00000000000019f21306025c648d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I do apologize, but I do not understand your remark at all=
. Could I trouble you to spell this out.<br><br>In:<br>+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(tmp, sizeof(tmp), &quot;%d&=
quot;, dec-&gt;imm &gt;&gt; 12 &amp; 0xfffff);<br>0xfffff is a mask which=
=C2=A0recovers the 20 bit field used to represent the immediate in the inst=
ruction encoding.<br><br>You seem to be responding to the syntax, which is =
unrelated to my change.<br>But I did notice it is the case that both GCC an=
d LLVM disassemblers do not accept signed integer arguments to LUI:<br>lui =
r1, -1<br>but instead require<br>lui r1, 0xfffff<br>I don&#39;t see why the=
 former is more accurate, but it would be an aid to the assembly programmer=
.<br><br>I have recommended internally that if the current format cannot su=
pport both, then it might be worthwhile=C2=A0to propose a pseudo instructio=
n for RISCV for precisely this syntax variant:<br>lui.s r1.-1<br><br>Richar=
d</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Mon, Jul 31, 2023 at 1:37=E2=80=AFPM Richard Henderson &lt;<a href=3D"m=
ailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 7/31/23 =
11:33, Richard Bagley wrote:<br>
&gt; The recent commit 36df75a0a9 corrected one aspect of LUI disassembly<b=
r>
&gt; by recovering the immediate argument from the result of LUI with a<br>
&gt; shift right by 12. However, the shift right will left-fill with the<br=
>
&gt; sign. By applying a mask we recover an unsigned representation of the<=
br>
&gt; 20-bit field (which includes a sign bit).<br>
<br>
Why would you want that?=C2=A0 Surely<br>
<br>
=C2=A0 =C2=A0 =C2=A0lui r1, -1<br>
<br>
is more accurate than<br>
<br>
=C2=A0 =C2=A0 =C2=A0lui r1, 0xfffff<br>
<br>
<br>
r~<br>
</blockquote></div>

--00000000000019f21306025c648d--

