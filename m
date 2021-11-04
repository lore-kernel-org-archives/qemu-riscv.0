Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1miUj9-0001zJ-HT
	for mharc-qemu-riscv@gnu.org; Thu, 04 Nov 2021 00:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1miUj7-0001xE-RD; Thu, 04 Nov 2021 00:51:49 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:36803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1miUj6-000816-9A; Thu, 04 Nov 2021 00:51:49 -0400
Received: by mail-io1-xd35.google.com with SMTP id e144so5585446iof.3;
 Wed, 03 Nov 2021 21:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mULopZP3r8CZoMaKH7eLEtct6ZMONe69Xa0niqT8ueY=;
 b=PdPv3cw1AZZbFo25KqUnEqQujR3aE2U9rugicaVswu6pVMT235B6/+m9XzL25QHcl/
 zQVc0tukuxuq/76kF2jTGWRLkM2SaSG+k11u7dzkyQ1U+Zf8XOq6TpbgtzGHw4ZysVJK
 limcs90hwrI6jY8A9nJB+/i60SRvWCKJIML13wT7PAVa0Xr+prdm03vvvbMK9e6A9ham
 tjvdiHtMV+sAq1DHFFBEKyxzNZGDtH/FUwQDtdt+J0OTP+xzsb6oqZWikUut26FiPhyx
 3GgjU06AR66lVKg9YHEUmh7IfHi/KYyMCK1K2/umkXbZ5BjMiTn5Pb8EbtkPW5N/dGPU
 Fj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mULopZP3r8CZoMaKH7eLEtct6ZMONe69Xa0niqT8ueY=;
 b=PED6KyBb2tOrKs0bzx3+DGCjQzByXvNWvsw2lzLh7zsjCrdKscn9zaZ5YI1rLxcPwx
 034JVkW9XgbRMvFXPCp1Y0SBnyPeI/EY0HdtJlCPaLWjcC+rIuDoxNPR93qguO0ALG9A
 qnN01aOFXw/ivtJyu9Cll4AJMdb9po9pj2Bsu00cyOai7pK8abETFr0qzsVJeHfK1cd3
 QArKnk0bVyRSHvbawhP3TvWl06Ew19lSaWuZ0SPg0W6sFk18SnK3sDV4SPaEfoR++a9F
 E5SANP1x99suLnMGyRlfk7Dhy+Cj6j+p21ZHlj3YrARI7zr5VIne4wxt/hnJtYZxayYG
 G9wQ==
X-Gm-Message-State: AOAM532seLo8niTz1PX5upxQ+FOox7k+SGFVDQKXqJB7SZ01O0EOpx6C
 3T1fJZ68ND/yZ82vVAh/MDqun2speZMULkVgbhM=
X-Google-Smtp-Source: ABdhPJytpwe3kjW+zFva3wW38RFHOfVFiDmeenc6mhiq4hdt9deQohv7bP/HZTKGyh2gFyFsiE6QipgCGZ4fzH5ZGKQ=
X-Received: by 2002:a05:6602:2434:: with SMTP id
 g20mr7178974iob.57.1636001506824; 
 Wed, 03 Nov 2021 21:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211026064227.2014502-1-anup.patel@wdc.com>
 <20211026064227.2014502-13-anup.patel@wdc.com>
In-Reply-To: <20211026064227.2014502-13-anup.patel@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Nov 2021 14:51:20 +1000
Message-ID: <CAKmqyKOnfvwqWAEdUq+h6OyXTSnNJ0ZZ3+CJbkyeJEKk6htSjQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/22] target/riscv: Implement AIA interrupt filtering
 CSRs
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Thu, 04 Nov 2021 04:51:50 -0000

On Tue, Oct 26, 2021 at 5:44 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The AIA specificaiton adds interrupt filtering support for M-mode
> and HS-mode. Using AIA interrupt filtering M-mode and H-mode can
> take local interrupt 13 or above and selectively inject same local
> interrupt to lower privilege modes.
>
> At the moment, we don't have any local interrupts above 12 so we
> add dummy implementation (i.e. read zero and ignore write) of AIA
> interrupt filtering CSRs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 46d0cabbde..43ae444774 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -153,6 +153,15 @@ static RISCVException any32(CPURISCVState *env, int csrno)
>
>  }
>
> +static int aia_any(CPURISCVState *env, int csrno)
> +{
> +    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return any(env, csrno);
> +}
> +
>  static int aia_any32(CPURISCVState *env, int csrno)
>  {
>      if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> @@ -515,6 +524,12 @@ static RISCVException read_zero(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException write_ignore(CPURISCVState *env, int csrno,
> +                                   target_ulong val)
> +{
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_mhartid(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>  {
> @@ -2071,9 +2086,15 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MTVAL]    = { "mtval",    any,  read_mtval,    write_mtval    },
>      [CSR_MIP]      = { "mip",      any,  NULL,    NULL, rmw_mip        },
>
> +    /* Virtual Interrupts for Supervisor Level (AIA) */
> +    [CSR_MVIEN]      = { "mvien", aia_any, read_zero, write_ignore },
> +    [CSR_MVIP]       = { "mvip",  aia_any, read_zero, write_ignore },
> +
>      /* Machine-Level High-Half CSRs (AIA) */
>      [CSR_MIDELEGH] = { "midelegh", aia_any32, NULL, NULL, rmw_midelegh },
>      [CSR_MIEH]     = { "mieh",     aia_any32, NULL, NULL, rmw_mieh     },
> +    [CSR_MVIENH]   = { "mvienh",   aia_any32, read_zero,  write_ignore },
> +    [CSR_MVIPH]    = { "mviph",    aia_any32, read_zero,  write_ignore },
>      [CSR_MIPH]     = { "miph",     aia_any32, NULL, NULL, rmw_miph     },
>
>      /* Supervisor Trap Setup */
> @@ -2125,12 +2146,14 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MTINST]      = { "mtinst",      hmode,   read_mtinst,      write_mtinst      },
>
>      /* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
> +    [CSR_HVIEN]       = { "hvien",       aia_hmode, read_zero, write_ignore },
>      [CSR_HVICTL]      = { "hvictl",      aia_hmode, read_hvictl, write_hvictl },
>      [CSR_HVIPRIO1]    = { "hviprio1",    aia_hmode, read_hviprio1,   write_hviprio1 },
>      [CSR_HVIPRIO2]    = { "hviprio2",    aia_hmode, read_hviprio2,   write_hviprio2 },
>
>      /* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
>      [CSR_HIDELEGH]    = { "hidelegh",    aia_hmode32, NULL, NULL, rmw_hidelegh },
> +    [CSR_HVIENH]      = { "hvienh",      aia_hmode32, read_zero, write_ignore },
>      [CSR_HVIPH]       = { "hviph",       aia_hmode32, NULL, NULL, rmw_hviph },
>      [CSR_HVIPRIO1H]   = { "hviprio1h",   aia_hmode32, read_hviprio1h, write_hviprio1h },
>      [CSR_HVIPRIO2H]   = { "hviprio2h",   aia_hmode32, read_hviprio2h, write_hviprio2h },
> --
> 2.25.1
>
>

