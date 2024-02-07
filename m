Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E98C4828D
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 11:59:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rXgZy-0008QB-WB; Wed, 07 Feb 2024 06:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1rXgZv-0008Pk-VN
 for qemu-riscv@nongnu.org; Wed, 07 Feb 2024 06:59:01 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1rXgZu-0008G9-3J
 for qemu-riscv@nongnu.org; Wed, 07 Feb 2024 06:58:59 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-290b37bb7deso411263a91.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Feb 2024 03:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1707307136; x=1707911936; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6f7k1ITIn46WhQRbg6AUapNlOS7yCFi0qL4EED+7Ah4=;
 b=nCBk/O7DTVnuTRKnvDKWHaZ+ow+O5yxOrS1ptVvT1JUh1z/gtmGGCqyBvPNiMX7WZD
 s2Yw/04smK4CKpP8S51Up+IOfjjcvbp3GMtPhDiU6NCQ/tc8xTlUcHYBMvSaiwkn26il
 Lj3nVOua0SvB00eGuH54by9cwSfxF4lIyXhA+K5ExaMq+osvGXEzwSozrq8ucUREmUCi
 ZX/3Ov44vUSjj+6wsAm9nY5aSJsZcyNkw/nnKAxMW/VsfZOquk8Od74PZPbPNSrIx5Ug
 poUHvEmQiPjSw3idsz6ILd8SOXjWLkao4JYNEHyxvU9j+qoVYb8/gV8MCnkw3eV28ZW/
 LoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707307136; x=1707911936;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6f7k1ITIn46WhQRbg6AUapNlOS7yCFi0qL4EED+7Ah4=;
 b=lDb4hkM3I2mSYfBW2of7e9g9SP7LCQZ32AovQSes/GDFqiZO7PZSk0lzpJLez2MPfV
 HNRpTPFj7hHbgGTZecQ991C5l++gXn5hm5SlqGS18pHaTGfVJnHF8THNj//bH88ouDHl
 qS660OOjqp6rNVsJyWmidGaf1XTWrcamqoDYNPuXV10wfEgv+fthDRl3Q3b/IEdW3XbM
 ca89qRYGjUP9QzaDdwIpz3pT6qi+PRlwvkOEkXFdxzrbt2wqs1fajS1qnLSCIh7T2Aa/
 aU14LHC0Hmt0zeSmKpxW0eZx482elIzCUh7pHqHhjNEcZ5p/YwhPt9CE7rBvY/Q+lLLt
 TPFg==
X-Gm-Message-State: AOJu0Yyr0JmS059vNFpcY3xcHuNtG3dhm1Gs8L7QRJnf65T0fN2HJV5l
 gawpo2xhj6uUFytmQSvgzJ389281pXksENuZ8GR1ps9UbIGnBzxeZqzgoSebp9d8YR+YYrzkbB+
 s4Gg7VfVRYTUb1hO7HdehCk2s9HBfTAPjvdjLYg==
X-Google-Smtp-Source: AGHT+IFdxWZ48704fPH/slsLPd2Cyvh+csLJ+JbauReKMVaN2HWCm3BOlnd9rmoDZdWJHpm4tYrMNMKDPvbEqGuAs7E=
X-Received: by 2002:a17:90b:33c9:b0:295:e8ea:3724 with SMTP id
 lk9-20020a17090b33c900b00295e8ea3724mr2290289pjb.34.1707307136032; Wed, 07
 Feb 2024 03:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20231123181300.2140622-1-christoph.muellner@vrull.eu>
 <CAKmqyKOoH1+Gc7oUw5-fW5wZX3yiQDWs2xoQQDNyci=W=D0MuQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOoH1+Gc7oUw5-fW5wZX3yiQDWs2xoQQDNyci=W=D0MuQ@mail.gmail.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Wed, 7 Feb 2024 12:58:44 +0100
Message-ID: <CAEg0e7ifJqDR4RYfHxPjnz-O2Mz8zZaOEisuwzY4=TVT2nTd3w@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user/riscv: Add Zicboz extensions to hwprobe
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
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

On Wed, Dec 6, 2023 at 1:57=E2=80=AFAM Alistair Francis <alistair23@gmail.c=
om> wrote:
>
> On Mon, Nov 27, 2023 at 12:37=E2=80=AFAM Christoph Muellner
> <christoph.muellner@vrull.eu> wrote:
> >
> > From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >
> > Upstream Linux recently added RISC-V Zicboz support to the hwprobe API.
> > This patch introduces this for QEMU's user space emulator.
> >
> > Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> Thanks!
>
> Applied to riscv-to-apply.next

I just saw that this did not land yet on master.
I also noticed that this patch is not in
https://github.com/alistair23/qemu/tree/riscv-to-apply.next or
https://github.com/alistair23/qemu/commits/riscv-to-apply.for-upstream.
Was there some issue with the patch?

Meanwhile a lot of additional extensions got defined in the hwprobe
interface (patches are already merged in the kernel).
I'll send out a patch for these in a few minutes and include this
patch here as well.

BR
Christoph

>
> Alistair
>
> > ---
> >  linux-user/syscall.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index 65ac3ac796..2f9a1c5279 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -8799,6 +8799,7 @@ static int do_getdents64(abi_long dirfd, abi_long=
 arg2, abi_long count)
> >  #define     RISCV_HWPROBE_EXT_ZBA      (1 << 3)
> >  #define     RISCV_HWPROBE_EXT_ZBB      (1 << 4)
> >  #define     RISCV_HWPROBE_EXT_ZBS      (1 << 5)
> > +#define     RISCV_HWPROBE_EXT_ZICBOZ   (1 << 6)
> >
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0     5
> >  #define     RISCV_HWPROBE_MISALIGNED_UNKNOWN     (0 << 0)
> > @@ -8855,6 +8856,8 @@ static void risc_hwprobe_fill_pairs(CPURISCVState=
 *env,
> >                       RISCV_HWPROBE_EXT_ZBB : 0;
> >              value |=3D cfg->ext_zbs ?
> >                       RISCV_HWPROBE_EXT_ZBS : 0;
> > +            value |=3D cfg->ext_zicboz ?
> > +                     RISCV_HWPROBE_EXT_ZICBOZ : 0;
> >              __put_user(value, &pair->value);
> >              break;
> >          case RISCV_HWPROBE_KEY_CPUPERF_0:
> > --
> > 2.41.0
> >
> >

