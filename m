Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbxEG-00028B-6V
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 01:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbxEA-00027p-8V; Tue, 14 Mar 2023 01:29:38 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbxE7-0007kW-Q4; Tue, 14 Mar 2023 01:29:37 -0400
Received: by mail-ua1-x931.google.com with SMTP id q42so206328uac.3;
 Mon, 13 Mar 2023 22:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678771773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jR+QoMjjAzXhiO1BlytjuFLXMp35RxgqJCsaK7zwvmk=;
 b=WDsILdxv+QeEDBwVUScMOAq84bb9SipEaTIDYB0fHfagzaAwYi+Lk3CwaYSgJ0JZuK
 IP77i902Va3RsnL1xKQVvHTdS4dfg2pOfnQYVLzz3aczlx/QQqj4Dg8XoYw3OsuNtZ+A
 dv/4oDkBGmNcIjrkjdjXVBm+ZRsLEZ55DiiyxtBZu1o+yXJa8bvOnPRxcNHdajBsUGOV
 TYUNDeW8z5/PXjxoONsXVNM8zQfzXAwWeR0BYWXq6u9Omv9cve44Ku+6qlD42Fym6hdj
 2PCC0rHAHRHj7JSp1tmUARhS8wYRE5i3wpwl6Z2U7cxlVYVHf+jHyIt2B/7QEuvg83BT
 oreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678771773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jR+QoMjjAzXhiO1BlytjuFLXMp35RxgqJCsaK7zwvmk=;
 b=O9eEGTkUMDQHoJb4iXn+nI8ljzHdpNlRPjSzBz/E7DMaxpOpR66vkZMOnkkI5Uhpna
 o4yFosEqZ0LGqvIWfkchAX2lKtKXPcnsF9vEDsFUa/m2GytM7qoJBrYikK4efAXAOwvS
 /vW1rM/C8SHTcgRH191l7Lz2wp8qz0OeuKql1n9/mC7jtdDrzzQKeT0h6IxCisqnD/eB
 BsY6WrAnhkLlAGeazNf7WKosDWWC/2GHrZCidUo2LeEfqCbtQY94M+zuLGZyUfqoni83
 4l7ZF24QKFTmEkSX93WSE4WGFhHWqvSyuZuwk+7tnor4czt0ZHfvIgOme2nMpezytQQl
 e3qA==
X-Gm-Message-State: AO0yUKXCLn/vig5Y2/8Om9nH6+hL1gZVCCmiuCSJDdfyADWwZpXAbIFe
 GRreG4w4PY7qUcsdjaf0UHGYGFHEfSN2uBm7Pu8=
X-Google-Smtp-Source: AK7set+e1wzaj1AwXWp34pfhHjDTSU6DmHe5fHxM6RA0PlGiCc4lf8Db2Gv0mEKxxRdFPB45nesg+MAEFDKVJw702QI=
X-Received: by 2002:ab0:470b:0:b0:688:c23f:c22f with SMTP id
 h11-20020ab0470b000000b00688c23fc22fmr17283891uac.1.1678771773364; Mon, 13
 Mar 2023 22:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
 <20230309071329.45932-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20230309071329.45932-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Mar 2023 15:29:07 +1000
Message-ID: <CAKmqyKPBStEHELtKySr8sq4Yczp6a=R+DWcEMsYmuUw6iA7bpg@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/riscv: Simplify type conversion for
 CPURISCVState
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 05:29:38 -0000

