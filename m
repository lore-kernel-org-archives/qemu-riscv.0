Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDFEC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 05:32:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1scIEe-0007fl-Q9; Fri, 09 Aug 2024 01:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1scIEa-0007cR-0H
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2024 01:32:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1scIEX-0005eK-HZ
 for qemu-riscv@nongnu.org; Fri, 09 Aug 2024 01:32:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3684407b2deso871279f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Aug 2024 22:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1723181529; x=1723786329; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYn1aDvDHwwtCn/izfYMZZTlYnbLQ5RlvEDJNMY3rSg=;
 b=lziVT/gZk533Klr/YZtpKZD2YFD3o963aALvKHyz34fDZ7bIVSxGf8Uka7vwhnlipk
 DWGSU+XD7OxkYd6Aqxi2cBrzjY9c3rHPbZv1C1IoPuxc+Isw832LmFyW8WVxMyJIfHfP
 pa/o7AdvqqdczJL+E/bPYHggdk4gYE/U4fJh1G5psb5ogvG4IlL1n1yquZcWzlbLFL2o
 E5L+YUO2tNOIFoLgHzzHUTNb2N36vx2+HGwMmlEqO2lJz9QFMW3dvOckuHvkZP/W0miK
 EPPTk+63Pp3pm+Uh0+xhQ9OYGg/PC+/T/ncphWac8TVa2C93LBiI7g8Fxi21SQEMS7Dg
 B+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723181529; x=1723786329;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HYn1aDvDHwwtCn/izfYMZZTlYnbLQ5RlvEDJNMY3rSg=;
 b=OxN0/vOBkRaC7KJhRxDzLurPEQ2Uhj3qCWwIOFANikE9YhGQwoB5SCAdwbZJqOg4XV
 BfOw9/cruT8Ni2zmetS7TV4x96aCQFYdSXKHfstD8R15trQBdzPkopZYMklXiop8TNkJ
 ybad8XnGngmE7BCIxA6vHavfofy06c6YqzBJkKl4BcngJ5jxPZ0W0irXb4eYWBBqmY+m
 SBJKaUlPHCxJcPAZbEegElg3ey7O0T08IQFuj+KjdLt1caZHQ+pYlvm0ARK2OXP9vOOR
 k0T+ht1u3jlTdZ/dPxBdgzqkmHHeewAocan8RU/r/mBhC38rpYVOyqWuhbui7AiQw6/H
 R6Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUuUkfhx8atQ4nrupGZ9atJlXgoUmPvJC+FIikWLUdo7TB6uAwN52m//n5ozH0zHc7dckbjCmeVG5AFVdq4XMQE4EiDI4=
X-Gm-Message-State: AOJu0YzWLtVUrjosab2sy4pmubE1JLeC5rbnVSFoGF3MoJwwyx0ZoBa5
 Z/pkT0C+eUq1Nq8WZWDkEWSjHC6GfHx1KJnb7ZJZWuZGs/QBJiokCdx3so57rCCSX26uPaOVCMr
 lSBXhT1kSAiYCh8dXP3rI0dP9vILcXhbBZ3cA9Q==
X-Google-Smtp-Source: AGHT+IEx6Z8r0KlPUOK8jW8V4vODUJNKOJFfsLAwzlzZKn4ALauCtZgUANBoWoJKxhLyOsvEygv0i43dqLs0EUcx2zI=
X-Received: by 2002:a5d:4206:0:b0:36b:8f94:e206 with SMTP id
 ffacd0b85a97d-36d5de943ccmr280864f8f.5.1723181529100; Thu, 08 Aug 2024
 22:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230608072314.3561109-1-tommy.wu@sifive.com>
 <20230608-01a21738d16a20808eceb795@orel>
In-Reply-To: <20230608-01a21738d16a20808eceb795@orel>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Fri, 9 Aug 2024 13:31:58 +0800
Message-ID: <CANj3q_=M5Lgu78y6k36-jaYpAzLe_TX0tEF61YUtfi26+y1DUA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] target/riscv: Add Smrnmi support.
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, frank.chang@sifive.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=tommy.wu@sifive.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Jun 8, 2023 at 5:43=E2=80=AFPM Andrew Jones <ajones@ventanamicro.co=
m> wrote:
>
> On Thu, Jun 08, 2023 at 12:23:10AM -0700, Tommy Wu wrote:
> > This patchset added support for Smrnmi Extension in RISC-V.
> >
> > There are four new CSRs and one new instruction added to allow NMI to b=
e
> > resumable in RISC-V, which are:
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   * mnscratch (0x740)
> >   * mnepc     (0x741)
> >   * mncause   (0x742)
> >   * mnstatus  (0x744)
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   * mnret: To return from RNMI interrupt/exception handler.
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > RNMI also has higher priority than any other interrupts or exceptions
> > and cannot be disabled by software.
> >
> > RNMI may be used to route to other devices such as Bus Error Unit or
> > Watchdog Timer in the future.
> >
> > The interrupt/exception trap handler addresses of RNMI are
> > implementation defined.
>
> Is there an M-mode software PoC for this with implemented handlers?
>
> Thanks,
> drew
>

Sorry for the late reply.
We implement a simple RNMI trap handler in the customized OpenSBI [1], and
use the work from Damien Hedde [2] to inject the RNMI interrupt. We can tes=
t
the RNMI functionality with the signal injection in the customized QEMU [3]=
.

I=E2=80=99ll include the test case in the latest upstream email.

[1] https://github.com/TommyWu-fdgkhdkgh/opensbi/commits/dev/twu/master
[2] https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg06232.html
[3] https://github.com/TommyWu-fdgkhdkgh/qemu/tree/dev/twu/master

> >
> > Changelog:
> >
> > v4
> > * Fix some coding style issues.
> > ( Thank Daniel for the suggestions. )
> >
> > v3
> > * Update to the newest version of Smrnmi extension specification.
> >
> > v2
> >   * split up the series into more commits for convenience of review.
> >   * add missing rnmi_irqvec and rnmi_excpvec properties to riscv_harts.
> >
> > Tommy Wu (4):
> >   target/riscv: Add Smrnmi cpu extension.
> >   target/riscv: Add Smrnmi CSRs.
> >   target/riscv: Handle Smrnmi interrupt and exception.
> >   target/riscv: Add Smrnmi mnret instruction.
> >
> >  hw/riscv/riscv_hart.c                         | 21 +++++
> >  include/hw/riscv/riscv_hart.h                 |  4 +
> >  target/riscv/cpu.c                            | 18 ++++
> >  target/riscv/cpu.h                            | 11 +++
> >  target/riscv/cpu_bits.h                       | 23 ++++++
> >  target/riscv/cpu_helper.c                     | 81 ++++++++++++++++--
> >  target/riscv/csr.c                            | 82 +++++++++++++++++++
> >  target/riscv/helper.h                         |  1 +
> >  target/riscv/insn32.decode                    |  3 +
> >  .../riscv/insn_trans/trans_privileged.c.inc   | 12 +++
> >  target/riscv/op_helper.c                      | 49 +++++++++++
> >  11 files changed, 300 insertions(+), 5 deletions(-)
> >
> > --
> > 2.31.1
> >
> >

