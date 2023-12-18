Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9344C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 00:17:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF1JT-0005Hw-Tt; Sun, 17 Dec 2023 19:16:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1JS-0005GV-5P; Sun, 17 Dec 2023 19:16:50 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1JQ-0006ty-2P; Sun, 17 Dec 2023 19:16:49 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-dbd085edf43so1117681276.1; 
 Sun, 17 Dec 2023 16:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702858605; x=1703463405; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kxabgO4hY5mgmFsewQjdrgkkiNJNR26cJ4T/8+YNuw=;
 b=hmFw5aAF+Kbux0s9egotlZuYWM9cMP10iXncJ3y9T3DxuTMWXHUqH/siLlIiIFlRGI
 z5kx5vOFmIGkWE/ooUd8d5YTh6aXJw0ylYmZiFe4iu8iwrLfpcvcG6u4fLz28JiiM6LG
 T6xde7XbQqNcK9jb51z62ez59kzRGLSG1taMb1Ue9Y7E8k8fCfRawTdWZjeIlwFlS8Ok
 HQ0btRA7prL2tR8b5AEITlKcNwjSdawFtHEllLYGFnk7oV+4cg46POdEmPH9GUTgK70S
 Q1B7NnkjpoeaTZIPER0Y8HE+Apxp+QRmSTR9WP/FNN2GT/gTGKL88JI8NSklr9cWOXge
 qosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702858605; x=1703463405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1kxabgO4hY5mgmFsewQjdrgkkiNJNR26cJ4T/8+YNuw=;
 b=DfNUvVorOKdEzHvtWBlc6JK+xT1cBiDedF2EjSi+ZQ7NnAiZ42UWhRTrAEx/auvFmt
 o30+39djIAfpDeIrWLMjf3v6fhnfGqlxExQJqvh/N9He8AE/al2sllLAdHLacbcALFvU
 1C3nXG5oUMqhjLwLfAMNMuveo2VrVjYnSiRKv48W2E2Z5alQcLIbpfE6aGyLPNe5WIL/
 r3bcJGEON7pZL/lRIoGVyL7BltRSX8NOezX/3/bLp84+eMM8ELPR47KqFozt75dkv+xz
 cHi0SzlMPozER10HSuCYSIZInH2pkpHze4EmYKeab6mepyGTtjssuC4PNbOm9ifBqYed
 mgsA==
X-Gm-Message-State: AOJu0YzJRlaKZx278A+kdNp8aAJvR3yjIa8/1fkd5UgZFz9ztYv4VADb
 KLxe1esxyLuExwX8X2EWeQ1NvFQSt4DpOAqt2oc=
X-Google-Smtp-Source: AGHT+IEJwZXTB59zwea1L005Ux/+mC4fdMu3mzpCAxRVfSbx/eAKOjpg6RfJ7sPupSM/rzfwComO3ZW12d5kzKk0Tr0=
X-Received: by 2002:a81:4894:0:b0:5e4:c979:4da2 with SMTP id
 v142-20020a814894000000b005e4c9794da2mr2991280ywa.84.1702858605506; Sun, 17
 Dec 2023 16:16:45 -0800 (PST)
MIME-Version: 1.0
References: <20231213-gdb-v17-0-777047380591@daynix.com>
 <20231213-gdb-v17-8-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-8-777047380591@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 10:16:19 +1000
Message-ID: <CAKmqyKMjD1g4Swj2e2RiHkinfaWyfq8q7SJcP3ymt=hWjuFczQ@mail.gmail.com>
Subject: Re: [PATCH v17 08/14] gdbstub: Infer number of core registers from XML
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=alistair23@gmail.com; helo=mail-yb1-xb2f.google.com
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

