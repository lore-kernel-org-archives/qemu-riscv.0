Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C888C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 00:17:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF1KA-0006QX-FX; Sun, 17 Dec 2023 19:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1K8-0006OU-P7; Sun, 17 Dec 2023 19:17:32 -0500
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1K6-000765-PS; Sun, 17 Dec 2023 19:17:32 -0500
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-35f89f18daeso11085675ab.3; 
 Sun, 17 Dec 2023 16:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702858648; x=1703463448; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z8Kkygl6dmdcmbHuqi3jkwPQEUDeFq6IZdUkP6LKZhs=;
 b=VSM59rXnxrhKASOH4JeBLwAa+1xbLM+WOtk6/yrTX2kzocjR7xZ/ztD01DfFy1EqCO
 0C7whlSd99Dy3k2hGwv6gX3GwxvZWjkPT3ohcOqOXeSIzGrk21793mbWdwtdpLtWrBK3
 afT/oAde1cuLMn91Mo8nrnZYxzXaelX9ghm5I6+E+Ayjxakv5bxPLyL3DlsrJEl5gglY
 LUtolZt8D6WFviShJ8pZvhScjn+i+IynJcc2ibH/ZWxOhSLTilhgxPZiXe24wmtbTf44
 CiAfj5LKBLe1XadWZLcJiGOomKbosHEhk11fUsRym/qkc9+uxoBuNXJ0JbxC/RvaKnRQ
 C6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702858648; x=1703463448;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z8Kkygl6dmdcmbHuqi3jkwPQEUDeFq6IZdUkP6LKZhs=;
 b=sbm4qCz3hqaKU1Y0wFNHIt1CWv4VPzrHu/SToVdq5VCvu0OVM9Rm5OJUgBI5kyE8GW
 Sl8MpfP/8w5yCWpYZIe8Bq4yIkoxolyireuRMedATrkFToeu3Oh3cM16uAMhTlK+bI5h
 w93gTQGPXB7uEuuRGstqF7xdldqzf/J/Jxd3+5+VYNj5Jfs0OpmvXhmybSflEI6MXc3E
 8qrW4O/szuxmXiD3za+WyzcvHAVfbR8G1pe+5GkRnxImfQlseItBHVtcDVA0aTRsxn66
 ImAiiXi+tKXJAHZ7ACxJizjZxhsLiPRbzMa3nyJWGjrLRYEZIxAWjxl5/diMr8dFNK5f
 DHBw==
X-Gm-Message-State: AOJu0Yx0zYRcNWNny7nGWSgBZSLIV+ES4oGMcuCk4Neh0RsrjBocYSZX
 nhpiiQQi0VpzZDu/vKE95id0JJXr09LkcbUDh90=
X-Google-Smtp-Source: AGHT+IFG5w88oEGXT3J7poB1TiYzkBpCr6Q0nrTAlYOefdMl3PdWg36aCKASbYZ2VSQbpi+ItwpEQLV9sQOiZ8LI5uw=
X-Received: by 2002:a05:6e02:214d:b0:35d:a2c9:dac3 with SMTP id
 d13-20020a056e02214d00b0035da2c9dac3mr18534042ilv.33.1702858648353; Sun, 17
 Dec 2023 16:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20231213-gdb-v17-0-777047380591@daynix.com>
 <20231213-gdb-v17-9-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-9-777047380591@daynix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 10:17:02 +1000
Message-ID: <CAKmqyKMWYf1rad=9wapdMGfY8FPOGY09AK3cSRkmTvWD5UWCfQ@mail.gmail.com>
Subject: Re: [PATCH v17 09/14] hw/core/cpu: Remove gdb_get_dynamic_xml member
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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

On Wed, Dec 13, 2023 at 5:49=E2=80=AFPM Akihiko Odaki <akihiko.odaki@daynix=
.com> wrote:
>
> This function is no longer used.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/core/cpu.h |  4 ----
>  target/arm/cpu.h      |  6 ------
>  target/ppc/cpu.h      |  1 -
>  target/arm/cpu.c      |  1 -
>  target/arm/gdbstub.c  | 18 ------------------
>  target/ppc/cpu_init.c |  3 ---
>  target/ppc/gdbstub.c  | 10 ----------
>  target/riscv/cpu.c    | 14 --------------
>  8 files changed, 57 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index a6214610603f..17f99adc0f41 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -134,9 +134,6 @@ struct SysemuCPUOps;
>   *           before the insn which triggers a watchpoint rather than aft=
er it.
>   * @gdb_arch_name: Optional callback that returns the architecture name =
known
>   * to GDB. The caller must free the returned string with g_free.
> - * @gdb_get_dynamic_xml: Callback to return dynamically generated XML fo=
r the
> - *   gdb stub. Returns a pointer to the XML contents for the specified X=
ML file
> - *   or NULL if the CPU doesn't have a dynamically generated content for=
 it.
