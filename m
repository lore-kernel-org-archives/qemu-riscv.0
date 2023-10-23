Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7C1C0032E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 01:47:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1quk1k-0005R5-Cg; Sun, 22 Oct 2023 21:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1quk1h-0005QE-8h; Sun, 22 Oct 2023 21:46:41 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1quk1e-0004F3-Vx; Sun, 22 Oct 2023 21:46:40 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-7b67fef3fd4so553723241.1; 
 Sun, 22 Oct 2023 18:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698025597; x=1698630397; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IAyIOIavpd3mO7cIUu3Vj1UNgIis8N7GH0LALQXQd+4=;
 b=NCYRqn/zwDT9wDy3NnZjOpKvYM4KmIwG3noWNTcJ2g5PAg8LPf5zpQpZ/1FjVwSP5b
 WjhqU0nGBnevXr6JOXBnvP8pDQ/NkKxuT2ObchHTTlvTYUOLwb7CSVyYBguZW3QTc3Bj
 V3fs/p+x/haL8WZwppx0wBfa1EDV1Hbg7FWqcLWzN6WogXaWz3FUB7erC7T+kswCG/G/
 U/kYa2MqJCqEHIU3vquRXfc1ShV3Fw1w2EErHHaMgL7Q7gKsgzdZ5NYkdxuK3Oe9HN0n
 1G16DrT3en4uQNWeygaQ5zWxJwpbNK8OdvASQNAnpDEgCnfbpkYmfcenNwv1trDShM9l
 gFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698025597; x=1698630397;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IAyIOIavpd3mO7cIUu3Vj1UNgIis8N7GH0LALQXQd+4=;
 b=H0ijMFbMwF74tpb+LDhPP2cFjFc5m0uJsQXNWgRTGGtQFH9jg0OIDhbjxgs44kk9lu
 r91YaggOt+Adx/f8zsKBu5J1UqRoMrxvEKJKekYaOfpH0MFi/HGY9V1/ZopjECnsKLEU
 XtyReuJweplVjtJScusDM5atT3XtkLc+UJoG5l/gKyAJMbYGhd1s0kwoL244b0w5r141
 uP5cfxyXNgvLjslU3VvDrmZdoMZERAI+0wQVItPq96dZyt9gCLJ/PgpzNCsKndhdVOBG
 nnkaiTkZLWjCEoR1xXEIbmPE//2E6K1c5JgiOh4yDQRhMnCqdZXCkuzsVewl+7wpxykm
 dsuQ==
X-Gm-Message-State: AOJu0Yx2GWlMoHAYwwOOBjggsZ2lSDV94YToQL7YOCIfzt8aAzyQejGF
 9ofcSqnDR0K3FzRtYtOfKSjRTismM22jJj3M9N8=
X-Google-Smtp-Source: AGHT+IGz8p45CFqTTfXL+BwVNHA/NPgvFhcKsvQjlHPQM8q3pSkvDoWiqSv08RuTV05wFPEQ6+GOHKtv93dvDIGgUxU=
X-Received: by 2002:a67:b20d:0:b0:452:6efc:1789 with SMTP id
 b13-20020a67b20d000000b004526efc1789mr4034082vsf.32.1698025597463; Sun, 22
 Oct 2023 18:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231017190931.16211-1-akihiko.odaki@daynix.com>
 <20231017190931.16211-7-akihiko.odaki@daynix.com>
