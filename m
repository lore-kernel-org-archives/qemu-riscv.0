Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0Eb6-00021E-2q
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jan 2021 21:12:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l0Eb4-0001zn-Np
 for qemu-riscv@nongnu.org; Thu, 14 Jan 2021 21:12:18 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l0Eb1-0008LL-9u
 for qemu-riscv@nongnu.org; Thu, 14 Jan 2021 21:12:18 -0500
Received: by mail-pg1-x531.google.com with SMTP id i7so5040150pgc.8
 for <qemu-riscv@nongnu.org>; Thu, 14 Jan 2021 18:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Z9uzsGdK7eWJoTB97Sa3dCLhYkoi5bHcXg2enRd0QJI=;
 b=AFjBOii9XbHC4Z9Yo0lsjgs1arLwZRAgtA3bBdxspemUFFqHZRkNJw2tfduLEOe0Xd
 D/6mD6JUMf/PP4wkaA1LbJeQwItrseMDFmledyStKVLTnkQuovCf3aOD3inbVQeMbnTQ
 NPZ1qxgi5oeXLJCYIjLojkI4M+E4FYUbXZbLKyJZQE0E777JmLbyXIXwHHjrrTkmswzY
 Asb+xaqstBQwZdLsFstmelYbNYIJue2v8/8pATduKqsr9AI7XNf03yg+Wy5Y8G9XoPgl
 8K+mYcVPBWhwwGyPtVq/OS65VUayPbi21jvHIDKtF3oQM96HHE57aned+fzxzfOHn/Ro
 3FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Z9uzsGdK7eWJoTB97Sa3dCLhYkoi5bHcXg2enRd0QJI=;
 b=epMP3BoYqOIyZ80QZYdxncsv74XVSEewZQyD+7BLJhYYCh9J32mcAYK6D3NxgtNG0W
 Nm0BNX/xV3JVNJZcuNC2R5wkYzT1B8F23pWhzJjDljQK70qH6EwW4/FdZNr+6LL2uGCL
 7W88VWBlayM0tfxUZwSDQO6gVmy5OOJn9EF+5Sj9hYAyEaOOVGrULjpILRDoiT7rPi8i
 G0rydo7aWsudzW40fWLH1nOZ7lWwWeDvCw2f1baMbdDgaLdUSkMrf+Y5eGbeVMzjCsq8
 Yh/pWmpDt62pYeA1wI65mm7FMGnIpAxaXp4q0hjOhVfeBVMgjYQn3Inle8dII9IJdDeT
 Pw1Q==
X-Gm-Message-State: AOAM530kC5bsCGLJui2QcGXgnygO8AUatcE4B1mWLVxTYCfinWAnjl7E
 ja7cdNQiXYu8wUY+TMIV17psOg==
X-Google-Smtp-Source: ABdhPJwWpvTw2WvoCw9jmR79iQ5hp1fuId1AJJLvxp7LHXnWoC64dDhy2dyWvxWFpNOy3umgBRdwCQ==
X-Received: by 2002:a62:37c7:0:b029:1aa:22ea:537d with SMTP id
 e190-20020a6237c70000b02901aa22ea537dmr10151382pfa.56.1610676733369; 
 Thu, 14 Jan 2021 18:12:13 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u25sm6468980pfn.170.2021.01.14.18.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 18:12:12 -0800 (PST)
Date: Thu, 14 Jan 2021 18:12:12 -0800 (PST)
X-Google-Original-Date: Thu, 14 Jan 2021 18:12:11 PST (-0800)
Subject: Re: [PATCH v3 1/1] target-riscv: support QMP dump-guest-memory
In-Reply-To: <20210115012819.2053-2-jiangyifei@huawei.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 drjones@redhat.com, fanliang@huawei.com, wu.wubin@huawei.com,
 zhang.zhanghailiang@huawei.com, 
 dengkai1@huawei.com, limingwang@huawei.com, jiangyifei@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jiangyifei@huawei.com
Message-ID: <mhng-768ea3f7-e144-44a4-9cdc-2e812a1bb5f5@penguin>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=palmer@dabbelt.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 15 Jan 2021 02:12:19 -0000

On Thu, 14 Jan 2021 17:28:19 PST (-0800), jiangyifei@huawei.com wrote:
> Add the support needed for creating prstatus elf notes. Now elf notes
> only contains user_regs. This allows us to use QMP dump-guest-memory.

"Now elf notes only contains user_regs" sounds a bit odd.  Also, I usually see 
this as ELF.

> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> ---
>  target/riscv/arch_dump.c | 202 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.c       |   2 +
>  target/riscv/cpu.h       |   4 +
>  target/riscv/cpu_bits.h  |   1 +
>  target/riscv/meson.build |   1 +
>  5 files changed, 210 insertions(+)
>  create mode 100644 target/riscv/arch_dump.c
>
> diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
> new file mode 100644
> index 0000000000..6ad8f25920
> --- /dev/null
> +++ b/target/riscv/arch_dump.c
> @@ -0,0 +1,202 @@
> +/* Support for writing ELF notes for RISC-V architectures
> + *
> + * Copyright (C) 2020 Huawei Technologies Co., Ltd
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "elf.h"
> +#include "sysemu/dump.h"
> +
> +/* struct user_regs_struct from arch/riscv/include/uapi/asm/ptrace.h */
> +struct riscv64_user_regs {
> +    uint64_t pc;
> +    uint64_t regs[31];
> +} QEMU_PACKED;
> +
> +QEMU_BUILD_BUG_ON(sizeof(struct riscv64_user_regs) != 256);
> +
> +/* struct elf_prstatus from include/uapi/linux/elfcore.h */

It's just include/linux/elfcore.h.

We don't have any ABI document that defines core dumps in RISC-V.  That 
shouldn't block this, as there's tons of stuff we don't have written down, but 
this would be a good thing to put in the ELF psABI specification.

