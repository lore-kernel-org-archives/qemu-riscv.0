Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGoeK-0006a6-Nt
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 17:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGoeI-0006ZO-LA
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 17:32:58 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGoeC-0001xi-JV
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 17:32:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 f11-20020a17090a4a8b00b001f2f7e32d03so3904340pjh.0
 for <qemu-riscv@nongnu.org>; Wed, 27 Jul 2022 14:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Hy6TZn44kO+oHMDqzMA8cFsckktCV/d8B+KzS+Kxak=;
 b=PakachXrgsWgbQPQmm6z7fSZdVRis3QLr+zC5wnn0xFBJBsGgwc5YkUCH91YKKncNe
 qzMn3HQ2buw+IUk1n4uMJa9wMH/H5Zqc+HVHZy9M/xye3XhUak7mUd4Rvg5EUUmNiT6Z
 /HC+J+PGF0SEHR22vuVMNbiCc6NmoqyvErl7qJrxick6oKp9uk40eqaN2SvlwZM+GzmR
 JtHTE6vOp5kvpjrDFQOmZoY0YBJhIRelhHbmB/IKQ6aGpmebqUpjU/3nuQUOwh+PHIoZ
 rmCjLOHOkSoO/7Q62H3rv6+qn3Z7lyiQEsHZ43ofUa54lCeXOfa/rfc7GmYgDNBrs9ZT
 z59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Hy6TZn44kO+oHMDqzMA8cFsckktCV/d8B+KzS+Kxak=;
 b=EsIpxno0LWZgkUKjeZWx7uqhUcfNmlE5ft/IvpvAvRWnNvXiopyK0xBxH7hcl3ZYc+
 4F/H6FO4VWq4y4U7PouxEbaWDRu3g7zB/EzDjzr/zcJQ+A8U2hQ4AU2tiyMtxj2esw4p
 XAYa/WMyHVIzeK7C4BDU5A1kSV3ncvVuvSz6VnxI2o0m9Al8dV9xGccB8vf0lxFQpC+n
 G77q9kfStOWV4EFfH9P6sqnTyOg6vC3BkIzObuyakAq7J10Z6UfshA2bbsr5ALUZ7Mut
 O5qdcZ+J4ugLdaYqYrf9EwnMZ/ux47PGoBoFG+KCfOHjbsJjwm7bY1OPgvyWFkyCyW/Z
 dywg==
X-Gm-Message-State: AJIora8+bHPdKOcaUPOb3ApSQnL+QKsjR65Fb3xH65//GiJ9HHLWk8X5
 d2uRaKVXwxKxuMX4cBMqjjU44nHeMfaweV/z5DjP/g==
X-Google-Smtp-Source: AGRyM1sVESbSXhfr6sRMnNY0yM7Ht3TI15sVSC8c55Y3IdIEEyCT2jqJq8GFamtPsc5xwLkybUOvJrjob7nikIhBBkM=
X-Received: by 2002:a17:902:e752:b0:16d:88ea:7ecc with SMTP id
 p18-20020a170902e75200b0016d88ea7eccmr12753152plf.17.1658957570679; Wed, 27
 Jul 2022 14:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220727064913.1041427-1-atishp@rivosinc.com>
 <20220727064913.1041427-2-atishp@rivosinc.com>
 <2080cb1c-873b-c43f-e2c3-1d65412f0a32@iscas.ac.cn>
In-Reply-To: <2080cb1c-873b-c43f-e2c3-1d65412f0a32@iscas.ac.cn>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 27 Jul 2022 14:32:38 -0700
Message-ID: <CAHBxVyHfvgMPToyun4AA3+S+=u+f-UfGE0YCxzPHcSm+SyUJ+Q@mail.gmail.com>
Subject: Re: [PATCH v11 1/6] target/riscv: Add sscofpmf extension support
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>, 
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b2c20405e4d02826"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 27 Jul 2022 21:32:59 -0000

--000000000000b2c20405e4d02826
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2022 at 1:11 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

