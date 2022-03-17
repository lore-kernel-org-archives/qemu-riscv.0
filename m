Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUkiX-000102-1H
	for mharc-qemu-riscv@gnu.org; Thu, 17 Mar 2022 03:38:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nUkiT-0000yi-Of
 for qemu-riscv@nongnu.org; Thu, 17 Mar 2022 03:38:38 -0400
Received: from [2607:f8b0:4864:20::102b] (port=37589
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nUkiH-00074S-6m
 for qemu-riscv@nongnu.org; Thu, 17 Mar 2022 03:38:31 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mz9-20020a17090b378900b001c657559290so4460918pjb.2
 for <qemu-riscv@nongnu.org>; Thu, 17 Mar 2022 00:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFn0yVtdeIFddVqyfmSE1GSC224ZSbJb05P7umCz1fM=;
 b=bElHmVizjZs/enHneO8hYSFGAm8osJPcOrUzwnIbHabxEFvonZygVVBAPd/ed/qufk
 tV5Ptwb1/+vl7T0XJbc3Azek6Kca8wNR8zRsTYc98bBOvLE5/E1rdx4letZZGrbqy/74
 slQp2HDIspbmT20fBIOEl7DQF2jtFlg7IzP647AnD670y1qeGMjImgB5QeB8aTaoFSEX
 pwC6vg97Xsx8LiE5n+LNmSqfDocGPyPc6ZLe/sS+ZJtMTq+6OMfArYPD7axjoTLaBWqC
 0zD77jrvP47HW5xRR2YhzwSURxuFP4gEVEV98c9G4S6cWeysapJJhLj1vHZFPggXmcWB
 lMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFn0yVtdeIFddVqyfmSE1GSC224ZSbJb05P7umCz1fM=;
 b=Y8T5LPsBco97YD+tdUaNuxWpeYLFvkVQkgTcosH8u+84bGsQBVUwoYmmihmGVMA4Wd
 lb5oaGIb8lJUZTjswgVqhlWeOnFCfa5Ojkxw5syxNzdsHLuQLKRxJ3CrNJmmEPgREjlm
 fgMXYjII8cgxY0XXz4/fzYQM+TRHhRbGYsDGO5YPtScUOvpgfYvD8tntoju70F1KbFhX
 pofumH1TaouoGXLJNNGH4Is7ZkGi+k6J9ia8/tMO+rZIhXvinGeYwHwPndnS4yusdjHP
 A//FNV6GaSB5oStEzsb8BjulYww1sc9YQmcCFMiq3Q9cqC8jN0IA6Csff9i/t4DU2fzz
 PQzQ==
X-Gm-Message-State: AOAM5314cLELTJRYtBkZwZPBJhuZRPOG7jT/8KTXzJxh1TrRLBirLBQ/
 ZWQNmFeCFV1wSBNLXet7IpKySUY2W577zA==
X-Google-Smtp-Source: ABdhPJzQPwXWGxVBe1KSkjmqI8XRrPOrWgRICcX/UbkpE4v2DgZvoe4GVO201WR/QGNgJ8QeMoinag==
X-Received: by 2002:a17:90a:2d0:b0:1bc:4fc0:6fb7 with SMTP id
 d16-20020a17090a02d000b001bc4fc06fb7mr3918387pjd.196.1647502702641; 
 Thu, 17 Mar 2022 00:38:22 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com.
 [209.85.215.179]) by smtp.gmail.com with ESMTPSA id
 z23-20020aa79597000000b004fa3634907csm1999893pfj.72.2022.03.17.00.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 00:38:21 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id o13so2041022pgc.12;
 Thu, 17 Mar 2022 00:38:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:134c:b0:4f7:65a6:88b with SMTP id
 k12-20020a056a00134c00b004f765a6088bmr3692781pfu.79.1647502700817; Thu, 17
 Mar 2022 00:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220303235440.638790-1-atishp@rivosinc.com>
 <20220303235440.638790-9-atishp@rivosinc.com>
In-Reply-To: <20220303235440.638790-9-atishp@rivosinc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 17 Mar 2022 15:38:09 +0800
X-Gmail-Original-Message-ID: <CANzO1D125-hqNJciSHo7v44PGOANFpVWL0Kc+Aytv=0tN7n+aA@mail.gmail.com>
Message-ID: <CANzO1D125-hqNJciSHo7v44PGOANFpVWL0Kc+Aytv=0tN7n+aA@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] target/riscv: Add sscofpmf extension support
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000003fb13705da651de0"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
X-List-Received-Date: Thu, 17 Mar 2022 07:38:38 -0000

--0000000000003fb13705da651de0
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 8:06 AM Atish Patra <atishp@rivosinc.com> wrote:

