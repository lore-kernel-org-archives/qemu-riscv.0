Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88137C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 00:16:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF1Id-0004X3-Tu; Sun, 17 Dec 2023 19:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1Ib-0004VK-BJ; Sun, 17 Dec 2023 19:15:57 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1IX-0006mY-K8; Sun, 17 Dec 2023 19:15:57 -0500
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3b9e6262fccso1967668b6e.3; 
 Sun, 17 Dec 2023 16:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702858549; x=1703463349; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V7JjP0b4PSWXq4Dfxlx4Q+AOD7AEeDXuNsg7KSpRO7E=;
 b=EhKiMWiv9UbYnlROCjSuInNv8USADM+zyerngVpENq6ROROU1Y/pMqGq2m/BL7FTQ6
 CLYScyKK2GMTZxImsH7YTpCWRoPxv2slbGeiIkdQwaEQJzdVfkHNmlAzSlZPc8mmZxHa
 OAhqrh+Qw8XUSaM9Wei/alLp+73hb+QNQXgsW45ajigA3x6dsGizs6rHJ/LxZ2ir6ulG
 IStGDPfMs1zIjGo/23eS7rMjc1E1umKXRAeL5dvQnlNFnPkNnJKgajrRcw77scLC2WoM
 4GYxSBs5h0o05N10RIu0DQqIp17WqTOKtXZFvXhqsWd9qxz76HU2p0zlT+oN06ndzI2O
 FEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702858549; x=1703463349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V7JjP0b4PSWXq4Dfxlx4Q+AOD7AEeDXuNsg7KSpRO7E=;
 b=lm+i04v6dP1tWcVniFDBqK/gw82ufrY0Oe79zdwQgffEJuG7rDLV3JRX4bk8J54Y4l
 8KW/Rad+pDqmaEL4JQNJEXzr+SMQn67XNAhbnjCkxoGI8EEw1hIaS3+OieBQfLBrxioi
 /PgkuSPdVnHBbrusxG1NQP6Ol2wrZfmaU/dIGAR/KTwrnd2wTrvgwMGBNEME/waS5W//
 wjjyRIjZ7g/2/Kdh3u+DTdgnnP+NvJEzNsoUE9bCnl9voPTYhC5aWPbepC8tr6W4eDqG
 /ubGfzVwz1bYJu6gYHl0am0WHWKnb/uPFWgAVZEiNSutRuzTamnyRjz5hBEcl/SVnNlP
 JrKw==
X-Gm-Message-State: AOJu0YwP3wWOUaJiZ8PVtoA81PfAJBFhDJkvOOL3bmZf7wkFGudfulkw
 QhGcvwHdx5v5987MSRpC+ViHMwrobG++NgQM3dk=
X-Google-Smtp-Source: AGHT+IEmePfPr3YI7FgsF9QPEkK/oFldU9jdvNEWFPhQU3xfKOUEb47GQ1uB4C2JLbz7VtD3fW83UQytK7hwRe3GSs0=
X-Received: by 2002:a05:6808:10c5:b0:3b9:e6fd:e0ad with SMTP id
 s5-20020a05680810c500b003b9e6fde0admr22822434ois.87.1702858548616; Sun, 17
 Dec 2023 16:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20231213-gdb-v17-0-777047380591@daynix.com>
 <20231213-gdb-v17-6-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-6-777047380591@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 10:15:22 +1000
