Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C0BC001B0
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 14:59:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVZ2P-0007nW-LI; Mon, 14 Aug 2023 10:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVZ2O-0007ms-HL
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 10:59:20 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVZ2M-0005Et-19
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 10:59:20 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e57d2so39967785e9.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692025156; x=1692629956;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKziK/xFndoa9bUcpBoOg/LkGNa2BGBXIRbHsDBSlsY=;
 b=cAgURWfztegoOaIqaLUGU95vvfmlR9OSIwiQIeAIoMO1eWPDKR+t27X02HlIXbIITy
 aanuABpttkq/Oyq61qjnxUKHYLdgvHgotTr3+oXckfJAtLB2vEs5EF5fxhsHtteFa8Vy
 lwRjZwGzQ90GoeS/BFbqJX7KsifNmQKV+uzXTQ/S+1QWDRqBg4/jtg3A6BBVOIBdz6Y+
 MKzkWdAON4meiSknHwKEY3iBn3TEToEFvtefHTuxZNSuk7P3o2Ax904wXa6NhuzjGTSJ
 ml/Tg+vcq1RpKL6OkGx8/KAKe+rZywRgHSuzghzY+Ii2/6Pk9BiMZims/kdKqrooaO40
 eM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692025156; x=1692629956;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sKziK/xFndoa9bUcpBoOg/LkGNa2BGBXIRbHsDBSlsY=;
 b=kVYdln2IP3k9vew1PleEbOL8KEIeR3Hy6S32Vvzj7YLvaV7DQsvSmS9fXJbwUXJLdw
 Xct2GTuJda9dhVjYpR2j9YuwVBYtP3Su7DyV0yNqS4EGTVWlc6b/Q2dyGDSQHq68Q7n6
 4T0UyTWbM7/gP1kGe0JcImRRzRLkAMiLC8J4mO6sgcIMjS8/OA/X4I5FhQEGjsgpmlsL
 3Dl2I6ZQEKN0PYM+XFyXYJDaaRqcG1xBTgaXmLv0docG7T/5KMuouXhZsRnq3tSybODX
 a2BA5P6TRVBRBDjsnOGZEyXKPimu/JdUDDm9ibrR1bOqPLW57tuMwaRwRb6B5AnUbLG6
 ObLA==
X-Gm-Message-State: AOJu0YzYZ7S4SbZITd/apdW/V8YdWxcSQkrPbow5HKD+bpQmulD+EaEd
 KdIez/bHp+jSAfFI7w/CESj3JQ==
X-Google-Smtp-Source: AGHT+IGvpfzK93iZxKBG1xPuwbXbwZOjEKLI0AKtIH+FTiEQDRStEYjJPsFcPMvQ+BKCZH9R5rXuJQ==
X-Received: by 2002:a05:600c:2258:b0:3fe:2f80:8394 with SMTP id
 a24-20020a05600c225800b003fe2f808394mr7434195wmm.15.1692025156168; 
 Mon, 14 Aug 2023 07:59:16 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a5d6102000000b003141e629cb6sm14506898wrt.101.2023.08.14.07.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 07:59:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5B5381FFBB;
 Mon, 14 Aug 2023 15:59:15 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-16-akihiko.odaki@daynix.com>
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
Subject: Re: [RFC PATCH 15/24] target/arm: Fill new members of GDBFeature
Date: Mon, 14 Aug 2023 15:56:59 +0100
In-reply-to: <20230731084354.115015-16-akihiko.odaki@daynix.com>
Message-ID: <87350lr7p8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> These members will be used to help plugins to identify registers.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  target/arm/gdbstub.c   | 46 +++++++++++++++++++++++++++---------------
>  target/arm/gdbstub64.c | 42 +++++++++++++++++++++++++-------------
>  2 files changed, 58 insertions(+), 30 deletions(-)
>
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 100a6eed15..56d24028f6 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -270,6 +270,7 @@ static void arm_gen_one_feature_sysreg(GString *s,
>      g_string_append_printf(s, " regnum=3D\"%d\"", regnum);
>      g_string_append_printf(s, " group=3D\"cp_regs\"/>");
>      dyn_feature->data.cpregs.keys[dyn_feature->desc.num_regs] =3D ri_key;
> +    ((const char **)dyn_feature->desc.regs)[dyn_feature->desc.num_regs] =
=3D ri->name;
>      dyn_feature->desc.num_regs++;
>  }
>=20=20
> @@ -316,6 +317,8 @@ static GDBFeature *arm_gen_dynamic_sysreg_feature(CPU=
State *cs, int base_reg)
>      DynamicGDBFeatureInfo *dyn_feature =3D &cpu->dyn_sysreg_feature;
>      gsize num_regs =3D g_hash_table_size(cpu->cp_regs);
>=20=20
> +    dyn_feature->desc.name =3D "org.qemu.gdb.arm.sys.regs";
> +    dyn_feature->desc.regs =3D g_new(const char *, num_regs);

