Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n1hlM-0003aR-Ex
	for mharc-qemu-riscv@gnu.org; Sun, 26 Dec 2021 23:37:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n1hlG-0003Zt-Bw
 for qemu-riscv@nongnu.org; Sun, 26 Dec 2021 23:37:26 -0500
Received: from [2607:f8b0:4864:20::534] (port=44012
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n1hlB-0006OE-9E
 for qemu-riscv@nongnu.org; Sun, 26 Dec 2021 23:37:25 -0500
Received: by mail-pg1-x534.google.com with SMTP id 8so12635295pgc.10
 for <qemu-riscv@nongnu.org>; Sun, 26 Dec 2021 20:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EWG1HMElz7zSM9aD9o5gIjy9I2JdGSO/TbnPX1FL7jM=;
 b=FIiTXcTC9Rhbn2Z5hDpMPUdAQIgtY3ftUsDVBmEWntoNmx/dIkFgyhp+wkI/PTXAuy
 CEa41J1NPfgvcgs61iFOFnIcqk2wmwkB3jAiuJKkHpG9mfhaGYSZoevkHCJT00pXKizk
 Fj8+l25Ybl2SqKKWWrKTVqJZtURENlajr/+cseq7uykqeXdivhNPem7eyMqrpAwhfqct
 Bm1eS2P4wsIkkboXm8ka0Eihed5mUsEUGR5eWdGmxtWgiGd7EduMvwMdK7jol3MEb6tU
 Ed03EU6iUEWNDbDUMAvT0/RdkMNQVhs9lwBhz6GEqTeFs3+xK99u4qF4ktHo1NZ9Qn3D
 g4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EWG1HMElz7zSM9aD9o5gIjy9I2JdGSO/TbnPX1FL7jM=;
 b=QAMBvfCLBf4MYA5wpm6IXIBfGaIuszeY/hO69rUAhdFIJGXEE68xyZGum7gB6xbI5v
 dk7rAR5V2foU0o6XVewichA0XHXWJAfaeoSA3ykOZn9kChi1hm33HrUa+D/aGvjY3l+T
 O5XHr4EyYUGBY7AK5o0WeoAig45WUr2sFr1ud6t7dWJC7BRD/lfGVOq0iD9VlA5yZueF
 psHtLC04YH217DRVoBDroqfoTbRvGIux8XAZ6K6ajZoEhpMuFkH4f7Mvsr83KH4RkQ6I
 R5Gp7GdwidOTpjDFc4nM7x3nci0hh9TP5QB6k+616QVgaHOykedIKFfRxySClmE1UQH6
 PUMA==
X-Gm-Message-State: AOAM5333KYNEINLcpszzMozzyynCnvNkCsbvMmSOd3OVckMjDp0CH0CO
 +mHn4zmJATerhlDI/L0aBCrYTE5tgUP2NA==
X-Google-Smtp-Source: ABdhPJwStoWh+Dr7XSzdtdfBiyPupfxOLumxt4xpoVbRGBJOqATnSBqyaIJL2RPLO58BXrYSAH6aVg==
X-Received: by 2002:a05:6a00:114d:b0:4a2:89e6:659e with SMTP id
 b13-20020a056a00114d00b004a289e6659emr16158939pfm.38.1640579839096; 
 Sun, 26 Dec 2021 20:37:19 -0800 (PST)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com.
 [209.85.210.181])
 by smtp.gmail.com with ESMTPSA id t136sm15225939pfc.124.2021.12.26.20.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Dec 2021 20:37:18 -0800 (PST)
Received: by mail-pf1-f181.google.com with SMTP id 196so12714559pfw.10;
 Sun, 26 Dec 2021 20:37:18 -0800 (PST)
X-Received: by 2002:a63:b60e:: with SMTP id j14mr14170650pgf.554.1640579837744; 
 Sun, 26 Dec 2021 20:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-9-atish.patra@wdc.com>
In-Reply-To: <20211025195601.245631-9-atish.patra@wdc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 27 Dec 2021 12:37:06 +0800
X-Gmail-Original-Message-ID: <CANzO1D0UrRUPAvenNWaL_KpYxDZH9qsNXznCOD7A0uowtC2cSQ@mail.gmail.com>
Message-ID: <CANzO1D0UrRUPAvenNWaL_KpYxDZH9qsNXznCOD7A0uowtC2cSQ@mail.gmail.com>
Subject: Re: [ PATCH v3 08/10] target/riscv: Add sscofpmf extension support
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000745cc605d4194234"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
X-List-Received-Date: Mon, 27 Dec 2021 04:37:26 -0000

