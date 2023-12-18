Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA0BC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 00:12:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF1Ev-0001t9-RP; Sun, 17 Dec 2023 19:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1Et-0001s8-W2; Sun, 17 Dec 2023 19:12:08 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1Es-0005J0-1a; Sun, 17 Dec 2023 19:12:07 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6db8e289d60so12668a34.2; 
 Sun, 17 Dec 2023 16:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702858323; x=1703463123; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppAygMqNY3b49kU3Oy0Nr8bNQa8xO4FeaYLqknhMUKs=;
 b=RS8OOZfyGFRJWYWesE91+jJFw7E0uq8WgtI1pa8SWe7zbBLTXhpE7atBXRxVgdP323
 XG47A17RWZhXzx0Le5npbTyDlztH3cjsaX61DQ+k3OHnznLCS9dMR1PzGj8uDlFgP6Hx
 xTTdhF6LXUjQjgfXa/84vY9ia2Wo4PPZqX4KPZ+BtxrWDVpvGUN0uuu8IcJvMwJ3YCq7
 FQ0KxvD/C0NF7BNuwUcTTQBJw84ObnZjJaIizfAKtEAGzNvUv4+PdwbKs73kuWegG4wA
 KrhV5ObPVbT10IQSQDMpfrtJMR4Ey6RJbUw92kLdpxlaUHgHxDLdesujpLfjsDWIKXNW
 KxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702858323; x=1703463123;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppAygMqNY3b49kU3Oy0Nr8bNQa8xO4FeaYLqknhMUKs=;
 b=f6sf5AH6/FZ70ZGs3/1kNiw8R/4D8g/rHACKPtJ5nDaNiK39lLB0lHbuajVSECMoXx
 5b3Hl4dpja0L11pxJIRbpXvKu4dc+zwvtuZkPvKDqOtLlEXGQv15BMDBeNUaLv+xiBWG
 MVs12vwmGaw80f7v1S9QlTjqfsOy3FjFPGlLvgGz9Opr4E6gIxQBeO0pkQSBtOd5sh63
 8eYgUOxpG5SgM97ncnmAnQbTybXCqvuaUwWCsuaOriFoyymPzl8oWWqUKQR8kfX6pzvk
 sfEQ6DehTVclfEqbQiss/WabznrMoqApPRN3UUtmShpPixvytkQSil9V7U/YcC8lOU7A
 4J8w==
X-Gm-Message-State: AOJu0YxkRpNci+iAcqAAsrXvluQFLqCX8IRV5auft1Jb38wVV9iRZ6nG
 71rBNsd3zq1/KuT9C+9ZL5pQ0mzXvdledzz+Eac=
X-Google-Smtp-Source: AGHT+IFz79HNPu4J/b7dor38C9M7KpbM6asCqAhy+tRy9hFwRp5tPsptedzSBVf6n6NqM2jLN0g+1rwCbChw9vQ5FJk=
X-Received: by 2002:a05:6808:1416:b0:3b9:cf78:5aa0 with SMTP id
 w22-20020a056808141600b003b9cf785aa0mr10733794oiv.38.1702858323234; Sun, 17
 Dec 2023 16:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20231213-gdb-v17-0-777047380591@daynix.com>
 <20231213-gdb-v17-3-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-3-777047380591@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 10:11:37 +1000
Message-ID: <CAKmqyKND5sRzgWVhgfDWBBz=oeLWPGMTwfZnXxSxe92vg3SSuA@mail.gmail.com>
Subject: Re: [PATCH v17 03/14] target/riscv: Use GDBFeature for dynamic XML
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x329.google.com
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

On Wed, Dec 13, 2023 at 4:43=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
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
>  target/riscv/cpu.h     |  5 ++--
>  target/riscv/cpu.c     |  4 +--
>  target/riscv/gdbstub.c | 79 ++++++++++++++++++++++----------------------=
------
>  3 files changed, 40 insertions(+), 48 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 060b7f69a743..ad7236d75477 100644
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
> @@ -424,8 +425,8 @@ struct ArchCPU {
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
> index b799f1336041..673e937a5d82 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1534,9 +1534,9 @@ static const char *riscv_gdb_get_dynamic_xml(CPUSta=
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
> index 365040228a12..76b72a959549 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -214,13 +214,14 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs,=
 uint8_t *mem_buf, int n)
>      return 0;
>  }
>
> -static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
> +static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_=
reg)
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
> @@ -233,9 +234,9 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, in=
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
> +                             "org.gnu.gdb.riscv.csr", "riscv-csr.xml",
> +                             base_reg);
>
>      for (i =3D 0; i < CSR_TABLE_SIZE; i++) {
>          if (env->priv_ver < csr_ops[i].min_priv_ver) {
> @@ -243,72 +244,64 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, =
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
> +            gdb_feature_builder_append_reg(&builder, name, bitsize, i,
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
> +static GDBFeature *ricsv_gen_dynamic_vector_feature(CPUState *cs, int ba=
se_reg)
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
ml",
> +                             base_reg);
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
> +                                       reg_width, i, "riscv_vector", "ve=
ctor");
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
> @@ -324,10 +317,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUSta=
te *cs)
>                                   32, "riscv-32bit-fpu.xml", 0);
>      }
>      if (env->misa_ext & RVV) {
> -        int base_reg =3D cs->gdb_num_regs;
>          gdb_register_coprocessor(cs, riscv_gdb_get_vector,
>                                   riscv_gdb_set_vector,
> -                                 ricsv_gen_dynamic_vector_xml(cs, base_r=
eg),
> +                                 ricsv_gen_dynamic_vector_feature(cs, cs=
->gdb_num_regs)->num_regs,
>                                   "riscv-vector.xml", 0);
>      }
>      switch (mcc->misa_mxl_max) {
> @@ -347,9 +339,8 @@ void riscv_cpu_register_gdb_regs_for_features(CPUStat=
e *cs)
>      }
>
>      if (cpu->cfg.ext_zicsr) {
> -        int base_reg =3D cs->gdb_num_regs;
>          gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_cs=
r,
> -                                 riscv_gen_dynamic_csr_xml(cs, base_reg)=
,
> +                                 riscv_gen_dynamic_csr_feature(cs, cs->g=
db_num_regs)->num_regs,
>                                   "riscv-csr.xml", 0);
>      }
>  }
>
> --
> 2.43.0
>
>