>
> =E5=9C=A8 2022/7/27 =E4=B8=8B=E5=8D=882:49, Atish Patra =E5=86=99=E9=81=
=93:
> > The Sscofpmf ('Ss' for Privileged arch and Supervisor-level extensions,
> > and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
> > extension allows the perf to handle overflow interrupts and filtering
> > support. This patch provides a framework for programmable
> > counters to leverage the extension. As the extension doesn't have any
> > provision for the overflow bit for fixed counters, the fixed events
> > can also be monitoring using programmable counters. The underlying
> > counters for cycle and instruction counters are always running. Thus,
> > a separate timer device is programmed to handle the overflow.
> >
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   target/riscv/cpu.c      |  11 ++
> >   target/riscv/cpu.h      |  25 +++
> >   target/riscv/cpu_bits.h |  55 +++++++
> >   target/riscv/csr.c      | 166 ++++++++++++++++++-
> >   target/riscv/machine.c  |   1 +
> >   target/riscv/pmu.c      | 357 +++++++++++++++++++++++++++++++++++++++=
-
> >   target/riscv/pmu.h      |   7 +
> >   7 files changed, 611 insertions(+), 11 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 1bb3973806d2..c1d62b81a725 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -22,6 +22,7 @@
> >   #include "qemu/ctype.h"
> >   #include "qemu/log.h"
> >   #include "cpu.h"
> > +#include "pmu.h"
> >   #include "internals.h"
> >   #include "exec/exec-all.h"
> >   #include "qapi/error.h"
> > @@ -779,6 +780,15 @@ static void riscv_cpu_realize(DeviceState *dev,
> Error **errp)
> >           set_misa(env, env->misa_mxl, ext);
> >       }
> >
> > +#ifndef CONFIG_USER_ONLY
> > +    if (cpu->cfg.pmu_num) {
> > +        if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) &&
> cpu->cfg.ext_sscofpmf) {
> > +            cpu->pmu_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
> > +                                          riscv_pmu_timer_cb, cpu);
> > +        }
> > +     }
> > +#endif
> > +
> >       riscv_cpu_register_gdb_regs_for_features(cs);
> >
> >       qemu_init_vcpu(cs);
> > @@ -883,6 +893,7 @@ static Property riscv_cpu_extensions[] =3D {
> >       DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
> >       DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
> >       DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> > +    DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
> >       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> >       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 5c7acc055ac9..2222db193c3d 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -137,6 +137,8 @@ typedef struct PMUCTRState {
> >       /* Snapshort value of a counter in RV32 */
> >       target_ulong mhpmcounterh_prev;
> >       bool started;
> > +    /* Value beyond UINT32_MAX/UINT64_MAX before overflow interrupt
> trigger */
> > +    target_ulong irq_overflow_left;
> >   } PMUCTRState;
> >
> >   struct CPUArchState {
> > @@ -297,6 +299,9 @@ struct CPUArchState {
> >       /* PMU event selector configured values. First three are unused*/
> >       target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS];
> >
> > +    /* PMU event selector configured values for RV32*/
> > +    target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];
> > +
> >       target_ulong sscratch;
> >       target_ulong mscratch;
> >
> > @@ -433,6 +438,7 @@ struct RISCVCPUConfig {
> >       bool ext_zve32f;
> >       bool ext_zve64f;
> >       bool ext_zmmul;
> > +    bool ext_sscofpmf;
> >       bool rvv_ta_all_1s;
> >
> >       uint32_t mvendorid;
> > @@ -479,6 +485,12 @@ struct ArchCPU {
> >
> >       /* Configuration Settings */
> >       RISCVCPUConfig cfg;
> > +
> > +    QEMUTimer *pmu_timer;
> > +    /* A bitmask of Available programmable counters */
> > +    uint32_t pmu_avail_ctrs;
> > +    /* Mapping of events to counters */
> > +    GHashTable *pmu_event_ctr_map;
> >   };
> >
> >   static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
> > @@ -738,6 +750,19 @@ enum {
> >       CSR_TABLE_SIZE =3D 0x1000
> >   };
> >
> > +/**
> > + * The event id are encoded based on the encoding specified in the
> > + * SBI specification v0.3
> > + */
> > +
> > +enum riscv_pmu_event_idx {
> > +    RISCV_PMU_EVENT_HW_CPU_CYCLES =3D 0x01,
> > +    RISCV_PMU_EVENT_HW_INSTRUCTIONS =3D 0x02,
> > +    RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS =3D 0x10019,
> > +    RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS =3D 0x1001B,
> > +    RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS =3D 0x10021,
> > +};
> > +
> >   /* CSR function table */
> >   extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
> >
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 6be5a9e9f046..b63c586be563 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -382,6 +382,37 @@
> >   #define CSR_MHPMEVENT29     0x33d
> >   #define CSR_MHPMEVENT30     0x33e
> >   #define CSR_MHPMEVENT31     0x33f
> > +
> > +#define CSR_MHPMEVENT3H     0x723
> > +#define CSR_MHPMEVENT4H     0x724
> > +#define CSR_MHPMEVENT5H     0x725
> > +#define CSR_MHPMEVENT6H     0x726
> > +#define CSR_MHPMEVENT7H     0x727
> > +#define CSR_MHPMEVENT8H     0x728
> > +#define CSR_MHPMEVENT9H     0x729
> > +#define CSR_MHPMEVENT10H    0x72a
> > +#define CSR_MHPMEVENT11H    0x72b
> > +#define CSR_MHPMEVENT12H    0x72c
> > +#define CSR_MHPMEVENT13H    0x72d
> > +#define CSR_MHPMEVENT14H    0x72e
> > +#define CSR_MHPMEVENT15H    0x72f
> > +#define CSR_MHPMEVENT16H    0x730
> > +#define CSR_MHPMEVENT17H    0x731
> > +#define CSR_MHPMEVENT18H    0x732
> > +#define CSR_MHPMEVENT19H    0x733
> > +#define CSR_MHPMEVENT20H    0x734
> > +#define CSR_MHPMEVENT21H    0x735
> > +#define CSR_MHPMEVENT22H    0x736
> > +#define CSR_MHPMEVENT23H    0x737
> > +#define CSR_MHPMEVENT24H    0x738
> > +#define CSR_MHPMEVENT25H    0x739
> > +#define CSR_MHPMEVENT26H    0x73a
> > +#define CSR_MHPMEVENT27H    0x73b
> > +#define CSR_MHPMEVENT28H    0x73c
> > +#define CSR_MHPMEVENT29H    0x73d
> > +#define CSR_MHPMEVENT30H    0x73e
> > +#define CSR_MHPMEVENT31H    0x73f
> > +
> >   #define CSR_MHPMCOUNTER3H   0xb83
> >   #define CSR_MHPMCOUNTER4H   0xb84
> >   #define CSR_MHPMCOUNTER5H   0xb85
> > @@ -443,6 +474,7 @@
> >   #define CSR_VSMTE           0x2c0
> >   #define CSR_VSPMMASK        0x2c1
> >   #define CSR_VSPMBASE        0x2c2
> > +#define CSR_SCOUNTOVF       0xda0
> >
> >   /* Crypto Extension */
> >   #define CSR_SEED            0x015
> > @@ -620,6 +652,7 @@ typedef enum RISCVException {
> >   #define IRQ_VS_EXT                         10
> >   #define IRQ_M_EXT                          11
> >   #define IRQ_S_GEXT                         12
> > +#define IRQ_PMU_OVF                        13
> >   #define IRQ_LOCAL_MAX                      16
> >   #define IRQ_LOCAL_GUEST_MAX                (TARGET_LONG_BITS - 1)
> >
> > @@ -637,11 +670,13 @@ typedef enum RISCVException {
> >   #define MIP_VSEIP                          (1 << IRQ_VS_EXT)
> >   #define MIP_MEIP                           (1 << IRQ_M_EXT)
> >   #define MIP_SGEIP                          (1 << IRQ_S_GEXT)
> > +#define MIP_LCOFIP                         (1 << IRQ_PMU_OVF)
> >
> >   /* sip masks */
> >   #define SIP_SSIP                           MIP_SSIP
> >   #define SIP_STIP                           MIP_STIP
> >   #define SIP_SEIP                           MIP_SEIP
> > +#define SIP_LCOFIP                         MIP_LCOFIP
> >
> >   /* MIE masks */
> >   #define MIE_SEIE                           (1 << IRQ_S_EXT)
> > @@ -795,4 +830,24 @@ typedef enum RISCVException {
> >   #define SEED_OPST_WAIT                   (0b01 << 30)
> >   #define SEED_OPST_ES16                   (0b10 << 30)
> >   #define SEED_OPST_DEAD                   (0b11 << 30)
> > +/* PMU related bits */
> > +#define MIE_LCOFIE                         (1 << IRQ_PMU_OVF)
> > +
> > +#define MHPMEVENT_BIT_OF                   BIT_ULL(63)
> > +#define MHPMEVENTH_BIT_OF                  BIT(31)
> > +#define MHPMEVENT_BIT_MINH                 BIT_ULL(62)
> > +#define MHPMEVENTH_BIT_MINH                BIT(30)
> > +#define MHPMEVENT_BIT_SINH                 BIT_ULL(61)
> > +#define MHPMEVENTH_BIT_SINH                BIT(29)
> > +#define MHPMEVENT_BIT_UINH                 BIT_ULL(60)
> > +#define MHPMEVENTH_BIT_UINH                BIT(28)
> > +#define MHPMEVENT_BIT_VSINH                BIT_ULL(59)
> > +#define MHPMEVENTH_BIT_VSINH               BIT(27)
> > +#define MHPMEVENT_BIT_VUINH                BIT_ULL(58)
> > +#define MHPMEVENTH_BIT_VUINH               BIT(26)
> > +
> > +#define MHPMEVENT_SSCOF_MASK               _ULL(0xFFFF000000000000)
> > +#define MHPMEVENT_IDX_MASK                 0xFFFFF
> > +#define MHPMEVENT_SSCOF_RESVD              16
> > +
> >   #endif
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 235f2a011e70..1233bfa0a726 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -74,7 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
> >       CPUState *cs =3D env_cpu(env);
> >       RISCVCPU *cpu =3D RISCV_CPU(cs);
> >       int ctr_index;
> > -    int base_csrno =3D CSR_HPMCOUNTER3;
> > +    int base_csrno =3D CSR_CYCLE;
> >       bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? true : false;
> >
> >       if (rv32 && csrno >=3D CSR_CYCLEH) {
> > @@ -83,11 +83,18 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
> >       }
> >       ctr_index =3D csrno - base_csrno;
> >
> > -    if (!cpu->cfg.pmu_num || ctr_index >=3D (cpu->cfg.pmu_num)) {
> > +    if ((csrno >=3D CSR_CYCLE && csrno <=3D CSR_INSTRET) ||
> > +        (csrno >=3D CSR_CYCLEH && csrno <=3D CSR_INSTRETH)) {
> > +        goto skip_ext_pmu_check;
> > +    }
> > +
> > +    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))=
)
> {
> >           /* No counter is enabled in PMU or the counter is out of rang=
e
> */
> >           return RISCV_EXCP_ILLEGAL_INST;
> >       }
> >
> Maybe it's better to remove !cpu->cfg.pmu_num here, not in later commit.
> > +skip_ext_pmu_check:
> > +
> >       if (env->priv =3D=3D PRV_S) {
> >           switch (csrno) {
> >           case CSR_CYCLE:
> > @@ -106,7 +113,6 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
> >               }
> >               break;
> >           case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > -            ctr_index =3D csrno - CSR_CYCLE;
> >               if (!get_field(env->mcounteren, 1 << ctr_index)) {
> >                   return RISCV_EXCP_ILLEGAL_INST;
> >               }
> > @@ -130,7 +136,6 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
> >                   }
> >                   break;
> >               case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > -                ctr_index =3D csrno - CSR_CYCLEH;
> >                   if (!get_field(env->mcounteren, 1 << ctr_index)) {
> >                       return RISCV_EXCP_ILLEGAL_INST;
> >                   }
> > @@ -160,7 +165,6 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
> >               }
> >               break;
> >           case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
> > -            ctr_index =3D csrno - CSR_CYCLE;
> >               if (!get_field(env->hcounteren, 1 << ctr_index) &&
> >                    get_field(env->mcounteren, 1 << ctr_index)) {
> >                   return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > @@ -188,7 +192,6 @@ static RISCVException ctr(CPURISCVState *env, int
> csrno)
> >                   }
> >                   break;
> >               case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
> > -                ctr_index =3D csrno - CSR_CYCLEH;
> >                   if (!get_field(env->hcounteren, 1 << ctr_index) &&
> >                        get_field(env->mcounteren, 1 << ctr_index)) {
> >                       return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> > @@ -240,6 +243,18 @@ static RISCVException mctr32(CPURISCVState *env,
> int csrno)
> >       return mctr(env, csrno);
> >   }
> >
> > +static RISCVException sscofpmf(CPURISCVState *env, int csrno)
> > +{
> > +    CPUState *cs =3D env_cpu(env);
> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> > +
> > +    if (!cpu->cfg.ext_sscofpmf) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >   static RISCVException any(CPURISCVState *env, int csrno)
> >   {
> >       return RISCV_EXCP_NONE;
> > @@ -663,9 +678,39 @@ static int read_mhpmevent(CPURISCVState *env, int
> csrno, target_ulong *val)
> >   static int write_mhpmevent(CPURISCVState *env, int csrno, target_ulon=
g
> val)
> >   {
> >       int evt_index =3D csrno - CSR_MCOUNTINHIBIT;
> > +    uint64_t mhpmevt_val =3D val;
> >
> >       env->mhpmevent_val[evt_index] =3D val;
> >
> > +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> > +        mhpmevt_val =3D mhpmevt_val |
> > +                      ((uint64_t)env->mhpmeventh_val[evt_index] << 32)=
;
> > +    }
> > +    riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int read_mhpmeventh(CPURISCVState *env, int csrno, target_ulong
> *val)
> > +{
> > +    int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;
> > +
> > +    *val =3D env->mhpmeventh_val[evt_index];
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static int write_mhpmeventh(CPURISCVState *env, int csrno, target_ulon=
g
> val)
> > +{
> > +    int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;
> > +    uint64_t mhpmevth_val =3D val;
> > +    uint64_t mhpmevt_val =3D env->mhpmevent_val[evt_index];
> > +
> > +    mhpmevt_val =3D mhpmevt_val | (mhpmevth_val << 32);
> > +    env->mhpmeventh_val[evt_index] =3D val;
> > +
> > +    riscv_pmu_update_event_map(env, mhpmevt_val, evt_index);
> > +
> >       return RISCV_EXCP_NONE;
> >   }
> >
> > @@ -673,12 +718,20 @@ static int write_mhpmcounter(CPURISCVState *env,
> int csrno, target_ulong val)
> >   {
> >       int ctr_idx =3D csrno - CSR_MCYCLE;
> >       PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> > +    uint64_t mhpmctr_val =3D val;
> >
> >       counter->mhpmcounter_val =3D val;
> >       if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> >           riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> >           counter->mhpmcounter_prev =3D get_ticks(false);
> > -    } else {
> > +        if (ctr_idx > 2) {
> > +            if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> > +                mhpmctr_val =3D mhpmctr_val |
> > +                              ((uint64_t)counter->mhpmcounterh_val <<
> 32);
> > +            }
> > +            riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
> > +        }
> > +     } else {
> >           /* Other counters can keep incrementing from the given value =
*/
> >           counter->mhpmcounter_prev =3D val;
> >       }
> > @@ -690,11 +743,17 @@ static int write_mhpmcounterh(CPURISCVState *env,
> int csrno, target_ulong val)
> >   {
> >       int ctr_idx =3D csrno - CSR_MCYCLEH;
> >       PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> > +    uint64_t mhpmctr_val =3D counter->mhpmcounter_val;
> > +    uint64_t mhpmctrh_val =3D val;
> >
> >       counter->mhpmcounterh_val =3D val;
> > +    mhpmctr_val =3D mhpmctr_val | (mhpmctrh_val << 32);
> >       if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> >           riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> >           counter->mhpmcounterh_prev =3D get_ticks(true);
> > +        if (ctr_idx > 2) {
> > +            riscv_pmu_setup_timer(env, mhpmctr_val, ctr_idx);
> > +        }
> >       } else {
> >           counter->mhpmcounterh_prev =3D val;
> >       }
> > @@ -770,6 +829,32 @@ static int read_hpmcounterh(CPURISCVState *env, in=
t
> csrno, target_ulong *val)
> >       return riscv_pmu_read_ctr(env, val, true, ctr_index);
> >   }
> >
> > +static int read_scountovf(CPURISCVState *env, int csrno, target_ulong
> *val)
> > +{
> > +    int mhpmevt_start =3D CSR_MHPMEVENT3 - CSR_MCOUNTINHIBIT;
> > +    int i;
> > +    *val =3D 0;
> > +    target_ulong *mhpm_evt_val;
> > +    uint64_t of_bit_mask;
> > +
> > +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> > +        mhpm_evt_val =3D env->mhpmeventh_val;
> > +        of_bit_mask =3D MHPMEVENTH_BIT_OF;
> > +    } else {
> > +        mhpm_evt_val =3D env->mhpmevent_val;
> > +        of_bit_mask =3D MHPMEVENT_BIT_OF;
> > +    }
> > +
> > +    for (i =3D mhpmevt_start; i < RV_MAX_MHPMEVENTS; i++) {
> > +        if ((get_field(env->mcounteren, BIT(i))) &&
> > +            (mhpm_evt_val[i] & of_bit_mask)) {
> > +                    *val |=3D BIT(i);
> > +            }
> > +    }
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >   static RISCVException read_time(CPURISCVState *env, int csrno,
> >                                   target_ulong *val)
> >   {
> > @@ -799,7 +884,8 @@ static RISCVException read_timeh(CPURISCVState *env=
,
> int csrno,
> >   /* Machine constants */
> >
> >   #define M_MODE_INTERRUPTS  ((uint64_t)(MIP_MSIP | MIP_MTIP | MIP_MEIP=
))
> > -#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP)=
)
> > +#define S_MODE_INTERRUPTS  ((uint64_t)(MIP_SSIP | MIP_STIP | MIP_SEIP =
|
> \
> > +                                      MIP_LCOFIP))
>
> It's better to align with MIP_SSIP here.
>
> >   #define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VSTIP |
> MIP_VSEIP))
> >   #define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE_INTERRUPTS=
))
> >
> > @@ -840,7 +926,8 @@ static const target_ulong vs_delegable_excps =3D
> DELEGABLE_EXCPS &
> >   static const target_ulong sstatus_v1_10_mask =3D SSTATUS_SIE |
> SSTATUS_SPIE |
> >       SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_X=
S
> |
> >       SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
> > -static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP |
> MIP_UEIP;
> > +static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP |
> MIP_UEIP |
> > +                                              SIP_LCOFIP;
> >   static const target_ulong hip_writable_mask =3D MIP_VSSIP;
> >   static const target_ulong hvip_writable_mask =3D MIP_VSSIP | MIP_VSTI=
P |
> MIP_VSEIP;
> >   static const target_ulong vsip_writable_mask =3D MIP_VSSIP;
> > @@ -3861,6 +3948,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >       [CSR_MHPMEVENT31]    =3D { "mhpmevent31",    any,    read_mhpmeve=
nt,
> >                                                          write_mhpmeven=
t
> },
> >
> > +    [CSR_MHPMEVENT3H]    =3D { "mhpmevent3h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
>
> The new lines have been updated to align with the last line in my
> previous patchset(accepted).
>
> you can see it if rebase to  riscv-to-apply.next. So it's better to make
> write_mhpmeventh align with
>
> ' " '.  The same to following new lines.
>
>
Got it. Rebased it. But I aligned them '{' with CSR_HPMCOUNTER3H onwards.
We probably should align CSR_MHPMEVENT3..CSR_MHPMEVENT31 accordingly as
well.


> Regards,
>
> Weiwei Li
>
> > +    [CSR_MHPMEVENT4H]    =3D { "mhpmevent4h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT5H]    =3D { "mhpmevent5h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT6H]    =3D { "mhpmevent6h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT7H]    =3D { "mhpmevent7h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT8H]    =3D { "mhpmevent8h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT9H]    =3D { "mhpmevent9h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT10H]   =3D { "mhpmevent10h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT11H]   =3D { "mhpmevent11h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT12H]   =3D { "mhpmevent12h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT13H]   =3D { "mhpmevent13h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT14H]   =3D { "mhpmevent14h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT15H]   =3D { "mhpmevent15h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT16H]   =3D { "mhpmevent16h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT17H]   =3D { "mhpmevent17h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT18H]   =3D { "mhpmevent18h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT19H]   =3D { "mhpmevent19h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT20H]   =3D { "mhpmevent20h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT21H]   =3D { "mhpmevent21h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT22H]   =3D { "mhpmevent22h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT23H]   =3D { "mhpmevent23h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT24H]   =3D { "mhpmevent24h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT25H]   =3D { "mhpmevent25h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT26H]   =3D { "mhpmevent26h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT27H]   =3D { "mhpmevent27h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT28H]   =3D { "mhpmevent28h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT29H]   =3D { "mhpmevent29h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT30H]   =3D { "mhpmevent30h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +    [CSR_MHPMEVENT31H]   =3D { "mhpmevent31h",    sscofpmf,
> read_mhpmeventh,
> > +
>  write_mhpmeventh},
> > +
> >       [CSR_HPMCOUNTER3H]   =3D { "hpmcounter3h",   ctr32,
> read_hpmcounterh },
> >       [CSR_HPMCOUNTER4H]   =3D { "hpmcounter4h",   ctr32,
> read_hpmcounterh },
> >       [CSR_HPMCOUNTER5H]   =3D { "hpmcounter5h",   ctr32,
> read_hpmcounterh },
> > @@ -3949,5 +4095,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D =
{
> >
> write_mhpmcounterh },
> >       [CSR_MHPMCOUNTER31H] =3D { "mhpmcounter31h", mctr32,
> read_hpmcounterh,
> >
> write_mhpmcounterh },
> > +    [CSR_SCOUNTOVF]      =3D { "scountovf", sscofpmf,  read_scountovf =
},
> > +
> >   #endif /* !CONFIG_USER_ONLY */
> >   };
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index dc182ca81119..33ef9b8e9908 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -355,6 +355,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
> >           VMSTATE_STRUCT_ARRAY(env.pmu_ctrs, RISCVCPU,
> RV_MAX_MHPMCOUNTERS, 0,
> >                                vmstate_pmu_ctr_state, PMUCTRState),
> >           VMSTATE_UINTTL_ARRAY(env.mhpmevent_val, RISCVCPU,
> RV_MAX_MHPMEVENTS),
> > +        VMSTATE_UINTTL_ARRAY(env.mhpmeventh_val, RISCVCPU,
> RV_MAX_MHPMEVENTS),
> >           VMSTATE_UINTTL(env.sscratch, RISCVCPU),
> >           VMSTATE_UINTTL(env.mscratch, RISCVCPU),
> >           VMSTATE_UINT64(env.mfromhost, RISCVCPU),
> > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > index 000fe8da45ef..34096941c0ce 100644
> > --- a/target/riscv/pmu.c
> > +++ b/target/riscv/pmu.c
> > @@ -19,14 +19,367 @@
> >   #include "qemu/osdep.h"
> >   #include "cpu.h"
> >   #include "pmu.h"
> > +#include "sysemu/cpu-timers.h"
> > +
> > +#define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
> > +#define MAKE_32BIT_MASK(shift, length) \
> > +        (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
> > +
> > +static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
> > +{
> > +    if (ctr_idx < 3 || ctr_idx >=3D RV_MAX_MHPMCOUNTERS ||
> > +        !(cpu->pmu_avail_ctrs & BIT(ctr_idx))) {
> > +        return false;
> > +    } else {
> > +        return true;
> > +    }
> > +}
> > +
> > +static bool riscv_pmu_counter_enabled(RISCVCPU *cpu, uint32_t ctr_idx)
> > +{
> > +    CPURISCVState *env =3D &cpu->env;
> > +
> > +    if (riscv_pmu_counter_valid(cpu, ctr_idx) &&
> > +        !get_field(env->mcountinhibit, BIT(ctr_idx))) {
> > +        return true;
> > +    } else {
> > +        return false;
> > +    }
> > +}
> > +
> > +static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)
> > +{
> > +    CPURISCVState *env =3D &cpu->env;
> > +    target_ulong max_val =3D UINT32_MAX;
> > +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> > +    bool virt_on =3D riscv_cpu_virt_enabled(env);
> > +
> > +    /* Privilege mode filtering */
> > +    if ((env->priv =3D=3D PRV_M &&
> > +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_MINH)) ||
> > +        (env->priv =3D=3D PRV_S && virt_on &&
> > +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_VSINH)) ||
> > +        (env->priv =3D=3D PRV_U && virt_on &&
> > +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_VUINH)) ||
> > +        (env->priv =3D=3D PRV_S && !virt_on &&
> > +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_SINH)) ||
> > +        (env->priv =3D=3D PRV_U && !virt_on &&
> > +        (env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_UINH))) {
> > +        return 0;
> > +    }
> > +
> > +    /* Handle the overflow scenario */
> > +    if (counter->mhpmcounter_val =3D=3D max_val) {
> > +        if (counter->mhpmcounterh_val =3D=3D max_val) {
> > +            counter->mhpmcounter_val =3D 0;
> > +            counter->mhpmcounterh_val =3D 0;
> > +            /* Generate interrupt only if OF bit is clear */
> > +            if (!(env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_OF)) {
> > +                env->mhpmeventh_val[ctr_idx] |=3D MHPMEVENTH_BIT_OF;
> > +                riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1))=
;
> > +            }
> > +        } else {
> > +            counter->mhpmcounterh_val++;
> > +        }
> > +    } else {
> > +        counter->mhpmcounter_val++;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uint32_t ctr_idx)
> > +{
> > +    CPURISCVState *env =3D &cpu->env;
> > +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> > +    uint64_t max_val =3D UINT64_MAX;
> > +    bool virt_on =3D riscv_cpu_virt_enabled(env);
> > +
> > +    /* Privilege mode filtering */
> > +    if ((env->priv =3D=3D PRV_M &&
> > +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_MINH)) ||
> > +        (env->priv =3D=3D PRV_S && virt_on &&
> > +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_VSINH)) ||
> > +        (env->priv =3D=3D PRV_U && virt_on &&
> > +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_VUINH)) ||
> > +        (env->priv =3D=3D PRV_S && !virt_on &&
> > +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_SINH)) ||
> > +        (env->priv =3D=3D PRV_U && !virt_on &&
> > +        (env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_UINH))) {
> > +        return 0;
> > +    }
> > +
> > +    /* Handle the overflow scenario */
> > +    if (counter->mhpmcounter_val =3D=3D max_val) {
> > +        counter->mhpmcounter_val =3D 0;
> > +        /* Generate interrupt only if OF bit is clear */
> > +        if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
> > +            env->mhpmevent_val[ctr_idx] |=3D MHPMEVENT_BIT_OF;
> > +            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> > +        }
> > +    } else {
> > +        counter->mhpmcounter_val++;
> > +    }
> > +    return 0;
> > +}
> > +
> > +int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx
> event_idx)
> > +{
> > +    uint32_t ctr_idx;
> > +    int ret;
> > +    CPURISCVState *env =3D &cpu->env;
> > +    gpointer value;
> > +
> > +    value =3D g_hash_table_lookup(cpu->pmu_event_ctr_map,
> > +                                GUINT_TO_POINTER(event_idx));
> > +    if (!value) {
> > +        return -1;
> > +    }
> > +
> > +    ctr_idx =3D GPOINTER_TO_UINT(value);
> > +    if (!riscv_pmu_counter_enabled(cpu, ctr_idx) ||
> > +        get_field(env->mcountinhibit, BIT(ctr_idx))) {
> > +        return -1;
> > +    }
> > +
> > +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> > +        ret =3D riscv_pmu_incr_ctr_rv32(cpu, ctr_idx);
> > +    } else {
> > +        ret =3D riscv_pmu_incr_ctr_rv64(cpu, ctr_idx);
> > +    }
> > +
> > +    return ret;
> > +}
> >
> >   bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env,
> >                                           uint32_t target_ctr)
> >   {
> > -    return (target_ctr =3D=3D 0) ? true : false;
> > +    RISCVCPU *cpu;
> > +    uint32_t event_idx;
> > +    uint32_t ctr_idx;
> > +
> > +    /* Fixed instret counter */
> > +    if (target_ctr =3D=3D 2) {
> > +        return true;
> > +    }
> > +
> > +    cpu =3D RISCV_CPU(env_cpu(env));
> > +    event_idx =3D RISCV_PMU_EVENT_HW_INSTRUCTIONS;
> > +    ctr_idx =3D
> GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
> > +                               GUINT_TO_POINTER(event_idx)));
> > +    if (!ctr_idx) {
> > +        return false;
> > +    }
> > +
> > +    return target_ctr =3D=3D ctr_idx ? true : false;
> >   }
> >
> >   bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint32_t
> target_ctr)
> >   {
> > -    return (target_ctr =3D=3D 2) ? true : false;
> > +    RISCVCPU *cpu;
> > +    uint32_t event_idx;
> > +    uint32_t ctr_idx;
> > +
> > +    /* Fixed mcycle counter */
> > +    if (target_ctr =3D=3D 0) {
> > +        return true;
> > +    }
> > +
> > +    cpu =3D RISCV_CPU(env_cpu(env));
> > +    event_idx =3D RISCV_PMU_EVENT_HW_CPU_CYCLES;
> > +    ctr_idx =3D
> GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
> > +                               GUINT_TO_POINTER(event_idx)));
> > +
> > +    /* Counter zero is not used for event_ctr_map */
> > +    if (!ctr_idx) {
> > +        return false;
> > +    }
> > +
> > +    return (target_ctr =3D=3D ctr_idx) ? true : false;
> > +}
> > +
> > +static gboolean pmu_remove_event_map(gpointer key, gpointer value,
> > +                                     gpointer udata)
> > +{
> > +    return (GPOINTER_TO_UINT(value) =3D=3D GPOINTER_TO_UINT(udata)) ? =
true
> : false;
> > +}
> > +
> > +static int64_t pmu_icount_ticks_to_ns(int64_t value)
> > +{
> > +    int64_t ret =3D 0;
> > +
> > +    if (icount_enabled()) {
> > +        ret =3D icount_to_ns(value);
> > +    } else {
> > +        ret =3D (NANOSECONDS_PER_SECOND / RISCV_TIMEBASE_FREQ) * value=
;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> > +                               uint32_t ctr_idx)
> > +{
> > +    uint32_t event_idx;
> > +    RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));
> > +
> > +    if (!riscv_pmu_counter_valid(cpu, ctr_idx)) {
> > +        return -1;
> > +    }
> > +
> > +    /**
> > +     * Expected mhpmevent value is zero for reset case. Remove the
> current
> > +     * mapping.
> > +     */
> > +    if (!value) {
> > +        g_hash_table_foreach_remove(cpu->pmu_event_ctr_map,
> > +                                    pmu_remove_event_map,
> > +                                    GUINT_TO_POINTER(ctr_idx));
> > +        return 0;
> > +    }
> > +
> > +    event_idx =3D value & MHPMEVENT_IDX_MASK;
> > +    if (g_hash_table_lookup(cpu->pmu_event_ctr_map,
> > +                            GUINT_TO_POINTER(event_idx))) {
> > +        return 0;
> > +    }
> > +
> > +    switch (event_idx) {
> > +    case RISCV_PMU_EVENT_HW_CPU_CYCLES:
> > +    case RISCV_PMU_EVENT_HW_INSTRUCTIONS:
> > +    case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:
> > +    case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:
> > +    case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:
> > +        break;
> > +    default:
> > +        /* We don't support any raw events right now */
> > +        return -1;
> > +    }
> > +    g_hash_table_insert(cpu->pmu_event_ctr_map,
> GUINT_TO_POINTER(event_idx),
> > +                        GUINT_TO_POINTER(ctr_idx));
> > +
> > +    return 0;
> > +}
> > +
> > +static void pmu_timer_trigger_irq(RISCVCPU *cpu,
> > +                                  enum riscv_pmu_event_idx evt_idx)
> > +{
> > +    uint32_t ctr_idx;
> > +    CPURISCVState *env =3D &cpu->env;
> > +    PMUCTRState *counter;
> > +    target_ulong *mhpmevent_val;
> > +    uint64_t of_bit_mask;
> > +    int64_t irq_trigger_at;
> > +
> > +    if (evt_idx !=3D RISCV_PMU_EVENT_HW_CPU_CYCLES &&
> > +        evt_idx !=3D RISCV_PMU_EVENT_HW_INSTRUCTIONS) {
> > +        return;
> > +    }
> > +
> > +    ctr_idx =3D
> GPOINTER_TO_UINT(g_hash_table_lookup(cpu->pmu_event_ctr_map,
> > +                               GUINT_TO_POINTER(evt_idx)));
> > +    if (!riscv_pmu_counter_enabled(cpu, ctr_idx)) {
> > +        return;
> > +    }
> > +
> > +    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> > +        mhpmevent_val =3D &env->mhpmeventh_val[ctr_idx];
> > +        of_bit_mask =3D MHPMEVENTH_BIT_OF;
> > +     } else {
> > +        mhpmevent_val =3D &env->mhpmevent_val[ctr_idx];
> > +        of_bit_mask =3D MHPMEVENT_BIT_OF;
> > +    }
> > +
> > +    counter =3D &env->pmu_ctrs[ctr_idx];
> > +    if (counter->irq_overflow_left > 0) {
> > +        irq_trigger_at =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> > +                        counter->irq_overflow_left;
> > +        timer_mod_anticipate_ns(cpu->pmu_timer, irq_trigger_at);
> > +        counter->irq_overflow_left =3D 0;
> > +        return;
> > +    }
> > +
> > +    if (cpu->pmu_avail_ctrs & BIT(ctr_idx)) {
> > +        /* Generate interrupt only if OF bit is clear */
> > +        if (!(*mhpmevent_val & of_bit_mask)) {
> > +            *mhpmevent_val |=3D of_bit_mask;
> > +            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> > +        }
> > +    }
> > +}
> > +
> > +/* Timer callback for instret and cycle counter overflow */
> > +void riscv_pmu_timer_cb(void *priv)
> > +{
> > +    RISCVCPU *cpu =3D priv;
> > +
> > +    /* Timer event was triggered only for these events */
> > +    pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_CPU_CYCLES);
> > +    pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_INSTRUCTIONS);
> > +}
> > +
> > +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_t
> ctr_idx)
> > +{
> > +    uint64_t overflow_delta, overflow_at;
> > +    int64_t overflow_ns, overflow_left =3D 0;
> > +    RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));
> > +    PMUCTRState *counter =3D &env->pmu_ctrs[ctr_idx];
> > +
> > +    if (!riscv_pmu_counter_valid(cpu, ctr_idx) ||
> !cpu->cfg.ext_sscofpmf) {
> > +        return -1;
> > +    }
> > +
> > +    if (value) {
> > +        overflow_delta =3D UINT64_MAX - value + 1;
> > +    } else {
> > +        overflow_delta =3D UINT64_MAX;
> > +    }
> > +
> > +    /**
> > +     * QEMU supports only int64_t timers while RISC-V counters are
> uint64_t.
> > +     * Compute the leftover and save it so that it can be reprogrammed
> again
> > +     * when timer expires.
> > +     */
> > +    if (overflow_delta > INT64_MAX) {
> > +        overflow_left =3D overflow_delta - INT64_MAX;
> > +    }
> > +
> > +    if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||
> > +        riscv_pmu_ctr_monitor_instructions(env, ctr_idx)) {
> > +        overflow_ns =3D pmu_icount_ticks_to_ns((int64_t)overflow_delta=
);
> > +        overflow_left =3D pmu_icount_ticks_to_ns(overflow_left) ;
> > +    } else {
> > +        return -1;
> > +    }
> > +    overflow_at =3D (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> overflow_ns;
> > +
> > +    if (overflow_at > INT64_MAX) {
> > +        overflow_left +=3D overflow_at - INT64_MAX;
> > +        counter->irq_overflow_left =3D overflow_left;
> > +        overflow_at =3D INT64_MAX;
> > +    }
> > +    timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
> > +
> > +    return 0;
> > +}
> > +
> > +
> > +int riscv_pmu_init(RISCVCPU *cpu, int num_counters)
> > +{
> > +    if (num_counters > (RV_MAX_MHPMCOUNTERS - 3)) {
> > +        return -1;
> > +    }
> > +
> > +    cpu->pmu_event_ctr_map =3D g_hash_table_new(g_direct_hash,
> g_direct_equal);
> > +    if (!cpu->pmu_event_ctr_map) {
> > +        /* PMU support can not be enabled */
> > +        qemu_log_mask(LOG_UNIMP, "PMU events can't be supported\n");
> > +        cpu->cfg.pmu_num =3D 0;
> > +        return -1;
> > +    }
> > +
> > +    /* Create a bitmask of available programmable counters */
> > +    cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, num_counters);
> > +
> > +    return 0;
> >   }
> > diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> > index 58a5bc3a4089..036653627f78 100644
> > --- a/target/riscv/pmu.h
> > +++ b/target/riscv/pmu.h
> > @@ -26,3 +26,10 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVStat=
e
> *env,
> >                                           uint32_t target_ctr);
> >   bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,
> >                                     uint32_t target_ctr);
> > +void riscv_pmu_timer_cb(void *priv);
> > +int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
> > +int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> > +                               uint32_t ctr_idx);
> > +int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx
> event_idx);
> > +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
> > +                          uint32_t ctr_idx);
>
>

