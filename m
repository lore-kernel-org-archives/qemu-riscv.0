Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjviM-0002WW-FM
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjviK-0002Tw-MW; Wed, 05 Apr 2023 01:29:45 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjviD-0005al-U8; Wed, 05 Apr 2023 01:29:43 -0400
Received: by mail-ua1-x936.google.com with SMTP id x33so24791065uaf.12;
 Tue, 04 Apr 2023 22:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680672576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nuIQ9NH9bC6+Fv8Z3dpZaUHqOuOniJSFZFDQA2hK0L8=;
 b=TqGVYP/fKhfoaWCcQQ8b7LbB7dO+zI9VMKX7Y7QH0Hl8skU0WgxY/zz69RDs0/zEu7
 sklswiaOpzZWRSl5qfWIpI1SAbd2PI0TnVZBLaTD1iRFbKUcz2rtWQRERBMHScmnBWSQ
 0SmlfaOsWO2YnBmyV7QCcPqS5Fk7U7l2MPqn9Yoso8dfzaoZZOihXjmjTFxdu12HECcA
 S5PgdoePUdjVeiG2YMZhN9LHCPXkGUhvJs939KrqovmmtEuKgWMd6yI6exK1W0zHRmUQ
 CQOGKXTgu6V+d9LWnGzXnbcZ8MoGKXJ7YpWLSGTKVz2xk4DrRL4wrAZplYmRCOc+Nve3
 KpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680672576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nuIQ9NH9bC6+Fv8Z3dpZaUHqOuOniJSFZFDQA2hK0L8=;
 b=6tMu0vfbrA60M/xNtQtqLfQyJf26e8A3Ji6ghysOw14Z0G2coZTWoil5yXK89UFBBj
 7GYIaDRtBgIbpyA3bVDuq8lgklh4ROSXhNXovYXG7NrtI7Z3mZyP20+ctc/dRWtIQbBO
 /DtPdZcTaE5L1f6YAWOOxo5TPoP/Vkuv1KZ0Nb/dI1ezblrAzG4DHBgsXZsFQjAXBqp1
 netM2MnaipjS4X8J4BuY98BhXZIgpdKxYLjmuB2M/vX8bJfhAXRXYMdgGrf+nXASxdiP
 gAcKiVO1CR3Y25+DdsoWhzRR41YU9SHhxfYhdWcPHqeFba8cXRKvBcu1U02p1rg0cXjn
 zDoQ==
X-Gm-Message-State: AAQBX9cWj3x39WzgqvO2naWIZJbiQmsmZYWYqy1yoU6owdMK5a9hH4Cf
 /XE8clAAIgicFGw33pZRKgIoPFTPfUxCjP64JUk=
X-Google-Smtp-Source: AKy350ZZOejg+gELNDuRQyGRul09qnQT7g7KydHCEsytTnYip+O+vfzmlShCPgFRvkp37V/gIsvrlKQHc1fEB+NZkdo=
X-Received: by 2002:a9f:3016:0:b0:764:72bd:aebf with SMTP id
 h22-20020a9f3016000000b0076472bdaebfmr3371797uab.1.1680672576132; Tue, 04 Apr
 2023 22:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <20230327080858.39703-9-liweiwei@iscas.ac.cn>
In-Reply-To: <20230327080858.39703-9-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:29:10 +1000
Message-ID: <CAKmqyKNb2Kh1y2uGkbSjkHcB4Ltz2ZZHPK+j5O8NLvsU5E+enw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] target/riscv: Fix format for indentation
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x936.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:29:45 -0000