On Wed, Dec 13, 2023 at 4:44=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> GDBFeature has the num_regs member so use it where applicable to
> remove magic numbers.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/core/cpu.h   | 3 ++-
>  target/s390x/cpu.h      | 2 --
>  gdbstub/gdbstub.c       | 5 ++++-
>  target/arm/cpu.c        | 1 -
>  target/arm/cpu64.c      | 1 -
>  target/avr/cpu.c        | 1 -
>  target/hexagon/cpu.c    | 1 -
>  target/i386/cpu.c       | 2 --
>  target/loongarch/cpu.c  | 2 --
>  target/m68k/cpu.c       | 1 -
>  target/microblaze/cpu.c | 1 -
>  target/riscv/cpu.c      | 1 -
>  target/rx/cpu.c         | 1 -
>  target/s390x/cpu.c      | 1 -
>  14 files changed, 6 insertions(+), 17 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index c0c8320413e5..a6214610603f 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -127,7 +127,8 @@ struct SysemuCPUOps;
>   * @gdb_adjust_breakpoint: Callback for adjusting the address of a
>   *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>   *       its Harvard architecture split code and data.
> - * @gdb_num_core_regs: Number of core registers accessible to GDB.
> + * @gdb_num_core_regs: Number of core registers accessible to GDB or 0 t=
o infer
> + *                     from @gdb_core_xml_file.
>   * @gdb_core_xml_file: File name for core registers GDB XML description.
>   * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to=
 stop
>   *           before the insn which triggers a watchpoint rather than aft=
er it.
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index fa3aac4f9739..2d81fbfea5cb 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -491,8 +491,6 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState=
 *env, vaddr *pc,
>  #define S390_R13_REGNUM 15
>  #define S390_R14_REGNUM 16
>  #define S390_R15_REGNUM 17
> -/* Total Core Registers. */
> -#define S390_NUM_CORE_REGS 18
>
>  static inline void setcc(S390CPU *cpu, uint64_t cc)
>  {
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 1d5c1da1b243..801eba9a0b0b 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -546,9 +546,12 @@ void gdb_init_cpu(CPUState *cpu)
>          gdb_register_feature(cpu, 0,
>                               cc->gdb_read_register, cc->gdb_write_regist=
er,
>                               feature);
> +        cpu->gdb_num_regs =3D cpu->gdb_num_g_regs =3D feature->num_regs;
>      }
>
> -    cpu->gdb_num_regs =3D cpu->gdb_num_g_regs =3D cc->gdb_num_core_regs;
> +    if (cc->gdb_num_core_regs) {
> +        cpu->gdb_num_regs =3D cpu->gdb_num_g_regs =3D cc->gdb_num_core_r=
egs;
> +    }
>  }
>
>  void gdb_register_coprocessor(CPUState *cpu,
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index efb22a87f9ed..efcc22b1446c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2498,7 +2498,6 @@ static void arm_cpu_class_init(ObjectClass *oc, voi=
d *data)
>  #ifndef CONFIG_USER_ONLY
>      cc->sysemu_ops =3D &arm_sysemu_ops;
>  #endif
> -    cc->gdb_num_core_regs =3D 26;
>      cc->gdb_arch_name =3D arm_gdb_arch_name;
>      cc->gdb_get_dynamic_xml =3D arm_gdb_get_dynamic_xml;
>      cc->gdb_stop_before_watchpoint =3D true;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 1e9c6c85aece..8a5bad54cf70 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -793,7 +793,6 @@ static void aarch64_cpu_class_init(ObjectClass *oc, v=
oid *data)
>
>      cc->gdb_read_register =3D aarch64_cpu_gdb_read_register;
>      cc->gdb_write_register =3D aarch64_cpu_gdb_write_register;
> -    cc->gdb_num_core_regs =3D 34;
>      cc->gdb_core_xml_file =3D "aarch64-core.xml";
>      cc->gdb_arch_name =3D aarch64_gdb_arch_name;
>
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 999c010dedb8..4bab9e227286 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -251,7 +251,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void =
*data)
>      cc->gdb_read_register =3D avr_cpu_gdb_read_register;
>      cc->gdb_write_register =3D avr_cpu_gdb_write_register;
>      cc->gdb_adjust_breakpoint =3D avr_cpu_gdb_adjust_breakpoint;
> -    cc->gdb_num_core_regs =3D 35;
>      cc->gdb_core_xml_file =3D "avr-cpu.xml";
>      cc->tcg_ops =3D &avr_tcg_ops;
>  }
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index 65ac9c75ad08..71678ef9c674 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -384,7 +384,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, vo=
id *data)
>      cc->get_pc =3D hexagon_cpu_get_pc;
>      cc->gdb_read_register =3D hexagon_gdb_read_register;
>      cc->gdb_write_register =3D hexagon_gdb_write_register;
> -    cc->gdb_num_core_regs =3D TOTAL_PER_THREAD_REGS;
>      cc->gdb_stop_before_watchpoint =3D true;
>      cc->gdb_core_xml_file =3D "hexagon-core.xml";
>      cc->disas_set_info =3D hexagon_cpu_disas_set_info;
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index cd16cb893daf..7c2276b90656 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7969,10 +7969,8 @@ static void x86_cpu_common_class_init(ObjectClass =
*oc, void *data)
>      cc->gdb_arch_name =3D x86_gdb_arch_name;
>  #ifdef TARGET_X86_64
>      cc->gdb_core_xml_file =3D "i386-64bit.xml";
> -    cc->gdb_num_core_regs =3D 66;
>  #else
>      cc->gdb_core_xml_file =3D "i386-32bit.xml";
> -    cc->gdb_num_core_regs =3D 50;
>  #endif
>      cc->disas_set_info =3D x86_disas_set_info;
>
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index fc075952e635..eedfeb965f67 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -847,7 +847,6 @@ static void loongarch32_cpu_class_init(ObjectClass *c=
, void *data)
>  {
>      CPUClass *cc =3D CPU_CLASS(c);
>
> -    cc->gdb_num_core_regs =3D 35;
>      cc->gdb_core_xml_file =3D "loongarch-base32.xml";
>      cc->gdb_arch_name =3D loongarch32_gdb_arch_name;
>  }
> @@ -861,7 +860,6 @@ static void loongarch64_cpu_class_init(ObjectClass *c=
, void *data)
>  {
>      CPUClass *cc =3D CPU_CLASS(c);
>
> -    cc->gdb_num_core_regs =3D 35;
>      cc->gdb_core_xml_file =3D "loongarch-base64.xml";
>      cc->gdb_arch_name =3D loongarch64_gdb_arch_name;
>  }
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 11c7e0a79020..a27194b2a590 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -564,7 +564,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void =
*data)
>  #endif
>      cc->disas_set_info =3D m68k_cpu_disas_set_info;
>
> -    cc->gdb_num_core_regs =3D 18;
>      cc->tcg_ops =3D &m68k_tcg_ops;
>  }
>
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 1998f69828f9..9d3fbfe15921 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -428,7 +428,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *=
data)
>      cc->sysemu_ops =3D &mb_sysemu_ops;
>  #endif
>      device_class_set_props(dc, mb_properties);
> -    cc->gdb_num_core_regs =3D 32 + 25;
>      cc->gdb_core_xml_file =3D "microblaze-core.xml";
>
>      cc->disas_set_info =3D mb_disas_set_info;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 673e937a5d82..a3a98230ca87 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1688,7 +1688,6 @@ static void riscv_cpu_common_class_init(ObjectClass=
 *c, void *data)