> The Sscofpmf ('Ss' for Privileged arch and Supervisor-level extensions,
> and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
> extension allows the perf to handle overflow interrupts and filtering
> support. This patch provides a framework for programmable
> counters to leverage the extension. As the extension doesn't have any
> provision for the overflow bit for fixed counters, the fixed events
> can also be monitoring using programmable counters. The underlying
> counters for cycle and instruction counters are always running. Thus,
> a separate timer device is programmed to handle the overflow.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  target/riscv/cpu.c      |   9 ++
>  target/riscv/cpu.h      |  25 +++
>  target/riscv/cpu_bits.h |  55 +++++++
>  target/riscv/csr.c      | 157 ++++++++++++++++--
>  target/riscv/pmu.c      | 346 +++++++++++++++++++++++++++++++++++++++-
>  target/riscv/pmu.h      |   7 +
>  6 files changed, 588 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2d2b0b04fbc8..e13d2f81a05c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -22,6 +22,7 @@
>  #include "qemu/ctype.h"
>  #include "qemu/log.h"
>  #include "cpu.h"
> +#include "pmu.h"
>  #include "internals.h"
>  #include "exec/exec-all.h"
>  #include "qapi/error.h"
> @@ -689,6 +690,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error
> **errp)
>          set_misa(env, env->misa_mxl, ext);
>      }
>
> +    if (cpu->cfg.pmu_num) {
> +        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) &&
> cpu->cfg.ext_sscofpmf) {
> +            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                          riscv_pmu_timer_cb, cpu);
> +        }
> +     }
> +
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
>      qemu_init_vcpu(cs);
> @@ -780,6 +788,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> +    DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b49adcccd85d..eaa5a73897eb 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -129,6 +129,8 @@ typedef struct PMUCTRState {
>      /* Snapshort value of a counter in RV32 */
>      target_ulong mhpmcounterh_prev;
>      bool started;
> +    /* Value beyond UINT32_MAX/UINT64_MAX before overflow interrupt
> trigger */
> +    target_ulong irq_overflow_left;
>  } PMUCTRState;
>
>  struct CPURISCVState {
> @@ -281,6 +283,9 @@ struct CPURISCVState {
>      /* PMU event selector configured values. First three are unused*/
>      target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
>
> +    /* PMU event selector configured values for RV32*/
> +    target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];
> +
>      target_ulong sscratch;
>      target_ulong mscratch;
>
> @@ -400,6 +405,7 @@ struct RISCVCPUConfig {
>      bool ext_zhinxmin;
>      bool ext_zve32f;
>      bool ext_zve64f;
> +    bool ext_sscofpmf;
>
>      /* Vendor-specific custom extensions */
>      bool ext_XVentanaCondOps;
> @@ -438,6 +444,12 @@ struct RISCVCPU {
>
>      /* Configuration Settings */
>      RISCVCPUConfig cfg;
> +
> +    QEMUTimer *pmu_timer;
> +    /* A bitmask of Available programmable counters */
> +    uint32_t pmu_avail_ctrs;
> +    /* Mapping of events to counters */
> +    GHashTable *pmu_event_ctr_map;
>  };
>
>  static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
> @@ -697,6 +709,19 @@ enum {
>      CSR_TABLE_SIZE = 0x1000
>  };
>
> +/**
> + * The event id are encoded based on the encoding specified in the
> + * SBI specification v0.3
> + */
> +
> +enum riscv_pmu_event_idx {
> +    RISCV_PMU_EVENT_HW_CPU_CYCLES = 0x01,
> +    RISCV_PMU_EVENT_HW_INSTRUCTIONS = 0x02,
> +    RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS = 0x10019,
> +    RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS = 0x1001B,
> +    RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS = 0x10021,
> +};
> +
>  /* CSR function table */
>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 48b39e6d52a7..da78e2704081 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -400,6 +400,37 @@
>  #define CSR_MHPMEVENT29     0x33d
>  #define CSR_MHPMEVENT30     0x33e
>  #define CSR_MHPMEVENT31     0x33f
> +
> +#define CSR_MHPMEVENT3H     0x723
> +#define CSR_MHPMEVENT4H     0x724
> +#define CSR_MHPMEVENT5H     0x725
> +#define CSR_MHPMEVENT6H     0x726
> +#define CSR_MHPMEVENT7H     0x727
> +#define CSR_MHPMEVENT8H     0x728
> +#define CSR_MHPMEVENT9H     0x729
> +#define CSR_MHPMEVENT10H    0x72a
> +#define CSR_MHPMEVENT11H    0x72b
> +#define CSR_MHPMEVENT12H    0x72c
> +#define CSR_MHPMEVENT13H    0x72d
> +#define CSR_MHPMEVENT14H    0x72e
> +#define CSR_MHPMEVENT15H    0x72f
> +#define CSR_MHPMEVENT16H    0x730
> +#define CSR_MHPMEVENT17H    0x731
> +#define CSR_MHPMEVENT18H    0x732
> +#define CSR_MHPMEVENT19H    0x733
> +#define CSR_MHPMEVENT20H    0x734
> +#define CSR_MHPMEVENT21H    0x735
> +#define CSR_MHPMEVENT22H    0x736
> +#define CSR_MHPMEVENT23H    0x737
> +#define CSR_MHPMEVENT24H    0x738
> +#define CSR_MHPMEVENT25H    0x739
> +#define CSR_MHPMEVENT26H    0x73a
> +#define CSR_MHPMEVENT27H    0x73b
> +#define CSR_MHPMEVENT28H    0x73c
> +#define CSR_MHPMEVENT29H    0x73d
> +#define CSR_MHPMEVENT30H    0x73e
> +#define CSR_MHPMEVENT31H    0x73f
> +
>  #define CSR_MHPMCOUNTER3H   0xb83
>  #define CSR_MHPMCOUNTER4H   0xb84
>  #define CSR_MHPMCOUNTER5H   0xb85
> @@ -461,6 +492,7 @@
>  #define CSR_VSMTE           0x2c0
>  #define CSR_VSPMMASK        0x2c1
>  #define CSR_VSPMBASE        0x2c2
> +#define CSR_SCOUNTOVF       0xda0
>
>  /* mstatus CSR bits */
>  #define MSTATUS_UIE         0x00000001
> @@ -635,6 +667,7 @@ typedef enum RISCVException {
>  #define IRQ_VS_EXT                         10
>  #define IRQ_M_EXT                          11
>  #define IRQ_S_GEXT                         12
> +#define IRQ_PMU_OVF                        13
>  #define IRQ_LOCAL_MAX                      16
>  #define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
>
> @@ -652,11 +685,13 @@ typedef enum RISCVException {
>  #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
>  #define MIP_MEIP                           (1 << IRQ_M_EXT)
>  #define MIP_SGEIP                          (1 << IRQ_S_GEXT)
> +#define MIP_LCOFIP                         (1 << IRQ_PMU_OVF)
>
>  /* sip masks */
>  #define SIP_SSIP                           MIP_SSIP
>  #define SIP_STIP                           MIP_STIP
>  #define SIP_SEIP                           MIP_SEIP
> +#define SIP_LCOFIP                         MIP_LCOFIP
>
>  /* MIE masks */
>  #define MIE_SEIE                           (1 << IRQ_S_EXT)
> @@ -804,4 +839,24 @@ typedef enum RISCVException {
>  #define HVICTL_VALID_MASK                  \
>      (HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO)
>
> +/* PMU related bits */
> +#define MIE_LCOFIE                         (1 << IRQ_PMU_OVF)
> +
> +#define MHPMEVENT_BIT_OF                   BIT(63)
>

Hi Atish,

I think it's better to use BIT_ULL() for value >= 32.
BIT() is defined to: (1UL << (nr)),
which might cause the overflow issue on some platforms (e.g. Windows).

Regards,
Frank Chang

+#define MHPMEVENTH_BIT_OF                  BIT(31)
> +#define MHPMEVENT_BIT_MINH                 BIT(62)
> +#define MHPMEVENTH_BIT_MINH                BIT(30)
> +#define MHPMEVENT_BIT_SINH                 BIT(61)
> +#define MHPMEVENTH_BIT_SINH                BIT(29)
> +#define MHPMEVENT_BIT_UINH                 BIT(60)
> +#define MHPMEVENTH_BIT_UINH                BIT(28)
> +#define MHPMEVENT_BIT_VSINH                BIT(59)
> +#define MHPMEVENTH_BIT_VSINH               BIT(27)
> +#define MHPMEVENT_BIT_VUINH                BIT(58)
> +#define MHPMEVENTH_BIT_VUINH               BIT(26)
> +
> +#define MHPMEVENT_SSCOF_MASK               _ULL(0xFFFF000000000000)
> +#define MHPMEVENT_IDX_MASK                 0xFFFFF
> +#define MHPMEVENT_SSCOF_RESVD              16
> +
>  #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 3286e1e44455..cfcc1a0882d9 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -96,13 +96,26 @@ static RISCVException mctr32(CPURISCVState *env, int
> csrno)
>      return mctr(env, csrno);
>  }
>
> +static RISCVException sscofpmf(CPURISCVState *env, int csrno)
> +{
> + #if !defined(CONFIG_USER_ONLY)
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_sscofpmf) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
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
> -    int base_csrno = CSR_HPMCOUNTER3;
> +    int base_csrno = CSR_CYCLE;
>      bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
>
>      if (rv32 && csrno >= CSR_CYCLEH) {
> @@ -111,11 +124,18 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
>      }
>      ctr_index = csrno - base_csrno;
>
> -    if (!cpu->cfg.pmu_num || ctr_index >= (cpu->cfg.pmu_num)) {
> +    if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
> +        (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
> +        goto skip_ext_pmu_check;
> +    }
> +
> +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
>          /* No counter is enabled in PMU or the counter is out of range */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +skip_ext_pmu_check:
> +
>      if (env->priv == PRV_S) {
>          switch (csrno) {
>          case CSR_CYCLE:
> @@ -134,7 +154,6 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
>              }
>              break;
>          case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            ctr_index = csrno - CSR_CYCLE;
>              if (!get_field(env->mcounteren, 1 << ctr_index)) {
>                  return RISCV_EXCP_ILLEGAL_INST;
>              }
> @@ -158,7 +177,6 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
>                  }
>                  break;
>              case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                ctr_index = csrno - CSR_CYCLEH;
>                  if (!get_field(env->mcounteren, 1 << ctr_index)) {
>                      return RISCV_EXCP_ILLEGAL_INST;
>                  }
> @@ -188,7 +206,6 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
>              }
>              break;
>          case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            ctr_index = csrno - CSR_CYCLE;
>              if (!get_field(env->hcounteren, 1 << ctr_index) &&
>                   get_field(env->mcounteren, 1 << ctr_index)) {
>                  return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> @@ -216,7 +233,6 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
>                  }
>                  break;
>              case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                ctr_index = csrno - CSR_CYCLEH;
>                  if (!get_field(env->hcounteren, 1 << ctr_index) &&
>                       get_field(env->mcounteren, 1 << ctr_index)) {
>                      return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> @@ -585,11 +601,36 @@ static int write_mhpmevent(CPURISCVState *env, int
> csrno, target_ulong val)
>  {
>      int evt_index = csrno - CSR_MCOUNTINHIBIT;
>
> +    if (riscv_cpu_mxl(env) != MXL_RV32) {
> +        riscv_pmu_update_event_map(env, val, evt_index);
> +    }
>      env->mhpmevent_val[evt_index] = val;
>
>      return RISCV_EXCP_NONE;
>  }
>
> +static int read_mhpmeventh(CPURISCVState *env, int csrno, target_ulong
> *val)
> +{
> +    int evt_index = csrno - CSR_MHPMEVENT3H + 3;
> +
> +    *val = env->mhpmevent_val[evt_index];
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mhpmeventh(CPURISCVState *env, int csrno, target_ulong
> val)
> +{
> +    int evt_index = csrno - CSR_MHPMEVENT3H + 3;
> +    uint64_t mhpmevth_val = val;
> +    uint64_t mhpmevt_val = env->mhpmevent_val[evt_index];
> +
> +    mhpmevt_val = mhpmevt_val | (mhpmevth_val << 32);
> +    riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
> +    env->mhpmeventh_val[evt_index] = val;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong
> val)
>  {
>      int ctr_idx = csrno - CSR_MCYCLE;
> @@ -599,7 +640,10 @@ static int write_mhpmcounter(CPURISCVState *env, int
> csrno, target_ulong val)
>      if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>          riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
>          counter->mhpmcounter_prev = get_ticks(false);
> -    } else {
> +        if (ctr_idx > 2) {
> +            riscv_pmu_setup_timer(env, val, ctr_idx);
> +        }
> +     } else {
>          /* Other counters can keep incrementing from the given value */
>          counter->mhpmcounter_prev = val;
>      }
> @@ -611,11 +655,17 @@ static int write_mhpmcounterh(CPURISCVState *env,
> int csrno, target_ulong val)
>  {
>      int ctr_idx = csrno - CSR_MCYCLEH;
>      PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
> +    uint64_t mhpmctr_val = counter->mhpmcounter_val;
> +    uint64_t mhpmctrh_val = val;
>
>      counter->mhpmcounterh_val = val;
> +    mhpmctr_val = mhpmctr_val | (mhpmctrh_val << 32);
>      if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>          riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
>          counter->mhpmcounterh_prev = get_ticks(true);
> +        if (ctr_idx > 2) {
> +            riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
> +        }
>      } else {
>          counter->mhpmcounterh_prev = val;
>      }
> @@ -688,6 +738,32 @@ static int read_hpmcounterh(CPURISCVState *env, int
> csrno, target_ulong *val)
>      return riscv_pmu_read_ctr(env, val, true, ctr_index);
>  }
>
> +static int read_scountovf(CPURISCVState *env, int csrno, target_ulong
> *val)
> +{
> +    int mhpmevt_start = CSR_MHPMEVENT3 - CSR_MCOUNTINHIBIT;
> +    int i;
> +    *val = 0;
> +    target_ulong *mhpm_evt_val;
> +    uint64_t of_bit_mask;
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        mhpm_evt_val = env->mhpmeventh_val;
> +        of_bit_mask = MHPMEVENTH_BIT_OF;
> +    } else {
> +        mhpm_evt_val = env->mhpmevent_val;
> +        of_bit_mask = MHPMEVENT_BIT_OF;
> +    }
> +
> +    for (i = mhpmevt_start; i < RV_MAX_MHPMEVENTS; i++) {
> +        if ((get_field(env->mcounteren, BIT(i))) &&
> +            (mhpm_evt_val[i] & of_bit_mask)) {
> +                    *val |= BIT(i);
> +            }
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  #if defined(CONFIG_USER_ONLY)
>  static RISCVException read_time(CPURISCVState *env, int csrno,
>                                  target_ulong *val)
> @@ -734,7 +810,8 @@ static RISCVException read_timeh(CPURISCVState *env,
> int csrno,
>  /* Machine constants */
>
>  #define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
> -#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP))
> +#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP | \
> +                                      MIP_LCOFIP))
>  #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP))
>  #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
>
> @@ -775,7 +852,8 @@ static const target_ulong vs_delegable_excps =
> DELEGABLE_EXCPS &
>  static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE
> |
>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
>      SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
> -static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP |
> MIP_UEIP;
> +static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP |
> MIP_UEIP |
> +                                              SIP_LCOFIP;
>  static const target_ulong hip_writable_mask = MIP_VSSIP;
>  static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP |
> MIP_VSEIP;
>  static const target_ulong vsip_writable_mask = MIP_VSSIP;
> @@ -3814,6 +3892,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MHPMEVENT31]    = { "mhpmevent31",    any,    read_mhpmevent,
>                                                         write_mhpmevent },
>
> +    [CSR_MHPMEVENT3H]    = { "mhpmevent3h",    sscofpmf,  read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT4H]    = { "mhpmevent4h",    sscofpmf,  read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT5H]    = { "mhpmevent5h",    sscofpmf,  read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT6H]    = { "mhpmevent6h",    sscofpmf,  read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT7H]    = { "mhpmevent7h",    sscofpmf,  read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT8H]    = { "mhpmevent8h",    sscofpmf,  read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT9H]    = { "mhpmevent9h",    sscofpmf,  read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT10H]   = { "mhpmevent10h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT11H]   = { "mhpmevent11h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT12H]   = { "mhpmevent12h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT13H]   = { "mhpmevent13h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT14H]   = { "mhpmevent14h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT15H]   = { "mhpmevent15h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT16H]   = { "mhpmevent16h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT17H]   = { "mhpmevent17h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT18H]   = { "mhpmevent18h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT19H]   = { "mhpmevent19h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT20H]   = { "mhpmevent20h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT21H]   = { "mhpmevent21h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT22H]   = { "mhpmevent22h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT23H]   = { "mhpmevent23h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT24H]   = { "mhpmevent24h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT25H]   = { "mhpmevent25h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT26H]   = { "mhpmevent26h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT27H]   = { "mhpmevent27h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT28H]   = { "mhpmevent28h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT29H]   = { "mhpmevent29h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT30H]   = { "mhpmevent30h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +    [CSR_MHPMEVENT31H]   = { "mhpmevent31h",    sscofpmf,
> read_mhpmeventh,
> +                                                       write_mhpmeventh},
> +
>      [CSR_HPMCOUNTER3H]   = { "hpmcounter3h",   ctr32,  read_hpmcounterh },
>      [CSR_HPMCOUNTER4H]   = { "hpmcounter4h",   ctr32,  read_hpmcounterh },
>      [CSR_HPMCOUNTER5H]   = { "hpmcounter5h",   ctr32,  read_hpmcounterh },
> @@ -3902,5 +4039,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                                         write_mhpmcounterh
> },
>      [CSR_MHPMCOUNTER31H] = { "mhpmcounter31h", mctr32,  read_hpmcounterh,
>                                                         write_mhpmcounterh
> },
> +    [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf },
> +
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 000fe8da45ef..5b212d2eb630 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -20,13 +20,355 @@
>  #include "cpu.h"
>  #include "pmu.h"
>
> +#define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
> +#define MAKE_32BIT_MASK(shift, length) \
> +        (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
> +
> +static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
> +{
> +    if (ctr_idx < 3 || ctr_idx >= RV_MAX_MHPMCOUNTERS ||
> +        !(cpu->pmu_avail_ctrs & BIT(ctr_idx))) {
> +        return false;
> +    } else {
> +        return true;
> +    }
> +}
> +
> +static bool riscv_pmu_counter_enabled(RISCVCPU *cpu, uint32_t ctr_idx)
> +{
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (!riscv_pmu_counter_valid(cpu, ctr_idx) ||
> +        !get_field(env->mcounteren, BIT(ctr_idx))) {
> +        return false;
> +    } else {
> +        return true;
> +    }
> +}
> +
> +static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    target_ulong max_val = UINT32_MAX;
> +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
> +
> +    /* Privilege mode filtering */
> +    if ((env->priv == PRV_M &&
> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_MINH)) ||
> +        (env->priv == PRV_S &&
> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_SINH)) ||
> +        (env->priv == PRV_U &&
> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_UINH))) {
> +        return 0;
> +    }
> +
> +    /* Handle the overflow scenario */
> +    if (counter->mhpmcounter_val == max_val) {
> +        if (counter->mhpmcounterh_val == max_val) {
> +            counter->mhpmcounter_val = 0;
> +            counter->mhpmcounterh_val = 0;
> +            /* Generate interrupt only if OF bit is clear */
> +            if (!(env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_OF)) {
> +                env->mhpmeventh_val[ctr_idx] |= MHPMEVENTH_BIT_OF;
> +                riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> +            }
> +        } else {
> +            counter->mhpmcounterh_val++;
> +        }
> +    } else {
> +        counter->mhpmcounter_val++;
> +    }
> +
> +    return 0;
> +}
> +
> +static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uint32_t ctr_idx)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
> +    uint64_t max_val = UINT64_MAX;
> +
> +    /* Privilege mode filtering */
> +    if ((env->priv == PRV_M &&
> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_MINH)) ||
> +        (env->priv == PRV_S &&
> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_SINH)) ||
> +        (env->priv == PRV_U &&
> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_UINH))) {
> +        return 0;
> +    }
> +
> +    /* Handle the overflow scenario */
> +    if (counter->mhpmcounter_val == max_val) {
> +        counter->mhpmcounter_val = 0;
> +        /* Generate interrupt only if OF bit is clear */
> +        if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
> +            env->mhpmevent_val[ctr_idx] |= MHPMEVENT_BIT_OF;
> +            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> +        }
> +    } else {
> +        counter->mhpmcounter_val++;
> +    }
> +    return 0;
> +}
> +
> +int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
> +{
> +    uint32_t ctr_idx;
> +    int ret;
> +    CPURISCVState *env = &cpu->env;
> +    gpointer value;
> +
> +    value = g_hash_table_lookup(cpu->pmu_event_ctr_map,
> +                                GUINT_TO_POINTER(event_idx));
> +    if (!value) {
> +        return -1;
> +    }
> +
> +    ctr_idx = GPOINTER_TO_UINT(value);
> +    if (!riscv_pmu_counter_enabled(cpu, ctr_idx) ||
> +        get_field(env->mcountinhibit, BIT(ctr_idx))) {
> +        return -1;
> +    }
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        ret = riscv_pmu_incr_ctr_rv32(cpu, ctr_idx);
> +    } else {
> +        ret = riscv_pmu_incr_ctr_rv64(cpu, ctr_idx);
> +    }
> +
> +    return ret;
> +}
> +
>  bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
>                                          uint32_t target_ctr)
>  {
> -    return (target_ctr == 0) ? true : false;
> +    RISCVCPU *cpu;
> +    uint32_t event_idx;
> +    uint32_t ctr_idx;
> +
> +    /* Fixed instret counter */
> +    if (target_ctr == 2) {
> +        return true;
> +    }
> +
> +    cpu = RISCV_CPU(env_cpu(env));
> +    event_idx = RISCV_PMU_EVENT_HW_INSTRUCTIONS;
> +    ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
> +                               GUINT_TO_POINTER(event_idx)));
> +    if (!ctr_idx) {
> +        return false;
> +    }
> +
> +    return target_ctr == ctr_idx ? true : false;
>  }
>
>  bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ctr)
>  {
> -    return (target_ctr == 2) ? true : false;
> +    RISCVCPU *cpu;
> +    uint32_t event_idx;
> +    uint32_t ctr_idx;
> +
> +    /* Fixed mcycle counter */
> +    if (target_ctr == 0) {
> +        return true;
> +    }
> +
> +    cpu = RISCV_CPU(env_cpu(env));
> +    event_idx = RISCV_PMU_EVENT_HW_CPU_CYCLES;
> +    ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
> +                               GUINT_TO_POINTER(event_idx)));
> +
> +    /* Counter zero is not used for event_ctr_map */
> +    if (!ctr_idx) {
> +        return false;
> +    }
> +
> +    return (target_ctr == ctr_idx) ? true : false;
> +}
> +
> +static gboolean pmu_remove_event_map(gpointer key, gpointer value,
> +                                     gpointer udata)
> +{
> +    return (GPOINTER_TO_UINT(value) == GPOINTER_TO_UINT(udata)) ? true :
> false;
> +}
> +
> +static int64_t pmu_icount_ticks_to_ns(int64_t value)
> +{
> +    int64_t ret = 0;
> +
> +    if (icount_enabled()) {
> +        ret = icount_to_ns(value);
> +    } else {
> +        ret = (NANOSECONDS_PER_SECOND / RISCV_TIMEBASE_FREQ) * value;
> +    }
> +
> +    return ret;
> +}
> +
> +int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> +                               uint32_t ctr_idx)
> +{
> +    uint32_t event_idx;
> +    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
> +
> +    if (!riscv_pmu_counter_valid(cpu, ctr_idx)) {
> +        return -1;
> +    }
> +
> +    /**
> +     * Expected mhpmevent value is zero for reset case. Remove the current
> +     * mapping.
> +     */
> +    if (!value) {
> +        g_hash_table_foreach_remove(cpu->pmu_event_ctr_map,
> +                                    pmu_remove_event_map,
> +                                    GUINT_TO_POINTER(ctr_idx));
> +        return 0;
> +    }
> +
> +    event_idx = value & MHPMEVENT_IDX_MASK;
> +    if (g_hash_table_lookup(cpu->pmu_event_ctr_map,
> +                            GUINT_TO_POINTER(event_idx))) {
> +        return 0;
> +    }
> +
> +    switch (event_idx) {
> +    case RISCV_PMU_EVENT_HW_CPU_CYCLES:
> +    case RISCV_PMU_EVENT_HW_INSTRUCTIONS:
> +    case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:
> +    case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:
> +    case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:
> +        break;
> +    default:
> +        /* We don't support any raw events right now */
> +        return -1;
> +    }
> +    g_hash_table_insert(cpu->pmu_event_ctr_map,
> GUINT_TO_POINTER(event_idx),
> +                        GUINT_TO_POINTER(ctr_idx));
> +
> +    return 0;
> +}
> +
> +static void pmu_timer_trigger_irq(RISCVCPU *cpu,
> +                                  enum riscv_pmu_event_idx evt_idx)
> +{
> +    uint32_t ctr_idx;
> +    CPURISCVState *env = &cpu->env;
> +    PMUCTRState *counter;
> +    target_ulong *mhpmevent_val;
> +    uint64_t of_bit_mask;
> +    int64_t irq_trigger_at;
> +
> +    if (evt_idx != RISCV_PMU_EVENT_HW_CPU_CYCLES &&
> +        evt_idx != RISCV_PMU_EVENT_HW_INSTRUCTIONS) {
> +        return;
> +    }
> +
> +    ctr_idx = GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
> +                               GUINT_TO_POINTER(evt_idx)));
> +    if (!riscv_pmu_counter_enabled(cpu, ctr_idx)) {
> +        return;
> +    }
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        mhpmevent_val = &env->mhpmeventh_val[ctr_idx];
> +        of_bit_mask = MHPMEVENTH_BIT_OF;
> +     } else {
> +        mhpmevent_val = &env->mhpmevent_val[ctr_idx];
> +        of_bit_mask = MHPMEVENT_BIT_OF;
> +    }
> +
> +    counter = &env->pmu_ctrs[ctr_idx];
> +    if (counter->irq_overflow_left > 0) {
> +        irq_trigger_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +                        counter->irq_overflow_left;
> +        timer_mod_anticipate_ns(cpu->pmu_timer, irq_trigger_at);
> +        counter->irq_overflow_left = 0;
> +        return;
> +    }
> +
> +    if (cpu->pmu_avail_ctrs & BIT(ctr_idx)) {
> +        /* Generate interrupt only if OF bit is clear */
> +        if (!(*mhpmevent_val & of_bit_mask)) {
> +            *mhpmevent_val |= of_bit_mask;
> +            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> +        }
> +    }
> +}
> +
> +/* Timer callback for instret and cycle counter overflow */
> +void riscv_pmu_timer_cb(void *priv)
> +{
> +    RISCVCPU *cpu = priv;
> +
> +    /* Timer event was triggered only for these events */
> +    pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_CPU_CYCLES);
> +    pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_INSTRUCTIONS);
> +}
> +
> +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t
> ctr_idx)
> +{
> +    uint64_t overflow_delta, overflow_at;
> +    int64_t overflow_ns, overflow_left = 0;
> +    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
> +    PMUCTRState *counter = &env->pmu_ctrs[ctr_idx];
> +
> +    if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->cfg.ext_sscofpmf)
> {
> +        return -1;
> +    }
> +
> +    if (value) {
> +        overflow_delta = UINT64_MAX - value + 1;
> +    } else {
> +        overflow_delta = UINT64_MAX - value;
> +    }
> +
> +    /**
> +     * QEMU supports only int64_t timers while RISC-V counters are
> uint64_t.
> +     * Compute the leftover and save it so that it can be reprogrammed
> again
> +     * when timer expires.
> +     */
> +    if (overflow_delta > INT64_MAX) {
> +        overflow_left = overflow_delta - INT64_MAX;
> +    }
> +
> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> +        overflow_ns = pmu_icount_ticks_to_ns((int64_t)overflow_delta);
> +        overflow_left = pmu_icount_ticks_to_ns(overflow_left) ;
> +    } else {
> +        return -1;
> +    }
> +    overflow_at = (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> overflow_ns;
> +
> +    if (overflow_at > INT64_MAX) {
> +        overflow_left += overflow_at - INT64_MAX;
> +        counter->irq_overflow_left = overflow_left;
> +        overflow_at = INT64_MAX;
> +    }
> +    timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
> +
> +    return 0;
> +}
> +
> +
> +int riscv_pmu_init(RISCVCPU *cpu, int num_counters)
> +{
> +    if (num_counters > (RV_MAX_MHPMCOUNTERS - 3)) {
> +        return -1;
> +    }
> +
> +    cpu->pmu_event_ctr_map = g_hash_table_new(g_direct_hash,
> g_direct_equal);
> +    if (!cpu->pmu_event_ctr_map) {
> +        /* PMU support can not be enabled */
> +        qemu_log_mask(LOG_UNIMP, "PMU events can't be supported\n");
> +        cpu->cfg.pmu_num = 0;
> +        return -1;
> +    }
> +
> +    /* Create a bitmask of available programmable counters */
> +    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, num_counters);
> +
> +    return 0;
>  }
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 58a5bc3a4089..036653627f78 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -26,3 +26,10 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState
> *env,
>                                          uint32_t target_ctr);
>  bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
>                                    uint32_t target_ctr);
> +void riscv_pmu_timer_cb(void *priv);
> +int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
> +int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> +                               uint32_t ctr_idx);
> +int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
> +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
> +                          uint32_t ctr_idx);
> --
> 2.30.2
>
>
>

