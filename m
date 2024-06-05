Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD372C25B76
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 06:54:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sEkXW-0000Mu-7k; Wed, 05 Jun 2024 02:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sEkXU-0000Ma-PI
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 02:54:28 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1sEkXS-0004wI-Ps
 for qemu-riscv@nongnu.org; Wed, 05 Jun 2024 02:54:28 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5295e488248so6702104e87.2
 for <qemu-riscv@nongnu.org>; Tue, 04 Jun 2024 23:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1717570464; x=1718175264; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uBwcSOZYh/4MTPhOsMtm0h2mC+vZOF2zoXnL2tTnJSU=;
 b=lPt/RcSuF23PbDFgaf5E/4F5kXaFkvA+vz8X1LkB1sH8Bfqdt5VCx5h9/mM6kfFrIu
 QkjRDvPe+Nb+4L0rn8IU4oQm82S/itYCYM8+F/dh/pDBpHPNR1JYEaPhKhQfnmzTqRPH
 PVkllsJKdPLvkLdBST+ljzkAX4GqNM4zmHWE6iq2/YAZFJ0r0INcE2EvU+HpHIY956ai
 Hf9Lg/K8ewXhOXR3rrGvA64Pi+ulTQWtVnOwnNAhU2PYlCtxw6UmjgF+VOgv04lMW9UN
 UyeUk7SqB1jWd3YCSMH7MHiSdweTfZ4kLejwM7mvd3vaDPHIZPQt3WYy3gfkrfO2qPOK
 ZHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717570464; x=1718175264;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uBwcSOZYh/4MTPhOsMtm0h2mC+vZOF2zoXnL2tTnJSU=;
 b=VeEyqfhHAuLvCIgyM4t64NOylVjKhnILvOvyTTYZQaF0SHLpzCQHm83UM35mu3+RrG
 3SgEvEot4TcL3CSyRKu9RCT67hFb0Q1ssArKDi2pW8GDgD2fayOZ5mf716RwtF/Ctq1q
 C33TdSICC5UiWF65Jl+1JEgmFP8+/6WhOiNui1ys/i0/UbOI1Gta9EvtOgwenZl2g+EW
 gIuKhkXFysxULptiWVlg6DvcAz7Gtbs0LMxncNzrZ5QC1MPTbWTdC13NcQ6oL0AzPFUA
 QTovqV594aNZVnDfr3Tk3vYt2PvoVAIFYNQsc1DmdsYjxYhfGszQB2f9+0EM1EnPs5sM
 S//g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPRV2KmLMo3rrIsjhN9nrLW+O+Z3EbiCHEAAniW2mTEj24BBxWlPPDmipFGCZEacmeg7cgDSP/G+dt5twrMDERJc8E4hU=
X-Gm-Message-State: AOJu0YyQyCXbzTW9OYFR1RO8kzIQmjLmMm2C/gTowvxtxBvdPXoHH/la
 iiqLvstqPQO7a4mjh2EyZv7n19H+AFdvcVgLCPF4bEaVpFs3/9I/EyQraAyI9PEn3/sOInqivhJ
 4naA=
X-Google-Smtp-Source: AGHT+IG+6Jl6UVPkMUko9rnz4iGpJroOedZNvkKskbNDxb6hTFb4NTspdmGjpTc5IuFTre4Wh1aQEg==
X-Received: by 2002:a05:6512:21c7:b0:52b:8909:58b0 with SMTP id
 2adb3069b0e04-52bab4fc5bamr711530e87.52.1717570464435; 
 Tue, 04 Jun 2024 23:54:24 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d828a1sm1684103e87.221.2024.06.04.23.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 23:54:24 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2eab0bc74cdso35814711fa.3; 
 Tue, 04 Jun 2024 23:54:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWTNxSTkEJExjA+0CWxlEUyN1NJoSjgS2YWtwRdxkxb6AYqgedmbwqv4xH6jZZ/IZ/hw1xh4ygXklUQU5tPjeAi4RGmHK0=
X-Received: by 2002:a2e:2a06:0:b0:2df:c2b:8c84 with SMTP id
 38308e7fff4ca-2eac79baa50mr7512771fa.1.1717570463920; Tue, 04 Jun 2024
 23:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240603060522.2180-1-frank.chang@sifive.com>
In-Reply-To: <20240603060522.2180-1-frank.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 5 Jun 2024 14:54:12 +0800
X-Gmail-Original-Message-ID: <CANzO1D3xmGRrCfTFUQ4550WYkJes4AMV1_Q+bDkD0Wp+KwUuDg@mail.gmail.com>
Message-ID: <CANzO1D3xmGRrCfTFUQ4550WYkJes4AMV1_Q+bDkD0Wp+KwUuDg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Introduce extension implied rules
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000610538061a1f092d"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x134.google.com
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

