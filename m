Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lfvUd-0005J8-FZ
	for mharc-qemu-riscv@gnu.org; Sun, 09 May 2021 22:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lfvUc-0005It-Cy; Sun, 09 May 2021 22:17:58 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:41951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lfvUY-0006iT-TR; Sun, 09 May 2021 22:17:58 -0400
Received: by mail-io1-xd35.google.com with SMTP id n10so13338113ion.8;
 Sun, 09 May 2021 19:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LjaKI1VoIIlpRH0GZBzTFl3Kn0cD2AI9fs6vfqO1Cfc=;
 b=csVSMoUstP2uJRkrNNKHnBK8fxPVzlRbsPKVQjiGC+dr5JS9wmyI1Jrc8r1GNREiTi
 q28cSrmPOfOxG+D+2wkiLe3Az1Q3lQJjllk/kzG8tXAumTe9bjhhr3msjQ0Ih9Vfq2kb
 UxjqX/L3krdCU0phOKzaFe2T96F3Ohwpnhb6KoRezOJq1AgpxLWhk9kHsNoP8mzfrSQY
 OOsb8KXuf9V2L9bxXJQOOb8ct1wj1D9bb/byWmL81qxKFmn//IlvA3r3ajzSW2E/jQ/2
 l5ai3KuHx2IOT6EZ/PKLS31kn0ZKb5/5Vz4WSp3CZ6o+YjZCE8Ib5p5W95+a8YWgQ0Oy
 FzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LjaKI1VoIIlpRH0GZBzTFl3Kn0cD2AI9fs6vfqO1Cfc=;
 b=AcU+bCdSF/ySaDUIDSApqMCtrwZjSOrx0ZHrOg0KRGBDfvm4sZSv0nR/H21kCRL/XL
 0FQuKSkaEAZ+BBeZ4NdjcvKfrSpGXIo5m7Joqxg7FwK2xh+5zSdUCD3LiCt3N4OGqWSg
 2QltC7+gcXNWpEatbW7oI1xf1JKqLO/AEul12xQTGuqv2qrUmic6KIi/OzcEdh/Ert7D
 qMCeJO5prNXTSZTlSfUsXS8pau9Wk4el8pKpFYdek+iy0k4LaGUe2+n3BaUcuN6G9Rav
 Qsy/xMlco7KnyGvKRXXWALMktBd1YxTQVptTiWUWt/HxN0wri+lfPGRR8868TwilOfgf
 U49g==
X-Gm-Message-State: AOAM5313SAmdrklyYBHQIFE2yoDOcCDJingnwXmPk97O8vy02VJDgNvP
 RbjHdPGvd9GAf62/KnvZlC2G40aB7kFhH2Gi79s=
X-Google-Smtp-Source: ABdhPJwxdfVcEDFtcvBPAAwK6LyK6NP7LHFoilO8q9Vu1Nlq5dfVT+hT1PJSmp7nH5KW5AcnuOaIdq7uybo/h4qUeTo=
X-Received: by 2002:a05:6638:29a:: with SMTP id
 c26mr19468453jaq.135.1620613071876; 
 Sun, 09 May 2021 19:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
 <20210507081654.11056-2-wangjunqiang@iscas.ac.cn>
In-Reply-To: <20210507081654.11056-2-wangjunqiang@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 May 2021 12:17:25 +1000
Message-ID: <CAKmqyKPE8O6LbZQc2H+kkWvVqf9qW705S85XGGWpUtQTWjzE8Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] target/riscv: Add Nuclei CSR and Update interrupt
 handling
To: wangjunqiang <wangjunqiang@iscas.ac.cn>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 liweiwei@iscas.ac.cn, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 alapha23@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Mon, 10 May 2021 02:17:58 -0000

 C isOn Fri, May 7, 2021 at 11:25 PM wangjunqiang
<wangjunqiang@iscas.ac.cn> wrote:
>
> This patch adds Nuclei CSR support for ECLIC and update the
> related interrupt handling.
>
> https://doc.nucleisys.com/nuclei_spec/isa/core_csr.html