--000000000000745cc605d4194234
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Atish Patra <atish.patra@wdc.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=883:57=E5=AF=AB=E9=81=93=EF=BC=9A

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
> ---
>  target/riscv/cpu.c      |  12 ++
>  target/riscv/cpu.h      |  25 +++
>  target/riscv/cpu_bits.h |  55 +++++++
>  target/riscv/csr.c      | 150 +++++++++++++++++-
>  target/riscv/machine.c  |   2 +-
>  target/riscv/pmu.c      | 343 +++++++++++++++++++++++++++++++++++++++-
>  target/riscv/pmu.h      |   9 ++
>  7 files changed, 589 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index aec94101a4c0..757c646037bb 100644
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
> @@ -535,6 +536,16 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r
> **errp)
>          set_misa(env, target_misa);
>      }
>
> +    if (cpu->cfg.pmu_num) {
> +        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscof=
)
> {
> +            cpu->pmu_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> +                                          riscv_pmu_timer_cb, cpu);
> +            if (!cpu->pmu_timer) {
> +                cpu->cfg.ext_sscof =3D false;
> +            }
> +        }
> +     }
> +
>      riscv_cpu_register_gdb_regs_for_features(cs);
>
>      qemu_init_vcpu(cs);
> @@ -599,6 +610,7 @@ static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> +    DEFINE_PROP_BOOL("sscof", RISCVCPU, cfg.ext_sscof, false),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index da34614ad788..b66d8acff109 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -123,6 +123,8 @@ struct PMUCTRState {
>      /* Snapshort value of a counter in RV32 */
>      target_ulong mhpmcounterh_prev;
>      bool started;
> +    /* Value beyond UINT32_MAX/UINT64_MAX before overflow interrupt
> trigger */
> +    target_ulong irq_overflow_left;
>  };
>
>  struct CPURISCVState {
> @@ -241,6 +243,9 @@ struct CPURISCVState {
>      /* PMU event selector configured values. First three are unused*/
>      target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
>
> +    /* PMU event selector configured values for RV32*/
> +    target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];
> +
>      target_ulong sscratch;
>      target_ulong mscratch;
>
> @@ -320,6 +325,7 @@ struct RISCVCPU {
>          bool ext_zbs;
>          bool ext_ifencei;
>          bool ext_icsr;
> +        bool ext_sscof;
>
>          uint8_t pmu_num;
>          char *priv_spec;
> @@ -333,6 +339,12 @@ struct RISCVCPU {
>          bool epmp;
>          uint64_t resetvec;
>      } cfg;
> +
> +    QEMUTimer *pmu_timer;
> +    /* A bitmask of Available programmable counters */
> +    uint32_t pmu_avail_ctrs;
> +    /* Mapping of events to counters */
> +    GHashTable *pmu_event_ctr_map;
>  };
>
>  static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
> @@ -528,6 +540,19 @@ enum {
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
> index 72b1485e621f..cd6523c1c6ee 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -308,6 +308,37 @@
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
> @@ -338,6 +369,8 @@
>  #define CSR_MHPMCOUNTER30H  0xb9e
>  #define CSR_MHPMCOUNTER31H  0xb9f
>
> +#define CSR_SCOUNTOVF       0xda0
> +
>  /* mstatus CSR bits */
>  #define MSTATUS_UIE         0x00000001
>  #define MSTATUS_SIE         0x00000002
> @@ -508,6 +541,7 @@ typedef enum RISCVException {
>  #define IRQ_S_EXT                          9
>  #define IRQ_VS_EXT                         10
>  #define IRQ_M_EXT                          11
> +#define IRQ_PMU_OVF                        13
>
>  /* mip masks */
>  #define MIP_USIP                           (1 << IRQ_U_SOFT)
> @@ -522,11 +556,13 @@ typedef enum RISCVException {
>  #define MIP_SEIP                           (1 << IRQ_S_EXT)
>  #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
>  #define MIP_MEIP                           (1 << IRQ_M_EXT)
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
> @@ -535,4 +571,23 @@ typedef enum RISCVException {
>  #define MIE_UTIE                           (1 << IRQ_U_TIMER)
>  #define MIE_SSIE                           (1 << IRQ_S_SOFT)
>  #define MIE_USIE                           (1 << IRQ_U_SOFT)
> +#define MIE_LCOFIE                         (1 << IRQ_PMU_OVF)
> +
> +#define MHPMEVENT_BIT_OF                   BIT(63)
> +#define MHPMEVENTH_BIT_OF                  BIT(31)
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
> index 1ce1bb0868d7..6a1580c4b6ce 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -89,6 +89,19 @@ static RISCVException mctr32(CPURISCVState *env, int
> csrno)
>      return mctr(env, csrno);
>  }
>
> +static RISCVException sscof(CPURISCVState *env, int csrno)
> +{
> + #if !defined(CONFIG_USER_ONLY)
> +    CPUState *cs =3D env_cpu(env);
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_sscof) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +#endif
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static RISCVException ctr(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> @@ -104,11 +117,18 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
>      }
>      ctr_index =3D csrno - base_csrno;
>
> -    if (!cpu->cfg.pmu_num || ctr_index >=3D (cpu->cfg.pmu_num + 3)) {
> +    if ((csrno >=3D CSR_CYCLE && csrno <=3D CSR_INSTRET) ||
> +        (csrno >=3D CSR_CYCLEH && csrno <=3D CSR_INSTRETH)) {
> +        goto skip_ext_pmu_check;
> +    }
> +
> +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) =
{
>          /* The PMU is not enabled or counter is out of range */
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> +skip_ext_pmu_check:
> +
>      if (env->priv =3D=3D PRV_S) {
>          switch (csrno) {
>          case CSR_CYCLE:
> @@ -424,7 +444,7 @@ static RISCVException write_vstart(CPURISCVState *env=
,
> int csrno,
>  }
>
>  /* User Timers and Counters */
> -static target_ulong get_icount_ticks(bool brv32)
> +target_ulong get_icount_ticks(bool brv32)
>  {
>      int64_t val;
>      target_ulong result;
> @@ -461,11 +481,36 @@ static int write_mhpmevent(CPURISCVState *env, int
> csrno, target_ulong val)
>  {
>      int evt_index =3D csrno - CSR_MCOUNTINHIBIT;
>
> +    if (!riscv_cpu_is_32bit(env)) {
> +        riscv_pmu_update_event_map(env, val, evt_index);
> +    }
>      env->mhpmevent_val[evt_index] =3D val;
>
>      return RISCV_EXCP_NONE;
>  }
>
> +static int read_mhpmeventh(CPURISCVState *env, int csrno, target_ulong
> *val)
> +{
> +    int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;
> +
> +    *val =3D env->mhpmevent_val[evt_index];
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mhpmeventh(CPURISCVState *env, int csrno, target_ulong
> val)
> +{
> +    int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;
> +    uint64_t mhpmevth_val =3D val;
> +    uint64_t mhpmevt_val =3D env->mhpmevent_val[evt_index];
> +
> +    mhpmevt_val =3D mhpmevt_val | (mhpmevth_val << 32);
> +    riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
> +    env->mhpmeventh_val[evt_index] =3D val;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>  static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulong
> val)
>  {
>      int ctr_idx =3D csrno - CSR_MCYCLE;
> @@ -475,6 +520,9 @@ static int write_mhpmcounter(CPURISCVState *env, int
> csrno, target_ulong val)
>      if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>          riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
>          counter->mhpmcounter_prev =3D get_icount_ticks(false);
> +        if (ctr_idx > 2) {
> +            riscv_pmu_setup_timer(env, val, ctr_idx);
> +        }
>       } else {
>          /* Other counters can keep incrementing from the given value */
>          counter->mhpmcounter_prev =3D val;
> @@ -487,11 +535,17 @@ static int write_mhpmcounterh(CPURISCVState *env,
> int csrno, target_ulong val)
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
>          counter->mhpmcounterh_prev =3D get_icount_ticks(false);
> +        if (ctr_idx > 2) {
> +            riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
> +        }
>      } else {
>          counter->mhpmcounterh_prev =3D val;
>      }
> @@ -561,6 +615,32 @@ static int read_hpmcounterh(CPURISCVState *env, int
> csrno, target_ulong *val)
>      return riscv_pmu_read_ctr(env, val, true, ctr_index);
>  }
>
> +static int read_scountovf(CPURISCVState *env, int csrno, target_ulong
> *val)
> +{
> +    int mhpmevt_start =3D CSR_MHPMEVENT3 - CSR_MCOUNTINHIBIT;
> +    int i;
> +    *val =3D 0;
> +    target_ulong *mhpm_evt_val;
> +    uint64_t of_bit_mask;
> +
> +    if (riscv_cpu_is_32bit(env)) {
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
> +    return RISCV_EXCP_NONE;
> +}
> +
>  #if defined(CONFIG_USER_ONLY)
>  static RISCVException read_time(CPURISCVState *env, int csrno,
>                                  target_ulong *val)
> @@ -607,7 +687,7 @@ static RISCVException read_timeh(CPURISCVState *env,
> int csrno,
>  /* Machine constants */
>
>  #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
> -#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
> +#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP | MIP_LCOFIP)
>  #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
>
>  static const target_ulong delegable_ints =3D S_MODE_INTERRUPTS |
> @@ -645,7 +725,8 @@ static const target_ulong vs_delegable_excps =3D
> DELEGABLE_EXCPS &
>  static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE | SSTATUS_S=
PIE
> |
>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
>      SSTATUS_SUM | SSTATUS_MXR;
> -static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP |
> MIP_UEIP;
> +static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP |
> MIP_UEIP |
> +                                              SIP_LCOFIP;
>  static const target_ulong hip_writable_mask =3D MIP_VSSIP;
>  static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTIP |
> MIP_VSEIP;
>  static const target_ulong vsip_writable_mask =3D MIP_VSSIP;
> @@ -2022,6 +2103,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>      [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_mhpmevent,
>                                                         write_mhpmevent }=
,
>
> +    [CSR_MHPMEVENT3H]    =3D { "mhpmevent3h",    sscof,  read_mhpmeventh=
,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT4H]    =3D { "mhpmevent4h",    sscof,  read_mhpmeventh=
,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT5H]    =3D { "mhpmevent5h",    sscof,  read_mhpmeventh=
,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT6H]    =3D { "mhpmevent6h",    sscof,  read_mhpmeventh=
,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT7H]    =3D { "mhpmevent7h",    sscof,  read_mhpmeventh=
,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT8H]    =3D { "mhpmevent8h",    sscof,  read_mhpmeventh=
,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT9H]    =3D { "mhpmevent9h",    sscof,  read_mhpmeventh=
,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT10H]   =3D { "mhpmevent10h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT11H]   =3D { "mhpmevent11h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT12H]   =3D { "mhpmevent12h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT13H]   =3D { "mhpmevent13h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT14H]   =3D { "mhpmevent14h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT15H]   =3D { "mhpmevent15h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT16H]   =3D { "mhpmevent16h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT17H]   =3D { "mhpmevent17h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT18H]   =3D { "mhpmevent18h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT19H]   =3D { "mhpmevent19h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT20H]   =3D { "mhpmevent20h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT21H]   =3D { "mhpmevent21h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT22H]   =3D { "mhpmevent22h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT23H]   =3D { "mhpmevent23h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT24H]   =3D { "mhpmevent24h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT25H]   =3D { "mhpmevent25h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT26H]   =3D { "mhpmevent26h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT27H]   =3D { "mhpmevent27h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT28H]   =3D { "mhpmevent28h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT29H]   =3D { "mhpmevent29h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT30H]   =3D { "mhpmevent30h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +    [CSR_MHPMEVENT31H]   =3D { "mhpmevent31h",    sscof,  read_mhpmevent=
h,
> +                                                       write_mhpmeventh}=
,
> +
>      [CSR_HPMCOUNTER3H]   =3D { "hpmcounter3h",   ctr32,  read_hpmcounter=
h },
>      [CSR_HPMCOUNTER4H]   =3D { "hpmcounter4h",   ctr32,  read_hpmcounter=
h },
>      [CSR_HPMCOUNTER5H]   =3D { "hpmcounter5h",   ctr32,  read_hpmcounter=
h },
> @@ -2110,5 +2250,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>                                                         write_mhpmcounter=
h
> },
>      [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", mctr32,  read_hpmcounte=
rh,
>                                                         write_mhpmcounter=
h
> },
> +    [CSR_SCOUNTOVF]      =3D { "scountovf", sscof,  read_scountovf },
> +
>  #endif /* !CONFIG_USER_ONLY */
>  };
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index e0a489c20e67..7b2ef17904a9 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -88,7 +88,7 @@ static bool pmu_needed(void *opaque)
>  {
>      RISCVCPU *cpu =3D opaque;
>
> -    return cpu->cfg.ext_pmu;
> +    return cpu->cfg.pmu_num;
>  }
>
>  static const VMStateDescription vmstate_vector =3D {
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 000fe8da45ef..25bdbdf48ff7 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -20,13 +20,352 @@
>  #include "cpu.h"
>  #include "pmu.h"
>
> +#define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
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
> +    CPURISCVState *env =3D &cpu->env;
> +    target_ulong max_val =3D UINT32_MAX;
> +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> +
> +    /* Privilege mode filtering */
> +    if ((env->priv =3D=3D PRV_M &&
> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_MINH)) ||
> +        (env->priv =3D=3D PRV_S &&
> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_SINH)) ||
> +        (env->priv =3D=3D PRV_U &&
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
> +
> +    /* Privilege mode filtering */
> +    if ((env->priv =3D=3D PRV_M &&
> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_MINH)) ||
> +        (env->priv =3D=3D PRV_S &&
> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_SINH)) ||
> +        (env->priv =3D=3D PRV_U &&
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
> +    if (riscv_cpu_is_32bit(env)) {
> +        ret =3D riscv_pmu_incr_ctr_rv32(cpu, ctr_idx);
> +    } else {
> +        ret =3D riscv_pmu_incr_ctr_rv64(cpu, ctr_idx);
> +    }
> +
> +    return ret;
> +}
> +
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
ue :
> false;
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
> +    if (riscv_cpu_is_32bit(env)) {
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
> +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t
> ctr_idx)
> +{
> +    uint64_t overflow_delta, overflow_at;
> +    int64_t overflow_ns, overflow_left =3D 0;
> +    RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));
> +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> +
> +    if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->cfg.ext_sscof) {
> +        return -1;
> +    }
> +
> +    if (value) {
> +        overflow_delta =3D UINT64_MAX - value + 1;
> +    } else {
> +        overflow_delta =3D UINT64_MAX - value;
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
> +    overflow_at =3D (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> overflow_ns;
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
> +    cpu->pmu_event_ctr_map =3D g_hash_table_new(g_direct_hash,
> g_direct_equal);
> +    if (!cpu->pmu_event_ctr_map) {
> +        /* PMU support can not be enabled */
> +        qemu_log_mask(LOG_UNIMP, "PMU events can't be supported\n");
> +        cpu->cfg.pmu_num =3D 0;
> +        return -1;
> +    }
> +
> +    /* Create a bitmask of available programmable counters */
> +    cpu->pmu_avail_ctrs =3D ~(-1 << (num_counters + 3)) & ~(0x07);
>

Hi Atish,

cpu->pmu_avail_ctrs mask would becomes 0x0 if num_counters equals to 29.
Perhaps it can be fixed with:
cpu->pmu_avail_ctrs =3D MAKE_64BIT_MASK(3, num_counters);
or some other similar techniques.

Regards,
Frank Chang


> +    return 0;
>  }
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 58a5bc3a4089..af78da92e820 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -26,3 +26,12 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState
> *env,
>                                          uint32_t target_ctr);
>  bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
>                                    uint32_t target_ctr);
> +void riscv_pmu_timer_cb(void *priv);
> +int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
> +int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> +                               uint32_t ctr_idx);
> +int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx=
);
> +void riscv_pmu_generate_fdt_node(void *fdt, char *pmu_name);
> +target_ulong get_icount_ticks(bool brv32);
> +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
> +                          uint32_t ctr_idx);
> --
> 2.31.1
>
>
>

--000000000000745cc605d4194234
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Atish Patra &lt;<a href=3D"mailto:atish.p=
atra@wdc.com" target=3D"_blank">atish.patra@wdc.com</a>&gt; =E6=96=BC 2021=
=E5=B9=B410=E6=9C=8826=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=883:57=
=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">The Sscofpmf (&#39;Ss&#39; for Privi=
leged arch and Supervisor-level extensions,<br>
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
---<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 ++<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 +++<br>
=C2=A0target/riscv/cpu_bits.h |=C2=A0 55 +++++++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 150 +++++++++++++++++-<br>
=C2=A0target/riscv/machine.c=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0target/riscv/pmu.c=C2=A0 =C2=A0 =C2=A0 | 343 ++++++++++++++++++++++++=
+++++++++++++++-<br>
=C2=A0target/riscv/pmu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 ++<br>
=C2=A07 files changed, 589 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index aec94101a4c0..757c646037bb 100644<br>
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
@@ -535,6 +536,16 @@ static void riscv_cpu_realize(DeviceState *dev, Error =
**errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_misa(env, target_misa);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 if (cpu-&gt;cfg.pmu_num) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!riscv_pmu_init(cpu, cpu-&gt;cfg.pmu_num) =
&amp;&amp; cpu-&gt;cfg.ext_sscof) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;pmu_timer =3D timer_new_=
ns(QEMU_CLOCK_VIRTUAL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r=
iscv_pmu_timer_cb, cpu);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cpu-&gt;pmu_timer) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.ext_ss=
cof =3D false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0riscv_cpu_register_gdb_regs_for_features(cs);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_vcpu(cs);<br>
@@ -599,6 +610,7 @@ static Property riscv_cpu_properties[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-h&quot;, RISCVCPU, cfg.ext_h, =
false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;x-v&quot;, RISCVCPU, cfg.ext_v, =
false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT8(&quot;pmu-num&quot;, RISCVCPU, cfg.pm=
u_num, 16),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;sscof&quot;, RISCVCPU, cfg.ext_sscof,=
 false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCVCPU, cfg.ex=
t_ifencei, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU, cfg.ext_i=
csr, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_STRING(&quot;priv_spec&quot;, RISCVCPU, cfg=
.priv_spec),<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index da34614ad788..b66d8acff109 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -123,6 +123,8 @@ struct PMUCTRState {<br>
=C2=A0 =C2=A0 =C2=A0/* Snapshort value of a counter in RV32 */<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mhpmcounterh_prev;<br>
=C2=A0 =C2=A0 =C2=A0bool started;<br>
+=C2=A0 =C2=A0 /* Value beyond UINT32_MAX/UINT64_MAX before overflow interr=
upt trigger */<br>
+=C2=A0 =C2=A0 target_ulong irq_overflow_left;<br>
=C2=A0};<br>
<br>
=C2=A0struct CPURISCVState {<br>
@@ -241,6 +243,9 @@ struct CPURISCVState {<br>
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
@@ -320,6 +325,7 @@ struct RISCVCPU {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_zbs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_ifencei;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_icsr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool ext_sscof;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t pmu_num;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *priv_spec;<br>
@@ -333,6 +339,12 @@ struct RISCVCPU {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool epmp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t resetvec;<br>
=C2=A0 =C2=A0 =C2=A0} cfg;<br>
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
@@ -528,6 +540,19 @@ enum {<br>
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
index 72b1485e621f..cd6523c1c6ee 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -308,6 +308,37 @@<br>
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
@@ -338,6 +369,8 @@<br>
=C2=A0#define CSR_MHPMCOUNTER30H=C2=A0 0xb9e<br>
=C2=A0#define CSR_MHPMCOUNTER31H=C2=A0 0xb9f<br>
<br>
+#define CSR_SCOUNTOVF=C2=A0 =C2=A0 =C2=A0 =C2=A00xda0<br>
+<br>
=C2=A0/* mstatus CSR bits */<br>
=C2=A0#define MSTATUS_UIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000001<br>
=C2=A0#define MSTATUS_SIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000002<br>
@@ -508,6 +541,7 @@ typedef enum RISCVException {<br>
=C2=A0#define IRQ_S_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9<br>
=C2=A0#define IRQ_VS_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010<br>
=C2=A0#define IRQ_M_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11<br>
+#define IRQ_PMU_OVF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 13<br>
<br>
=C2=A0/* mip masks */<br>
=C2=A0#define MIP_USIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_U_SOFT)<br>
@@ -522,11 +556,13 @@ typedef enum RISCVException {<br>
=C2=A0#define MIP_SEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_S_EXT)<br>
=C2=A0#define MIP_VSEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; IRQ_VS_EXT)<br>
=C2=A0#define MIP_MEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_M_EXT)<br>
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
@@ -535,4 +571,23 @@ typedef enum RISCVException {<br>
=C2=A0#define MIE_UTIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_U_TIMER)<br>
=C2=A0#define MIE_SSIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_S_SOFT)<br>
=C2=A0#define MIE_USIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_U_SOFT)<br>
+#define MIE_LCOFIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_PMU_OVF)<br>
+<br>
+#define MHPMEVENT_BIT_OF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0BIT(63)<br>
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
index 1ce1bb0868d7..6a1580c4b6ce 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -89,6 +89,19 @@ static RISCVException mctr32(CPURISCVState *env, int csr=
no)<br>
=C2=A0 =C2=A0 =C2=A0return mctr(env, csrno);<br>
=C2=A0}<br>
<br>
+static RISCVException sscof(CPURISCVState *env, int csrno)<br>
+{<br>
+ #if !defined(CONFIG_USER_ONLY)<br>
+=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
+=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
+<br>
+=C2=A0 =C2=A0 if (!cpu-&gt;cfg.ext_sscof) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
+=C2=A0 =C2=A0 }<br>
+#endif<br>
+=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
+}<br>
+<br>
=C2=A0static RISCVException ctr(CPURISCVState *env, int csrno)<br>
=C2=A0{<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
@@ -104,11 +117,18 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0ctr_index =3D csrno - base_csrno;<br>
<br>
-=C2=A0 =C2=A0 if (!cpu-&gt;cfg.pmu_num || ctr_index &gt;=3D (cpu-&gt;cfg.p=
mu_num + 3)) {<br>
+=C2=A0 =C2=A0 if ((csrno &gt;=3D CSR_CYCLE &amp;&amp; csrno &lt;=3D CSR_IN=
STRET) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (csrno &gt;=3D CSR_CYCLEH &amp;&amp; csrno &lt=
;=3D CSR_INSTRETH)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto skip_ext_pmu_check;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if ((!cpu-&gt;cfg.pmu_num || !(cpu-&gt;pmu_avail_ctrs &amp; =
BIT(ctr_index)))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The PMU is not enabled or counter is o=
ut of range */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+skip_ext_pmu_check:<br>
+<br>
=C2=A0 =C2=A0 =C2=A0if (env-&gt;priv =3D=3D PRV_S) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (csrno) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CSR_CYCLE:<br>
@@ -424,7 +444,7 @@ static RISCVException write_vstart(CPURISCVState *env, =
int csrno,<br>
=C2=A0}<br>
<br>
=C2=A0/* User Timers and Counters */<br>
-static target_ulong get_icount_ticks(bool brv32)<br>
+target_ulong get_icount_ticks(bool brv32)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int64_t val;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong result;<br>
@@ -461,11 +481,36 @@ static int write_mhpmevent(CPURISCVState *env, int cs=
rno, target_ulong val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int evt_index =3D csrno - CSR_MCOUNTINHIBIT;<br>
<br>
+=C2=A0 =C2=A0 if (!riscv_cpu_is_32bit(env)) {<br>
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
@@ -475,6 +520,9 @@ static int write_mhpmcounter(CPURISCVState *env, int cs=
rno, target_ulong val)<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_pmu_ctr_monitor_instructions(env, c=
tr_idx)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounter_prev =3D get_icou=
nt_ticks(false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctr_idx &gt; 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_setup_timer(env, val, =
ctr_idx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Other counters can keep incrementing f=
rom the given value */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounter_prev =3D val;<br>
@@ -487,11 +535,17 @@ static int write_mhpmcounterh(CPURISCVState *env, int=
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounterh_prev =3D get_ico=
unt_ticks(false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctr_idx &gt; 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_setup_timer(env, mhpmc=
tr_val, ctr_idx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounterh_prev =3D val;<br=
>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -561,6 +615,32 @@ static int read_hpmcounterh(CPURISCVState *env, int cs=
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
+=C2=A0 =C2=A0 if (riscv_cpu_is_32bit(env)) {<br>
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
@@ -607,7 +687,7 @@ static RISCVException read_timeh(CPURISCVState *env, in=
t csrno,<br>
=C2=A0/* Machine constants */<br>
<br>
=C2=A0#define M_MODE_INTERRUPTS=C2=A0 (MIP_MSIP | MIP_MTIP | MIP_MEIP)<br>
-#define S_MODE_INTERRUPTS=C2=A0 (MIP_SSIP | MIP_STIP | MIP_SEIP)<br>
+#define S_MODE_INTERRUPTS=C2=A0 (MIP_SSIP | MIP_STIP | MIP_SEIP | MIP_LCOF=
IP)<br>
=C2=A0#define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)<br>
<br>
=C2=A0static const target_ulong delegable_ints =3D S_MODE_INTERRUPTS |<br>
@@ -645,7 +725,8 @@ static const target_ulong vs_delegable_excps =3D DELEGA=
BLE_EXCPS &amp;<br>
=C2=A0static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE | SSTATU=
S_SPIE |<br>
=C2=A0 =C2=A0 =C2=A0SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS |=
 SSTATUS_XS |<br>
=C2=A0 =C2=A0 =C2=A0SSTATUS_SUM | SSTATUS_MXR;<br>
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
@@ -2022,6 +2103,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0[CSR_MHPMEVENT31]=C2=A0 =C2=A0 =3D { &quot;mhpmevent31&=
quot;,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0 read_mhpmevent,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_mhpmevent },<br>
<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT3H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent3h&quot;=
,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT4H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent4h&quot;=
,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT5H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent5h&quot;=
,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT6H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent6h&quot;=
,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT7H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent7h&quot;=
,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT8H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent8h&quot;=
,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT9H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent9h&quot;=
,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT10H]=C2=A0 =C2=A0=3D { &quot;mhpmevent10h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT11H]=C2=A0 =C2=A0=3D { &quot;mhpmevent11h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT12H]=C2=A0 =C2=A0=3D { &quot;mhpmevent12h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT13H]=C2=A0 =C2=A0=3D { &quot;mhpmevent13h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT14H]=C2=A0 =C2=A0=3D { &quot;mhpmevent14h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT15H]=C2=A0 =C2=A0=3D { &quot;mhpmevent15h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT16H]=C2=A0 =C2=A0=3D { &quot;mhpmevent16h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT17H]=C2=A0 =C2=A0=3D { &quot;mhpmevent17h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT18H]=C2=A0 =C2=A0=3D { &quot;mhpmevent18h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT19H]=C2=A0 =C2=A0=3D { &quot;mhpmevent19h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT20H]=C2=A0 =C2=A0=3D { &quot;mhpmevent20h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT21H]=C2=A0 =C2=A0=3D { &quot;mhpmevent21h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT22H]=C2=A0 =C2=A0=3D { &quot;mhpmevent22h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT23H]=C2=A0 =C2=A0=3D { &quot;mhpmevent23h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT24H]=C2=A0 =C2=A0=3D { &quot;mhpmevent24h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT25H]=C2=A0 =C2=A0=3D { &quot;mhpmevent25h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT26H]=C2=A0 =C2=A0=3D { &quot;mhpmevent26h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT27H]=C2=A0 =C2=A0=3D { &quot;mhpmevent27h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT28H]=C2=A0 =C2=A0=3D { &quot;mhpmevent28h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT29H]=C2=A0 =C2=A0=3D { &quot;mhpmevent29h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT30H]=C2=A0 =C2=A0=3D { &quot;mhpmevent30h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
+=C2=A0 =C2=A0 [CSR_MHPMEVENT31H]=C2=A0 =C2=A0=3D { &quot;mhpmevent31h&quot=
;,=C2=A0 =C2=A0 sscof,=C2=A0 read_mhpmeventh,<br>
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
@@ -2110,5 +2250,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {<br=
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
ot;, sscof,=C2=A0 read_scountovf },<br>
+<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
=C2=A0};<br>
diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
index e0a489c20e67..7b2ef17904a9 100644<br>
--- a/target/riscv/machine.c<br>
+++ b/target/riscv/machine.c<br>
@@ -88,7 +88,7 @@ static bool pmu_needed(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D opaque;<br>
<br>
-=C2=A0 =C2=A0 return cpu-&gt;cfg.ext_pmu;<br>
+=C2=A0 =C2=A0 return cpu-&gt;cfg.pmu_num;<br>
=C2=A0}<br>
<br>
=C2=A0static const VMStateDescription vmstate_vector =3D {<br>
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c<br>
index 000fe8da45ef..25bdbdf48ff7 100644<br>
--- a/target/riscv/pmu.c<br>
+++ b/target/riscv/pmu.c<br>
@@ -20,13 +20,352 @@<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;pmu.h&quot;<br>
<br>
+#define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */<br>
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
+=C2=A0 =C2=A0 if (riscv_cpu_is_32bit(env)) {<br>
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
+=C2=A0 =C2=A0 if (riscv_cpu_is_32bit(env)) {<br>
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
xt_sscof) {<br>
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
+=C2=A0 =C2=A0 cpu-&gt;pmu_avail_ctrs =3D ~(-1 &lt;&lt; (num_counters + 3))=
 &amp; ~(0x07);<br></blockquote><div><br></div><div>Hi Atish,</div><div><br=
></div><div>cpu-&gt;pmu_avail_ctrs mask would becomes 0x0 if num_counters e=
quals to 29.</div><div>Perhaps it can be fixed with:</div><div>cpu-&gt;pmu_=
avail_ctrs =3D MAKE_64BIT_MASK(3, num_counters);</div><div>or some other si=
milar techniques.</div><div><br></div><div>Regards,</div><div>Frank Chang</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h<br>
index 58a5bc3a4089..af78da92e820 100644<br>
--- a/target/riscv/pmu.h<br>
+++ b/target/riscv/pmu.h<br>
@@ -26,3 +26,12 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *e=
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
+void riscv_pmu_generate_fdt_node(void *fdt, char *pmu_name);<br>
+target_ulong get_icount_ticks(bool brv32);<br>
+int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint32_t ctr_idx);<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000745cc605d4194234--

