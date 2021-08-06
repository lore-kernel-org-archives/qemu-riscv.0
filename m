Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBt8T-0001tU-OX
	for mharc-qemu-riscv@gnu.org; Fri, 06 Aug 2021 02:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBt8Q-0001s8-NG; Fri, 06 Aug 2021 02:15:10 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:34672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBt8O-0008JJ-AW; Fri, 06 Aug 2021 02:15:10 -0400
Received: by mail-yb1-xb30.google.com with SMTP id a93so13323152ybi.1;
 Thu, 05 Aug 2021 23:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jp7LzJiWOoc1knVrCSsWyS9DsjK/djWlG20UeAyK1xo=;
 b=spHp75IJH0sm6OBA5VpnQ5spcrgK0N95VwRQZjp7UOFOLWUrePZhOHrkN/CNQUOrk4
 TQf5x0gOyW7v7rbi42XqnJITW37c/IvIDSYi5OM2Uom/b8SckT21cukvZbA3syz3p+fW
 w4PplUc8pftj6xYoJuwhrVTR8P3xXfdmPcsciz02jlOhwDVKN/hhQ8NBfHK7rn9DbkEZ
 BKWCSh3T2pWZ1VAurEX2AWx4Z88lH2YjRLzpOYxWT8/Or1e6jzYR5syChLnrCMOuj6zd
 fNsynlPPQH2HTQ2bOaps0PXk8OxAVUiU+hP4kT7yfIxxYED+I2h7GwnSec54SdqXLQuG
 YKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jp7LzJiWOoc1knVrCSsWyS9DsjK/djWlG20UeAyK1xo=;
 b=D2sQU+rxNZb0hXk9XaAphHguI9KtB/k2BonWMz1D4KTIJ8J7EkD4XDSj1gze7S1lef
 fBBjLrV3WmL8v5u9Q7zYqqaKBuv15QXfK7L74h2fLawVmzGo95IOlJU1oUJAux177d47
 +ruvQJN+F+OEChDVjvxp6eKDdtjMKKnsU+653jWomCd8F7wn9BiIDxl5p13j9BYPNo3l
 ZNxjdRqG3lB5tZiC3pLNHy6GWkdfgNdA5j1pB741zQljCLepzQCHgiS92rvXYk9a1t+B
 LXarMTcg1phT0Pvixl7QfHqcnZNDnhN1P/Yr62WjnNKBx4c/QCyOikLlaA/UGC7IksJi
 OgvQ==
X-Gm-Message-State: AOAM533CRJcWh4Skqj/j7FKstho2CgTPI/+sM1z1qUD3aRzTO3/1KK/R
 +nxYi8ETnQDAsceSzow0eQpaDIzutD4JJ/z3IygGLcu/Uas=
X-Google-Smtp-Source: ABdhPJy/eRrb2YNAFvqldVPH0PNTf3+HUSm7F2GVzk9eRx7aoOqq9Z6USbkzIzFf93+CU4Y1jBfBKhLAlfOYnQFhNcY=
X-Received: by 2002:a25:be09:: with SMTP id h9mr11402311ybk.239.1628230506354; 
 Thu, 05 Aug 2021 23:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210805175626.11573-1-ruinland@andestech.com>
 <20210805175626.11573-5-ruinland@andestech.com>
In-Reply-To: <20210805175626.11573-5-ruinland@andestech.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Aug 2021 14:14:54 +0800
Message-ID: <CAEUhbmU+EezdH8pFBndukUzBwhO-WpOUw8Dpq7Z_f2RggaBwCw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 4/4] Enable custom CSR logic for Andes AX25 and A25
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 Dylan Jhong <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Aug 2021 06:15:11 -0000