AIUI this means we now have an array of register names which mirrors the
names embedded in the XML. This smells like a few steps away from just
abstracting the whole XML away from the targets and generating them
inside gdbstub when we need them. As per my stalled attempt I referenced
earlier.


>      dyn_feature->desc.num_regs =3D 0;
>      dyn_feature->data.cpregs.keys =3D g_new(uint32_t, num_regs);
>      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
> @@ -418,30 +421,34 @@ static int arm_gdb_set_m_systemreg(CPUARMState *env=
, uint8_t *buf, int reg)
>  }
>=20=20
>  static GDBFeature *arm_gen_dynamic_m_systemreg_feature(CPUState *cs,
> -                                                       int orig_base_reg)
> +                                                       int base_reg)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      CPUARMState *env =3D &cpu->env;
>      GString *s =3D g_string_new(NULL);
> -    int base_reg =3D orig_base_reg;
> -    int i;
> +    const char **regs =3D g_new(const char *, ARRAY_SIZE(m_sysreg_def));
> +    int i =3D 0;
> +    int j;
>=20=20
>      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\=
">");
>      g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.arm.m-syste=
m\">\n");
>=20=20
> -    for (i =3D 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
> -        if (arm_feature(env, m_sysreg_def[i].feature)) {
> +    for (j =3D 0; j < ARRAY_SIZE(m_sysreg_def); j++) {
> +        if (arm_feature(env, m_sysreg_def[j].feature)) {
> +            regs[i] =3D m_sysreg_def[j].name;
>              g_string_append_printf(s,
>                  "<reg name=3D\"%s\" bitsize=3D\"32\" regnum=3D\"%d\"/>\n=
",
> -                m_sysreg_def[i].name, base_reg++);
> +                m_sysreg_def[j].name, base_reg + i++);
>          }
>      }
>=20=20
>      g_string_append_printf(s, "</feature>");
> +    cpu->dyn_m_systemreg_feature.desc.name =3D "org.gnu.gdb.arm.m-system=
";
>      cpu->dyn_m_systemreg_feature.desc.xmlname =3D "arm-m-system.xml";
>      cpu->dyn_m_systemreg_feature.desc.xml =3D g_string_free(s, false);
> -    cpu->dyn_m_systemreg_feature.desc.num_regs =3D base_reg - orig_base_=
reg;
> +    cpu->dyn_m_systemreg_feature.desc.regs =3D regs;
> +    cpu->dyn_m_systemreg_feature.desc.num_regs =3D i;
>=20=20
>      return &cpu->dyn_m_systemreg_feature.desc;
>  }
> @@ -462,30 +469,37 @@ static int arm_gdb_set_m_secextreg(CPUARMState *env=
, uint8_t *buf, int reg)
>  }
>=20=20
>  static GDBFeature *arm_gen_dynamic_m_secextreg_feature(CPUState *cs,
> -                                                       int orig_base_reg)
> +                                                       int base_reg)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      GString *s =3D g_string_new(NULL);
> -    int base_reg =3D orig_base_reg;
> -    int i;
> +    const char **regs =3D g_new(const char *, ARRAY_SIZE(m_sysreg_def) *=
 2);