In-Reply-To: <20231017190931.16211-7-akihiko.odaki@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 11:46:10 +1000
Message-ID: <CAKmqyKMGuk8auS9MRj_J8K++hoo5xTkU1vYqbccc_Jo37uLZpg@mail.gmail.com>
Subject: Re: [PATCH v13 06/18] target/riscv: Use GDBFeature for dynamic XML
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov <a.anenkov@yadro.com>,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Oct 18, 2023 at 6:16=E2=80=AFAM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> In preparation for a change to use GDBFeature as a parameter of
> gdb_register_coprocessor(), convert the internal representation of
> dynamic feature from plain XML to GDBFeature.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h     |  5 +--
>  target/riscv/cpu.c     |  4 +--
>  target/riscv/gdbstub.c | 77 ++++++++++++++++++------------------------
>  3 files changed, 38 insertions(+), 48 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ef10efd1e7..4a1683c8ad 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -24,6 +24,7 @@
>  #include "hw/registerfields.h"
>  #include "hw/qdev-properties.h"
>  #include "exec/cpu-defs.h"
> +#include "exec/gdbstub.h"
>  #include "qemu/cpu-float.h"
>  #include "qom/object.h"
>  #include "qemu/int128.h"
> @@ -394,8 +395,8 @@ struct ArchCPU {
>
>      CPURISCVState env;
>
> -    char *dyn_csr_xml;
> -    char *dyn_vreg_xml;
> +    GDBFeature dyn_csr_feature;
> +    GDBFeature dyn_vreg_feature;
>
>      /* Configuration Settings */
>      RISCVCPUConfig cfg;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 72124e57fd..5e083b5798 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1432,9 +1432,9 @@ static const char *riscv_gdb_get_dynamic_xml(CPUSta=
te *cs, const char *xmlname)
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>
>      if (strcmp(xmlname, "riscv-csr.xml") =3D=3D 0) {
> -        return cpu->dyn_csr_xml;
> +        return cpu->dyn_csr_feature.xml;
>      } else if (strcmp(xmlname, "riscv-vector.xml") =3D=3D 0) {
> -        return cpu->dyn_vreg_xml;
> +        return cpu->dyn_vreg_feature.xml;
>      }
>
>      return NULL;
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index b9528cef5b..b7159f1db8 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -214,13 +214,14 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs,=
 uint8_t *mem_buf, int n)
