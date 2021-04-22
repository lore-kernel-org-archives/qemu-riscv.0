Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZX8v-00014j-AU
	for mharc-qemu-riscv@gnu.org; Thu, 22 Apr 2021 07:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZX8r-00012I-Hg; Thu, 22 Apr 2021 07:05:05 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZX8o-0006IU-AW; Thu, 22 Apr 2021 07:05:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id h4so35310824wrt.12;
 Thu, 22 Apr 2021 04:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rkvxDE7427aDfJ/+nZOkQRk5FTtDF7dbiu8AwiiA2oE=;
 b=tGVgxTf8QGUHXf9TERPgR96RS9rZy18EA3DGxurpFmYM4h52CFwAJCRHKR5DWuTkq4
 YEBHCyBIJu8jVMxXTcJIDdhZ44B1Mr77fI3ocTsH5n63x2IM69jgtPpWXzz4QMH8dWFN
 wYQU10cdVI3TEo8Ib/RByaZfiPLZTtlsp+WWE61XA6OWcSQEYfgAY6mLXQ1orCCLWHMo
 QDPtt0HEZJhlKKrHoijSAvxlTCwurYqU1Di2FealxI5L17ctL+MliKz7Sanf6bGevSCH
 GW0JRklg2ze9D0faLCMpwAErnYgUArjUUTfdsxEzJej7x+qWt03bDITPZ4V6frBNQXMF
 wCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rkvxDE7427aDfJ/+nZOkQRk5FTtDF7dbiu8AwiiA2oE=;
 b=N4f7eJdnwOBQlsf31SjfDV7bcgb4A1vfbNeKbpRmWeizI4GtrdHKDQ58GhV1yf3vYW
 +6NXfYQ/FeItKvP0BeXHFGN1imhFOevnUJswzlaEopz4TMKWBVaqV8TaRBLZpCxV9L/A
 S6VNG+Pw3DLyLhacFtMDMK6d6h7IV+CDO02sXbDa3XMbMw0VbziVMdR3t/KD9fuNeGDM
 5a1A/Upa852evgFfatTcwVUafpbkM/91QDGYmR1Pna/38F9ToOIlK9Q2Djy5cqn+I8Jv
 MIX+zPpB1zbw+mxFC0TUk+MgBcw/P8zjsDm5uZpanFl7KZPM6k3gGI1uR2QHTHCi18MA
 BWrQ==
X-Gm-Message-State: AOAM5313j4oULRlH1pzUe2e1JlHFT8QTELkfkaDghHk2G78gLf4/Kr49
 7R8AVf2e5HlB7Ysbebd1Yp4=
X-Google-Smtp-Source: ABdhPJxQxtw+JO8TErbgyfXryGJOQQciwEgHEXRB1zKFj+MS2mGa0TijqkWUBzmq6osc/ubCcYJGSA==
X-Received: by 2002:a5d:4cce:: with SMTP id c14mr3567454wrt.29.1619089499419; 
 Thu, 22 Apr 2021 04:04:59 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 2sm5552358wmi.19.2021.04.22.04.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 04:04:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v5 07/15] cpu: Move CPUClass::vmsd to SysemuCPUOps
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20210422104705.2454166-1-f4bug@amsat.org>
 <20210422104705.2454166-8-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ae2b15d4-0a3a-8e98-a27e-6cc46a32a311@amsat.org>
Date: Thu, 22 Apr 2021 13:04:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422104705.2454166-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Apr 2021 11:05:07 -0000

On 4/22/21 12:46 PM, Philippe Mathieu-Daudé wrote:
> Migration is specific to system emulation.
> 
> - Move the CPUClass::vmsd field to SysemuCPUOps,
> - restrict VMSTATE_CPU() macro to sysemu,
> - vmstate_dummy is now unused, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Since v3: Merged in patch 1 (Eduardo)

Peter made a comment on v3, which might invalidate this patch:
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg04436.html

