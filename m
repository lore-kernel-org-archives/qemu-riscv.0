Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EDEC001DB
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 12:57:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qVX7k-0000zx-G7; Mon, 14 Aug 2023 08:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVX7b-0000uo-CU
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 08:56:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qVX7X-0001IH-Mf
 for qemu-riscv@nongnu.org; Mon, 14 Aug 2023 08:56:35 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31427ddd3fbso3808186f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 14 Aug 2023 05:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692017789; x=1692622589;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/yNYtuGCGzFZJgZEITLstAi/015dL/8b5WK6385yKQ=;
 b=AbsSuPuRsHvvmbfXO3y7cvIGjVMiqLUW920nEO75wdAZGCi2umTRwqWMMHN6TsRIF3
 KN2xI1SK/OsE0yyyp/yMUz1FQafuqalZOj4UucnhECYlZVVRbgI9agHP8137GbyXfyMT
 k+a0jDhuLPZUEEz4/cPrYCTLI1PvlLJDsP597mqupp57UC/HFY4jQ0tAubdS5uJZjrQd
 qvYBCPcKBBpTuhNX42MDfOBlkoPbMOgSc1AyxhDhlkN6UI/coR1XCRaxvPcNi77EZbvF
 ToaGUvqwxXhWsX0QgOSpxbKyDTsSaTX2RqtvWP4SqCDFQ+/Zppb/7upLvoxk4r+/1FET
 qVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692017789; x=1692622589;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=u/yNYtuGCGzFZJgZEITLstAi/015dL/8b5WK6385yKQ=;
 b=biw5FxChrrsogCltLri/eHfj/SMKKGYkrYQIvBnZA7onRi99stmbF0HbhDOlmu6r89
 LW/h6sb82N4wDX6srSzKf5m50mOIDVGlrRwiTnLLlL54feiDe32W5Qu46HhcM2tDhvOJ
 XrWXOzO3g5FJhx/Pos9n7M1cXN08sPs9Lbms8+mL20iqu6AMcN5OTiKDE3kl/tvprbJr
 PbftNEeWU6WYFa5008QR9Jklq9ZXxHR7BrfOuzSf9GeittQb2jjG1jYDbCm9oa+RXayJ
 3G8c4bg/aeNt3lAxHa1W2oBRWLrtrnQYQEdtkYp/afIx3nZpw4IE40aG+eXbqJ6Cy3sZ
 YfZw==
X-Gm-Message-State: AOJu0YwZBdw6GxIfCPqxUWd/lKD5AjQmrcs8vMSR532r8xob4zAGNZpl
 1raj3BTBdsnQlXq8ZsttpZ6g+Q==
X-Google-Smtp-Source: AGHT+IHdE/P1mZHdPVQy2lUAfejfIuDqdb9eIyPH5L9JZdBf6HsVqg0n+m64OGQPQ+Z115UbS9AvWw==
X-Received: by 2002:a5d:6b4c:0:b0:317:5f13:5c2f with SMTP id
 x12-20020a5d6b4c000000b003175f135c2fmr5905564wrw.0.1692017789375; 
 Mon, 14 Aug 2023 05:56:29 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a5d5587000000b00314172ba213sm14374842wrv.108.2023.08.14.05.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 05:56:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 59C081FFBB;
 Mon, 14 Aug 2023 13:56:28 +0100 (BST)
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-7-akihiko.odaki@daynix.com>
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
Subject: Re: [RFC PATCH 06/24] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Date: Mon, 14 Aug 2023 12:59:10 +0100
In-reply-to: <20230731084354.115015-7-akihiko.odaki@daynix.com>
Message-ID: <871qg5sryb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

