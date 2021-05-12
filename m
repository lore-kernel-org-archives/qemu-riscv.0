Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgiBX-0005SY-TE
	for mharc-qemu-riscv@gnu.org; Wed, 12 May 2021 02:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lgiBU-0005RQ-Vi
 for qemu-riscv@nongnu.org; Wed, 12 May 2021 02:17:29 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lgiBQ-0006pq-A1
 for qemu-riscv@nongnu.org; Wed, 12 May 2021 02:17:28 -0400
Received: by mail-pg1-x531.google.com with SMTP id i14so17459170pgk.5
 for <qemu-riscv@nongnu.org>; Tue, 11 May 2021 23:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NsDsjIXmNGE/MZSx86nUb7VUgRbqQzHCJplp5Zd7Fh0=;
 b=Fdn5A9U22XdeepDZecYdk0v6JVFYAQxgRSGk+9kAgD2jN5oSbA+J+Y2FpA7Ff6legY
 4J/AT4yyww85SAQ+62DA4K7QJL95rYxaakwP+Ja4uuFohQqtIs0Skkr6K/VI6ENiXCGV
 cu5t4P0fOlSmgvberlmtujC0tx4w4pW4KeKGZEc3w7bJP3RgNQEdwlX813tDPrr5EBAb
 uxC762ntC4A9uRsFolQHjnfT1Hg0ku+2rSXS3tVHyOuucrhuFio4opeV4zr4//DvrqNM
 BcfILdSBN2Giwq9PQJM8ggTHyiiv04Gj+Ffs/MZ8iwtt4XarJj+yOQDkMz6G8ShWVbbz
 cNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NsDsjIXmNGE/MZSx86nUb7VUgRbqQzHCJplp5Zd7Fh0=;
 b=UaZAqVNTM0QwpJop0osApQubKzJ5OwITFoBtQxKyVxmc9/LK8gQwVvicAetBYViR0p
 KPnyCIU1DK8erZWCIU7r7V08yGtnMKQ6f1Fn/9rMj58bLQJ5Hkfu8hDtmaSWTAQO31np
 chTRUtSuxzHDu+fY6xZ2COX+kXMPQztfKYb6t3yuWbKFztxYbe72NQf719N5+z9QTnxe
 xxXIMh9Kqgm5ptDKEwJoPztShOWLlKqxQuehB168ld8bYa6lN0B6mC6Yw3P+moGD7uBt
 u+udYKUjL4HRepWuPbjFPdu4UhrYdCxNilJwCzJM3/axvD6yGmY0BOC4DZZsBlXN2olJ
 W/MA==
X-Gm-Message-State: AOAM531QePdhVd/PfWUzRJ+d98IKTBrXPR73BP8Z6uZ+3BydVNbvgUNE
 atgA64nZrViOekmsXuiizFOhx+XiYxbIda0bSxYGZREBZwCLqR7L
X-Google-Smtp-Source: ABdhPJwyTOZBcuGznaSWtJ4ACMEzpDzH+DOy6O8ezYe4FR4H+6lutvdNinHdnF9NOjS/jRwbj0iZ4Az3u4p0Tc/V+D0=
X-Received: by 2002:a63:ba1b:: with SMTP id k27mr14850972pgf.381.1620800242377; 
 Tue, 11 May 2021 23:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210511100722.18065-1-ruinland@andestech.com>
 <20210511100722.18065-2-ruinland@andestech.com>
In-Reply-To: <20210511100722.18065-2-ruinland@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 May 2021 16:16:56 +1000
Message-ID: <CAKmqyKP1O0LNGX-u1UkR6uke5N0h+T5vS=7DmZ947KLsCOnv=Q@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] Adding premliminary support for custom CSR
 handling mechanism
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Dylan Jhong <dylan@andestech.com>, 
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Wed, 12 May 2021 06:17:29 -0000

On Tue, May 11, 2021 at 8:07 PM Ruinland Chuan-Tzu Tsai
<ruinland@andestech.com> wrote:
>
> Introduce ax25 and custom CSR handling mechanism to RISC-V platform.
> This is just a POC in which we add Andes custom CSR table directly
> into the generic code which is undresiable and requires overhaul.
>
> Signed-off-by: Dylan Jhong <dylan@andestech.com>

Thanks for the patch.