> therefore removed Richard R-b.
> 
> 'vmsd' is not a 'system operation' prototype but a const
> pointer field, so it belongs to a const structure,
> but maybe this structure could be better named than SysemuCPUOps?
> 
> This field comes from:
> 
> commit b170fce3dd06372f7bfec9a780ebcb1fce6d57e4
> Author: Andreas Färber <afaerber@suse.de>
> Date:   Sun Jan 20 20:23:22 2013 +0100
> 
>     cpu: Register VMStateDescription through CPUState
> 
>     In comparison to DeviceClass::vmsd, CPU VMState is split in two,
>     "cpu_common" and "cpu", and uses cpu_index as instance_id instead of -1.
>     Therefore add a CPU-specific CPUClass::vmsd field.
> 
>     Unlike the legacy CPUArchState registration, rather register CPUState.
> ---
>  include/hw/core/cpu.h            |  7 ++-----
>  include/hw/core/sysemu-cpu-ops.h |  4 ++++
>  include/migration/vmstate.h      |  2 --
>  cpu.c                            | 18 ++++++++----------
>  stubs/vmstate.c                  |  2 --
>  target/alpha/cpu.c               |  3 ++-
>  target/arm/cpu.c                 |  2 +-
>  target/avr/cpu.c                 |  2 +-
>  target/cris/cpu.c                |  3 ++-
>  target/hppa/cpu.c                |  3 ++-
>  target/i386/cpu.c                |  2 +-
>  target/lm32/cpu.c                |  2 +-
>  target/m68k/cpu.c                |  3 ++-
>  target/microblaze/cpu.c          |  3 ++-
>  target/mips/cpu.c                |  2 +-
>  target/moxie/cpu.c               |  2 +-
>  target/nios2/cpu.c               |  7 +++++++
>  target/openrisc/cpu.c            |  3 ++-
>  target/riscv/cpu.c               |  4 ++--
>  target/rx/cpu.c                  |  6 ++++++
>  target/s390x/cpu.c               |  2 +-
>  target/sh4/cpu.c                 |  5 +++--
>  target/sparc/cpu.c               |  2 +-
>  target/tricore/cpu.c             |  7 +++++++
>  target/unicore32/cpu.c           |  3 ++-
>  target/xtensa/cpu.c              |  5 +++--
>  target/ppc/translate_init.c.inc  |  2 +-
>  27 files changed, 65 insertions(+), 41 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 24cb05c5476..bdc702894bf 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -124,7 +124,6 @@ struct AccelCPUClass;
>   * 32-bit VM coredump.
>   * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
>   * note to a 32-bit VM coredump.
> - * @vmsd: State description for migration.
>   * @gdb_num_core_regs: Number of core registers accessible to GDB.
>   * @gdb_core_xml_file: File name for core registers GDB XML description.
>   * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
> @@ -179,7 +178,6 @@ struct CPUClass {
>      int (*write_elf32_qemunote)(WriteCoreDumpFunction f, CPUState *cpu,
>                                  void *opaque);
>  
> -    const VMStateDescription *vmsd;
>      const char *gdb_core_xml_file;
>      gchar * (*gdb_arch_name)(CPUState *cpu);
>      const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
> @@ -1057,10 +1055,8 @@ bool target_words_bigendian(void);
>  #ifdef NEED_CPU_H
>  
>  #ifdef CONFIG_SOFTMMU
> +
>  extern const VMStateDescription vmstate_cpu_common;
> -#else
> -#define vmstate_cpu_common vmstate_dummy
> -#endif
>  
>  #define VMSTATE_CPU() {                                                     \
>      .name = "parent_obj",                                                   \
> @@ -1069,6 +1065,7 @@ extern const VMStateDescription vmstate_cpu_common;
>      .flags = VMS_STRUCT,                                                    \
>      .offset = 0,                                                            \
>  }
> +#endif /* CONFIG_SOFTMMU */
>  
>  #endif /* NEED_CPU_H */
>  
> diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
> index e54a08ea25e..05f19b22070 100644
> --- a/include/hw/core/sysemu-cpu-ops.h
> +++ b/include/hw/core/sysemu-cpu-ops.h
> @@ -16,6 +16,10 @@
>   * struct SysemuCPUOps: System operations specific to a CPU class
>   */
>  typedef struct SysemuCPUOps {
> +    /**
> +     * @vmsd: State description for migration.
> +     */
> +    const VMStateDescription *vmsd;
>  } SysemuCPUOps;
>  
>  #endif /* SYSEMU_CPU_OPS_H */
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 075ee800960..8df7b69f389 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -194,8 +194,6 @@ struct VMStateDescription {
>      const VMStateDescription **subsections;
>  };
>  
> -extern const VMStateDescription vmstate_dummy;
> -
>  extern const VMStateInfo vmstate_info_bool;
>  
>  extern const VMStateInfo vmstate_info_int8;
> diff --git a/cpu.c b/cpu.c
> index bfbe5a66f95..64e17537e21 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -126,7 +126,9 @@ const VMStateDescription vmstate_cpu_common = {
>  
>  void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>  {
> +#ifndef CONFIG_USER_ONLY
>      CPUClass *cc = CPU_GET_CLASS(cpu);
> +#endif
>  
>      cpu_list_add(cpu);
>  
> @@ -137,27 +139,23 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>      }
>  #endif /* CONFIG_TCG */
>  
> -#ifdef CONFIG_USER_ONLY
> -    assert(cc->vmsd == NULL);
> -#else
> +#ifndef CONFIG_USER_ONLY
>      if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
>          vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
>      }
> -    if (cc->vmsd != NULL) {
> -        vmstate_register(NULL, cpu->cpu_index, cc->vmsd, cpu);
> +    if (cc->sysemu_ops->vmsd != NULL) {
> +        vmstate_register(NULL, cpu->cpu_index, cc->sysemu_ops->vmsd, cpu);
>      }
>  #endif /* CONFIG_USER_ONLY */
>  }
>  
>  void cpu_exec_unrealizefn(CPUState *cpu)
>  {
> +#ifndef CONFIG_USER_ONLY
>      CPUClass *cc = CPU_GET_CLASS(cpu);
>  
> -#ifdef CONFIG_USER_ONLY
> -    assert(cc->vmsd == NULL);
> -#else
> -    if (cc->vmsd != NULL) {
> -        vmstate_unregister(NULL, cc->vmsd, cpu);
> +    if (cc->sysemu_ops->vmsd != NULL) {
> +        vmstate_unregister(NULL, cc->sysemu_ops->vmsd, cpu);
>      }
>      if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
>          vmstate_unregister(NULL, &vmstate_cpu_common, cpu);
> diff --git a/stubs/vmstate.c b/stubs/vmstate.c
> index cc4fe41dfc2..8513d9204e4 100644
> --- a/stubs/vmstate.c
> +++ b/stubs/vmstate.c
> @@ -1,8 +1,6 @@
>  #include "qemu/osdep.h"
>  #include "migration/vmstate.h"
>  
> -const VMStateDescription vmstate_dummy = {};
> -
>  int vmstate_register_with_alias_id(VMStateIf *obj,
>                                     uint32_t instance_id,
>                                     const VMStateDescription *vmsd,
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index cd01d34d92f..73d1945b136 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -208,6 +208,7 @@ static void alpha_cpu_initfn(Object *obj)
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps alpha_sysemu_ops = {
> +    .vmsd = &vmstate_alpha_cpu,
>  };
>  #endif
>  
> @@ -242,7 +243,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_write_register = alpha_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
> -    dc->vmsd = &vmstate_alpha_cpu;
> +    cc->vmsd = &vmstate_alpha_cpu;
>      cc->sysemu_ops = &alpha_sysemu_ops;
>  #endif
>      cc->disas_set_info = alpha_cpu_disas_set_info;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 73a236486df..6421877c978 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1945,6 +1945,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps arm_sysemu_ops = {
> +    .vmsd = &vmstate_arm_cpu,
>  };
>  #endif
>  
> @@ -1987,7 +1988,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
>      cc->asidx_from_attrs = arm_asidx_from_attrs;
> -    cc->vmsd = &vmstate_arm_cpu;
>      cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
>      cc->write_elf64_note = arm_cpu_write_elf64_note;
>      cc->write_elf32_note = arm_cpu_write_elf32_note;
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 78ef4473c50..20a48bdfbab 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -185,6 +185,7 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  }
>  
>  static const struct SysemuCPUOps avr_sysemu_ops = {
> +    .vmsd = &vms_avr_cpu,
>  };
>  
>  #include "hw/core/tcg-cpu-ops.h"
> @@ -216,7 +217,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
>      cc->set_pc = avr_cpu_set_pc;
>      cc->memory_rw_debug = avr_cpu_memory_rw_debug;
>      cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
> -    cc->vmsd = &vms_avr_cpu;
>      cc->sysemu_ops = &avr_sysemu_ops;
>      cc->disas_set_info = avr_cpu_disas_set_info;
>      cc->gdb_read_register = avr_cpu_gdb_read_register;
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index 394df655c9f..5fa2a3f20f1 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -195,6 +195,7 @@ static void cris_cpu_initfn(Object *obj)
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps cris_sysemu_ops = {
> +    .vmsd = &vmstate_cris_cpu,
>  };
>  #endif
>  
> @@ -298,7 +299,7 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_write_register = cris_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = cris_cpu_get_phys_page_debug;
> -    dc->vmsd = &vmstate_cris_cpu;
> +    cc->vmsd = &vmstate_cris_cpu;
>      cc->sysemu_ops = &cris_sysemu_ops;
>  #endif
>  
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 6605c42e509..16ba76cfafd 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -133,6 +133,7 @@ static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps hppa_sysemu_ops = {
> +    .vmsd = &vmstate_hppa_cpu,
>  };
>  #endif
>  
> @@ -167,7 +168,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_write_register = hppa_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
> -    dc->vmsd = &vmstate_hppa_cpu;
> +    cc->vmsd = &vmstate_hppa_cpu;
>      cc->sysemu_ops = &hppa_sysemu_ops;
>  #endif
>      cc->disas_set_info = hppa_cpu_disas_set_info;
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 69858dcb243..a0cce7aafda 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7393,6 +7393,7 @@ static Property x86_cpu_properties[] = {
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps i386_sysemu_ops = {
> +    .vmsd = &vmstate_x86_cpu,
>  };
>  #endif
>  
> @@ -7436,7 +7437,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>      cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
>      cc->write_elf32_note = x86_cpu_write_elf32_note;
>      cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
> -    cc->vmsd = &vmstate_x86_cpu;
>      cc->sysemu_ops = &i386_sysemu_ops;
>  #endif /* !CONFIG_USER_ONLY */
>  
> diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
> index 15935ae7ceb..4ff54fd9204 100644
> --- a/target/lm32/cpu.c
> +++ b/target/lm32/cpu.c
> @@ -212,6 +212,7 @@ static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps lm32_sysemu_ops = {
> +    .vmsd = &vmstate_lm32_cpu,
>  };
>  #endif
>  
> @@ -246,7 +247,6 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_write_register = lm32_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
> -    cc->vmsd = &vmstate_lm32_cpu;
>      cc->sysemu_ops = &lm32_sysemu_ops;
>  #endif
>      cc->gdb_num_core_regs = 32 + 7;
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 600812d682b..840196c93e4 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -505,6 +505,7 @@ static const VMStateDescription vmstate_m68k_cpu = {
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps m68k_sysemu_ops = {
> +    .vmsd = &vmstate_m68k_cpu,
>  };
>  #endif
>  
> @@ -539,7 +540,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
>      cc->gdb_write_register = m68k_cpu_gdb_write_register;
>  #if defined(CONFIG_SOFTMMU)
>      cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
> -    dc->vmsd = &vmstate_m68k_cpu;
> +    cc->vmsd = &vmstate_m68k_cpu;
>      cc->sysemu_ops = &m68k_sysemu_ops;
>  #endif
>      cc->disas_set_info = m68k_cpu_disas_set_info;
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index c6a10b1a52b..d8fc137b3e7 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -354,6 +354,7 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps mb_sysemu_ops = {
> +    .vmsd = &vmstate_mb_cpu,
>  };
>  #endif
>  
> @@ -392,7 +393,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
>  
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
> -    dc->vmsd = &vmstate_mb_cpu;
> +    cc->vmsd = &vmstate_mb_cpu;
>      cc->sysemu_ops = &mb_sysemu_ops;
>  #endif
>      device_class_set_props(dc, mb_properties);
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 493331bf7bb..03fc4ef1962 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -682,6 +682,7 @@ static Property mips_cpu_properties[] = {
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps mips_sysemu_ops = {
> +    .vmsd = &vmstate_mips_cpu,
>  };
>  #endif
>  
> @@ -725,7 +726,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
>      cc->gdb_write_register = mips_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
> -    cc->vmsd = &vmstate_mips_cpu;
>      cc->sysemu_ops = &mips_sysemu_ops;
>  #endif
>      cc->disas_set_info = mips_cpu_disas_set_info;
> diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
> index 2cd631a7304..1e87f07ca73 100644
> --- a/target/moxie/cpu.c
> +++ b/target/moxie/cpu.c
> @@ -95,6 +95,7 @@ static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
>  }
>  
>  static const struct SysemuCPUOps moxie_sysemu_ops = {
> +    .vmsd = &vmstate_moxie_cpu,
>  };
>  
>  #include "hw/core/tcg-cpu-ops.h"
> @@ -125,7 +126,6 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
>      cc->set_pc = moxie_cpu_set_pc;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = moxie_cpu_get_phys_page_debug;
> -    cc->vmsd = &vmstate_moxie_cpu;
>  #endif
>      cc->disas_set_info = moxie_cpu_disas_set_info;
>      cc->sysemu_ops = &moxie_sysemu_ops;
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 296ccc0ed3c..a785f3ea7b6 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -25,6 +25,7 @@
>  #include "exec/log.h"
>  #include "exec/gdbstub.h"
>  #include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
>  
>  static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
>  {
> @@ -208,7 +209,13 @@ static Property nios2_properties[] = {
>  };
>  
>  #ifndef CONFIG_USER_ONLY
> +static const VMStateDescription vmstate_nios2_cpu = {
> +    .name = "cpu",
> +    .unmigratable = 1,
> +};
> +
>  static const struct SysemuCPUOps nios2_sysemu_ops = {
> +    .vmsd = &vmstate_nios2_cpu,
>  };
>  #endif
>  
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index cd8e3ae6754..b1f3f16820a 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -176,6 +176,7 @@ static void openrisc_any_initfn(Object *obj)
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps openrisc_sysemu_ops = {
> +    .vmsd = &vmstate_openrisc_cpu,
>  };
>  #endif
>  
> @@ -209,7 +210,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_write_register = openrisc_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = openrisc_cpu_get_phys_page_debug;
> -    dc->vmsd = &vmstate_openrisc_cpu;
> +    cc->vmsd = &vmstate_openrisc_cpu;
>      cc->sysemu_ops = &openrisc_sysemu_ops;
>  #endif
>      cc->gdb_num_core_regs = 32 + 3;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a6b909fa797..5d3a8dc2be4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -583,6 +583,8 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps riscv_sysemu_ops = {
> +    /* For now, mark unmigratable: */
> +    .vmsd = &vmstate_riscv_cpu,
>  };
>  #endif
>  
> @@ -628,8 +630,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      cc->disas_set_info = riscv_cpu_disas_set_info;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
> -    /* For now, mark unmigratable: */
> -    cc->vmsd = &vmstate_riscv_cpu;
>      cc->sysemu_ops = &riscv_sysemu_ops;
>      cc->write_elf64_note = riscv_cpu_write_elf64_note;
>      cc->write_elf32_note = riscv_cpu_write_elf32_note;
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index bbee1cb913f..f293f3630d0 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -174,7 +174,13 @@ static void rx_cpu_init(Object *obj)
>  }
>  
>  #ifndef CONFIG_USER_ONLY
> +static const VMStateDescription vmstate_rx_cpu = {
> +    .name = "cpu",
> +    .unmigratable = 1,
> +};
> +
>  static const struct SysemuCPUOps rx_sysemu_ops = {
> +    .vmsd = &vmstate_rx_cpu,
>  };
>  #endif
>  
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 36085035d1f..fe908d9bc40 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -479,6 +479,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps s390_sysemu_ops = {
> +    .vmsd = &vmstate_s390_cpu,
>  };
>  #endif
>  
> @@ -522,7 +523,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_write_register = s390_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
> -    cc->vmsd = &vmstate_s390_cpu;
>      cc->get_crash_info = s390_cpu_get_crash_info;
>      cc->write_elf64_note = s390_cpu_write_elf64_note;
>      cc->sysemu_ops = &s390_sysemu_ops;
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 970d94a8a1a..a2dd8f93257 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -218,13 +218,14 @@ static void superh_cpu_initfn(Object *obj)
>      env->movcal_backup_tail = &(env->movcal_backup);
>  }
>  
> +#ifndef CONFIG_USER_ONLY
>  static const VMStateDescription vmstate_sh_cpu = {
>      .name = "cpu",
>      .unmigratable = 1,
>  };
>  
> -#ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps sh4_sysemu_ops = {
> +    .vmsd = &vmstate_sh_cpu,
>  };
>  #endif
>  
> @@ -268,7 +269,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
>  
>      cc->gdb_num_core_regs = 59;
>  
> -    dc->vmsd = &vmstate_sh_cpu;
> +    cc->vmsd = &vmstate_sh_cpu;
>      cc->tcg_ops = &superh_tcg_ops;
>  }
>  
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index a5dde9f7dd9..f5862e74baf 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -850,6 +850,7 @@ static Property sparc_cpu_properties[] = {
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps sparc_sysemu_ops = {
> +    .vmsd = &vmstate_sparc_cpu,
>  };
>  #endif
>  
> @@ -894,7 +895,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_write_register = sparc_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
> -    cc->vmsd = &vmstate_sparc_cpu;
>      cc->sysemu_ops = &sparc_sysemu_ops;
>  #endif
>      cc->disas_set_info = cpu_sparc_disas_set_info;
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index 8865fa18fce..9374f8440a0 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -22,6 +22,7 @@
>  #include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "qemu/error-report.h"
> +#include "migration/vmstate.h"
>  
>  static inline void set_feature(CPUTriCoreState *env, int feature)
>  {
> @@ -142,7 +143,13 @@ static void tc27x_initfn(Object *obj)
>      set_feature(&cpu->env, TRICORE_FEATURE_161);
>  }
>  
> +static const VMStateDescription vmstate_tricore_cpu = {
> +    .name = "cpu",
> +    .unmigratable = 1,
> +};
> +
>  static const struct SysemuCPUOps tricore_sysemu_ops = {
> +    .vmsd = &vmstate_tricore_cpu,
>  };
>  
>  #include "hw/core/tcg-cpu-ops.h"
> diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
> index b67283ca592..ee5d2c5fd57 100644
> --- a/target/unicore32/cpu.c
> +++ b/target/unicore32/cpu.c
> @@ -121,6 +121,7 @@ static const VMStateDescription vmstate_uc32_cpu = {
>  };
>  
>  static const struct SysemuCPUOps uc32_sysemu_ops = {
> +    .vmsd = &vmstate_uc32_cpu,
>  };
>  
>  #include "hw/core/tcg-cpu-ops.h"
> @@ -149,7 +150,7 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
>      cc->dump_state = uc32_cpu_dump_state;
>      cc->set_pc = uc32_cpu_set_pc;
>      cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
> -    dc->vmsd = &vmstate_uc32_cpu;
> +    cc->vmsd = &vmstate_uc32_cpu;
>      cc->sysemu_ops = &uc32_sysemu_ops;
>      cc->tcg_ops = &uc32_tcg_ops;
>  }
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index e93154de3e0..83dd8e4f6c9 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -176,13 +176,14 @@ static void xtensa_cpu_initfn(Object *obj)
>  #endif
>  }
>  
> +#ifndef CONFIG_USER_ONLY
>  static const VMStateDescription vmstate_xtensa_cpu = {
>      .name = "cpu",
>      .unmigratable = 1,
>  };
>  
> -#ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps xtensa_sysemu_ops = {
> +    .vmsd = &vmstate_xtensa_cpu,
>  };
>  #endif
>  
> @@ -224,7 +225,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
>      cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
>  #endif
>      cc->disas_set_info = xtensa_cpu_disas_set_info;
> -    dc->vmsd = &vmstate_xtensa_cpu;
> +    cc->vmsd = &vmstate_xtensa_cpu;
>      cc->tcg_ops = &xtensa_tcg_ops;
>  }
>  
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
> index 2a858cd0f2a..32fa62aded0 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -10880,6 +10880,7 @@ static Property ppc_cpu_properties[] = {
>  
>  #ifndef CONFIG_USER_ONLY
>  static const struct SysemuCPUOps ppc_sysemu_ops = {
> +    .vmsd = &vmstate_ppc_cpu,
>  };
>  #endif
>  
> @@ -10925,7 +10926,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_write_register = ppc_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
>      cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
> -    cc->vmsd = &vmstate_ppc_cpu;
>      cc->sysemu_ops = &ppc_sysemu_ops;
>  #endif
>  #if defined(CONFIG_SOFTMMU)
> 

