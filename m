Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l7NLu-0005wc-UG
	for mharc-qemu-riscv@gnu.org; Wed, 03 Feb 2021 13:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l7NLs-0005u0-Iy; Wed, 03 Feb 2021 13:58:08 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:38135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l7NLq-0000ag-7W; Wed, 03 Feb 2021 13:58:08 -0500
Received: by mail-io1-xd29.google.com with SMTP id f6so452292ioz.5;
 Wed, 03 Feb 2021 10:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHHYrEzhdd+NBjgpe1gypf6WoeK9tjLRiqU3lNdj7tI=;
 b=sPnHKTsTonWgfOtKE7FCbSJK1h+rXlKJPr0/dscgQlOQcEYr2PCWOnW4Db6k6NwyCV
 /ZdTbLj3L4y808aYKWHVV7OZqlGmveZmpbzKoGKkwW006PVs3tTMnD8EHY3zYgaq2HiT
 XFeX6ZkKxVwlp3DoOwAuhi/7SbqvgvsJ0I8Mzah1G6Jh2ue778YekR9NcBxZi0F1S9QI
 o8OE4058r1zAbWfsGHLSUgIYwLChFthdKvev70nxWr/aPyAl6y5VAEXwv3T6NrSYHbj2
 Q9C86Sg3Rn7CHgLM2/GyZGRscB1pV/BJuLct3G0f1pXZpKPlraLwWLVi2l6HZev0U+NU
 FV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHHYrEzhdd+NBjgpe1gypf6WoeK9tjLRiqU3lNdj7tI=;
 b=CJArIRRxf2l5baDr7I87qJ/kAgts127xGnW6Ie5vMdWryIHQoJrcmo2iqXAhu8PvFQ
 rvRMDUhg2vcyB16q0zk+zMp0k7sxetZcFomedUozDAFgdFyI6GXq5ttkCBoi38ZAUO+B
 EwOsbRmpdDNl0K0jnAKVv+pMUSsVN9Fw1b37YE69W8gHAfsB4Dctg6C2XYYordJjNSlK
 B0C1+yNRpUwIn9WJjfIIquDpSi4jOugO3mkgi7fANbkbi4EerJMUC6jKPy30LFQeoWsE
 35hb4tZJ+dxzOV3z5sts+X1dYNJuAA6ZEEt94o/O/jw1tn9GW5/nk4ZvhTKlINVPD9C7
 1m3A==
X-Gm-Message-State: AOAM533msYP4nbcOOS7OpjES/0fOSeLuJJn6gZDjGRXza0iqzB9cbf2a
 V8RzFssIoysiIbmLhPEOYgX77jMKk8KrATmlwUY=
X-Google-Smtp-Source: ABdhPJzTQ+qt/Jz1aQo93FcJXQH6FWHIGxtQabLqbQBpUrsg8bwT2x4zo8eu/B9hsUIxBGGPea21q+xlBSddgH1y6g0=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr3670671ioq.176.1612378684300; 
 Wed, 03 Feb 2021 10:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20210201124458.1248-1-jiangyifei@huawei.com>
 <20210201124458.1248-2-jiangyifei@huawei.com>
In-Reply-To: <20210201124458.1248-2-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Feb 2021 10:57:38 -0800
Message-ID: <CAKmqyKPcPmcUWFncS4Q24rhDBbvEVX2MwkcfYP9UdEqheN9XYw@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] target-riscv: support QMP dump-guest-memory
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Andrew Jones <drjones@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 "limingwang (A)" <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, fanliang@huawei.com,
 "Wubin (H)" <wu.wubin@huawei.com>, "dengkai (A)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Wed, 03 Feb 2021 18:58:09 -0000

On Mon, Feb 1, 2021 at 4:46 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add the support needed for creating prstatus elf notes. This allows
> us to use QMP dump-guest-memory.
>
> Now ELF notes of RISC-V only contain prstatus elf notes.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

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
> index 0000000000..d965a3a704
> --- /dev/null
> +++ b/target/riscv/arch_dump.c
> @@ -0,0 +1,202 @@
> +/* Support for writing ELF notes for RISC-V architectures
> + *
> + * Copyright (C) 2021 Huawei Technologies Co., Ltd
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
> +/* struct elf_prstatus from include/linux/elfcore.h */
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
> index 27788021eb..c0dd6469ec 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -614,6 +614,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
>      /* For now, mark unmigratable: */
>      cc->vmsd = &vmstate_riscv_cpu;
> +    cc->write_elf64_note = riscv_cpu_write_elf64_note;
> +    cc->write_elf32_note = riscv_cpu_write_elf32_note;
>  #endif
>      cc->gdb_arch_name = riscv_gdb_arch_name;
>      cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 02758ae0eb..f810169e55 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -323,6 +323,10 @@ extern const char * const riscv_intr_names[];
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
> index 4196ef8b69..caf4599207 100644
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
> --
> 2.19.1
>
>