This seems like a good start. I have left some comments inline.

Why do we need a hash table? Couldn't we just have a second
riscv_csr_operations array?

> ---
>  target/riscv/cpu.c      |  28 ++++++++++
>  target/riscv/cpu.h      |  12 ++++-
>  target/riscv/cpu_bits.h | 115 ++++++++++++++++++++++++++++++++++++++++
>  target/riscv/csr.c      | 107 +++++++++++++++++++++++++++++++++++--
>  4 files changed, 256 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7401325..6dbe9d9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,8 @@
>
>  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>
> +GHashTable * custom_csr_map;

This should be part of CPURISCVState instead of a global

> +
>  const char * const riscv_int_regnames[] = {
>    "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
>    "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
> @@ -159,6 +161,31 @@ static void rv64_base_cpu_init(Object *obj)
>      set_misa(env, RV64);
>  }
>
> +static void ax25_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +
> +    /* setup custom csr handler hash table */
> +    setup_custom_csr();
> +
> +}
> +
> +void setup_custom_csr(void) {
> +    custom_csr_map = g_hash_table_new_full(g_direct_hash, g_direct_equal, NULL, NULL);
> +    int i;
> +    for (i = 0; i < MAX_CUSTOM_CSR_NUM; i++) {
> +        if (andes_custom_csr_table[i].csrno != 0) {
> +            g_hash_table_insert(custom_csr_map,
> +                GINT_TO_POINTER(andes_custom_csr_table[i].csrno),
> +                &andes_custom_csr_table[i].csr_opset);
> +        } else {
> +            break;
> +        }
> +    }
> +}
> +
>  static void rv64_sifive_u_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -705,6 +732,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
>  #elif defined(TARGET_RISCV64)
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_AX25,             ax25_cpu_init),

Let's add the CPU in a separate patch.

>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
>  #endif
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0edb282..a2f656c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -37,6 +37,7 @@
>  #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>  #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
> +#define TYPE_RISCV_CPU_AX25             RISCV_CPU_TYPE_NAME("andes-ax25")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
>  #define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
> @@ -485,16 +486,25 @@ typedef struct {
>      riscv_csr_op_fn op;
>  } riscv_csr_operations;
>
> +typedef struct {
> +    int csrno;
> +    riscv_csr_operations csr_opset;
> +    } riscv_custom_csr_operations;
> +
>  /* CSR function table constants */
>  enum {
> -    CSR_TABLE_SIZE = 0x1000
> +    CSR_TABLE_SIZE = 0x1000,
> +    MAX_CUSTOM_CSR_NUM = 100
>  };
>
>  /* CSR function table */
> +extern riscv_custom_csr_operations andes_custom_csr_table[MAX_CUSTOM_CSR_NUM];
>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
> +extern GHashTable *custom_csr_map;
>
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
>  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
> +void setup_custom_csr(void);
>
>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index caf4599..639bc0a 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -259,6 +259,7 @@
>  #define CSR_TDATA1          0x7a1
>  #define CSR_TDATA2          0x7a2
>  #define CSR_TDATA3          0x7a3
> +#define CSR_TINFO           0x7a4

Why add this?

>
>  /* Debug Mode Registers */
>  #define CSR_DCSR            0x7b0
> @@ -593,3 +594,117 @@
>  #define MIE_SSIE                           (1 << IRQ_S_SOFT)
>  #define MIE_USIE                           (1 << IRQ_U_SOFT)
>  #endif
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

Ideally this should be a seperate file

> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fd2e636..b81efcf 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -523,6 +523,14 @@ static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
>      return 0;
>  }
>
> +
> +// XXX: This is just a write stub for developing custom CSR handler,
> +// if the behavior of writting such CSR is not presentable in QEMU and doesn't
> +// affect the functionality, just stub it.
> +static int write_stub(CPURISCVState *env, int csrno, target_ulong val) {
> +    return 0;
> +}

Is this needed?

