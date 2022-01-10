Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6oSk-0000VY-Cs
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 01:47:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6oSb-0000U0-Gx; Mon, 10 Jan 2022 01:47:17 -0500
Received: from [2607:f8b0:4864:20::132] (port=44849
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6oSX-0006KP-VA; Mon, 10 Jan 2022 01:47:15 -0500
Received: by mail-il1-x132.google.com with SMTP id v18so10463366ilm.11;
 Sun, 09 Jan 2022 22:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bl51vNyPjK5zLB2+mpim9LE7K8CFNP0la0B9UdYA5ms=;
 b=WG6nthosmbClgLElL2Ax5+SA9OYHoAuQxrnOmr8dJ21b/jvr+8JS+9K8tkUgFElk3o
 gO6gKi8I+c2yAc35USgQXO2Ekbm8gHk2T2CLo29ndvpw6o7tQHH+9pG038jf0sda7W4v
 fofJ9BVRo85b8jgMqygqEBd2yWhQseXYMIeSrexF3Vj+SpkWgCcO2yzch7qXaOKeos/J
 HQSWxtpkvxY0yQovxTu2aHftIUYcUQWixLHCZnprKBdMqL398zxCEwZEZJDwU/c0tcZj
 vAV8g90tjHeu/N7sltvKXhkaabynDZDQ1GOw8GtEx400PUxGXtK8vTYR6pykGorKZLg5
 u3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bl51vNyPjK5zLB2+mpim9LE7K8CFNP0la0B9UdYA5ms=;
 b=2cdJd9kUgQEcfxP+qCNXNkGuFG9dijKngTcUzdVZZxbjU+OiwA0Kb4ifdn1UM+JOZT
 d5dooyrTYxE+k/dKn2yOiCcEhNVLNDqb4ibc5wEU/TYTf/Ww1kZS2N0dS1Hrcu9S0Q12
 WdaBYhWnUepyA1o45DBGWbH2YT3JV0aszT4MdDhEL/MRMHLCZygNvA0kTmLNmv9zf73T
 dq+JDvug3M5rwnA5U9Qg8STHfAVc1IHaEYMCz3awxz/fcSzI+GJzm+SGYU+Zyxmisqy+
 l8lTLvYDNhQDjPWS4rPiD/Hv4xfj68/h0+uPQoMj3xXRlegwa9GGrHMBTp3EphtzVdw1
 tR0Q==
X-Gm-Message-State: AOAM533LSicSDlTQGY6NPIyrpZUfFk1D4bLm1Our8Cks9ibf2xZwgHzt
 nCScrC0TvWBhxcDmo6/N3aD8IaHaANP6yKuBT5E=
X-Google-Smtp-Source: ABdhPJxyqGMg9dTTSdW8nag4++7VEX/2EIU5M//7+Gw01o4eYA1hN2w/itMZ+b6gN9PISjlcp8DN13KN4fUrZOuKvi0=
X-Received: by 2002:a05:6e02:1567:: with SMTP id
 k7mr34663226ilu.46.1641797232201; 
 Sun, 09 Jan 2022 22:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20220107004846.378859-1-atishp@rivosinc.com>
 <20220107004846.378859-5-atishp@rivosinc.com>
In-Reply-To: <20220107004846.378859-5-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jan 2022 16:46:45 +1000
Message-ID: <CAKmqyKNx4R5Yw5mfc+dQ9Vf4y7bifSENvXx4XKx_3SpdB3=A3Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] target/riscv: pmu: Make number of counters
 configurable
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 10 Jan 2022 06:47:19 -0000