On Mon, Mar 27, 2023 at 6:11=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Fix identation problems, and try to use the same indentation strategy
> in the same file.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/arch_dump.c                |   4 +-
>  target/riscv/cpu.c                      |   4 +-
>  target/riscv/cpu_helper.c               |  15 +--
>  target/riscv/insn_trans/trans_rvv.c.inc |  28 ++---
>  target/riscv/op_helper.c                |   4 +-
>  target/riscv/pmp.c                      |  19 ++--
>  target/riscv/pmp.h                      |   9 +-
>  target/riscv/vector_helper.c            | 134 +++++++++++++-----------
>  8 files changed, 113 insertions(+), 104 deletions(-)
>
> diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
> index 736a232956..573587810e 100644
> --- a/target/riscv/arch_dump.c
> +++ b/target/riscv/arch_dump.c
> @@ -180,8 +180,8 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>      info->d_class =3D ELFCLASS32;
>  #endif
>
> -    info->d_endian =3D (env->mstatus & MSTATUS_UBE) !=3D 0
> -                     ? ELFDATA2MSB : ELFDATA2LSB;
> +    info->d_endian =3D (env->mstatus & MSTATUS_UBE) !=3D 0 ?
> +                     ELFDATA2MSB : ELFDATA2LSB;
>
>      return 0;
>  }
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e71b4d24a7..b0cbacc5f4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -344,8 +344,8 @@ static void riscv_any_cpu_init(Object *obj)
>
>  #ifndef CONFIG_USER_ONLY
>      set_satp_mode_max_supported(RISCV_CPU(obj),
> -            riscv_cpu_mxl(&RISCV_CPU(obj)->env) =3D=3D MXL_RV32 ?
> -                                    VM_1_10_SV32 : VM_1_10_SV57);
> +        riscv_cpu_mxl(&RISCV_CPU(obj)->env) =3D=3D MXL_RV32 ?
> +        VM_1_10_SV32 : VM_1_10_SV57);
>  #endif
>
>      set_priv_version(env, PRIV_VERSION_1_12_0);
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9145ca0ddb..6f4d0a6030 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -68,12 +68,12 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_=
ulong *pc,
>          flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
>          flags =3D FIELD_DP32(flags, TB_FLAGS, SEW, sew);
>          flags =3D FIELD_DP32(flags, TB_FLAGS, LMUL,
> -                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
> +                           FIELD_EX64(env->vtype, VTYPE, VLMUL));
>          flags =3D FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
>          flags =3D FIELD_DP32(flags, TB_FLAGS, VTA,
> -                    FIELD_EX64(env->vtype, VTYPE, VTA));
> +                           FIELD_EX64(env->vtype, VTYPE, VTA));
>          flags =3D FIELD_DP32(flags, TB_FLAGS, VMA,
> -                    FIELD_EX64(env->vtype, VTYPE, VMA));
> +                           FIELD_EX64(env->vtype, VTYPE, VMA));
>      } else {
>          flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>      }
> @@ -1052,7 +1052,7 @@ restart:
>              /* add write permission on stores or if the page is already =
dirty,
>                 so that we TLB miss on later writes to update the dirty b=
it */
>              if ((pte & PTE_W) &&
> -                    (access_type =3D=3D MMU_DATA_STORE || (pte & PTE_D))=
) {
> +                (access_type =3D=3D MMU_DATA_STORE || (pte & PTE_D))) {
>                  *prot |=3D PAGE_WRITE;
>              }
>              return TRANSLATE_SUCCESS;
> @@ -1281,9 +1281,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr addres=
s, int size,
>                                         false);
>
>              qemu_log_mask(CPU_LOG_MMU,
> -                    "%s 2nd-stage address=3D%" VADDR_PRIx " ret %d physi=
cal "
> -                    HWADDR_FMT_plx " prot %d\n",
> -                    __func__, im_address, ret, pa, prot2);
> +                          "%s 2nd-stage address=3D%" VADDR_PRIx
> +                          " ret %d physical "
> +                          HWADDR_FMT_plx " prot %d\n",
> +                          __func__, im_address, ret, pa, prot2);
>
>              prot &=3D prot2;
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index f2e3d38515..8e43bfc07c 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -238,8 +238,8 @@ static bool vext_check_store(DisasContext *s, int vd,=
 int nf, uint8_t eew)
