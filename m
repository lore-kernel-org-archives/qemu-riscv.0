Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ni2Ln-0004gb-2o
	for mharc-qemu-riscv@gnu.org; Fri, 22 Apr 2022 19:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ni2Ll-0004gB-Gn; Fri, 22 Apr 2022 19:06:05 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ni2Lj-0002IF-RD; Fri, 22 Apr 2022 19:06:05 -0400
Received: by mail-io1-xd36.google.com with SMTP id z19so5504759iof.12;
 Fri, 22 Apr 2022 16:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7F9AG9ma4bzjuBiwdABwwb8ME9fek2vaq7tbYSOQjIk=;
 b=VKq0rgjF/+pG4og8UKscN4jw6q2T36DinBc0YRYeGUf5uhWA5f2jEWXVjFUFkNM+oC
 u/W6rbsOrdW8VoS3bSciHrjIfbIF6Iwtjk798pi4knC/LBMzro0FjUCpAFq48xmuRm+J
 7UAIs5bU91ztewSUX3J2wve5dPqq4TkWxjsCxSQgEOdSgo6ztueupuvl8gSXwaf83OuC
 zyfAUHB2H7iUNRr+lORBLhTMU6uA86KVeSTLu7wMmdD3xOiMgzAU8lc3f+0OJK0NmqrG
 AuSL7aaJV/f0CToWonWy85gKT9M/tTeSQ+DuLj5fFy2f1PI4LaK2anKzw9I9jOXv/APw
 tZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7F9AG9ma4bzjuBiwdABwwb8ME9fek2vaq7tbYSOQjIk=;
 b=JYSxXgYDLwSp/AOWFUxbz8ItMT17m9phcwbRlSu81a3HbZA382lwhW8YCN7o8zQIl4
 4+ZKRMCdQARMlezZB/9zsB2l6L66WEyw33RIfo52jAOlQXJyp2J6tibhBnsttysa7WdE
 tefSVmtfPJYQmkAEsWxnz1JbU4DBc8OH69PAKD0WucQabe7h/tVbD0zWEPHVolOk8U3O
 CKTJNtcwJ2dn1Z0VCgCVVBEIdKPqJ27YSZp7mLM+84Nj2PG8XwZLaNNiC5B9Jg+c3itx
 MF4c8jRY9TmNIRxhrymnDjprKsh2RtNxL7BdonBEUqgbm+Ec/7BQipqIe3CtcsF0YVKh
 kB9g==
X-Gm-Message-State: AOAM5323+SfXzgu6LcPdCyj7bfFBmovlFZGrnu4NfX7sC7Kv/raH238F
 jN9tj73uCxI/vWxlR1J314b8sy8ScQbp3NLUBEI=
X-Google-Smtp-Source: ABdhPJw68Ruv4faDxA5e72yFGSgc2DlEgg4X3tn6ZdF0Sm9mfuPpSit7Pu6gCQVP7KXtbUV7InXd4+Xtx+vtYnO6mu0=
X-Received: by 2002:a05:6638:d06:b0:326:ba0:347 with SMTP id
 q6-20020a0566380d0600b003260ba00347mr3031474jaj.68.1650668761846; Fri, 22 Apr
 2022 16:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220422040436.2233-1-frank.chang@sifive.com>
In-Reply-To: <20220422040436.2233-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 23 Apr 2022 09:05:35 +1000
Message-ID: <CAKmqyKPEx1EYfsBba7TXPGbQsDGYV+qMToE2XKqAxBUu=JQopQ@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Support configuarable marchid,
 mvendorid, mipid CSR values
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Jim Shu <jim.shu@sifive.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Fri, 22 Apr 2022 23:06:06 -0000

On Fri, Apr 22, 2022 at 2:05 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Allow user to set core's marchid, mvendorid, mipid CSRs through
> -cpu command line option.
>
> The default values of marchid and mipid are built with QEMU's version
> numbers.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c |  9 +++++++++
>  target/riscv/cpu.h |  4 ++++
>  target/riscv/csr.c | 38 ++++++++++++++++++++++++++++++++++----
>  3 files changed, 47 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0c774056c5..ace68ed855 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,11 @@
>
>  /* RISC-V CPU definitions */
>
> +#define RISCV_CPU_MARCHID   ((QEMU_VERSION_MAJOR << 16) | \
> +                             (QEMU_VERSION_MINOR << 8)  | \
> +                             (QEMU_VERSION_MICRO))
> +#define RISCV_CPU_MIPID     RISCV_CPU_MARCHID
> +
>  static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
>
>  struct isa_ext_data {
> @@ -810,6 +815,10 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
>
> +    DEFINE_PROP_UINT32("mvendorid", RISCVCPU, cfg.mvendorid, 0),
> +    DEFINE_PROP_UINT64("marchid", RISCVCPU, cfg.marchid, RISCV_CPU_MARCHID),
> +    DEFINE_PROP_UINT64("mipid", RISCVCPU, cfg.mipid, RISCV_CPU_MIPID),
> +
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>      DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 34c22d5d3b..46c66fbf8e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -393,6 +393,10 @@ struct RISCVCPUConfig {
>      bool ext_zve32f;
>      bool ext_zve64f;
>
> +    uint32_t mvendorid;
> +    uint64_t marchid;
> +    uint64_t mipid;
> +
>      /* Vendor-specific custom extensions */
>      bool ext_XVentanaCondOps;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6ba85e7b5d..1c2d3f7193 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -612,6 +612,36 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
>      return RISCV_EXCP_NONE;
>  }
>
> +static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
> +                                     target_ulong *val)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    *val = cpu->cfg.mvendorid;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_marchid(CPURISCVState *env, int csrno,
> +                                   target_ulong *val)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    *val = cpu->cfg.marchid;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_mipid(CPURISCVState *env, int csrno,
> +                                 target_ulong *val)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    *val = cpu->cfg.mipid;
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException read_mhartid(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>  {
> @@ -3260,10 +3290,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
>
>      /* Machine Information Registers */
> -    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
> -    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
> -    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
> -    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> +    [CSR_MVENDORID] = { "mvendorid", any,   read_mvendorid },
> +    [CSR_MARCHID]   = { "marchid",   any,   read_marchid   },
> +    [CSR_MIMPID]    = { "mimpid",    any,   read_mipid     },
> +    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid   },
>
>      [CSR_MCONFIGPTR]  = { "mconfigptr", any,   read_zero,
>                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> --
> 2.35.1
>
>