On Fri, Jan 7, 2022 at 12:19 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> The RISC-V privilege specification provides flexibility to implement
> any number of counters from 29 programmable counters. However, the QEMU
> implements all the counters.
>
> Make it configurable through pmu config parameter which now will indicate
> how many programmable counters should be implemented by the cpu.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c |  2 +-
>  target/riscv/cpu.h |  2 +-
>  target/riscv/csr.c | 96 ++++++++++++++++++++++++++++++----------------
>  3 files changed, 65 insertions(+), 35 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index df87489f6d87..9448c4335347 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -627,7 +627,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
> -    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
> +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 16d0b4f139ee..b353770596e8 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -312,12 +312,12 @@ struct RISCVCPU {
>          bool ext_zbb;
>          bool ext_zbc;
>          bool ext_zbs;
> -        bool ext_pmu;
>          bool ext_ifencei;
>          bool ext_icsr;
>          bool ext_zfh;
>          bool ext_zfhmin;
>
> +        uint8_t pmu_num;
>          char *priv_spec;
>          char *user_spec;
>          char *bext_spec;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index a6e856b896a9..e31c27e270a2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -58,15 +58,45 @@ static RISCVException vs(CPURISCVState *env, int csrno)
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
>
> +static RISCVException mctr(CPURISCVState *env, int csrno)
> +{
> +#if !defined(CONFIG_USER_ONLY)
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    int ctr_index;
> +    int base_csrno = CSR_MHPMCOUNTER3;
> +
> +    if ((riscv_cpu_mxl(env) == MXL_RV32) && csrno >= CSR_MCYCLEH) {
> +        /* Offset for RV32 mhpmcounternh counters */
> +        base_csrno += 0x80;
> +    }
> +    ctr_index = csrno - base_csrno;
> +    if (!cpu->cfg.pmu_num || ctr_index >= cpu->cfg.pmu_num) {
> +        /* The PMU is not enabled or counter is out of range*/
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +#endif
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException ctr(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
>      CPUState *cs = env_cpu(env);
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      int ctr_index;
> +    int base_csrno = CSR_HPMCOUNTER3;
> +    bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
> +
> +    if (rv32 && csrno >= CSR_CYCLEH) {
> +        /* Offset for RV32 hpmcounternh counters */
> +        base_csrno += 0x80;
> +    }
> +    ctr_index = csrno - base_csrno;
>
> -    if (!cpu->cfg.ext_pmu) {
> -        /* The PMU extension is not enabled */
> +    if (!cpu->cfg.pmu_num || ctr_index >= (cpu->cfg.pmu_num)) {
> +        /* No counter is enabled in PMU or the counter is out of range */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -94,7 +124,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>              }
>              break;
>          }
> -        if (riscv_cpu_is_32bit(env)) {
> +        if (rv32) {
>              switch (csrno) {
>              case CSR_CYCLEH:
>                  if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> @@ -149,7 +179,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>              }
>              break;
>          }
> -        if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        if (rv32) {
>              switch (csrno) {
>              case CSR_CYCLEH:
>                  if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> @@ -2060,35 +2090,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_HPMCOUNTER30]   = { "hpmcounter30",   ctr,    read_zero },
>      [CSR_HPMCOUNTER31]   = { "hpmcounter31",   ctr,    read_zero },
>
> -    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   any,    read_zero },
> -    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   any,    read_zero },
> -    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   any,    read_zero },
> -    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   any,    read_zero },
> -    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   any,    read_zero },
> -    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   any,    read_zero },
> -    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   any,    read_zero },
> -    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  any,    read_zero },
> -    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  any,    read_zero },
> -    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  any,    read_zero },
> -    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  any,    read_zero },
> -    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  any,    read_zero },
> -    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  any,    read_zero },
> -    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  any,    read_zero },
> -    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  any,    read_zero },
> -    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  any,    read_zero },
> -    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  any,    read_zero },
> -    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  any,    read_zero },
> -    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  any,    read_zero },
> -    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  any,    read_zero },
> -    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  any,    read_zero },
> -    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  any,    read_zero },
> -    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  any,    read_zero },
> -    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  any,    read_zero },
> -    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  any,    read_zero },
> -    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  any,    read_zero },
> -    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  any,    read_zero },
> -    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  any,    read_zero },
> -    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  any,    read_zero },
> +    [CSR_MHPMCOUNTER3]   = { "mhpmcounter3",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER4]   = { "mhpmcounter4",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER5]   = { "mhpmcounter5",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER6]   = { "mhpmcounter6",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER7]   = { "mhpmcounter7",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER8]   = { "mhpmcounter8",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER9]   = { "mhpmcounter9",   mctr,   read_zero },
> +    [CSR_MHPMCOUNTER10]  = { "mhpmcounter10",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER11]  = { "mhpmcounter11",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER12]  = { "mhpmcounter12",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER13]  = { "mhpmcounter13",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER14]  = { "mhpmcounter14",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER15]  = { "mhpmcounter15",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER16]  = { "mhpmcounter16",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER17]  = { "mhpmcounter17",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER18]  = { "mhpmcounter18",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER19]  = { "mhpmcounter19",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER20]  = { "mhpmcounter20",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER21]  = { "mhpmcounter21",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER22]  = { "mhpmcounter22",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER23]  = { "mhpmcounter23",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER24]  = { "mhpmcounter24",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER25]  = { "mhpmcounter25",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER26]  = { "mhpmcounter26",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER27]  = { "mhpmcounter27",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER28]  = { "mhpmcounter28",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER29]  = { "mhpmcounter29",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER30]  = { "mhpmcounter30",  mctr,   read_zero },
> +    [CSR_MHPMCOUNTER31]  = { "mhpmcounter31",  mctr,   read_zero },
>
>      [CSR_MHPMEVENT3]     = { "mhpmevent3",     any,    read_zero },
>      [CSR_MHPMEVENT4]     = { "mhpmevent4",     any,    read_zero },
> --
> 2.30.2
>
>

