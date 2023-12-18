Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24DDC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 00:13:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF1G3-00032k-6q; Sun, 17 Dec 2023 19:13:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1G1-00030V-1J; Sun, 17 Dec 2023 19:13:17 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1Fy-00062k-8Q; Sun, 17 Dec 2023 19:13:16 -0500
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3b9e2a014e8so2096425b6e.2; 
 Sun, 17 Dec 2023 16:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702858392; x=1703463192; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mn9xLj3jw1T+Iy3TiaFjCltgW0EDy5VqskWOh0PRzMw=;
 b=Z01/RzOoiwa3OQk8+qoFghH6HpPssjkw1Do24K6Da/qMS49qI14uIs3QEhbJga9OQy
 0mI/WUd92oUyekAz0GQDAcnMSoP9f7Fxz0HTSb5T2k/ImOF7xswdfmzdVeMa33Xc7U3Z
 sUFDOAue5b2w0ueh9mNABqTkmuNy7x/VkyscsXiWkFrDBTq2EOvMACAD+fOlt3Eh0M/2
 cMTJJ7NX5XrXyOeQKuLCg2a6sw6Ng9Qux5ZNTWqyWDre/7fXQpBdTXhvurbeUYhh2k3N
 YQ/WM/ja9L/lX2hphHNt+5RjwxHpsoNNTa9OFVWxr67/EwnPyAhdRlNijfWra/TjIKMB
 D9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702858392; x=1703463192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mn9xLj3jw1T+Iy3TiaFjCltgW0EDy5VqskWOh0PRzMw=;
 b=bU7Fru4HamqfkCTh8PVsZk/FltAiym3WQ/cyT6h+vR9QriKjW9m5vx+JUZZVLpT7K6
 tZx7R9UkX1IA93yzl11WIKFJ7d/DrHtYGsXcYUvEPF29el6w9XEhNCVx5OWRetSN/+3Q
 hoQZGyAmC/VSb/ayXS96i01MMZjDBK0IEZhAl+1XzSnM1eLgLNLg6VNSo+mSf2/k62gO
 gRCQ+lHVjg4J4jQRAF40P8huUAmn8U8JJ2EHpPD12LV84/8FsFCfjMtLoSETGZL8N6OS
 ZBcL/oWz3IdNM8/qZoShA0CG1ltvkHtH4K2QFT9/xxpHr+U1ZVKk0lGtrO2Qp0YR1uvJ
 ORow==
X-Gm-Message-State: AOJu0Yzo1qaVMXk+k5g8J8PNf/KhcKTMdHMFNsgY1wbe1VNAICUg5Nla
 izab5kyfq7yI40BhK9OiQuLeSnBDS+LgZKV5H8U=
X-Google-Smtp-Source: AGHT+IGoytgnoAr/fyEhfEC3qGy8kZXFbOlswky9kUVcQexSyO9CWf8N38wuadSsokqarBMS28/SjeysqJ3UJB9gKkc=
X-Received: by 2002:a05:6808:140f:b0:3b8:6274:5b8 with SMTP id
 w15-20020a056808140f00b003b8627405b8mr23074438oiv.37.1702858391744; Sun, 17
 Dec 2023 16:13:11 -0800 (PST)
MIME-Version: 1.0
References: <20231213-gdb-v17-0-777047380591@daynix.com>
 <20231213-gdb-v17-4-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-4-777047380591@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 10:12:45 +1000
Message-ID: <CAKmqyKNn=bowCs_-eV=6qdUKhtuV9tcLPm65seRd76CofTn16w@mail.gmail.com>
Subject: Re: [PATCH v17 04/14] gdbstub: Use GDBFeature for
 gdb_register_coprocessor
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x235.google.com
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