>      return 0;
>  }
>
> -static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
> +static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs)
>  {
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(cs);
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
> -    GString *s =3D g_string_new(NULL);
> +    GDBFeatureBuilder builder;
>      riscv_csr_predicate_fn predicate;
> +    const char *name;
>      int bitsize =3D 16 << mcc->misa_mxl_max;
>      int i;
>
> @@ -233,9 +234,8 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, in=
t base_reg)
>          bitsize =3D 64;
>      }
>
> -    g_string_printf(s, "<?xml version=3D\"1.0\"?>");
> -    g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd=
\">");
> -    g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.riscv.csr\"=
>");
> +    gdb_feature_builder_init(&builder, &cpu->dyn_csr_feature,
> +                             "org.gnu.gdb.riscv.csr", "riscv-csr.xml");
>
>      for (i =3D 0; i < CSR_TABLE_SIZE; i++) {
>          if (env->priv_ver < csr_ops[i].min_priv_ver) {
> @@ -243,72 +243,63 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, =
int base_reg)
>          }
>          predicate =3D csr_ops[i].predicate;
>          if (predicate && (predicate(env, i) =3D=3D RISCV_EXCP_NONE)) {
> -            if (csr_ops[i].name) {
> -                g_string_append_printf(s, "<reg name=3D\"%s\"", csr_ops[=
i].name);
> -            } else {
> -                g_string_append_printf(s, "<reg name=3D\"csr%03x\"", i);
> +            g_autofree char *dynamic_name =3D NULL;
> +            name =3D csr_ops[i].name;
> +            if (!name) {
> +                dynamic_name =3D g_strdup_printf("csr%03x", i);
> +                name =3D dynamic_name;
>              }
> -            g_string_append_printf(s, " bitsize=3D\"%d\"", bitsize);
> -            g_string_append_printf(s, " regnum=3D\"%d\"/>", base_reg + i=
);
> +
> +            gdb_feature_builder_append_reg(&builder, name, bitsize,
> +                                           "int", NULL);
>          }
>      }
>
> -    g_string_append_printf(s, "</feature>");
> -
> -    cpu->dyn_csr_xml =3D g_string_free(s, false);
> +    gdb_feature_builder_end(&builder);
>
>  #if !defined(CONFIG_USER_ONLY)
>      env->debugger =3D false;
>  #endif
>
> -    return CSR_TABLE_SIZE;
> +    return &cpu->dyn_csr_feature;
>  }
>
> -static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
> +static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> -    GString *s =3D g_string_new(NULL);
> -    g_autoptr(GString) ts =3D g_string_new("");
> +    GDBFeatureBuilder builder;
>      int reg_width =3D cpu->cfg.vlen;
> -    int num_regs =3D 0;
>      int i;
>
> -    g_string_printf(s, "<?xml version=3D\"1.0\"?>");
> -    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\=
">");
> -    g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.riscv.vecto=
r\">");
> +    gdb_feature_builder_init(&builder, &cpu->dyn_vreg_feature,
> +                             "org.gnu.gdb.riscv.vector", "riscv-vector.x=
ml");
>
>      /* First define types and totals in a whole VL */
>      for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
>          int count =3D reg_width / vec_lanes[i].size;
> -        g_string_printf(ts, "%s", vec_lanes[i].id);
> -        g_string_append_printf(s,
> -                               "<vector id=3D\"%s\" type=3D\"%s\" count=
=3D\"%d\"/>",
> -                               ts->str, vec_lanes[i].gdb_type, count);
> +        gdb_feature_builder_append_tag(
> +            &builder, "<vector id=3D\"%s\" type=3D\"%s\" count=3D\"%d\"/=
>",
> +            vec_lanes[i].id, vec_lanes[i].gdb_type, count);
>      }
>
>      /* Define unions */
> -    g_string_append_printf(s, "<union id=3D\"riscv_vector\">");
> +    gdb_feature_builder_append_tag(&builder, "<union id=3D\"riscv_vector=
\">");
>      for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
> -        g_string_append_printf(s, "<field name=3D\"%c\" type=3D\"%s\"/>"=
,
> -                               vec_lanes[i].suffix,
> -                               vec_lanes[i].id);
> +        gdb_feature_builder_append_tag(&builder,
> +                                       "<field name=3D\"%c\" type=3D\"%s=
\"/>",
> +                                       vec_lanes[i].suffix, vec_lanes[i]=
.id);
>      }
> -    g_string_append(s, "</union>");
> +    gdb_feature_builder_append_tag(&builder, "</union>");
>
>      /* Define vector registers */
>      for (i =3D 0; i < 32; i++) {
> -        g_string_append_printf(s,
> -                               "<reg name=3D\"v%d\" bitsize=3D\"%d\""
> -                               " regnum=3D\"%d\" group=3D\"vector\""
> -                               " type=3D\"riscv_vector\"/>",
> -                               i, reg_width, base_reg++);
> -        num_regs++;
> +        gdb_feature_builder_append_reg(&builder, g_strdup_printf("v%d", =
i),
> +                                       reg_width, "riscv_vector", "vecto=
r");
>      }
>
> -    g_string_append_printf(s, "</feature>");
> +    gdb_feature_builder_end(&builder);
>
> -    cpu->dyn_vreg_xml =3D g_string_free(s, false);
> -    return num_regs;
> +    return &cpu->dyn_vreg_feature;
>  }
>
>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
> @@ -324,10 +315,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUSta=
te *cs)
>                                   32, "riscv-32bit-fpu.xml", 0);
>      }
>      if (env->misa_ext & RVV) {
> -        int base_reg =3D cs->gdb_num_regs;
>          gdb_register_coprocessor(cs, riscv_gdb_get_vector,
>                                   riscv_gdb_set_vector,
> -                                 ricsv_gen_dynamic_vector_xml(cs, base_r=
eg),
> +                                 ricsv_gen_dynamic_vector_feature(cs)->n=
um_regs,
>                                   "riscv-vector.xml", 0);
>      }
>      switch (mcc->misa_mxl_max) {
> @@ -347,9 +337,8 @@ void riscv_cpu_register_gdb_regs_for_features(CPUStat=
e *cs)
>      }
>
>      if (cpu->cfg.ext_icsr) {
> -        int base_reg =3D cs->gdb_num_regs;
>          gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_cs=
r,
> -                                 riscv_gen_dynamic_csr_xml(cs, base_reg)=
,
> +                                 riscv_gen_dynamic_csr_feature(cs)->num_=
regs,
>                                   "riscv-csr.xml", 0);
>      }
>  }
> --
> 2.42.0
>
>