>  {
>      int8_t emul =3D eew - s->sew + s->lmul;
>      return (emul >=3D -3 && emul <=3D 3) &&
> -            require_align(vd, emul) &&
> -            require_nf(vd, nf, emul);
> +           require_align(vd, emul) &&
> +           require_nf(vd, nf, emul);
>  }
>
>  /*
> @@ -315,7 +315,7 @@ static bool vext_check_ld_index(DisasContext *s, int =
vd, int vs2,
>      int8_t seg_vd;
>      int8_t emul =3D eew - s->sew + s->lmul;
>      bool ret =3D vext_check_st_index(s, vd, vs2, nf, eew) &&
> -        require_vm(vm, vd);
> +               require_vm(vm, vd);
>
>      /* Each segment register group has to follow overlap rules. */
>      for (int i =3D 0; i < nf; ++i) {
> @@ -345,8 +345,8 @@ static bool vext_check_ld_index(DisasContext *s, int =
vd, int vs2,
>  static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
>  {
>      return require_vm(vm, vd) &&
> -        require_align(vd, s->lmul) &&
> -        require_align(vs, s->lmul);
> +           require_align(vd, s->lmul) &&
> +           require_align(vs, s->lmul);
>  }
>
>  /*
> @@ -365,7 +365,7 @@ static bool vext_check_ss(DisasContext *s, int vd, in=
t vs, int vm)
>  static bool vext_check_sss(DisasContext *s, int vd, int vs1, int vs2, in=
t vm)
>  {
>      return vext_check_ss(s, vd, vs2, vm) &&
> -        require_align(vs1, s->lmul);
> +           require_align(vs1, s->lmul);
>  }
>
>  static bool vext_check_ms(DisasContext *s, int vd, int vs)
> @@ -396,7 +396,7 @@ static bool vext_check_ms(DisasContext *s, int vd, in=
t vs)
>  static bool vext_check_mss(DisasContext *s, int vd, int vs1, int vs2)
>  {
>      bool ret =3D vext_check_ms(s, vd, vs2) &&
> -        require_align(vs1, s->lmul);
> +               require_align(vs1, s->lmul);
>      if (vd !=3D vs1) {
>          ret &=3D require_noover(vd, 0, vs1, s->lmul);
>      }
> @@ -460,14 +460,14 @@ static bool vext_narrow_check_common(DisasContext *=
s, int vd, int vs2,
>  static bool vext_check_ds(DisasContext *s, int vd, int vs, int vm)
>  {
>      return vext_wide_check_common(s, vd, vm) &&
> -        require_align(vs, s->lmul) &&
> -        require_noover(vd, s->lmul + 1, vs, s->lmul);
> +           require_align(vs, s->lmul) &&
> +           require_noover(vd, s->lmul + 1, vs, s->lmul);
>  }
>
>  static bool vext_check_dd(DisasContext *s, int vd, int vs, int vm)
>  {
>      return vext_wide_check_common(s, vd, vm) &&
> -        require_align(vs, s->lmul + 1);
> +           require_align(vs, s->lmul + 1);
>  }
>
>  /*
> @@ -485,8 +485,8 @@ static bool vext_check_dd(DisasContext *s, int vd, in=
t vs, int vm)
>  static bool vext_check_dss(DisasContext *s, int vd, int vs1, int vs2, in=
t vm)
>  {
>      return vext_check_ds(s, vd, vs2, vm) &&
> -        require_align(vs1, s->lmul) &&
> -        require_noover(vd, s->lmul + 1, vs1, s->lmul);
> +           require_align(vs1, s->lmul) &&
> +           require_noover(vd, s->lmul + 1, vs1, s->lmul);
>  }
>
>  /*
> @@ -507,7 +507,7 @@ static bool vext_check_dss(DisasContext *s, int vd, i=
nt vs1, int vs2, int vm)
>  static bool vext_check_dds(DisasContext *s, int vd, int vs1, int vs2, in=
t vm)
>  {
>      return vext_check_ds(s, vd, vs1, vm) &&
> -        require_align(vs2, s->lmul + 1);
> +           require_align(vs2, s->lmul + 1);
>  }
>
>  static bool vext_check_sd(DisasContext *s, int vd, int vs, int vm)
> @@ -535,7 +535,7 @@ static bool vext_check_sd(DisasContext *s, int vd, in=
t vs, int vm)
>  static bool vext_check_sds(DisasContext *s, int vd, int vs1, int vs2, in=
t vm)
>  {
>      return vext_check_sd(s, vd, vs2, vm) &&
> -        require_align(vs1, s->lmul);
> +           require_align(vs1, s->lmul);
>  }
>
>  /*
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index c0c4ced7f0..ec9a384772 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -367,8 +367,8 @@ void helper_wfi(CPURISCVState *env)
>      if (((prv_s || (!rvs && prv_u)) && get_field(env->mstatus, MSTATUS_T=
W)) ||
>          (rvs && prv_u && !env->virt_enabled)) {
>          riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> -    } else if (env->virt_enabled && (prv_u ||
> -        (prv_s && get_field(env->hstatus, HSTATUS_VTW)))) {
> +    } else if (env->virt_enabled &&
> +               (prv_u || (prv_s && get_field(env->hstatus, HSTATUS_VTW))=
)) {
>          riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GE=
TPC());
>      } else {
>          cs->halted =3D 1;
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index a08cd95658..3943b0f2e3 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -27,7 +27,7 @@
>  #include "exec/exec-all.h"
>
>  static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
> -    uint8_t val);
> +                          uint8_t val);
>  static uint8_t pmp_read_cfg(CPURISCVState *env, uint32_t addr_index);
>  static void pmp_update_rule(CPURISCVState *env, uint32_t pmp_index);
>
> @@ -220,8 +220,8 @@ static int pmp_is_in_range(CPURISCVState *env, int pm=
p_index, target_ulong addr)
>  {
>      int result =3D 0;
>
> -    if ((addr >=3D env->pmp_state.addr[pmp_index].sa)
> -        && (addr <=3D env->pmp_state.addr[pmp_index].ea)) {
> +    if ((addr >=3D env->pmp_state.addr[pmp_index].sa) &&
> +        (addr <=3D env->pmp_state.addr[pmp_index].ea)) {
>          result =3D 1;
>      } else {
>          result =3D 0;
> @@ -234,8 +234,9 @@ static int pmp_is_in_range(CPURISCVState *env, int pm=
p_index, target_ulong addr)
>   * Check if the address has required RWX privs when no PMP entry is matc=
hed.
>   */
>  static bool pmp_hart_has_privs_default(CPURISCVState *env, target_ulong =
addr,
> -    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
> -    target_ulong mode)
> +                                       target_ulong size, pmp_priv_t pri=
vs,
> +                                       pmp_priv_t *allowed_privs,
> +                                       target_ulong mode)
>  {
>      bool ret;
>
> @@ -297,8 +298,8 @@ static bool pmp_hart_has_privs_default(CPURISCVState =
*env, target_ulong addr,
>   * Return negtive value if no match
>   */
>  int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> -    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
> -    target_ulong mode)
> +                       target_ulong size, pmp_priv_t privs,
> +                       pmp_priv_t *allowed_privs, target_ulong mode)
>  {
>      int i =3D 0;
>      int ret =3D -1;
> @@ -466,7 +467,7 @@ int pmp_hart_has_privs(CPURISCVState *env, target_ulo=
ng addr,
>   * Handle a write to a pmpcfg CSR
>   */
>  void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
> -    target_ulong val)
> +                      target_ulong val)
>  {
>      int i;
>      uint8_t cfg_val;
> @@ -508,7 +509,7 @@ target_ulong pmpcfg_csr_read(CPURISCVState *env, uint=
32_t reg_index)
>   * Handle a write to a pmpaddr CSR
>   */
>  void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
> -    target_ulong val)
> +                       target_ulong val)
>  {
>      trace_pmpaddr_csr_write(env->mhartid, addr_index, val);
>
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index da32c61c85..b296ea1fc6 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -63,18 +63,19 @@ typedef struct {
>  } pmp_table_t;
>
>  void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
> -    target_ulong val);
> +                      target_ulong val);
>  target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index);
>
>  void mseccfg_csr_write(CPURISCVState *env, target_ulong val);
>  target_ulong mseccfg_csr_read(CPURISCVState *env);
>
>  void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
> -    target_ulong val);
> +                       target_ulong val);
>  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
>  int pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> -    target_ulong size, pmp_priv_t privs, pmp_priv_t *allowed_privs,
> -    target_ulong mode);
> +                       target_ulong size, pmp_priv_t privs,
> +                       pmp_priv_t *allowed_privs,
> +                       target_ulong mode);
>  target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>                                target_ulong tlb_sa, target_ulong tlb_ea);
>  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 2423affe37..df6201d043 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1116,7 +1116,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,        \
>                                                                          =
 \
