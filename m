Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55E1E95A8E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 01:20:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpew9-000775-W5; Sun, 08 Oct 2023 21:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpew4-00075x-Gl; Sun, 08 Oct 2023 21:19:52 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpew2-00017e-T6; Sun, 08 Oct 2023 21:19:52 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-4577c1ae94fso191586137.1; 
 Sun, 08 Oct 2023 18:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696814389; x=1697419189; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ScgV5jtLC6P4IwNV4ss6RkdnJde867FddL1FkBrxdA=;
 b=OLrZBSbY4aT32O4MtFItr2gtjiRVcWcvA/oJTPG4urV7QchY4Fx8+GIa5wfTBFlsdE
 Qg277GKDF0DvN1Fl1/19MRb+qlilPwMSbyW4rb34yLypXuuufQRfc2w5i8QWYwvP7IZZ
 jUPQv4QSTMONZd1iNzbxhYLrz7rSJTITUFIdeZt84brFxoaWdhd2GH2nneblKlV9tagH
 3AyXOFnjwvJqRtdh9wLY7UD7Vrh7E6tf9wtwn8uQJzSCJIUJaTD0mxEN67WW1irfAlHz
 d2RAwC8VnOGqNAHZWnwHYHZvyYrM2quBIUgEk8Q+tbhi66SVyEO9ykS61NrtAwoh/vKB
 TkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696814389; x=1697419189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ScgV5jtLC6P4IwNV4ss6RkdnJde867FddL1FkBrxdA=;
 b=e1Y3Y95GWcYR4ght9DvyzMWABLX0RQBxNWL1lQbfkfKiK4sP+sVknGx3Pcg25lo/HO
 Bpu88LdOwb5rXYwO3vnmMdrfzxpHuZkwJJewJCU1EtlBGzXOVb3nXzSL0a8OZqfSZjn1
 5Ycc5WzhDy/PtF+aIeQPlN4EYr/uDUg6NmGuEPjQEUpvuT876Q8ufWGiobXiHbOQatWU
 sy4H5eKq5BMt1aVyMAZbtUsxaikC0UkZ8rEk733xVYK3hBPBvvhp9ZB1YuyZtavEf4xb
 5auWVNCflZeFHM0HjPdxoLqOTVq9g8MdIdBflkn9Au4PvISmCMglxFJfAzB2aNVoE2MN
 Ycqg==
X-Gm-Message-State: AOJu0YzEFaP29TQ/gjqIXL4hqrSuwW3x1jnJLEq5XhtAA2rrFYoo6x+/
 dATA7UHraPyS0Ev58CXrY76dBHXCBDcgA0LKJi4=
X-Google-Smtp-Source: AGHT+IEDWvmXYXHkuygmrUPioQJR4hcU6SS3zqHVGALp3yfY7zrc4O0hORJWdcwa6A59rj9oNXHHZUy2g7JhS5p18iQ=
X-Received: by 2002:a05:6102:4bca:b0:457:4645:a339 with SMTP id
 id10-20020a0561024bca00b004574645a339mr11246091vsb.1.1696814389007; Sun, 08
 Oct 2023 18:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231003122539.775932-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231003122539.775932-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 11:19:22 +1000
Message-ID: <CAKmqyKN9SU+Nu=x_=O7tdcDws1MV3vFMNK2EsYjydVvxuv7cGQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/tcg: remove RVG warning
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, "Paul A . Clarke" <pclarke@ventanamicro.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Oct 3, 2023 at 10:26=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Vendor CPUs that set RVG are displaying user warnings about other
> extensions that RVG must enable, one warning per CPU. E.g.:
>
> $ ./build/qemu-system-riscv64 -smp 8 -M virt -cpu veyron-v1 -nographic
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifence=
i
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifence=
i
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifence=
i
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifence=
i
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifence=
i
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifence=
i
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifence=
i
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifence=
i
>
> This happens because we decided a while ago that, for simplicity, vendor
> CPUs could set RVG instead of setting each G extension individually in
> their cpu_init(). Our warning isn't taking that into account, and we're
> bugging users with a warning that we're causing ourselves.
>
> In a closer look we conclude that this warning is not warranted in any
> other circumstance since we're just following the ISA [1], which states
> in chapter 24:
>
> "One goal of the RISC-V project is that it be used as a stable software
> development target. For this purpose, we define a combination of a base
> ISA (RV32I or RV64I) plus selected standard extensions (IMAFD, Zicsr,
> Zifencei) as a 'general-purpose' ISA, and we use the abbreviation G for
> the IMAFDZicsr Zifencei combination of instruction-set extensions."
>
> With this in mind, enabling IMAFD_Zicsr_Zifencei if the user explicitly
> enables 'G' is an expected behavior and the warning is unneeded. Any
> user caught by surprise should refer to the ISA.
>
> Remove the warning when handling RVG.
>
> [1] https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-=
IMAFDQC/riscv-spec-20191213.pdf
>
> Reported-by: Paul A. Clarke <pclarke@ventanamicro.com>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/tcg/tcg-cpu.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 08b806dc07..f50ce57602 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -293,7 +293,6 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu,=
 Error **errp)
>              return;
>          }
>
> -        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_ifencei), true);
>
> --
> 2.41.0
>
>

