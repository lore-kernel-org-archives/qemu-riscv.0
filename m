Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CF6C001B0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:05:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU95W-0007UX-09; Thu, 10 Aug 2023 13:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU95S-0007RI-3n; Thu, 10 Aug 2023 13:04:38 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU95P-0005YU-Qi; Thu, 10 Aug 2023 13:04:37 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-56c96982829so943964eaf.0; 
 Thu, 10 Aug 2023 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691687070; x=1692291870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rLbpsZgNZJw0qnTsdZe1hynL5U2DSL77G2+EImjfiBk=;
 b=GXWoFo2PhW2QUFw5EFoBTlYRRv06quKwpvPF7D7Sf4TKmKfceXKWGgcI3grbdWKfnX
 +hu7Cw0HOFmpBl+eGJPlbxF5HVmcIJsDL8FtrTqM98Vu3o+0TApaqgh2AFcLMdkR1S0u
 HkMuxWlYHiQEoXXEpYNVk6RP3ArvwTlyK2CWlrV5G5s+SmVFtDKI9V2GB/62xz7b7cIc
 ZgJWowVeIXnR+McYozEE2UQ5BdKM5slD831ZSCojhtlo6YCoHY4thV1PI1VEQFaFAowF
 S/4v3A4+tv3zU8Ml8HXhnanV+ia0ch15TfAEaQgYfG99RZ2KA+rqjh19uyfREZCLoahl
 bjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691687070; x=1692291870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rLbpsZgNZJw0qnTsdZe1hynL5U2DSL77G2+EImjfiBk=;
 b=lqh3a2iP6bAD7TVc0VApG8OLhd3JXPb/CTH5pEeqy7L6PYhynMMs5AlLaCyZ7NXmwA
 yWL3PVo31hye7474C/VB2Rjbek/0bVvoXL3US3dpX2WbxF/vgiWoJ2bqUovbYYZw7fcN
 vPLBk98NGcPnT8ZuR4/zsV8nJpKJ+VqZ2JKD3TLUVc6YechIg7UgYRkXotyzi15QoIcu
 Ixr6I1NMWjarPGc7XJ3r72l/9aao+cXY2ErcJBT2EwkKdanNQv/X9J0DsuZT5d3bV4C/
 s9Jav0UJQkewRm8TUsrYmoi0GGMngqL16TE4N7DIGIPF9NwLw1m6KglihN2x8G9U+cQR
 XaZA==
X-Gm-Message-State: AOJu0YxFRdAohTj4UvYlxypjcQOvIJP9gPB+Q1uBgJZFvYHsJTRYR7ep
 XjkUkABYNQe+TXUH9LLZZZGFgTUpWBJrSXRSiwE=
X-Google-Smtp-Source: AGHT+IGU4r60gtV+Q5AHXlinWPNPOcLvN5V9hKsnMcoxBIEpFNLY+lHubsZLIR+uEKZpHSO+/58X86NKD76DRUPFHYA=
X-Received: by 2002:a05:6358:3426:b0:13a:2d76:e6dd with SMTP id
 h38-20020a056358342600b0013a2d76e6ddmr3896842rwd.31.1691687070122; Thu, 10
 Aug 2023 10:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230802124906.24197-1-rbradford@rivosinc.com>
In-Reply-To: <20230802124906.24197-1-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:04:04 -0400
Message-ID: <CAKmqyKP6haPc7qGrL833ftPPg44_B501t28no05DK=2q7rYJag@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Implement WARL behaviour for
 mcountinhibit/mcounteren
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=alistair23@gmail.com; helo=mail-oo1-xc30.google.com
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

On Wed, Aug 2, 2023 at 8:50=E2=80=AFAM Rob Bradford <rbradford@rivosinc.com=
> wrote:
>
> These are WARL fields - zero out the bits for unavailable counters and
> special case the TM bit in mcountinhibit which is hardwired to zero.
> This patch achieves this by modifying the value written so that any use
> of the field will see the correctly masked bits.
>
> Tested by modifying OpenSBI to write max value to these CSRs and upon
> subsequent read the appropriate number of bits for number of PMUs is
> enabled and the TM bit is zero in mcountinhibit.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea7585329e..495ff6a9c2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1834,8 +1834,11 @@ static RISCVException write_mcountinhibit(CPURISCV=
State *env, int csrno,
>  {
>      int cidx;
>      PMUCTRState *counter;
> +    RISCVCPU *cpu =3D env_archcpu(env);
>
> -    env->mcountinhibit =3D val;
> +    /* WARL register - disable unavailable counters; TM bit is always 0 =
*/
> +    env->mcountinhibit =3D
> +        val & (cpu->pmu_avail_ctrs | COUNTEREN_CY | COUNTEREN_IR);
>
>      /* Check if any other counter is also monitoring cycles/instructions=
 */
>      for (cidx =3D 0; cidx < RV_MAX_MHPMCOUNTERS; cidx++) {
> @@ -1858,7 +1861,11 @@ static RISCVException read_mcounteren(CPURISCVStat=
e *env, int csrno,
>  static RISCVException write_mcounteren(CPURISCVState *env, int csrno,
>                                         target_ulong val)
>  {
> -    env->mcounteren =3D val;
> +    RISCVCPU *cpu =3D env_archcpu(env);
> +
> +    /* WARL register - disable unavailable counters */
> +    env->mcounteren =3D val & (cpu->pmu_avail_ctrs | COUNTEREN_CY | COUN=
TEREN_TM |
> +                             COUNTEREN_IR);
>      return RISCV_EXCP_NONE;
>  }
>
> --
> 2.41.0
>
>