>          *((ETYPE *)vd + H(i)) =3D DO_OP(s2, (ETYPE)(target_long)s1, carr=
y);\
>      }                                                                   =
 \
> -    env->vstart =3D 0;                                          \
> +    env->vstart =3D 0;                                                  =
   \
>      /* set tail elements to 1s */                                       =
 \
>      vext_set_elems_1s(vd, vta, vl * esz, total_elems * esz);            =
 \
>  }
> @@ -1308,7 +1308,8 @@ GEN_VEXT_SHIFT_VV(vsra_vv_d, uint64_t, int64_t, H8,=
 H8, DO_SRL, 0x3f)
>  /* generate the helpers for shift instructions with one vector and one s=
calar */
>  #define GEN_VEXT_SHIFT_VX(NAME, TD, TS2, HD, HS2, OP, MASK) \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
> -        void *vs2, CPURISCVState *env, uint32_t desc)       \
> +                  void *vs2, CPURISCVState *env,            \
> +                  uint32_t desc)                            \
>  {                                                           \
>      uint32_t vm =3D vext_vm(desc);                            \
>      uint32_t vl =3D env->vl;                                  \
> @@ -1735,9 +1736,9 @@ GEN_VEXT_VX(vmulhsu_vx_d, 8)
>  /* Vector Integer Divide Instructions */
>  #define DO_DIVU(N, M) (unlikely(M =3D=3D 0) ? (__typeof(N))(-1) : N / M)
>  #define DO_REMU(N, M) (unlikely(M =3D=3D 0) ? N : N % M)
> -#define DO_DIV(N, M)  (unlikely(M =3D=3D 0) ? (__typeof(N))(-1) :\
> +#define DO_DIV(N, M)  (unlikely(M =3D=3D 0) ? (__typeof(N))(-1) : \
>          unlikely((N =3D=3D -N) && (M =3D=3D (__typeof(N))(-1))) ? N : N =
/ M)
> -#define DO_REM(N, M)  (unlikely(M =3D=3D 0) ? N :\
> +#define DO_REM(N, M)  (unlikely(M =3D=3D 0) ? N : \
>          unlikely((N =3D=3D -N) && (M =3D=3D (__typeof(N))(-1))) ? 0 : N =
% M)
>
>  RVVCALL(OPIVV2, vdivu_vv_b, OP_UUU_B, H1, H1, H1, DO_DIVU)
> @@ -1846,7 +1847,7 @@ GEN_VEXT_VX(vwmulsu_vx_h, 4)
>  GEN_VEXT_VX(vwmulsu_vx_w, 8)
>
>  /* Vector Single-Width Integer Multiply-Add Instructions */
> -#define OPIVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)   \
> +#define OPIVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)       \
>  static void do_##NAME(void *vd, void *vs1, void *vs2, int i)       \
>  {                                                                  \
>      TX1 s1 =3D *((T1 *)vs1 + HS1(i));                                \
> @@ -2277,7 +2278,8 @@ vext_vx_rm_2(void *vd, void *v0, target_long s1, vo=
id *vs2,
>  /* generate helpers for fixed point instructions with OPIVX format */
>  #define GEN_VEXT_VX_RM(NAME, ESZ)                         \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong s1,    \
> -        void *vs2, CPURISCVState *env, uint32_t desc)     \
> +                  void *vs2, CPURISCVState *env,          \
> +                  uint32_t desc)                          \
>  {                                                         \
>      vext_vx_rm_2(vd, v0, s1, vs2, env, desc,              \
>                   do_##NAME, ESZ);                         \
> @@ -3052,7 +3054,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
       \
>      uint32_t vm =3D vext_vm(desc);                          \
>      uint32_t vl =3D env->vl;                                \
>      uint32_t total_elems =3D                                \
> -        vext_get_total_elems(env, desc, ESZ);              \
> +        vext_get_total_elems(env, desc, ESZ);             \
>      uint32_t vta =3D vext_vta(desc);                        \
>      uint32_t vma =3D vext_vma(desc);                        \
>      uint32_t i;                                           \
> @@ -3118,13 +3120,13 @@ GEN_VEXT_VF(vfrsub_vf_d, 8)
>  static uint32_t vfwadd16(uint16_t a, uint16_t b, float_status *s)
>  {
>      return float32_add(float16_to_float32(a, true, s),
> -            float16_to_float32(b, true, s), s);
> +                       float16_to_float32(b, true, s), s);
>  }
>
>  static uint64_t vfwadd32(uint32_t a, uint32_t b, float_status *s)
>  {
>      return float64_add(float32_to_float64(a, s),
> -            float32_to_float64(b, s), s);
> +                       float32_to_float64(b, s), s);
>
>  }
>
> @@ -3140,13 +3142,13 @@ GEN_VEXT_VF(vfwadd_vf_w, 8)
>  static uint32_t vfwsub16(uint16_t a, uint16_t b, float_status *s)
>  {
>      return float32_sub(float16_to_float32(a, true, s),
> -            float16_to_float32(b, true, s), s);
> +                       float16_to_float32(b, true, s), s);
>  }
>
>  static uint64_t vfwsub32(uint32_t a, uint32_t b, float_status *s)
>  {
>      return float64_sub(float32_to_float64(a, s),
> -            float32_to_float64(b, s), s);
> +                       float32_to_float64(b, s), s);
>
>  }
>
> @@ -3250,13 +3252,13 @@ GEN_VEXT_VF(vfrdiv_vf_d, 8)
>  static uint32_t vfwmul16(uint16_t a, uint16_t b, float_status *s)
>  {
>      return float32_mul(float16_to_float32(a, true, s),
> -            float16_to_float32(b, true, s), s);
> +                       float16_to_float32(b, true, s), s);
>  }
>
>  static uint64_t vfwmul32(uint32_t a, uint32_t b, float_status *s)
>  {
>      return float64_mul(float32_to_float64(a, s),
> -            float32_to_float64(b, s), s);
> +                       float32_to_float64(b, s), s);
>
>  }
>  RVVCALL(OPFVV2, vfwmul_vv_h, WOP_UUU_H, H4, H2, H2, vfwmul16)
> @@ -3271,7 +3273,7 @@ GEN_VEXT_VF(vfwmul_vf_w, 8)
>  /* Vector Single-Width Floating-Point Fused Multiply-Add Instructions */
>  #define OPFVV3(NAME, TD, T1, T2, TX1, TX2, HD, HS1, HS2, OP)       \
>  static void do_##NAME(void *vd, void *vs1, void *vs2, int i,       \
> -        CPURISCVState *env)                                        \
> +                      CPURISCVState *env)                          \
>  {                                                                  \
>      TX1 s1 =3D *((T1 *)vs1 + HS1(i));                                \
>      TX2 s2 =3D *((T2 *)vs2 + HS2(i));                                \
> @@ -3303,7 +3305,7 @@ GEN_VEXT_VV_ENV(vfmacc_vv_d, 8)
>
>  #define OPFVF3(NAME, TD, T1, T2, TX1, TX2, HD, HS2, OP)           \
>  static void do_##NAME(void *vd, uint64_t s1, void *vs2, int i,    \
> -        CPURISCVState *env)                                       \
> +                      CPURISCVState *env)                         \
>  {                                                                 \
>      TX2 s2 =3D *((T2 *)vs2 + HS2(i));                               \
>      TD d =3D *((TD *)vd + HD(i));                                   \
> @@ -3319,20 +3321,20 @@ GEN_VEXT_VF(vfmacc_vf_d, 8)
>
>  static uint16_t fnmacc16(uint16_t a, uint16_t b, uint16_t d, float_statu=
s *s)
>  {
> -    return float16_muladd(a, b, d,
> -            float_muladd_negate_c | float_muladd_negate_product, s);
> +    return float16_muladd(a, b, d, float_muladd_negate_c |
> +                                   float_muladd_negate_product, s);
>  }
>
>  static uint32_t fnmacc32(uint32_t a, uint32_t b, uint32_t d, float_statu=
s *s)
>  {
> -    return float32_muladd(a, b, d,
> -            float_muladd_negate_c | float_muladd_negate_product, s);
> +    return float32_muladd(a, b, d, float_muladd_negate_c |
> +                                   float_muladd_negate_product, s);
>  }
>
>  static uint64_t fnmacc64(uint64_t a, uint64_t b, uint64_t d, float_statu=
s *s)
>  {
> -    return float64_muladd(a, b, d,
> -            float_muladd_negate_c | float_muladd_negate_product, s);
> +    return float64_muladd(a, b, d, float_muladd_negate_c |
> +                                   float_muladd_negate_product, s);
>  }
>
>  RVVCALL(OPFVV3, vfnmacc_vv_h, OP_UUU_H, H2, H2, H2, fnmacc16)
> @@ -3434,20 +3436,20 @@ GEN_VEXT_VF(vfmadd_vf_d, 8)
>
>  static uint16_t fnmadd16(uint16_t a, uint16_t b, uint16_t d, float_statu=
s *s)
>  {
> -    return float16_muladd(d, b, a,
> -            float_muladd_negate_c | float_muladd_negate_product, s);
> +    return float16_muladd(d, b, a, float_muladd_negate_c |
> +                                   float_muladd_negate_product, s);
>  }
>
>  static uint32_t fnmadd32(uint32_t a, uint32_t b, uint32_t d, float_statu=
s *s)
>  {
> -    return float32_muladd(d, b, a,
> -            float_muladd_negate_c | float_muladd_negate_product, s);
> +    return float32_muladd(d, b, a, float_muladd_negate_c |
> +                                   float_muladd_negate_product, s);
>  }
>
>  static uint64_t fnmadd64(uint64_t a, uint64_t b, uint64_t d, float_statu=
s *s)
>  {
> -    return float64_muladd(d, b, a,
> -            float_muladd_negate_c | float_muladd_negate_product, s);
> +    return float64_muladd(d, b, a, float_muladd_negate_c |
> +                                   float_muladd_negate_product, s);
>  }
>
>  RVVCALL(OPFVV3, vfnmadd_vv_h, OP_UUU_H, H2, H2, H2, fnmadd16)
> @@ -3523,13 +3525,13 @@ GEN_VEXT_VF(vfnmsub_vf_d, 8)
>  static uint32_t fwmacc16(uint16_t a, uint16_t b, uint32_t d, float_statu=
s *s)
>  {
>      return float32_muladd(float16_to_float32(a, true, s),
> -                        float16_to_float32(b, true, s), d, 0, s);
> +                          float16_to_float32(b, true, s), d, 0, s);
>  }
>
>  static uint64_t fwmacc32(uint32_t a, uint32_t b, uint64_t d, float_statu=
s *s)
>  {
>      return float64_muladd(float32_to_float64(a, s),
> -                        float32_to_float64(b, s), d, 0, s);
> +                          float32_to_float64(b, s), d, 0, s);
>  }
>
>  RVVCALL(OPFVV3, vfwmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwmacc16)
> @@ -3544,15 +3546,16 @@ GEN_VEXT_VF(vfwmacc_vf_w, 8)
>  static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_stat=
us *s)
>  {
>      return float32_muladd(float16_to_float32(a, true, s),
> -                        float16_to_float32(b, true, s), d,
> -                        float_muladd_negate_c | float_muladd_negate_prod=
uct, s);
> +                          float16_to_float32(b, true, s), d,
> +                          float_muladd_negate_c | float_muladd_negate_pr=
oduct,
> +                          s);
>  }
>
>  static uint64_t fwnmacc32(uint32_t a, uint32_t b, uint64_t d, float_stat=
us *s)
>  {
> -    return float64_muladd(float32_to_float64(a, s),
> -                        float32_to_float64(b, s), d,
> -                        float_muladd_negate_c | float_muladd_negate_prod=
uct, s);
> +    return float64_muladd(float32_to_float64(a, s), float32_to_float64(b=
, s),
> +                          d, float_muladd_negate_c |
> +                             float_muladd_negate_product, s);
>  }
>
>  RVVCALL(OPFVV3, vfwnmacc_vv_h, WOP_UUU_H, H4, H2, H2, fwnmacc16)
> @@ -3567,15 +3570,15 @@ GEN_VEXT_VF(vfwnmacc_vf_w, 8)
>  static uint32_t fwmsac16(uint16_t a, uint16_t b, uint32_t d, float_statu=
s *s)
>  {
>      return float32_muladd(float16_to_float32(a, true, s),
> -                        float16_to_float32(b, true, s), d,
> -                        float_muladd_negate_c, s);
> +                          float16_to_float32(b, true, s), d,
> +                          float_muladd_negate_c, s);
>  }
>
>  static uint64_t fwmsac32(uint32_t a, uint32_t b, uint64_t d, float_statu=
s *s)
>  {
>      return float64_muladd(float32_to_float64(a, s),
> -                        float32_to_float64(b, s), d,
> -                        float_muladd_negate_c, s);
> +                          float32_to_float64(b, s), d,
> +                          float_muladd_negate_c, s);
>  }
>
>  RVVCALL(OPFVV3, vfwmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwmsac16)
> @@ -3590,15 +3593,15 @@ GEN_VEXT_VF(vfwmsac_vf_w, 8)
>  static uint32_t fwnmsac16(uint16_t a, uint16_t b, uint32_t d, float_stat=
us *s)
>  {
>      return float32_muladd(float16_to_float32(a, true, s),
> -                        float16_to_float32(b, true, s), d,
> -                        float_muladd_negate_product, s);
> +                          float16_to_float32(b, true, s), d,
> +                          float_muladd_negate_product, s);
>  }
>
>  static uint64_t fwnmsac32(uint32_t a, uint32_t b, uint64_t d, float_stat=
us *s)
>  {
>      return float64_muladd(float32_to_float64(a, s),
> -                        float32_to_float64(b, s), d,
> -                        float_muladd_negate_product, s);
> +                          float32_to_float64(b, s), d,
> +                          float_muladd_negate_product, s);
>  }
>
>  RVVCALL(OPFVV3, vfwnmsac_vv_h, WOP_UUU_H, H4, H2, H2, fwnmsac16)
> @@ -3616,9 +3619,9 @@ GEN_VEXT_VF(vfwnmsac_vf_w, 8)
>  #define OP_UU_W uint32_t, uint32_t, uint32_t
>  #define OP_UU_D uint64_t, uint64_t, uint64_t
>
> -#define OPFVV1(NAME, TD, T2, TX2, HD, HS2, OP)        \
> +#define OPFVV1(NAME, TD, T2, TX2, HD, HS2, OP)         \
>  static void do_##NAME(void *vd, void *vs2, int i,      \
> -        CPURISCVState *env)                            \
> +                      CPURISCVState *env)              \
>  {                                                      \
>      TX2 s2 =3D *((T2 *)vs2 + HS2(i));                    \
>      *((TD *)vd + HD(i)) =3D OP(s2, &env->fp_status);     \
> @@ -3626,7 +3629,7 @@ static void do_##NAME(void *vd, void *vs2, int i,  =
    \
>
>  #define GEN_VEXT_V_ENV(NAME, ESZ)                      \
>  void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
> -        CPURISCVState *env, uint32_t desc)             \
> +                  CPURISCVState *env, uint32_t desc)   \
>  {                                                      \
>      uint32_t vm =3D vext_vm(desc);                       \
>      uint32_t vl =3D env->vl;                             \
> @@ -3703,9 +3706,9 @@ static uint64_t frsqrt7(uint64_t f, int exp_size, i=
nt frac_size)
>      }
>
>      int idx =3D ((exp & 1) << (precision - 1)) |
> -                (frac >> (frac_size - precision + 1));
> +              (frac >> (frac_size - precision + 1));
>      uint64_t out_frac =3D (uint64_t)(lookup_table[idx]) <<
> -                            (frac_size - precision);
> +                        (frac_size - precision);
>      uint64_t out_exp =3D (3 * MAKE_64BIT_MASK(0, exp_size - 1) + ~exp) /=
 2;
