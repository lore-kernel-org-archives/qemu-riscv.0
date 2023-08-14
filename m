Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16680C04A6A
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 13:09:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVXJd-0003R8-HO; Mon, 14 Aug 2023 09:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVXJc-0003QS-Ku
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 09:09:00 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVXJY-0004RH-Mi
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 09:09:00 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe4ad22eb0so42247285e9.3
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 06:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692018535; x=1692623335;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bnc+rVCKONaG3Qzuz60/AnpeHEYJqUdLDZezDYyDijM=;
 b=xIA+cS3dPtclt/mLnBMLelOPYaesk5R7e+SV6KRzJSBu1HLEhFERRLbmSRTLyLL/za
 Q274MSBrw09ZGr+cpPANlM6beGWbV4i426kMkCk8ZOA27hWOYjgO3N+mIaIaDfVxFLny
 Twb1Px+fezafHp7fxMqh6CLiSdpr2epZKKtMc9ZYFDhnP8/obgij6DCacIdAEkXyWQPb
 cGXstHfKyNm5eqhCmyMD6z/0VYeFFImheLJQde+yVsPiXOIy/UNvVwvQormoIIrHXrYg
 UcZ3JCuH3vAssqBvIrfxCoQSblzNg3cL3JxHjw4vE7+6rvFREvDLpAFieEMJx7H6idxk
 6DDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692018535; x=1692623335;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bnc+rVCKONaG3Qzuz60/AnpeHEYJqUdLDZezDYyDijM=;
 b=i2H9yWJm9XWC2lG+hyZmoCQ+NRA+YjOqAdFjdPZ4ibB7I6mruMXg1BqAqBt4tjM+Dy
 pd2Qt3yhn7BcqqUGc77vEowJeJsUlprW/QF9BNlwxRNbG4SWvK/EK8fW3LPBzfwBpR2N
 A0xADdduW/LayRKcFDwf5s+fKvHire1C7E2DufOvSVHOVX3g1UgsYUoAg1UabIdtl1uK
 JK0mzL8xdMKbzaHAmBNAF74UKMK1hqdySOfYfVDdkdOjjBvEOuswPKi2rdBAPAfYK+ql
 W7K7XK61Wvv2oR+pcyAqqHkUgZP9E3ZZQtIcN9YkftTiRrtCd+OwDUe2zC9h2o3Innr6
 lgwg==
X-Gm-Message-State: AOJu0YyuqwrX14Drfk4ijxizDoefgonDHUWmi/fixm8CAKMtvbv+TbG3
 ItXQSQTEXRW8KtIA7kpoVT7OTQ==
X-Google-Smtp-Source: AGHT+IGXIACeK82dZoQrU+vyyVRzSCycnR2JqTgGQ8A/OshsRLKq6ExJTpX6j7jDM5jsluPiFqjIkA==
X-Received: by 2002:a7b:ce94:0:b0:3fb:ff34:a846 with SMTP id
 q20-20020a7bce94000000b003fbff34a846mr7569407wmj.22.1692018534747; 
 Mon, 14 Aug 2023 06:08:54 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c290b00b003fba6709c68sm14136882wmd.47.2023.08.14.06.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 06:08:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C54351FFBB;
 Mon, 14 Aug 2023 14:08:53 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-8-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Brian Cain
 <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, Aurelien
 Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Chris Wulff
 <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, Stafford Horne
 <shorne@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Nicholas Piggin
 <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [RFC PATCH 07/24] target/arm: Use GDBFeature for dynamic XML
Date: Mon, 14 Aug 2023 14:01:27 +0100
In-reply-to: <20230731084354.115015-8-akihiko.odaki@daynix.com>
Message-ID: <87wmxxrct6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> In preparation for a change to use GDBFeature as a parameter of
> gdb_register_coprocessor(), convert the internal representation of
> dynamic feature from plain XML to GDBFeature.

FWIW one of the aims I had with my stalled rewrite of the register API
was to move all this XML generation into common code:

  https://github.com/qemu/qemu/compare/master...stsquad:qemu:introspection/=
registers#diff-f6409265629976beb19cc9b8d96889b67c006a265586615f491e7d59dd83=
dc44R68