--000000000000b2c20405e4d02826
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 1:11 AM Weiwe=
i Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn">liweiwei@iscas.ac.cn</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2022/7/27 =E4=B8=8B=E5=8D=882:49, Atish Patra =E5=86=99=E9=81=93:=
<br>
&gt; The Sscofpmf (&#39;Ss&#39; for Privileged arch and Supervisor-level ex=
tensions,<br>
&gt; and &#39;cofpmf&#39; for Count OverFlow and Privilege Mode Filtering)<=
br>
&gt; extension allows the perf to handle overflow interrupts and filtering<=
br>
&gt; support. This patch provides a framework for programmable<br>
&gt; counters to leverage the extension. As the extension doesn&#39;t have =
any<br>
&gt; provision for the overflow bit for fixed counters, the fixed events<br=
>
&gt; can also be monitoring using programmable counters. The underlying<br>
&gt; counters for cycle and instruction counters are always running. Thus,<=
br>
&gt; a separate timer device is programmed to handle the overflow.<br>
&gt;<br>
&gt; Tested-by: Heiko Stuebner &lt;<a href=3D"mailto:heiko@sntech.de" targe=
t=3D"_blank">heiko@sntech.de</a>&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" =
target=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 ++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 25 +++<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu_bits.h |=C2=A0 55 +++++++<br>
&gt;=C2=A0 =C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 | 166 +++++++++++++=
+++++-<br>
&gt;=C2=A0 =C2=A0target/riscv/machine.c=C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0target/riscv/pmu.c=C2=A0 =C2=A0 =C2=A0 | 357 +++++++++++++=
++++++++++++++++++++++++++-<br>
&gt;=C2=A0 =C2=A0target/riscv/pmu.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<b=
r>
&gt;=C2=A0 =C2=A07 files changed, 611 insertions(+), 11 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 1bb3973806d2..c1d62b81a725 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -22,6 +22,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/ctype.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;cpu.h&quot;<br>
&gt; +#include &quot;pmu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;internals.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;exec/exec-all.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qapi/error.h&quot;<br>
&gt; @@ -779,6 +780,15 @@ static void riscv_cpu_realize(DeviceState *dev, E=
rror **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_misa(env, env-&gt;misa_mxl=
, ext);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 if (cpu-&gt;cfg.pmu_num) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!riscv_pmu_init(cpu, cpu-&gt;cfg.pmu_=
num) &amp;&amp; cpu-&gt;cfg.ext_sscofpmf) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;pmu_timer =3D timer=
_new_ns(QEMU_CLOCK_VIRTUAL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 riscv_pmu_timer_cb, cpu);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_cpu_register_gdb_regs_for_features(cs)=
;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_init_vcpu(cs);<br>
&gt; @@ -883,6 +893,7 @@ static Property riscv_cpu_extensions[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;v&quot;, RISCVCPU, cf=
g.ext_v, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;h&quot;, RISCVCPU, cf=
g.ext_h, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT8(&quot;pmu-num&quot;, RISCV=
CPU, cfg.pmu_num, 16),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;sscofpmf&quot;, RISCVCPU, cfg.ex=
t_sscofpmf, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCV=
CPU, cfg.ext_ifencei, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU=
, cfg.ext_icsr, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zfh&quot;, RISCVCPU, =
cfg.ext_zfh, false),<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 5c7acc055ac9..2222db193c3d 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -137,6 +137,8 @@ typedef struct PMUCTRState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Snapshort value of a counter in RV32 */<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong mhpmcounterh_prev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool started;<br>
&gt; +=C2=A0 =C2=A0 /* Value beyond UINT32_MAX/UINT64_MAX before overflow i=
nterrupt trigger */<br>
&gt; +=C2=A0 =C2=A0 target_ulong irq_overflow_left;<br>
&gt;=C2=A0 =C2=A0} PMUCTRState;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0struct CPUArchState {<br>
&gt; @@ -297,6 +299,9 @@ struct CPUArchState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* PMU event selector configured values. Fir=
st three are unused*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong mhpmevent_val[RV_MAX_MHPMEVENTS=
];<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /* PMU event selector configured values for RV32*/<br>
&gt; +=C2=A0 =C2=A0 target_ulong mhpmeventh_val[RV_MAX_MHPMEVENTS];<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong sscratch;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong mscratch;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -433,6 +438,7 @@ struct RISCVCPUConfig {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_zve32f;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_zve64f;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_zmmul;<br>
&gt; +=C2=A0 =C2=A0 bool ext_sscofpmf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool rvv_ta_all_1s;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t mvendorid;<br>
&gt; @@ -479,6 +485,12 @@ struct ArchCPU {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Configuration Settings */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPUConfig cfg;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 QEMUTimer *pmu_timer;<br>
&gt; +=C2=A0 =C2=A0 /* A bitmask of Available programmable counters */<br>
&gt; +=C2=A0 =C2=A0 uint32_t pmu_avail_ctrs;<br>
&gt; +=C2=A0 =C2=A0 /* Mapping of events to counters */<br>
&gt; +=C2=A0 =C2=A0 GHashTable *pmu_event_ctr_map;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static inline int riscv_has_ext(CPURISCVState *env, target=
_ulong ext)<br>
&gt; @@ -738,6 +750,19 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CSR_TABLE_SIZE =3D 0x1000<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/**<br>
&gt; + * The event id are encoded based on the encoding specified in the<br=
>
&gt; + * SBI specification v0.3<br>
&gt; + */<br>
&gt; +<br>
&gt; +enum riscv_pmu_event_idx {<br>
&gt; +=C2=A0 =C2=A0 RISCV_PMU_EVENT_HW_CPU_CYCLES =3D 0x01,<br>
&gt; +=C2=A0 =C2=A0 RISCV_PMU_EVENT_HW_INSTRUCTIONS =3D 0x02,<br>
&gt; +=C2=A0 =C2=A0 RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS =3D 0x10019,<br>
&gt; +=C2=A0 =C2=A0 RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS =3D 0x1001B,<br>
&gt; +=C2=A0 =C2=A0 RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS =3D 0x10021,<b=
r>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* CSR function table */<br>
&gt;=C2=A0 =C2=A0extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
&gt; index 6be5a9e9f046..b63c586be563 100644<br>
&gt; --- a/target/riscv/cpu_bits.h<br>
&gt; +++ b/target/riscv/cpu_bits.h<br>
&gt; @@ -382,6 +382,37 @@<br>
&gt;=C2=A0 =C2=A0#define CSR_MHPMEVENT29=C2=A0 =C2=A0 =C2=A00x33d<br>
&gt;=C2=A0 =C2=A0#define CSR_MHPMEVENT30=C2=A0 =C2=A0 =C2=A00x33e<br>
&gt;=C2=A0 =C2=A0#define CSR_MHPMEVENT31=C2=A0 =C2=A0 =C2=A00x33f<br>
&gt; +<br>
&gt; +#define CSR_MHPMEVENT3H=C2=A0 =C2=A0 =C2=A00x723<br>
&gt; +#define CSR_MHPMEVENT4H=C2=A0 =C2=A0 =C2=A00x724<br>
&gt; +#define CSR_MHPMEVENT5H=C2=A0 =C2=A0 =C2=A00x725<br>
&gt; +#define CSR_MHPMEVENT6H=C2=A0 =C2=A0 =C2=A00x726<br>
&gt; +#define CSR_MHPMEVENT7H=C2=A0 =C2=A0 =C2=A00x727<br>
&gt; +#define CSR_MHPMEVENT8H=C2=A0 =C2=A0 =C2=A00x728<br>
&gt; +#define CSR_MHPMEVENT9H=C2=A0 =C2=A0 =C2=A00x729<br>
&gt; +#define CSR_MHPMEVENT10H=C2=A0 =C2=A0 0x72a<br>
&gt; +#define CSR_MHPMEVENT11H=C2=A0 =C2=A0 0x72b<br>
&gt; +#define CSR_MHPMEVENT12H=C2=A0 =C2=A0 0x72c<br>
&gt; +#define CSR_MHPMEVENT13H=C2=A0 =C2=A0 0x72d<br>
&gt; +#define CSR_MHPMEVENT14H=C2=A0 =C2=A0 0x72e<br>
&gt; +#define CSR_MHPMEVENT15H=C2=A0 =C2=A0 0x72f<br>
&gt; +#define CSR_MHPMEVENT16H=C2=A0 =C2=A0 0x730<br>
&gt; +#define CSR_MHPMEVENT17H=C2=A0 =C2=A0 0x731<br>
&gt; +#define CSR_MHPMEVENT18H=C2=A0 =C2=A0 0x732<br>
&gt; +#define CSR_MHPMEVENT19H=C2=A0 =C2=A0 0x733<br>
&gt; +#define CSR_MHPMEVENT20H=C2=A0 =C2=A0 0x734<br>
&gt; +#define CSR_MHPMEVENT21H=C2=A0 =C2=A0 0x735<br>
&gt; +#define CSR_MHPMEVENT22H=C2=A0 =C2=A0 0x736<br>
&gt; +#define CSR_MHPMEVENT23H=C2=A0 =C2=A0 0x737<br>
&gt; +#define CSR_MHPMEVENT24H=C2=A0 =C2=A0 0x738<br>
&gt; +#define CSR_MHPMEVENT25H=C2=A0 =C2=A0 0x739<br>
&gt; +#define CSR_MHPMEVENT26H=C2=A0 =C2=A0 0x73a<br>
&gt; +#define CSR_MHPMEVENT27H=C2=A0 =C2=A0 0x73b<br>
&gt; +#define CSR_MHPMEVENT28H=C2=A0 =C2=A0 0x73c<br>
&gt; +#define CSR_MHPMEVENT29H=C2=A0 =C2=A0 0x73d<br>
&gt; +#define CSR_MHPMEVENT30H=C2=A0 =C2=A0 0x73e<br>
&gt; +#define CSR_MHPMEVENT31H=C2=A0 =C2=A0 0x73f<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#define CSR_MHPMCOUNTER3H=C2=A0 =C2=A00xb83<br>
&gt;=C2=A0 =C2=A0#define CSR_MHPMCOUNTER4H=C2=A0 =C2=A00xb84<br>
&gt;=C2=A0 =C2=A0#define CSR_MHPMCOUNTER5H=C2=A0 =C2=A00xb85<br>
&gt; @@ -443,6 +474,7 @@<br>
&gt;=C2=A0 =C2=A0#define CSR_VSMTE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x2c0<br>
&gt;=C2=A0 =C2=A0#define CSR_VSPMMASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x2c1<br>
&gt;=C2=A0 =C2=A0#define CSR_VSPMBASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x2c2<br>
&gt; +#define CSR_SCOUNTOVF=C2=A0 =C2=A0 =C2=A0 =C2=A00xda0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* Crypto Extension */<br>
&gt;=C2=A0 =C2=A0#define CSR_SEED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x015<br>
&gt; @@ -620,6 +652,7 @@ typedef enum RISCVException {<br>
&gt;=C2=A0 =C2=A0#define IRQ_VS_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010<br>
&gt;=C2=A0 =C2=A0#define IRQ_M_EXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 11<br>
&gt;=C2=A0 =C2=A0#define IRQ_S_GEXT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012<br>
&gt; +#define IRQ_PMU_OVF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 13<br>
&gt;=C2=A0 =C2=A0#define IRQ_LOCAL_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 16<br>
&gt;=C2=A0 =C2=A0#define IRQ_LOCAL_GUEST_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 (TARGET_LONG_BITS - 1)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -637,11 +670,13 @@ typedef enum RISCVException {<br>
&gt;=C2=A0 =C2=A0#define MIP_VSEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; IRQ_VS_EXT)<b=
r>
&gt;=C2=A0 =C2=A0#define MIP_MEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_M_EX=
T)<br>
&gt;=C2=A0 =C2=A0#define MIP_SGEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; IRQ_S_GEXT)<b=
r>
&gt; +#define MIP_LCOFIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_PMU_OVF)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* sip masks */<br>
&gt;=C2=A0 =C2=A0#define SIP_SSIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIP_SSIP<br>
&gt;=C2=A0 =C2=A0#define SIP_STIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIP_STIP<br>
&gt;=C2=A0 =C2=A0#define SIP_SEIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIP_SEIP<br>
&gt; +#define SIP_LCOFIP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIP_LCOFIP<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0/* MIE masks */<br>
&gt;=C2=A0 =C2=A0#define MIE_SEIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_S_EX=
T)<br>
&gt; @@ -795,4 +830,24 @@ typedef enum RISCVException {<br>
&gt;=C2=A0 =C2=A0#define SEED_OPST_WAIT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0b01 &lt;&lt; 30)<br>
&gt;=C2=A0 =C2=A0#define SEED_OPST_ES16=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0b10 &lt;&lt; 30)<br>
&gt;=C2=A0 =C2=A0#define SEED_OPST_DEAD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0b11 &lt;&lt; 30)<br>
&gt; +/* PMU related bits */<br>
&gt; +#define MIE_LCOFIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; IRQ_PMU_OVF)<br>
&gt; +<br>
&gt; +#define MHPMEVENT_BIT_OF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0BIT_ULL(63)<br>
&gt; +#define MHPMEVENTH_BIT_OF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 BIT(31)<br>
&gt; +#define MHPMEVENT_BIT_MINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0BIT_ULL(62)<br>
&gt; +#define MHPMEVENTH_BIT_MINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BIT(30)<br>
&gt; +#define MHPMEVENT_BIT_SINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0BIT_ULL(61)<br>
&gt; +#define MHPMEVENTH_BIT_SINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BIT(29)<br>
&gt; +#define MHPMEVENT_BIT_UINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0BIT_ULL(60)<br>
&gt; +#define MHPMEVENTH_BIT_UINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BIT(28)<br>
&gt; +#define MHPMEVENT_BIT_VSINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BIT_ULL(59)<br>
&gt; +#define MHPMEVENTH_BIT_VSINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0BIT(27)<br>
&gt; +#define MHPMEVENT_BIT_VUINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BIT_ULL(58)<br>
&gt; +#define MHPMEVENTH_BIT_VUINH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0BIT(26)<br>
&gt; +<br>
&gt; +#define MHPMEVENT_SSCOF_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0_ULL(0xFFFF000000000000)<br>
&gt; +#define MHPMEVENT_IDX_MASK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00xFFFFF<br>
&gt; +#define MHPMEVENT_SSCOF_RESVD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 16<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
&gt; index 235f2a011e70..1233bfa0a726 100644<br>
&gt; --- a/target/riscv/csr.c<br>
&gt; +++ b/target/riscv/csr.c<br>
&gt; @@ -74,7 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int cs=
rno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ctr_index;<br>
&gt; -=C2=A0 =C2=A0 int base_csrno =3D CSR_HPMCOUNTER3;<br>
&gt; +=C2=A0 =C2=A0 int base_csrno =3D CSR_CYCLE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_=
RV32 ? true : false;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rv32 &amp;&amp; csrno &gt;=3D CSR_CYCLEH=
) {<br>
&gt; @@ -83,11 +83,18 @@ static RISCVException ctr(CPURISCVState *env, int =
csrno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctr_index =3D csrno - base_csrno;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if (!cpu-&gt;cfg.pmu_num || ctr_index &gt;=3D (cpu-&gt;=
cfg.pmu_num)) {<br>
&gt; +=C2=A0 =C2=A0 if ((csrno &gt;=3D CSR_CYCLE &amp;&amp; csrno &lt;=3D C=
SR_INSTRET) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (csrno &gt;=3D CSR_CYCLEH &amp;&amp; csrn=
o &lt;=3D CSR_INSTRETH)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto skip_ext_pmu_check;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ((!cpu-&gt;cfg.pmu_num || !(cpu-&gt;pmu_avail_ctrs &=
amp; BIT(ctr_index)))) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* No counter is enabled in PM=
U or the counter is out of range */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
Maybe it&#39;s better to remove !cpu-&gt;cfg.pmu_num here, not in later com=
mit.<br>
&gt; +skip_ext_pmu_check:<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (env-&gt;priv =3D=3D PRV_S) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (csrno) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CSR_CYCLE:<br>
&gt; @@ -106,7 +113,6 @@ static RISCVException ctr(CPURISCVState *env, int =
csrno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CSR_HPMCOUNTER3...CSR_HPM=
COUNTER31:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_C=
YCLE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!get_field(e=
nv-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn RISCV_EXCP_ILLEGAL_INST;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -130,7 +136,6 @@ static RISCVException ctr(CPURISCVState *env, int =
csrno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0br=
eak;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CSR_HPMCOUN=
TER3H...CSR_HPMCOUNTER31H:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D=
 csrno - CSR_CYCLEH;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (!get_field(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return RISCV_EXCP_ILLEGAL_INST;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<=
br>
&gt; @@ -160,7 +165,6 @@ static RISCVException ctr(CPURISCVState *env, int =
csrno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CSR_HPMCOUNTER3...CSR_HPM=
COUNTER31:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D csrno - CSR_C=
YCLE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!get_field(e=
nv-&gt;hcounteren, 1 &lt;&lt; ctr_index) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g=
et_field(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
&gt; @@ -188,7 +192,6 @@ static RISCVException ctr(CPURISCVState *env, int =
csrno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0br=
eak;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case CSR_HPMCOUN=
TER3H...CSR_HPMCOUNTER31H:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctr_index =3D=
 csrno - CSR_CYCLEH;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (!get_field(env-&gt;hcounteren, 1 &lt;&lt; ctr_index) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 get_field(env-&gt;mcounteren, 1 &lt;&lt; ctr_index)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;<br>
&gt; @@ -240,6 +243,18 @@ static RISCVException mctr32(CPURISCVState *env, =
int csrno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return mctr(env, csrno);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static RISCVException sscofpmf(CPURISCVState *env, int csrno)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(cs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!cpu-&gt;cfg.ext_sscofpmf) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return RISCV_EXCP_ILLEGAL_INST;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static RISCVException any(CPURISCVState *env, int csrno)<b=
r>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
&gt; @@ -663,9 +678,39 @@ static int read_mhpmevent(CPURISCVState *env, int=
 csrno, target_ulong *val)<br>
&gt;=C2=A0 =C2=A0static int write_mhpmevent(CPURISCVState *env, int csrno, =
target_ulong val)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int evt_index =3D csrno - CSR_MCOUNTINHIBIT;=
<br>
&gt; +=C2=A0 =C2=A0 uint64_t mhpmevt_val =3D val;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mhpmevent_val[evt_index] =3D val;<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mhpmevt_val =3D mhpmevt_val |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ((uint64_t)env-&gt;mhpmeventh_val[evt_index] &lt;&lt; 32);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 riscv_pmu_update_event_map(env, mhpmevt_val, evt_index)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int read_mhpmeventh(CPURISCVState *env, int csrno, target_ulon=
g *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 *val =3D env-&gt;mhpmeventh_val[evt_index];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int write_mhpmeventh(CPURISCVState *env, int csrno, target_ulo=
ng val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int evt_index =3D csrno - CSR_MHPMEVENT3H + 3;<br>
&gt; +=C2=A0 =C2=A0 uint64_t mhpmevth_val =3D val;<br>
&gt; +=C2=A0 =C2=A0 uint64_t mhpmevt_val =3D env-&gt;mhpmevent_val[evt_inde=
x];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 mhpmevt_val =3D mhpmevt_val | (mhpmevth_val &lt;&lt; 32=
);<br>
&gt; +=C2=A0 =C2=A0 env-&gt;mhpmeventh_val[evt_index] =3D val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 riscv_pmu_update_event_map(env, mhpmevt_val, evt_index)=
;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return RISCV_EXCP_NONE;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -673,12 +718,20 @@ static int write_mhpmcounter(CPURISCVState *env,=
 int csrno, target_ulong val)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ctr_idx =3D csrno - CSR_MCYCLE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PMUCTRState *counter =3D &amp;env-&gt;pmu_ct=
rs[ctr_idx];<br>
&gt; +=C2=A0 =C2=A0 uint64_t mhpmctr_val =3D val;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounter_val =3D val;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_pmu_ctr_monitor_cycles(env, ctr_id=
x) ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_pmu_ctr_monitor_instruct=
ions(env, ctr_idx)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounter_prev =
=3D get_ticks(false);<br>
&gt; -=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctr_idx &gt; 2) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=
=3D MXL_RV32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mhpmctr_val =
=3D mhpmctr_val |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)counter-&gt;mhpmcounterh_val=
 &lt;&lt; 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_setup_timer(env, =
mhpmctr_val, ctr_idx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Other counters can keep inc=
rementing from the given value */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounter_prev =
=3D val;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -690,11 +743,17 @@ static int write_mhpmcounterh(CPURISCVState *env=
, int csrno, target_ulong val)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ctr_idx =3D csrno - CSR_MCYCLEH;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PMUCTRState *counter =3D &amp;env-&gt;pmu_ct=
rs[ctr_idx];<br>
&gt; +=C2=A0 =C2=A0 uint64_t mhpmctr_val =3D counter-&gt;mhpmcounter_val;<b=
r>
&gt; +=C2=A0 =C2=A0 uint64_t mhpmctrh_val =3D val;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounterh_val =3D val;<br>
&gt; +=C2=A0 =C2=A0 mhpmctr_val =3D mhpmctr_val | (mhpmctrh_val &lt;&lt; 32=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (riscv_pmu_ctr_monitor_cycles(env, ctr_id=
x) ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0riscv_pmu_ctr_monitor_instruct=
ions(env, ctr_idx)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounterh_prev =
=3D get_ticks(true);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctr_idx &gt; 2) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_setup_timer(env, =
mhpmctr_val, ctr_idx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0counter-&gt;mhpmcounterh_prev =
=3D val;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -770,6 +829,32 @@ static int read_hpmcounterh(CPURISCVState *env, i=
nt csrno, target_ulong *val)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return riscv_pmu_read_ctr(env, val, true, ct=
r_index);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static int read_scountovf(CPURISCVState *env, int csrno, target_ulong=
 *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int mhpmevt_start =3D CSR_MHPMEVENT3 - CSR_MCOUNTINHIBI=
T;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 *val =3D 0;<br>
&gt; +=C2=A0 =C2=A0 target_ulong *mhpm_evt_val;<br>
&gt; +=C2=A0 =C2=A0 uint64_t of_bit_mask;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mhpm_evt_val =3D env-&gt;mhpmeventh_val;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_bit_mask =3D MHPMEVENTH_BIT_OF;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mhpm_evt_val =3D env-&gt;mhpmevent_val;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_bit_mask =3D MHPMEVENT_BIT_OF;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D mhpmevt_start; i &lt; RV_MAX_MHPMEVENTS; i++=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((get_field(env-&gt;mcounteren, BIT(i)=
)) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (mhpm_evt_val[i] &amp; of_b=
it_mask)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 *val |=3D BIT(i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return RISCV_EXCP_NONE;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static RISCVException read_time(CPURISCVState *env, int cs=
rno,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong *val)<b=
r>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -799,7 +884,8 @@ static RISCVException read_timeh(CPURISCVState *en=
v, int csrno,<br>
&gt;=C2=A0 =C2=A0/* Machine constants */<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#define M_MODE_INTERRUPTS=C2=A0 ((uint64_t)(MIP_MSIP | MIP=
_MTIP | MIP_MEIP))<br>
&gt; -#define S_MODE_INTERRUPTS=C2=A0 ((uint64_t)(MIP_SSIP | MIP_STIP | MIP=
_SEIP))<br>
&gt; +#define S_MODE_INTERRUPTS=C2=A0 ((uint64_t)(MIP_SSIP | MIP_STIP | MIP=
_SEIP | \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIP_LCOFIP)=
)<br>
<br>
It&#39;s better to align with MIP_SSIP here.<br>
<br>
&gt;=C2=A0 =C2=A0#define VS_MODE_INTERRUPTS ((uint64_t)(MIP_VSSIP | MIP_VST=
IP | MIP_VSEIP))<br>
&gt;=C2=A0 =C2=A0#define HS_MODE_INTERRUPTS ((uint64_t)(MIP_SGEIP | VS_MODE=
_INTERRUPTS))<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -840,7 +926,8 @@ static const target_ulong vs_delegable_excps =3D D=
ELEGABLE_EXCPS &amp;<br>
&gt;=C2=A0 =C2=A0static const target_ulong sstatus_v1_10_mask =3D SSTATUS_S=
IE | SSTATUS_SPIE |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | S=
STATUS_FS | SSTATUS_XS |<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;<br>
&gt; -static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP |=
 MIP_UEIP;<br>
&gt; +static const target_ulong sip_writable_mask =3D SIP_SSIP | MIP_USIP |=
 MIP_UEIP |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 SIP_LCOFIP;<br>
&gt;=C2=A0 =C2=A0static const target_ulong hip_writable_mask =3D MIP_VSSIP;=
<br>
&gt;=C2=A0 =C2=A0static const target_ulong hvip_writable_mask =3D MIP_VSSIP=
 | MIP_VSTIP | MIP_VSEIP;<br>
&gt;=C2=A0 =C2=A0static const target_ulong vsip_writable_mask =3D MIP_VSSIP=
;<br>
&gt; @@ -3861,6 +3948,65 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_MHPMEVENT31]=C2=A0 =C2=A0 =3D { &quot;m=
hpmevent31&quot;,=C2=A0 =C2=A0 any,=C2=A0 =C2=A0 read_mhpmevent,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_mhpmevent=
 },<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT3H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent3h&=
quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
<br>
The new lines have been updated to align with the last line in my <br>
previous patchset(accepted).<br>
<br>
you can see it if rebase to=C2=A0 riscv-to-apply.next. So it&#39;s better t=
o make <br>
write_mhpmeventh align with=C2=A0<br>
<br>
&#39; &quot; &#39;.=C2=A0 The same to following new lines.<br>
<br></blockquote><div><br></div><div>Got it. Rebased it. But I aligned them=
 &#39;{&#39; with=C2=A0CSR_HPMCOUNTER3H onwards.</div><div>We probably shou=
ld align CSR_MHPMEVENT3..CSR_MHPMEVENT31 accordingly as well.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
<br>
Weiwei Li<br>
<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT4H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent4h&=
quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT5H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent5h&=
quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT6H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent6h&=
quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT7H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent7h&=
quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT8H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent8h&=
quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT9H]=C2=A0 =C2=A0 =3D { &quot;mhpmevent9h&=
quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT10H]=C2=A0 =C2=A0=3D { &quot;mhpmevent10h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT11H]=C2=A0 =C2=A0=3D { &quot;mhpmevent11h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT12H]=C2=A0 =C2=A0=3D { &quot;mhpmevent12h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT13H]=C2=A0 =C2=A0=3D { &quot;mhpmevent13h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT14H]=C2=A0 =C2=A0=3D { &quot;mhpmevent14h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT15H]=C2=A0 =C2=A0=3D { &quot;mhpmevent15h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT16H]=C2=A0 =C2=A0=3D { &quot;mhpmevent16h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT17H]=C2=A0 =C2=A0=3D { &quot;mhpmevent17h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT18H]=C2=A0 =C2=A0=3D { &quot;mhpmevent18h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT19H]=C2=A0 =C2=A0=3D { &quot;mhpmevent19h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT20H]=C2=A0 =C2=A0=3D { &quot;mhpmevent20h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT21H]=C2=A0 =C2=A0=3D { &quot;mhpmevent21h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT22H]=C2=A0 =C2=A0=3D { &quot;mhpmevent22h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT23H]=C2=A0 =C2=A0=3D { &quot;mhpmevent23h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT24H]=C2=A0 =C2=A0=3D { &quot;mhpmevent24h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT25H]=C2=A0 =C2=A0=3D { &quot;mhpmevent25h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT26H]=C2=A0 =C2=A0=3D { &quot;mhpmevent26h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT27H]=C2=A0 =C2=A0=3D { &quot;mhpmevent27h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT28H]=C2=A0 =C2=A0=3D { &quot;mhpmevent28h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT29H]=C2=A0 =C2=A0=3D { &quot;mhpmevent29h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT30H]=C2=A0 =C2=A0=3D { &quot;mhpmevent30h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +=C2=A0 =C2=A0 [CSR_MHPMEVENT31H]=C2=A0 =C2=A0=3D { &quot;mhpmevent31h=
&quot;,=C2=A0 =C2=A0 sscofpmf,=C2=A0 read_mhpmeventh,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_mhpmeventh},<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_HPMCOUNTER3H]=C2=A0 =C2=A0=3D { &quot;h=
pmcounter3h&quot;,=C2=A0 =C2=A0ctr32,=C2=A0 read_hpmcounterh },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_HPMCOUNTER4H]=C2=A0 =C2=A0=3D { &quot;h=
pmcounter4h&quot;,=C2=A0 =C2=A0ctr32,=C2=A0 read_hpmcounterh },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_HPMCOUNTER5H]=C2=A0 =C2=A0=3D { &quot;h=
pmcounter5h&quot;,=C2=A0 =C2=A0ctr32,=C2=A0 read_hpmcounterh },<br>
&gt; @@ -3949,5 +4095,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_mhpmcount=
erh },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[CSR_MHPMCOUNTER31H] =3D { &quot;mhpmcounter=
31h&quot;, mctr32,=C2=A0 read_hpmcounterh,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_mhpmcount=
erh },<br>
&gt; +=C2=A0 =C2=A0 [CSR_SCOUNTOVF]=C2=A0 =C2=A0 =C2=A0 =3D { &quot;scounto=
vf&quot;, sscofpmf,=C2=A0 read_scountovf },<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#endif /* !CONFIG_USER_ONLY */<br>
&gt;=C2=A0 =C2=A0};<br>
&gt; diff --git a/target/riscv/machine.c b/target/riscv/machine.c<br>
&gt; index dc182ca81119..33ef9b8e9908 100644<br>
&gt; --- a/target/riscv/machine.c<br>
&gt; +++ b/target/riscv/machine.c<br>
&gt; @@ -355,6 +355,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_STRUCT_ARRAY(env.pmu_c=
trs, RISCVCPU, RV_MAX_MHPMCOUNTERS, 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_pmu_ctr_state, PMUCTRStat=
e),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL_ARRAY(env.mhpme=
vent_val, RISCVCPU, RV_MAX_MHPMEVENTS),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINTTL_ARRAY(env.mhpmeventh_val, =
RISCVCPU, RV_MAX_MHPMEVENTS),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.sscratch, R=
ISCVCPU),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINTTL(env.mscratch, R=
ISCVCPU),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(env.mfromhost, =
RISCVCPU),<br>
&gt; diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c<br>
&gt; index 000fe8da45ef..34096941c0ce 100644<br>
&gt; --- a/target/riscv/pmu.c<br>
&gt; +++ b/target/riscv/pmu.c<br>
&gt; @@ -19,14 +19,367 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;cpu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;pmu.h&quot;<br>
&gt; +#include &quot;sysemu/cpu-timers.h&quot;<br>
&gt; +<br>
&gt; +#define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */<br>
&gt; +#define MAKE_32BIT_MASK(shift, length) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (((uint32_t)(~0UL) &gt;&gt; (32 - (length=
))) &lt;&lt; (shift))<br>
&gt; +<br>
&gt; +static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (ctr_idx &lt; 3 || ctr_idx &gt;=3D RV_MAX_MHPMCOUNTE=
RS ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !(cpu-&gt;pmu_avail_ctrs &amp; BIT(ctr_id=
x))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool riscv_pmu_counter_enabled(RISCVCPU *cpu, uint32_t ctr_idx=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (riscv_pmu_counter_valid(cpu, ctr_idx) &amp;&amp;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 !get_field(env-&gt;mcountinhibit, BIT(ctr=
_idx))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uint32_t ctr_idx)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +=C2=A0 =C2=A0 target_ulong max_val =3D UINT32_MAX;<br>
&gt; +=C2=A0 =C2=A0 PMUCTRState *counter =3D &amp;env-&gt;pmu_ctrs[ctr_idx]=
;<br>
&gt; +=C2=A0 =C2=A0 bool virt_on =3D riscv_cpu_virt_enabled(env);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Privilege mode filtering */<br>
&gt; +=C2=A0 =C2=A0 if ((env-&gt;priv =3D=3D PRV_M &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmeventh_val[ctr_idx] &amp; MH=
PMEVENTH_BIT_MINH)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp;&amp; vir=
t_on &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmeventh_val[ctr_idx] &amp; MH=
PMEVENTH_BIT_VSINH)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_U &amp;&amp; vir=
t_on &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmeventh_val[ctr_idx] &amp; MH=
PMEVENTH_BIT_VUINH)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp;&amp; !vi=
rt_on &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmeventh_val[ctr_idx] &amp; MH=
PMEVENTH_BIT_SINH)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_U &amp;&amp; !vi=
rt_on &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmeventh_val[ctr_idx] &amp; MH=
PMEVENTH_BIT_UINH))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Handle the overflow scenario */<br>
&gt; +=C2=A0 =C2=A0 if (counter-&gt;mhpmcounter_val =3D=3D max_val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (counter-&gt;mhpmcounterh_val =3D=3D m=
ax_val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_val=
 =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounterh_va=
l =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Generate interrupt only =
if OF bit is clear */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(env-&gt;mhpmeventh_va=
l[ctr_idx] &amp; MHPMEVENTH_BIT_OF)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mhpme=
venth_val[ctr_idx] |=3D MHPMEVENTH_BIT_OF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_upd=
ate_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounterh_va=
l++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_val++;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uint32_t ctr_idx)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +=C2=A0 =C2=A0 PMUCTRState *counter =3D &amp;env-&gt;pmu_ctrs[ctr_idx]=
;<br>
&gt; +=C2=A0 =C2=A0 uint64_t max_val =3D UINT64_MAX;<br>
&gt; +=C2=A0 =C2=A0 bool virt_on =3D riscv_cpu_virt_enabled(env);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Privilege mode filtering */<br>
&gt; +=C2=A0 =C2=A0 if ((env-&gt;priv =3D=3D PRV_M &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmevent_val[ctr_idx] &amp; MHP=
MEVENT_BIT_MINH)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp;&amp; vir=
t_on &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmevent_val[ctr_idx] &amp; MHP=
MEVENT_BIT_VSINH)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_U &amp;&amp; vir=
t_on &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmevent_val[ctr_idx] &amp; MHP=
MEVENT_BIT_VUINH)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_S &amp;&amp; !vi=
rt_on &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmevent_val[ctr_idx] &amp; MHP=
MEVENT_BIT_SINH)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;priv =3D=3D PRV_U &amp;&amp; !vi=
rt_on &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (env-&gt;mhpmevent_val[ctr_idx] &amp; MHP=
MEVENT_BIT_UINH))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Handle the overflow scenario */<br>
&gt; +=C2=A0 =C2=A0 if (counter-&gt;mhpmcounter_val =3D=3D max_val) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_val =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Generate interrupt only if OF bit is c=
lear */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(env-&gt;mhpmevent_val[ctr_idx] &amp=
; MHPMEVENT_BIT_OF)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;mhpmevent_val[ctr_i=
dx] |=3D MHPMEVENT_BIT_OF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, M=
IP_LCOFIP, BOOL_TO_MASK(1));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;mhpmcounter_val++;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_=
idx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t ctr_idx;<br>
&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +=C2=A0 =C2=A0 gpointer value;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 value =3D g_hash_table_lookup(cpu-&gt;pmu_event_ctr_map=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUINT_TO_POINTER(event_idx));<br=
>
&gt; +=C2=A0 =C2=A0 if (!value) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ctr_idx =3D GPOINTER_TO_UINT(value);<br>
&gt; +=C2=A0 =C2=A0 if (!riscv_pmu_counter_enabled(cpu, ctr_idx) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 get_field(env-&gt;mcountinhibit, BIT(ctr_=
idx))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D riscv_pmu_incr_ctr_rv32(cpu, ctr_=
idx);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D riscv_pmu_incr_ctr_rv64(cpu, ctr_=
idx);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0bool riscv_pmu_ctr_monitor_instructions(CPURISCVState *env=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint32_t target_ctr)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 return (target_ctr =3D=3D 0) ? true : false;<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu;<br>
&gt; +=C2=A0 =C2=A0 uint32_t event_idx;<br>
&gt; +=C2=A0 =C2=A0 uint32_t ctr_idx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Fixed instret counter */<br>
&gt; +=C2=A0 =C2=A0 if (target_ctr =3D=3D 2) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cpu =3D RISCV_CPU(env_cpu(env));<br>
&gt; +=C2=A0 =C2=A0 event_idx =3D RISCV_PMU_EVENT_HW_INSTRUCTIONS;<br>
&gt; +=C2=A0 =C2=A0 ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu-&g=
t;pmu_event_ctr_map,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUINT_TO_POINTER(event_idx)));<br=
>
&gt; +=C2=A0 =C2=A0 if (!ctr_idx) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return target_ctr =3D=3D ctr_idx ? true : false;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env, uint=
32_t target_ctr)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 return (target_ctr =3D=3D 2) ? true : false;<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu;<br>
&gt; +=C2=A0 =C2=A0 uint32_t event_idx;<br>
&gt; +=C2=A0 =C2=A0 uint32_t ctr_idx;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Fixed mcycle counter */<br>
&gt; +=C2=A0 =C2=A0 if (target_ctr =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cpu =3D RISCV_CPU(env_cpu(env));<br>
&gt; +=C2=A0 =C2=A0 event_idx =3D RISCV_PMU_EVENT_HW_CPU_CYCLES;<br>
&gt; +=C2=A0 =C2=A0 ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu-&g=
t;pmu_event_ctr_map,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUINT_TO_POINTER(event_idx)));<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Counter zero is not used for event_ctr_map */<br>
&gt; +=C2=A0 =C2=A0 if (!ctr_idx) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return (target_ctr =3D=3D ctr_idx) ? true : false;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static gboolean pmu_remove_event_map(gpointer key, gpointer value,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpointer uda=
ta)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return (GPOINTER_TO_UINT(value) =3D=3D GPOINTER_TO_UINT=
(udata)) ? true : false;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int64_t pmu_icount_ticks_to_ns(int64_t value)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int64_t ret =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (icount_enabled()) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D icount_to_ns(value);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D (NANOSECONDS_PER_SECOND / RISCV_T=
IMEBASE_FREQ) * value;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ctr_idx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t event_idx;<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!riscv_pmu_counter_valid(cpu, ctr_idx)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /**<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Expected mhpmevent value is zero for reset case=
. Remove the current<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* mapping.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (!value) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_foreach_remove(cpu-&gt;pmu_e=
vent_ctr_map,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_remove_event_m=
ap,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUINT_TO_POINTER(c=
tr_idx));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 event_idx =3D value &amp; MHPMEVENT_IDX_MASK;<br>
&gt; +=C2=A0 =C2=A0 if (g_hash_table_lookup(cpu-&gt;pmu_event_ctr_map,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GUINT_TO_POINTER(event_idx))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (event_idx) {<br>
&gt; +=C2=A0 =C2=A0 case RISCV_PMU_EVENT_HW_CPU_CYCLES:<br>
&gt; +=C2=A0 =C2=A0 case RISCV_PMU_EVENT_HW_INSTRUCTIONS:<br>
&gt; +=C2=A0 =C2=A0 case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:<br>
&gt; +=C2=A0 =C2=A0 case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:<br>
&gt; +=C2=A0 =C2=A0 case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We don&#39;t support any raw events ri=
ght now */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 g_hash_table_insert(cpu-&gt;pmu_event_ctr_map, GUINT_TO=
_POINTER(event_idx),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 GUINT_TO_POINTER(ctr_idx));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void pmu_timer_trigger_irq(RISCVCPU *cpu,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum riscv_pmu_event_idx =
evt_idx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t ctr_idx;<br>
&gt; +=C2=A0 =C2=A0 CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
&gt; +=C2=A0 =C2=A0 PMUCTRState *counter;<br>
&gt; +=C2=A0 =C2=A0 target_ulong *mhpmevent_val;<br>
&gt; +=C2=A0 =C2=A0 uint64_t of_bit_mask;<br>
&gt; +=C2=A0 =C2=A0 int64_t irq_trigger_at;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (evt_idx !=3D RISCV_PMU_EVENT_HW_CPU_CYCLES &amp;&am=
p;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 evt_idx !=3D RISCV_PMU_EVENT_HW_INSTRUCTI=
ONS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ctr_idx =3D GPOINTER_TO_UINT(g_hash_table_lookup(cpu-&g=
t;pmu_event_ctr_map,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUINT_TO_POINTER(evt_idx)));<br>
&gt; +=C2=A0 =C2=A0 if (!riscv_pmu_counter_enabled(cpu, ctr_idx)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mhpmevent_val =3D &amp;env-&gt;mhpmeventh=
_val[ctr_idx];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_bit_mask =3D MHPMEVENTH_BIT_OF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mhpmevent_val =3D &amp;env-&gt;mhpmevent_=
val[ctr_idx];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 of_bit_mask =3D MHPMEVENT_BIT_OF;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 counter =3D &amp;env-&gt;pmu_ctrs[ctr_idx];<br>
&gt; +=C2=A0 =C2=A0 if (counter-&gt;irq_overflow_left &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq_trigger_at =3D qemu_clock_get_ns(QEMU=
_CLOCK_VIRTUAL) +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 counter-&gt;irq_overflow_left;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_mod_anticipate_ns(cpu-&gt;pmu_timer=
, irq_trigger_at);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;irq_overflow_left =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (cpu-&gt;pmu_avail_ctrs &amp; BIT(ctr_idx)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Generate interrupt only if OF bit is c=
lear */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(*mhpmevent_val &amp; of_bit_mask)) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *mhpmevent_val |=3D of_bit_=
mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_cpu_update_mip(cpu, M=
IP_LCOFIP, BOOL_TO_MASK(1));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Timer callback for instret and cycle counter overflow */<br>
&gt; +void riscv_pmu_timer_cb(void *priv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D priv;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Timer event was triggered only for these events */<b=
r>
&gt; +=C2=A0 =C2=A0 pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_CPU_CYCLE=
S);<br>
&gt; +=C2=A0 =C2=A0 pmu_timer_trigger_irq(cpu, RISCV_PMU_EVENT_HW_INSTRUCTI=
ONS);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value, uint32_=
t ctr_idx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint64_t overflow_delta, overflow_at;<br>
&gt; +=C2=A0 =C2=A0 int64_t overflow_ns, overflow_left =3D 0;<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));<br>
&gt; +=C2=A0 =C2=A0 PMUCTRState *counter =3D &amp;env-&gt;pmu_ctrs[ctr_idx]=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!riscv_pmu_counter_valid(cpu, ctr_idx) || !cpu-&gt;=
cfg.ext_sscofpmf) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (value) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_delta =3D UINT64_MAX - value + 1=
;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_delta =3D UINT64_MAX;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /**<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* QEMU supports only int64_t timers while RISC-V =
counters are uint64_t.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Compute the leftover and save it so that it can=
 be reprogrammed again<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* when timer expires.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (overflow_delta &gt; INT64_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_left =3D overflow_delta - INT64_=
MAX;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (riscv_pmu_ctr_monitor_cycles(env, ctr_idx) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_pmu_ctr_monitor_instructions(env, c=
tr_idx)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_ns =3D pmu_icount_ticks_to_ns((i=
nt64_t)overflow_delta);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_left =3D pmu_icount_ticks_to_ns(=
overflow_left) ;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 overflow_at =3D (uint64_t)qemu_clock_get_ns(QEMU_CLOCK_=
VIRTUAL) + overflow_ns;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (overflow_at &gt; INT64_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_left +=3D overflow_at - INT64_MA=
X;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 counter-&gt;irq_overflow_left =3D overflo=
w_left;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 overflow_at =3D INT64_MAX;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 timer_mod_anticipate_ns(cpu-&gt;pmu_timer, overflow_at)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +int riscv_pmu_init(RISCVCPU *cpu, int num_counters)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (num_counters &gt; (RV_MAX_MHPMCOUNTERS - 3)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;pmu_event_ctr_map =3D g_hash_table_new(g_direct=
_hash, g_direct_equal);<br>
&gt; +=C2=A0 =C2=A0 if (!cpu-&gt;pmu_event_ctr_map) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* PMU support can not be enabled */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;PMU events=
 can&#39;t be supported\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu-&gt;cfg.pmu_num =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Create a bitmask of available programmable counters =
*/<br>
&gt; +=C2=A0 =C2=A0 cpu-&gt;pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, num_count=
ers);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h<br>
&gt; index 58a5bc3a4089..036653627f78 100644<br>
&gt; --- a/target/riscv/pmu.h<br>
&gt; +++ b/target/riscv/pmu.h<br>
&gt; @@ -26,3 +26,10 @@ bool riscv_pmu_ctr_monitor_instructions(CPURISCVSta=
te *env,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint32_t target_ctr);<br>
&gt;=C2=A0 =C2=A0bool riscv_pmu_ctr_monitor_cycles(CPURISCVState *env,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t targ=
et_ctr);<br>
&gt; +void riscv_pmu_timer_cb(void *priv);<br>
&gt; +int riscv_pmu_init(RISCVCPU *cpu, int num_counters);<br>
&gt; +int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ctr_idx);<br>
&gt; +int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_=
idx);<br>
&gt; +int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 uint32_t ctr_idx);<br>
<br>
</blockquote></div></div>

--000000000000b2c20405e4d02826--

