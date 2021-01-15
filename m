Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0E2G-0001a6-5s
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jan 2021 20:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1l0E2C-0001Yy-Qr; Thu, 14 Jan 2021 20:36:17 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangyifei@huawei.com>)
 id 1l0E23-0004pn-UL; Thu, 14 Jan 2021 20:36:16 -0500
Received: from dggeme704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4DH3dF2VH5z5GRm;
 Fri, 15 Jan 2021 09:34:41 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggeme704-chm.china.huawei.com (10.1.199.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 15 Jan 2021 09:35:59 +0800
Received: from dggpemm000001.china.huawei.com ([7.185.36.245]) by
 dggpemm000001.china.huawei.com ([7.185.36.245]) with mapi id 15.01.1913.007;
 Fri, 15 Jan 2021 09:35:59 +0800
From: Jiangyifei <jiangyifei@huawei.com>
To: Andrew Jones <drjones@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org"
 <qemu-riscv@nongnu.org>, Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, "limingwang (A)"
 <limingwang@huawei.com>, "Alistair.Francis@wdc.com"
 <Alistair.Francis@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "Fanliang (EulerOS)" <fanliang@huawei.com>, "Wubin (H)"
 <wu.wubin@huawei.com>, "dengkai (A)" <dengkai1@huawei.com>
Subject: RE: [PATCH v2 1/1] target-riscv: support QMP dump-guest-memory
Thread-Topic: [PATCH v2 1/1] target-riscv: support QMP dump-guest-memory
Thread-Index: AQHW1OVNxsEVDKe+dkOx0YdjrIiPUKofb6WAgAijtzA=
Date: Fri, 15 Jan 2021 01:35:59 +0000
Message-ID: <7dd47d77b50240fab831d4cef37bf3ea@huawei.com>
References: <20201218022653.654-1-jiangyifei@huawei.com>
 <20201218022653.654-2-jiangyifei@huawei.com>
 <20210109213831.jznse3b3xjzrkf3h@kamzik.brq.redhat.com>
In-Reply-To: <20210109213831.jznse3b3xjzrkf3h@kamzik.brq.redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.186.236]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangyifei@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 15 Jan 2021 01:36:17 -0000


> -----Original Message-----
> From: Andrew Jones [mailto:drjones@redhat.com]
> Sent: Sunday, January 10, 2021 5:39 AM
> To: Jiangyifei <jiangyifei@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-riscv@nongnu.org; Zhanghailiang
> <zhang.zhanghailiang@huawei.com>; sagark@eecs.berkeley.edu;
> kbastian@mail.uni-paderborn.de; Zhangxiaofeng (F)
> <victor.zhangxiaofeng@huawei.com>; limingwang (A)
> <limingwang@huawei.com>; Alistair.Francis@wdc.com; palmer@dabbelt.com;
> Fanliang (EulerOS) <fanliang@huawei.com>; Wubin (H)
> <wu.wubin@huawei.com>; dengkai (A) <dengkai1@huawei.com>
> Subject: Re: [PATCH v2 1/1] target-riscv: support QMP dump-guest-memory
>=20
> On Fri, Dec 18, 2020 at 10:26:53AM +0800, Yifei Jiang wrote:
> > Add the support needed for creating prstatus elf notes. Now elf notes
> > only contains user_regs. This allows us to use QMP dump-guest-memory.
> >
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Mingwang Li <limingwang@huawei.com>
> > ---
> >  target/riscv/arch_dump.c | 189
> +++++++++++++++++++++++++++++++++++++++
> >  target/riscv/cpu.c       |   2 +
> >  target/riscv/cpu.h       |   4 +
> >  target/riscv/cpu_bits.h  |   1 +
> >  target/riscv/meson.build |   1 +
> >  5 files changed, 197 insertions(+)
> >  create mode 100644 target/riscv/arch_dump.c
> >
> > diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c new
> > file mode 100644 index 0000000000..b89ddf18c7
> > --- /dev/null
> > +++ b/target/riscv/arch_dump.c
> > @@ -0,0 +1,189 @@
> > +/* Support for writing ELF notes for RISC-V architectures
> > + *
> > + * Copyright (C) 2020 Huawei Technologies Co., Ltd
> > + *
> > + * This program is free software; you can redistribute it and/or
> > +modify it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> > +WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY
> > +or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> > +License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > +along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "cpu.h"
> > +#include "elf.h"
> > +#include "sysemu/dump.h"
> > +
> > +/* struct user_regs_struct from arch/riscv/include/uapi/asm/ptrace.h
> > +*/ struct riscv_user_regs {
> > +    target_ulong pc;
> > +    target_ulong regs[31];
> > +} QEMU_PACKED;
> > +
> > +/* struct elf_prstatus from include/uapi/linux/elfcore.h */ struct
> > +riscv64_elf_prstatus {
> > +    char pad1[32]; /* 32 =3D=3D offsetof(struct elf_prstatus, pr_pid) =
*/
> > +    uint32_t pr_pid;
> > +    char pad2[76]; /* 76 =3D=3D offsetof(struct elf_prstatus, pr_reg) =
-
> > +                            offsetof(struct elf_prstatus, pr_ppid) */
> > +    struct riscv_user_regs pr_reg;
> > +    char pad3[8];
> > +} QEMU_PACKED;
>=20
> Any reason not to use the defensive build-bugs that target/arm/arch_dump.=
c
> has?
>=20