> +
>  static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
>  {
>      if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
> @@ -1264,6 +1272,76 @@ static int write_pmpaddr(CPURISCVState *env, int csrno, target_ulong val)
>
>  #endif
>
> +
> +/* Custom CSR related routines and data structures */
> +
> +gpointer is_custom_csr(int);

Just make this function static instead of having a declaration in the C file.

> +
> +gpointer is_custom_csr(int csrno) {
> +    gpointer ret;
> +    ret = g_hash_table_lookup(custom_csr_map, GINT_TO_POINTER(csrno));
> +    return ret;
> +    }
> +
> +int try_handle_custom_csr(CPURISCVState *env, int csrno,
> +    target_ulong *ret_value, target_ulong new_value, target_ulong write_mask,
> +    riscv_csr_operations *opset);
> +
> +// XXX: This part is mainly duplicate from riscv_csrrw, we need to redo the logic
> +int try_handle_custom_csr(CPURISCVState *env, int csrno,
> +    target_ulong *ret_value, target_ulong new_value, target_ulong write_mask,
> +    riscv_csr_operations *opset) {
> +
> +    int ret = 0;
> +    target_ulong old_value;
> +
> +    /* check predicate */
> +    if (!opset->predicate) {
> +        return -RISCV_EXCP_ILLEGAL_INST;
> +    }
> +    ret = opset->predicate(env, csrno);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    /* execute combined read/write operation if it exists */
> +    if (opset->op) {
> +        return opset->op(env, csrno, ret_value, new_value, write_mask);
> +    }
> +
> +    /* if no accessor exists then return failure */
> +    if (!opset->read) {
> +        return -RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    /* read old value */
> +    ret = opset->read(env, csrno, &old_value);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    /* write value if writable and write mask set, otherwise drop writes */
> +    if (write_mask) {
> +        new_value = (old_value & ~write_mask) | (new_value & write_mask);
> +        if (opset->write) {
> +            ret = opset->write(env, csrno, new_value);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +        }
> +    }
> +
> +    /* return old value */
> +    if (ret_value) {
> +        *ret_value = old_value;
> +    }
> +
> +    return 0;
> +
> +
> +
> +    }

It would be nice if we could reuse the existing CSR access function.
Could we make the current one more generic and just call it?

> +
>  /*
>   * riscv_csrrw - read and/or update control and status register
>   *
> @@ -1283,7 +1361,7 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>      /* check privileges and return -1 if check fails */
>  #if !defined(CONFIG_USER_ONLY)
>      int effective_priv = env->priv;
> -    int read_only = get_field(csrno, 0xC00) == 3;
> +    /* int read_only = get_field(csrno, 0xC00) == 3; */

Don't comment this out.

>
>      if (riscv_has_ext(env, RVH) &&
>          env->priv == PRV_S &&
> @@ -1296,10 +1374,12 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>          effective_priv++;
>      }
>
> -    if ((write_mask && read_only) ||
> -        (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
> -        return -RISCV_EXCP_ILLEGAL_INST;
> -    }
> +    /*
> +     * if ((write_mask && read_only) ||
> +     *   (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
> +     *   return -RISCV_EXCP_ILLEGAL_INST;
> +     * }
> +     */
>  #endif
>
>      /* ensure the CSR extension is enabled. */
> @@ -1307,6 +1387,12 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>          return -RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +    /* try handle_custom_csr */
> +    riscv_csr_operations *custom_csr_opset = (riscv_csr_operations *) is_custom_csr(csrno);
> +    if(NULL != custom_csr_opset) {
> +        return try_handle_custom_csr(env, csrno, ret_value, new_value, write_mask, custom_csr_opset);
> +    }
> +
>      /* check predicate */
>      if (!csr_ops[csrno].predicate) {
>          return -RISCV_EXCP_ILLEGAL_INST;
> @@ -1351,6 +1437,14 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>      return 0;
>  }
>
> +/* Andes Custom Registers */
> +static int read_mmsc_cfg(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    /* enable pma probe */
> +    *val = 0x40000000;
> +    return 0;
> +}
> +
>  /*
>   * Debugger support.  If not in user mode, set env->debugger before the
>   * riscv_csrrw call and clear it after the call.
> @@ -1369,6 +1463,8 @@ int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
>      return ret;
>  }
>
> +#include "csr_andes.inc.c"

This doesn't seem to be used.

> +
>  /* Control and Status Register function table */
>  riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      /* User Floating-Point CSRs */
> @@ -1645,3 +1741,4 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", any32,  read_zero },
>  #endif /* !CONFIG_USER_ONLY */
>  };
> +
> --
> 2.17.1
>

