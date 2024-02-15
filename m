Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A8AC4829E
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 09:54:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1raYRB-0000zl-AX; Thu, 15 Feb 2024 04:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1raYR8-0000yo-LC
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 04:53:47 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1raYR6-0001Ho-92
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 04:53:46 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-298c1751c3dso1260220a91.0
 for <qemu-riscv@nongnu.org>; Thu, 15 Feb 2024 01:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1707990823; x=1708595623; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eewb5I8JdxnEn0R50o8UCVbwc+VildJXqxf4QSBtHt8=;
 b=HJOEjg/yX/ZY9nDi48JxbknU4k2DGVLwApctyo2G7mm/J8W9HoeAFKGhbTJ8tcsI0O
 NyktocIplWawWP3GtApgEB6Xrom8bD8Gu1R/lx7TF/XpOOB8JyDov83bEurUNJ6vTn4g
 BVDQjeiYeK8NbUpFslkjR2qyMr5IdMQ4rBQI2p4iVnoy5HpnxRBqz7lQIuFFBFaQY5bw
 +vO76VK/bQCeYxWqeUb1qSSV7wypxAtUj7uuemzwRkgKzCOF58bODsbhQX0WqUFQ6cIX
 FSQqf+GVDL+nUkQphu4KxrWxbGvBfGDtFxsIesm3zVsUgUGCzmqLcNrZUgTgYYzBXa3P
 HCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707990823; x=1708595623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eewb5I8JdxnEn0R50o8UCVbwc+VildJXqxf4QSBtHt8=;
 b=hAzAMuGKRNDLuaaj7Sftn7mK3MhGUax2xwvbCevv9xi3b8Fy1OAJz5r4426L/6aKEn
 ZMpEnziNVX4moaAmsDhAi422yHH1dFW6YvSdwLspume0HEy/tJOtRIl0h170elxRKJPC
 5FAhiTfguCAOdeVY9EZeYuxS+oDQnRVezBSnc4Q9kwfP5Sv754512PlCK0Naqv6Fdpve
 wPZkDWT6voalc4SVBjH2jn1dUPxEx8TVnLpKOfCYVK0obI4PXzyTobtN9MXWoS3GUIop
 yc9H4ElrzyKA6xKy8spr1YlPJPspd2hyGvkSshUoEPTnN9vodnjQBUSCWKX7SSJVrhp2
 xUhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBxR73bL3vvju7yF9ZgDDBdaAHRIXalVfVC2PSmyLcm1EsjMW3mAvlru9Ua/LwotQh4iXCFmZ/sjfLtF6aQ94RLrzSRQQ=
X-Gm-Message-State: AOJu0Yz+aoob2P7FL4kM/tdsIetk+c72siUIrOVJPoKSAEMBNXgZch2S
 8zjXl21VunazNAsw+VI7vAz6o5yeKpzsRvOPzUq3Uvar4MhyFroFNrGSVvvoBNcVvcYbuadLWga
 81q+pe7ck4KOwukm+J23kqGkObqwyzmvskaEnIw==
X-Google-Smtp-Source: AGHT+IGJqgsjjrxeCfBwG9RQGdHAiqd4tBBa1Dcm00uwiwjLfJYogs/NsYvSRFfYtLdM2uPTphtuNbab4iEMOfTINfs=
X-Received: by 2002:a17:90b:3658:b0:299:1a41:da46 with SMTP id
 nh24-20020a17090b365800b002991a41da46mr596193pjb.23.1707990822744; Thu, 15
 Feb 2024 01:53:42 -0800 (PST)
MIME-Version: 1.0
References: <20240207122256.902627-1-christoph.muellner@vrull.eu>
 <3da767e4-26f8-4c92-a241-4111c2befdc2@ventanamicro.com>
 <CAEg0e7jXdfViUSaRc2+6WNtTY37_NhbsuxjPMw4YhQ24-HD3tg@mail.gmail.com>
 <20240214-3d00860c6586b83fb7c5755d@orel>