On Wed, Dec 13, 2023 at 4:42=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> This is a tree-wide change to introduce GDBFeature parameter to
> gdb_register_coprocessor(). The new parameter just replaces num_regs
> and xml parameters for now. GDBFeature will be utilized to simplify XML
> lookup in a following change.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/gdbstub.h     |  2 +-
>  gdbstub/gdbstub.c          | 13 +++++++------
>  target/arm/gdbstub.c       | 35 +++++++++++++++++++----------------
>  target/hexagon/cpu.c       |  3 +--
>  target/loongarch/gdbstub.c |  2 +-
>  target/m68k/helper.c       |  6 +++---
>  target/microblaze/cpu.c    |  5 +++--
>  target/ppc/gdbstub.c       | 11 ++++++-----
>  target/riscv/gdbstub.c     | 20 ++++++++++++--------
>  target/s390x/gdbstub.c     | 28 +++++++---------------------
>  10 files changed, 60 insertions(+), 65 deletions(-)
>
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index d8a3c56fa2b8..ac6fce99a64e 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -38,7 +38,7 @@ typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_=
t *buf, int reg);
>   */
>  void gdb_register_coprocessor(CPUState *cpu,
>                                gdb_get_reg_cb get_reg, gdb_set_reg_cb set=
_reg,
> -                              int num_regs, const char *xml, int g_pos);
> +                              const GDBFeature *feature, int g_pos);
>
>  /**
>   * gdbserver_start: start the gdb server
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 46d752bbc2cd..068180c83c76 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -544,7 +544,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t =
*mem_buf, int reg)
>
>  void gdb_register_coprocessor(CPUState *cpu,
>                                gdb_get_reg_cb get_reg, gdb_set_reg_cb set=
_reg,
> -                              int num_regs, const char *xml, int g_pos)
> +                              const GDBFeature *feature, int g_pos)
>  {
>      GDBRegisterState *s;
>      guint i;
> @@ -553,7 +553,7 @@ void gdb_register_coprocessor(CPUState *cpu,
>          for (i =3D 0; i < cpu->gdb_regs->len; i++) {
>              /* Check for duplicates.  */
>              s =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
> -            if (strcmp(s->xml, xml) =3D=3D 0) {
> +            if (strcmp(s->xml, feature->xmlname) =3D=3D 0) {
>                  return;
>              }
>          }
> @@ -565,17 +565,18 @@ void gdb_register_coprocessor(CPUState *cpu,
>      g_array_set_size(cpu->gdb_regs, i + 1);
>      s =3D &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
>      s->base_reg =3D cpu->gdb_num_regs;
> -    s->num_regs =3D num_regs;
> +    s->num_regs =3D feature->num_regs;
>      s->get_reg =3D get_reg;
>      s->set_reg =3D set_reg;
> -    s->xml =3D xml;
> +    s->xml =3D feature->xml;
>
>      /* Add to end of list.  */
> -    cpu->gdb_num_regs +=3D num_regs;
> +    cpu->gdb_num_regs +=3D feature->num_regs;
>      if (g_pos) {
>          if (g_pos !=3D s->base_reg) {
>              error_report("Error: Bad gdb register numbering for '%s', "
> -                         "expected %d got %d", xml, g_pos, s->base_reg);
> +                         "expected %d got %d", feature->xml,
> +                         g_pos, s->base_reg);
>          } else {
>              cpu->gdb_num_g_regs =3D cpu->gdb_num_regs;
>          }
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 5949adfb31ae..f2b201d31254 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -483,14 +483,14 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU =
*cpu)
>           */
>  #ifdef TARGET_AARCH64
>          if (isar_feature_aa64_sve(&cpu->isar)) {
> -            int nreg =3D arm_gen_dynamic_svereg_feature(cs, cs->gdb_num_=
regs)->num_regs;
> +            GDBFeature *feature =3D arm_gen_dynamic_svereg_feature(cs, c=
s->gdb_num_regs);
>              gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
> -                                     aarch64_gdb_set_sve_reg, nreg,
> -                                     "sve-registers.xml", 0);
> +                                     aarch64_gdb_set_sve_reg, feature, 0=
);
>          } else {
>              gdb_register_coprocessor(cs, aarch64_gdb_get_fpu_reg,
>                                       aarch64_gdb_set_fpu_reg,
> -                                     34, "aarch64-fpu.xml", 0);
> +                                     gdb_find_static_feature("aarch64-fp=
u.xml"),
> +                                     0);
>          }
>          /*
>           * Note that we report pauth information via the feature name
> @@ -501,19 +501,22 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU =
*cpu)
>          if (isar_feature_aa64_pauth(&cpu->isar)) {
>              gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
>                                       aarch64_gdb_set_pauth_reg,
> -                                     4, "aarch64-pauth.xml", 0);
> +                                     gdb_find_static_feature("aarch64-pa=
uth.xml"),
> +                                     0);
>          }
>  #endif
>      } else {
>          if (arm_feature(env, ARM_FEATURE_NEON)) {
>              gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_re=
g,
> -                                     49, "arm-neon.xml", 0);
> +                                     gdb_find_static_feature("arm-neon.x=
ml"),
> +                                     0);
>          } else if (cpu_isar_feature(aa32_simd_r32, cpu)) {
>              gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_re=
g,
> -                                     33, "arm-vfp3.xml", 0);
> +                                     gdb_find_static_feature("arm-vfp3.x=
ml"),
> +                                     0);
>          } else if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
>              gdb_register_coprocessor(cs, vfp_gdb_get_reg, vfp_gdb_set_re=
g,
> -                                     17, "arm-vfp.xml", 0);
> +                                     gdb_find_static_feature("arm-vfp.xm=
l"), 0);
>          }
>          if (!arm_feature(env, ARM_FEATURE_M)) {
>              /*
> @@ -521,29 +524,29 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU =
*cpu)
>               * expose to gdb.
>               */
>              gdb_register_coprocessor(cs, vfp_gdb_get_sysreg, vfp_gdb_set=
_sysreg,
> -                                     2, "arm-vfp-sysregs.xml", 0);
> +                                     gdb_find_static_feature("arm-vfp-sy=
sregs.xml"),
> +                                     0);
>          }
>      }
>      if (cpu_isar_feature(aa32_mve, cpu) && tcg_enabled()) {
>          gdb_register_coprocessor(cs, mve_gdb_get_reg, mve_gdb_set_reg,
> -                                 1, "arm-m-profile-mve.xml", 0);
> +                                 gdb_find_static_feature("arm-m-profile-=
mve.xml"),
> +                                 0);
>      }
>      gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
> -                             arm_gen_dynamic_sysreg_feature(cs, cs->gdb_=
num_regs)->num_regs,
> -                             "system-registers.xml", 0);
> +                             arm_gen_dynamic_sysreg_feature(cs, cs->gdb_=
num_regs),
> +                             0);
>
>  #ifdef CONFIG_TCG
>      if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
>          gdb_register_coprocessor(cs,
>              arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
> -            arm_gen_dynamic_m_systemreg_feature(cs, cs->gdb_num_regs)->n=
um_regs,
> -            "arm-m-system.xml", 0);
> +            arm_gen_dynamic_m_systemreg_feature(cs, cs->gdb_num_regs), 0=
);
>  #ifndef CONFIG_USER_ONLY
>          if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>              gdb_register_coprocessor(cs,
>                  arm_gdb_get_m_secextreg, arm_gdb_set_m_secextreg,
> -                arm_gen_dynamic_m_secextreg_feature(cs, cs->gdb_num_regs=
)->num_regs,
> -                "arm-m-secext.xml", 0);
> +                arm_gen_dynamic_m_secextreg_feature(cs, cs->gdb_num_regs=
), 0);
>          }
>  #endif
>      }
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index 9d1ffc3b4bb6..65ac9c75ad08 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -341,8 +341,7 @@ static void hexagon_cpu_realize(DeviceState *dev, Err=
or **errp)
>
>      gdb_register_coprocessor(cs, hexagon_hvx_gdb_read_register,
>                               hexagon_hvx_gdb_write_register,
> -                             NUM_VREGS + NUM_QREGS,
> -                             "hexagon-hvx.xml", 0);
> +                             gdb_find_static_feature("hexagon-hvx.xml"),=
 0);