I have sent the v3 series. And the build-bugs is added in this series.

Thanks,
Yifei

> > +
> > +struct riscv64_note {
> > +    Elf64_Nhdr hdr;
> > +    char name[8]; /* align_up(sizeof("CORE"), 4) */
> > +    struct riscv64_elf_prstatus prstatus; } QEMU_PACKED;
> > +
> > +#define RISCV64_NOTE_HEADER_SIZE offsetof(struct riscv64_note,
> > +prstatus) #define RISCV64_PRSTATUS_NOTE_SIZE \
> > +            (RISCV64_NOTE_HEADER_SIZE + sizeof(struct
> > +riscv64_elf_prstatus))
> > +
> > +static void riscv64_note_init(struct riscv64_note *note, DumpState *s,
> > +                              const char *name, Elf64_Word
> namesz,
> > +                              Elf64_Word type, Elf64_Word descsz) {
> > +    memset(note, 0, sizeof(*note));
> > +
> > +    note->hdr.n_namesz =3D cpu_to_dump32(s, namesz);
> > +    note->hdr.n_descsz =3D cpu_to_dump32(s, descsz);
> > +    note->hdr.n_type =3D cpu_to_dump32(s, type);
> > +
> > +    memcpy(note->name, name, namesz); }
> > +
> > +int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> > +                               int cpuid, void *opaque) {
> > +    struct riscv64_note note;
> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> > +    CPURISCVState *env =3D &cpu->env;
> > +    DumpState *s =3D opaque;
> > +    int ret, i =3D 0;
> > +    const char name[] =3D "CORE";
> > +
> > +    riscv64_note_init(&note, s, name, sizeof(name),
> > +                      NT_PRSTATUS, sizeof(note.prstatus));
> > +
> > +    note.prstatus.pr_pid =3D cpu_to_dump32(s, cpuid);
> > +
> > +    note.prstatus.pr_reg.pc =3D cpu_to_dump64(s, env->pc);
> > +
> > +    for (i =3D 0; i < 31; i++) {
> > +        note.prstatus.pr_reg.regs[i] =3D cpu_to_dump64(s, env->gpr[i +=
 1]);
> > +    }
> > +
> > +    ret =3D f(&note, RISCV64_PRSTATUS_NOTE_SIZE, s);
> > +    if (ret < 0) {
> > +        return -1;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +struct riscv32_elf_prstatus {
> > +    char pad1[24]; /* 24 =3D=3D offsetof(struct elf_prstatus, pr_pid) =
*/
> > +    uint32_t pr_pid;
> > +    char pad2[44]; /* 44 =3D=3D offsetof(struct elf_prstatus, pr_reg) =
-
> > +                            offsetof(struct elf_prstatus, pr_ppid) */
> > +    struct riscv_user_regs pr_reg;
> > +    char pad3[4];
> > +} QEMU_PACKED;
> > +
> > +struct riscv32_note {
> > +    Elf32_Nhdr hdr;
> > +    char name[8]; /* align_up(sizeof("CORE"), 4) */
> > +    struct riscv32_elf_prstatus prstatus; } QEMU_PACKED;
> > +
> > +#define RISCV32_NOTE_HEADER_SIZE offsetof(struct riscv32_note,
> > +prstatus) #define RISCV32_PRSTATUS_NOTE_SIZE \
> > +            (RISCV32_NOTE_HEADER_SIZE + sizeof(struct
> > +riscv32_elf_prstatus))
> > +
> > +static void riscv32_note_init(struct riscv32_note *note, DumpState *s,
> > +                              const char *name, Elf32_Word
> namesz,
> > +                              Elf32_Word type, Elf32_Word descsz) {
> > +    memset(note, 0, sizeof(*note));
> > +
> > +    note->hdr.n_namesz =3D cpu_to_dump32(s, namesz);
> > +    note->hdr.n_descsz =3D cpu_to_dump32(s, descsz);
> > +    note->hdr.n_type =3D cpu_to_dump32(s, type);
> > +
> > +    memcpy(note->name, name, namesz); }
> > +
> > +int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> > +                               int cpuid, void *opaque) {
> > +    struct riscv32_note note;
> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> > +    CPURISCVState *env =3D &cpu->env;
> > +    DumpState *s =3D opaque;
> > +    int ret, i;
> > +    const char name[] =3D "CORE";
> > +
> > +    riscv32_note_init(&note, s, name, sizeof(name),
> > +                      NT_PRSTATUS, sizeof(note.prstatus));
> > +
> > +    note.prstatus.pr_pid =3D cpu_to_dump32(s, cpuid);
> > +
> > +    note.prstatus.pr_reg.pc =3D cpu_to_dump32(s, env->pc);
> > +
> > +    for (i =3D 0; i < 31; i++) {
> > +        note.prstatus.pr_reg.regs[i] =3D cpu_to_dump32(s, env->gpr[i +=
 1]);
> > +    }
> > +
> > +    ret =3D f(&note, RISCV32_PRSTATUS_NOTE_SIZE, s);
> > +    if (ret < 0) {
> > +        return -1;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +int cpu_get_dump_info(ArchDumpInfo *info,
> > +                      const GuestPhysBlockList *guest_phys_blocks) {
> > +    RISCVCPU *cpu;
> > +    CPURISCVState *env;
> > +
> > +    if (first_cpu =3D=3D NULL) {
> > +        return -1;
> > +    }
> > +    cpu =3D RISCV_CPU(first_cpu);
> > +    env =3D &cpu->env;
> > +
> > +    info->d_machine =3D EM_RISCV;
> > +
> > +#if defined(TARGET_RISCV64)
> > +    info->d_class =3D ELFCLASS64;
> > +#else
> > +    info->d_class =3D ELFCLASS32;
> > +#endif
> > +
> > +    info->d_endian =3D (env->mstatus & MSTATUS_UBE) !=3D 0
> > +                     ? ELFDATA2MSB : ELFDATA2LSB;
> > +
> > +    return 0;
> > +}
> > +
> > +ssize_t cpu_get_note_size(int class, int machine, int nr_cpus) {
> > +    size_t note_size;
> > +
> > +    if (class =3D=3D ELFCLASS64) {
> > +        note_size =3D RISCV64_PRSTATUS_NOTE_SIZE;
> > +    } else {
> > +        note_size =3D RISCV32_PRSTATUS_NOTE_SIZE;
> > +    }
> > +
> > +    return note_size * nr_cpus;
> > +}
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c index
> > 6a0264fc6b..69999af813 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -560,6 +560,8 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id
> *data)
> >      cc->get_phys_page_debug =3D riscv_cpu_get_phys_page_debug;
> >      /* For now, mark unmigratable: */
> >      cc->vmsd =3D &vmstate_riscv_cpu;
> > +    cc->write_elf64_note =3D riscv_cpu_write_elf64_note;
> > +    cc->write_elf32_note =3D riscv_cpu_write_elf32_note;
> >  #endif
> >  #ifdef CONFIG_TCG
> >      cc->tcg_initialize =3D riscv_translate_init; diff --git
> > a/target/riscv/cpu.h b/target/riscv/cpu.h index c0a326c843..4a340b0c73
> > 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -315,6 +315,10 @@ extern const char * const riscv_intr_names[];
> >
> >  const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
> > void riscv_cpu_do_interrupt(CPUState *cpu);
> > +int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
> > +                               int cpuid, void *opaque); int
> > +riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
> > +                               int cpuid, void *opaque);
> >  int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int
> > reg);  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf,
> > int reg);  bool riscv_cpu_exec_interrupt(CPUState *cs, int
> > interrupt_request); diff --git a/target/riscv/cpu_bits.h
> > b/target/riscv/cpu_bits.h index 24b24c69c5..d7259561e7 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -368,6 +368,7 @@
> >  #define MSTATUS_MIE         0x00000008
> >  #define MSTATUS_UPIE        0x00000010
> >  #define MSTATUS_SPIE        0x00000020
> > +#define MSTATUS_UBE         0x00000040
> >  #define MSTATUS_MPIE        0x00000080
> >  #define MSTATUS_SPP         0x00000100
> >  #define MSTATUS_MPP         0x00001800
> > diff --git a/target/riscv/meson.build b/target/riscv/meson.build index
> > 14a5c62dac..88ab850682 100644
> > --- a/target/riscv/meson.build
> > +++ b/target/riscv/meson.build
> > @@ -26,6 +26,7 @@ riscv_ss.add(files(
> >
> >  riscv_softmmu_ss =3D ss.source_set()
> >  riscv_softmmu_ss.add(files(
> > +  'arch_dump.c',
> >    'pmp.c',
> >    'monitor.c',
> >    'machine.c'
> > --
> > 2.19.1
> >
> >
>=20
> Besides the missing build-bug question,
>=20
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>=20
>=20
> Thanks,
> drew