to avoid each of the targets having to mess with constructing their own
XML and just concentrate of the semantics of each register type.

>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  target/arm/cpu.h       | 20 +++++------
>  target/arm/internals.h |  2 +-
>  target/arm/gdbstub.c   | 80 +++++++++++++++++++++++-------------------
>  target/arm/gdbstub64.c | 11 +++---
>  4 files changed, 60 insertions(+), 53 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 88e5accda6..d6c2378d05 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -136,23 +136,21 @@ enum {
>   */
>=20=20
>  /**
> - * DynamicGDBXMLInfo:
> - * @desc: Contains the XML descriptions.
> - * @num: Number of the registers in this XML seen by GDB.
> + * DynamicGDBFeatureInfo:
> + * @desc: Contains the feature descriptions.
>   * @data: A union with data specific to the set of registers
>   *    @cpregs_keys: Array that contains the corresponding Key of
>   *                  a given cpreg with the same order of the cpreg
>   *                  in the XML description.
>   */
> -typedef struct DynamicGDBXMLInfo {
> -    char *desc;
> -    int num;
> +typedef struct DynamicGDBFeatureInfo {
> +    GDBFeature desc;
>      union {
>          struct {
>              uint32_t *keys;
>          } cpregs;
>      } data;
> -} DynamicGDBXMLInfo;
> +} DynamicGDBFeatureInfo;
>=20=20
>  /* CPU state for each instance of a generic timer (in cp15 c14) */
>  typedef struct ARMGenericTimer {
> @@ -881,10 +879,10 @@ struct ArchCPU {
>      uint64_t *cpreg_vmstate_values;
>      int32_t cpreg_vmstate_array_len;
>=20=20
> -    DynamicGDBXMLInfo dyn_sysreg_xml;
> -    DynamicGDBXMLInfo dyn_svereg_xml;
> -    DynamicGDBXMLInfo dyn_m_systemreg_xml;
> -    DynamicGDBXMLInfo dyn_m_secextreg_xml;
> +    DynamicGDBFeatureInfo dyn_sysreg_feature;
> +    DynamicGDBFeatureInfo dyn_svereg_feature;
> +    DynamicGDBFeatureInfo dyn_m_systemreg_feature;
> +    DynamicGDBFeatureInfo dyn_m_secextreg_feature;
>=20=20
>      /* Timers used by the generic (architected) timer */
>      QEMUTimer *gt_timer[NUM_GTIMERS];
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 0f01bc32a8..8421a755af 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1388,7 +1388,7 @@ static inline uint64_t pmu_counter_mask(CPUARMState=
 *env)
>  }
>=20=20
>  #ifdef TARGET_AARCH64
> -int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
> +GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cpu, int base_reg);
>  int aarch64_gdb_get_sve_reg(CPUARMState *env, GByteArray *buf, int reg);
>  int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg);
>  int aarch64_gdb_get_fpu_reg(CPUARMState *env, GByteArray *buf, int reg);
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index f421c5d041..cd35bac013 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -25,11 +25,11 @@
>  #include "internals.h"
>  #include "cpregs.h"
>=20=20
> -typedef struct RegisterSysregXmlParam {
> +typedef struct RegisterSysregFeatureParam {
>      CPUState *cs;
>      GString *s;
>      int n;
> -} RegisterSysregXmlParam;
> +} RegisterSysregFeatureParam;
>=20=20
>  /* Old gdb always expect FPA registers.  Newer (xml-aware) gdb only expe=
ct
>     whatever the target description contains.  Due to a historical mishap
> @@ -243,7 +243,7 @@ static int arm_gdb_get_sysreg(CPUARMState *env, GByte=
Array *buf, int reg)
>      const ARMCPRegInfo *ri;
>      uint32_t key;
>=20=20
> -    key =3D cpu->dyn_sysreg_xml.data.cpregs.keys[reg];
> +    key =3D cpu->dyn_sysreg_feature.data.cpregs.keys[reg];
>      ri =3D get_arm_cp_reginfo(cpu->cp_regs, key);
>      if (ri) {
>          if (cpreg_field_is_64bit(ri)) {
> @@ -260,7 +260,8 @@ static int arm_gdb_set_sysreg(CPUARMState *env, uint8=
_t *buf, int reg)
>      return 0;
>  }
>=20=20
> -static void arm_gen_one_xml_sysreg_tag(GString *s, DynamicGDBXMLInfo *dy=
n_xml,
> +static void arm_gen_one_feature_sysreg(GString *s,
> +                                       DynamicGDBFeatureInfo *dyn_featur=
e,
>                                         ARMCPRegInfo *ri, uint32_t ri_key,
>                                         int bitsize, int regnum)
>  {
> @@ -268,25 +269,25 @@ static void arm_gen_one_xml_sysreg_tag(GString *s, =
DynamicGDBXMLInfo *dyn_xml,
>      g_string_append_printf(s, " bitsize=3D\"%d\"", bitsize);
>      g_string_append_printf(s, " regnum=3D\"%d\"", regnum);
>      g_string_append_printf(s, " group=3D\"cp_regs\"/>");
> -    dyn_xml->data.cpregs.keys[dyn_xml->num] =3D ri_key;
> -    dyn_xml->num++;
> +    dyn_feature->data.cpregs.keys[dyn_feature->desc.num_regs] =3D ri_key;
> +    dyn_feature->desc.num_regs++;
>  }
>=20=20
> -static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
> -                                        gpointer p)
> +static void arm_register_sysreg_for_feature(gpointer key, gpointer value,
> +                                            gpointer p)
>  {
>      uint32_t ri_key =3D (uintptr_t)key;
>      ARMCPRegInfo *ri =3D value;
> -    RegisterSysregXmlParam *param =3D (RegisterSysregXmlParam *)p;
> +    RegisterSysregFeatureParam *param =3D (RegisterSysregFeatureParam *)=
p;
>      GString *s =3D param->s;
>      ARMCPU *cpu =3D ARM_CPU(param->cs);
>      CPUARMState *env =3D &cpu->env;
> -    DynamicGDBXMLInfo *dyn_xml =3D &cpu->dyn_sysreg_xml;
> +    DynamicGDBFeatureInfo *dyn_feature =3D &cpu->dyn_sysreg_feature;
>=20=20
>      if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
>          if (arm_feature(env, ARM_FEATURE_AARCH64)) {
>              if (ri->state =3D=3D ARM_CP_STATE_AA64) {
> -                arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, 64,
> +                arm_gen_one_feature_sysreg(s , dyn_feature, ri, ri_key, =
64,
>                                             param->n++);
>              }
>          } else {
> @@ -296,10 +297,10 @@ static void arm_register_sysreg_for_xml(gpointer ke=
y, gpointer value,
>                      return;
>                  }
>                  if (ri->type & ARM_CP_64BIT) {
> -                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, =
64,
> +                    arm_gen_one_feature_sysreg(s , dyn_feature, ri, ri_k=
ey, 64,
>                                                 param->n++);
>                  } else {
> -                    arm_gen_one_xml_sysreg_tag(s , dyn_xml, ri, ri_key, =
32,
> +                    arm_gen_one_feature_sysreg(s , dyn_feature, ri, ri_k=
ey, 32,
>                                                 param->n++);
>                  }
>              }
> @@ -307,21 +308,24 @@ static void arm_register_sysreg_for_xml(gpointer ke=
y, gpointer value,
>      }
>  }
>=20=20
> -static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
> +static GDBFeature *arm_gen_dynamic_sysreg_feature(CPUState *cs, int base=
_reg)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      GString *s =3D g_string_new(NULL);
> -    RegisterSysregXmlParam param =3D {cs, s, base_reg};
> +    RegisterSysregFeatureParam param =3D {cs, s, base_reg};
> +    DynamicGDBFeatureInfo *dyn_feature =3D &cpu->dyn_sysreg_feature;
> +    gsize num_regs =3D g_hash_table_size(cpu->cp_regs);
>=20=20
> -    cpu->dyn_sysreg_xml.num =3D 0;
> -    cpu->dyn_sysreg_xml.data.cpregs.keys =3D g_new(uint32_t, g_hash_tabl=
e_size(cpu->cp_regs));
> +    dyn_feature->desc.num_regs =3D 0;
> +    dyn_feature->data.cpregs.keys =3D g_new(uint32_t, num_regs);
>      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\=
">");
>      g_string_append_printf(s, "<feature name=3D\"org.qemu.gdb.arm.sys.re=
gs\">");
> -    g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, &par=
am);
> +    g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_feature, =
&param);
>      g_string_append_printf(s, "</feature>");
> -    cpu->dyn_sysreg_xml.desc =3D g_string_free(s, false);
> -    return cpu->dyn_sysreg_xml.num;
> +    dyn_feature->desc.xmlname =3D "system-registers.xml";
> +    dyn_feature->desc.xml =3D g_string_free(s, false);
> +    return &dyn_feature->desc;
>  }
>=20=20
>  #ifdef CONFIG_TCG
> @@ -413,7 +417,8 @@ static int arm_gdb_set_m_systemreg(CPUARMState *env, =
uint8_t *buf, int reg)
>      return 0; /* TODO */
>  }
>=20=20
> -static int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int orig_base_r=
eg)
> +static GDBFeature *arm_gen_dynamic_m_systemreg_feature(CPUState *cs,
> +                                                       int orig_base_reg)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      CPUARMState *env =3D &cpu->env;
> @@ -434,10 +439,11 @@ static int arm_gen_dynamic_m_systemreg_xml(CPUState=
 *cs, int orig_base_reg)
