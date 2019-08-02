Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1htefx-0006dH-9z
	for mharc-qemu-riscv@gnu.org; Fri, 02 Aug 2019 17:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1htcUF-0006N4-LO
 for qemu-riscv@nongnu.org; Fri, 02 Aug 2019 14:41:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1htcU6-0001kU-5I
 for qemu-riscv@nongnu.org; Fri, 02 Aug 2019 14:41:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55148)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>)
 id 1htcTy-0001dS-Kx; Fri, 02 Aug 2019 14:40:52 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6FDC4308FBA9;
 Fri,  2 Aug 2019 18:40:46 +0000 (UTC)
Received: from work-vm (ovpn-117-230.ams2.redhat.com [10.36.117.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A6D860BEC;
 Fri,  2 Aug 2019 18:40:44 +0000 (UTC)
Date: Fri, 2 Aug 2019 19:40:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU devel <qemu-devel@nongnu.org>, QEMU riscv <qemu-riscv@nongnu.org>
Message-ID: <20190802184041.GK2899@work-vm>
References: <1564577355-29273-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564577355-29273-1-git-send-email-bmeng.cn@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 02 Aug 2019 18:40:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Fri, 02 Aug 2019 17:01:19 -0400
Subject: Re: [Qemu-riscv] [PATCH] riscv: hmp: Add a command to show virtual
 memory mappings
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
X-List-Received-Date: Fri, 02 Aug 2019 18:41:10 -0000

* Bin Meng (bmeng.cn@gmail.com) wrote:
> This adds 'info mem' command for RISC-V, to show virtual memory
> mappings that aids debugging.
> 
> Rather than showing every valid PTE, the command compacts the
> output by merging all contiguous physical address mappings into
> one block and only shows the merged block mapping details.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

I'm fine from the HMP side; I'll leave it to RiscV people tolook
ath the bit wrangling.


Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
> 
>  hmp-commands-info.hx       |   2 +-
>  target/riscv/Makefile.objs |   4 +
>  target/riscv/monitor.c     | 227 +++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 232 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/monitor.c
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index c59444c..257ee7d 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -249,7 +249,7 @@ STEXI
>  Show virtual to physical memory mappings.
>  ETEXI
>  
> -#if defined(TARGET_I386)
> +#if defined(TARGET_I386) || defined(TARGET_RISCV)
>      {
>          .name       = "mem",
>          .args_type  = "",
> diff --git a/target/riscv/Makefile.objs b/target/riscv/Makefile.objs
> index b1c79bc..a8ceccd 100644
> --- a/target/riscv/Makefile.objs
> +++ b/target/riscv/Makefile.objs
> @@ -1,5 +1,9 @@
>  obj-y += translate.o op_helper.o cpu_helper.o cpu.o csr.o fpu_helper.o gdbstub.o pmp.o
>  
> +ifeq ($(CONFIG_SOFTMMU),y)
> +obj-y += monitor.o
> +endif
> +
>  DECODETREE = $(SRC_PATH)/scripts/decodetree.py
>  
>  decode32-y = $(SRC_PATH)/target/riscv/insn32.decode
> diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
> new file mode 100644
> index 0000000..30560ff
> --- /dev/null
> +++ b/target/riscv/monitor.c
> @@ -0,0 +1,227 @@
> +/*
> + * QEMU monitor for RISC-V
> + *
> + * Copyright (c) 2019 Bin Meng <bmeng.cn@gmail.com>
> + *
> + * RISC-V specific monitor commands implementation
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
> +#include "cpu_bits.h"
> +#include "monitor/monitor.h"
> +#include "monitor/hmp-target.h"
> +
> +#ifdef TARGET_RISCV64
> +#define PTE_HEADER_FIELDS       "vaddr            paddr            "\
> +                                "size             attr\n"
> +#define PTE_HEADER_DELIMITER    "---------------- ---------------- "\
> +                                "---------------- -------\n"
> +#else
> +#define PTE_HEADER_FIELDS       "vaddr    paddr            size     attr\n"
> +#define PTE_HEADER_DELIMITER    "-------- ---------------- -------- -------\n"
> +#endif
> +
> +/* Perform linear address sign extension */
> +static target_ulong addr_canonical(int va_bits, target_ulong addr)
> +{
> +#ifdef TARGET_RISCV64
> +    if (addr & (1UL << (va_bits - 1))) {
> +        addr |= (hwaddr)-(1L << va_bits);
> +    }
> +#endif
> +
> +    return addr;
> +}
> +
> +static void print_pte_header(Monitor *mon)
> +{
> +    monitor_printf(mon, PTE_HEADER_FIELDS);
> +    monitor_printf(mon, PTE_HEADER_DELIMITER);
> +}
> +
> +static void print_pte(Monitor *mon, int va_bits, target_ulong vaddr,
> +                      hwaddr paddr, target_ulong size, int attr)
> +{
> +    /* santity check on vaddr */
> +    if (vaddr >= (1UL << va_bits)) {
> +        return;
> +    }
> +
> +    if (!size) {
> +        return;
> +    }
> +
> +    monitor_printf(mon, TARGET_FMT_lx " " TARGET_FMT_plx " " TARGET_FMT_lx
> +                   " %c%c%c%c%c%c%c\n",
> +                   addr_canonical(va_bits, vaddr),
> +                   paddr, size,
> +                   attr & PTE_R ? 'r' : '-',
> +                   attr & PTE_W ? 'w' : '-',
> +                   attr & PTE_X ? 'x' : '-',
> +                   attr & PTE_U ? 'u' : '-',
> +                   attr & PTE_G ? 'g' : '-',
> +                   attr & PTE_A ? 'a' : '-',
> +                   attr & PTE_D ? 'd' : '-');
> +}
> +
> +static void walk_pte(Monitor *mon, hwaddr base, target_ulong start,
> +                     int level, int ptidxbits, int ptesize, int va_bits,
> +                     hwaddr *vbase, hwaddr *pbase, hwaddr *last_paddr,
> +                     target_ulong *last_size, int *last_attr)
> +{
> +    hwaddr pte_addr;
> +    hwaddr paddr;
> +    target_ulong pgsize;
> +    target_ulong pte;
> +    int ptshift;
> +    int attr;
> +    int idx;
> +
> +    if (level < 0) {
> +        return;
> +    }
> +
> +    ptshift = level * ptidxbits;
> +    pgsize = 1UL << (PGSHIFT + ptshift);
> +
> +    for (idx = 0; idx < (1UL << ptidxbits); idx++) {
> +        pte_addr = base + idx * ptesize;
> +        cpu_physical_memory_read(pte_addr, &pte, ptesize);
> +
> +        paddr = (pte >> PTE_PPN_SHIFT) << PGSHIFT;
> +        attr = pte & 0xff;
> +
> +        /* PTE has to be valid */
> +        if (attr & PTE_V) {
> +            if (attr & (PTE_R | PTE_W | PTE_X)) {
> +                /*
> +                 * A leaf PTE has been found
> +                 *
> +                 * If current PTE's permission bits differ from the last one,
> +                 * or current PTE's ppn does not make a contiguous physical
> +                 * address block together with the last one, print out the last
> +                 * contiguous mapped block details.
> +                 */
> +                if ((*last_attr != attr) ||
> +                    (*last_paddr + *last_size != paddr)) {
> +                    print_pte(mon, va_bits, *vbase, *pbase,
> +                              *last_paddr + *last_size - *pbase, *last_attr);
> +
> +                    *vbase = start;
> +                    *pbase = paddr;
> +                    *last_attr = attr;
> +                }
> +
> +                *last_paddr = paddr;
> +                *last_size = pgsize;
> +            } else {
> +                /* pointer to the next level of the page table */
> +                walk_pte(mon, paddr, start, level - 1, ptidxbits, ptesize,
> +                         va_bits, vbase, pbase, last_paddr,
> +                         last_size, last_attr);
> +            }
> +        }
> +
> +        start += pgsize;
> +    }
> +
> +}
> +
> +static void mem_info_svxx(Monitor *mon, CPUArchState *env)
> +{
> +    hwaddr base;
> +    int levels, ptidxbits, ptesize, vm, va_bits;
> +    hwaddr vbase, pbase, last_paddr;
> +    target_ulong last_size;
> +    int last_attr;
> +
> +    base = get_field(env->satp, SATP_PPN) << PGSHIFT;
> +
> +    vm = get_field(env->satp, SATP_MODE);
> +    switch (vm) {
> +    case VM_1_10_SV32:
> +        levels = 2;
> +        ptidxbits = 10;
> +        ptesize = 4;
> +        break;
> +    case VM_1_10_SV39:
> +        levels = 3;
> +        ptidxbits = 9;
> +        ptesize = 8;
> +        break;
> +    case VM_1_10_SV48:
> +        levels = 4;
> +        ptidxbits = 9;
> +        ptesize = 8;
> +        break;
> +    case VM_1_10_SV57:
> +        levels = 5;
> +        ptidxbits = 9;
> +        ptesize = 8;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +        break;
> +    }
> +
> +    /* calculate virtual address bits */
> +    va_bits = PGSHIFT + levels * ptidxbits;
> +
> +    /* print header */
> +    print_pte_header(mon);
> +
> +    vbase = -1;
> +    pbase = -1;
> +    last_paddr = -1;
> +    last_size = 0;
> +    last_attr = 0;
> +
> +    /* walk page tables, starting from address 0 */
> +    walk_pte(mon, base, 0, levels - 1, ptidxbits, ptesize, va_bits,
> +             &vbase, &pbase, &last_paddr, &last_size, &last_attr);
> +
> +    /* don't forget the last one */
> +    print_pte(mon, va_bits, vbase, pbase,
> +              last_paddr + last_size - pbase, last_attr);
> +}
> +
> +void hmp_info_mem(Monitor *mon, const QDict *qdict)
> +{
> +    CPUArchState *env;
> +
> +    env = mon_get_cpu_env();
> +    if (!env) {
> +        monitor_printf(mon, "No CPU available\n");
> +        return;
> +    }
> +
> +    if (!riscv_feature(env, RISCV_FEATURE_MMU)) {
> +        monitor_printf(mon, "S-mode MMU unavailable\n");
> +        return;
> +    }
> +
> +    if (env->priv_ver < PRIV_VERSION_1_10_0) {
> +        monitor_printf(mon, "Privileged mode < 1.10 unsupported\n");
> +        return;
> +    }
> +
> +    if (!(env->satp & SATP_MODE)) {
> +        monitor_printf(mon, "No translation or protection\n");
> +        return;
> +    }
> +
> +    mem_info_svxx(mon, env);
> +}
> -- 
> 2.7.4
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

