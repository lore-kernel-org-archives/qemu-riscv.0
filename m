Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntFtm-00064Y-At
	for mharc-qemu-riscv@gnu.org; Mon, 23 May 2022 17:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntFtk-00063M-QF; Mon, 23 May 2022 17:47:32 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:36657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ntFtV-0006Wn-JM; Mon, 23 May 2022 17:47:32 -0400
Received: by mail-io1-xd2f.google.com with SMTP id n145so7089259iod.3;
 Mon, 23 May 2022 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZrsbMYAsQUeay9G7OP9LAsE6yzqj7wzxhvLg4PAJn9M=;
 b=chRole6lMPiZuv9IuHWlg2x0nExsV/KOeGkmU0mqM0j8FKsyOA1y2PJTQoRFtjiKs9
 B5yHaFPjZoO7zQ5LY3eh+873EKVjioHkzQ65u0HKzoUnvr91e+XEsvMoWVKV7+pcHCdP
 cO/ZfndeZAAd3FMkPEmSvagHcM3BjCJTA48h0+szSO8FOWbyBh/nkYLz+wNIfqX8+1HJ
 UQ4KkT95o0GEMGT7ulyzByQumt2PPFu627osyY1IzVhRRdsjvgiEyVvJmvKN4yPtynX3
 q1A6nPZ2cxOIedUP4Ncl60VmiKqQ8fMdfNvaTQ+teZmPuJbNshgpwxH8IoW0O00uzIbs
 8AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZrsbMYAsQUeay9G7OP9LAsE6yzqj7wzxhvLg4PAJn9M=;
 b=bjBUs4tzRvMStUYI5WlHdHs5iNwnRMB5mnw4XuSonUPBlrV1xyAMIzR0Rap/B5xroa
 cQVVnnLmbnSFIXIV0ThAkbRN8n//+Th/7R+4vppU5lda0SxjoiCbiStetC/GX5alnOVK
 XvO1QjqUkRoB57yGlttOS7tRbW0HMjXvjajbCBoBNfpcvE+tsIof6557y6uZxWAwui0W
 J6Miw+874wWc9tyjbfG+SSjVaC8BMu9d4513Y6G3fz2paZjOOP+3jo4WzBBJshV8E+TB
 ylVCVW0HFVXJ05qVmo6IyX9K4xdFncPUxnckKHVBMLtK1N4n3ByhSE8a6q3FQedN3221
 yQxQ==
X-Gm-Message-State: AOAM530khoGkNrhrAabbSlBAXHTbvFo9dz5yBDWkRhnlYYCbPAsxqKpd
 E46f9h1rvGlqpldnSukwIxRLKNTXlwSWtTO3a1g=
X-Google-Smtp-Source: ABdhPJw3zEc4ndeTuV2yFUCvvruWLagSsunO1bieS+TvDc+hcO7jBuhFZTxyc6tHCUFV43gYj9o9hANvgiO7Kgl4Ob8=
X-Received: by 2002:a05:6638:370b:b0:32e:a6ce:edcf with SMTP id
 k11-20020a056638370b00b0032ea6ceedcfmr8027934jav.267.1653342436174; Mon, 23
 May 2022 14:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220523153147.15371-1-frank.chang@sifive.com>
In-Reply-To: <20220523153147.15371-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 May 2022 07:46:50 +1000
Message-ID: <CAKmqyKPw5NTXTAu0bXCuXo6xL+GQ8d8h+AP9Dgqg1zqr9vK-CQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] target/riscv: Fix typo of mimpid cpu option
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 23 May 2022 21:47:33 -0000

On Tue, May 24, 2022 at 1:36 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> "mimpid" cpu option was mistyped to "mipid".
>
> Fixes: 9951ba94 ("target/riscv: Support configuarable marchid, mvendorid, mipid CSR values")
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 4 ++--
>  target/riscv/cpu.h | 2 +-
>  target/riscv/csr.c | 8 ++++----
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6d01569cad..a1f847176e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -37,7 +37,7 @@
>  #define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
>                               (QEMU_VERSION_MINOR << 8)  | \
>                               (QEMU_VERSION_MICRO))
> -#define RISCV_CPU_MIPID     RISCV_CPU_MARCHID
> +#define RISCV_CPU_MIMPID    RISCV_CPU_MARCHID
>
>  static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
>
> @@ -869,7 +869,7 @@ static Property riscv_cpu_properties[] = {
>
>      DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
>      DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
> -    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, RISCV_CPU_MIPID),
> +    DEFINE_PROP_UINT64("mimpid", RISCVCPU, cfg.mimpid, RISCV_CPU_MIMPID),
>
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f5ff7294c6..44975e3e5a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -408,7 +408,7 @@ struct RISCVCPUConfig {
>
>      uint32_t mvendorid;
>      uint64_t marchid;
> -    uint64_t mipid;
> +    uint64_t mimpid;
>
>      /* Vendor-specific custom extensions */
>      bool ext_XVentanaCondOps;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4ea7df02c9..0d5bc2f41d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -674,13 +674,13 @@ static RISCVException read_marchid(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> -static RISCVException read_mipid(CPURISCVState *env, int csrno,
> -                                 target_ulong *val)
> +static RISCVException read_mimpid(CPURISCVState *env, int csrno,
> +                                  target_ulong *val)
>  {
>      CPUState *cs = env_cpu(env);
>      RISCVCPU *cpu = RISCV_CPU(cs);
>
> -    *val = cpu->cfg.mipid;
> +    *val = cpu->cfg.mimpid;
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -3372,7 +3372,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      /* Machine Information Registers */
>      [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
>      [CSR_MARCHID]   = { "marchid",   any,   read_marchid   },
> -    [CSR_MIMPID]    = { "mimpid",    any,   read_mipid     },
> +    [CSR_MIMPID]    = { "mimpid",    any,   read_mimpid    },
>      [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid   },
>
>      [CSR_MCONFIGPTR]  = { "mconfigptr", any,   read_zero,
> --
> 2.35.1
>
>