>
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
> diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
> index 5fc2f19e965e..843a869450ee 100644
> --- a/target/loongarch/gdbstub.c
> +++ b/target/loongarch/gdbstub.c
> @@ -118,5 +118,5 @@ static int loongarch_gdb_set_fpu(CPULoongArchState *e=
nv,
>  void loongarch_cpu_register_gdb_regs_for_features(CPUState *cs)
>  {
>      gdb_register_coprocessor(cs, loongarch_gdb_get_fpu, loongarch_gdb_se=
t_fpu,
> -                             41, "loongarch-fpu.xml", 0);
> +                             gdb_find_static_feature("loongarch-fpu.xml"=
), 0);
>  }
> diff --git a/target/m68k/helper.c b/target/m68k/helper.c
> index 0a1544cd68d9..675f2dcd5ad4 100644
> --- a/target/m68k/helper.c
> +++ b/target/m68k/helper.c
> @@ -152,10 +152,10 @@ void m68k_cpu_init_gdb(M68kCPU *cpu)
>
>      if (m68k_feature(env, M68K_FEATURE_CF_FPU)) {
>          gdb_register_coprocessor(cs, cf_fpu_gdb_get_reg, cf_fpu_gdb_set_=
reg,
> -                                 11, "cf-fp.xml", 18);
> +                                 gdb_find_static_feature("cf-fp.xml"), 1=
8);
>      } else if (m68k_feature(env, M68K_FEATURE_FPU)) {
> -        gdb_register_coprocessor(cs, m68k_fpu_gdb_get_reg,
> -                                 m68k_fpu_gdb_set_reg, 11, "m68k-fp.xml"=
, 18);
> +        gdb_register_coprocessor(cs, m68k_fpu_gdb_get_reg, m68k_fpu_gdb_=
set_reg,
> +                                 gdb_find_static_feature("m68k-fp.xml"),=
 18);
>      }
>      /* TODO: Add [E]MAC registers.  */
>  }
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index bbb3335cadd8..1998f69828f9 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -297,8 +297,9 @@ static void mb_cpu_initfn(Object *obj)
>      CPUMBState *env =3D &cpu->env;
>
>      gdb_register_coprocessor(CPU(cpu), mb_cpu_gdb_read_stack_protect,
> -                             mb_cpu_gdb_write_stack_protect, 2,
> -                             "microblaze-stack-protect.xml", 0);
> +                             mb_cpu_gdb_write_stack_protect,
> +                             gdb_find_static_feature("microblaze-stack-p=
rotect.xml"),
> +                             0);
>
>      set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
>
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index e3be3dbd109a..09b852464f38 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -570,23 +570,24 @@ void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pc=
c)
>  {
>      if (pcc->insns_flags & PPC_FLOAT) {
>          gdb_register_coprocessor(cs, gdb_get_float_reg, gdb_set_float_re=
g,
> -                                 33, "power-fpu.xml", 0);
> +                                 gdb_find_static_feature("power-fpu.xml"=
), 0);
>      }
>      if (pcc->insns_flags & PPC_ALTIVEC) {
>          gdb_register_coprocessor(cs, gdb_get_avr_reg, gdb_set_avr_reg,
> -                                 34, "power-altivec.xml", 0);
> +                                 gdb_find_static_feature("power-altivec.=
xml"),
> +                                 0);
>      }
>      if (pcc->insns_flags & PPC_SPE) {
>          gdb_register_coprocessor(cs, gdb_get_spe_reg, gdb_set_spe_reg,
> -                                 34, "power-spe.xml", 0);
> +                                 gdb_find_static_feature("power-spe.xml"=
), 0);
>      }
>      if (pcc->insns_flags2 & PPC2_VSX) {
>          gdb_register_coprocessor(cs, gdb_get_vsx_reg, gdb_set_vsx_reg,
> -                                 32, "power-vsx.xml", 0);
> +                                 gdb_find_static_feature("power-vsx.xml"=
), 0);
>      }
>  #ifndef CONFIG_USER_ONLY
>      gdb_gen_spr_feature(cs);
>      gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
> -                             pcc->gdb_spr.num_regs, "power-spr.xml", 0);
> +                             &pcc->gdb_spr, 0);
>  #endif
>  }
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 76b72a959549..a879869fa1aa 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -311,28 +311,32 @@ void riscv_cpu_register_gdb_regs_for_features(CPUSt=
ate *cs)
>      CPURISCVState *env =3D &cpu->env;
>      if (env->misa_ext & RVD) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fp=
u,
> -                                 32, "riscv-64bit-fpu.xml", 0);
> +                                 gdb_find_static_feature("riscv-64bit-fp=
u.xml"),
> +                                 0);
>      } else if (env->misa_ext & RVF) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fp=
u,
> -                                 32, "riscv-32bit-fpu.xml", 0);
> +                                 gdb_find_static_feature("riscv-32bit-fp=
u.xml"),
> +                                 0);
>      }
>      if (env->misa_ext & RVV) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_vector,
>                                   riscv_gdb_set_vector,
> -                                 ricsv_gen_dynamic_vector_feature(cs, cs=
->gdb_num_regs)->num_regs,
> -                                 "riscv-vector.xml", 0);
> +                                 ricsv_gen_dynamic_vector_feature(cs, cs=
->gdb_num_regs),
> +                                 0);
>      }
>      switch (mcc->misa_mxl_max) {
>      case MXL_RV32:
>          gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
>                                   riscv_gdb_set_virtual,
> -                                 1, "riscv-32bit-virtual.xml", 0);
> +                                 gdb_find_static_feature("riscv-32bit-vi=
rtual.xml"),
> +                                 0);
>          break;
>      case MXL_RV64:
>      case MXL_RV128:
>          gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
>                                   riscv_gdb_set_virtual,
> -                                 1, "riscv-64bit-virtual.xml", 0);
> +                                 gdb_find_static_feature("riscv-64bit-vi=
rtual.xml"),
> +                                 0);
>          break;
>      default:
>          g_assert_not_reached();
> @@ -340,7 +344,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUStat=
e *cs)
>
>      if (cpu->cfg.ext_zicsr) {
>          gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_cs=
r,
> -                                 riscv_gen_dynamic_csr_feature(cs, cs->g=
db_num_regs)->num_regs,
> -                                 "riscv-csr.xml", 0);
> +                                 riscv_gen_dynamic_csr_feature(cs, cs->g=
db_num_regs),
> +                                 0);
>      }
>  }
> diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
> index 6fbfd41bc867..02c388dc323b 100644
> --- a/target/s390x/gdbstub.c
> +++ b/target/s390x/gdbstub.c
> @@ -69,8 +69,6 @@ int s390_cpu_gdb_write_register(CPUState *cs, uint8_t *=
mem_buf, int n)
>  /* the values represent the positions in s390-acr.xml */
>  #define S390_A0_REGNUM 0
>  #define S390_A15_REGNUM 15
> -/* total number of registers in s390-acr.xml */
> -#define S390_NUM_AC_REGS 16
>
>  static int cpu_read_ac_reg(CPUS390XState *env, GByteArray *buf, int n)
>  {
> @@ -98,8 +96,6 @@ static int cpu_write_ac_reg(CPUS390XState *env, uint8_t=
 *mem_buf, int n)
>  #define S390_FPC_REGNUM 0
>  #define S390_F0_REGNUM 1
>  #define S390_F15_REGNUM 16
> -/* total number of registers in s390-fpr.xml */
> -#define S390_NUM_FP_REGS 17
>
>  static int cpu_read_fp_reg(CPUS390XState *env, GByteArray *buf, int n)
>  {
> @@ -132,8 +128,6 @@ static int cpu_write_fp_reg(CPUS390XState *env, uint8=
_t *mem_buf, int n)
>  #define S390_V15L_REGNUM 15
>  #define S390_V16_REGNUM 16
>  #define S390_V31_REGNUM 31
> -/* total number of registers in s390-vx.xml */
> -#define S390_NUM_VREGS 32
>
>  static int cpu_read_vreg(CPUS390XState *env, GByteArray *buf, int n)
>  {
> @@ -172,8 +166,6 @@ static int cpu_write_vreg(CPUS390XState *env, uint8_t=
 *mem_buf, int n)
>  /* the values represent the positions in s390-cr.xml */
>  #define S390_C0_REGNUM 0
>  #define S390_C15_REGNUM 15
> -/* total number of registers in s390-cr.xml */
> -#define S390_NUM_C_REGS 16
>
>  #ifndef CONFIG_USER_ONLY
>  static int cpu_read_c_reg(CPUS390XState *env, GByteArray *buf, int n)
> @@ -206,8 +198,6 @@ static int cpu_write_c_reg(CPUS390XState *env, uint8_=
t *mem_buf, int n)
>  #define S390_VIRT_CPUTM_REGNUM  1
>  #define S390_VIRT_BEA_REGNUM    2
>  #define S390_VIRT_PREFIX_REGNUM 3
> -/* total number of registers in s390-virt.xml */
> -#define S390_NUM_VIRT_REGS 4
>
>  static int cpu_read_virt_reg(CPUS390XState *env, GByteArray *mem_buf, in=
t n)
>  {
> @@ -254,8 +244,6 @@ static int cpu_write_virt_reg(CPUS390XState *env, uin=
t8_t *mem_buf, int n)
>  #define S390_VIRT_KVM_PFT_REGNUM    1
>  #define S390_VIRT_KVM_PFS_REGNUM    2
>  #define S390_VIRT_KVM_PFC_REGNUM    3
> -/* total number of registers in s390-virt-kvm.xml */
> -#define S390_NUM_VIRT_KVM_REGS 4
>
>  static int cpu_read_virt_kvm_reg(CPUS390XState *env, GByteArray *mem_buf=
, int n)
>  {
> @@ -303,8 +291,6 @@ static int cpu_write_virt_kvm_reg(CPUS390XState *env,=
 uint8_t *mem_buf, int n)
>  #define S390_GS_GSD_REGNUM      1
>  #define S390_GS_GSSM_REGNUM     2
>  #define S390_GS_GSEPLA_REGNUM   3
> -/* total number of registers in s390-gs.xml */
> -#define S390_NUM_GS_REGS 4
>
>  static int cpu_read_gs_reg(CPUS390XState *env, GByteArray *buf, int n)
>  {
> @@ -322,33 +308,33 @@ void s390_cpu_gdb_init(CPUState *cs)
>  {
>      gdb_register_coprocessor(cs, cpu_read_ac_reg,
>                               cpu_write_ac_reg,
> -                             S390_NUM_AC_REGS, "s390-acr.xml", 0);
> +                             gdb_find_static_feature("s390-acr.xml"), 0)=
;
>
>      gdb_register_coprocessor(cs, cpu_read_fp_reg,
>                               cpu_write_fp_reg,
> -                             S390_NUM_FP_REGS, "s390-fpr.xml", 0);
> +                             gdb_find_static_feature("s390-fpr.xml"), 0)=
;
>
>      gdb_register_coprocessor(cs, cpu_read_vreg,
>                               cpu_write_vreg,
> -                             S390_NUM_VREGS, "s390-vx.xml", 0);
> +                             gdb_find_static_feature("s390-vx.xml"), 0);
>
>      gdb_register_coprocessor(cs, cpu_read_gs_reg,
>                               cpu_write_gs_reg,
> -                             S390_NUM_GS_REGS, "s390-gs.xml", 0);
> +                             gdb_find_static_feature("s390-gs.xml"), 0);
>
>  #ifndef CONFIG_USER_ONLY
>      gdb_register_coprocessor(cs, cpu_read_c_reg,
>                               cpu_write_c_reg,
> -                             S390_NUM_C_REGS, "s390-cr.xml", 0);
> +                             gdb_find_static_feature("s390-cr.xml"), 0);
>
>      gdb_register_coprocessor(cs, cpu_read_virt_reg,
>                               cpu_write_virt_reg,
> -                             S390_NUM_VIRT_REGS, "s390-virt.xml", 0);
> +                             gdb_find_static_feature("s390-virt.xml"), 0=
);
>
>      if (kvm_enabled()) {
>          gdb_register_coprocessor(cs, cpu_read_virt_kvm_reg,
>                                   cpu_write_virt_kvm_reg,
> -                                 S390_NUM_VIRT_KVM_REGS, "s390-virt-kvm.=
xml",
> +                                 gdb_find_static_feature("s390-virt-kvm.=
xml"),
>                                   0);
>      }
>  #endif
>
> --
> 2.43.0
>
>