Message-ID: <CAKmqyKONQ_FQnx8ts0ZKG1s5zu56vr=86_4P0UhR1c9-+mJTWw@mail.gmail.com>
Subject: Re: [PATCH v17 06/14] gdbstub: Change gdb_get_reg_cb and
 gdb_set_reg_cb
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Dec 13, 2023 at 5:47=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> Align the parameters of gdb_get_reg_cb and gdb_set_reg_cb with the
> gdb_read_register and gdb_write_register members of CPUClass to allow
> to unify the logic to access registers of the core and coprocessors
> in the future.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/gdbstub.h      |  4 +--
>  target/arm/internals.h      | 12 +++----
>  target/hexagon/internal.h   |  4 +--
>  target/microblaze/cpu.h     |  4 +--
>  gdbstub/gdbstub.c           |  6 ++--
>  target/arm/gdbstub.c        | 51 +++++++++++++++++++++---------
>  target/arm/gdbstub64.c      | 27 +++++++++++-----
>  target/hexagon/gdbstub.c    | 10 ++++--
>  target/loongarch/gdbstub.c  | 11 ++++---
>  target/m68k/helper.c        | 20 +++++++++---
>  target/microblaze/gdbstub.c |  9 ++++--
>  target/ppc/gdbstub.c        | 46 +++++++++++++++++++++------
>  target/riscv/gdbstub.c      | 46 ++++++++++++++++++++-------
>  target/s390x/gdbstub.c      | 77 ++++++++++++++++++++++++++++++++++-----=
------
>  14 files changed, 236 insertions(+), 91 deletions(-)
>
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index ac6fce99a64e..bcaab1bc750e 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -24,8 +24,8 @@ typedef struct GDBFeatureBuilder {
>
>
>  /* Get or set a register.  Returns the size of the register.  */
> -typedef int (*gdb_get_reg_cb)(CPUArchState *env, GByteArray *buf, int re=
g);
> -typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
> +typedef int (*gdb_get_reg_cb)(CPUState *cpu, GByteArray *buf, int reg);
> +typedef int (*gdb_set_reg_cb)(CPUState *cpu, uint8_t *buf, int reg);
>
>  /**
>   * gdb_register_coprocessor() - register a supplemental set of registers
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 1136710741f0..a08f461f444b 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1447,12 +1447,12 @@ static inline uint64_t pmu_counter_mask(CPUARMSta=
te *env)
>
>  #ifdef TARGET_AARCH64
>  GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cpu, int base_reg);
> -int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
> -int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
> -int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
> -int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg);
> -int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg=
);
> -int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg);
> +int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg);
> +int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg);
> +int aarch64_gdb_get_fpu_reg(CPUState *cs, GByteArray *buf, int reg);
> +int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg);
> +int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg);
> +int aarch64_gdb_set_pauth_reg(CPUState *cs, uint8_t *buf, int reg);
>  void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
>  void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
>  void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
> diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
> index d732b6bb3c73..beb08cb7e382 100644
> --- a/target/hexagon/internal.h
> +++ b/target/hexagon/internal.h
> @@ -33,8 +33,8 @@
>
>  int hexagon_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int hexagon_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> -int hexagon_hvx_gdb_read_register(CPUHexagonState *env, GByteArray *mem_=
buf, int n);
> -int hexagon_hvx_gdb_write_register(CPUHexagonState *env, uint8_t *mem_bu=
f, int n);
> +int hexagon_hvx_gdb_read_register(CPUState *env, GByteArray *mem_buf, in=
t n);
> +int hexagon_hvx_gdb_write_register(CPUState *env, uint8_t *mem_buf, int =
n);
>
>  void hexagon_debug_vreg(CPUHexagonState *env, int regnum);
>  void hexagon_debug_qreg(CPUHexagonState *env, int regnum);
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index b5374365f5f5..1906d8f266af 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -381,8 +381,8 @@ G_NORETURN void mb_cpu_do_unaligned_access(CPUState *=
cs, vaddr vaddr,
>  void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  int mb_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int mb_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> -int mb_cpu_gdb_read_stack_protect(CPUArchState *cpu, GByteArray *buf, in=
t reg);
> -int mb_cpu_gdb_write_stack_protect(CPUArchState *cpu, uint8_t *buf, int =
reg);
> +int mb_cpu_gdb_read_stack_protect(CPUState *cs, GByteArray *buf, int reg=
);
> +int mb_cpu_gdb_write_stack_protect(CPUState *cs, uint8_t *buf, int reg);
>
>  static inline uint32_t mb_cpu_read_msr(const CPUMBState *env)
>  {
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index a80729436b66..21fea7fffae8 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -502,7 +502,6 @@ const GDBFeature *gdb_find_static_feature(const char =
*xmlname)
>  static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
>  {
>      CPUClass *cc =3D CPU_GET_CLASS(cpu);
> -    CPUArchState *env =3D cpu_env(cpu);
>      GDBRegisterState *r;
>
>      if (reg < cc->gdb_num_core_regs) {
> @@ -513,7 +512,7 @@ static int gdb_read_register(CPUState *cpu, GByteArra=
y *buf, int reg)
>          for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
>              r =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
>              if (r->base_reg <=3D reg && reg < r->base_reg + r->feature->=
num_regs) {
> -                return r->get_reg(env, buf, reg - r->base_reg);
> +                return r->get_reg(cpu, buf, reg - r->base_reg);
>              }
>          }
>      }
> @@ -523,7 +522,6 @@ static int gdb_read_register(CPUState *cpu, GByteArra=
y *buf, int reg)
>  static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
>  {
>      CPUClass *cc =3D CPU_GET_CLASS(cpu);
> -    CPUArchState *env =3D cpu_env(cpu);
>      GDBRegisterState *r;
>
>      if (reg < cc->gdb_num_core_regs) {
> @@ -534,7 +532,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t =
*mem_buf, int reg)
>          for (guint i =3D 0; i < cpu->gdb_regs->len; i++) {
>              r =3D  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
>              if (r->base_reg <=3D reg && reg < r->base_reg + r->feature->=
num_regs) {
> -                return r->set_reg(env, mem_buf, reg - r->base_reg);
> +                return r->set_reg(cpu, mem_buf, reg - r->base_reg);
>              }
>          }
>      }
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index f2b201d31254..059d84f98e52 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -106,9 +106,10 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t=
 *mem_buf, int n)
>      return 0;
>  }
>
> -static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
> +static int vfp_gdb_get_reg(CPUState *cs, GByteArray *buf, int reg)
>  {
> -    ARMCPU *cpu =3D env_archcpu(env);
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
>      int nregs =3D cpu_isar_feature(aa32_simd_r32, cpu) ? 32 : 16;
>
>      /* VFP data registers are always little-endian.  */
> @@ -130,9 +131,10 @@ static int vfp_gdb_get_reg(CPUARMState *env, GByteAr=
ray *buf, int reg)
>      return 0;
>  }
>
> -static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
> +static int vfp_gdb_set_reg(CPUState *cs, uint8_t *buf, int reg)
>  {
> -    ARMCPU *cpu =3D env_archcpu(env);
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
>      int nregs =3D cpu_isar_feature(aa32_simd_r32, cpu) ? 32 : 16;
>
>      if (reg < nregs) {
> @@ -156,8 +158,11 @@ static int vfp_gdb_set_reg(CPUARMState *env, uint8_t=
 *buf, int reg)
>      return 0;
>  }
>
> -static int vfp_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg=
)
> +static int vfp_gdb_get_sysreg(CPUState *cs, GByteArray *buf, int reg)
>  {
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
>      switch (reg) {
>      case 0:
>          return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]);
> @@ -167,8 +172,11 @@ static int vfp_gdb_get_sysreg(CPUARMState *env, GByt=
eArray *buf, int reg)
>      return 0;
>  }
>
> -static int vfp_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
> +static int vfp_gdb_set_sysreg(CPUState *cs, uint8_t *buf, int reg)
>  {
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
>      switch (reg) {
>      case 0:
>          env->vfp.xregs[ARM_VFP_FPSID] =3D ldl_p(buf);
> @@ -180,8 +188,11 @@ static int vfp_gdb_set_sysreg(CPUARMState *env, uint=
8_t *buf, int reg)
>      return 0;
>  }
>
> -static int mve_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
> +static int mve_gdb_get_reg(CPUState *cs, GByteArray *buf, int reg)
>  {
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
>      switch (reg) {
>      case 0:
>          return gdb_get_reg32(buf, env->v7m.vpr);
> @@ -190,8 +201,11 @@ static int mve_gdb_get_reg(CPUARMState *env, GByteAr=
ray *buf, int reg)
>      }
>  }
>
> -static int mve_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
> +static int mve_gdb_set_reg(CPUState *cs, uint8_t *buf, int reg)
>  {
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
>      switch (reg) {
>      case 0:
>          env->v7m.vpr =3D ldl_p(buf);
> @@ -210,9 +224,10 @@ static int mve_gdb_set_reg(CPUARMState *env, uint8_t=
 *buf, int reg)
>   * We return the number of bytes copied
>   */
>
> -static int arm_gdb_get_sysreg(CPUARMState *env, GByteArray *buf, int reg=
)
> +static int arm_gdb_get_sysreg(CPUState *cs, GByteArray *buf, int reg)
>  {
> -    ARMCPU *cpu =3D env_archcpu(env);
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
>      const ARMCPRegInfo *ri;
>      uint32_t key;
>
> @@ -228,7 +243,7 @@ static int arm_gdb_get_sysreg(CPUARMState *env, GByte=
Array *buf, int reg)
>      return 0;
>  }
>
> -static int arm_gdb_set_sysreg(CPUARMState *env, uint8_t *buf, int reg)
> +static int arm_gdb_set_sysreg(CPUState *cs, uint8_t *buf, int reg)
>  {
>      return 0;
>  }
> @@ -367,8 +382,11 @@ static int m_sysreg_get(CPUARMState *env, GByteArray=
 *buf,
>      return gdb_get_reg32(buf, *ptr);
>  }
>
> -static int arm_gdb_get_m_systemreg(CPUARMState *env, GByteArray *buf, in=
t reg)
> +static int arm_gdb_get_m_systemreg(CPUState *cs, GByteArray *buf, int re=
g)
>  {
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
>      /*
>       * Here, we emulate MRS instruction, where CONTROL has a mix of
>       * banked and non-banked bits.
> @@ -379,7 +397,7 @@ static int arm_gdb_get_m_systemreg(CPUARMState *env, =
GByteArray *buf, int reg)
>      return m_sysreg_get(env, buf, reg, env->v7m.secure);
>  }
>
> -static int arm_gdb_set_m_systemreg(CPUARMState *env, uint8_t *buf, int r=
eg)
> +static int arm_gdb_set_m_systemreg(CPUState *cs, uint8_t *buf, int reg)
>  {
>      return 0; /* TODO */
>  }
> @@ -414,12 +432,15 @@ static GDBFeature *arm_gen_dynamic_m_systemreg_feat=
ure(CPUState *cs,
>   * For user-only, we see the non-secure registers via m_systemreg above.
>   * For secext, encode the non-secure view as even and secure view as odd=
.
>   */
> -static int arm_gdb_get_m_secextreg(CPUARMState *env, GByteArray *buf, in=
t reg)
> +static int arm_gdb_get_m_secextreg(CPUState *cs, GByteArray *buf, int re=
g)
>  {
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
>      return m_sysreg_get(env, buf, reg >> 1, reg & 1);
>  }
>
> -static int arm_gdb_set_m_secextreg(CPUARMState *env, uint8_t *buf, int r=
eg)
> +static int arm_gdb_set_m_secextreg(CPUState *cs, uint8_t *buf, int reg)
>  {
>      return 0; /* TODO */
>  }
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 5286d5c6043f..caa31ff3fa11 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -72,8 +72,11 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8=
_t *mem_buf, int n)
>      return 0;
>  }
>
> -int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg)
> +int aarch64_gdb_get_fpu_reg(CPUState *cs, GByteArray *buf, int reg)
>  {
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
>      switch (reg) {
>      case 0 ... 31:
>      {
> @@ -92,8 +95,11 @@ int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArr=
ay *buf, int reg)
>      }
>  }
>
> -int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_t *buf, int reg)
> +int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg)
>  {
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
>      switch (reg) {
>      case 0 ... 31:
>          /* 128 bit FP register */
> @@ -116,9 +122,10 @@ int aarch64_gdb_set_fpu_reg(CPUARMState *env, uint8_=
t *buf, int reg)
>      }
>  }
>
> -int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg)
> +int aarch64_gdb_get_sve_reg(CPUState *cs, GByteArray *buf, int reg)
>  {
> -    ARMCPU *cpu =3D env_archcpu(env);
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
>
>      switch (reg) {
>      /* The first 32 registers are the zregs */
> @@ -164,9 +171,10 @@ int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteA=
rray *buf, int reg)
>      return 0;
>  }
>
> -int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
> +int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
>  {
> -    ARMCPU *cpu =3D env_archcpu(env);
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
>
>      /* The first 32 registers are the zregs */
>      switch (reg) {
> @@ -210,8 +218,11 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_=
t *buf, int reg)
>      return 0;
>  }
>
> -int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg=
)
> +int aarch64_gdb_get_pauth_reg(CPUState *cs, GByteArray *buf, int reg)
>  {
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +
>      switch (reg) {
>      case 0: /* pauth_dmask */
>      case 1: /* pauth_cmask */
> @@ -241,7 +252,7 @@ int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByte=
Array *buf, int reg)
>      }
>  }
>
> -int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
> +int aarch64_gdb_set_pauth_reg(CPUState *cs, uint8_t *buf, int reg)
>  {
>      /* All pseudo registers are read-only. */
>      return 0;
> diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c
> index 54d37e006e03..6007e6462b99 100644
> --- a/target/hexagon/gdbstub.c
> +++ b/target/hexagon/gdbstub.c
> @@ -81,8 +81,11 @@ static int gdb_get_qreg(CPUHexagonState *env, GByteArr=
ay *mem_buf, int n)
>      return total;
>  }
>
> -int hexagon_hvx_gdb_read_register(CPUHexagonState *env, GByteArray *mem_=
buf, int n)
> +int hexagon_hvx_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int=
 n)