>      }
>=20=20
>      g_string_append_printf(s, "</feature>");
> -    cpu->dyn_m_systemreg_xml.desc =3D g_string_free(s, false);
> -    cpu->dyn_m_systemreg_xml.num =3D base_reg - orig_base_reg;
> +    cpu->dyn_m_systemreg_feature.desc.xmlname =3D "arm-m-system.xml";
> +    cpu->dyn_m_systemreg_feature.desc.xml =3D g_string_free(s, false);
> +    cpu->dyn_m_systemreg_feature.desc.num_regs =3D base_reg - orig_base_=
reg;
>=20=20
> -    return cpu->dyn_m_systemreg_xml.num;
> +    return &cpu->dyn_m_systemreg_feature.desc;
>  }
>=20=20
>  #ifndef CONFIG_USER_ONLY
> @@ -455,7 +461,8 @@ static int arm_gdb_set_m_secextreg(CPUARMState *env, =
uint8_t *buf, int reg)
>      return 0; /* TODO */
>  }
>=20=20
> -static int arm_gen_dynamic_m_secextreg_xml(CPUState *cs, int orig_base_r=
eg)
> +static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs,
> +                                                       int orig_base_reg)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      GString *s =3D g_string_new(NULL);
> @@ -476,10 +483,11 @@ static int arm_gen_dynamic_m_secextreg_xml(CPUState=
 *cs, int orig_base_reg)
