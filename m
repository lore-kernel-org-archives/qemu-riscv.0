Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5511BC48BC3
	for <qemu-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 13:39:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1raFTW-0003k4-9o; Wed, 14 Feb 2024 08:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1raFTO-0003iz-EA
 for qemu-riscv@nongnu.org; Wed, 14 Feb 2024 08:38:51 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1raFTM-0000cb-Ht
 for qemu-riscv@nongnu.org; Wed, 14 Feb 2024 08:38:50 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2906bcae4feso3057630a91.3
 for <qemu-riscv@nongnu.org>; Wed, 14 Feb 2024 05:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1707917926; x=1708522726; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=88xKq0wkGLUFQjKkvYcT3YmSACkZlxHWw1NwdnlwqF8=;
 b=ZEJ8+oINz0Vzi1N08hh4WaXKNF8489jMNXpAMYYIMk+TW8E4Bx9qx8qw146UIqmswu
 vIBM/oFuqSM3VKdg2nR3kzn5wek+TDakqix7D8xFWGaGQfOuPRukMqM9wZdqlJ8jZcri
 8qPnyzM60pNdGEFeuD/afgYymJlRTv4k5NkLGbPBkKqvT7MxraHEtjBPPz6ED8iwUQWP
 hBveucsFZktWgVD7MtXo4DG1od2ELfkKJZKxNT95Gv325bYF+2mQ7TSDK8hzVGroflNG
 7vQ7yZ7Zr1V4DEUAtw1FVVI4bSm625AsbA/iSRf2LOI2+KYKfYEWQfKFd2jRkBTkIq6L
 mo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707917926; x=1708522726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=88xKq0wkGLUFQjKkvYcT3YmSACkZlxHWw1NwdnlwqF8=;
 b=TJt9Mo9pH0/3Ks4eKO6GPT6kwWj05MdzwpC0xXGw1NPpC4ONCir6c/dK1cg1w1oCw5
 VA9/az1M4PXgtgKaBVHYWk7aKbWUKbBkZqc45zvXuJuoHsrSG/G4jMPqCzzRRwj7gZUf
 bGqiSiXIaPc6NBZ617e/ZcRE+eC7J4u1FY3y17uU717htAYHHhY3eGOkmPar/zov713d
 C9KkOk3rPNfJmyOx3k49socMnerLDDQnBBX1/ruP3gXuTU4SBZvB8wa3gTNlXwCP6Y7b
 Yi0oWmhbSB5Zc0G/JNHYBNlJc8gKNtnbA+fTHTMgN1z2i5akwwM2G8DqlmPpeqCSO3Sg
 YdZg==
X-Gm-Message-State: AOJu0YwgqxtTD4HIfmgoC8s9+YcZRR1jcuytcF1mSuNDYeneyHOh6Brc
 hZkd6UkCoRd5h4nSac2dnqGj1iJW6vYWTLYkuLYN7ZIrPmUKQGiDyNmqfH8zz/p9sIDS5/irdlo
 ThtkN+Q1WZsJ5ep/x+08h684kTVn7B36hYp87rQ==
X-Google-Smtp-Source: AGHT+IHHMkuGIYakqstjCj+md/zvQMSLYi2ZFzsXcyLwXYH9TfXWhJEuFVrdyHIsgFQ3eWWqsHUqGjQHKZHRD8930sI=
X-Received: by 2002:a17:90b:351:b0:298:ba30:789b with SMTP id
 fh17-20020a17090b035100b00298ba30789bmr2390599pjb.32.1707917925886; Wed, 14
 Feb 2024 05:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20240207122256.902627-1-christoph.muellner@vrull.eu>
 <3da767e4-26f8-4c92-a241-4111c2befdc2@ventanamicro.com>
In-Reply-To: <3da767e4-26f8-4c92-a241-4111c2befdc2@ventanamicro.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Wed, 14 Feb 2024 14:38:34 +0100
Message-ID: <CAEg0e7jXdfViUSaRc2+6WNtTY37_NhbsuxjPMw4YhQ24-HD3tg@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: Add Ztso extension
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-pj1-x102b.google.com
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

On Wed, Feb 14, 2024 at 2:35=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 2/7/24 09:22, Christoph M=C3=BCllner wrote:
> > The first patch of this series picks up an earlier v2 Ztso patch from P=
almer,
> > which can be found here:
> >    https://patchwork.kernel.org/project/qemu-devel/patch/20220917072635=
.11616-1-palmer@rivosinc.com/
> > This patch did not apply cleanly but the necessary changes were trivial=
.
> > There was a request to extend the commit message, which is part of the
> > posted patch of this series.  As this patch was reviewed a year ago,
> > I believe it could be merged.
> >
> > The second patch simply exposes Ztso via hwprobe.
>
> It's also worth mentioning that the second patch relies on:
>
> "[PATCH 0/2] linux-user/riscv: Sync hwprobe keys with kernel"
>
> To be applied beforehand.

Indeed! Therefore, the end of the cover letter contains the following parag=
raph:
"""
This series is based on today's riscv-to-apply.next with my other series
that adds the new hwprobe keys
(https://lists.gnu.org/archive/html/qemu-devel/2024-02/msg01293.html).
"""

To ease reviewing and testing for others, I've also created a remote
branch on GitHub.

Thanks for reviewing!

>
>
>
> Thanks,
>
> Daniel
>
>
> >
> > Relevant in this context might be also, that Richard's patch to improve
> > TCG's memory barrier selection depending on host and guest memory order=
ing
> > landed in June 2023:
> >    https://lore.kernel.org/all/a313b36b-dcc1-f812-ccbd-afed1cbd523b@lin=
aro.org/T/
> >
> > The first patch was already sent as part of an RFC series for Ssdtso:
> >    https://lists.nongnu.org/archive/html/qemu-devel/2023-11/msg02962.ht=
ml
> > Since I don't want to keep this patch until the ratification of Ssdtso,
> > I would like to get this merged independent of Ssdtso.
> >
> > This series is based on today's riscv-to-apply.next with my other serie=
s
> > that adds the new hwprobe keys
> > (https://lists.gnu.org/archive/html/qemu-devel/2024-02/msg01293.html).
> >
> > This series can also be found here:
> >    https://github.com/cmuellner/qemu/tree/ztso
> >
> > Christoph M=C3=BCllner (1):
> >    linux-user/riscv: Add Ztso extension to hwprobe
> >
> > Palmer Dabbelt (1):
> >    RISC-V: Add support for Ztso
> >
> >   linux-user/syscall.c                    |  3 +++
> >   target/riscv/cpu.c                      |  2 ++
> >   target/riscv/cpu_cfg.h                  |  1 +
> >   target/riscv/insn_trans/trans_rva.c.inc | 11 ++++++++---
> >   target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++--
> >   target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++++++++++++++
> >   target/riscv/translate.c                |  3 +++
> >   7 files changed, 51 insertions(+), 5 deletions(-)
> >