>   * @disas_set_info: Setup architecture specific components of disassembl=
y info
>   * @adjust_watchpoint_address: Perform a target-specific adjustment to a=
n
>   * address before attempting to match it against watchpoints.
> @@ -167,7 +164,6 @@ struct CPUClass {
>
>      const char *gdb_core_xml_file;
>      const gchar * (*gdb_arch_name)(CPUState *cpu);
> -    const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlna=
me);
>
>      void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b2f8ac81f06c..c8e77440f0f7 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1182,12 +1182,6 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState =
*cpu, vaddr addr,
>  int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>
> -/* Returns the dynamically generated XML for the gdb stub.
> - * Returns a pointer to the XML contents for the specified XML file or N=
ULL
> - * if the XML name doesn't match the predefined one.
> - */
> -const char *arm_gdb_get_dynamic_xml(CPUState *cpu, const char *xmlname);
> -
>  int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>                               int cpuid, DumpState *s);
>  int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index f87c26f98a67..9f94282e13e9 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1524,7 +1524,6 @@ int ppc_cpu_gdb_write_register(CPUState *cpu, uint8=
_t *buf, int reg);
>  int ppc_cpu_gdb_write_register_apple(CPUState *cpu, uint8_t *buf, int re=
g);
>  #ifndef CONFIG_USER_ONLY
>  hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> -const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name);
>  #endif
>  int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>                                 int cpuid, DumpState *s);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index efcc22b1446c..304538cca52a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2499,7 +2499,6 @@ static void arm_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      cc->sysemu_ops =3D &arm_sysemu_ops;
>  #endif
>      cc->gdb_arch_name =3D arm_gdb_arch_name;
> -    cc->gdb_get_dynamic_xml =3D arm_gdb_get_dynamic_xml;
>      cc->gdb_stop_before_watchpoint =3D true;
>      cc->disas_set_info =3D arm_disas_set_info;
>
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 059d84f98e52..a3bb73cfa7ce 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -474,24 +474,6 @@ static GDBFeature *arm_gen_dynamic_m_secextreg_featu=
re(CPUState *cs,
>  #endif
>  #endif /* CONFIG_TCG */
>
> -const char *arm_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
> -{
> -    ARMCPU *cpu =3D ARM_CPU(cs);
> -
> -    if (strcmp(xmlname, "system-registers.xml") =3D=3D 0) {
> -        return cpu->dyn_sysreg_feature.desc.xml;
> -    } else if (strcmp(xmlname, "sve-registers.xml") =3D=3D 0) {
> -        return cpu->dyn_svereg_feature.desc.xml;
> -    } else if (strcmp(xmlname, "arm-m-system.xml") =3D=3D 0) {
> -        return cpu->dyn_m_systemreg_feature.desc.xml;
> -#ifndef CONFIG_USER_ONLY
> -    } else if (strcmp(xmlname, "arm-m-secext.xml") =3D=3D 0) {
> -        return cpu->dyn_m_secextreg_feature.desc.xml;
> -#endif
> -    }
> -    return NULL;
> -}
> -
>  void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
>  {
>      CPUState *cs =3D CPU(cpu);
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index a0178c3ce80a..909d753b0221 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7380,9 +7380,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, voi=
d *data)
>  #endif
>
>      cc->gdb_num_core_regs =3D 71;
> -#ifndef CONFIG_USER_ONLY
> -    cc->gdb_get_dynamic_xml =3D ppc_gdb_get_dynamic_xml;
> -#endif
>  #ifdef USE_APPLE_GDB
>      cc->gdb_read_register =3D ppc_cpu_gdb_read_register_apple;
>      cc->gdb_write_register =3D ppc_cpu_gdb_write_register_apple;
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index 8ca37b6bf952..f47878a67bd1 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -342,16 +342,6 @@ static void gdb_gen_spr_feature(CPUState *cs)
>
>      gdb_feature_builder_end(&builder);
>  }
> -
> -const char *ppc_gdb_get_dynamic_xml(CPUState *cs, const char *xml_name)
> -{
> -    PowerPCCPUClass *pcc =3D POWERPC_CPU_GET_CLASS(cs);
> -
> -    if (strcmp(xml_name, "power-spr.xml") =3D=3D 0) {
> -        return pcc->gdb_spr.xml;
> -    }
> -    return NULL;
> -}
>  #endif
>
>  #if !defined(CONFIG_USER_ONLY)
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a3a98230ca87..1e3ac556b33e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1529,19 +1529,6 @@ static const gchar *riscv_gdb_arch_name(CPUState *=
cs)
>      }
>  }
>
> -static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *x=
mlname)
> -{
> -    RISCVCPU *cpu =3D RISCV_CPU(cs);
> -
> -    if (strcmp(xmlname, "riscv-csr.xml") =3D=3D 0) {
> -        return cpu->dyn_csr_feature.xml;
> -    } else if (strcmp(xmlname, "riscv-vector.xml") =3D=3D 0) {
> -        return cpu->dyn_vreg_feature.xml;
> -    }
> -
> -    return NULL;
> -}
> -
>  #ifndef CONFIG_USER_ONLY
>  static int64_t riscv_get_arch_id(CPUState *cs)
>  {
> @@ -1695,7 +1682,6 @@ static void riscv_cpu_common_class_init(ObjectClass=
 *c, void *data)
>      cc->get_arch_id =3D riscv_get_arch_id;
>  #endif
>      cc->gdb_arch_name =3D riscv_gdb_arch_name;
> -    cc->gdb_get_dynamic_xml =3D riscv_gdb_get_dynamic_xml;
>
>      object_class_property_add(c, "mvendorid", "uint32", cpu_get_mvendori=
d,
>                                cpu_set_mvendorid, NULL, NULL);
>
> --
> 2.43.0
>
>