On Thu, Mar 9, 2023 at 5:14=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
> Use CPURISCVState as argument directly in riscv_cpu_update_mip and
> riscv_timer_write_timecmp, since type converts from CPURISCVState to
> RISCVCPU in many caller of them and then back to CPURISCVState in them.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         |  6 +++---
>  target/riscv/cpu.h         |  3 ++-
>  target/riscv/cpu_helper.c  |  8 ++++----
>  target/riscv/csr.c         | 35 +++++++++++------------------------
>  target/riscv/pmu.c         |  6 +++---
>  target/riscv/time_helper.c | 15 +++++++--------
>  target/riscv/time_helper.h |  2 +-
>  7 files changed, 31 insertions(+), 44 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1e97473af2..16e465a0ab 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1302,7 +1302,7 @@ static void riscv_cpu_set_irq(void *opaque, int irq=
, int level)
>              if (kvm_enabled()) {
>                  kvm_riscv_set_irq(cpu, irq, level);
>              } else {
> -                riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level))=
;
> +                riscv_cpu_update_mip(env, 1 << irq, BOOL_TO_MASK(level))=
;
>              }
>               break;
>          case IRQ_S_EXT:
> @@ -1310,7 +1310,7 @@ static void riscv_cpu_set_irq(void *opaque, int irq=
, int level)
>                  kvm_riscv_set_irq(cpu, irq, level);
>              } else {
>                  env->external_seip =3D level;
> -                riscv_cpu_update_mip(cpu, 1 << irq,
> +                riscv_cpu_update_mip(env, 1 << irq,
>                                       BOOL_TO_MASK(level | env->software_=
seip));
>              }
>              break;
> @@ -1336,7 +1336,7 @@ static void riscv_cpu_set_irq(void *opaque, int irq=
, int level)
>          }
>
>          /* Update mip.SGEIP bit */
> -        riscv_cpu_update_mip(cpu, MIP_SGEIP,
> +        riscv_cpu_update_mip(env, MIP_SGEIP,
>                               BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
>      } else {
>          g_assert_not_reached();
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..5adefe4ab5 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -602,7 +602,8 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, v=
addr addr);
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
>  void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
> -uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t val=
ue);
> +uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
> +                              uint64_t value);
>  #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip valu=
e */
>  void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(void *),
>                               void *arg);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e677255f87..824f0cbd92 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -590,7 +590,7 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, b=
ool enable)
>           *
>           * To solve this, we check and inject interrupt after setting V=
=3D1.
>           */
> -        riscv_cpu_update_mip(env_archcpu(env), 0, 0);
> +        riscv_cpu_update_mip(env, 0, 0);
>      }
>  }
>
> @@ -610,10 +610,10 @@ int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint6=
4_t interrupts)
>      }
>  }
>
> -uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t val=
ue)
> +uint64_t riscv_cpu_update_mip(CPURISCVState *env, uint64_t mask,
> +                              uint64_t value)
>  {
> -    CPURISCVState *env =3D &cpu->env;
> -    CPUState *cs =3D CPU(cpu);
> +    CPUState *cs =3D env_cpu(env);
>      uint64_t gein, vsgein =3D 0, vstip =3D 0, old =3D env->mip;
>
>      if (riscv_cpu_virt_enabled(env)) {
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index b453d8e8ca..53143f4d9a 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -990,15 +990,13 @@ static RISCVException read_vstimecmph(CPURISCVState=
 *env, int csrno,
>  static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
>                                        target_ulong val)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
>      if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
>          env->vstimecmp =3D deposit64(env->vstimecmp, 0, 32, (uint64_t)va=
l);
>      } else {
>          env->vstimecmp =3D val;
>      }
>
> -    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +    riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
>                                env->htimedelta, MIP_VSTIP);
>
>      return RISCV_EXCP_NONE;
> @@ -1007,10 +1005,8 @@ static RISCVException write_vstimecmp(CPURISCVStat=
e *env, int csrno,
>  static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
>                                         target_ulong val)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
>      env->vstimecmp =3D deposit64(env->vstimecmp, 32, 32, (uint64_t)val);
> -    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +    riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
>                                env->htimedelta, MIP_VSTIP);
>
>      return RISCV_EXCP_NONE;
> @@ -1043,8 +1039,6 @@ static RISCVException read_stimecmph(CPURISCVState =
*env, int csrno,
>  static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>                                       target_ulong val)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
>      if (riscv_cpu_virt_enabled(env)) {
>          if (env->hvictl & HVICTL_VTI) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> @@ -1058,7 +1052,7 @@ static RISCVException write_stimecmp(CPURISCVState =
*env, int csrno,
>          env->stimecmp =3D val;
>      }
>
> -    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_ST=
IP);
> +    riscv_timer_write_timecmp(env, env->stimer, env->stimecmp, 0, MIP_ST=
IP);
>
>      return RISCV_EXCP_NONE;
>  }
> @@ -1066,8 +1060,6 @@ static RISCVException write_stimecmp(CPURISCVState =
*env, int csrno,
>  static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>                                        target_ulong val)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
>      if (riscv_cpu_virt_enabled(env)) {
>          if (env->hvictl & HVICTL_VTI) {
>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> @@ -1076,7 +1068,7 @@ static RISCVException write_stimecmph(CPURISCVState=
 *env, int csrno,
>      }
>
>      env->stimecmp =3D deposit64(env->stimecmp, 32, 32, (uint64_t)val);
> -    riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_ST=
IP);
> +    riscv_timer_write_timecmp(env, env->stimer, env->stimecmp, 0, MIP_ST=
IP);
>
>      return RISCV_EXCP_NONE;
>  }
> @@ -2211,7 +2203,6 @@ static RISCVException rmw_mip64(CPURISCVState *env,=
 int csrno,
>                                  uint64_t *ret_val,
>                                  uint64_t new_val, uint64_t wr_mask)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
>      uint64_t old_mip, mask =3D wr_mask & delegable_ints;
>      uint32_t gin;
>
> @@ -2220,14 +2211,14 @@ static RISCVException rmw_mip64(CPURISCVState *en=
v, int csrno,
>          new_val |=3D env->external_seip * MIP_SEIP;
>      }
>
> -    if (cpu->cfg.ext_sstc && (env->priv =3D=3D PRV_M) &&
> +    if (riscv_cpu_cfg(env)->ext_sstc && (env->priv =3D=3D PRV_M) &&
>          get_field(env->menvcfg, MENVCFG_STCE)) {
>          /* sstc extension forbids STIP & VSTIP to be writeable in mip */
>          mask =3D mask & ~(MIP_STIP | MIP_VSTIP);
>      }
>
>      if (mask) {
> -        old_mip =3D riscv_cpu_update_mip(cpu, mask, (new_val & mask));
> +        old_mip =3D riscv_cpu_update_mip(env, mask, (new_val & mask));
>      } else {
>          old_mip =3D env->mip;
>      }
> @@ -2987,7 +2978,7 @@ static RISCVException write_hgeie(CPURISCVState *en=
v, int csrno,
>      val &=3D ((((target_ulong)1) << env->geilen) - 1) << 1;
>      env->hgeie =3D val;
>      /* Update mip.SGEIP bit */
> -    riscv_cpu_update_mip(env_archcpu(env), MIP_SGEIP,
> +    riscv_cpu_update_mip(env, MIP_SGEIP,
>                           BOOL_TO_MASK(!!(env->hgeie & env->hgeip)));
>      return RISCV_EXCP_NONE;
>  }
> @@ -3056,8 +3047,6 @@ static RISCVException read_htimedelta(CPURISCVState=
 *env, int csrno,
>  static RISCVException write_htimedelta(CPURISCVState *env, int csrno,
>                                         target_ulong val)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
>      if (!env->rdtime_fn) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
> @@ -3068,8 +3057,8 @@ static RISCVException write_htimedelta(CPURISCVStat=
e *env, int csrno,
>          env->htimedelta =3D val;
>      }
>
> -    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
> -        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +    if (riscv_cpu_cfg(env)->ext_sstc && env->rdtime_fn) {
> +        riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
>                                    env->htimedelta, MIP_VSTIP);
>      }
>
> @@ -3090,16 +3079,14 @@ static RISCVException read_htimedeltah(CPURISCVSt=
ate *env, int csrno,
>  static RISCVException write_htimedeltah(CPURISCVState *env, int csrno,
>                                          target_ulong val)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
>      if (!env->rdtime_fn) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
>      env->htimedelta =3D deposit64(env->htimedelta, 32, 32, (uint64_t)val=
);
>
> -    if (cpu->cfg.ext_sstc && env->rdtime_fn) {
> -        riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +    if (riscv_cpu_cfg(env)->ext_sstc && env->rdtime_fn) {
> +        riscv_timer_write_timecmp(env, env->vstimer, env->vstimecmp,
>                                    env->htimedelta, MIP_VSTIP);
>      }
>
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index a200741083..22e2283c76 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -133,7 +133,7 @@ static int riscv_pmu_incr_ctr_rv32(RISCVCPU *cpu, uin=
t32_t ctr_idx)
>              /* Generate interrupt only if OF bit is clear */
>              if (!(env->mhpmeventh_val[ctr_idx] & MHPMEVENTH_BIT_OF)) {
>                  env->mhpmeventh_val[ctr_idx] |=3D MHPMEVENTH_BIT_OF;
> -                riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> +                riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
>              }
>          } else {
>              counter->mhpmcounterh_val++;
> @@ -172,7 +172,7 @@ static int riscv_pmu_incr_ctr_rv64(RISCVCPU *cpu, uin=
t32_t ctr_idx)
>          /* Generate interrupt only if OF bit is clear */
>          if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
>              env->mhpmevent_val[ctr_idx] |=3D MHPMEVENT_BIT_OF;
> -            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> +            riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
>          }
>      } else {
>          counter->mhpmcounter_val++;
> @@ -371,7 +371,7 @@ static void pmu_timer_trigger_irq(RISCVCPU *cpu,
>          /* Generate interrupt only if OF bit is clear */
>          if (!(*mhpmevent_val & of_bit_mask)) {
>              *mhpmevent_val |=3D of_bit_mask;
> -            riscv_cpu_update_mip(cpu, MIP_LCOFIP, BOOL_TO_MASK(1));
> +            riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
>          }
>      }
>  }
> diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> index b654f91af9..8d245bed3a 100644
> --- a/target/riscv/time_helper.c
> +++ b/target/riscv/time_helper.c
> @@ -27,25 +27,24 @@ static void riscv_vstimer_cb(void *opaque)
>      RISCVCPU *cpu =3D opaque;
>      CPURISCVState *env =3D &cpu->env;
>      env->vstime_irq =3D 1;
> -    riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
> +    riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(1));
>  }
>
>  static void riscv_stimer_cb(void *opaque)
>  {
>      RISCVCPU *cpu =3D opaque;
> -    riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
> +    riscv_cpu_update_mip(&cpu->env, MIP_STIP, BOOL_TO_MASK(1));
>  }
>
>  /*
>   * Called when timecmp is written to update the QEMU timer or immediatel=
y
>   * trigger timer interrupt if mtimecmp <=3D current timer value.
>   */
> -void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> +void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
>                                 uint64_t timecmp, uint64_t delta,
>                                 uint32_t timer_irq)
>  {
>      uint64_t diff, ns_diff, next;
> -    CPURISCVState *env =3D &cpu->env;
>      RISCVAclintMTimerState *mtimer =3D env->rdtime_fn_arg;
>      uint32_t timebase_freq =3D mtimer->timebase_freq;
>      uint64_t rtc_r =3D env->rdtime_fn(env->rdtime_fn_arg) + delta;
> @@ -57,9 +56,9 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer=
 *timer,
>           */
>          if (timer_irq =3D=3D MIP_VSTIP) {
>              env->vstime_irq =3D 1;
> -            riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
> +            riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(1));
>          } else {
> -            riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
> +            riscv_cpu_update_mip(env, MIP_STIP, BOOL_TO_MASK(1));
>          }
>          return;
>      }
> @@ -67,9 +66,9 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer=
 *timer,
>      /* Clear the [VS|S]TIP bit in mip */
>      if (timer_irq =3D=3D MIP_VSTIP) {
>          env->vstime_irq =3D 0;
> -        riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(0));
> +        riscv_cpu_update_mip(env, 0, BOOL_TO_MASK(0));
>      } else {
> -        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
> +        riscv_cpu_update_mip(env, timer_irq, BOOL_TO_MASK(0));
>      }
>
>      /*
> diff --git a/target/riscv/time_helper.h b/target/riscv/time_helper.h
> index 7b3cdcc350..cacd79b80c 100644
> --- a/target/riscv/time_helper.h
> +++ b/target/riscv/time_helper.h
> @@ -22,7 +22,7 @@
>  #include "cpu.h"
>  #include "qemu/timer.h"
>
> -void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
> +void riscv_timer_write_timecmp(CPURISCVState *env, QEMUTimer *timer,
>                                 uint64_t timecmp, uint64_t delta,
>                                 uint32_t timer_irq);
>  void riscv_timer_init(RISCVCPU *cpu);
> --
> 2.25.1
>
>

