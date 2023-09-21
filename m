Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE11CD495B
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 06:29:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qjDC7-0000tm-Us; Thu, 21 Sep 2023 02:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qjDC5-0000gJ-U4
 for qemu-riscv@nongnu.org; Thu, 21 Sep 2023 02:29:46 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkanwal@rivosinc.com>)
 id 1qjDC1-0001sP-TT
 for qemu-riscv@nongnu.org; Thu, 21 Sep 2023 02:29:44 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-276d611df9aso351340a91.2
 for <qemu-riscv@nongnu.org>; Wed, 20 Sep 2023 23:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695277780; x=1695882580;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCzF4S2wFI2Ebs9o6FsDASnUBQpdNyOa7MyFhuoofcA=;
 b=Lg5VlmA+mvqR2NvXzMFnUNqjqcZxJaKwON3c+n4KJKDEokE9xmW77ZKgzTZa/CXrZP
 W/02V17KfXwrKcqPo01IRO1x++BrmavfqG52Atk2RdQYWSYzF42fHaWI5R3lIpmkAOnE
 mDzXbw5jqTHWD0HH8/Qp2xiNYY/3YPnAIn+XCiA+Oqe7LwiuDQYDNZo7GX7LOLCqyB9C
 5r3nThA3+Bfw0GysglUbujJb8IYP7+nmKkO0bGxkQ8nPFNqS0Xr80HIAqCHGeWb2yZzm
 mn0JoupLmaI94+iCAHfTWRLUh06CCbjfMNuR1YcG0G6rQh+ouTBHIfP0zkc/vhzv16mZ
 iMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695277780; x=1695882580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uCzF4S2wFI2Ebs9o6FsDASnUBQpdNyOa7MyFhuoofcA=;
 b=Px7DeZcn2m8+jn5wd1D5FdlG/E0kjxLlbGQMPmzTqjVf6nfSBZDk8amsPjdkZPHxgJ
 ag2GP5rx2Dgbl44p3RDTR+3eazVXm7KBsFTHoO3Ibj6xpU6D96FZrdI20j0xkya2e2f2
 thUs6oOk1OaR6RTqVDB+akj6s4Rf16UzBbW4PiDwHfavidiO3SvVHtKIy9ioxenRY+G3
 nEFmpE/cXH4jzleA3eNmY/J9DoO9xgRJjXursP0l5hAI/Jrhb8p1DbRLcG9z9Nj3G8+f
 xLG1DyixzgMQhFbjnVJt9ZBaGqy6IAUhmZfLMpnI1k+peUJJb2ZC4s0LzHEg5ZGAGGsb
 5oFg==
X-Gm-Message-State: AOJu0YzUj21WIjluyE/l3x/S8AOcdndRwBjlGTskWXrTsciN/6dclCjC
 v42vxj9VhP7mve4RgAxPcouLnMl2N6RMtyKhgzGkLg==
X-Google-Smtp-Source: AGHT+IHFgxqpWAa3lqqORLlsEbxmtpDDSZwecxWJhozJsIJI9frthz5O4Ipw9ZK40LcLQ/ZlCRz/Wu9TFmVEyGMK3cY=
X-Received: by 2002:a17:90b:3111:b0:276:f487:e958 with SMTP id
 gc17-20020a17090b311100b00276f487e958mr271588pjb.37.1695277779879; Wed, 20
 Sep 2023 23:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230526162308.22892-1-rkanwal@rivosinc.com>
 <dfeec126-304f-c4a4-77fb-7bf0927dbd31@ventanamicro.com>
In-Reply-To: <dfeec126-304f-c4a4-77fb-7bf0927dbd31@ventanamicro.com>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Thu, 21 Sep 2023 07:29:28 +0100
Message-ID: <CAECbVCtKW9An8md8ZwkZe4_ewgFpXbsgfr++h0L0=vGR-J3-LQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] target/riscv: Add RISC-V Virtual IRQs and IRQ
 filtering support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, apatel@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=rkanwal@rivosinc.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hey Daniel,