> This is a tree-wide change to replace gdb_core_xml_file, the path to
> GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
> also replaces the values assigned to gdb_num_core_regs with the
> num_regs member of GDBFeature where applicable to remove magic numbers.
>
> A following change will utilize additional information provided by
> GDBFeature to simplify XML file lookup.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  include/hw/core/cpu.h   | 5 +++--
>  target/s390x/cpu.h      | 2 --
>  gdbstub/gdbstub.c       | 6 +++---
>  target/arm/cpu.c        | 4 ++--
>  target/arm/cpu64.c      | 4 ++--
>  target/arm/tcg/cpu32.c  | 3 ++-
>  target/avr/cpu.c        | 4 ++--
>  target/hexagon/cpu.c    | 2 +-
>  target/i386/cpu.c       | 7 +++----
>  target/loongarch/cpu.c  | 4 ++--
>  target/m68k/cpu.c       | 7 ++++---
>  target/microblaze/cpu.c | 4 ++--
>  target/ppc/cpu_init.c   | 4 ++--
>  target/riscv/cpu.c      | 7 ++++---
>  target/rx/cpu.c         | 4 ++--
>  target/s390x/cpu.c      | 4 ++--
>  16 files changed, 36 insertions(+), 35 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index fdcbe87352..84219c1885 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -23,6 +23,7 @@
>  #include "hw/qdev-core.h"
>  #include "disas/dis-asm.h"
>  #include "exec/cpu-common.h"
> +#include "exec/gdbstub.h"
>  #include "exec/hwaddr.h"
>  #include "exec/memattrs.h"
>  #include "qapi/qapi-types-run-state.h"
> @@ -127,7 +128,7 @@ struct SysemuCPUOps;
>   *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>   *       its Harvard architecture split code and data.
>   * @gdb_num_core_regs: Number of core registers accessible to GDB.

It seems redundant to have this when gdb_core_features already
encapsulates this, especially since...

> - * @gdb_core_xml_file: File name for core registers GDB XML description.
> + * @gdb_core_feature: GDB core feature description.
>   * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to=
 stop
>   *           before the insn which triggers a watchpoint rather than aft=
er it.
>   * @gdb_arch_name: Optional callback that returns the architecture name =
known
> @@ -163,7 +164,7 @@ struct CPUClass {
>      int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
>      vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
>=20=20
> -    const char *gdb_core_xml_file;
> +    const GDBFeature *gdb_core_feature;
>      gchar * (*gdb_arch_name)(CPUState *cpu);
>      const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlna=
me);
>=20=20
<snip>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d71a162070..a206ab6b1b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, voi=
d *data)
>  #ifndef CONFIG_USER_ONLY
>      cc->sysemu_ops =3D &arm_sysemu_ops;
>  #endif
> -    cc->gdb_num_core_regs =3D 26;
>      cc->gdb_arch_name =3D arm_gdb_arch_name;
>      cc->gdb_get_dynamic_xml =3D arm_gdb_get_dynamic_xml;
>      cc->gdb_stop_before_watchpoint =3D true;
> @@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass *oc=
, void *data)
>      CPUClass *cc =3D CPU_CLASS(acc);
>=20=20
>      acc->info =3D data;
> -    cc->gdb_core_xml_file =3D "arm-core.xml";
> +    cc->gdb_core_feature =3D gdb_find_static_feature("arm-core.xml");
> +    cc->gdb_num_core_regs =3D cc->gdb_core_feature->num_regs;

You are doing assignments like this. I think something like this in
gdbstub:

modified   gdbstub/gdbstub.c
@@ -440,7 +440,7 @@ int gdb_read_register(CPUState *cpu, GByteArray *buf, i=
nt reg, bool has_xml)
     CPUArchState *env =3D cpu->env_ptr;
     GDBRegisterState *r;
=20
-    if (reg < cc->gdb_num_core_regs) {
+    if (reg < cc->gdb_core_feature->num_regs) {
         return cc->gdb_read_register(cpu, buf, reg, has_xml);
     }
=20
@@ -459,7 +459,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *m=
em_buf, int reg,
     CPUArchState *env =3D cpu->env_ptr;
     GDBRegisterState *r;
=20
-    if (reg < cc->gdb_num_core_regs) {
+    if (reg < cc->gdb_core_feature->num_regs) {
         return cc->gdb_write_register(cpu, mem_buf, reg, has_xml);
     }

makes most of the uses go away. Some of the other arches might need
target specific tweaks.

<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

