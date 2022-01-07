Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5dHw-0004px-PK
	for mharc-qemu-riscv@gnu.org; Thu, 06 Jan 2022 19:39:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1n5dHh-0004nv-Ur
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:39:09 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=46859
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1n5dHe-0000Zm-OA
 for qemu-riscv@nongnu.org; Thu, 06 Jan 2022 19:39:09 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id p5so4993318ybd.13
 for <qemu-riscv@nongnu.org>; Thu, 06 Jan 2022 16:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X1r3HIG2PbDcIawaXR8jvArAw8kh+UMA0Yl1JTdf974=;
 b=Ol9r94r9AlHXw5WZic0/CY3K+a53Suj1A67wEjtOD9ebACM8PxRfp3v0ZbNIINBmYf
 SFSb/ZsHlq8ZK65CU9csECuuk88S+OqPQf1wW5EViKgsoCRN9077jLE6+7gP0VjkuPa0
 fvqhyNUW8Vgta9UNEQQexYUHpoaVUS5MflM48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X1r3HIG2PbDcIawaXR8jvArAw8kh+UMA0Yl1JTdf974=;
 b=wA7j29vng6j7b24wxqc7p/cvmDEXa7i8ZvD4pfD4vt80+ZkZon8z2M08bOJBYgHMJH
 LaVZGvnusUvPO+ntpqlxzVToo11ye7Y19DdvkbvbOjZ1qz8dC1aOH5h7x8HdqMv4xfT7
 lTSetDPoG7MtetasEuNVjg0lVkYM1hYahjZ5PzRZBIr4kAv7hM+hrVC1hlybXk7gaSOB
 Vm7nFO4hR8INo3LPR/T1HFMRVns8ZJU2Gr07Vx4EVkIyNWcFg/BeECU+MaoqzGSHqmnU
 8KKPPecu1TWqo2UXpwHPkGv9AibVPrNbOnPNjbHests1StE9cFxybp+M885rojWHMLuY
 Od3Q==
X-Gm-Message-State: AOAM531KRSnnfrElOgrl+xsrowOmfXocjqMh2j8SN5xfW5JBNp+EYixx
 5Ti4kbSuqTnMnpfLRvP4kpLw4BY0vvB6N5WRgUeAlHm7Q+La
X-Google-Smtp-Source: ABdhPJyHualbebeIn/GS4AsLzAXKaF8Kw9Uf5c0CqLaEHud8o755bH1GBSXjyvECXtboUdpOudEZePhUR7KcfdM7IsE=
X-Received: by 2002:a05:6902:154e:: with SMTP id
 r14mr50792906ybu.494.1641515943425; 
 Thu, 06 Jan 2022 16:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20211025195601.245631-1-atish.patra@wdc.com>
 <20211025195601.245631-9-atish.patra@wdc.com>
 <CANzO1D0UrRUPAvenNWaL_KpYxDZH9qsNXznCOD7A0uowtC2cSQ@mail.gmail.com>
In-Reply-To: <CANzO1D0UrRUPAvenNWaL_KpYxDZH9qsNXznCOD7A0uowtC2cSQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 6 Jan 2022 16:38:52 -0800
Message-ID: <CAOnJCU+TFOQRJcQY-3mTaOMuJBTYZcnDGtUi-=acvjgZWRC0_w@mail.gmail.com>
Subject: Re: [ PATCH v3 08/10] target/riscv: Add sscofpmf extension support
To: Frank Chang <frank.chang@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 07 Jan 2022 00:39:10 -0000

