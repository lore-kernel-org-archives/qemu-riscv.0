Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81465CD11BF
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 16:23:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rmcFT-0003hc-SM; Tue, 19 Mar 2024 12:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rmcFR-0003gm-O0
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 12:23:33 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1rmcFQ-00058C-27
 for qemu-riscv@nongnu.org; Tue, 19 Mar 2024 12:23:33 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d475b6609eso74047901fa.2
 for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2024 09:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1710865408; x=1711470208; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VOPGus5buVBheaWVC+qg39OBFIwOGvzJHjoIkmfz6oA=;
 b=Eg/c0tzWaiyS3xmbpDXQcBvsN1v7uGu4N6Ebn3Xl+5RJKoY+ziHGxC+ExhUTZYhO13
 pDbpSicDJoRH3Ywcq8y4/MZEj9481kinw6Wf38l/Qnp6DWgsGToOAY7fJEN+Z51U2C+m
 BVWtFNGpUlY+x0n/qom2jAHBx78GeIwdNZaPdCgw906/x+XnoKtz0KgaKfxI0eDyw2s7
 I7oceY5AWPJV7Hu+NroPm0MMjEbNB5er9Q6+4GiWdkeZM1EAvphxLxzLMFgBzI1PRist
 sk/ee2qAZvdMFqxjYPJFwl6Up16WF++lgmD1eCuW3lIlgX4deb+5Pc6BGNcIEFty5Dyb
 +LAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710865408; x=1711470208;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VOPGus5buVBheaWVC+qg39OBFIwOGvzJHjoIkmfz6oA=;
 b=jcyCdk9dvL6XpZP7EQgcVtYwn8iSTeo9ppZk/ZrM/XnNNWalBm9a2Xd+xQsNRa+pL9
 gD8zhSEoDnWZHgBSVnB4wI6C00M8EyULppss/AkUB/d0b1XuTgMPLTNQH+I7CMEM/+zp
 10RZ7cqK9gJ0S9CnrBdK23UkdHcmfJzC8T3Nb4W0wnnaZ5JP3Et58MtU6o14brQxwX5E
 GjLFgzT0QqRRP6IrQmVQxCLmlVaqO/C09QRZXQ1z0i8VInJdzXv4EhAQ4ztMcc+V+9fs
 v/CcSCsHqMowIXyKmgaYRgxwA5xb36nipV03Ls0ER/TNtOiTZb+v77DscW7liczcBwFI
 N4oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7mbFVn1zq19XqMBN1x1mKiuMvR6gUa9QgG7YObhL2oy2BU3sdOv+xSBMPBaymX45E5c7lPsScr1KIqslK+8khgReqK30=
X-Gm-Message-State: AOJu0YwYW4sdKh2DisXmeqvEckw2uYkJ1B/W7Qiu2HWK7lHLdyjBeY9c
 zFOWkUF5meZfrlZODAfODJlVMK+k7vVhcJgO6xdCmdLAOiaFNR02VnYSSkILOGeS7eVUNqI9PYx
 cB8inqMKFxu+c3KKBtdL02EcSyLPQ0pTWHugdoA==
X-Google-Smtp-Source: AGHT+IEBDopDq2wCzmXk8/Op5ka2ij9RRXRT26Qs23HjLdvxXJIDmszzUPKRPB2uFnLddeILEPjkdhHQ9rThQlCJ7Zw=
X-Received: by 2002:a05:651c:1a23:b0:2d4:a8cf:e798 with SMTP id
 by35-20020a05651c1a2300b002d4a8cfe798mr2878261ljb.14.1710865408152; Tue, 19
 Mar 2024 09:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240306170855.24341-1-jason.chien@sifive.com>
In-Reply-To: <20240306170855.24341-1-jason.chien@sifive.com>
From: Jason Chien <jason.chien@sifive.com>
Date: Wed, 20 Mar 2024 00:23:16 +0800
Message-ID: <CADr__8onmfjCtzdct2-ptXmM34h1HZVppOq=Fzi1YGigcm4ckQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] target/riscv: Support Zve32x and Zve64x extensions
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e97b3f061405e4bc"
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=jason.chien@sifive.com; helo=mail-lj1-x236.google.com
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

--000000000000e97b3f061405e4bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping. Can anyone review the patches please?

Jason Chien <jason.chien@sifive.com> =E6=96=BC 2024=E5=B9=B43=E6=9C=887=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:09=E5=AF=AB=E9=81=93=EF=BC=9A

> This patch series adds the support for Zve32x and Zvx64x and makes vector
> registers visible in GDB if any of the V/Zve*/Zvk* extensions is enabled.
>
> Jason Chien (5):
>   target/riscv: Add support for Zve32x extension
>   target/riscv: Expose Zve32x extension to users
>   target/riscv: Add support for Zve64x extension
>   target/riscv: Expose Zve64x extension to users
>   target/riscv: Relax vector register check in RISCV gdbstub
>
>  target/riscv/cpu.c                      |  4 +++
>  target/riscv/cpu_cfg.h                  |  2 ++
>  target/riscv/cpu_helper.c               |  2 +-
>  target/riscv/csr.c                      |  2 +-
>  target/riscv/gdbstub.c                  |  2 +-
>  target/riscv/insn_trans/trans_rvv.c.inc |  4 +--
>  target/riscv/tcg/tcg-cpu.c              | 33 ++++++++++++++-----------
>  7 files changed, 30 insertions(+), 19 deletions(-)
>
> --
> 2.43.2
>
>

--000000000000e97b3f061405e4bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping. Can anyone review the patches please?</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jason Chien &lt=
;<a href=3D"mailto:jason.chien@sifive.com">jason.chien@sifive.com</a>&gt; =
=E6=96=BC 2024=E5=B9=B43=E6=9C=887=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=
=8D=881:09=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">This patch series adds the support for Zve32x and Zvx=
64x and makes vector<br>
registers visible in GDB if any of the V/Zve*/Zvk* extensions is enabled.<b=
r>
<br>
Jason Chien (5):<br>
=C2=A0 target/riscv: Add support for Zve32x extension<br>
=C2=A0 target/riscv: Expose Zve32x extension to users<br>
=C2=A0 target/riscv: Add support for Zve64x extension<br>
=C2=A0 target/riscv: Expose Zve64x extension to users<br>
=C2=A0 target/riscv: Relax vector register check in RISCV gdbstub<br>
<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +++<br>
=C2=A0target/riscv/cpu_cfg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/riscv/cpu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0target/riscv/gdbstub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0target/riscv/insn_trans/trans_rvv.c.inc |=C2=A0 4 +--<br>
=C2=A0target/riscv/tcg/tcg-cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 33 ++++++++++++++-----------<br>
=C2=A07 files changed, 30 insertions(+), 19 deletions(-)<br>
<br>
-- <br>
2.43.2<br>
<br>
</blockquote></div>

--000000000000e97b3f061405e4bc--

