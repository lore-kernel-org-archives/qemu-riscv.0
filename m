Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28CCCD98D9
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 00:56:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqNWB-0006RY-9F; Tue, 10 Oct 2023 20:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNW6-0006NU-FD; Tue, 10 Oct 2023 20:56:02 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qqNW4-0004hA-Du; Tue, 10 Oct 2023 20:56:02 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-7ab5150a7b5so277118241.0; 
 Tue, 10 Oct 2023 17:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696985758; x=1697590558; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MHGrLjRkhYiLrdRBRmqfm98vUBuT0XXmW8P1q1p4PRg=;
 b=h3KpD9mLTfqORL5r0T4sPiKTdlhrYKdew0frDbj4i66HYdU+bWsdLaackOA1cmeSSg
 v5YlHu9oCA5192LrhDN2t3Tydz3Ek19SlP57GERPxPNvsKIWDbzjks//S/gNb5o1Tf04
 8ZgKkdfjVaMx8IXlmVUF7gATcVCAtre/53YyQoQ4F9+1OW7A6SgtSQwB7wbSu8NiWNbI
 0C6UN2JcGI+S9oNmwUtTOaoWNgz7544JoY2EAmfsdL6nTCo/bfekPD+cBGpJ86NrsGda
 mF9A0u4Scu2rFP653mEW4qHxDECKtbkXJ1mrISYYBAF+CA9USOxINGQsq+zr8L9DfiJD
 kbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696985758; x=1697590558;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHGrLjRkhYiLrdRBRmqfm98vUBuT0XXmW8P1q1p4PRg=;
 b=tgWjoH0PXxhdN1ZuqLDp9F9r7E+AQB9CCU2S51bUFjKM2YWoJCdCTHmy42sJocXeoq
 Uhk7rMFafAk2fQBEX1xyG4XIYw8X/sdmnsQ6t/CK4xlthB1pm0YXO9yFSAn8RoWQrYob
 nKKD/e7kvqEAB1ursTq+2UxikxYZcm9qj2B6AywjGRX86F9k5jRjJP1Rkl2MAh8eNSFX
 fI3wcHDm7zpAxPb2r/rr6ecAwyMj+9sJHZRT05qCkZCyYXQq3d8poiMn4dvDpgneeWs1
 Tu7VFis4fTpzSBJ5A3AzRrQdTvUUz54yNs+rrpYasyviMMZ1hIgJNYZzzZQAWpyNhrGP
 GexA==
X-Gm-Message-State: AOJu0YzHWspheGF/PQ4jGDq13CDE6vhTRn+VfyRUmqNnLYodK2UyIwGa
 gNc+R3E/xyTrvPGC4X0S0pYI34lzziqGKtLbODw=
X-Google-Smtp-Source: AGHT+IHBzNjhlzia7qZzZCgNYbRewp3Gi3H7+b/6N6QZgbVnveVKuAdMAGjdIhOd9DKwJjp/TZlHo8ToQ6DmXCIZAbU=
X-Received: by 2002:a05:6102:41a2:b0:452:7341:a098 with SMTP id
 cd34-20020a05610241a200b004527341a098mr10527796vsb.0.1696985757794; Tue, 10
 Oct 2023 17:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-15-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-15-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 10:55:31 +1000