> +struct riscv64_elf_prstatus {
> +    char pad1[32]; /* 32 == offsetof(struct elf_prstatus, pr_pid) */
> +    uint32_t pr_pid;
> +    char pad2[76]; /* 76 == offsetof(struct elf_prstatus, pr_reg) -
> +                            offsetof(struct elf_prstatus, pr_ppid) */
> +    struct riscv64_user_regs pr_reg;
> +    char pad3[8];
> +} QEMU_PACKED;
> +
> +QEMU_BUILD_BUG_ON(sizeof(struct riscv64_elf_prstatus) != 376);
> +
> +struct riscv64_note {
> +    Elf64_Nhdr hdr;
> +    char name[8]; /* align_up(sizeof("CORE"), 4) */
> +    struct riscv64_elf_prstatus prstatus;
> +} QEMU_PACKED;
> +
> +#define RISCV64_NOTE_HEADER_SIZE offsetof(struct riscv64_note, prstatus)
> +#define RISCV64_PRSTATUS_NOTE_SIZE \
> +            (RISCV64_NOTE_HEADER_SIZE + sizeof(struct riscv64_elf_prstatus))
> +
> +static void riscv64_note_init(struct riscv64_note *note, DumpState *s,
> +                              const char *name, Elf64_Word namesz,
> +                              Elf64_Word type, Elf64_Word descsz)
> +{
> +    memset(note, 0, sizeof(*note));
> +
> +    note->hdr.n_namesz = cpu_to_dump32(s, namesz);
> +    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
> +    note->hdr.n_type = cpu_to_dump32(s, type);
> +
> +    memcpy(note->name, name, namesz);
> +}
> +
> +int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> +                               int cpuid, void *opaque)
> +{
> +    struct riscv64_note note;
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    DumpState *s = opaque;
> +    int ret, i = 0;
> +    const char name[] = "CORE";
> +
> +    riscv64_note_init(&note, s, name, sizeof(name),
> +                      NT_PRSTATUS, sizeof(note.prstatus));
> +
> +    note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
> +
> +    note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
> +
> +    for (i = 0; i < 31; i++) {
> +        note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->gpr[i + 1]);
> +    }
> +
> +    ret = f(&note, RISCV64_PRSTATUS_NOTE_SIZE, s);
> +    if (ret < 0) {
> +        return -1;
> +    }
> +
> +    return ret;
> +}
> +
> +struct riscv32_user_regs {
> +    uint32_t pc;
> +    uint32_t regs[31];
> +} QEMU_PACKED;
> +
> +QEMU_BUILD_BUG_ON(sizeof(struct riscv32_user_regs) != 128);
> +
> +struct riscv32_elf_prstatus {
> +    char pad1[24]; /* 24 == offsetof(struct elf_prstatus, pr_pid) */
> +    uint32_t pr_pid;
> +    char pad2[44]; /* 44 == offsetof(struct elf_prstatus, pr_reg) -
> +                            offsetof(struct elf_prstatus, pr_ppid) */
> +    struct riscv32_user_regs pr_reg;
> +    char pad3[4];
> +} QEMU_PACKED;
> +
> +QEMU_BUILD_BUG_ON(sizeof(struct riscv32_elf_prstatus) != 204);
> +
> +struct riscv32_note {
> +    Elf32_Nhdr hdr;
> +    char name[8]; /* align_up(sizeof("CORE"), 4) */
> +    struct riscv32_elf_prstatus prstatus;
> +} QEMU_PACKED;
> +
> +#define RISCV32_NOTE_HEADER_SIZE offsetof(struct riscv32_note, prstatus)
> +#define RISCV32_PRSTATUS_NOTE_SIZE \
> +            (RISCV32_NOTE_HEADER_SIZE + sizeof(struct riscv32_elf_prstatus))
> +
> +static void riscv32_note_init(struct riscv32_note *note, DumpState *s,
> +                              const char *name, Elf32_Word namesz,
> +                              Elf32_Word type, Elf32_Word descsz)
> +{
> +    memset(note, 0, sizeof(*note));
> +
> +    note->hdr.n_namesz = cpu_to_dump32(s, namesz);
> +    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
> +    note->hdr.n_type = cpu_to_dump32(s, type);
> +
> +    memcpy(note->name, name, namesz);
> +}
> +
> +int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> +                               int cpuid, void *opaque)
> +{
> +    struct riscv32_note note;
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    DumpState *s = opaque;
> +    int ret, i;
> +    const char name[] = "CORE";
> +
> +    riscv32_note_init(&note, s, name, sizeof(name),
> +                      NT_PRSTATUS, sizeof(note.prstatus));
> +
> +    note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
> +
> +    note.prstatus.pr_reg.pc = cpu_to_dump32(s, env->pc);
> +
> +    for (i = 0; i < 31; i++) {
> +        note.prstatus.pr_reg.regs[i] = cpu_to_dump32(s, env->gpr[i + 1]);
> +    }
> +
> +    ret = f(&note, RISCV32_PRSTATUS_NOTE_SIZE, s);
> +    if (ret < 0) {
> +        return -1;
> +    }
> +
> +    return ret;
> +}
> +
> +int cpu_get_dump_info(ArchDumpInfo *info,
> +                      const GuestPhysBlockList *guest_phys_blocks)
> +{
> +    RISCVCPU *cpu;
> +    CPURISCVState *env;
> +
> +    if (first_cpu == NULL) {
> +        return -1;
> +    }
> +    cpu = RISCV_CPU(first_cpu);
> +    env = &cpu->env;
> +
> +    info->d_machine = EM_RISCV;
> +
> +#if defined(TARGET_RISCV64)
> +    info->d_class = ELFCLASS64;
> +#else
> +    info->d_class = ELFCLASS32;
> +#endif
> +
> +    info->d_endian = (env->mstatus & MSTATUS_UBE) != 0
> +                     ? ELFDATA2MSB : ELFDATA2LSB;
> +
> +    return 0;
> +}
> +
> +ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
> +{
> +    size_t note_size;
> +
> +    if (class == ELFCLASS64) {
> +        note_size = RISCV64_PRSTATUS_NOTE_SIZE;
> +    } else {
> +        note_size = RISCV32_PRSTATUS_NOTE_SIZE;
> +    }
> +
> +    return note_size * nr_cpus;
> +}
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8227d7aea9..eebc35b53e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -591,6 +591,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
> +    cc->write_elf64_note = riscv_cpu_write_elf64_note;
> +    cc->write_elf32_note = riscv_cpu_write_elf32_note;
>  #endif
>  #ifdef CONFIG_TCG
>      cc->tcg_initialize = riscv_translate_init;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6339e84819..2649949924 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -321,6 +321,10 @@ extern const char * const riscv_intr_names[];
>
>  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
>  void riscv_cpu_do_interrupt(CPUState *cpu);
> +int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> +                               int cpuid, void *opaque);
> +int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> +                               int cpuid, void *opaque);
>  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index b41e8836c3..24b2fa9b72 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -368,6 +368,7 @@
>  #define MSTATUS_MIE         0x00000008
>  #define MSTATUS_UPIE        0x00000010
>  #define MSTATUS_SPIE        0x00000020
> +#define MSTATUS_UBE         0x00000040
>  #define MSTATUS_MPIE        0x00000080
>  #define MSTATUS_SPP         0x00000100
>  #define MSTATUS_MPP         0x00001800
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 14a5c62dac..88ab850682 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -26,6 +26,7 @@ riscv_ss.add(files(
>
>  riscv_softmmu_ss = ss.source_set()
>  riscv_softmmu_ss.add(files(
> +  'arch_dump.c',
>    'pmp.c',
>    'monitor.c',
>    'machine.c'

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

Has anyone tested this with GDB?

Thanks!

