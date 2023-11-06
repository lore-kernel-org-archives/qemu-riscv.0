Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0198FC4332F
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 09:33:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qzvyV-0002L7-V4; Mon, 06 Nov 2023 04:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qzvyT-0002JA-Pm
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 04:32:49 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qzvyQ-00048f-Au
 for qemu-riscv@nongnu.org; Mon, 06 Nov 2023 04:32:49 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32dc9ff4a8fso2448149f8f.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Nov 2023 01:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699263163; x=1699867963; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tYM9JZy0pWxgWplcpiN4Gaka112GVkBHgig4rCH1hkw=;
 b=nLfculsvuqyuA9PUxT96Qe+ll2COk935xRrG7TjN6vLrG9GP/a111CQeWlONnjkviU
 4xAQDe2MX6tU3SlPLFvjCMtLsbEEBnhR3wUPp5Pb0BeDlbei1O2eYUW2B32D8T7HKif8
 xFPpS+yX+6MjUKKc+mIlm9VX2TJ+6fnxKQLskloqjDkFYCXvK7wZlkEJwntq0qOv9acE
 HS9eWV2FRdM0C7PpUFnL2v6ghh8asH9XXpThvQ+l1aCMz7Rd+LmoOEmwCwtSWMPvUld6
 q7/xuOKYE6mHYCzbofjV6AxQSEBtNQ8AOty9ATOOy6WYfRn4JoUTq/GEeD+HOVpXIOMl
 f6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699263163; x=1699867963;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tYM9JZy0pWxgWplcpiN4Gaka112GVkBHgig4rCH1hkw=;
 b=DkqvZ+jFx4GfHGVd3yxOUmXzm/4yh9fspA0QCXeNJWmvnPi04iDU6s2ZU2i5Ck18jH
 Mdf95g7GWG8Joug01tvYzW33Jor78EUVcSdaRJOpSAo7G2JY0xuVMWRflHXnblz13h4x
 41xJLp+K8h8kHc+fCOjM0dw0qekaklakIx50zfaJG/YbZMHYALEFjcma/f0BNC8pqlkF
 nQ+H8WQsGKk0QJP8f8o/4UsTLxrLhIXjEo7Fnh0jhfJIEFHwRL06WsT69slgJErsz5tM
 xrsCJ2w/+gldUhMYckvIdALAuWJq8Y/3KyAW2zsokaJ9Z2x1zsplZVrzrWIM716va62k
 e1Hw==
X-Gm-Message-State: AOJu0YxNa2lYx4hxX2Q4aYlMmidvGv0po+1yosHEpwNbZvpDFRRCUgY6
 weeLuMU85oVXTy0UNMPuWZBj4w==
X-Google-Smtp-Source: AGHT+IFmnIYvxOkcyLPyFr0wEydB1Nrmj420bzHdRtHey8P35rLtoqOldBy6VxdZuqEw4C2joK3YDQ==
X-Received: by 2002:a05:6000:18a9:b0:32f:c5f1:61df with SMTP id
 b9-20020a05600018a900b0032fc5f161dfmr4670898wri.20.1699263163490; 
 Mon, 06 Nov 2023 01:32:43 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b0032da40fd7bdsm8960826wrr.24.2023.11.06.01.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 01:32:43 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A895B5F79F;
 Mon,  6 Nov 2023 09:32:42 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Song Gao <gaosong@loongson.cn>,
 qemu-arm@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,  Weiwei Li
 <liweiwei@iscas.ac.cn>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Yanan Wang <wangyanan55@huawei.com>,
 =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>,  Paolo Bonzini <pbonzini@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  Brian Cain <bcain@quicinc.com>,
 qemu-ppc@nongnu.org,  Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Alistair Francis
 <alistair.francis@wdc.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cleber Rosa <crosa@redhat.com>,  qemu-s390x@nongnu.org,  Laurent Vivier
 <laurent@vivier.eu>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>,  Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>,  Alexandre Iooss <erdnaxe@crans.org>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Bin Meng <bin.meng@windriver.com>,  Beraldo
 Leal <bleal@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Michael Rolnik <mrolnik@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 13/29] target/riscv: Use GDBFeature for dynamic XML
In-Reply-To: <20231103195956.1998255-14-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Fri, 3 Nov 2023 19:59:40 +0000 (2
 days, 13 hours, 31 minutes ago)")
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
 <20231103195956.1998255-14-alex.bennee@linaro.org>
User-Agent: mu4e 1.11.24; emacs 29.1
Date: Mon, 06 Nov 2023 09:32:42 +0000
Message-ID: <87a5rrdy6d.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> In preparation for a change to use GDBFeature as a parameter of
> gdb_register_coprocessor(), convert the internal representation of
> dynamic feature from plain XML to GDBFeature.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Message-Id: <20231025093128.33116-7-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

I bisected the following failure:

 ./qemu-riscv64 -g 1234 ./tests/tcg/riscv64-linux-user/sha512

and:

 gdb-multiarch ./tests/tcg/riscv64-linux-user/sha512 -ex "target remote loc=
alhost:1234" -x ../../tests/tcg/multiarch/gdbstub/registers.py

gives:

warning: Architecture rejected target-supplied description
Ignoring packet error, continuing...
Ignoring packet error, continuing...
Ignoring packet error, continuing...
Ignoring packet error, continuing...

