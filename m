Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8d7E-0006TX-Qx
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 03:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o8d7D-0006SZ-CR
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 03:36:59 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o8d79-0003fW-Rf
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 03:36:59 -0400
Received: by mail-pg1-x530.google.com with SMTP id j184so42785pge.10
 for <qemu-riscv@nongnu.org>; Tue, 05 Jul 2022 00:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=475FdpEAjJBIyACXlOCYMzxPuiBgaUPQscPKN6A9moA=;
 b=REFK/aYI0P5EnHSRnEHjmBwkxm1cgHIf4GfmvKtrKwGVLbBmf7tx+pPEFVn7vNxl1v
 qZOSlmQw91nCjWDYX8OGxMeF2dW+GomtmgZr5zgerGoqsjXy9SmXuwI0+v1mhyQDEGRq
 vYsSNHSGv9FYyZcOludkeeo+n7xRGiwuqPLlZ06MVyf1lfbMXcKs1Ld/RLy0EA7qcPE2
 oNwFtUIElGL0tdLsmfbWUKHdmhuw1kHsPXRHW3jusoDjSAhWf+XeeS+JHIxR7Wl/eoTL
 0b9II7nXV5wW/uQmETUXTccybTyjNyUYebJatFjSXi9uAbw0kscb3LLhWcoMO89dWQQq
 /MIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=475FdpEAjJBIyACXlOCYMzxPuiBgaUPQscPKN6A9moA=;
 b=z/08bCzy0+eb3xLLJcu9qLZmkHEUDt2DL7F0h7wzeHJDcrKvfMZr+hF3aeHGYw3TDg
 teHe8qA3/IUsq2RejHJUXDjSd+CziEkrjHY/y0G4SpafjRufCxapF9PZDejpoq1TUIee
 nzKGPFmC3BiLxDxgLp6iSxpQJ3QiNNpZ+1Msi+KW51mNpZ691dzbJotl3JoRSdoipzWG
 J6rlRDh5K2btaR2Tk7F3m1kMF3939ZjG9j0+Gr7Rer0bJlFA8aOIkBDupiyFKZt9CF92
 Eu8Tj966cTv2Mg9vjPo0E7xR/UN5olz5fi8kdwg6hO7Xb5CeNsAEZCfTOpr1CEtctgDm
 5evw==
X-Gm-Message-State: AJIora8gI0VLJqIVdfVndXfnLBujeDgdcG986jl0sX9HzoZc34bTeWbO
 OVzQM40JrSm56cZGtCrwCd+EjSU6NmUiCsLz1tU7ZA==
X-Google-Smtp-Source: AGRyM1txURRQGVCDQpwBa4gzJsIk2tXuX9MTshiywOrerWYk8FsWs74xu1oAJetrFlB/5KCkKMteYGnwCD+wIu4miBk=
X-Received: by 2002:aa7:9258:0:b0:525:4214:e937 with SMTP id
 24-20020aa79258000000b005254214e937mr39357278pfp.15.1657006612223; Tue, 05
 Jul 2022 00:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-9-atishp@rivosinc.com>
 <ea58fce9-57c9-ad73-4ae9-e6aa71a684b0@iscas.ac.cn>
In-Reply-To: <ea58fce9-57c9-ad73-4ae9-e6aa71a684b0@iscas.ac.cn>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 5 Jul 2022 00:36:41 -0700
Message-ID: <CAHBxVyEKwnmCmu21pfEHDwzVA5prkcPteHbLy4F1uVV5bY5f8Q@mail.gmail.com>
Subject: Re: [PATCH v10 08/12] target/riscv: Add sscofpmf extension support
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 05 Jul 2022 07:36:59 -0000