>
>      uint64_t val =3D 0;
> @@ -3727,9 +3730,9 @@ static float16 frsqrt7_h(float16 f, float_status *s=
)
>       * frsqrt7(-subnormal) =3D canonical NaN
>       */
>      if (float16_is_signaling_nan(f, s) ||
> -            (float16_is_infinity(f) && sign) ||
> -            (float16_is_normal(f) && sign) ||
> -            (float16_is_zero_or_denormal(f) && !float16_is_zero(f) && si=
gn)) {
> +        (float16_is_infinity(f) && sign) ||
> +        (float16_is_normal(f) && sign) ||
> +        (float16_is_zero_or_denormal(f) && !float16_is_zero(f) && sign))=
 {
>          s->float_exception_flags |=3D float_flag_invalid;
>          return float16_default_nan(s);
>      }
> @@ -3767,9 +3770,9 @@ static float32 frsqrt7_s(float32 f, float_status *s=
)
>       * frsqrt7(-subnormal) =3D canonical NaN
>       */
>      if (float32_is_signaling_nan(f, s) ||
> -            (float32_is_infinity(f) && sign) ||
> -            (float32_is_normal(f) && sign) ||
> -            (float32_is_zero_or_denormal(f) && !float32_is_zero(f) && si=
gn)) {
> +        (float32_is_infinity(f) && sign) ||
> +        (float32_is_normal(f) && sign) ||
> +        (float32_is_zero_or_denormal(f) && !float32_is_zero(f) && sign))=
 {
>          s->float_exception_flags |=3D float_flag_invalid;
>          return float32_default_nan(s);
>      }
> @@ -3807,9 +3810,9 @@ static float64 frsqrt7_d(float64 f, float_status *s=
)
>       * frsqrt7(-subnormal) =3D canonical NaN
>       */
>      if (float64_is_signaling_nan(f, s) ||
> -            (float64_is_infinity(f) && sign) ||
> -            (float64_is_normal(f) && sign) ||
> -            (float64_is_zero_or_denormal(f) && !float64_is_zero(f) && si=
gn)) {
> +        (float64_is_infinity(f) && sign) ||
> +        (float64_is_normal(f) && sign) ||
> +        (float64_is_zero_or_denormal(f) && !float64_is_zero(f) && sign))=
 {
>          s->float_exception_flags |=3D float_flag_invalid;
>          return float64_default_nan(s);
>      }
> @@ -3897,18 +3900,18 @@ static uint64_t frec7(uint64_t f, int exp_size, i=
nt frac_size,
>                  ((s->float_rounding_mode =3D=3D float_round_up) && sign)=
) {
>                  /* Return greatest/negative finite value. */
>                  return (sign << (exp_size + frac_size)) |
> -                    (MAKE_64BIT_MASK(frac_size, exp_size) - 1);
> +                       (MAKE_64BIT_MASK(frac_size, exp_size) - 1);
>              } else {
>                  /* Return +-inf. */
>                  return (sign << (exp_size + frac_size)) |
> -                    MAKE_64BIT_MASK(frac_size, exp_size);
> +                       MAKE_64BIT_MASK(frac_size, exp_size);
>              }
>          }
>      }
>
>      int idx =3D frac >> (frac_size - precision);
>      uint64_t out_frac =3D (uint64_t)(lookup_table[idx]) <<
> -                            (frac_size - precision);
> +                        (frac_size - precision);
>      uint64_t out_exp =3D 2 * MAKE_64BIT_MASK(0, exp_size - 1) + ~exp;
>
>      if (out_exp =3D=3D 0 || out_exp =3D=3D UINT64_MAX) {
> @@ -4422,8 +4425,8 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
void *vs2, \
>                                                                \
>      for (i =3D env->vstart; i < vl; i++) {                      \
>          ETYPE s2 =3D *((ETYPE *)vs2 + H(i));                    \
> -        *((ETYPE *)vd + H(i))                                 \
> -          =3D (!vm && !vext_elem_mask(v0, i) ? s2 : s1);        \
> +        *((ETYPE *)vd + H(i)) =3D                               \
> +            (!vm && !vext_elem_mask(v0, i) ? s2 : s1);        \
>      }                                                         \
>      env->vstart =3D 0;                                          \
>      /* set tail elements to 1s */                             \
> @@ -4564,7 +4567,8 @@ GEN_VEXT_V_ENV(vfncvt_f_f_w_w, 4)
>  /* Vector Single-Width Integer Reduction Instructions */
>  #define GEN_VEXT_RED(NAME, TD, TS2, HD, HS2, OP)          \
>  void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
> -        void *vs2, CPURISCVState *env, uint32_t desc)     \
> +                  void *vs2, CPURISCVState *env,          \
> +                  uint32_t desc)                          \
>  {                                                         \
>      uint32_t vm =3D vext_vm(desc);                          \
>      uint32_t vl =3D env->vl;                                \
> @@ -5013,7 +5017,8 @@ GEN_VEXT_VSLIDEDOWN_VX(vslidedown_vx_d, uint64_t, H=
8)
>
>  #define GEN_VEXT_VSLIE1UP(BITWIDTH, H)                                  =
    \
>  static void vslide1up_##BITWIDTH(void *vd, void *v0, uint64_t s1,       =
    \
> -                     void *vs2, CPURISCVState *env, uint32_t desc)      =
    \
> +                                 void *vs2, CPURISCVState *env,         =
    \
> +                                 uint32_t desc)                         =
    \
>  {                                                                       =
    \
>      typedef uint##BITWIDTH##_t ETYPE;                                   =
    \
>      uint32_t vm =3D vext_vm(desc);                                      =
      \
> @@ -5061,7 +5066,8 @@ GEN_VEXT_VSLIDE1UP_VX(vslide1up_vx_d, 64)
>
>  #define GEN_VEXT_VSLIDE1DOWN(BITWIDTH, H)                               =
      \
>  static void vslide1down_##BITWIDTH(void *vd, void *v0, uint64_t s1,     =
      \
> -                       void *vs2, CPURISCVState *env, uint32_t desc)    =
      \
> +                                   void *vs2, CPURISCVState *env,       =
      \
> +                                   uint32_t desc)                       =
      \
>  {                                                                       =
      \
>      typedef uint##BITWIDTH##_t ETYPE;                                   =
      \
>      uint32_t vm =3D vext_vm(desc);                                      =
        \
> --
> 2.25.1
>
>