> ---
>  target/riscv/cpu.h     |  5 +--
>  target/riscv/cpu.c     |  4 +--
>  target/riscv/gdbstub.c | 79 +++++++++++++++++++-----------------------
>  3 files changed, 40 insertions(+), 48 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index f8ffa5ee38..73ec1d3b79 100644
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
> @@ -395,8 +396,8 @@ struct ArchCPU {
>=20=20
>      CPURISCVState env;
>=20=20
> -    char *dyn_csr_xml;
> -    char *dyn_vreg_xml;
> +    GDBFeature dyn_csr_feature;
> +    GDBFeature dyn_vreg_feature;
>=20=20
>      /* Configuration Settings */
>      RISCVCPUConfig cfg;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac4a6c7eec..5200fba9b9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1421,9 +1421,9 @@ static const char *riscv_gdb_get_dynamic_xml(CPUSta=
te *cs, const char *xmlname)
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>=20=20
>      if (strcmp(xmlname, "riscv-csr.xml") =3D=3D 0) {
> -        return cpu->dyn_csr_xml;
> +        return cpu->dyn_csr_feature.xml;
>      } else if (strcmp(xmlname, "riscv-vector.xml") =3D=3D 0) {
> -        return cpu->dyn_vreg_xml;
> +        return cpu->dyn_vreg_feature.xml;
>      }
>=20=20
>      return NULL;
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 524bede865..a3ac0212d1 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -212,12 +212,13 @@ static int riscv_gdb_set_virtual(CPURISCVState *cs,=
 uint8_t *mem_buf, int n)
>      return 0;
>  }
>=20=20
> -static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
> +static GDBFeature *riscv_gen_dynamic_csr_feature(CPUState *cs, int base_=
reg)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
> -    GString *s =3D g_string_new(NULL);
> +    GDBFeatureBuilder builder;
>      riscv_csr_predicate_fn predicate;
> +    const char *name;
>      int bitsize =3D 16 << env->misa_mxl_max;
>      int i;
>=20=20
> @@ -230,9 +231,9 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, in=
t base_reg)
>          bitsize =3D 64;
>      }
>=20=20
> -    g_string_printf(s, "<?xml version=3D\"1.0\"?>");
> -    g_string_append_printf(s, "<!DOCTYPE feature SYSTEM \"gdb-target.dtd=
\">");
> -    g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.riscv.csr\"=
>");
> +    gdb_feature_builder_init(&builder, &cpu->dyn_csr_feature,
> +                             "org.gnu.gdb.riscv.csr", "riscv-csr.xml",
> +                             base_reg);
>=20=20
>      for (i =3D 0; i < CSR_TABLE_SIZE; i++) {
>          if (env->priv_ver < csr_ops[i].min_priv_ver) {
> @@ -240,72 +241,64 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, =
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
>=20=20
> -    g_string_append_printf(s, "</feature>");
> -
> -    cpu->dyn_csr_xml =3D g_string_free(s, false);
> +    gdb_feature_builder_end(&builder);
>=20=20
>  #if !defined(CONFIG_USER_ONLY)
>      env->debugger =3D false;
>  #endif
>=20=20
> -    return CSR_TABLE_SIZE;
> +    return &cpu->dyn_csr_feature;
>  }
>=20=20
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
>=20=20
> -    g_string_printf(s, "<?xml version=3D\"1.0\"?>");
> -    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\=
">");
> -    g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.riscv.vecto=
r\">");
> +    gdb_feature_builder_init(&builder, &cpu->dyn_vreg_feature,
> +                             "org.gnu.gdb.riscv.vector", "riscv-vector.x=
ml",
> +                             base_reg);
>=20=20
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
>=20=20
>      /* Define unions */
> -    g_string_append_printf(s, "<union id=3D\"riscv_vector\">");
> +    gdb_feature_builder_append_tag(&builder, "<union id=3D\"riscv_vector=
\">");
>      for (i =3D 0; i < ARRAY_SIZE(vec_lanes); i++) {
> -        g_string_append_printf(s, "<field name=3D\"%c\" type=3D\"%s\"/>",
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
>=20=20
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
>=20=20
> -    g_string_append_printf(s, "</feature>");
> +    gdb_feature_builder_end(&builder);
>=20=20
> -    cpu->dyn_vreg_xml =3D g_string_free(s, false);
> -    return num_regs;
> +    return &cpu->dyn_vreg_feature;
>  }
>=20=20
>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
> @@ -320,10 +313,9 @@ void riscv_cpu_register_gdb_regs_for_features(CPUSta=
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
>      switch (env->misa_mxl_max) {
> @@ -343,9 +335,8 @@ void riscv_cpu_register_gdb_regs_for_features(CPUStat=
e *cs)
>      }
>=20=20
>      if (cpu->cfg.ext_icsr) {
> -        int base_reg =3D cs->gdb_num_regs;
>          gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_cs=
r,
> -                                 riscv_gen_dynamic_csr_xml(cs, base_reg),
> +                                 riscv_gen_dynamic_csr_feature(cs, cs->g=
db_num_regs)->num_regs,
>                                   "riscv-csr.xml", 0);
>      }
>  }

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

