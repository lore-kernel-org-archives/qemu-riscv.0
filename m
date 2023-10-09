Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4154E95A8E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 01:17:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpete-0006GG-87; Sun, 08 Oct 2023 21:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpetc-0006FM-PY; Sun, 08 Oct 2023 21:17:20 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qpetb-0000w2-2d; Sun, 08 Oct 2023 21:17:20 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7b0741e0c7bso917768241.0; 
 Sun, 08 Oct 2023 18:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696814237; x=1697419037; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BoAFiT3AJ5VtW+hJg/tbj56l+qoqqzEu/eLpOuaa5g=;
 b=j7k4nqvQTMz1SilX5gC/JFEpmXKNRCE1mGFhaoQZurBjom/TXTGrfM6QD62OksMSqu
 if9Lqytj2ghFT9g6dD3bRhDvSvDZG/xr5Lc3Cv0nQHMXn3p1LtsBzkHyVgHWpCKK4Hj0
 NjhQEQA5/zYYOc2W6qbTbuNFSmbL6rmb8dkQHBpEj+6/GxqlJXirCbAUtOgghhDwwH4z
 InntiyByyicQXRqlveI9Ud2hzNFr/SysBnPKuY2qrWHDqd9FT0r0Le4pMBNVQXEKWrro
 2d7ILixhNh+cDwxk71T+QDTCN0uBD9RP8fH3X5D1G6GMjZu5BsSaLQ/bCk+n2Dx41u3G
 7kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696814237; x=1697419037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4BoAFiT3AJ5VtW+hJg/tbj56l+qoqqzEu/eLpOuaa5g=;
 b=mbxy4ArsObSUjmZ+kIfpXGmJHyILf2LyENJ5HKJUQYbBTA5V+Ud2P9udupmi6mT4RM
 ETltXa+RN64TFSLCueHm44zb5W47/tGW+aau/XTih9yMVqPdkYHyzvZbp1D7jTwQG1C5
 PNCLlqe2rXL+SjbvX14VmvaQVAPAAvIe64SzrzOy2xIQLUU5yjwdwM4WjP7Skp0WBCsI
 1hEiSCd8WsUrYjfofOv/TImrqHzwbpfDjtimn4C1BVBMlXvGSjkxmu88m5KdZ2zp7XMU
 B22xIfTS8aWN0DJ87beGgNM0/Qo38tzBmLVsaQUBSQveHOkglEhccNw2E0rA/14IGpWM
 zBmQ==
X-Gm-Message-State: AOJu0YxziKun9p/9N5TVot65jnRGM3hZ0FmbVDxSLPMaGgOKPI+mFZ0q
 qLRSnWqUac5thnam7YEgedxAfWSKyXFLCGLGt+w=
X-Google-Smtp-Source: AGHT+IGLSH/3n4JM/Wk/pkmF2fqIOw0V40UAELT5LKJlZeIThlR+q19a2pr/GEbV1NJ2aov7raIhBys5mJke/Fj4lXo=
X-Received: by 2002:a67:eed6:0:b0:452:988d:b1c9 with SMTP id
 o22-20020a67eed6000000b00452988db1c9mr7889457vsp.16.1696814237532; Sun, 08
 Oct 2023 18:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231003122539.775932-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231003122539.775932-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Oct 2023 11:16:50 +1000
Message-ID: <CAKmqyKOcsbLnuURfjyQyZdLF0-DEu23k_cyDqgqVJJcyiQjvxg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/tcg: remove RVG warning
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, "Paul A . Clarke" <pclarke@ventanamicro.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

