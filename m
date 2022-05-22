Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nsusg-0006pQ-6N
	for mharc-qemu-riscv@gnu.org; Sun, 22 May 2022 19:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nsuse-0006la-AZ; Sun, 22 May 2022 19:21:00 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:39572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nsusc-0006q3-Gp; Sun, 22 May 2022 19:20:59 -0400
Received: by mail-il1-x132.google.com with SMTP id e9so4309116ilq.6;
 Sun, 22 May 2022 16:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+CqV0llBJvPs04wHfPIrl8i82qQH8Lj2z9c9MToRqng=;
 b=ViwpxG4GpVPQKz3suZIW6FCiewhbbCmK9PnmAY/Tcxxhg72gHVSvqCtRmDhvmfh/8J
 IDjcsqS5en1tpAEz/YVO9myFN61smAp1RooOYvaXAuTI/IeBgNh+cLrtU7+OJccVNzMj
 YryVGEbYP2tmLBNUBmBoiFLB8tz+NNpYbqvqn0DcwP2PbRSjk+h++kA3oJEf3W6P2P2E
 GaruINn9ow5l0FodR89WPam9fyYFXWuzwuRfYNp8AWiK2MICmQ7HlfKH2tl7y3AYaodQ
 Li07paRmsvCw8A3WoPmlCdkeu8b92XyAeVY/J78WV69R6Y+YGvZ7j2gwWQaETu7IN6vc
 B86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+CqV0llBJvPs04wHfPIrl8i82qQH8Lj2z9c9MToRqng=;
 b=BhzKYS1U+s0Man3RavueE2LjNDrBmc1cYBSm2ZM5walmZ9ip0Xhfu9TYNwkEPxASsx
 1DuTpcAfri5hvJtd4tnk5SytNFgUBqq8jEQoaY71e2G8rvcdgHC2cz03QjDn1LUKRSUJ
 zd8Og4DNjupWC7Frlzjr9KW9UlLTg1l6DxvDt8WH4S2bAEewAMuYkNsmFgqr7SogXX98
 Ziye1iuqktMZd0C7pZk3XrL38rzlKvHYvU1H+/onXBylWREgtfFT5eJx9F+8nFE96QGO
 P3upNirjLF8blRxRH1cFlLcHcboJGUg0Xm/3H87siX5HYO1YiSy8lksT8bH0cwTPsPNC
 Rn4g==
X-Gm-Message-State: AOAM533Od9jbpCDKeKfcKYl+9uPGOpiPSGCQV5C11d/1EuiBYDlmushz
 jtI3FyYyWSHHg/TiG+LjHdSdvf7isCu/cPuDFtgwKnAMIBAJhphGOJw=
X-Google-Smtp-Source: ABdhPJzxZmD9Lx83o8Q+tUYmnAOt+jTdHbvpF++/m0ISYD0esVQpkPIVQ2jvDq+QRL20gPyQNFAWLYTy4+/7vlGT+cU=
X-Received: by 2002:a05:6e02:1986:b0:2cf:908d:3d0a with SMTP id
 g6-20020a056e02198600b002cf908d3d0amr10140133ilf.113.1653261656165; Sun, 22
 May 2022 16:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220520091514.17866-1-frank.chang@sifive.com>
In-Reply-To: <20220520091514.17866-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 May 2022 09:20:30 +1000
Message-ID: <CAKmqyKMuFN_v3QMH8yatq035WH2F9Tg1DZmRms0F3=9CaatLZw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix typo of mimpid cpu option
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Sun, 22 May 2022 23:21:00 -0000

On Fri, May 20, 2022 at 7:16 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> "mimpid" cpu option was mistyped to "mipid".
> Fixes commit: 9951ba94

Can you use the `Fixes:` tag here instead (have a look in the QEMU log
for examples).

>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