On Sun, Dec 26, 2021 at 8:38 PM Frank Chang <frank.chang@sifive.com> wrote:
>
> Atish Patra <atish.patra@wdc.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=883:57=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> The Sscofpmf ('Ss' for Privileged arch and Supervisor-level extensions,
>> and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
>> extension allows the perf to handle overflow interrupts and filtering
>> support. This patch provides a framework for programmable
>> counters to leverage the extension. As the extension doesn't have any
>> provision for the overflow bit for fixed counters, the fixed events
>> can also be monitoring using programmable counters. The underlying
>> counters for cycle and instruction counters are always running. Thus,
>> a separate timer device is programmed to handle the overflow.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> ---
>>  target/riscv/cpu.c      |  12 ++
>>  target/riscv/cpu.h      |  25 +++
>>  target/riscv/cpu_bits.h |  55 +++++++
>>  target/riscv/csr.c      | 150 +++++++++++++++++-
>>  target/riscv/machine.c  |   2 +-
>>  target/riscv/pmu.c      | 343 +++++++++++++++++++++++++++++++++++++++-
>>  target/riscv/pmu.h      |   9 ++
>>  7 files changed, 589 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index aec94101a4c0..757c646037bb 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -22,6 +22,7 @@
>>  #include "qemu/ctype.h"
>>  #include "qemu/log.h"
>>  #include "cpu.h"
>> +#include "pmu.h"
>>  #include "internals.h"
>>  #include "exec/exec-all.h"
>>  #include "qapi/error.h"
>> @@ -535,6 +536,16 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
>>          set_misa(env, target_misa);
>>      }
>>
>> +    if (cpu->cfg.pmu_num) {
>> +        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_ssco=
f) {
>> +            cpu->pmu_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
>> +                                          riscv_pmu_timer_cb, cpu);
>> +            if (!cpu->pmu_timer) {
>> +                cpu->cfg.ext_sscof =3D false;
>> +            }
>> +        }
>> +     }
>> +
>>      riscv_cpu_register_gdb_regs_for_features(cs);
>>
>>      qemu_init_vcpu(cs);
>> @@ -599,6 +610,7 @@ static Property riscv_cpu_properties[] =3D {
>>      DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>>      DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
>>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>> +    DEFINE_PROP_BOOL("sscof", RISCVCPU, cfg.ext_sscof, false),
>>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>>      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index da34614ad788..b66d8acff109 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -123,6 +123,8 @@ struct PMUCTRState {
>>      /* Snapshort value of a counter in RV32 */
>>      target_ulong mhpmcounterh_prev;
>>      bool started;
>> +    /* Value beyond UINT32_MAX/UINT64_MAX before overflow interrupt tri=
gger */
>> +    target_ulong irq_overflow_left;
>>  };
>>
>>  struct CPURISCVState {
>> @@ -241,6 +243,9 @@ struct CPURISCVState {
>>      /* PMU event selector configured values. First three are unused*/
>>      target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
>>
>> +    /* PMU event selector configured values for RV32*/
>> +    target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];
>> +
>>      target_ulong sscratch;
>>      target_ulong mscratch;
>>
>> @@ -320,6 +325,7 @@ struct RISCVCPU {
>>          bool ext_zbs;
>>          bool ext_ifencei;
>>          bool ext_icsr;
>> +        bool ext_sscof;
>>
>>          uint8_t pmu_num;
>>          char *priv_spec;
>> @@ -333,6 +339,12 @@ struct RISCVCPU {
>>          bool epmp;
>>          uint64_t resetvec;
>>      } cfg;
>> +
>> +    QEMUTimer *pmu_timer;
>> +    /* A bitmask of Available programmable counters */
>> +    uint32_t pmu_avail_ctrs;
>> +    /* Mapping of events to counters */
>> +    GHashTable *pmu_event_ctr_map;
>>  };
>>
>>  static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
>> @@ -528,6 +540,19 @@ enum {
>>      CSR_TABLE_SIZE =3D 0x1000
>>  };
>>
>> +/**
>> + * The event id are encoded based on the encoding specified in the
>> + * SBI specification v0.3
>> + */
>> +
>> +enum riscv_pmu_event_idx {
>> +    RISCV_PMU_EVENT_HW_CPU_CYCLES =3D 0x01,
>> +    RISCV_PMU_EVENT_HW_INSTRUCTIONS =3D 0x02,
>> +    RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS =3D 0x10019,
>> +    RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS =3D 0x1001B,
>> +    RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS =3D 0x10021,
>> +};
>> +
>>  /* CSR function table */
>>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>>
>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index 72b1485e621f..cd6523c1c6ee 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -308,6 +308,37 @@
>>  #define CSR_MHPMEVENT29     0x33d
>>  #define CSR_MHPMEVENT30     0x33e
>>  #define CSR_MHPMEVENT31     0x33f
>> +
>> +#define CSR_MHPMEVENT3H     0x723
>> +#define CSR_MHPMEVENT4H     0x724
>> +#define CSR_MHPMEVENT5H     0x725
>> +#define CSR_MHPMEVENT6H     0x726
>> +#define CSR_MHPMEVENT7H     0x727
>> +#define CSR_MHPMEVENT8H     0x728
>> +#define CSR_MHPMEVENT9H     0x729
>> +#define CSR_MHPMEVENT10H    0x72a
>> +#define CSR_MHPMEVENT11H    0x72b
>> +#define CSR_MHPMEVENT12H    0x72c
>> +#define CSR_MHPMEVENT13H    0x72d
>> +#define CSR_MHPMEVENT14H    0x72e
>> +#define CSR_MHPMEVENT15H    0x72f
>> +#define CSR_MHPMEVENT16H    0x730
>> +#define CSR_MHPMEVENT17H    0x731
>> +#define CSR_MHPMEVENT18H    0x732
>> +#define CSR_MHPMEVENT19H    0x733
>> +#define CSR_MHPMEVENT20H    0x734
>> +#define CSR_MHPMEVENT21H    0x735
>> +#define CSR_MHPMEVENT22H    0x736
>> +#define CSR_MHPMEVENT23H    0x737
>> +#define CSR_MHPMEVENT24H    0x738
>> +#define CSR_MHPMEVENT25H    0x739
>> +#define CSR_MHPMEVENT26H    0x73a
>> +#define CSR_MHPMEVENT27H    0x73b
>> +#define CSR_MHPMEVENT28H    0x73c
>> +#define CSR_MHPMEVENT29H    0x73d
>> +#define CSR_MHPMEVENT30H    0x73e
>> +#define CSR_MHPMEVENT31H    0x73f
>> +
>>  #define CSR_MHPMCOUNTER3H   0xb83
>>  #define CSR_MHPMCOUNTER4H   0xb84
>>  #define CSR_MHPMCOUNTER5H   0xb85
>> @@ -338,6 +369,8 @@
>>  #define CSR_MHPMCOUNTER30H  0xb9e
>>  #define CSR_MHPMCOUNTER31H  0xb9f
>>
>> +#define CSR_SCOUNTOVF       0xda0
>> +
>>  /* mstatus CSR bits */
>>  #define MSTATUS_UIE         0x00000001
>>  #define MSTATUS_SIE         0x00000002
>> @@ -508,6 +541,7 @@ typedef enum RISCVException {
>>  #define IRQ_S_EXT                          9
>>  #define IRQ_VS_EXT                         10
>>  #define IRQ_M_EXT                          11
>> +#define IRQ_PMU_OVF                        13
>>
>>  /* mip masks */
>>  #define MIP_USIP                           (1 << IRQ_U_SOFT)
>> @@ -522,11 +556,13 @@ typedef enum RISCVException {
>>  #define MIP_SEIP                           (1 << IRQ_S_EXT)
>>  #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
>>  #define MIP_MEIP                           (1 << IRQ_M_EXT)
>> +#define MIP_LCOFIP                         (1 << IRQ_PMU_OVF)
>>
>>  /* sip masks */
>>  #define SIP_SSIP                           MIP_SSIP
>>  #define SIP_STIP                           MIP_STIP
>>  #define SIP_SEIP                           MIP_SEIP
>> +#define SIP_LCOFIP                         MIP_LCOFIP
>>
>>  /* MIE masks */
>>  #define MIE_SEIE                           (1 << IRQ_S_EXT)
>> @@ -535,4 +571,23 @@ typedef enum RISCVException {
>>  #define MIE_UTIE                           (1 << IRQ_U_TIMER)
>>  #define MIE_SSIE                           (1 << IRQ_S_SOFT)
>>  #define MIE_USIE                           (1 << IRQ_U_SOFT)
>> +#define MIE_LCOFIE                         (1 << IRQ_PMU_OVF)
>> +
>> +#define MHPMEVENT_BIT_OF                   BIT(63)
>> +#define MHPMEVENTH_BIT_OF                  BIT(31)
>> +#define MHPMEVENT_BIT_MINH                 BIT(62)
>> +#define MHPMEVENTH_BIT_MINH                BIT(30)
>> +#define MHPMEVENT_BIT_SINH                 BIT(61)
>> +#define MHPMEVENTH_BIT_SINH                BIT(29)
>> +#define MHPMEVENT_BIT_UINH                 BIT(60)
>> +#define MHPMEVENTH_BIT_UINH                BIT(28)
>> +#define MHPMEVENT_BIT_VSINH                BIT(59)
>> +#define MHPMEVENTH_BIT_VSINH               BIT(27)
>> +#define MHPMEVENT_BIT_VUINH                BIT(58)
>> +#define MHPMEVENTH_BIT_VUINH               BIT(26)
>> +
>> +#define MHPMEVENT_SSCOF_MASK               _ULL(0xFFFF000000000000)
>> +#define MHPMEVENT_IDX_MASK                 0xFFFFF
>> +#define MHPMEVENT_SSCOF_RESVD              16
>> +
>>  #endif
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 1ce1bb0868d7..6a1580c4b6ce 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -89,6 +89,19 @@ static RISCVException mctr32(CPURISCVState *env, int =
csrno)
>>      return mctr(env, csrno);
>>  }
>>
>> +static RISCVException sscof(CPURISCVState *env, int csrno)
>> +{
>> + #if !defined(CONFIG_USER_ONLY)
>> +    CPUState *cs =3D env_cpu(env);
>> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
>> +
>> +    if (!cpu->cfg.ext_sscof) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +    }
>> +#endif
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>>  static RISCVException ctr(CPURISCVState *env, int csrno)
>>  {
>>  #if !defined(CONFIG_USER_ONLY)
>> @@ -104,11 +117,18 @@ static RISCVException ctr(CPURISCVState *env, int =
csrno)
>>      }
>>      ctr_index =3D csrno - base_csrno;
>>
>> -    if (!cpu->cfg.pmu_num || ctr_index >=3D (cpu->cfg.pmu_num + 3)) {
>> +    if ((csrno >=3D CSR_CYCLE && csrno <=3D CSR_INSTRET) ||
>> +        (csrno >=3D CSR_CYCLEH && csrno <=3D CSR_INSTRETH)) {
>> +        goto skip_ext_pmu_check;
>> +    }
>> +
>> +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index))))=
 {
>>          /* The PMU is not enabled or counter is out of range */
>>          return RISCV_EXCP_ILLEGAL_INST;
>>      }
>>
>> +skip_ext_pmu_check:
>> +
>>      if (env->priv =3D=3D PRV_S) {
>>          switch (csrno) {
>>          case CSR_CYCLE:
>> @@ -424,7 +444,7 @@ static RISCVException write_vstart(CPURISCVState *en=
v, int csrno,
>>  }
>>
>>  /* User Timers and Counters */
>> -static target_ulong get_icount_ticks(bool brv32)
>> +target_ulong get_icount_ticks(bool brv32)
>>  {
>>      int64_t val;
>>      target_ulong result;
>> @@ -461,11 +481,36 @@ static int write_mhpmevent(CPURISCVState *env, int=
 csrno, target_ulong val)
>>  {
>>      int evt_index =3D csrno - CSR_MCOUNTINHIBIT;
>>
>> +    if (!riscv_cpu_is_32bit(env)) {
>> +        riscv_pmu_update_event_map(env, val, evt_index);
>> +    }
>>      env->mhpmevent_val[evt_index] =3D val;
>>
>>      return RISCV_EXCP_NONE;
>>  }
>>
>> +static int read_mhpmeventh(CPURISCVState *env, int csrno, target_ulong =
*val)
>> +{
>> +    int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;
>> +
>> +    *val =3D env->mhpmevent_val[evt_index];
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>> +static int write_mhpmeventh(CPURISCVState *env, int csrno, target_ulong=
 val)
>> +{
>> +    int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;
>> +    uint64_t mhpmevth_val =3D val;
>> +    uint64_t mhpmevt_val =3D env->mhpmevent_val[evt_index];
>> +
>> +    mhpmevt_val =3D mhpmevt_val | (mhpmevth_val << 32);
>> +    riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
>> +    env->mhpmeventh_val[evt_index] =3D val;
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>>  static int write_mhpmcounter(CPURISCVState *env, int csrno, target_ulon=
g val)
>>  {
>>      int ctr_idx =3D csrno - CSR_MCYCLE;
>> @@ -475,6 +520,9 @@ static int write_mhpmcounter(CPURISCVState *env, int=
 csrno, target_ulong val)
>>      if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>>          riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
>>          counter->mhpmcounter_prev =3D get_icount_ticks(false);
>> +        if (ctr_idx > 2) {
>> +            riscv_pmu_setup_timer(env, val, ctr_idx);
>> +        }
>>       } else {
>>          /* Other counters can keep incrementing from the given value */
>>          counter->mhpmcounter_prev =3D val;
>> @@ -487,11 +535,17 @@ static int write_mhpmcounterh(CPURISCVState *env, =
int csrno, target_ulong val)
>>  {
>>      int ctr_idx =3D csrno - CSR_MCYCLEH;
>>      PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
>> +    uint64_t mhpmctr_val =3D counter->mhpmcounter_val;
>> +    uint64_t mhpmctrh_val =3D val;
>>
>>      counter->mhpmcounterh_val =3D val;
>> +    mhpmctr_val =3D mhpmctr_val | (mhpmctrh_val << 32);
>>      if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>>          riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
>>          counter->mhpmcounterh_prev =3D get_icount_ticks(false);
>> +        if (ctr_idx > 2) {
>> +            riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
>> +        }
>>      } else {
>>          counter->mhpmcounterh_prev =3D val;
>>      }
>> @@ -561,6 +615,32 @@ static int read_hpmcounterh(CPURISCVState *env, int=
 csrno, target_ulong *val)
>>      return riscv_pmu_read_ctr(env, val, true, ctr_index);
>>  }
>>
>> +static int read_scountovf(CPURISCVState *env, int csrno, target_ulong *=
val)
>> +{
>> +    int mhpmevt_start =3D CSR_MHPMEVENT3 - CSR_MCOUNTINHIBIT;
>> +    int i;
>> +    *val =3D 0;
>> +    target_ulong *mhpm_evt_val;
>> +    uint64_t of_bit_mask;
>> +
>> +    if (riscv_cpu_is_32bit(env)) {
>> +        mhpm_evt_val =3D env->mhpmeventh_val;
>> +        of_bit_mask =3D MHPMEVENTH_BIT_OF;
>> +    } else {
>> +        mhpm_evt_val =3D env->mhpmevent_val;
>> +        of_bit_mask =3D MHPMEVENT_BIT_OF;
>> +    }
>> +
>> +    for (i =3D mhpmevt_start; i < RV_MAX_MHPMEVENTS; i++) {
>> +        if ((get_field(env->mcounteren, BIT(i))) &&
>> +            (mhpm_evt_val[i] & of_bit_mask)) {
>> +                    *val |=3D BIT(i);
>> +            }
>> +    }
>> +
>> +    return RISCV_EXCP_NONE;
>> +}
>> +
>>  #if defined(CONFIG_USER_ONLY)
>>  static RISCVException read_time(CPURISCVState *env, int csrno,
>>                                  target_ulong *val)
>> @@ -607,7 +687,7 @@ static RISCVException read_timeh(CPURISCVState *env,=
 int csrno,
>>  /* Machine constants */
>>
>>  #define M_MODE_INTERRUPTS  (MIP_MSIP | MIP_MTIP | MIP_MEIP)
>> -#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
>> +#define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP | MIP_LCOFIP=
)
>>  #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
>>
>>  static const target_ulong delegable_ints =3D S_MODE_INTERRUPTS |
>> @@ -645,7 +725,8 @@ static const target_ulong vs_delegable_excps =3D DEL=
EGABLE_EXCPS &
>>  static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE | SSTATUS_=
SPIE |
>>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS =
|
>>      SSTATUS_SUM | SSTATUS_MXR;
>> -static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | M=
IP_UEIP;
>> +static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP | M=
IP_UEIP |
>> +                                              SIP_LCOFIP;
>>  static const target_ulong hip_writable_mask =3D MIP_VSSIP;
>>  static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTIP =
| MIP_VSEIP;
>>  static const target_ulong vsip_writable_mask =3D MIP_VSSIP;
>> @@ -2022,6 +2103,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
>>      [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_mhpmevent=
,
>>                                                         write_mhpmevent =
},
>>
>> +    [CSR_MHPMEVENT3H]    =3D { "mhpmevent3h",    sscof,  read_mhpmevent=
h,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT4H]    =3D { "mhpmevent4h",    sscof,  read_mhpmevent=
h,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT5H]    =3D { "mhpmevent5h",    sscof,  read_mhpmevent=
h,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT6H]    =3D { "mhpmevent6h",    sscof,  read_mhpmevent=
h,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT7H]    =3D { "mhpmevent7h",    sscof,  read_mhpmevent=
h,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT8H]    =3D { "mhpmevent8h",    sscof,  read_mhpmevent=
h,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT9H]    =3D { "mhpmevent9h",    sscof,  read_mhpmevent=
h,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT10H]   =3D { "mhpmevent10h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT11H]   =3D { "mhpmevent11h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT12H]   =3D { "mhpmevent12h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT13H]   =3D { "mhpmevent13h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT14H]   =3D { "mhpmevent14h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT15H]   =3D { "mhpmevent15h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT16H]   =3D { "mhpmevent16h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT17H]   =3D { "mhpmevent17h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT18H]   =3D { "mhpmevent18h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT19H]   =3D { "mhpmevent19h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT20H]   =3D { "mhpmevent20h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT21H]   =3D { "mhpmevent21h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT22H]   =3D { "mhpmevent22h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT23H]   =3D { "mhpmevent23h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT24H]   =3D { "mhpmevent24h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT25H]   =3D { "mhpmevent25h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT26H]   =3D { "mhpmevent26h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT27H]   =3D { "mhpmevent27h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT28H]   =3D { "mhpmevent28h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT29H]   =3D { "mhpmevent29h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT30H]   =3D { "mhpmevent30h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +    [CSR_MHPMEVENT31H]   =3D { "mhpmevent31h",    sscof,  read_mhpmeven=
th,
>> +                                                       write_mhpmeventh=
},
>> +
>>      [CSR_HPMCOUNTER3H]   =3D { "hpmcounter3h",   ctr32,  read_hpmcounte=
rh },
>>      [CSR_HPMCOUNTER4H]   =3D { "hpmcounter4h",   ctr32,  read_hpmcounte=
rh },
>>      [CSR_HPMCOUNTER5H]   =3D { "hpmcounter5h",   ctr32,  read_hpmcounte=
rh },
>> @@ -2110,5 +2250,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>>                                                         write_mhpmcounte=
rh },
>>      [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", mctr32,  read_hpmcount=
erh,
>>                                                         write_mhpmcounte=
rh },
>> +    [CSR_SCOUNTOVF]      =3D { "scountovf", sscof,  read_scountovf },
>> +
>>  #endif /* !CONFIG_USER_ONLY */
>>  };
>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> index e0a489c20e67..7b2ef17904a9 100644
>> --- a/target/riscv/machine.c
>> +++ b/target/riscv/machine.c
>> @@ -88,7 +88,7 @@ static bool pmu_needed(void *opaque)
>>  {
>>      RISCVCPU *cpu =3D opaque;
>>
>> -    return cpu->cfg.ext_pmu;
>> +    return cpu->cfg.pmu_num;
>>  }
>>
>>  static const VMStateDescription vmstate_vector =3D {
>> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
>> index 000fe8da45ef..25bdbdf48ff7 100644
>> --- a/target/riscv/pmu.c
>> +++ b/target/riscv/pmu.c
>> @@ -20,13 +20,352 @@
>>  #include "cpu.h"
>>  #include "pmu.h"
>>
>> +#define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
>> +
>> +static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
>> +{
>> +    if (ctr_idx < 3 || ctr_idx >=3D RV_MAX_MHPMCOUNTERS ||
>> +        !(cpu->pmu_avail_ctrs & BIT(ctr_idx))) {
>> +        return false;
>> +    } else {
>> +        return true;
>> +    }
>> +}
>> +
>> +static bool riscv_pmu_counter_enabled(RISCVCPU *cpu, uint32_t ctr_idx)
>> +{
>> +    CPURISCVState *env =3D &cpu->env;
>> +
>> +    if (!riscv_pmu_counter_valid(cpu, ctr_idx) ||
>> +        !get_field(env->mcounteren, BIT(ctr_idx))) {
>> +        return false;
>> +    } else {
>> +        return true;
>> +    }
>> +}
>> +
>> +static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)
>> +{
>> +    CPURISCVState *env =3D &cpu->env;
>> +    target_ulong max_val =3D UINT32_MAX;
>> +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
>> +
>> +    /* Privilege mode filtering */
>> +    if ((env->priv =3D=3D PRV_M &&
>> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_MINH)) ||
>> +        (env->priv =3D=3D PRV_S &&
>> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_SINH)) ||
>> +        (env->priv =3D=3D PRV_U &&
>> +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_UINH))) {
>> +        return 0;
>> +    }
>> +
>> +    /* Handle the overflow scenario */
>> +    if (counter->mhpmcounter_val =3D=3D max_val) {
>> +        if (counter->mhpmcounterh_val =3D=3D max_val) {
>> +            counter->mhpmcounter_val =3D 0;
>> +            counter->mhpmcounterh_val =3D 0;
>> +            /* Generate interrupt only if OF bit is clear */
>> +            if (!(env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_OF)) {
>> +                env->mhpmeventh_val[ctr_idx] |=3D MHPMEVENTH_BIT_OF;
>> +                riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
>> +            }
>> +        } else {
>> +            counter->mhpmcounterh_val++;
>> +        }
>> +    } else {
>> +        counter->mhpmcounter_val++;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uint32_t ctr_idx)
>> +{
>> +    CPURISCVState *env =3D &cpu->env;
>> +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
>> +    uint64_t max_val =3D UINT64_MAX;
>> +
>> +    /* Privilege mode filtering */
>> +    if ((env->priv =3D=3D PRV_M &&
>> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_MINH)) ||
>> +        (env->priv =3D=3D PRV_S &&
>> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_SINH)) ||
>> +        (env->priv =3D=3D PRV_U &&
>> +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_UINH))) {
>> +        return 0;
>> +    }
>> +
>> +    /* Handle the overflow scenario */
>> +    if (counter->mhpmcounter_val =3D=3D max_val) {
>> +        counter->mhpmcounter_val =3D 0;
>> +        /* Generate interrupt only if OF bit is clear */
>> +        if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
>> +            env->mhpmevent_val[ctr_idx] |=3D MHPMEVENT_BIT_OF;
>> +            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
>> +        }
>> +    } else {
>> +        counter->mhpmcounter_val++;
>> +    }
>> +    return 0;
>> +}
>> +
>> +int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_id=
x)
>> +{
>> +    uint32_t ctr_idx;
>> +    int ret;
>> +    CPURISCVState *env =3D &cpu->env;
>> +    gpointer value;
>> +
>> +    value =3D g_hash_table_lookup(cpu->pmu_event_ctr_map,
>> +                                GUINT_TO_POINTER(event_idx));
>> +    if (!value) {
>> +        return -1;
>> +    }
>> +
>> +    ctr_idx =3D GPOINTER_TO_UINT(value);
>> +    if (!riscv_pmu_counter_enabled(cpu, ctr_idx) ||
>> +        get_field(env->mcountinhibit, BIT(ctr_idx))) {
>> +        return -1;
>> +    }
>> +
>> +    if (riscv_cpu_is_32bit(env)) {
>> +        ret =3D riscv_pmu_incr_ctr_rv32(cpu, ctr_idx);
>> +    } else {
>> +        ret =3D riscv_pmu_incr_ctr_rv64(cpu, ctr_idx);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>>  bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
>>                                          uint32_t target_ctr)
>>  {
>> -    return (target_ctr =3D=3D 0) ? true : false;
>> +    RISCVCPU *cpu;
>> +    uint32_t event_idx;
>> +    uint32_t ctr_idx;
>> +
>> +    /* Fixed instret counter */
>> +    if (target_ctr =3D=3D 2) {
>> +        return true;
>> +    }
>> +
>> +    cpu =3D RISCV_CPU(env_cpu(env));
>> +    event_idx =3D RISCV_PMU_EVENT_HW_INSTRUCTIONS;
>> +    ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr=
_map,
>> +                               GUINT_TO_POINTER(event_idx)));
>> +    if (!ctr_idx) {
>> +        return false;
>> +    }
>> +
>> +    return target_ctr =3D=3D ctr_idx ? true : false;
>>  }
>>
>>  bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t target_c=
tr)
>>  {
>> -    return (target_ctr =3D=3D 2) ? true : false;
>> +    RISCVCPU *cpu;
>> +    uint32_t event_idx;
>> +    uint32_t ctr_idx;
>> +
>> +    /* Fixed mcycle counter */
>> +    if (target_ctr =3D=3D 0) {
>> +        return true;
>> +    }
>> +
>> +    cpu =3D RISCV_CPU(env_cpu(env));
>> +    event_idx =3D RISCV_PMU_EVENT_HW_CPU_CYCLES;
>> +    ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr=
_map,
>> +                               GUINT_TO_POINTER(event_idx)));
>> +
>> +    /* Counter zero is not used for event_ctr_map */
>> +    if (!ctr_idx) {
>> +        return false;
>> +    }
>> +
>> +    return (target_ctr =3D=3D ctr_idx) ? true : false;
>> +}
>> +
>> +static gboolean pmu_remove_event_map(gpointer key, gpointer value,
>> +                                     gpointer udata)
>> +{
>> +    return (GPOINTER_TO_UINT(value) =3D=3D GPOINTER_TO_UINT(udata)) ? t=
rue : false;
>> +}
>> +
>> +static int64_t pmu_icount_ticks_to_ns(int64_t value)
>> +{
>> +    int64_t ret =3D 0;
>> +
>> +    if (icount_enabled()) {
>> +        ret =3D icount_to_ns(value);
>> +    } else {
>> +        ret =3D (NANOSECONDS_PER_SECOND / RISCV_TIMEBASE_FREQ) * value;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
>> +                               uint32_t ctr_idx)
>> +{
>> +    uint32_t event_idx;
>> +    RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));
>> +
>> +    if (!riscv_pmu_counter_valid(cpu, ctr_idx)) {
>> +        return -1;
>> +    }
>> +
>> +    /**
>> +     * Expected mhpmevent value is zero for reset case. Remove the curr=
ent
>> +     * mapping.
>> +     */
>> +    if (!value) {
>> +        g_hash_table_foreach_remove(cpu->pmu_event_ctr_map,
>> +                                    pmu_remove_event_map,
>> +                                    GUINT_TO_POINTER(ctr_idx));
>> +        return 0;
>> +    }
>> +
>> +    event_idx =3D value & MHPMEVENT_IDX_MASK;
>> +    if (g_hash_table_lookup(cpu->pmu_event_ctr_map,
>> +                            GUINT_TO_POINTER(event_idx))) {
>> +        return 0;
>> +    }
>> +
>> +    switch (event_idx) {
>> +    case RISCV_PMU_EVENT_HW_CPU_CYCLES:
>> +    case RISCV_PMU_EVENT_HW_INSTRUCTIONS:
>> +    case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:
>> +    case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:
>> +    case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:
>> +        break;
>> +    default:
>> +        /* We don't support any raw events right now */
>> +        return -1;
>> +    }
>> +    g_hash_table_insert(cpu->pmu_event_ctr_map, GUINT_TO_POINTER(event_=
idx),
>> +                        GUINT_TO_POINTER(ctr_idx));
>> +
>> +    return 0;
>> +}
>> +
>> +static void pmu_timer_trigger_irq(RISCVCPU *cpu,
>> +                                  enum riscv_pmu_event_idx evt_idx)
>> +{
>> +    uint32_t ctr_idx;
>> +    CPURISCVState *env =3D &cpu->env;
>> +    PMUCTRState *counter;
>> +    target_ulong *mhpmevent_val;
>> +    uint64_t of_bit_mask;
>> +    int64_t irq_trigger_at;
>> +
>> +    if (evt_idx !=3D RISCV_PMU_EVENT_HW_CPU_CYCLES &&
>> +        evt_idx !=3D RISCV_PMU_EVENT_HW_INSTRUCTIONS) {
>> +        return;
>> +    }
>> +
>> +    ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr=
_map,
>> +                               GUINT_TO_POINTER(evt_idx)));
>> +    if (!riscv_pmu_counter_enabled(cpu, ctr_idx)) {
>> +        return;
>> +    }
>> +
>> +    if (riscv_cpu_is_32bit(env)) {
>> +        mhpmevent_val =3D &env->mhpmeventh_val[ctr_idx];
>> +        of_bit_mask =3D MHPMEVENTH_BIT_OF;
>> +     } else {
>> +        mhpmevent_val =3D &env->mhpmevent_val[ctr_idx];
>> +        of_bit_mask =3D MHPMEVENT_BIT_OF;
>> +    }
>> +
>> +    counter =3D &env->pmu_ctrs[ctr_idx];
>> +    if (counter->irq_overflow_left > 0) {
>> +        irq_trigger_at =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
>> +                        counter->irq_overflow_left;
>> +        timer_mod_anticipate_ns(cpu->pmu_timer, irq_trigger_at);
>> +        counter->irq_overflow_left =3D 0;
>> +        return;
>> +    }
>> +
>> +    if (cpu->pmu_avail_ctrs & BIT(ctr_idx)) {
>> +        /* Generate interrupt only if OF bit is clear */
>> +        if (!(*mhpmevent_val & of_bit_mask)) {
>> +            *mhpmevent_val |=3D of_bit_mask;
>> +            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
>> +        }
>> +    }
>> +}
>> +
>> +/* Timer callback for instret and cycle counter overflow */
>> +void riscv_pmu_timer_cb(void *priv)
>> +{
>> +    RISCVCPU *cpu =3D priv;
>> +
>> +    /* Timer event was triggered only for these events */
>> +    pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_CPU_CYCLES);
>> +    pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_INSTRUCTIONS);
>> +}
>> +
>> +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t =
ctr_idx)
>> +{
>> +    uint64_t overflow_delta, overflow_at;
>> +    int64_t overflow_ns, overflow_left =3D 0;
>> +    RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));
>> +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
>> +
>> +    if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu->cfg.ext_sscof) =
{
>> +        return -1;
>> +    }
>> +
>> +    if (value) {
>> +        overflow_delta =3D UINT64_MAX - value + 1;
>> +    } else {
>> +        overflow_delta =3D UINT64_MAX - value;
>> +    }
>> +
>> +    /**
>> +     * QEMU supports only int64_t timers while RISC-V counters are uint=
64_t.
>> +     * Compute the leftover and save it so that it can be reprogrammed =
again
>> +     * when timer expires.
>> +     */
>> +    if (overflow_delta > INT64_MAX) {
>> +        overflow_left =3D overflow_delta - INT64_MAX;
>> +    }
>> +
>> +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
>> +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
>> +        overflow_ns =3D pmu_icount_ticks_to_ns((int64_t)overflow_delta)=
;
>> +        overflow_left =3D pmu_icount_ticks_to_ns(overflow_left) ;
>> +    } else {
>> +        return -1;
>> +    }
>> +    overflow_at =3D (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + o=
verflow_ns;
>> +
>> +    if (overflow_at > INT64_MAX) {
>> +        overflow_left +=3D overflow_at - INT64_MAX;
>> +        counter->irq_overflow_left =3D overflow_left;
>> +        overflow_at =3D INT64_MAX;
>> +    }
>> +    timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
>> +
>> +    return 0;
>> +}
>> +
>> +
>> +int riscv_pmu_init(RISCVCPU *cpu, int num_counters)
>> +{
>> +    if (num_counters > (RV_MAX_MHPMCOUNTERS - 3)) {
>> +        return -1;
>> +    }
>> +
>> +    cpu->pmu_event_ctr_map =3D g_hash_table_new(g_direct_hash, g_direct=
_equal);
>> +    if (!cpu->pmu_event_ctr_map) {
>> +        /* PMU support can not be enabled */
>> +        qemu_log_mask(LOG_UNIMP, "PMU events can't be supported\n");
>> +        cpu->cfg.pmu_num =3D 0;
>> +        return -1;
>> +    }
>> +
>> +    /* Create a bitmask of available programmable counters */
>> +    cpu->pmu_avail_ctrs =3D ~(-1 << (num_counters + 3)) & ~(0x07);
>
>
> Hi Atish,
>
> cpu->pmu_avail_ctrs mask would becomes 0x0 if num_counters equals to 29.
> Perhaps it can be fixed with:
> cpu->pmu_avail_ctrs =3D MAKE_64BIT_MASK(3, num_counters);
> or some other similar techniques.

Thanks for catching it. Fixed in next version

>
> Regards,
> Frank Chang
>
>>
>> +    return 0;
>>  }
>> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
>> index 58a5bc3a4089..af78da92e820 100644
>> --- a/target/riscv/pmu.h
>> +++ b/target/riscv/pmu.h
>> @@ -26,3 +26,12 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVState=
 *env,
>>                                          uint32_t target_ctr);
>>  bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
>>                                    uint32_t target_ctr);
>> +void riscv_pmu_timer_cb(void *priv);
>> +int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
>> +int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
>> +                               uint32_t ctr_idx);
>> +int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_id=
x);
>> +void riscv_pmu_generate_fdt_node(void *fdt, char *pmu_name);
>> +target_ulong get_icount_ticks(bool brv32);
>> +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
>> +                          uint32_t ctr_idx);
>> --
>> 2.31.1
>>
>>


--=20
Regards,
Atish