On Fri, Aug 6, 2021 at 1:57 AM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> From: Ruinalnd ChuanTzu Tsai <ruinland@andestech.com>
>
> In this patch we enabled custom CSR logic for Andes AX25 and A25 logic.
> Hence csr_andes.inc.c and andes_cpu_bits.h is added.
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>
> ---
>  target/riscv/andes_cpu_bits.h  | 124 +++++++++++++++++++++++++
>  target/riscv/cpu.c             |  12 +++
>  target/riscv/csr.c             |   2 +-
>  target/riscv/csr_andes.inc.c   | 160 +++++++++++++++++++++++++++++++++
>  target/riscv/custom_cpu_bits.h |   6 +-
>  5 files changed, 302 insertions(+), 2 deletions(-)
>  create mode 100644 target/riscv/andes_cpu_bits.h
>  create mode 100644 target/riscv/csr_andes.inc.c
>
> diff --git a/target/riscv/andes_cpu_bits.h b/target/riscv/andes_cpu_bits.h
> new file mode 100644
> index 0000000..bd2b7d1
> --- /dev/null
> +++ b/target/riscv/andes_cpu_bits.h
> @@ -0,0 +1,124 @@
> +/*
> + * Andes custom CSRs bit definitions
> + *
> + * Copyright (c) 2021 Andes Technology Corp.
> + * SPDX-License-Identifier: GPL-2.0+

nits: please put the license at the beginning of this comment block

> + */
> +
> +/* ========= Missing drafted/standard CSR definitions */
> +/* Although TINFO is in official debug sepc, it's not in cpu_bits.h yet. */
> +#define CSR_TINFO           0x7a4
> +
> +/* ========= AndeStar V5 machine mode CSRs ========= */
> +/* Configuration Registers */
> +#define CSR_MICM_CFG            0xfc0
> +#define CSR_MDCM_CFG            0xfc1
> +#define CSR_MMSC_CFG            0xfc2
> +#define CSR_MMSC_CFG2           0xfc3
> +#define CSR_MVEC_CFG            0xfc7
> +
> +/* Crash Debug CSRs */
> +#define CSR_MCRASH_STATESAVE    0xfc8
> +#define CSR_MSTATUS_CRASHSAVE   0xfc9
> +
> +/* Memory CSRs */
> +#define CSR_MILMB               0x7c0
> +#define CSR_MDLMB               0x7c1
> +#define CSR_MECC_CODE           0x7C2

nits: please make 0x7C2 lower cases

