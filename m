Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1knA0i-0008Rr-PU
	for mharc-qemu-riscv@gnu.org; Wed, 09 Dec 2020 19:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1knA0b-0008QN-SD; Wed, 09 Dec 2020 19:40:38 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:40179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1knA0V-0007vf-Kk; Wed, 09 Dec 2020 19:40:36 -0500
Received: by mail-il1-x144.google.com with SMTP id g1so3499671ilk.7;
 Wed, 09 Dec 2020 16:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=INb4vK0opERmR5bDP1DxSpaftrvOYAggkLQkvXmoIqU=;
 b=NgJ6s87tsGTWQVtrbvZANbl+uCO4VbKdR591HFN1SO4tbytNDMx1hFs5fKOnpcbe+2
 XNFtlmyG7G3I7FVr/96T8NMWmw0MPUcEPctQvHSmTVb9irhNRFjXPwyaNYfS+Sv8/M+2
 kvzYHv61o2KqsRLDacwpdQ+nh7MXEaSzwehFT/oz69wggDKVB7AQHCJRKUF7d0KaoRKu
 cln3qmj+AK9+q3buSK3sM9mfiem/F2hAwTmijsglpYqv/lr0GAHJOF6p+G2ffjTeXTZs
 jWbXuNFVxvX68qp8pVyv/qMrLf4TYOyS3zxff6Bb0eK774SiLLVSuM5m8ACwI8EaEVR2
 iUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=INb4vK0opERmR5bDP1DxSpaftrvOYAggkLQkvXmoIqU=;
 b=lvYNzXQoO2JHridvGPSgiN4RyNG7EoUGe5bzPP4dBjHIhlcn5PweOx+Z5NIgiC61Lf
 GCnOxzqikltJfo0QdSTCj+RROhNfWI9KeJmEYjB4O1mRUlNQokt1MMwjMtVesfZANw3+
 14hni/8t1Z3U3G99JCv31heTlaeHrb127RSbbBSwUJ4+0yYtnnHSaltnsiuPdAPrNxqr
 I57vo/QqAHl9UFccd5viHf1v3YcuRN7lhyvk4E1xNLFgmRwS1+c3Ab4KFDyIhJq+Ve9l
 8BBGWFjex+2VA3FTxUnSbVf+2aq7R7nFMcPmg/4IxAW07zo6idypOYtvVkJGnYU2WzEF
 CKow==
X-Gm-Message-State: AOAM5338fOluppwmn9lC+0IfV4VsDcf3Nul+PAbqsi7jd3BEenZtwbAF
 PJrME0tV5Jd2BRKtoW6PSz24QyLvhZg2P3mwb90=
X-Google-Smtp-Source: ABdhPJxVu1s3kJiwINavpLcnf7u9tuQ5BJMJWzU5W5XTqDX+Heh/TrxNX9+5BGamLZcS7G2YP1pTcXcpnGO5pU+CMMY=
X-Received: by 2002:a92:490d:: with SMTP id w13mr6643548ila.227.1607560829795; 
 Wed, 09 Dec 2020 16:40:29 -0800 (PST)
MIME-Version: 1.0
References: <20201201032936.1213-1-jiangyifei@huawei.com>
 <20201201032936.1213-2-jiangyifei@huawei.com>
In-Reply-To: <20201201032936.1213-2-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 9 Dec 2020 16:40:03 -0800
Message-ID: <CAKmqyKOOqNJroVhs2aPNj7DioLaf2YmKmFLTJ5M=q0=anJcsxQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] target-riscv: support QMP dump-guest-memory
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>,
 "limingwang (A)" <limingwang@huawei.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "Wubin (H)" <wu.wubin@huawei.com>, "dengkai (A)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
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
X-List-Received-Date: Thu, 10 Dec 2020 00:40:40 -0000

On Mon, Nov 30, 2020 at 7:32 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add the support needed for creating prstatus elf notes. Now elf notes
> only contains user_regs. This allows us to use QMP dump-guest-memory.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/arch_dump.c | 189 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.c       |   2 +
>  target/riscv/cpu.h       |   4 +
>  target/riscv/cpu_bits.h  |   1 +
>  target/riscv/meson.build |   1 +
>  5 files changed, 197 insertions(+)
>  create mode 100644 target/riscv/arch_dump.c
>
> diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
> new file mode 100644
> index 0000000000..b89ddf18c7
> --- /dev/null
> +++ b/target/riscv/arch_dump.c
> @@ -0,0 +1,189 @@
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
> +struct riscv_user_regs {
> +    target_ulong pc;
> +    target_ulong regs[31];
> +} QEMU_PACKED;
> +
> +/* struct elf_prstatus from include/uapi/linux/elfcore.h */
> +struct riscv64_elf_prstatus {
> +    char pad1[32]; /* 32 == offsetof(struct elf_prstatus, pr_pid) */
> +    uint32_t pr_pid;
> +    char pad2[76]; /* 76 == offsetof(struct elf_prstatus, pr_reg) -
> +                            offsetof(struct elf_prstatus, pr_ppid) */
> +    struct riscv_user_regs pr_reg;
> +    char pad3[8];
> +} QEMU_PACKED;
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
> +struct riscv32_elf_prstatus {
> +    char pad1[24]; /* 24 == offsetof(struct elf_prstatus, pr_pid) */
> +    uint32_t pr_pid;
> +    char pad2[44]; /* 44 == offsetof(struct elf_prstatus, pr_reg) -
> +                            offsetof(struct elf_prstatus, pr_ppid) */
> +    struct riscv_user_regs pr_reg;
> +    char pad3[4];
> +} QEMU_PACKED;
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
> index 6a0264fc6b..52399d83b4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -544,6 +544,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      cc->dump_state = riscv_cpu_dump_state;
>      cc->set_pc = riscv_cpu_set_pc;
>      cc->synchronize_from_tb = riscv_cpu_synchronize_from_tb;
> +    cc->write_elf64_note = riscv_cpu_write_elf64_note;
> +    cc->write_elf32_note = riscv_cpu_write_elf32_note;
>      cc->gdb_read_register = riscv_cpu_gdb_read_register;
>      cc->gdb_write_register = riscv_cpu_gdb_write_register;
>      cc->gdb_num_core_regs = 33;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c0a326c843..4a340b0c73 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -315,6 +315,10 @@ extern const char * const riscv_intr_names[];
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
> index 24b24c69c5..d7259561e7 100644
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