>      }
>=20=20
>      g_string_append_printf(s, "</feature>");
> -    cpu->dyn_m_secextreg_xml.desc =3D g_string_free(s, false);
> -    cpu->dyn_m_secextreg_xml.num =3D base_reg - orig_base_reg;
> +    cpu->dyn_m_secextreg_feature.desc.xmlname =3D "arm-m-secext.xml";
> +    cpu->dyn_m_secextreg_feature.desc.xml =3D g_string_free(s, false);
> +    cpu->dyn_m_secextreg_feature.desc.num_regs =3D base_reg - orig_base_=
reg;
>=20=20
> -    return cpu->dyn_m_secextreg_xml.num;
> +    return &cpu->dyn_m_secextreg_feature.desc;
>  }
>  #endif
>  #endif /* CONFIG_TCG */
> @@ -489,14 +497,14 @@ const char *arm_gdb_get_dynamic_xml(CPUState *cs, c=
onst char *xmlname)
>      ARMCPU *cpu =3D ARM_CPU(cs);
>=20=20
>      if (strcmp(xmlname, "system-registers.xml") =3D=3D 0) {
> -        return cpu->dyn_sysreg_xml.desc;
> +        return cpu->dyn_sysreg_feature.desc.xml;
>      } else if (strcmp(xmlname, "sve-registers.xml") =3D=3D 0) {
> -        return cpu->dyn_svereg_xml.desc;
> +        return cpu->dyn_svereg_feature.desc.xml;
>      } else if (strcmp(xmlname, "arm-m-system.xml") =3D=3D 0) {
> -        return cpu->dyn_m_systemreg_xml.desc;
> +        return cpu->dyn_m_systemreg_feature.desc.xml;
>  #ifndef CONFIG_USER_ONLY
>      } else if (strcmp(xmlname, "arm-m-secext.xml") =3D=3D 0) {
> -        return cpu->dyn_m_secextreg_xml.desc;
> +        return cpu->dyn_m_secextreg_feature.desc.xml;
>  #endif
>      }
>      return NULL;
> @@ -514,7 +522,7 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *c=
pu)
>           */
>  #ifdef TARGET_AARCH64
>          if (isar_feature_aa64_sve(&cpu->isar)) {
> -            int nreg =3D arm_gen_dynamic_svereg_xml(cs, cs->gdb_num_regs=
);
> +            int nreg =3D arm_gen_dynamic_svereg_feature(cs, cs->gdb_num_=
regs)->num_regs;
>              gdb_register_coprocessor(cs, aarch64_gdb_get_sve_reg,
>                                       aarch64_gdb_set_sve_reg, nreg,
>                                       "sve-registers.xml", 0);
> @@ -560,20 +568,20 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU =
*cpu)
>                                   1, "arm-m-profile-mve.xml", 0);
>      }
>      gdb_register_coprocessor(cs, arm_gdb_get_sysreg, arm_gdb_set_sysreg,
> -                             arm_gen_dynamic_sysreg_xml(cs, cs->gdb_num_=
regs),
> +                             arm_gen_dynamic_sysreg_feature(cs, cs->gdb_=
num_regs)->num_regs,
>                               "system-registers.xml", 0);
>=20=20
>  #ifdef CONFIG_TCG
>      if (arm_feature(env, ARM_FEATURE_M) && tcg_enabled()) {
>          gdb_register_coprocessor(cs,
>              arm_gdb_get_m_systemreg, arm_gdb_set_m_systemreg,
> -            arm_gen_dynamic_m_systemreg_xml(cs, cs->gdb_num_regs),
> +            arm_gen_dynamic_m_systemreg_feature(cs, cs->gdb_num_regs)->n=
um_regs,
>              "arm-m-system.xml", 0);
>  #ifndef CONFIG_USER_ONLY
>          if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
>              gdb_register_coprocessor(cs,
>                  arm_gdb_get_m_secextreg, arm_gdb_set_m_secextreg,
> -                arm_gen_dynamic_m_secextreg_xml(cs, cs->gdb_num_regs),
> +                arm_gen_dynamic_m_secextreg_feature(cs, cs->gdb_num_regs=
)->num_regs,
>                  "arm-m-secext.xml", 0);
>          }
>  #endif
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index d7b79a6589..20483ef9bc 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -316,11 +316,11 @@ static void output_vector_union_type(GString *s, in=
t reg_width,
>      g_string_append(s, "</union>");
>  }
>=20=20
> -int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
> +GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int orig_base_r=
eg)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      GString *s =3D g_string_new(NULL);
> -    DynamicGDBXMLInfo *info =3D &cpu->dyn_svereg_xml;
> +    DynamicGDBFeatureInfo *info =3D &cpu->dyn_svereg_feature;
>      int reg_width =3D cpu->sve_max_vq * 128;
>      int pred_width =3D cpu->sve_max_vq * 16;
>      int base_reg =3D orig_base_reg;
> @@ -375,7 +375,8 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig=
_base_reg)
>=20=20
>      g_string_append_printf(s, "</feature>");
>=20=20
> -    info->desc =3D g_string_free(s, false);
> -    info->num =3D base_reg - orig_base_reg;
> -    return info->num;
> +    info->desc.xmlname =3D "sve-registers.xml";
> +    info->desc.xml =3D g_string_free(s, false);
> +    info->desc.num_regs =3D base_reg - orig_base_reg;
> +    return &info->desc;
>  }

Otherwise:

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