> +#define CSR_MNVEC               0x7c3
> +#define CSR_MCACHE_CTL          0x7ca
> +#define CSR_MCCTLBEGINADDR      0x7cb
> +#define CSR_MCCTLCOMMAND        0x7cc
> +#define CSR_MCCTLDATA           0x7cd
> +#define CSR_MPPIB               0x7f0
> +#define CSR_MFIOB               0x7f1
> +
> +/* Hardware Stack Protection & Recording */
> +#define CSR_MHSP_CTL            0x7c6
> +#define CSR_MSP_BOUND           0x7c7
> +#define CSR_MSP_BASE            0x7c8
> +#define CSR_MXSTATUS            0x7c4
> +#define CSR_MDCAUSE             0x7c9
> +#define CSR_MSLIDELEG           0x7d5
> +#define CSR_MSAVESTATUS         0x7d6
> +#define CSR_MSAVEEPC1           0x7d7
> +#define CSR_MSAVECAUSE1         0x7d8
> +#define CSR_MSAVEEPC2           0x7d9
> +#define CSR_MSAVECAUSE2         0x7da
> +#define CSR_MSAVEDCAUSE1        0x7db
> +#define CSR_MSAVEDCAUSE2        0x7dc
> +
> +/* Control CSRs */
> +#define CSR_MPFT_CTL            0x7c5
> +#define CSR_MMISC_CTL           0x7d0
> +#define CSR_MCLK_CTL            0x7df
> +
> +/* Counter related CSRs */
> +#define CSR_MCOUNTERWEN         0x7ce
> +#define CSR_MCOUNTERINTEN       0x7cf
> +#define CSR_MCOUNTERMASK_M      0x7d1
> +#define CSR_MCOUNTERMASK_S      0x7d2
> +#define CSR_MCOUNTERMASK_U      0x7d3
> +#define CSR_MCOUNTEROVF         0x7d4
> +
> +/* Enhanced CLIC CSRs */
> +#define CSR_MIRQ_ENTRY          0x7ec
> +#define CSR_MINTSEL_JAL         0x7ed
> +#define CSR_PUSHMCAUSE          0x7ee
> +#define CSR_PUSHMEPC            0x7ef
> +#define CSR_PUSHMXSTATUS        0x7eb
> +
> +/* Andes Physical Memory Attribute(PMA) CSRs */
> +#define CSR_PMACFG0             0xbc0
> +#define CSR_PMACFG1             0xbc1
> +#define CSR_PMACFG2             0xbc2
> +#define CSR_PMACFG3             0xbc3
> +#define CSR_PMAADDR0            0xbd0
> +#define CSR_PMAADDR1            0xbd1
> +#define CSR_PMAADDR2            0xbd2
> +#define CSR_PMAADDR3            0xbd2
> +#define CSR_PMAADDR4            0xbd4
> +#define CSR_PMAADDR5            0xbd5
> +#define CSR_PMAADDR6            0xbd6
> +#define CSR_PMAADDR7            0xbd7
> +#define CSR_PMAADDR8            0xbd8
> +#define CSR_PMAADDR9            0xbd9
> +#define CSR_PMAADDR10           0xbda
> +#define CSR_PMAADDR11           0xbdb
> +#define CSR_PMAADDR12           0xbdc
> +#define CSR_PMAADDR13           0xbdd
> +#define CSR_PMAADDR14           0xbde
> +#define CSR_PMAADDR15           0xbdf
> +
> +/* ========= AndeStar V5 supervisor mode CSRs ========= */
> +/* Supervisor trap registers */
> +#define CSR_SLIE                0x9c4
> +#define CSR_SLIP                0x9c5
> +#define CSR_SDCAUSE             0x9c9
> +
> +/* Supervisor counter registers */
> +#define CSR_SCOUNTERINTEN       0x9cf
> +#define CSR_SCOUNTERMASK_M      0x9d1
> +#define CSR_SCOUNTERMASK_S      0x9d2
> +#define CSR_SCOUNTERMASK_U      0x9d3
> +#define CSR_SCOUNTEROVF         0x9d4
> +#define CSR_SCOUNTINHIBIT       0x9e0
> +#define CSR_SHPMEVENT3          0x9e3
> +#define CSR_SHPMEVENT4          0x9e4
> +#define CSR_SHPMEVENT5          0x9e5
> +#define CSR_SHPMEVENT6          0x9e6
> +
> +/* Supervisor control registers */
> +#define CSR_SCCTLDATA           0x9cd
> +#define CSR_SMISC_CTL           0x9d0
> +
> +/* ========= AndeStar V5 user mode CSRs ========= */
> +/* User mode control registers */
> +#define CSR_UITB                0x800
> +#define CSR_UCODE               0x801
> +#define CSR_UDCAUSE             0x809
> +#define CSR_UCCTLBEGINADDR      0x80b
> +#define CSR_UCCTLCOMMAND        0x80c
> +#define CSR_WFE                 0x810
> +#define CSR_SLEEPVALUE          0x811
> +#define CSR_TXEVT               0x812
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9eb1e3a..d1d4773 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -187,6 +187,12 @@ static void ax25_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +
> +    #if defined(CONFIG_RISCV_CUSTOM)

nits: no space before #if