On Mon, Jul 4, 2022 at 6:31 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/6/21 =E4=B8=8A=E5=8D=887:15, Atish Patra =E5=86=99=E9=81=
=93:
>
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
>  target/riscv/cpu.c      |  11 ++
>  target/riscv/cpu.h      |  25 +++
>  target/riscv/cpu_bits.h |  55 +++++++
>  target/riscv/csr.c      | 165 ++++++++++++++++++-
>  target/riscv/machine.c  |   1 +
>  target/riscv/pmu.c      | 357 +++++++++++++++++++++++++++++++++++++++-
>  target/riscv/pmu.h      |   7 +
>  7 files changed, 610 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d12c6dc630ca..7d9e2aca12a9 100644
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
> @@ -775,6 +776,15 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
>          set_misa(env, env->misa_mxl, ext);
>      }
>
> +#ifndef CONFIG_USER_ONLY
> +    if (cpu->cfg.pmu_num) {
> +        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscof=
pmf) {
> +            cpu->pmu_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                          riscv_pmu_timer_cb, cpu);
> +        }
> +     }
> +#endif
> +
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
>      qemu_init_vcpu(cs);
> @@ -879,6 +889,7 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> +    DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5c7acc055ac9..2222db193c3d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -137,6 +137,8 @@ typedef struct PMUCTRState {
>      /* Snapshort value of a counter in RV32 */
>      target_ulong mhpmcounterh_prev;
>      bool started;
> +    /* Value beyond UINT32_MAX/UINT64_MAX before overflow interrupt trig=
ger */
> +    target_ulong irq_overflow_left;
>  } PMUCTRState;
>
>  struct CPUArchState {
> @@ -297,6 +299,9 @@ struct CPUArchState {
>      /* PMU event selector configured values. First three are unused*/
>      target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
>
> +    /* PMU event selector configured values for RV32*/
> +    target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];
> +
>      target_ulong sscratch;
>      target_ulong mscratch;
>
> @@ -433,6 +438,7 @@ struct RISCVCPUConfig {
>      bool ext_zve32f;
>      bool ext_zve64f;
>      bool ext_zmmul;
> +    bool ext_sscofpmf;
>      bool rvv_ta_all_1s;
>
>      uint32_t mvendorid;
> @@ -479,6 +485,12 @@ struct ArchCPU {
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
> @@ -738,6 +750,19 @@ enum {
>      CSR_TABLE_SIZE =3D 0x1000
>  };
>
> +/**
> + * The event id are encoded based on the encoding specified in the
> + * SBI specification v0.3
> + */
> +
> +enum riscv_pmu_event_idx {
> +    RISCV_PMU_EVENT_HW_CPU_CYCLES =3D 0x01,
> +    RISCV_PMU_EVENT_HW_INSTRUCTIONS =3D 0x02,
> +    RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS =3D 0x10019,
> +    RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS =3D 0x1001B,
> +    RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS =3D 0x10021,
> +};
> +
>  /* CSR function table */
>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index b3f7fa713000..d94abefdaa0f 100644
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
>  /* Crypto Extension */
>  #define CSR_SEED            0x015
> @@ -638,6 +670,7 @@ typedef enum RISCVException {
>  #define IRQ_VS_EXT                         10
>  #define IRQ_M_EXT                          11
>  #define IRQ_S_GEXT                         12
> +#define IRQ_PMU_OVF                        13
>  #define IRQ_LOCAL_MAX                      16
>  #define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
>
> @@ -655,11 +688,13 @@ typedef enum RISCVException {
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
> @@ -813,4 +848,24 @@ typedef enum RISCVException {
>  #define SEED_OPST_WAIT                   (0b01 << 30)
>  #define SEED_OPST_ES16                   (0b10 << 30)
>  #define SEED_OPST_DEAD                   (0b11 << 30)
> +/* PMU related bits */
> +#define MIE_LCOFIE                         (1 << IRQ_PMU_OVF)
> +
> +#define MHPMEVENT_BIT_OF                   BIT_ULL(63)
> +#define MHPMEVENTH_BIT_OF                  BIT(31)
> +#define MHPMEVENT_BIT_MINH                 BIT_ULL(62)
> +#define MHPMEVENTH_BIT_MINH                BIT(30)
> +#define MHPMEVENT_BIT_SINH                 BIT_ULL(61)
> +#define MHPMEVENTH_BIT_SINH                BIT(29)
> +#define MHPMEVENT_BIT_UINH                 BIT_ULL(60)
> +#define MHPMEVENTH_BIT_UINH                BIT(28)
> +#define MHPMEVENT_BIT_VSINH                BIT_ULL(59)
> +#define MHPMEVENTH_BIT_VSINH               BIT(27)
> +#define MHPMEVENT_BIT_VUINH                BIT_ULL(58)
> +#define MHPMEVENTH_BIT_VUINH               BIT(26)
> +
> +#define MHPMEVENT_SSCOF_MASK               _ULL(0xFFFF000000000000)
> +#define MHPMEVENT_IDX_MASK                 0xFFFFF
> +#define MHPMEVENT_SSCOF_RESVD              16
> +
>  #endif
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d65318dcc62d..2664ce265784 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -74,7 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno=
)
>      CPUState *cs =3D env_cpu(env);
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      int ctr_index;
> -    int base_csrno =3D CSR_HPMCOUNTER3;
> +    int base_csrno =3D CSR_CYCLE;
>      bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? true : false;
>
>      if (rv32 && csrno >=3D CSR_CYCLEH) {
> @@ -83,11 +83,18 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
>      }
>      ctr_index =3D csrno - base_csrno;
>
> -    if (!cpu->cfg.pmu_num || ctr_index >=3D (cpu->cfg.pmu_num)) {
> +    if ((csrno >=3D CSR_CYCLE && csrno <=3D CSR_INSTRET) ||
> +        (csrno >=3D CSR_CYCLEH && csrno <=3D CSR_INSTRETH)) {
> +        goto skip_ext_pmu_check;
> +    }
> +
> +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) =
{
>          /* No counter is enabled in PMU or the counter is out of range *=
/
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +skip_ext_pmu_check:
> +
>      if (env->priv =3D=3D PRV_S) {
>          switch (csrno) {
>          case CSR_CYCLE:
> @@ -106,7 +113,6 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
>              }
>              break;
>          case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            ctr_index =3D csrno - CSR_CYCLE;
>              if (!get_field(env->mcounteren, 1 << ctr_index)) {
>                  return RISCV_EXCP_ILLEGAL_INST;
>              }
> @@ -130,7 +136,6 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
>                  }
>                  break;
>              case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                ctr_index =3D csrno - CSR_CYCLEH;
>                  if (!get_field(env->mcounteren, 1 << ctr_index)) {
>                      return RISCV_EXCP_ILLEGAL_INST;
>                  }
> @@ -160,7 +165,6 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
>              }
>              break;
>          case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> -            ctr_index =3D csrno - CSR_CYCLE;
>              if (!get_field(env->hcounteren, 1 << ctr_index) &&
>                   get_field(env->mcounteren, 1 << ctr_index)) {
>                  return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> @@ -188,7 +192,6 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
>                  }
>                  break;
>              case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> -                ctr_index =3D csrno - CSR_CYCLEH;
>                  if (!get_field(env->hcounteren, 1 << ctr_index) &&
>                       get_field(env->mcounteren, 1 << ctr_index)) {
>                      return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> @@ -240,6 +243,18 @@ static RISCVException mctr32(CPURISCVState *env, int=
 csrno)
>      return mctr(env, csrno);
>  }
>
> +static RISCVException sscofpmf(CPURISCVState *env, int csrno)
> +{
> +    CPUState *cs =3D env_cpu(env);
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_sscofpmf) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException any(CPURISCVState *env, int csrno)
>  {
>      return RISCV_EXCP_NONE;
> @@ -663,9 +678,38 @@ static int read_mhpmevent(CPURISCVState *env, int cs=
rno, target_ulong *val)
>  static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulong v=
al)
>  {
>      int evt_index =3D csrno - CSR_MCOUNTINHIBIT;
> +    uint64_t mhpmevt_val =3D val;
>
>      env->mhpmevent_val[evt_index] =3D val;
>
> +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> +        mhpmevt_val =3D mhpmevt_val | ((uint64_t)env->mhpmeventh_val[evt=
_index] << 32);
> +    }
> +    riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_mhpmeventh(CPURISCVState *env, int csrno, target_ulong *=
val)
> +{
> +    int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;
> +
> +    *val =3D env->mhpmeventh_val[evt_index];
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mhpmeventh(CPURISCVState *env, int csrno, target_ulong =
val)
> +{
> +    int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;
> +    uint64_t mhpmevth_val =3D val;
> +    uint64_t mhpmevt_val =3D env->mhpmevent_val[evt_index];
> +
> +    mhpmevt_val =3D mhpmevt_val | (mhpmevth_val << 32);
> +    env->mhpmeventh_val[evt_index] =3D val;
> +
> +    riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
> +
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -673,12 +717,20 @@ static int write_mhpmcounter(CPURISCVState *env, in=
t csrno, target_ulong val)
>  {
>      int ctr_idx =3D csrno - CSR_MCYCLE;
>      PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> +    uint64_t mhpmctr_val =3D val;
>
>      counter->mhpmcounter_val =3D val;
>      if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>          riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
>          counter->mhpmcounter_prev =3D get_ticks(false);
> -    } else {
> +        if (ctr_idx > 2) {
> +            if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> +                mhpmctr_val =3D mhpmctr_val |
> +                              ((uint64_t)counter->mhpmcounterh_val << 32=
);
> +            }
> +            riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
> +        }
> +     } else {
>          /* Other counters can keep incrementing from the given value */
>          counter->mhpmcounter_prev =3D val;
>      }
> @@ -690,11 +742,17 @@ static int write_mhpmcounterh(CPURISCVState *env, i=
nt csrno, target_ulong val)
>  {
>      int ctr_idx =3D csrno - CSR_MCYCLEH;
>      PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> +    uint64_t mhpmctr_val =3D counter->mhpmcounter_val;
> +    uint64_t mhpmctrh_val =3D val;
>
>      counter->mhpmcounterh_val =3D val;
> +    mhpmctr_val =3D mhpmctr_val | (mhpmctrh_val << 32);
>      if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>          riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
>          counter->mhpmcounterh_prev =3D get_ticks(true);
> +        if (ctr_idx > 2) {
> +            riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
> +        }
>      } else {
>          counter->mhpmcounterh_prev =3D val;
>      }
> @@ -770,6 +828,32 @@ static int read_hpmcounterh(CPURISCVState *env, int =
csrno, target_ulong *val)
>      return riscv_pmu_read_ctr(env, val, true, ctr_index);
>  }
>
> +static int read_scountovf(CPURISCVState *env, int csrno, target_ulong *v=
al)
> +{
> +    int mhpmevt_start =3D CSR_MHPMEVENT3 - CSR_MCOUNTINHIBIT;
> +    int i;
> +    *val =3D 0;
> +    target_ulong *mhpm_evt_val;
> +    uint64_t of_bit_mask;
> +
> +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> +        mhpm_evt_val =3D env->mhpmeventh_val;
> +        of_bit_mask =3D MHPMEVENTH_BIT_OF;
> +    } else {
> +        mhpm_evt_val =3D env->mhpmevent_val;
> +        of_bit_mask =3D MHPMEVENT_BIT_OF;
> +    }
> +
> +    for (i =3D mhpmevt_start; i < RV_MAX_MHPMEVENTS; i++) {
> +        if ((get_field(env->mcounteren, BIT(i))) &&
> +            (mhpm_evt_val[i] & of_bit_mask)) {
> +                    *val |=3D BIT(i);
> +            }
> +    }
> +
> +    return RISCV_EXCP_NONE;o
> +}
> +
>  static RISCVException read_time(CPURISCVState *env, int csrno,
>                                  target_ulong *val)
>  {
> @@ -799,7 +883,8 @@ static RISCVException read_timeh(CPURISCVState *env, =
int csrno,
>  /* Machine constants */
>
>  #define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP))
> -#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP))
> +#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP | =
\
> +                                      MIP_LCOFIP))
>
> It seems a problem here. S_MODE_INTERRUPTS will be used in delegable_ints=
, and then be used not
>
> only in rmw_mip64  but also in rmw_mideleg64, so if we add MIP_LCOFIP her=
e, this bit will also added
>
> into mideleg which is not stated in the spec for sscofpmf.
>

Here is the snippet from the sscofpmf spec which says counter overflow
interrupt can be delegated to S-mode.

"Generation of a "count overflow interrupt request" by an hpmcounter
sets the LCOFIP bit in the
mip/sip registers and sets the associated OF bit. The mideleg register
controls the delegation of
this interrupt to S-mode versus M-mode."

> And if MIP_LCOFIP is not a bit in  mideleg, the following modification fo=
r  'sip_writable_mask' will not work.
>
> Regards,
>
> Weiwei Li
>
>  #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP=
))
>  #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS))
>
> @@ -840,7 +925,8 @@ static const target_ulong vs_delegable_excps =3D DELE=
GABLE_EXCPS &
>  static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE | SSTATUS_S=
PIE |
>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
>      SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
> -static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | MI=
P_UEIP;
> +static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | MI=
P_UEIP |
> +                                              SIP_LCOFIP;
>  static const target_ulong hip_writable_mask =3D MIP_VSSIP;
>  static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTIP |=
 MIP_VSEIP;
>  static const target_ulong vsip_writable_mask =3D MIP_VSSIP;
> @@ -4005,6 +4091,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_mhpmevent,
>                                                         write_mhpmevent }=
,
>
> +    [CSR_MHPMEVENT3H]    =3D { "mhpmevent3h",    sscofpmf,  read_mhpmeve=
nth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT4H]    =3D { "mhpmevent4h",    sscofpmf,  read_mhpmeve=
nth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT5H]    =3D { "mhpmevent5h",    sscofpmf,  read_mhpmeve=
nth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT6H]    =3D { "mhpmevent6h",    sscofpmf,  read_mhpmeve=
nth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT7H]    =3D { "mhpmevent7h",    sscofpmf,  read_mhpmeve=
nth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT8H]    =3D { "mhpmevent8h",    sscofpmf,  read_mhpmeve=
nth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT9H]    =3D { "mhpmevent9h",    sscofpmf,  read_mhpmeve=
nth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT10H]   =3D { "mhpmevent10h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT11H]   =3D { "mhpmevent11h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT12H]   =3D { "mhpmevent12h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT13H]   =3D { "mhpmevent13h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT14H]   =3D { "mhpmevent14h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT15H]   =3D { "mhpmevent15h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT16H]   =3D { "mhpmevent16h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT17H]   =3D { "mhpmevent17h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT18H]   =3D { "mhpmevent18h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT19H]   =3D { "mhpmevent19h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT20H]   =3D { "mhpmevent20h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT21H]   =3D { "mhpmevent21h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT22H]   =3D { "mhpmevent22h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT23H]   =3D { "mhpmevent23h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT24H]   =3D { "mhpmevent24h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT25H]   =3D { "mhpmevent25h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT26H]   =3D { "mhpmevent26h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT27H]   =3D { "mhpmevent27h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT28H]   =3D { "mhpmevent28h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT29H]   =3D { "mhpmevent29h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT30H]   =3D { "mhpmevent30h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT31H]   =3D { "mhpmevent31h",    sscofpmf,  read_mhpmev=
enth,
> +                                                       write_mhpmeventh}=
,
> +
>      [CSR_HPMCOUNTER3H]   =3D { "hpmcounter3h",   ctr32,  read_hpmcounter=
h },
>      [CSR_HPMCOUNTER4H]   =3D { "hpmcounter4h",   ctr32,  read_hpmcounter=
h },
>      [CSR_HPMCOUNTER5H]   =3D { "hpmcounter5h",   ctr32,  read_hpmcounter=
h },
> @@ -4093,5 +4238,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>                                                         write_mhpmcounter=
h },
>      [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", mctr32,  read_hpmcounte=
rh,
>                                                         write_mhpmcounter=
h },
> +    [CSR_SCOUNTOVF]      =3D { "scountovf", sscofpmf,  read_scountovf },
> +
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index dc182ca81119..33ef9b8e9908 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -355,6 +355,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>          VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU, RV_MAX_MHPMCOUNTERS=
, 0,
>                               vmstate_pmu_ctr_state, PMUCTRState),
>          VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU, RV_MAX_MHPMEVE=
NTS),
> +        VMSTATE_UINTTL_ARRAY(env.mhpmeventh_val, RISCVCPU, RV_MAX_MHPMEV=
ENTS),
>          VMSTATE_UINTTL(env.sscratch, RISCVCPU),
>          VMSTATE_UINTTL(env.mscratch, RISCVCPU),
>          VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 000fe8da45ef..34096941c0ce 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -19,14 +19,367 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "pmu.h"
> +#include "sysemu/cpu-timers.h"
> +
> +#define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
> +#define MAKE_32BIT_MASK(shift, length) \
> +        (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
> +
> +static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
> +{
> +    if (ctr_idx < 3 || ctr_idx >=3D RV_MAX_MHPMCOUNTERS ||
> +        !(cpu->pmu_avail_ctrs & BIT(ctr_idx))) {
> +        return false;
> +    } else {
> +        return true;
> +    }
> +}
> +
> +static bool riscv_pmu_counter_enabled(RISCVCPU *cpu, uint32_t ctr_idx)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +
> +    if (riscv_pmu_counter_valid(cpu, ctr_idx) &&
> +        !get_field(env->mcountinhibit, BIT(ctr_idx))) {
> +        return true;
> +    } else {
> +        return false;
> +    }
> +}
> +
> +static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    target_ulong max_val =3D UINT32_MAX;
> +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> +    bool virt_on =3D riscv_cpu_virt_enabled(env);
> +
> +    /* Privilege mode filtering */
> +    if ((env->priv =3D=3D PRV_M &&
> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_MINH)) ||
> +        (env->priv =3D=3D PRV_S && virt_on &&
> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_VSINH)) ||
> +        (env->priv =3D=3D PRV_U && virt_on &&
> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_VUINH)) ||
> +        (env->priv =3D=3D PRV_S && !virt_on &&
> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_SINH)) ||
> +        (env->priv =3D=3D PRV_U && !virt_on &&
> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_UINH))) {
> +        return 0;
> +    }
> +
> +    /* Handle the overflow scenario */
> +    if (counter->mhpmcounter_val =3D=3D max_val) {
> +        if (counter->mhpmcounterh_val =3D=3D max_val) {
> +            counter->mhpmcounter_val =3D 0;
> +            counter->mhpmcounterh_val =3D 0;
> +            /* Generate interrupt only if OF bit is clear */
> +            if (!(env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_OF)) {
> +                env->mhpmeventh_val[ctr_idx] |=3D MHPMEVENTH_BIT_OF;
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
> +    CPURISCVState *env =3D &cpu->env;
> +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> +    uint64_t max_val =3D UINT64_MAX;
> +    bool virt_on =3D riscv_cpu_virt_enabled(env);
> +
> +    /* Privilege mode filtering */
> +    if ((env->priv =3D=3D PRV_M &&
> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_MINH)) ||
> +        (env->priv =3D=3D PRV_S && virt_on &&
> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_VSINH)) ||
> +        (env->priv =3D=3D PRV_U && virt_on &&
> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_VUINH)) ||
> +        (env->priv =3D=3D PRV_S && !virt_on &&
> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_SINH)) ||
> +        (env->priv =3D=3D PRV_U && !virt_on &&
> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_UINH))) {
> +        return 0;
> +    }
> +
> +    /* Handle the overflow scenario */
> +    if (counter->mhpmcounter_val =3D=3D max_val) {
> +        counter->mhpmcounter_val =3D 0;
> +        /* Generate interrupt only if OF bit is clear */
> +        if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
> +            env->mhpmevent_val[ctr_idx] |=3D MHPMEVENT_BIT_OF;
> +            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> +        }
> +    } else {
> +        counter->mhpmcounter_val++;
> +    }
> +    return 0;
> +}
> +
> +int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx=
)
> +{
> +    uint32_t ctr_idx;
> +    int ret;
> +    CPURISCVState *env =3D &cpu->env;
> +    gpointer value;
> +
> +    value =3D g_hash_table_lookup(cpu->pmu_event_ctr_map,
> +                                GUINT_TO_POINTER(event_idx));
> +    if (!value) {
> +        return -1;
> +    }
> +
> +    ctr_idx =3D GPOINTER_TO_UINT(value);
> +    if (!riscv_pmu_counter_enabled(cpu, ctr_idx) ||
> +        get_field(env->mcountinhibit, BIT(ctr_idx))) {
> +        return -1;
> +    }
> +
> +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> +        ret =3D riscv_pmu_incr_ctr_rv32(cpu, ctr_idx);
> +    } else {
> +        ret =3D riscv_pmu_incr_ctr_rv64(cpu, ctr_idx);
> +    }
> +
> +    return ret;
> +}
>
>  bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
>                                          uint32_t target_ctr)
>  {
> -    return (target_ctr =3D=3D 0) ? true : false;
> +    RISCVCPU *cpu;
> +    uint32_t event_idx;
> +    uint32_t ctr_idx;
> +
> +    /* Fixed instret counter */
> +    if (target_ctr =3D=3D 2) {
> +        return true;
> +    }
> +
> +    cpu =3D RISCV_CPU(env_cpu(env));
> +    event_idx =3D RISCV_PMU_EVENT_HW_INSTRUCTIONS;
> +    ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_=
map,
> +                               GUINT_TO_POINTER(event_idx)));
> +    if (!ctr_idx) {
> +        return false;
> +    }
> +
> +    return target_ctr =3D=3D ctr_idx ? true : false;
>  }
>
>  bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_ct=
r)
>  {
> -    return (target_ctr =3D=3D 2) ? true : false;
> +    RISCVCPU *cpu;
> +    uint32_t event_idx;
> +    uint32_t ctr_idx;
> +
> +    /* Fixed mcycle counter */
> +    if (target_ctr =3D=3D 0) {
> +        return true;
> +    }
> +
> +    cpu =3D RISCV_CPU(env_cpu(env));
> +    event_idx =3D RISCV_PMU_EVENT_HW_CPU_CYCLES;
> +    ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_=
map,
> +                               GUINT_TO_POINTER(event_idx)));
> +
> +    /* Counter zero is not used for event_ctr_map */
> +    if (!ctr_idx) {
> +        return false;
> +    }
> +
> +    return (target_ctr =3D=3D ctr_idx) ? true : false;
> +}
> +
> +static gboolean pmu_remove_event_map(gpointer key, gpointer value,
> +                                     gpointer udata)
> +{
> +    return (GPOINTER_TO_UINT(value) =3D=3D GPOINTER_TO_UINT(udata)) ? tr=
ue : false;
> +}
> +
> +static int64_t pmu_icount_ticks_to_ns(int64_t value)
> +{
> +    int64_t ret =3D 0;
> +
> +    if (icount_enabled()) {
> +        ret =3D icount_to_ns(value);
> +    } else {
> +        ret =3D (NANOSECONDS_PER_SECOND / RISCV_TIMEBASE_FREQ) * value;
> +    }
> +
> +    return ret;
> +}
> +
> +int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> +                               uint32_t ctr_idx)
> +{
> +    uint32_t event_idx;
> +    RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));
> +
> +    if (!riscv_pmu_counter_valid(cpu, ctr_idx)) {
> +        return -1;
> +    }
> +
> +    /**
> +     * Expected mhpmevent value is zero for reset case. Remove the curre=
nt
> +     * mapping.
> +     */
> +    if (!value) {
> +        g_hash_table_foreach_remove(cpu->pmu_event_ctr_map,
> +                                    pmu_remove_event_map,
> +                                    GUINT_TO_POINTER(ctr_idx));
> +        return 0;
> +    }
> +
> +    event_idx =3D value & MHPMEVENT_IDX_MASK;
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
> +    g_hash_table_insert(cpu->pmu_event_ctr_map, GUINT_TO_POINTER(event_i=
dx),
> +                        GUINT_TO_POINTER(ctr_idx));
> +
> +    return 0;
> +}
> +
> +static void pmu_timer_trigger_irq(RISCVCPU *cpu,
> +                                  enum riscv_pmu_event_idx evt_idx)
> +{
> +    uint32_t ctr_idx;
> +    CPURISCVState *env =3D &cpu->env;
> +    PMUCTRState *counter;
> +    target_ulong *mhpmevent_val;
> +    uint64_t of_bit_mask;
> +    int64_t irq_trigger_at;
> +
> +    if (evt_idx !=3D RISCV_PMU_EVENT_HW_CPU_CYCLES &&
> +        evt_idx !=3D RISCV_PMU_EVENT_HW_INSTRUCTIONS) {
> +        return;
> +    }
> +
> +    ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_=
map,
> +                               GUINT_TO_POINTER(evt_idx)));
> +    if (!riscv_pmu_counter_enabled(cpu, ctr_idx)) {
> +        return;
> +    }
> +
> +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> +        mhpmevent_val =3D &env->mhpmeventh_val[ctr_idx];
> +        of_bit_mask =3D MHPMEVENTH_BIT_OF;
> +     } else {
> +        mhpmevent_val =3D &env->mhpmevent_val[ctr_idx];
> +        of_bit_mask =3D MHPMEVENT_BIT_OF;
> +    }
> +
> +    counter =3D &env->pmu_ctrs[ctr_idx];
> +    if (counter->irq_overflow_left > 0) {
> +        irq_trigger_at =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> +                        counter->irq_overflow_left;
> +        timer_mod_anticipate_ns(cpu->pmu_timer, irq_trigger_at);
> +        counter->irq_overflow_left =3D 0;
> +        return;
> +    }
> +
> +    if (cpu->pmu_avail_ctrs & BIT(ctr_idx)) {
> +        /* Generate interrupt only if OF bit is clear */
> +        if (!(*mhpmevent_val & of_bit_mask)) {
> +            *mhpmevent_val |=3D of_bit_mask;
> +            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> +        }
> +    }
> +}
> +
> +/* Timer callback for instret and cycle counter overflow */
> +void riscv_pmu_timer_cb(void *priv)
> +{
> +    RISCVCPU *cpu =3D priv;
> +
> +    /* Timer event was triggered only for these events */
> +    pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_CPU_CYCLES);
> +    pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_INSTRUCTIONS);
> +}
> +
> +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t c=
tr_idx)
> +{
> +    uint64_t overflow_delta, overflow_at;
> +    int64_t overflow_ns, overflow_left =3D 0;
> +    RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));
> +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> +
> +    if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->cfg.ext_sscofpmf=
) {
> +        return -1;
> +    }
> +
> +    if (value) {
> +        overflow_delta =3D UINT64_MAX - value + 1;
> +    } else {
> +        overflow_delta =3D UINT64_MAX;
> +    }
> +
> +    /**
> +     * QEMU supports only int64_t timers while RISC-V counters are uint6=
4_t.
> +     * Compute the leftover and save it so that it can be reprogrammed a=
gain
> +     * when timer expires.
> +     */
> +    if (overflow_delta > INT64_MAX) {
> +        overflow_left =3D overflow_delta - INT64_MAX;
> +    }
> +
> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> +        overflow_ns =3D pmu_icount_ticks_to_ns((int64_t)overflow_delta);
> +        overflow_left =3D pmu_icount_ticks_to_ns(overflow_left) ;
> +    } else {
> +        return -1;
> +    }
> +    overflow_at =3D (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ov=
erflow_ns;
> +
> +    if (overflow_at > INT64_MAX) {
> +        overflow_left +=3D overflow_at - INT64_MAX;
> +        counter->irq_overflow_left =3D overflow_left;
> +        overflow_at =3D INT64_MAX;
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
> +    cpu->pmu_event_ctr_map =3D g_hash_table_new(g_direct_hash, g_direct_=
equal);
> +    if (!cpu->pmu_event_ctr_map) {
> +        /* PMU support can not be enabled */
> +        qemu_log_mask(LOG_UNIMP, "PMU events can't be supported\n");
> +        cpu->cfg.pmu_num =3D 0;
> +        return -1;
> +    }
> +
> +    /* Create a bitmask of available programmable counters */
> +    cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, num_counters);
> +
> +    return 0;
>  }
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 58a5bc3a4089..036653627f78 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -26,3 +26,10 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState =
*env,
>                                          uint32_t target_ctr);
>  bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
>                                    uint32_t target_ctr);
> +void riscv_pmu_timer_cb(void *priv);
> +int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
> +int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> +                               uint32_t ctr_idx);
> +int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx=
);
> +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
> +                          uint32_t ctr_idx);