In-Reply-To: <20240214-3d00860c6586b83fb7c5755d@orel>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 15 Feb 2024 10:53:31 +0100
Message-ID: <CAEg0e7jEvECjSSo+b4hJd9Bjg9Hk=nknmxAvDUHCk70caqqTng@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: Add Ztso extension
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, Feb 14, 2024 at 5:25=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Wed, Feb 14, 2024 at 02:38:34PM +0100, Christoph M=C3=BCllner wrote:
> > On Wed, Feb 14, 2024 at 2:35=E2=80=AFPM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> > >
> > >
> > >
> > > On 2/7/24 09:22, Christoph M=C3=BCllner wrote:
> > > > The first patch of this series picks up an earlier v2 Ztso patch fr=
om Palmer,
> > > > which can be found here:
> > > >    https://patchwork.kernel.org/project/qemu-devel/patch/2022091707=
2635.11616-1-palmer@rivosinc.com/
> > > > This patch did not apply cleanly but the necessary changes were tri=
vial.
> > > > There was a request to extend the commit message, which is part of =
the
> > > > posted patch of this series.  As this patch was reviewed a year ago=
,
> > > > I believe it could be merged.
> > > >
> > > > The second patch simply exposes Ztso via hwprobe.
> > >
> > > It's also worth mentioning that the second patch relies on:
> > >
> > > "[PATCH 0/2] linux-user/riscv: Sync hwprobe keys with kernel"
> > >
> > > To be applied beforehand.
> >
> > Indeed! Therefore, the end of the cover letter contains the following p=
aragraph:
> > """
> > This series is based on today's riscv-to-apply.next with my other serie=
s
> > that adds the new hwprobe keys
> > (https://lists.gnu.org/archive/html/qemu-devel/2024-02/msg01293.html).
> > """
>
> I think a line like
>
> Based-on: 20240207115926.887816-1-christoph.muellner@vrull.eu
>
> in the cover letter would allow the automated tools to green-light this
> series too.

Should I resend?

>
> Thanks,
> drew
>
>
> >
> > To ease reviewing and testing for others, I've also created a remote
> > branch on GitHub.
> >
> > Thanks for reviewing!
> >
> > >
> > >
> > >
> > > Thanks,
> > >
> > > Daniel
> > >
> > >
> > > >
> > > > Relevant in this context might be also, that Richard's patch to imp=
rove
> > > > TCG's memory barrier selection depending on host and guest memory o=
rdering
> > > > landed in June 2023:
> > > >    https://lore.kernel.org/all/a313b36b-dcc1-f812-ccbd-afed1cbd523b=
@linaro.org/T/
> > > >
> > > > The first patch was already sent as part of an RFC series for Ssdts=
o:
> > > >    https://lists.nongnu.org/archive/html/qemu-devel/2023-11/msg0296=
2.html
> > > > Since I don't want to keep this patch until the ratification of Ssd=
tso,
> > > > I would like to get this merged independent of Ssdtso.
> > > >
> > > > This series is based on today's riscv-to-apply.next with my other s=
eries
> > > > that adds the new hwprobe keys
> > > > (https://lists.gnu.org/archive/html/qemu-devel/2024-02/msg01293.htm=
l).
> > > >
> > > > This series can also be found here:
> > > >    https://github.com/cmuellner/qemu/tree/ztso
> > > >
> > > > Christoph M=C3=BCllner (1):
> > > >    linux-user/riscv: Add Ztso extension to hwprobe
> > > >
> > > > Palmer Dabbelt (1):
> > > >    RISC-V: Add support for Ztso
> > > >
> > > >   linux-user/syscall.c                    |  3 +++
> > > >   target/riscv/cpu.c                      |  2 ++
> > > >   target/riscv/cpu_cfg.h                  |  1 +
> > > >   target/riscv/insn_trans/trans_rva.c.inc | 11 ++++++++---
> > > >   target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++--
> > > >   target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++++++++++++++
> > > >   target/riscv/translate.c                |  3 +++
> > > >   7 files changed, 51 insertions(+), 5 deletions(-)
> > > >