> +    /* setup custom csr handler hash table */
> +    setup_custom_csr(env, andes_custom_csr_table);
> +    env->custom_csr_val = g_malloc(andes_custom_csr_size);
> +    #endif
>  }
>
>  static void rv64_sifive_u_cpu_init(Object *obj)
> @@ -248,6 +254,12 @@ static void a25_cpu_init(Object *obj)
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
>      set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>      set_priv_version(env, PRIV_VERSION_1_10_0);
> +
> +    #if defined(CONFIG_RISCV_CUSTOM)
> +    /* setup custom csr handler hash table */
> +    setup_custom_csr(env, andes_custom_csr_table);
> +    env->custom_csr_val = g_malloc(andes_custom_csr_size);
> +    #endif
>  }
>  #endif
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 1c4dc94..9c16b88 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1421,7 +1421,7 @@ int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
>  }
>
>  #if defined(CONFIG_RISCV_CUSTOM)
> -/* Include the custom CSR table here. */
> +#include "csr_andes.inc.c"
>  #endif
>
>  /* Control and Status Register function table */
> diff --git a/target/riscv/csr_andes.inc.c b/target/riscv/csr_andes.inc.c
> new file mode 100644
> index 0000000..da226b0
> --- /dev/null
> +++ b/target/riscv/csr_andes.inc.c
> @@ -0,0 +1,160 @@
> +/*
> + * Andes custom CSR table and handling functions
> + *
> + * Copyright (c) 2021 Andes Technology Corp.
> + * SPDX-License-Identifier: GPL-2.0+
> + */
> +
> +static int write_uitb(CPURISCVState *env, int csrno, target_ulong val);
> +static int read_uitb(CPURISCVState *env, int csrno, target_ulong *val);
> +
> +struct andes_csr_val {
> +    target_long uitb;
> +};
> +
> +static int read_mmsc_cfg(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    /* enable pma probe */
> +    *val = 0x40000000;
> +    return 0;
> +}
> +
> +static int write_uitb(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    struct andes_csr_val *andes_csr = env->custom_csr_val;
> +    andes_csr->uitb = val;
> +    return 0;
> +}
> +
> +static int read_uitb(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    struct andes_csr_val *andes_csr = env->custom_csr_val;
> +    *val = andes_csr->uitb;
> +    return 0;
> +}
> +
> +
> +int andes_custom_csr_size = sizeof(struct andes_csr_val);
> +riscv_custom_csr_operations andes_custom_csr_table[MAX_CUSTOM_CSR_NUM] = {
> +    /* ==================== AndeStar V5 machine mode CSRs ==================== */
> +    /* Configuration Registers */
> +    {CSR_MICM_CFG,         { "micm_cfg",          any, read_zero, write_stub} },
> +    {CSR_MDCM_CFG,         { "mdcm_cfg",          any, read_zero, write_stub} },
> +    {CSR_MMSC_CFG,         { "mmsc_cfg",          any, read_mmsc_cfg, write_stub} },
> +    {CSR_MMSC_CFG2,        { "mmsc_cfg2",         any, read_zero, write_stub} },
> +    {CSR_MVEC_CFG,         { "mvec_cfg",          any, read_zero, write_stub} },
> +
> +    /* Crash Debug CSRs */
> +    {CSR_MCRASH_STATESAVE,  { "mcrash_statesave",  any, read_zero, write_stub} },
> +    {CSR_MSTATUS_CRASHSAVE, { "mstatus_crashsave", any, read_zero, write_stub} },
> +
> +    /* Memory CSRs */
> +    {CSR_MILMB,            { "milmb",             any, read_zero, write_stub} },
> +    {CSR_MDLMB,            { "mdlmb",             any, read_zero, write_stub} },
> +    {CSR_MECC_CODE,        { "mecc_code",         any, read_zero, write_stub} },
> +    {CSR_MNVEC,            { "mnvec",             any, read_zero, write_stub} },
> +    {CSR_MCACHE_CTL,       { "mcache_ctl",        any, read_zero, write_stub} },
> +    {CSR_MCCTLBEGINADDR,   { "mcctlbeginaddr",    any, read_zero, write_stub} },
> +    {CSR_MCCTLCOMMAND,     { "mcctlcommand",      any, read_zero, write_stub} },
> +    {CSR_MCCTLDATA,        { "mcctldata",         any, read_zero, write_stub} },
> +    {CSR_MPPIB,            { "mppib",             any, read_zero, write_stub} },
> +    {CSR_MFIOB,            { "mfiob",             any, read_zero, write_stub} },
> +
> +    /* Hardware Stack Protection & Recording */
> +    {CSR_MHSP_CTL,         { "mhsp_ctl",          any, read_zero, write_stub} },
> +    {CSR_MSP_BOUND,        { "msp_bound",         any, read_zero, write_stub} },
> +    {CSR_MSP_BASE,         { "msp_base",          any, read_zero, write_stub} },
> +    {CSR_MXSTATUS,         { "mxstatus",          any, read_zero, write_stub} },
> +    {CSR_MDCAUSE,          { "mdcause",           any, read_zero, write_stub} },
> +    {CSR_MSLIDELEG,        { "mslideleg",         any, read_zero, write_stub} },
> +    {CSR_MSAVESTATUS,      { "msavestatus",       any, read_zero, write_stub} },
> +    {CSR_MSAVEEPC1,        { "msaveepc1",         any, read_zero, write_stub} },
> +    {CSR_MSAVECAUSE1,      { "msavecause1",       any, read_zero, write_stub} },
> +    {CSR_MSAVEEPC2,        { "msaveepc2",         any, read_zero, write_stub} },
> +    {CSR_MSAVECAUSE2,      { "msavecause2",       any, read_zero, write_stub} },
> +    {CSR_MSAVEDCAUSE1,     { "msavedcause1",      any, read_zero, write_stub} },
> +    {CSR_MSAVEDCAUSE2,     { "msavedcause2",      any, read_zero, write_stub} },
> +
> +    /* Control CSRs */
> +    {CSR_MPFT_CTL,         { "mpft_ctl",          any, read_zero, write_stub} },
> +    {CSR_MMISC_CTL,        { "mmisc_ctl",         any, read_zero, write_stub} },
> +    {CSR_MCLK_CTL,         { "mclk_ctl",          any, read_zero, write_stub} },
> +
> +    /* Counter related CSRs */
> +    {CSR_MCOUNTERWEN,      { "mcounterwen",       any, read_zero, write_stub} },
> +    {CSR_MCOUNTERINTEN,    { "mcounterinten",     any, read_zero, write_stub} },
> +    {CSR_MCOUNTERMASK_M,   { "mcountermask_m",    any, read_zero, write_stub} },
> +    {CSR_MCOUNTERMASK_S,   { "mcountermask_s",    any, read_zero, write_stub} },
> +    {CSR_MCOUNTERMASK_U,   { "mcountermask_u",    any, read_zero, write_stub} },
> +    {CSR_MCOUNTEROVF,      { "mcounterovf",       any, read_zero, write_stub} },
> +
> +    /* Enhanced CLIC CSRs */
> +    {CSR_MIRQ_ENTRY,       { "mirq_entry",        any, read_zero, write_stub} },
> +    {CSR_MINTSEL_JAL,      { "mintsel_jal",       any, read_zero, write_stub} },
> +    {CSR_PUSHMCAUSE,       { "pushmcause",        any, read_zero, write_stub} },
> +    {CSR_PUSHMEPC,         { "pushmepc",          any, read_zero, write_stub} },
> +    {CSR_PUSHMXSTATUS,     { "pushmxstatus",      any, read_zero, write_stub} },
> +
> +    /* Andes Physical Memory Attribute(PMA) CSRs */
> +    {CSR_PMACFG0,          { "pmacfg0",           any, read_zero, write_stub} },
> +    {CSR_PMACFG1,          { "pmacfg1",           any, read_zero, write_stub} },
> +    {CSR_PMACFG2,          { "pmacfg2",           any, read_zero, write_stub} },
> +    {CSR_PMACFG3,          { "pmacfg3",           any, read_zero, write_stub} },
> +    {CSR_PMAADDR0,         { "pmaaddr0",          any, read_zero, write_stub} },
> +    {CSR_PMAADDR1,         { "pmaaddr1",          any, read_zero, write_stub} },
> +    {CSR_PMAADDR2,         { "pmaaddr2",          any, read_zero, write_stub} },
> +    {CSR_PMAADDR3,         { "pmaaddr3",          any, read_zero, write_stub} },
> +    {CSR_PMAADDR4,         { "pmaaddr4",          any, read_zero, write_stub} },
> +    {CSR_PMAADDR5,         { "pmaaddr5",          any, read_zero, write_stub} },
> +    {CSR_PMAADDR6,         { "pmaaddr6",          any, read_zero, write_stub} },
> +    {CSR_PMAADDR7,         { "pmaaddr7",          any, read_zero, write_stub} },
> +    {CSR_PMAADDR8,         { "pmaaddr8",          any, read_zero, write_stub} },
> +    {CSR_PMAADDR9,         { "pmaaddr9",          any, read_zero, write_stub} },
> +    {CSR_PMAADDR10,        { "pmaaddr10",         any, read_zero, write_stub} },
> +    {CSR_PMAADDR11,        { "pmaaddr11",         any, read_zero, write_stub} },
> +    {CSR_PMAADDR12,        { "pmaaddr12",         any, read_zero, write_stub} },
> +    {CSR_PMAADDR13,        { "pmaaddr13",         any, read_zero, write_stub} },
> +    {CSR_PMAADDR14,        { "pmaaddr14",         any, read_zero, write_stub} },
> +    {CSR_PMAADDR15,        { "pmaaddr15",         any, read_zero, write_stub} },
> +
> +    /* Debug/Trace Registers (shared with Debug Mode) */
> +    {CSR_TSELECT,          { "tselect",           any, read_zero, write_stub} },
> +    {CSR_TDATA1,           { "tdata1",            any, read_zero, write_stub} },
> +    {CSR_TDATA2,           { "tdata2",            any, read_zero, write_stub} },
> +    {CSR_TDATA3,           { "tdata3",            any, read_zero, write_stub} },
> +    {CSR_TINFO,            { "tinfo",             any, read_zero, write_stub} },
> +
> +    /* ================== AndeStar V5 supervisor mode CSRs ================== */
> +    /* Supervisor trap registers */
> +    {CSR_SLIE,             { "slie",              any, read_zero, write_stub} },
> +    {CSR_SLIP,             { "slip",              any, read_zero, write_stub} },
> +    {CSR_SDCAUSE,          { "sdcause",           any, read_zero, write_stub} },
> +
> +    /* Supervisor counter registers */
> +    {CSR_SCOUNTERINTEN,    { "scounterinten",     any, read_zero, write_stub} },
> +    {CSR_SCOUNTERMASK_M,   { "scountermask_m",    any, read_zero, write_stub} },
> +    {CSR_SCOUNTERMASK_S,   { "scountermask_s",    any, read_zero, write_stub} },
> +    {CSR_SCOUNTERMASK_U,   { "scountermask_u",    any, read_zero, write_stub} },
> +    {CSR_SCOUNTEROVF,      { "scounterovf",       any, read_zero, write_stub} },
> +    {CSR_SCOUNTINHIBIT,    { "scountinhibit",     any, read_zero, write_stub} },
> +    {CSR_SHPMEVENT3,       { "shpmevent3",        any, read_zero, write_stub} },
> +    {CSR_SHPMEVENT4,       { "shpmevent4",        any, read_zero, write_stub} },
> +    {CSR_SHPMEVENT5,       { "shpmevent5",        any, read_zero, write_stub} },
> +    {CSR_SHPMEVENT6,       { "shpmevent6",        any, read_zero, write_stub} },
> +
> +    /* Supervisor control registers */
> +    {CSR_SCCTLDATA,        { "scctldata",         any, read_zero, write_stub} },
> +    {CSR_SMISC_CTL,        { "smisc_ctl",         any, read_zero, write_stub} },
> +
> +    /* ===================== AndeStar V5 user mode CSRs ===================== */
> +    /* User mode control registers */
> +    {CSR_UITB,             { "uitb",              any, read_uitb, write_uitb} },
> +    {CSR_UCODE,            { "ucode",             any, read_zero, write_stub} },
> +    {CSR_UDCAUSE,          { "udcause",           any, read_zero, write_stub} },
> +    {CSR_UCCTLBEGINADDR,   { "ucctlbeginaddr",    any, read_zero, write_stub} },
> +    {CSR_UCCTLCOMMAND,     { "ucctlcommand",      any, read_zero, write_stub} },
> +    {CSR_WFE,              { "wfe",               any, read_zero, write_stub} },
> +    {CSR_SLEEPVALUE,       { "sleepvalue",        any, read_zero, write_stub} },
> +    {CSR_TXEVT,            { "csr_txevt",         any, read_zero, write_stub} },
> +    {0, { "", NULL, NULL, NULL } },
> +    };
> diff --git a/target/riscv/custom_cpu_bits.h b/target/riscv/custom_cpu_bits.h
> index 5df31f8..ba67e95 100644
> --- a/target/riscv/custom_cpu_bits.h
> +++ b/target/riscv/custom_cpu_bits.h
> @@ -5,4 +5,8 @@
>   * SPDX-License-Identifier: GPL-2.0+
>   */
>
> -/* This file is intentionally left blank at this commit. */
> +/*
> + * XXX: Maybe we should add a "target-list"-like option to toggle enabled
> + * custom CSR variations ?

As I mentioned in patch 1, we'd better use a Kconfig option. This
Koption option should be selected by the Andes machine.

> + */
> +#include "andes_cpu_bits.h"
> --

Regards,
Bin