Hello,

Thanks for the patches!

This patch is very long and you will need to split it up before it can
be merged. I understand this is just an RFC, but it's still best to
start with small patches. Generally each patch should add a feature
and it seems like you have added lots of features in this patch. This
patch could probably be broken into at least 4 different patches.

As well as that you will want to ensure that your commit message and
description explains what you are doing in that patch and in some
cases justify the change. For example adding a new CPU doesn't need a
justification (as that's easy for me to understand), but changing some
existing code might need an explanation of why we need/want that
change.

This is still a great start though! I look forward to your future patches.

I have left a few comments below as well.

> ---
>  target/riscv/cpu.c                      |  25 +-
>  target/riscv/cpu.h                      |  42 ++-
>  target/riscv/cpu_bits.h                 |  37 +++
>  target/riscv/cpu_helper.c               |  80 +++++-
>  target/riscv/csr.c                      | 347 +++++++++++++++++++++++-
>  target/riscv/insn_trans/trans_rvi.c.inc |  16 +-
>  target/riscv/op_helper.c                |  14 +
>  7 files changed, 552 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 7d6ed80f6b..b2a96effbc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -173,6 +173,16 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>      set_priv_version(env, PRIV_VERSION_1_10_0);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>  }
> +
> +static void rv64imafdcu_nuclei_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> +    set_resetvec(env, DEFAULT_RSTVEC);
> +    set_feature(env, RISCV_FEATURE_PMP);
> +}
>  #else
>  static void rv32_base_cpu_init(Object *obj)
>  {
> @@ -212,6 +222,16 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>      set_resetvec(env, DEFAULT_RSTVEC);
>      qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>  }
> +
> +static void rv32imafdcu_nuclei_cpu_init(Object *obj)
> +{
> +    CPURISCVState *env = &RISCV_CPU(obj)->env;
> +    set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +    set_priv_version(env, PRIV_VERSION_1_10_0);
> +    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> +    set_resetvec(env, DEFAULT_RSTVEC);
> +    set_feature(env, RISCV_FEATURE_PMP);
> +}
>  #endif
>
>  static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
> @@ -331,7 +351,7 @@ static bool riscv_cpu_has_work(CPUState *cs)
>       * Definition of the WFI instruction requires it to ignore the privilege
>       * mode and delegation registers, but respect individual enables
>       */
> -    return (env->mip & env->mie) != 0;
> +    return ((env->mip & env->mie) != 0  || (env->exccode != -1));

This change for example needs to be explained, I'm not sure what exccode is