>      cc->get_pc =3D riscv_cpu_get_pc;
>      cc->gdb_read_register =3D riscv_cpu_gdb_read_register;
>      cc->gdb_write_register =3D riscv_cpu_gdb_write_register;
> -    cc->gdb_num_core_regs =3D 33;
>      cc->gdb_stop_before_watchpoint =3D true;
>      cc->disas_set_info =3D riscv_cpu_disas_set_info;
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 9cc9d9d15ec4..cf11b1891162 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -231,7 +231,6 @@ static void rx_cpu_class_init(ObjectClass *klass, voi=
d *data)
>      cc->gdb_write_register =3D rx_cpu_gdb_write_register;
>      cc->disas_set_info =3D rx_cpu_disas_set_info;
>
> -    cc->gdb_num_core_regs =3D 26;
>      cc->gdb_core_xml_file =3D "rx-core.xml";
>      cc->tcg_ops =3D &rx_tcg_ops;
>  }
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 6acfa1c91b20..6fba9497295a 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -362,7 +362,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void=
 *data)
>      s390_cpu_class_init_sysemu(cc);
>  #endif
>      cc->disas_set_info =3D s390_cpu_disas_set_info;
> -    cc->gdb_num_core_regs =3D S390_NUM_CORE_REGS;
>      cc->gdb_core_xml_file =3D "s390x-core64.xml";
>      cc->gdb_arch_name =3D s390_gdb_arch_name;
>
>
> --
> 2.43.0
>
>

