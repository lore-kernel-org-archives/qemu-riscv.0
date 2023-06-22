Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA88EB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 01:04:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC8jq-0002C3-SP; Wed, 21 Jun 2023 21:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8jp-0002BM-11; Wed, 21 Jun 2023 21:03:53 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8jn-0003GQ-6z; Wed, 21 Jun 2023 21:03:52 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-78a1e095508so1992902241.0; 
 Wed, 21 Jun 2023 18:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687395829; x=1689987829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kiOx34JQpXxSODn+9cr74J/iavDza5OkqmneYZTZmw=;
 b=AdALQAFLq3JmtoE/sL6kqEpcQMJiuCk9meA9wYYVHt74PAR7OsCphxBw8xJ2jXGMx/
 9Rt47Q2iE/ov57kgNUKXqEQUh3nvqe3yjDkzndHHnfXdzfQBH9Iy+qI05FzYQcEvh0PC
 1Sp1xfvP+edAQhwkIhu/zH1IYknG+9EYkY9Ee6rdKbX6OKGKlvtHjGxwoeL85iqdGL+J
 cexOp21WS66Czn8mo1HpcXs4DtYzR8M/CWvPUPFH+R4ubDJXNbKL2/o5cIXmXvyHS8qE
 bYEbbu5R77O+5kRy4yGqDQKi7iTmkCKwD7+d9ttUe6ZzoUoahKOmkaUL+vrBeu0OLXKA
 Fdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687395829; x=1689987829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kiOx34JQpXxSODn+9cr74J/iavDza5OkqmneYZTZmw=;
 b=a5CYymi0kxu0BRE5BewQ/v6DLWVNHn8cmo65K/RkotzS/HjYOYox4VYxLZGU6uCKKH
 smzq7WcbxT7JEAostqTSbbpJIWhirpnSLB/4qMSTVCQcjttYi/hPXtybjk/J1C4Kc7yW
 SWcnDmRF50FfZr25io3eyoep2ktM8IuRsHqll6hZscjRxBIkC01FI/GPa1YDat48ZbA4
 ZQsR0374Hj9s/R7kyQhrsKQjRI3JO7Hy1ADgXu02sJbdqGN3zMQgTycmdO9nj25aRchN
 jXV0nClHWISl5aETfBivb+VbQOhPGpW33ytDHA7rsFq9bcGH7LXnMwgRKq2PEuN6RzwH
 x1rQ==
X-Gm-Message-State: AC+VfDx8D1P3fiUly55sewHUvFEJ4cWa07LrELZNgpyDpZwhpXG3HVur
 +qeHPjbwgfT56yx4IkuMxqLym/b64878vOqic0U=
X-Google-Smtp-Source: ACHHUZ7qQiYJQMO6p5XkNr5lySwl8SEZgHZHLVsL4vMAicb4dleczrj7xYNq2NIWumKho6xjTKiOGXrRaOsrjpJr3fM=
X-Received: by 2002:a67:db81:0:b0:440:c4fb:f257 with SMTP id
 f1-20020a67db81000000b00440c4fbf257mr3725655vsk.0.1687395829287; Wed, 21 Jun
 2023 18:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
In-Reply-To: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 11:03:23 +1000
Message-ID: <CAKmqyKNBa3-F1R8ZQUKoiMJCsM3kpvRg9dpwXX-tawcBM6Vrcw@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] disas/riscv: Add vendor extension support
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Mon, Jun 12, 2023 at 9:11=E2=80=AFPM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This series adds vendor extension support to the QEMU disassembler
> for RISC-V. The following vendor extensions are covered:
> * XThead{Ba,Bb,Bs,Cmo,CondMov,FMemIdx,Fmv,Mac,MemIdx,MemPair,Sync}
> * XVentanaCondOps
>
> So far, there have been two attempts to add vendor extension support
> to the QEMU disassembler. The first one [1] was posted in August 2022
> by LIU Zhiwei and attempts to separate vendor extension specifics
> from standard extension code in combination with a patch that introduced
> support for XVentanaCondOps. The second one [2] was posted in March 2023
> by me and added XThead* support without separating the vendor extensions
> from the standard code.
>
> This patchset represents the third attempt to add vendor extension
> support to the QEMU disassembler. It adds all features of the previous
> attempts and integrates them into a patchset that uses the same
> mechanism for testing the extension availability like translate.c
> (using the booleans RISCVCPUConfig::ext_*).
> To achieve that, a couple of patches were needed to restructure
> the existing code.
>
> Note, that this patchset allows an instruction encoder function for each
> vendor extension, but operand decoding and instruction printing remains
> common code. This is irrelevant for XVentanaCondOps, but the patch for
> the XThead* extensions includes changes in riscv.c and riscv.h.
> This could be changed to force more separation with the cost of
> duplication.
>
> The first patch of this series is cherry-picked from LIU Zhiwei's series.
> It was reviewed by Alistair Francis and Richard Henderson, but never
> made it on master. I've added "Reviewed-by" tags to the commit.
>
> Changes for v2:
> * Rebase on Alistair's riscv-to-apply.next branch
>
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-08/msg03662.htm=
l
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg04566.htm=
l
>
> Christoph M=C3=BCllner (7):
>   target/riscv: Factor out extension tests to cpu_cfg.h
>   disas/riscv: Move types/constants to new header file
>   disas/riscv: Make rv_op_illegal a shared enum value
>   disas/riscv: Encapsulate opcode_data into decode
>   disas/riscv: Provide infrastructure for vendor extensions
>   disas/riscv: Add support for XVentanaCondOps
>   disas/riscv: Add support for XThead* instructions
>
> LIU Zhiwei (1):
>   target/riscv: Use xl instead of mxl for disassemble

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  disas/meson.build        |   6 +-
>  disas/riscv-xthead.c     | 707 +++++++++++++++++++++++++++++++++++++++
>  disas/riscv-xthead.h     |  28 ++
>  disas/riscv-xventana.c   |  41 +++
>  disas/riscv-xventana.h   |  18 +
>  disas/riscv.c            | 378 ++++++---------------
>  disas/riscv.h            | 299 +++++++++++++++++
>  target/riscv/cpu.c       |   3 +-
>  target/riscv/cpu_cfg.h   |  37 ++
>  target/riscv/translate.c |  27 +-
>  10 files changed, 1246 insertions(+), 298 deletions(-)
>  create mode 100644 disas/riscv-xthead.c
>  create mode 100644 disas/riscv-xthead.h
>  create mode 100644 disas/riscv-xventana.c
>  create mode 100644 disas/riscv-xventana.h
>  create mode 100644 disas/riscv.h
>
> --
> 2.40.1
>
>