>  #else
>      return true;
>  #endif
> @@ -356,6 +376,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>      env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>      env->mcause = 0;
>      env->pc = env->resetvec;
> +    env->exccode = -1;
>      env->two_stage_lookup = false;
>  #endif
>      cs->exception_index = EXCP_NONE;
> @@ -704,10 +725,12 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_NUCLEI_N307FD,    rv32imafdcu_nuclei_cpu_init),
>  #elif defined(TARGET_RISCV64)
>      DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
>      DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
> +    DEFINE_CPU(TYPE_RISCV_CPU_NUCLEI_NX600FD,    rv64imafdcu_nuclei_cpu_init),
>  #endif
>  };
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0a33d387ba..1d3a1986a6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -33,6 +33,7 @@
>  #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
>  #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
>  #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
> +#define CPU_INTERRUPT_ECLIC CPU_INTERRUPT_TGT_EXT_0
>
>  #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
>  #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
> @@ -43,6 +44,8 @@
>  #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
>  #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
>  #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
> +#define TYPE_RISCV_CPU_NUCLEI_N307FD    RISCV_CPU_TYPE_NAME("nuclei-n307fd")
> +#define TYPE_RISCV_CPU_NUCLEI_NX600FD    RISCV_CPU_TYPE_NAME("nuclei-nx600fd")
>
>  #if defined(TARGET_RISCV32)
>  # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
> @@ -80,7 +83,8 @@
>  enum {
>      RISCV_FEATURE_MMU,
>      RISCV_FEATURE_PMP,
> -    RISCV_FEATURE_MISA
> +    RISCV_FEATURE_MISA,
> +    RISCV_FEATURE_ECLIC

The same here, what is ECLIC? The ECLIC should be added in a seperate patch.

>  };
>
>  #define PRIV_VERSION_1_10_0 0x00011000
> @@ -174,10 +178,34 @@ struct CPURISCVState {
>      target_ulong scause;
>
>      target_ulong mtvec;
> +    target_ulong mtvt;   /* eclic */
>      target_ulong mepc;
>      target_ulong mcause;
>      target_ulong mtval;  /* since: priv-1.10.0 */
>
> +    target_ulong mnxti; /* eclic */
> +    target_ulong mintstatus; /* eclic */
> +    target_ulong mscratchcsw;
> +    target_ulong mscratchcswl;
> +
> +    /* NMI  CSR*/
> +    target_ulong mnvec;
> +    target_ulong msubm;
> +    target_ulong mdcause;
> +    target_ulong mmisc_ctl;
> +    target_ulong msavestatus;
> +    target_ulong msaveepc1;
> +    target_ulong msavecause1;
> +    target_ulong msaveepc2;
> +    target_ulong msavecause2;
> +    target_ulong msavedcause1;
> +    target_ulong msavedcause2;
> +    target_ulong pushmsubm;
> +    target_ulong mtvt2;
> +    target_ulong jalmnxti;
> +    target_ulong pushmcause;
> +    target_ulong pushmepc;

What are NMI CSRs?

> +
>      /* Hypervisor CSRs */
>      target_ulong hstatus;
>      target_ulong hedeleg;
> @@ -228,6 +256,9 @@ struct CPURISCVState {
>      uint64_t mtohost;
>      uint64_t timecmp;
>
> +    /*nuclei timer comparators */
> +    uint64_t mtimecmp;

RISC-V has a mtimecmp, does nuclei add another one?

> +
>      /* physical memory protection */
>      pmp_table_t pmp_state;
>
> @@ -243,6 +274,13 @@ struct CPURISCVState {
>
>      /* Fields from here on are preserved across CPU reset. */
>      QEMUTimer *timer; /* Internal timer */
> +
> +    QEMUTimer *mtimer; /* Nuclei Internal timer */

Why do you need a timer here just for the Nuclei CPU?

> +    void *eclic;
> +    uint32_t exccode;    /* irq id: 0~11  shv: 12 */
> +    uint32_t eclic_flag;
> +
> +    bool irq_pending;
>  };
>
>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> @@ -364,6 +402,8 @@ void riscv_cpu_list(void);
>  void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts);
>  uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_t mask, uint32_t value);
> +void riscv_cpu_eclic_clean_pending(void *eclic, int irq);
> +void riscv_cpu_eclic_get_next_interrupt(void *eclic);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip value */
>  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t),
>                               uint32_t arg);
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index caf4599207..24ed7a99e1 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -149,6 +149,7 @@
>  #define CSR_MIE             0x304
>  #define CSR_MTVEC           0x305
>  #define CSR_MCOUNTEREN      0x306
> +#define CSR_MTVT      0x307 /* customized */

So I'm not sure what to do here. This seems to be a custom CSR just
for the Nuclei that isn't part of the RISC-V spec or a draft spec.

The problem is that accepting custom specs into QEMU makes it hard for
us to maintain the RISC-V port. After it has been merged the
maintainers now have to understand the Nuclei CPU and support it as
part of the core RISC-V code.

On the other hand I have seen a few CPUs that use CSRs and I don't
want to not allow implementations that use custom CSRs. I think there
is a compromise here. We probably don't want to support really custom
features, but we probably can afford to support some extra CSRs.

I think the best course of action here is to split this patch up and
we can then think about each custom feature/CSR and accept some
depending on how intrusive they are into the QEMU code. It will also
have to be added in a way that allows other implementations to have
different custom CSRs. We (the QEMU RISC-V community) can help you
with this.

Alistair