Message-ID: <CAKmqyKN1BSbHdhXhHQcywp0a-A3L1qdD46yBX_s0dAQDeFxbig@mail.gmail.com>
Subject: Re: [PATCH 14/25] hw/core/cpu: Return static value with
 gdb_arch_name()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, David Hildenbrand <david@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org, 
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92f.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Oct 10, 2023 at 2:44=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> All implementations of gdb_arch_name() returns dynamic duplicates of
> static strings. It's also unlikely that there will be an implementation
> of gdb_arch_name() that returns a truly dynamic value due to the nature
> of the function returning a well-known identifiers. Qualify the value
> gdb_arch_name() with const and make all of its implementations return
> static strings.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20230912224107.29669-8-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/core/cpu.h  | 2 +-
>  target/ppc/internal.h  | 2 +-
>  gdbstub/gdbstub.c      | 3 +--
>  target/arm/cpu.c       | 6 +++---
>  target/arm/cpu64.c     | 4 ++--
>  target/i386/cpu.c      | 6 +++---
>  target/loongarch/cpu.c | 8 ++++----
>  target/ppc/gdbstub.c   | 6 +++---
>  target/riscv/cpu.c     | 6 +++---
>  target/s390x/cpu.c     | 4 ++--
>  target/tricore/cpu.c   | 4 ++--
>  11 files changed, 25 insertions(+), 26 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index e02bc5980f..7b8347ed5a 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -165,7 +165,7 @@ struct CPUClass {
>      vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
>
>      const char *gdb_core_xml_file;
> -    gchar * (*gdb_arch_name)(CPUState *cpu);
> +    const gchar * (*gdb_arch_name)(CPUState *cpu);
>      const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlna=
me);
>
>      void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 15803bc313..c881c67a8b 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -221,7 +221,7 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
>
>  /* gdbstub.c */
>  void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
> -gchar *ppc_gdb_arch_name(CPUState *cs);
> +const gchar *ppc_gdb_arch_name(CPUState *cs);
>
>  /**
>   * prot_for_access_type:
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index bba2640293..a20169c27b 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -380,10 +380,9 @@ static const char *get_feature_xml(const char *p, co=
nst char **newp,
>                              "<target>");
>
>              if (cc->gdb_arch_name) {
> -                g_autofree gchar *arch =3D cc->gdb_arch_name(cpu);
>                  g_string_append_printf(xml,
>                                         "<architecture>%s</architecture>"=
,
> -                                       arch);
> +                                       cc->gdb_arch_name(cpu));
>              }
>              g_string_append(xml, "<xi:include href=3D\"");
>              g_string_append(xml, cc->gdb_core_xml_file);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b65e8cfea3..6c6c551573 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2319,15 +2319,15 @@ static Property arm_cpu_properties[] =3D {
>      DEFINE_PROP_END_OF_LIST()
>  };
>
> -static gchar *arm_gdb_arch_name(CPUState *cs)
> +static const gchar *arm_gdb_arch_name(CPUState *cs)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      CPUARMState *env =3D &cpu->env;
>
>      if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
> -        return g_strdup("iwmmxt");
> +        return "iwmmxt";
>      }
> -    return g_strdup("arm");
> +    return "arm";
>  }
>
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 811f3b38c2..1cb9d5b81a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -781,9 +781,9 @@ static void aarch64_cpu_finalizefn(Object *obj)
>  {
>  }
>
> -static gchar *aarch64_gdb_arch_name(CPUState *cs)
> +static const gchar *aarch64_gdb_arch_name(CPUState *cs)
>  {
> -    return g_strdup("aarch64");
> +    return "aarch64";
>  }
>
>  static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 9fad31b8db..c09bab4281 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5915,12 +5915,12 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CP=
UModel *model)
>      memset(&env->user_features, 0, sizeof(env->user_features));
>  }
>
> -static gchar *x86_gdb_arch_name(CPUState *cs)
> +static const gchar *x86_gdb_arch_name(CPUState *cs)
>  {
>  #ifdef TARGET_X86_64
> -    return g_strdup("i386:x86-64");
> +    return "i386:x86-64";
>  #else
> -    return g_strdup("i386");
> +    return "i386";
>  #endif
>  }
>
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 2bea7ca5d5..ef1bf89dac 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -766,9 +766,9 @@ static void loongarch_cpu_class_init(ObjectClass *c, =
void *data)
>  #endif
>  }
>
> -static gchar *loongarch32_gdb_arch_name(CPUState *cs)
> +static const gchar *loongarch32_gdb_arch_name(CPUState *cs)
>  {
> -    return g_strdup("loongarch32");
> +    return "loongarch32";
>  }
>
>  static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
> @@ -780,9 +780,9 @@ static void loongarch32_cpu_class_init(ObjectClass *c=
, void *data)
>      cc->gdb_arch_name =3D loongarch32_gdb_arch_name;
>  }
>
> -static gchar *loongarch64_gdb_arch_name(CPUState *cs)
> +static const gchar *loongarch64_gdb_arch_name(CPUState *cs)
>  {
> -    return g_strdup("loongarch64");
> +    return "loongarch64";
>  }
>
>  static void loongarch64_cpu_class_init(ObjectClass *c, void *data)
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index 2ad11510bf..778ef73bd7 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -589,12 +589,12 @@ static int gdb_set_vsx_reg(CPUPPCState *env, uint8_=
t *mem_buf, int n)
>      return 0;
>  }
>
> -gchar *ppc_gdb_arch_name(CPUState *cs)
> +const gchar *ppc_gdb_arch_name(CPUState *cs)
>  {
>  #if defined(TARGET_PPC64)
> -    return g_strdup("powerpc:common64");
> +    return "powerpc:common64";
>  #else
> -    return g_strdup("powerpc:common");
> +    return "powerpc:common";
>  #endif
>  }
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac2b94b6a6..f5572704de 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2004,17 +2004,17 @@ static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> -static gchar *riscv_gdb_arch_name(CPUState *cs)
> +static const gchar *riscv_gdb_arch_name(CPUState *cs)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
>
>      switch (riscv_cpu_mxl(env)) {
>      case MXL_RV32:
> -        return g_strdup("riscv:rv32");
> +        return "riscv:rv32";
>      case MXL_RV64:
>      case MXL_RV128:
> -        return g_strdup("riscv:rv64");
> +        return "riscv:rv64";
>      default:
>          g_assert_not_reached();
>      }
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 4f7599d72c..6093ab0a12 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -282,9 +282,9 @@ static void s390_cpu_initfn(Object *obj)
>  #endif
>  }
>
> -static gchar *s390_gdb_arch_name(CPUState *cs)
> +static const gchar *s390_gdb_arch_name(CPUState *cs)
>  {
> -    return g_strdup("s390:64-bit");
> +    return "s390:64-bit";
>  }
>
>  static Property s390x_cpu_properties[] =3D {
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index d1477622e6..5ca666ee12 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -29,9 +29,9 @@ static inline void set_feature(CPUTriCoreState *env, in=
t feature)
>      env->features |=3D 1ULL << feature;
>  }
>
> -static gchar *tricore_gdb_arch_name(CPUState *cs)
> +static const gchar *tricore_gdb_arch_name(CPUState *cs)
>  {
> -    return g_strdup("tricore");
> +    return "tricore";
>  }
>
>  static void tricore_cpu_set_pc(CPUState *cs, vaddr value)
> --
> 2.39.2
>
>