>  {
> +    HexagonCPU *cpu =3D HEXAGON_CPU(cs);
> +    CPUHexagonState *env =3D &cpu->env;
> +
>      if (n < NUM_VREGS) {
>          return gdb_get_vreg(env, mem_buf, n);
>      }
> @@ -115,8 +118,11 @@ static int gdb_put_qreg(CPUHexagonState *env, uint8_=
t *mem_buf, int n)
>      return MAX_VEC_SIZE_BYTES / 8;
>  }
>
> -int hexagon_hvx_gdb_write_register(CPUHexagonState *env, uint8_t *mem_bu=
f, int n)
> +int hexagon_hvx_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n=
)
>  {
> +    HexagonCPU *cpu =3D HEXAGON_CPU(cs);
> +    CPUHexagonState *env =3D &cpu->env;
> +
>     if (n < NUM_VREGS) {
>          return gdb_put_vreg(env, mem_buf, n);
>      }
> diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
> index 843a869450ee..22c6889011e6 100644
> --- a/target/loongarch/gdbstub.c
> +++ b/target/loongarch/gdbstub.c
> @@ -84,9 +84,11 @@ int loongarch_cpu_gdb_write_register(CPUState *cs, uin=
t8_t *mem_buf, int n)
>      return length;
>  }
>
> -static int loongarch_gdb_get_fpu(CPULoongArchState *env,
> -                                 GByteArray *mem_buf, int n)
> +static int loongarch_gdb_get_fpu(CPUState *cs, GByteArray *mem_buf, int =
n)
>  {
> +    LoongArchCPU *cpu =3D LOONGARCH_CPU(cs);
> +    CPULoongArchState *env =3D &cpu->env;
> +
>      if (0 <=3D n && n < 32) {
>          return gdb_get_reg64(mem_buf, env->fpr[n].vreg.D(0));
>      } else if (32 <=3D n && n < 40) {
> @@ -97,9 +99,10 @@ static int loongarch_gdb_get_fpu(CPULoongArchState *en=
v,
>      return 0;
>  }
>
> -static int loongarch_gdb_set_fpu(CPULoongArchState *env,
> -                                 uint8_t *mem_buf, int n)
> +static int loongarch_gdb_set_fpu(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    LoongArchCPU *cpu =3D LOONGARCH_CPU(cs);
> +    CPULoongArchState *env =3D &cpu->env;
>      int length =3D 0;
>
>      if (0 <=3D n && n < 32) {
> diff --git a/target/m68k/helper.c b/target/m68k/helper.c
> index 675f2dcd5ad4..a5ee4d87e325 100644
> --- a/target/m68k/helper.c
> +++ b/target/m68k/helper.c
> @@ -69,8 +69,11 @@ void m68k_cpu_list(void)
>      g_slist_free(list);
>  }
>
> -static int cf_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, in=
t n)
> +static int cf_fpu_gdb_get_reg(CPUState *cs, GByteArray *mem_buf, int n)
>  {
> +    M68kCPU *cpu =3D M68K_CPU(cs);
> +    CPUM68KState *env =3D &cpu->env;
> +
>      if (n < 8) {
>          float_status s;
>          return gdb_get_reg64(mem_buf, floatx80_to_float64(env->fregs[n].=
d, &s));
> @@ -86,8 +89,11 @@ static int cf_fpu_gdb_get_reg(CPUM68KState *env, GByte=
Array *mem_buf, int n)
>      return 0;
>  }
>
> -static int cf_fpu_gdb_set_reg(CPUM68KState *env, uint8_t *mem_buf, int n=
)
> +static int cf_fpu_gdb_set_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    M68kCPU *cpu =3D M68K_CPU(cs);
> +    CPUM68KState *env =3D &cpu->env;
> +
>      if (n < 8) {
>          float_status s;
>          env->fregs[n].d =3D float64_to_floatx80(ldq_p(mem_buf), &s);
> @@ -106,8 +112,11 @@ static int cf_fpu_gdb_set_reg(CPUM68KState *env, uin=
t8_t *mem_buf, int n)
>      return 0;
>  }
>
> -static int m68k_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, =
int n)
> +static int m68k_fpu_gdb_get_reg(CPUState *cs, GByteArray *mem_buf, int n=
)
>  {
> +    M68kCPU *cpu =3D M68K_CPU(cs);
> +    CPUM68KState *env =3D &cpu->env;
> +
>      if (n < 8) {
>          int len =3D gdb_get_reg16(mem_buf, env->fregs[n].l.upper);
>          len +=3D gdb_get_reg16(mem_buf, 0);
> @@ -125,8 +134,11 @@ static int m68k_fpu_gdb_get_reg(CPUM68KState *env, G=
ByteArray *mem_buf, int n)
>      return 0;
>  }
>
> -static int m68k_fpu_gdb_set_reg(CPUM68KState *env, uint8_t *mem_buf, int=
 n)
> +static int m68k_fpu_gdb_set_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    M68kCPU *cpu =3D M68K_CPU(cs);
> +    CPUM68KState *env =3D &cpu->env;
> +
>      if (n < 8) {
>          env->fregs[n].l.upper =3D lduw_be_p(mem_buf);
>          env->fregs[n].l.lower =3D ldq_be_p(mem_buf + 4);
> diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
> index 29ac6e9c0f72..6ffc5ad0752c 100644
> --- a/target/microblaze/gdbstub.c
> +++ b/target/microblaze/gdbstub.c
> @@ -94,8 +94,10 @@ int mb_cpu_gdb_read_register(CPUState *cs, GByteArray =
*mem_buf, int n)
>      return gdb_get_reg32(mem_buf, val);
>  }
>
> -int mb_cpu_gdb_read_stack_protect(CPUMBState *env, GByteArray *mem_buf, =
int n)
> +int mb_cpu_gdb_read_stack_protect(CPUState *cs, GByteArray *mem_buf, int=
 n)
>  {
> +    MicroBlazeCPU *cpu =3D MICROBLAZE_CPU(cs);
> +    CPUMBState *env =3D &cpu->env;
>      uint32_t val;
>
>      switch (n) {
> @@ -153,8 +155,11 @@ int mb_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
>      return 4;
>  }
>
> -int mb_cpu_gdb_write_stack_protect(CPUMBState *env, uint8_t *mem_buf, in=
t n)
> +int mb_cpu_gdb_write_stack_protect(CPUState *cs, uint8_t *mem_buf, int n=
)
>  {
> +    MicroBlazeCPU *cpu =3D MICROBLAZE_CPU(cs);
> +    CPUMBState *env =3D &cpu->env;
> +
>      switch (n) {
>      case GDB_SP_SHL:
>          env->slr =3D ldl_p(mem_buf);
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index 09b852464f38..8ca37b6bf952 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -369,8 +369,10 @@ static int gdb_find_spr_idx(CPUPPCState *env, int n)
>      return -1;
>  }
>
> -static int gdb_get_spr_reg(CPUPPCState *env, GByteArray *buf, int n)
> +static int gdb_get_spr_reg(CPUState *cs, GByteArray *buf, int n)
>  {
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
>      int reg;
>      int len;
>
> @@ -385,8 +387,10 @@ static int gdb_get_spr_reg(CPUPPCState *env, GByteAr=
ray *buf, int n)
>      return len;
>  }
>
> -static int gdb_set_spr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_set_spr_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
>      int reg;
>      int len;
>
> @@ -403,8 +407,10 @@ static int gdb_set_spr_reg(CPUPPCState *env, uint8_t=
 *mem_buf, int n)
>  }
>  #endif
>
> -static int gdb_get_float_reg(CPUPPCState *env, GByteArray *buf, int n)
> +static int gdb_get_float_reg(CPUState *cs, GByteArray *buf, int n)
>  {
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
>      uint8_t *mem_buf;
>      if (n < 32) {
>          gdb_get_reg64(buf, *cpu_fpr_ptr(env, n));
> @@ -421,8 +427,11 @@ static int gdb_get_float_reg(CPUPPCState *env, GByte=
Array *buf, int n)
>      return 0;
>  }
>
> -static int gdb_set_float_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_set_float_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +
>      if (n < 32) {
>          ppc_maybe_bswap_register(env, mem_buf, 8);
>          *cpu_fpr_ptr(env, n) =3D ldq_p(mem_buf);
> @@ -436,8 +445,10 @@ static int gdb_set_float_reg(CPUPPCState *env, uint8=
_t *mem_buf, int n)
>      return 0;
>  }
>
> -static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
> +static int gdb_get_avr_reg(CPUState *cs, GByteArray *buf, int n)
>  {
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
>      uint8_t *mem_buf;
>
>      if (n < 32) {
> @@ -462,8 +473,11 @@ static int gdb_get_avr_reg(CPUPPCState *env, GByteAr=
ray *buf, int n)
>      return 0;
>  }
>
> -static int gdb_set_avr_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_set_avr_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +
>      if (n < 32) {
>          ppc_avr_t *avr =3D cpu_avr_ptr(env, n);
>          ppc_maybe_bswap_register(env, mem_buf, 16);
> @@ -484,8 +498,11 @@ static int gdb_set_avr_reg(CPUPPCState *env, uint8_t=
 *mem_buf, int n)
>      return 0;
>  }
>
> -static int gdb_get_spe_reg(CPUPPCState *env, GByteArray *buf, int n)
> +static int gdb_get_spe_reg(CPUState *cs, GByteArray *buf, int n)
>  {
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +
>      if (n < 32) {
>  #if defined(TARGET_PPC64)
>          gdb_get_reg32(buf, env->gpr[n] >> 32);
> @@ -508,8 +525,11 @@ static int gdb_get_spe_reg(CPUPPCState *env, GByteAr=
ray *buf, int n)
>      return 0;
>  }
>
> -static int gdb_set_spe_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_set_spe_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +
>      if (n < 32) {
>  #if defined(TARGET_PPC64)
>          target_ulong lo =3D (uint32_t)env->gpr[n];
> @@ -537,8 +557,11 @@ static int gdb_set_spe_reg(CPUPPCState *env, uint8_t=
 *mem_buf, int n)
>      return 0;
>  }
>
> -static int gdb_get_vsx_reg(CPUPPCState *env, GByteArray *buf, int n)
> +static int gdb_get_vsx_reg(CPUState *cs, GByteArray *buf, int n)
>  {
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +
>      if (n < 32) {
>          gdb_get_reg64(buf, *cpu_vsrl_ptr(env, n));
>          ppc_maybe_bswap_register(env, gdb_get_reg_ptr(buf, 8), 8);
> @@ -547,8 +570,11 @@ static int gdb_get_vsx_reg(CPUPPCState *env, GByteAr=
ray *buf, int n)
>      return 0;
>  }
>
> -static int gdb_set_vsx_reg(CPUPPCState *env, uint8_t *mem_buf, int n)
> +static int gdb_set_vsx_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +    CPUPPCState *env =3D &cpu->env;
> +
>      if (n < 32) {
>          ppc_maybe_bswap_register(env, mem_buf, 8);
>          *cpu_vsrl_ptr(env, n) =3D ldq_p(mem_buf);
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index a879869fa1aa..68d0fdc1fd6c 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -108,8 +108,11 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8=
_t *mem_buf, int n)
>      return length;
>  }
>
> -static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
> +static int riscv_gdb_get_fpu(CPUState *cs, GByteArray *buf, int n)
>  {
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +
>      if (n < 32) {
>          if (env->misa_ext & RVD) {
>              return gdb_get_reg64(buf, env->fpr[n]);
> @@ -121,8 +124,11 @@ static int riscv_gdb_get_fpu(CPURISCVState *env, GBy=
teArray *buf, int n)
>      return 0;
>  }
>
> -static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n=
)
> +static int riscv_gdb_set_fpu(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +
>      if (n < 32) {
>          env->fpr[n] =3D ldq_p(mem_buf); /* always 64-bit */
>          return sizeof(uint64_t);
> @@ -130,8 +136,10 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uin=
t8_t *mem_buf, int n)
>      return 0;
>  }
>
> -static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int=
 n)
> +static int riscv_gdb_get_vector(CPUState *cs, GByteArray *buf, int n)
>  {
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
>      uint16_t vlenb =3D riscv_cpu_cfg(env)->vlen >> 3;
>      if (n < 32) {
>          int i;
> @@ -146,8 +154,10 @@ static int riscv_gdb_get_vector(CPURISCVState *env, =
GByteArray *buf, int n)
>      return 0;
>  }
>
> -static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, in=
t n)
> +static int riscv_gdb_set_vector(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
>      uint16_t vlenb =3D riscv_cpu_cfg(env)->vlen >> 3;
>      if (n < 32) {
>          int i;
> @@ -160,8 +170,11 @@ static int riscv_gdb_set_vector(CPURISCVState *env, =
uint8_t *mem_buf, int n)
>      return 0;
>  }
>
> -static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
> +static int riscv_gdb_get_csr(CPUState *cs, GByteArray *buf, int n)
>  {
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +
>      if (n < CSR_TABLE_SIZE) {
>          target_ulong val =3D 0;
>          int result;
> @@ -174,8 +187,11 @@ static int riscv_gdb_get_csr(CPURISCVState *env, GBy=
teArray *buf, int n)
>      return 0;
>  }
>
> -static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n=
)
> +static int riscv_gdb_set_csr(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> +    CPURISCVState *env =3D &cpu->env;
> +
>      if (n < CSR_TABLE_SIZE) {
>          target_ulong val =3D ldtul_p(mem_buf);
>          int result;
> @@ -188,25 +204,31 @@ static int riscv_gdb_set_csr(CPURISCVState *env, ui=
nt8_t *mem_buf, int n)
>      return 0;
>  }
>
> -static int riscv_gdb_get_virtual(CPURISCVState *cs, GByteArray *buf, int=
 n)
> +static int riscv_gdb_get_virtual(CPUState *cs, GByteArray *buf, int n)
>  {
>      if (n =3D=3D 0) {
>  #ifdef CONFIG_USER_ONLY
>          return gdb_get_regl(buf, 0);
>  #else
> -        return gdb_get_regl(buf, cs->priv);
> +        RISCVCPU *cpu =3D RISCV_CPU(cs);
> +        CPURISCVState *env =3D &cpu->env;
> +
> +        return gdb_get_regl(buf, env->priv);
>  #endif
>      }
>      return 0;
>  }
>
> -static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, in=
t n)
> +static int riscv_gdb_set_virtual(CPUState *cs, uint8_t *mem_buf, int n)
>  {
>      if (n =3D=3D 0) {
>  #ifndef CONFIG_USER_ONLY
> -        cs->priv =3D ldtul_p(mem_buf) & 0x3;
> -        if (cs->priv =3D=3D PRV_RESERVED) {
> -            cs->priv =3D PRV_S;
> +        RISCVCPU *cpu =3D RISCV_CPU(cs);
> +        CPURISCVState *env =3D &cpu->env;
> +
> +        env->priv =3D ldtul_p(mem_buf) & 0x3;
> +        if (env->priv =3D=3D PRV_RESERVED) {
> +            env->priv =3D PRV_S;
>          }
>  #endif
>          return sizeof(target_ulong);
> diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
> index 02c388dc323b..c1e7c59b8222 100644
> --- a/target/s390x/gdbstub.c
> +++ b/target/s390x/gdbstub.c
> @@ -70,8 +70,11 @@ int s390_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
>  #define S390_A0_REGNUM 0
>  #define S390_A15_REGNUM 15
>
> -static int cpu_read_ac_reg(CPUS390XState *env, GByteArray *buf, int n)
> +static int cpu_read_ac_reg(CPUState *cs, GByteArray *buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      switch (n) {
>      case S390_A0_REGNUM ... S390_A15_REGNUM:
>          return gdb_get_reg32(buf, env->aregs[n]);
> @@ -80,8 +83,11 @@ static int cpu_read_ac_reg(CPUS390XState *env, GByteAr=
ray *buf, int n)
>      }
>  }
>
> -static int cpu_write_ac_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
> +static int cpu_write_ac_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      switch (n) {
>      case S390_A0_REGNUM ... S390_A15_REGNUM:
>          env->aregs[n] =3D ldl_p(mem_buf);
> @@ -97,8 +103,11 @@ static int cpu_write_ac_reg(CPUS390XState *env, uint8=
_t *mem_buf, int n)
>  #define S390_F0_REGNUM 1
>  #define S390_F15_REGNUM 16
>
> -static int cpu_read_fp_reg(CPUS390XState *env, GByteArray *buf, int n)
> +static int cpu_read_fp_reg(CPUState *cs, GByteArray *buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      switch (n) {
>      case S390_FPC_REGNUM:
>          return gdb_get_reg32(buf, env->fpc);
> @@ -109,8 +118,11 @@ static int cpu_read_fp_reg(CPUS390XState *env, GByte=
Array *buf, int n)
>      }
>  }
>
> -static int cpu_write_fp_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
> +static int cpu_write_fp_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      switch (n) {
>      case S390_FPC_REGNUM:
>          env->fpc =3D ldl_p(mem_buf);
> @@ -129,8 +141,10 @@ static int cpu_write_fp_reg(CPUS390XState *env, uint=
8_t *mem_buf, int n)
>  #define S390_V16_REGNUM 16
>  #define S390_V31_REGNUM 31
>
> -static int cpu_read_vreg(CPUS390XState *env, GByteArray *buf, int n)
> +static int cpu_read_vreg(CPUState *cs, GByteArray *buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
>      int ret;
>
>      switch (n) {
> @@ -148,8 +162,11 @@ static int cpu_read_vreg(CPUS390XState *env, GByteAr=
ray *buf, int n)
>      return ret;
>  }
>
> -static int cpu_write_vreg(CPUS390XState *env, uint8_t *mem_buf, int n)
> +static int cpu_write_vreg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      switch (n) {
>      case S390_V0L_REGNUM ... S390_V15L_REGNUM:
>          env->vregs[n][1] =3D ldtul_p(mem_buf + 8);
> @@ -168,8 +185,11 @@ static int cpu_write_vreg(CPUS390XState *env, uint8_=
t *mem_buf, int n)
>  #define S390_C15_REGNUM 15
>
>  #ifndef CONFIG_USER_ONLY
> -static int cpu_read_c_reg(CPUS390XState *env, GByteArray *buf, int n)
> +static int cpu_read_c_reg(CPUState *cs, GByteArray *buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      switch (n) {
>      case S390_C0_REGNUM ... S390_C15_REGNUM:
>          return gdb_get_regl(buf, env->cregs[n]);
> @@ -178,8 +198,11 @@ static int cpu_read_c_reg(CPUS390XState *env, GByteA=
rray *buf, int n)
>      }
>  }
>
> -static int cpu_write_c_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
> +static int cpu_write_c_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      switch (n) {
>      case S390_C0_REGNUM ... S390_C15_REGNUM:
>          env->cregs[n] =3D ldtul_p(mem_buf);
> @@ -199,8 +222,11 @@ static int cpu_write_c_reg(CPUS390XState *env, uint8=
_t *mem_buf, int n)
>  #define S390_VIRT_BEA_REGNUM    2
>  #define S390_VIRT_PREFIX_REGNUM 3
>
> -static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, in=
t n)
> +static int cpu_read_virt_reg(CPUState *cs, GByteArray *mem_buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      switch (n) {
>      case S390_VIRT_CKC_REGNUM:
>          return gdb_get_regl(mem_buf, env->ckc);
> @@ -215,24 +241,27 @@ static int cpu_read_virt_reg(CPUS390XState *env, GB=
yteArray *mem_buf, int n)
>      }
>  }
>
> -static int cpu_write_virt_reg(CPUS390XState *env, uint8_t *mem_buf, int =
n)
> +static int cpu_write_virt_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      switch (n) {
>      case S390_VIRT_CKC_REGNUM:
>          env->ckc =3D ldtul_p(mem_buf);
> -        cpu_synchronize_post_init(env_cpu(env));
> +        cpu_synchronize_post_init(cs);
>          return 8;
>      case S390_VIRT_CPUTM_REGNUM:
>          env->cputm =3D ldtul_p(mem_buf);
> -        cpu_synchronize_post_init(env_cpu(env));
> +        cpu_synchronize_post_init(cs);
>          return 8;
>      case S390_VIRT_BEA_REGNUM:
>          env->gbea =3D ldtul_p(mem_buf);
> -        cpu_synchronize_post_init(env_cpu(env));
> +        cpu_synchronize_post_init(cs);
>          return 8;
>      case S390_VIRT_PREFIX_REGNUM:
>          env->psa =3D ldtul_p(mem_buf);
> -        cpu_synchronize_post_init(env_cpu(env));
> +        cpu_synchronize_post_init(cs);
>          return 8;
>      default:
>          return 0;
> @@ -245,8 +274,11 @@ static int cpu_write_virt_reg(CPUS390XState *env, ui=
nt8_t *mem_buf, int n)
>  #define S390_VIRT_KVM_PFS_REGNUM    2
>  #define S390_VIRT_KVM_PFC_REGNUM    3
>
> -static int cpu_read_virt_kvm_reg(CPUS390XState *env, GByteArray *mem_buf=
, int n)
> +static int cpu_read_virt_kvm_reg(CPUState *cs, GByteArray *mem_buf, int =
n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      switch (n) {
>      case S390_VIRT_KVM_PP_REGNUM:
>          return gdb_get_regl(mem_buf, env->pp);
> @@ -261,8 +293,11 @@ static int cpu_read_virt_kvm_reg(CPUS390XState *env,=
 GByteArray *mem_buf, int n)
>      }
>  }
>
> -static int cpu_write_virt_kvm_reg(CPUS390XState *env, uint8_t *mem_buf, =
int n)
> +static int cpu_write_virt_kvm_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      switch (n) {
>      case S390_VIRT_KVM_PP_REGNUM:
>          env->pp =3D ldtul_p(mem_buf);
> @@ -292,13 +327,19 @@ static int cpu_write_virt_kvm_reg(CPUS390XState *en=
v, uint8_t *mem_buf, int n)
>  #define S390_GS_GSSM_REGNUM     2
>  #define S390_GS_GSEPLA_REGNUM   3
>
> -static int cpu_read_gs_reg(CPUS390XState *env, GByteArray *buf, int n)
> +static int cpu_read_gs_reg(CPUState *cs, GByteArray *buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      return gdb_get_regl(buf, env->gscb[n]);
>  }
>
> -static int cpu_write_gs_reg(CPUS390XState *env, uint8_t *mem_buf, int n)
> +static int cpu_write_gs_reg(CPUState *cs, uint8_t *mem_buf, int n)
>  {
> +    S390CPU *cpu =3D S390_CPU(cs);
> +    CPUS390XState *env =3D &cpu->env;
> +
>      env->gscb[n] =3D ldtul_p(mem_buf);
>      cpu_synchronize_post_init(env_cpu(env));
>      return 8;
>
> --
> 2.43.0
>
>