Sorry I was on holiday. There is no new work on this AFAIK. I will
rebase and send a new version for this shortly.

Thanks
Rajnesh

On Wed, Sep 6, 2023 at 3:38=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hey,
>
>
> What's the latest on this work? It seems that all patches are acked:
>
> https://lore.kernel.org/qemu-riscv/20230526162308.22892-1-rkanwal@rivosin=
c.com/
>
>
> It'll probably conflict with current Alistair's riscv-to-apply.next thoug=
h, so
> perhaps Rajnesh could gather the acks and send a rebased version.
>
>
> Thanks,
>
> Daniel
>
>
> On 5/26/23 13:23, Rajnesh Kanwal wrote:
> > This series adds M and HS-mode virtual interrupt and IRQ filtering supp=
ort.
> > This allows inserting virtual interrupts from M/HS-mode into S/VS-mode
> > using mvien/hvien and mvip/hvip csrs. IRQ filtering is a use case of
> > this change, i-e M-mode can stop delegating an interrupt to S-mode and
> > instead enable it in MIE and receive those interrupts in M-mode and the=
n
> > selectively inject the interrupt using mvien and mvip.
> >
> > Also, the spec doesn't mandate the interrupt to be actually supported
> > in hardware. Which allows M/HS-mode to assert virtual interrupts to
> > S/VS-mode that have no connection to any real interrupt events.
> >
> > This is defined as part of the AIA specification [0], "5.3 Interrupt
> > filtering and virtual interrupts for supervisor level" and "6.3.2 Virtu=
al
> > interrupts for VS level".
> >
> > Most of the testing is done by hacking around OpenSBI and linux host.
> > The changes for those can be found at [1] and [2].
> >
> > It's my first touch on RISC-V qemu IRQ subsystem. Any feedback would
> > be much appreciated.
> >
> > The change can also be found on github [3].
> >
> > TODO: This change doesn't support delegating virtual interrupts injecte=
d
> > by M-mode to VS-mode by the Hypervisor. This is true for bits 13:63 onl=
y.
> >
> > Thanks
> > Rajnesh
> >
> > [0]: https://github.com/riscv/riscv-aia/releases/download/1.0-RC4/riscv=
-interrupts-1.0-RC4.pdf
> > [1]: https://github.com/rajnesh-kanwal/opensbi/tree/dev/rkanwal/irq_fil=
ter
> > [2]: https://github.com/rajnesh-kanwal/linux/commits/dev/rkanwal/aia_ir=
q_filter
> > [3]: https://github.com/rajnesh-kanwal/qemu/tree/dev/rkanwal/riscv_irq_=
filter
> >
> > v2:
> >   * Move RISCV_EXCP_SEMIHOST to switch case and remove special handling=
.
> >   * Fix linux-user build.
> >
> > Rajnesh Kanwal (6):
> >    target/riscv: Without H-mode mask all HS mode inturrupts in mie.
> >    target/riscv: Check for async flag in case of RISCV_EXCP_SEMIHOST.
> >    target/riscv: Set VS* bits to one in mideleg when H-Ext is enabled
> >    target/riscv: Split interrupt logic from riscv_cpu_update_mip.
> >    target/riscv: Add M-mode virtual interrupt and IRQ filtering support=
.
> >    target/riscv: Add HS-mode virtual interrupt and IRQ filtering suppor=
t.
> >
> >   target/riscv/cpu.c        |   9 +-
> >   target/riscv/cpu.h        |  23 ++
> >   target/riscv/cpu_bits.h   |   6 +
> >   target/riscv/cpu_helper.c |  99 +++++---
> >   target/riscv/csr.c        | 477 ++++++++++++++++++++++++++++++++++---=
-
> >   target/riscv/machine.c    |   6 +
> >   6 files changed, 546 insertions(+), 74 deletions(-)
> >