> +    int i =3D 0;
> +    int j;
>=20=20
>      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\=
">");
>      g_string_append_printf(s, "<feature name=3D\"org.gnu.gdb.arm.secext\=
">\n");
>=20=20
> -    for (i =3D 0; i < ARRAY_SIZE(m_sysreg_def); i++) {
> +    for (j =3D 0; j < ARRAY_SIZE(m_sysreg_def); j++) {
> +        regs[i] =3D g_strconcat(m_sysreg_def[j].name, "_ns", NULL);
>          g_string_append_printf(s,
> -            "<reg name=3D\"%s_ns\" bitsize=3D\"32\" regnum=3D\"%d\"/>\n",
> -            m_sysreg_def[i].name, base_reg++);
> +            "<reg name=3D\"%s\" bitsize=3D\"32\" regnum=3D\"%d\"/>\n",
> +            regs[i], base_reg + i);
> +        i++;
> +        regs[i] =3D g_strconcat(m_sysreg_def[j].name, "_s", NULL);
>          g_string_append_printf(s,
> -            "<reg name=3D\"%s_s\" bitsize=3D\"32\" regnum=3D\"%d\"/>\n",
> -            m_sysreg_def[i].name, base_reg++);
> +            "<reg name=3D\"%s\" bitsize=3D\"32\" regnum=3D\"%d\"/>\n",
> +            regs[i], base_reg + i);
> +        i++;
>      }
>=20=20
>      g_string_append_printf(s, "</feature>");
> +    cpu->dyn_m_secextreg_feature.desc.name =3D "org.gnu.gdb.arm.secext";
>      cpu->dyn_m_secextreg_feature.desc.xmlname =3D "arm-m-secext.xml";
>      cpu->dyn_m_secextreg_feature.desc.xml =3D g_string_free(s, false);
> -    cpu->dyn_m_secextreg_feature.desc.num_regs =3D base_reg - orig_base_=
reg;
> +    cpu->dyn_m_secextreg_feature.desc.regs =3D regs;
> +    cpu->dyn_m_secextreg_feature.desc.num_regs =3D i;
>=20=20
>      return &cpu->dyn_m_secextreg_feature.desc;
>  }
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 20483ef9bc..c5ed7c0aa3 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -316,15 +316,21 @@ static void output_vector_union_type(GString *s, in=
t reg_width,
>      g_string_append(s, "</union>");
>  }
>=20=20
> -GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int orig_base_r=
eg)
> +GDBFeature *arm_gen_dynamic_svereg_feature(CPUState *cs, int base_reg)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      GString *s =3D g_string_new(NULL);
>      DynamicGDBFeatureInfo *info =3D &cpu->dyn_svereg_feature;
> +    const char **regs;
>      int reg_width =3D cpu->sve_max_vq * 128;
>      int pred_width =3D cpu->sve_max_vq * 16;
> -    int base_reg =3D orig_base_reg;
> -    int i;
> +    int i =3D 0;
> +    int j;
> +
> +    info->desc.name =3D "org.gnu.gdb.aarch64.sve";
> +    info->desc.num_regs =3D 32 + 16 + 4;
> +    regs =3D g_new(const char *, info->desc.num_regs);
> +    info->desc.regs =3D regs;
>=20=20
>      g_string_printf(s, "<?xml version=3D\"1.0\"?>");
>      g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\=
">");
> @@ -339,44 +345,52 @@ GDBFeature *arm_gen_dynamic_svereg_feature(CPUState=
 *cs, int orig_base_reg)
>                             pred_width / 8);
>=20=20
>      /* Define the vector registers. */
> -    for (i =3D 0; i < 32; i++) {
> +    for (j =3D 0; j < 32; j++) {
> +        regs[i] =3D g_strdup_printf("z%d", j);
>          g_string_append_printf(s,
> -                               "<reg name=3D\"z%d\" bitsize=3D\"%d\""
> +                               "<reg name=3D\"%s\" bitsize=3D\"%d\""
>                                 " regnum=3D\"%d\" type=3D\"svev\"/>",
> -                               i, reg_width, base_reg++);
> +                               regs[i], reg_width, base_reg + i);
> +        i++;
>      }
>=20=20
>      /* fpscr & status registers */
> +    regs[i] =3D "fpsr";
>      g_string_append_printf(s, "<reg name=3D\"fpsr\" bitsize=3D\"32\""
>                             " regnum=3D\"%d\" group=3D\"float\""
> -                           " type=3D\"int\"/>", base_reg++);
> +                           " type=3D\"int\"/>", base_reg + i++);
> +    regs[i] =3D "fpcr";
>      g_string_append_printf(s, "<reg name=3D\"fpcr\" bitsize=3D\"32\""
>                             " regnum=3D\"%d\" group=3D\"float\""
> -                           " type=3D\"int\"/>", base_reg++);
> +                           " type=3D\"int\"/>", base_reg + i++);
>=20=20
>      /* Define the predicate registers. */
> -    for (i =3D 0; i < 16; i++) {
> +    for (j =3D 0; j < 16; j++) {
> +        regs[i] =3D g_strdup_printf("p%d", j);
>          g_string_append_printf(s,
> -                               "<reg name=3D\"p%d\" bitsize=3D\"%d\""
> +                               "<reg name=3D\"%s\" bitsize=3D\"%d\""
>                                 " regnum=3D\"%d\" type=3D\"svep\"/>",
> -                               i, pred_width, base_reg++);
> +                               regs[i], pred_width, base_reg + i);
> +        i++;
>      }
> +    regs[i] =3D "ffr";
>      g_string_append_printf(s,
>                             "<reg name=3D\"ffr\" bitsize=3D\"%d\""
>                             " regnum=3D\"%d\" group=3D\"vector\""
>                             " type=3D\"svep\"/>",
> -                           pred_width, base_reg++);
> +                           pred_width, base_reg + i++);
>=20=20
>      /* Define the vector length pseudo-register. */
> +    regs[i] =3D "vg";
>      g_string_append_printf(s,
>                             "<reg name=3D\"vg\" bitsize=3D\"64\""
>                             " regnum=3D\"%d\" type=3D\"int\"/>",
> -                           base_reg++);
> +                           base_reg + i++);
>=20=20
>      g_string_append_printf(s, "</feature>");
>=20=20
>      info->desc.xmlname =3D "sve-registers.xml";
>      info->desc.xml =3D g_string_free(s, false);
> -    info->desc.num_regs =3D base_reg - orig_base_reg;
> +    assert(info->desc.num_regs =3D=3D i);
>      return &info->desc;
>  }


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