--000000000000610538061a1f092d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patchset resend:
https://lists.gnu.org/archive/html/qemu-riscv/2024-06/msg00130.html


<frank.chang@sifive.com> =E6=96=BC 2024=E5=B9=B46=E6=9C=883=E6=97=A5 =E9=80=
=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:07=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Frank Chang <frank.chang@sifive.com>
>
> Currently, the implied extensions are enabled and checked in
> riscv_cpu_validate_set_extensions(). However, the order of enabling the
> implied extensions must follow a strict sequence, which is error-prone.
>
> This patchset introduce extension implied rule helpers to enable the
> implied extensions. This also eliminates the old-fashioned ordering
> requirement. For example, Zvksg implies Zvks, Zvks implies Zvksed, etc.,
> removing the need to check the implied rules of Zvksg before Zvks.
>
> The idea [1] and the implied rules [2] are referenced from LLVM.
>
> [1]
> https://github.com/llvm/llvm-project/blob/main/llvm/lib/TargetParser/RISC=
VISAInfo.cpp#L875
> [2]
> https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISC=
VFeatures.td
>
> Frank Chang (6):
>   target/riscv: Introduce extension implied rules definition
>   target/riscv: Introduce extension implied rule helpers
>   target/riscv: Add MISA implied rules
>   target/riscv: Add standard extension implied rules
>   target/riscv: Add Zc extension implied rule
>   target/riscv: Remove extension auto-update check statements
>
>  target/riscv/cpu.c         | 396 +++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h         |  17 ++
>  target/riscv/tcg/tcg-cpu.c | 233 +++++++++++-----------
>  3 files changed, 531 insertions(+), 115 deletions(-)
>
> --
> 2.43.2
>
>
>

--000000000000610538061a1f092d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patchset resend: <a href=3D"https://lists.gnu.org/archive/=
html/qemu-riscv/2024-06/msg00130.html">https://lists.gnu.org/archive/html/q=
emu-riscv/2024-06/msg00130.html</a></div><br><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">&lt;<a href=3D"mailto:frank.chang@si=
five.com">frank.chang@sifive.com</a>&gt; =E6=96=BC 2024=E5=B9=B46=E6=9C=883=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:07=E5=AF=AB=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Frank =
Chang &lt;<a href=3D"mailto:frank.chang@sifive.com" target=3D"_blank">frank=
.chang@sifive.com</a>&gt;<br>
<br>
Currently, the implied extensions are enabled and checked in<br>
riscv_cpu_validate_set_extensions(). However, the order of enabling the<br>
implied extensions must follow a strict sequence, which is error-prone.<br>
<br>
This patchset introduce extension implied rule helpers to enable the<br>
implied extensions. This also eliminates the old-fashioned ordering<br>
requirement. For example, Zvksg implies Zvks, Zvks implies Zvksed, etc.,<br=
>
removing the need to check the implied rules of Zvksg before Zvks.<br>
<br>
The idea [1] and the implied rules [2] are referenced from LLVM.<br>
<br>
[1] <a href=3D"https://github.com/llvm/llvm-project/blob/main/llvm/lib/Targ=
etParser/RISCVISAInfo.cpp#L875" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/llvm/llvm-project/blob/main/llvm/lib/TargetParser/RISCVISAInfo=
.cpp#L875</a><br>
[2] <a href=3D"https://github.com/llvm/llvm-project/blob/main/llvm/lib/Targ=
et/RISCV/RISCVFeatures.td" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVFeatures.td<=
/a><br>
<br>
Frank Chang (6):<br>
=C2=A0 target/riscv: Introduce extension implied rules definition<br>
=C2=A0 target/riscv: Introduce extension implied rule helpers<br>
=C2=A0 target/riscv: Add MISA implied rules<br>
=C2=A0 target/riscv: Add standard extension implied rules<br>
=C2=A0 target/riscv: Add Zc extension implied rule<br>
=C2=A0 target/riscv: Remove extension auto-update check statements<br>
<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 396 +++++++++++=
++++++++++++++++++++++++++<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 ++<br>
=C2=A0target/riscv/tcg/tcg-cpu.c | 233 +++++++++++-----------<br>
=C2=A03 files changed, 531 insertions(+), 115 deletions(-)<br>
<br>
--<br>
2.43.2<br>
<br>
<br>
</blockquote></div>

--000000000000610538061a1f092d--