--0000000000003fb13705da651de0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Mar 4, 2022 at 8:06 AM Atish Patr=
a &lt;<a href=3D"mailto:atishp@rivosinc.com">atishp@rivosinc.com</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">The Sscofpmf (&#39;Ss&#39; for Privileged arch and Supervis=
or-level extensions,<br>
and &#39;cofpmf&#39; for Count OverFlow and Privilege Mode Filtering)<br>
extension allows the perf to handle overflow interrupts and filtering<br>
support. This patch provides a framework for programmable<br>
counters to leverage the extension. As the extension doesn&#39;t have any<b=
r>
provision for the overflow bit for fixed counters, the fixed events<br>
can also be monitoring using programmable counters. The underlying<br>
counters for cycle and instruction counters are always running. Thus,<br>
a separate timer device is programmed to handle the overflow.<br>
<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" targe=
t=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" targe=
t=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 ++<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 +++<br>
=C2=A0target/riscv/cpu_bits.h |=C2=A0 55 +++++++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 157 ++++++++++++++++--<br>
=C2=A0target/riscv/pmu.c=C2=A0 =C2=A0 =C2=A0 | 346 ++++++++++++++++++++++++=
+++++++++++++++-<br>
=C2=A0target/riscv/pmu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A06 files changed, 588 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index 2d2b0b04fbc8..e13d2f81a05c 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -22,6 +22,7 @@<br>
=C2=A0#include &quot;qemu/ctype.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
+#include &quot;pmu.h&quot;<br>
=C2=A0#include &quot;internals.h&quot;<br>
=C2=A0#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
@@ -689,6 +690,13 @@ static void riscv_cpu_realize(DeviceState *dev, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_misa(env, env-&gt;misa_mxl, ext);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (cpu-&gt;cfg.pmu_num) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!riscv_pmu_init(cpu, cpu-&gt;cfg.pmu_num) =
&amp;&amp; cpu-&gt;cfg.ext_sscofpmf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;pmu_timer =3D timer_new_=
ns(QEMU_CLOCK_VIRTUAL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
iscv_pmu_timer_cb, cpu);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0riscv_cpu_register_gdb_regs_for_features(cs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_vcpu(cs);<br>
@@ -780,6 +788,7 @@ static Property riscv_cpu_properties[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;v&quot;, RISCVCPU, cfg.ext_v, fa=
lse),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;h&quot;, RISCVCPU, cfg.ext_h, tr=
ue),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT8(&quot;pmu-num&quot;, RISCVCPU, cfg.pm=
u_num, 16),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;sscofpmf&quot;, RISCVCPU, cfg.ext_ssc=
ofpmf, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCVCPU, cfg.ex=
t_ifencei, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU, cfg.ext_i=
csr, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zfh&quot;, RISCVCPU, cfg.ext_zfh=
, false),<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index b49adcccd85d..eaa5a73897eb 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -129,6 +129,8 @@ typedef struct PMUCTRState {<br>
=C2=A0 =C2=A0 =C2=A0/* Snapshort value of a counter in RV32 */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mhpmcounterh_prev;<br>
=C2=A0 =C2=A0 =C2=A0bool started;<br>
+=C2=A0 =C2=A0 /* Value beyond UINT32_MAX/UINT64_MAX before overflow interr=
upt trigger */<br>
+=C2=A0 =C2=A0 target_ulong irq_overflow_left;<br>
=C2=A0} PMUCTRState;<br>
<br>
=C2=A0struct CPURISCVState {<br>
@@ -281,6 +283,9 @@ struct CPURISCVState {<br>
=C2=A0 =C2=A0 =C2=A0/* PMU event selector configured values. First three ar=
e unused*/<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];<br>
<br>
+=C2=A0 =C2=A0 /* PMU event selector configured values for RV32*/<br>
+=C2=A0 =C2=A0 target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];<br>
+<br>
=C2=A0 =C2=A0 =C2=A0target_ulong sscratch;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mscratch;<br>
<br>
@@ -400,6 +405,7 @@ struct RISCVCPUConfig {<br>
=C2=A0 =C2=A0 =C2=A0bool ext_zhinxmin;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_zve32f;<br>
=C2=A0 =C2=A0 =C2=A0bool ext_zve64f;<br>
+=C2=A0 =C2=A0 bool ext_sscofpmf;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Vendor-specific custom extensions */<br>
=C2=A0 =C2=A0 =C2=A0bool ext_XVentanaCondOps;<br>
@@ -438,6 +444,12 @@ struct RISCVCPU {<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Configuration Settings */<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPUConfig cfg;<br>
+<br>
+=C2=A0 =C2=A0 QEMUTimer *pmu_timer;<br>
+=C2=A0 =C2=A0 /* A bitmask of Available programmable counters */<br>
+=C2=A0 =C2=A0 uint32_t pmu_avail_ctrs;<br>
+=C2=A0 =C2=A0 /* Mapping of events to counters */<br>
+=C2=A0 =C2=A0 GHashTable *pmu_event_ctr_map;<br>
=C2=A0};<br>
<br>
=C2=A0static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)=
<br>
@@ -697,6 +709,19 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0CSR_TABLE_SIZE =3D 0x1000<br>
=C2=A0};<br>
<br>
+/**<br>
+ * The event id are encoded based on the encoding specified in the<br>
+ * SBI specification v0.3<br>
+ */<br>
+<br>
+enum riscv_pmu_event_idx {<br>
+=C2=A0 =C2=A0 RISCV_PMU_EVENT_HW_CPU_CYCLES =3D 0x01,<br>
+=C2=A0 =C2=A0 RISCV_PMU_EVENT_HW_INSTRUCTIONS =3D 0x02,<br>
+=C2=A0 =C2=A0 RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS =3D 0x10019,<br>
+=C2=A0 =C2=A0 RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS =3D 0x1001B,<br>
+=C2=A0 =C2=A0 RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS =3D 0x10021,<br>
+};<br>
+<br>
=C2=A0/* CSR function table */<br>
=C2=A0extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];<br>
<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index 48b39e6d52a7..da78e2704081 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -400,6 +400,37 @@<br>
=C2=A0#define CSR_MHPMEVENT29=C2=A0 =C2=A0 =C2=A00x33d<br>
=C2=A0#define CSR_MHPMEVENT30=C2=A0 =C2=A0 =C2=A00x33e<br>
=C2=A0#define CSR_MHPMEVENT31=C2=A0 =C2=A0 =C2=A00x33f<br>
+<br>
+#define CSR_MHPMEVENT3H=C2=A0 =C2=A0 =C2=A00x723<br>
+#define CSR_MHPMEVENT4H=C2=A0 =C2=A0 =C2=A00x724<br>
+#define CSR_MHPMEVENT5H=C2=A0 =C2=A0 =C2=A00x725<br>
+#define CSR_MHPMEVENT6H=C2=A0 =C2=A0 =C2=A00x726<br>
+#define CSR_MHPMEVENT7H=C2=A0 =C2=A0 =C2=A00x727<br>
+#define CSR_MHPMEVENT8H=C2=A0 =C2=A0 =C2=A00x728<br>
+#define CSR_MHPMEVENT9H=C2=A0 =C2=A0 =C2=A00x729<br>
+#define CSR_MHPMEVENT10H=C2=A0 =C2=A0 0x72a<br>
+#define CSR_MHPMEVENT11H=C2=A0 =C2=A0 0x72b<br>
+#define CSR_MHPMEVENT12H=C2=A0 =C2=A0 0x72c<br>
+#define CSR_MHPMEVENT13H=C2=A0 =C2=A0 0x72d<br>
+#define CSR_MHPMEVENT14H=C2=A0 =C2=A0 0x72e<br>
+#define CSR_MHPMEVENT15H=C2=A0 =C2=A0 0x72f<br>
+#define CSR_MHPMEVENT16H=C2=A0 =C2=A0 0x730<br>
+#define CSR_MHPMEVENT17H=C2=A0 =C2=A0 0x731<br>
+#define CSR_MHPMEVENT18H=C2=A0 =C2=A0 0x732<br>
+#define CSR_MHPMEVENT19H=C2=A0 =C2=A0 0x733<br>
+#define CSR_MHPMEVENT20H=C2=A0 =C2=A0 0x734<br>
+#define CSR_MHPMEVENT21H=C2=A0 =C2=A0 0x735<br>
+#define CSR_MHPMEVENT22H=C2=A0 =C2=A0 0x736<br>
+#define CSR_MHPMEVENT23H=C2=A0 =C2=A0 0x737<br>
+#define CSR_MHPMEVENT24H=C2=A0 =C2=A0 0x738<br>
+#define CSR_MHPMEVENT25H=C2=A0 =C2=A0 0x739<br>
+#define CSR_MHPMEVENT26H=C2=A0 =C2=A0 0x73a<br>
+#define CSR_MHPMEVENT27H=C2=A0 =C2=A0 0x73b<br>
+#define CSR_MHPMEVENT28H=C2=A0 =C2=A0 0x73c<br>
+#define CSR_MHPMEVENT29H=C2=A0 =C2=A0 0x73d<br>
+#define CSR_MHPMEVENT30H=C2=A0 =C2=A0 0x73e<br>
+#define CSR_MHPMEVENT31H=C2=A0 =C2=A0 0x73f<br>
+<br>
=C2=A0#define CSR_MHPMCOUNTER3H=C2=A0 =C2=A00xb83<br>
=C2=A0#define CSR_MHPMCOUNTER4H=C2=A0 =C2=A00xb84<br>
=C2=A0#define CSR_MHPMCOUNTER5H=C2=A0 =C2=A00xb85<br>
@@ -461,6 +492,7 @@<br>
=C2=A0#define CSR_VSMTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2c0<br>
=C2=A0#define CSR_VSPMMASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x2c1<br>
=C2=A0#define CSR_VSPMBASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x2c2<br>
+#define CSR_SCOUNTOVF=C2=A0 =C2=A0 =C2=A0 =C2=A00xda0<br>
<br>
=C2=A0/* mstatus CSR bits */<br>
=C2=A0#define MSTATUS_UIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000001<br>
@@ -635,6 +667,7 @@ typedef enum RISCVException {<br>
=C2=A0#define IRQ_VS_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010<br>
=C2=A0#define IRQ_M_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11<br>
=C2=A0#define IRQ_S_GEXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012<br>
+#define IRQ_PMU_OVF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 13<br>
=C2=A0#define IRQ_LOCAL_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br>
=C2=A0#define IRQ_LOCAL_GUEST_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (TARGET_LONG_BITS - 1)<br>
<br>
@@ -652,11 +685,13 @@ typedef enum RISCVException {<br>
=C2=A0#define MIP_VSEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; IRQ_VS_EXT)<br>
=C2=A0#define MIP_MEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_M_EXT)<br>
=C2=A0#define MIP_SGEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; IRQ_S_GEXT)<br>
+#define MIP_LCOFIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_PMU_OVF)<br>
<br>
=C2=A0/* sip masks */<br>
=C2=A0#define SIP_SSIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIP_SSIP<br>
=C2=A0#define SIP_STIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIP_STIP<br>
=C2=A0#define SIP_SEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIP_SEIP<br>
+#define SIP_LCOFIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIP_LCOFIP<br>
<br>
=C2=A0/* MIE masks */<br>
=C2=A0#define MIE_SEIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_S_EXT)<br>
@@ -804,4 +839,24 @@ typedef enum RISCVException {<br>
=C2=A0#define HVICTL_VALID_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0(HVICTL_VTI | HVICTL_IID | HVICTL_IPRIOM | HVICTL_IPRIO=
)<br>
<br>
+/* PMU related bits */<br>
+#define MIE_LCOFIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_PMU_OVF)<br>
+<br>
+#define MHPMEVENT_BIT_OF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0BIT(63)<br></blockquote><div><br></div><div>Hi Atish,</=
div><div><br></div><div>I think it&#39;s better to use BIT_ULL() for value =
&gt;=3D 32.</div><div>BIT() is defined to: (1UL &lt;&lt; (nr)),</div><div>w=
hich might cause the overflow issue on some platforms (e.g. Windows).</div>=
<div>=C2=A0</div><div>Regards,</div><div>Frank Chang</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
+#define MHPMEVENTH_BIT_OF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BIT(31)<br>
+#define MHPMEVENT_BIT_MINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0BIT(62)<br>
+#define MHPMEVENTH_BIT_MINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(30)<br>
+#define MHPMEVENT_BIT_SINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0BIT(61)<br>
+#define MHPMEVENTH_BIT_SINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(29)<br>
+#define MHPMEVENT_BIT_UINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0BIT(60)<br>
+#define MHPMEVENTH_BIT_UINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(28)<br>
+#define MHPMEVENT_BIT_VSINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(59)<br>
+#define MHPMEVENTH_BIT_VSINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(27)<br>
+#define MHPMEVENT_BIT_VUINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 BIT(58)<br>
+#define MHPMEVENTH_BIT_VUINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0BIT(26)<br>
+<br>
+#define MHPMEVENT_SSCOF_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0_ULL(0xFFFF000000000000)<br>
+#define MHPMEVENT_IDX_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A00xFFFFF<br>
+#define MHPMEVENT_SSCOF_RESVD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 16<br>
+<br>
=C2=A0#endif<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index 3286e1e44455..cfcc1a0882d9 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -96,13 +96,26 @@ static RISCVException mctr32(CPURISCVState *env, int cs=
rno)<br>
=C2=A0 =C2=A0 =C2=A0return mctr(env, csrno);<br>
=C2=A0}<br>
<br>
+static RISCVException sscofpmf(CPURISCVState *env, int csrno)<br>
+{<br>
+ #if !defined(CONFIG_USER_ONLY)<br>
+=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
+<br>
+=C2=A0 =C2=A0 if (!cpu-&gt;cfg.ext_sscofpmf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br>
+#endif<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
=C2=A0static RISCVException ctr(CPURISCVState *env, int csrno)<br>
=C2=A0{<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0int ctr_index;<br>
-=C2=A0 =C2=A0 int base_csrno =3D CSR_HPMCOUNTER3;<br>
+=C2=A0 =C2=A0 int base_csrno =3D CSR_CYCLE;<br>
=C2=A0 =C2=A0 =C2=A0bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? true=
 : false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (rv32 &amp;&amp; csrno &gt;=3D CSR_CYCLEH) {<br>
@@ -111,11 +124,18 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0ctr_index =3D csrno - base_csrno;<br>
<br>
-=C2=A0 =C2=A0 if (!cpu-&gt;cfg.pmu_num || ctr_index &gt;=3D (cpu-&gt;cfg.p=
mu_num)) {<br>
+=C2=A0 =C2=A0 if ((csrno &gt;=3D CSR_CYCLE &amp;&amp; csrno &lt;=3D CSR_IN=
STRET) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (csrno &gt;=3D CSR_CYCLEH &amp;&amp; csrno &lt=
;=3D CSR_INSTRETH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto skip_ext_pmu_check;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ((!cpu-&gt;cfg.pmu_num || !(cpu-&gt;pmu_avail_ctrs &amp; =
BIT(ctr_index)))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* No counter is enabled in PMU or the co=
unter is out of range */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+skip_ext_pmu_check:<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (env-&gt;priv =3D=3D PRV_S) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (csrno) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CSR_CYCLE:<br>
@@ -134,7 +154,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_CYCLE;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!get_field(env-&gt;mcou=
nteren, 1 &lt;&lt; ctr_index)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_=
EXCP_ILLEGAL_INST;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -158,7 +177,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CSR_HPMCOUNTER3H...CSR=
_HPMCOUNTER31H:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrn=
o - CSR_CYCLEH;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!get_fiel=
d(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return RISCV_EXCP_ILLEGAL_INST;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -188,7 +206,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_CYCLE;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!get_field(env-&gt;hcou=
nteren, 1 &lt;&lt; ctr_index) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(en=
v-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_=
EXCP_VIRT_INSTRUCTION_FAULT;<br>
@@ -216,7 +233,6 @@ static RISCVException ctr(CPURISCVState *env, int csrno=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CSR_HPMCOUNTER3H...CSR=
_HPMCOUNTER31H:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrn=
o - CSR_CYCLEH;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!get_fiel=
d(env-&gt;hcounteren, 1 &lt;&lt; ctr_index) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 get_field(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
@@ -585,11 +601,36 @@ static int write_mhpmevent(CPURISCVState *env, int cs=
rno, target_ulong val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int evt_index =3D csrno - CSR_MCOUNTINHIBIT;<br>
<br>
+=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) !=3D MXL_RV32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_update_event_map(env, val, evt_index=
);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mhpmevent_val[evt_index] =3D val;<br>
<br>
=C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
=C2=A0}<br>
<br>
+static int read_mhpmeventh(CPURISCVState *env, int csrno, target_ulong *va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;<br>
+<br>
+=C2=A0 =C2=A0 *val =3D env-&gt;mhpmevent_val[evt_index];<br>
+<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
+static int write_mhpmeventh(CPURISCVState *env, int csrno, target_ulong va=
l)<br>
+{<br>
+=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;<br>
+=C2=A0 =C2=A0 uint64_t mhpmevth_val =3D val;<br>
+=C2=A0 =C2=A0 uint64_t mhpmevt_val =3D env-&gt;mhpmevent_val[evt_index];<b=
r>
+<br>
+=C2=A0 =C2=A0 mhpmevt_val =3D mhpmevt_val | (mhpmevth_val &lt;&lt; 32);<br=
>
+=C2=A0 =C2=A0 riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);<br>
+=C2=A0 =C2=A0 env-&gt;mhpmeventh_val[evt_index] =3D val;<br>
+<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
=C2=A0static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ul=
ong val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int ctr_idx =3D csrno - CSR_MCYCLE;<br>
@@ -599,7 +640,10 @@ static int write_mhpmcounter(CPURISCVState *env, int c=
srno, target_ulong val)<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_pmu_ctr_monitor_instructions(env, c=
tr_idx)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounter_prev =3D get_tick=
s(false);<br>
-=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctr_idx &gt; 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_setup_timer(env, val, =
ctr_idx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Other counters can keep incrementing f=
rom the given value */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounter_prev =3D val;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -611,11 +655,17 @@ static int write_mhpmcounterh(CPURISCVState *env, int=
 csrno, target_ulong val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int ctr_idx =3D csrno - CSR_MCYCLEH;<br>
=C2=A0 =C2=A0 =C2=A0PMUCTRState *counter =3D &amp;env-&gt;pmu_ctrs[ctr_idx]=
;<br>
+=C2=A0 =C2=A0 uint64_t mhpmctr_val =3D counter-&gt;mhpmcounter_val;<br>
+=C2=A0 =C2=A0 uint64_t mhpmctrh_val =3D val;<br>
<br>
=C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounterh_val =3D val;<br>
+=C2=A0 =C2=A0 mhpmctr_val =3D mhpmctr_val | (mhpmctrh_val &lt;&lt; 32);<br=
>
=C2=A0 =C2=A0 =C2=A0if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_pmu_ctr_monitor_instructions(env, c=
tr_idx)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounterh_prev =3D get_tic=
ks(true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctr_idx &gt; 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_setup_timer(env, mhpmc=
tr_val, ctr_idx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounterh_prev =3D val;<br=
>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -688,6 +738,32 @@ static int read_hpmcounterh(CPURISCVState *env, int cs=
rno, target_ulong *val)<br>
=C2=A0 =C2=A0 =C2=A0return riscv_pmu_read_ctr(env, val, true, ctr_index);<b=
r>
=C2=A0}<br>
<br>
+static int read_scountovf(CPURISCVState *env, int csrno, target_ulong *val=
)<br>
+{<br>
+=C2=A0 =C2=A0 int mhpmevt_start =3D CSR_MHPMEVENT3 - CSR_MCOUNTINHIBIT;<br=
>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 *val =3D 0;<br>
+=C2=A0 =C2=A0 target_ulong *mhpm_evt_val;<br>
+=C2=A0 =C2=A0 uint64_t of_bit_mask;<br>
+<br>
+=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mhpm_evt_val =3D env-&gt;mhpmeventh_val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_bit_mask =3D MHPMEVENTH_BIT_OF;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mhpm_evt_val =3D env-&gt;mhpmevent_val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_bit_mask =3D MHPMEVENT_BIT_OF;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D mhpmevt_start; i &lt; RV_MAX_MHPMEVENTS; i++) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((get_field(env-&gt;mcounteren, BIT(i))) &a=
mp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (mhpm_evt_val[i] &amp; of_bit_ma=
sk)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val=
 |=3D BIT(i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
=C2=A0#if defined(CONFIG_USER_ONLY)<br>
=C2=A0static RISCVException read_time(CPURISCVState *env, int csrno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<br>
@@ -734,7 +810,8 @@ static RISCVException read_timeh(CPURISCVState *env, in=
t csrno,<br>
=C2=A0/* Machine constants */<br>
<br>
=C2=A0#define M_MODE_INTERRUPTS=C2=A0 ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP=
_MEIP))<br>
-#define S_MODE_INTERRUPTS=C2=A0 ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP=
))<br>
+#define S_MODE_INTERRUPTS=C2=A0 ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP=
 | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIP_LCOFIP))<br=
>
=C2=A0#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VS=
EIP))<br>
=C2=A0#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS=
))<br>
<br>
@@ -775,7 +852,8 @@ static const target_ulong vs_delegable_excps =3D DELEGA=
BLE_EXCPS &amp;<br>
=C2=A0static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE | SSTATU=
S_SPIE |<br>
=C2=A0 =C2=A0 =C2=A0SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS |=
 SSTATUS_XS |<br>
=C2=A0 =C2=A0 =C2=A0SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;<br>
-static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | MIP_=
UEIP;<br>
+static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | MIP_=
UEIP |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 SIP_LCOFIP;<br>
=C2=A0static const target_ulong hip_writable_mask =3D MIP_VSSIP;<br>
=C2=A0static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTI=
P | MIP_VSEIP;<br>
=C2=A0static const target_ulong vsip_writable_mask =3D MIP_VSSIP;<br>
@@ -3814,6 +3892,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0[CSR_MHPMEVENT31]=C2=A0 =C2=A0 =3D { &quot;mhpmevent31&=
quot;,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0 read_mhpmevent,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_mhpmevent },<br>
<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT3H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent3h&quot;=
,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT4H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent4h&quot;=
,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT5H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent5h&quot;=
,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT6H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent6h&quot;=
,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT7H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent7h&quot;=
,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT8H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent8h&quot;=
,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT9H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent9h&quot;=
,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT10H]=C2=A0 =C2=A0=3D { &quot;mhpmevent10h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT11H]=C2=A0 =C2=A0=3D { &quot;mhpmevent11h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT12H]=C2=A0 =C2=A0=3D { &quot;mhpmevent12h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT13H]=C2=A0 =C2=A0=3D { &quot;mhpmevent13h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT14H]=C2=A0 =C2=A0=3D { &quot;mhpmevent14h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT15H]=C2=A0 =C2=A0=3D { &quot;mhpmevent15h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT16H]=C2=A0 =C2=A0=3D { &quot;mhpmevent16h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT17H]=C2=A0 =C2=A0=3D { &quot;mhpmevent17h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT18H]=C2=A0 =C2=A0=3D { &quot;mhpmevent18h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT19H]=C2=A0 =C2=A0=3D { &quot;mhpmevent19h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT20H]=C2=A0 =C2=A0=3D { &quot;mhpmevent20h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT21H]=C2=A0 =C2=A0=3D { &quot;mhpmevent21h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT22H]=C2=A0 =C2=A0=3D { &quot;mhpmevent22h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT23H]=C2=A0 =C2=A0=3D { &quot;mhpmevent23h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT24H]=C2=A0 =C2=A0=3D { &quot;mhpmevent24h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT25H]=C2=A0 =C2=A0=3D { &quot;mhpmevent25h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT26H]=C2=A0 =C2=A0=3D { &quot;mhpmevent26h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT27H]=C2=A0 =C2=A0=3D { &quot;mhpmevent27h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT28H]=C2=A0 =C2=A0=3D { &quot;mhpmevent28h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT29H]=C2=A0 =C2=A0=3D { &quot;mhpmevent29h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT30H]=C2=A0 =C2=A0=3D { &quot;mhpmevent30h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT31H]=C2=A0 =C2=A0=3D { &quot;mhpmevent31h&quot=
;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HPMCOUNTER3H]=C2=A0 =C2=A0=3D { &quot;hpmcounter3h=
&quot;,=C2=A0 =C2=A0ctr32,=C2=A0 read_hpmcounterh },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HPMCOUNTER4H]=C2=A0 =C2=A0=3D { &quot;hpmcounter4h=
&quot;,=C2=A0 =C2=A0ctr32,=C2=A0 read_hpmcounterh },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_HPMCOUNTER5H]=C2=A0 =C2=A0=3D { &quot;hpmcounter5h=
&quot;,=C2=A0 =C2=A0ctr32,=C2=A0 read_hpmcounterh },<br>
@@ -3902,5 +4039,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_mhpmcounterh },<br>
=C2=A0 =C2=A0 =C2=A0[CSR_MHPMCOUNTER31H] =3D { &quot;mhpmcounter31h&quot;, =
mctr32,=C2=A0 read_hpmcounterh,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_mhpmcounterh },<br>
+=C2=A0 =C2=A0 [CSR_SCOUNTOVF]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;scountovf&qu=
ot;, sscofpmf,=C2=A0 read_scountovf },<br>
+<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c<br>
index 000fe8da45ef..5b212d2eb630 100644<br>
--- a/target/riscv/pmu.c<br>
+++ b/target/riscv/pmu.c<br>
@@ -20,13 +20,355 @@<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;pmu.h&quot;<br>
<br>
+#define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */<br>
+#define MAKE_32BIT_MASK(shift, length) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (((uint32_t)(~0UL) &gt;&gt; (32 - (length))) &=
lt;&lt; (shift))<br>
+<br>
+static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)<br>
+{<br>
+=C2=A0 =C2=A0 if (ctr_idx &lt; 3 || ctr_idx &gt;=3D RV_MAX_MHPMCOUNTERS ||=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(cpu-&gt;pmu_avail_ctrs &amp; BIT(ctr_idx))) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static bool riscv_pmu_counter_enabled(RISCVCPU *cpu, uint32_t ctr_idx)<br>
+{<br>
+=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
+<br>
+=C2=A0 =C2=A0 if (!riscv_pmu_counter_valid(cpu, ctr_idx) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !get_field(env-&gt;mcounteren, BIT(ctr_idx))) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)<br>
+{<br>
+=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
+=C2=A0 =C2=A0 target_ulong max_val =3D UINT32_MAX;<br>
+=C2=A0 =C2=A0 PMUCTRState *counter =3D &amp;env-&gt;pmu_ctrs[ctr_idx];<br>
+<br>
+=C2=A0 =C2=A0 /* Privilege mode filtering */<br>
+=C2=A0 =C2=A0 if ((env-&gt;priv =3D=3D PRV_M &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmeventh_val[ctr_idx] &amp; MHPMEVE=
NTH_BIT_MINH)) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmeventh_val[ctr_idx] &amp; MHPMEVE=
NTH_BIT_SINH)) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_U &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmeventh_val[ctr_idx] &amp; MHPMEVE=
NTH_BIT_UINH))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Handle the overflow scenario */<br>
+=C2=A0 =C2=A0 if (counter-&gt;mhpmcounter_val =3D=3D max_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (counter-&gt;mhpmcounterh_val =3D=3D max_va=
l) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_val =3D =
0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounterh_val =3D=
 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Generate interrupt only if OF=
 bit is clear */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(env-&gt;mhpmeventh_val[ctr=
_idx] &amp; MHPMEVENTH_BIT_OF)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mhpmeventh=
_val[ctr_idx] |=3D MHPMEVENTH_BIT_OF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_update_m=
ip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounterh_val++;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_val++;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uint32_t ctr_idx)<br>
+{<br>
+=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
+=C2=A0 =C2=A0 PMUCTRState *counter =3D &amp;env-&gt;pmu_ctrs[ctr_idx];<br>
+=C2=A0 =C2=A0 uint64_t max_val =3D UINT64_MAX;<br>
+<br>
+=C2=A0 =C2=A0 /* Privilege mode filtering */<br>
+=C2=A0 =C2=A0 if ((env-&gt;priv =3D=3D PRV_M &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmevent_val[ctr_idx] &amp; MHPMEVEN=
T_BIT_MINH)) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmevent_val[ctr_idx] &amp; MHPMEVEN=
T_BIT_SINH)) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_U &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmevent_val[ctr_idx] &amp; MHPMEVEN=
T_BIT_UINH))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Handle the overflow scenario */<br>
+=C2=A0 =C2=A0 if (counter-&gt;mhpmcounter_val =3D=3D max_val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_val =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Generate interrupt only if OF bit is clear =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(env-&gt;mhpmevent_val[ctr_idx] &amp; MHP=
MEVENT_BIT_OF)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mhpmevent_val[ctr_idx] |=
=3D MHPMEVENT_BIT_OF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, MIP_LC=
OFIP, BOOL_TO_MASK(1));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_val++;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)<=
br>
+{<br>
+=C2=A0 =C2=A0 uint32_t ctr_idx;<br>
+=C2=A0 =C2=A0 int ret;<br>
+=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
+=C2=A0 =C2=A0 gpointer value;<br>
+<br>
+=C2=A0 =C2=A0 value =3D g_hash_table_lookup(cpu-&gt;pmu_event_ctr_map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUINT_TO_POINTER(event_idx));<br>
+=C2=A0 =C2=A0 if (!value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ctr_idx =3D GPOINTER_TO_UINT(value);<br>
+=C2=A0 =C2=A0 if (!riscv_pmu_counter_enabled(cpu, ctr_idx) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;mcountinhibit, BIT(ctr_idx))=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D riscv_pmu_incr_ctr_rv32(cpu, ctr_idx);=
<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D riscv_pmu_incr_ctr_rv64(cpu, ctr_idx);=
<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
=C2=A0bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ui=
nt32_t target_ctr)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return (target_ctr =3D=3D 0) ? true : false;<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu;<br>
+=C2=A0 =C2=A0 uint32_t event_idx;<br>
+=C2=A0 =C2=A0 uint32_t ctr_idx;<br>
+<br>
+=C2=A0 =C2=A0 /* Fixed instret counter */<br>
+=C2=A0 =C2=A0 if (target_ctr =3D=3D 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 cpu =3D RISCV_CPU(env_cpu(env));<br>
+=C2=A0 =C2=A0 event_idx =3D RISCV_PMU_EVENT_HW_INSTRUCTIONS;<br>
+=C2=A0 =C2=A0 ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu-&gt;pmu=
_event_ctr_map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUINT_TO_POINTER(event_idx)));<br>
+=C2=A0 =C2=A0 if (!ctr_idx) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return target_ctr =3D=3D ctr_idx ? true : false;<br>
=C2=A0}<br>
<br>
=C2=A0bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target=
_ctr)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return (target_ctr =3D=3D 2) ? true : false;<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu;<br>
+=C2=A0 =C2=A0 uint32_t event_idx;<br>
+=C2=A0 =C2=A0 uint32_t ctr_idx;<br>
+<br>
+=C2=A0 =C2=A0 /* Fixed mcycle counter */<br>
+=C2=A0 =C2=A0 if (target_ctr =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 cpu =3D RISCV_CPU(env_cpu(env));<br>
+=C2=A0 =C2=A0 event_idx =3D RISCV_PMU_EVENT_HW_CPU_CYCLES;<br>
+=C2=A0 =C2=A0 ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu-&gt;pmu=
_event_ctr_map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUINT_TO_POINTER(event_idx)));<br>
+<br>
+=C2=A0 =C2=A0 /* Counter zero is not used for event_ctr_map */<br>
+=C2=A0 =C2=A0 if (!ctr_idx) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return (target_ctr =3D=3D ctr_idx) ? true : false;<br>
+}<br>
+<br>
+static gboolean pmu_remove_event_map(gpointer key, gpointer value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpointer udata)<=
br>
+{<br>
+=C2=A0 =C2=A0 return (GPOINTER_TO_UINT(value) =3D=3D GPOINTER_TO_UINT(udat=
a)) ? true : false;<br>
+}<br>
+<br>
+static int64_t pmu_icount_ticks_to_ns(int64_t value)<br>
+{<br>
+=C2=A0 =C2=A0 int64_t ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 if (icount_enabled()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D icount_to_ns(value);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D (NANOSECONDS_PER_SECOND / RISCV_TIMEBA=
SE_FREQ) * value;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ctr_idx)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t event_idx;<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));<br>
+<br>
+=C2=A0 =C2=A0 if (!riscv_pmu_counter_valid(cpu, ctr_idx)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* Expected mhpmevent value is zero for reset case. Rem=
ove the current<br>
+=C2=A0 =C2=A0 =C2=A0* mapping.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (!value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_foreach_remove(cpu-&gt;pmu_event_=
ctr_map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_remove_event_map,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUINT_TO_POINTER(ctr_i=
dx));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 event_idx =3D value &amp; MHPMEVENT_IDX_MASK;<br>
+=C2=A0 =C2=A0 if (g_hash_table_lookup(cpu-&gt;pmu_event_ctr_map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 GUINT_TO_POINTER(event_idx))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 switch (event_idx) {<br>
+=C2=A0 =C2=A0 case RISCV_PMU_EVENT_HW_CPU_CYCLES:<br>
+=C2=A0 =C2=A0 case RISCV_PMU_EVENT_HW_INSTRUCTIONS:<br>
+=C2=A0 =C2=A0 case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:<br>
+=C2=A0 =C2=A0 case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:<br>
+=C2=A0 =C2=A0 case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We don&#39;t support any raw events right n=
ow */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_hash_table_insert(cpu-&gt;pmu_event_ctr_map, GUINT_TO_POIN=
TER(event_idx),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 GUINT_TO_POINTER(ctr_idx));<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static void pmu_timer_trigger_irq(RISCVCPU *cpu,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum riscv_pmu_event_idx evt_=
idx)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t ctr_idx;<br>
+=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
+=C2=A0 =C2=A0 PMUCTRState *counter;<br>
+=C2=A0 =C2=A0 target_ulong *mhpmevent_val;<br>
+=C2=A0 =C2=A0 uint64_t of_bit_mask;<br>
+=C2=A0 =C2=A0 int64_t irq_trigger_at;<br>
+<br>
+=C2=A0 =C2=A0 if (evt_idx !=3D RISCV_PMU_EVENT_HW_CPU_CYCLES &amp;&amp;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 evt_idx !=3D RISCV_PMU_EVENT_HW_INSTRUCTIONS) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu-&gt;pmu=
_event_ctr_map,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUINT_TO_POINTER(evt_idx)));<br>
+=C2=A0 =C2=A0 if (!riscv_pmu_counter_enabled(cpu, ctr_idx)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mhpmevent_val =3D &amp;env-&gt;mhpmeventh_val[=
ctr_idx];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_bit_mask =3D MHPMEVENTH_BIT_OF;<br>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mhpmevent_val =3D &amp;env-&gt;mhpmevent_val[c=
tr_idx];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_bit_mask =3D MHPMEVENT_BIT_OF;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 counter =3D &amp;env-&gt;pmu_ctrs[ctr_idx];<br>
+=C2=A0 =C2=A0 if (counter-&gt;irq_overflow_left &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq_trigger_at =3D qemu_clock_get_ns(QEMU_CLOC=
K_VIRTUAL) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 counter-&gt;irq_overflow_left;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod_anticipate_ns(cpu-&gt;pmu_timer, irq=
_trigger_at);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;irq_overflow_left =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (cpu-&gt;pmu_avail_ctrs &amp; BIT(ctr_idx)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Generate interrupt only if OF bit is clear =
*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(*mhpmevent_val &amp; of_bit_mask)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *mhpmevent_val |=3D of_bit_mask;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, MIP_LC=
OFIP, BOOL_TO_MASK(1));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+/* Timer callback for instret and cycle counter overflow */<br>
+void riscv_pmu_timer_cb(void *priv)<br>
+{<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D priv;<br>
+<br>
+=C2=A0 =C2=A0 /* Timer event was triggered only for these events */<br>
+=C2=A0 =C2=A0 pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_CPU_CYCLES);<b=
r>
+=C2=A0 =C2=A0 pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_INSTRUCTIONS);=
<br>
+}<br>
+<br>
+int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t ctr=
_idx)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t overflow_delta, overflow_at;<br>
+=C2=A0 =C2=A0 int64_t overflow_ns, overflow_left =3D 0;<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));<br>
+=C2=A0 =C2=A0 PMUCTRState *counter =3D &amp;env-&gt;pmu_ctrs[ctr_idx];<br>
+<br>
+=C2=A0 =C2=A0 if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu-&gt;cfg.e=
xt_sscofpmf) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (value) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_delta =3D UINT64_MAX - value + 1;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_delta =3D UINT64_MAX - value;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /**<br>
+=C2=A0 =C2=A0 =C2=A0* QEMU supports only int64_t timers while RISC-V count=
ers are uint64_t.<br>
+=C2=A0 =C2=A0 =C2=A0* Compute the leftover and save it so that it can be r=
eprogrammed again<br>
+=C2=A0 =C2=A0 =C2=A0* when timer expires.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (overflow_delta &gt; INT64_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_left =3D overflow_delta - INT64_MAX;<=
br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_ctr_monitor_instructions(env, ctr_id=
x)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_ns =3D pmu_icount_ticks_to_ns((int64_=
t)overflow_delta);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_left =3D pmu_icount_ticks_to_ns(overf=
low_left) ;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 overflow_at =3D (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTU=
AL) + overflow_ns;<br>
+<br>
+=C2=A0 =C2=A0 if (overflow_at &gt; INT64_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_left +=3D overflow_at - INT64_MAX;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;irq_overflow_left =3D overflow_lef=
t;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_at =3D INT64_MAX;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 timer_mod_anticipate_ns(cpu-&gt;pmu_timer, overflow_at);<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+<br>
+int riscv_pmu_init(RISCVCPU *cpu, int num_counters)<br>
+{<br>
+=C2=A0 =C2=A0 if (num_counters &gt; (RV_MAX_MHPMCOUNTERS - 3)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 cpu-&gt;pmu_event_ctr_map =3D g_hash_table_new(g_direct_hash=
, g_direct_equal);<br>
+=C2=A0 =C2=A0 if (!cpu-&gt;pmu_event_ctr_map) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* PMU support can not be enabled */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;PMU events can&=
#39;t be supported\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.pmu_num =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Create a bitmask of available programmable counters */<br=
>
+=C2=A0 =C2=A0 cpu-&gt;pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, num_counters);=
<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h<br>
index 58a5bc3a4089..036653627f78 100644<br>
--- a/target/riscv/pmu.h<br>
+++ b/target/riscv/pmu.h<br>
@@ -26,3 +26,10 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *e=
nv,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ui=
nt32_t target_ctr);<br>
=C2=A0bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t target_ctr);<b=
r>
+void riscv_pmu_timer_cb(void *priv);<br>
+int riscv_pmu_init(RISCVCPU *cpu, int num_counters);<br>
+int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ctr_idx);<br>
+int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);=
<br>
+int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint32_t ctr_idx);<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div></div>

--0000000000003fb13705da651de0--

