Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQEbv-00031k-Eq
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 16:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQEbi-0002uu-LR; Tue, 14 Sep 2021 16:00:43 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:54369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQEbg-0004gH-3n; Tue, 14 Sep 2021 16:00:42 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MUGqT-1mI9ab1vIh-00RFIs; Tue, 14 Sep 2021 21:59:46 +0200
Subject: Re: [PATCH v2 44/53] target/m68k: convert to use format_tlb callback
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Peter Xu <peterx@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-45-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <dac8be11-2b57-9cf5-2718-c62274ce7328@vivier.eu>
Date: Tue, 14 Sep 2021 21:59:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-45-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TutcCnTH9N1i7D06wD7NxBiUN+qabbWHyeNC5b/7POwcV4o1XIo
 n5J1bt8VEVaEDASZW0oSSUtUlAVno7nf3nGY3gulWKMZYwHgWSufyB6O7O3RpdzwO9TZPGC
 x5Pqm7W/16yczAH0kTIvb2zKXgIreafniYDqDOKQpMMb4AO/w4oq862j1GnLb5l7qrpNMyZ
 f1eyvFIKmuPS+MREBrG7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F1VSFmHyMw8=:gew1WpHN0+SwPO/HLYC8CV
 zhruFF+o3T8yZjW7IuhEqck7/qeyaSuqTIIQrEC/N6O2BdmTT3ig/49xvp1YXZ3dSZ+VF+8Fu
 aShvxF6xhlRQyngSphcO9BKUvH5KxbwNiWavLJ0Sqjp5xer7+/CpzhgsZVa6outTu1ldnri0u
 rVkcMxU6+n8FD4GthfYJU3xnxfA7VTtVG05gl/DrIaWKfXPX8TIlyPNRaETO2cSVWg/kFvssZ
 sYg10FWnKhRvau3cUYROl1jSCKa+TuTS6EfeBf34acc0utqWvX/Vy96zWdBXXL67gzcaWU5qf
 m6mL2cQmNHyOGPWq48Kv9mZNiJ61rY1C1KYfrUF7E9+urH9YPtm+5j/l1axBoqCi6SRN7n+GC
 HTe/RQoImLwOQdSU5jmI6VyD/tTCVgl8ObihcDQRmYYdhYx0COjxcye6lDtHYVe+mUTN8Y/qt
 l3pL7Md78LtaBi1cApFhbyNVds8skWK5Pq8EqCJVSVn1vX+FO3c8aaQGEsco6cq4YYCYebWLh
 CRxBNvFQ+wX4ViBWw/dz1fkpiNnnDhTj6sUBHljDbJKe5h8LiS7hSuo3xt0TzbD4VpsD3l2UC
 fa7bfrZeBdetXr3zDJv4dXoslIuCVyJR+K+gsIn3vYxggUgBJOY4Oh5bm8Y0OddGMFGPPdGi6
 ZVQx3y2obBS6WYwcZk5l10Y91AAthKu9XhKQNKI2OGwQBAn7DfgFBIU3BpKcHrDpDpXv5C1RB
 RvxlVIhpVxKWxjEJcnZ4cnjmjI4dPPfAPg4TOw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Sep 2021 20:00:54 -0000

Le 14/09/2021 à 16:20, Daniel P. Berrangé a écrit :
> Change the "info tlb" implementation to use the format_tlb callback.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/m68k/cpu.c     |   3 +
>  target/m68k/cpu.h     |   3 +-
>  target/m68k/helper.c  | 132 ++++++++++++++++++++++--------------------
>  target/m68k/monitor.c |  11 +++-
>  4 files changed, 82 insertions(+), 67 deletions(-)
> 
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 4ccf572a68..8f143eb540 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -537,6 +537,9 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
>      cc->class_by_name = m68k_cpu_class_by_name;
>      cc->has_work = m68k_cpu_has_work;
>      cc->format_state = m68k_cpu_format_state;
> +#ifndef CONFIG_USER_ONLY
> +    cc->format_tlb = m68k_cpu_format_tlb;
> +#endif
>      cc->set_pc = m68k_cpu_set_pc;
>      cc->gdb_read_register = m68k_cpu_gdb_read_register;
>      cc->gdb_write_register = m68k_cpu_gdb_write_register;
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index b0641f6d0d..f2d777a1ba 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -169,6 +169,7 @@ struct M68kCPU {
>  void m68k_cpu_do_interrupt(CPUState *cpu);
>  bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void m68k_cpu_format_state(CPUState *cpu, GString *buf, int flags);
> +void m68k_cpu_format_tlb(CPUState *cpu, GString *buf);
>  hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> @@ -612,6 +613,4 @@ static inline void cpu_get_tb_cpu_state(CPUM68KState *env, target_ulong *pc,
>      }
>  }
>  
> -void dump_mmu(CPUM68KState *env);
> -
>  #endif
> diff --git a/target/m68k/helper.c b/target/m68k/helper.c
> index 137a3e1a3d..050a27d21c 100644
> --- a/target/m68k/helper.c
> +++ b/target/m68k/helper.c
> @@ -25,6 +25,7 @@
>  #include "exec/helper-proto.h"
>  #include "fpu/softfloat.h"
>  #include "qemu/qemu-print.h"
> +#include "qapi/error.h"
>  
>  #define SIGNBIT (1u << 31)
>  
> @@ -483,27 +484,28 @@ void m68k_switch_sp(CPUM68KState *env)
>  /* MMU: 68040 only */
>  
>  static void print_address_zone(uint32_t logical, uint32_t physical,
> -                               uint32_t size, int attr)
> +                               uint32_t size, int attr, GString *buf)
>  {
> -    qemu_printf("%08x - %08x -> %08x - %08x %c ",
> -                logical, logical + size - 1,
> -                physical, physical + size - 1,
> -                attr & 4 ? 'W' : '-');
> +    g_string_append_printf(buf, "%08x - %08x -> %08x - %08x %c ",
> +                           logical, logical + size - 1,
> +                           physical, physical + size - 1,
> +                           attr & 4 ? 'W' : '-');
>      size >>= 10;
>      if (size < 1024) {
> -        qemu_printf("(%d KiB)\n", size);
> +        g_string_append_printf(buf, "(%d KiB)\n", size);
>      } else {
>          size >>= 10;
>          if (size < 1024) {
> -            qemu_printf("(%d MiB)\n", size);
> +            g_string_append_printf(buf, "(%d MiB)\n", size);
>          } else {
>              size >>= 10;
> -            qemu_printf("(%d GiB)\n", size);
> +            g_string_append_printf(buf, "(%d GiB)\n", size);
>          }
>      }
>  }
>  
> -static void dump_address_map(CPUM68KState *env, uint32_t root_pointer)
> +static void dump_address_map(CPUM68KState *env, uint32_t root_pointer,
> +                             GString *buf)
>  {
>      int i, j, k;
>      int tic_size, tic_shift;
> @@ -573,7 +575,8 @@ static void dump_address_map(CPUM68KState *env, uint32_t root_pointer)
>                          size = last_logical + (1 << tic_shift) -
>                                 first_logical;
>                          print_address_zone(first_logical,
> -                                           first_physical, size, last_attr);
> +                                           first_physical, size, last_attr,
> +                                           buf);
>                      }
>                      first_logical = logical;
>                      first_physical = physical;
> @@ -583,125 +586,130 @@ static void dump_address_map(CPUM68KState *env, uint32_t root_pointer)
>      }
>      if (first_logical != logical || (attr & 4) != (last_attr & 4)) {
>          size = logical + (1 << tic_shift) - first_logical;
> -        print_address_zone(first_logical, first_physical, size, last_attr);
> +        print_address_zone(first_logical, first_physical, size, last_attr, buf);
>      }
>  }
>  
>  #define DUMP_CACHEFLAGS(a) \
>      switch (a & M68K_DESC_CACHEMODE) { \
>      case M68K_DESC_CM_WRTHRU: /* cachable, write-through */ \
> -        qemu_printf("T"); \
> +        g_string_append_printf(buf, "T"); \
>          break; \
>      case M68K_DESC_CM_COPYBK: /* cachable, copyback */ \
> -        qemu_printf("C"); \
> +        g_string_append_printf(buf, "C"); \
>          break; \
>      case M68K_DESC_CM_SERIAL: /* noncachable, serialized */ \
> -        qemu_printf("S"); \
> +        g_string_append_printf(buf, "S"); \
>          break; \
>      case M68K_DESC_CM_NCACHE: /* noncachable */ \
> -        qemu_printf("N"); \
> +        g_string_append_printf(buf, "N"); \
>          break; \
>      }
>  
> -static void dump_ttr(uint32_t ttr)
> +static void dump_ttr(uint32_t ttr, GString *buf)
>  {
>      if ((ttr & M68K_TTR_ENABLED) == 0) {
> -        qemu_printf("disabled\n");
> +        g_string_append_printf(buf, "disabled\n");
>          return;
>      }
> -    qemu_printf("Base: 0x%08x Mask: 0x%08x Control: ",
> -                ttr & M68K_TTR_ADDR_BASE,
> -                (ttr & M68K_TTR_ADDR_MASK) << M68K_TTR_ADDR_MASK_SHIFT);
> +    g_string_append_printf(buf, "Base: 0x%08x Mask: 0x%08x Control: ",
> +                           ttr & M68K_TTR_ADDR_BASE,
> +                           (ttr & M68K_TTR_ADDR_MASK) <<
> +                           M68K_TTR_ADDR_MASK_SHIFT);
>      switch (ttr & M68K_TTR_SFIELD) {
>      case M68K_TTR_SFIELD_USER:
> -        qemu_printf("U");
> +        g_string_append_printf(buf, "U");
>          break;
>      case M68K_TTR_SFIELD_SUPER:
> -        qemu_printf("S");
> +        g_string_append_printf(buf, "S");
>          break;
>      default:
> -        qemu_printf("*");
> +        g_string_append_printf(buf, "*");
>          break;
>      }
>      DUMP_CACHEFLAGS(ttr);
>      if (ttr & M68K_DESC_WRITEPROT) {
> -        qemu_printf("R");
> +        g_string_append_printf(buf, "R");
>      } else {
> -        qemu_printf("W");
> +        g_string_append_printf(buf, "W");
>      }
> -    qemu_printf(" U: %d\n", (ttr & M68K_DESC_USERATTR) >>
> -                               M68K_DESC_USERATTR_SHIFT);
> +    g_string_append_printf(buf, " U: %d\n", (ttr & M68K_DESC_USERATTR) >>
> +                           M68K_DESC_USERATTR_SHIFT);
>  }
>  
> -void dump_mmu(CPUM68KState *env)
> +
> +void m68k_cpu_format_tlb(CPUState *cpu, GString *buf)
>  {
> +    CPUM68KState *env = cpu->env_ptr;
> +
>      if ((env->mmu.tcr & M68K_TCR_ENABLED) == 0) {
> -        qemu_printf("Translation disabled\n");
> +        g_string_append_printf(buf, "Translation disabled\n");
>          return;
>      }
> -    qemu_printf("Page Size: ");
> +    g_string_append_printf(buf, "Page Size: ");
>      if (env->mmu.tcr & M68K_TCR_PAGE_8K) {
> -        qemu_printf("8kB\n");
> +        g_string_append_printf(buf, "8kB\n");
>      } else {
> -        qemu_printf("4kB\n");
> +        g_string_append_printf(buf, "4kB\n");
>      }
>  
> -    qemu_printf("MMUSR: ");
> +    g_string_append_printf(buf, "MMUSR: ");
>      if (env->mmu.mmusr & M68K_MMU_B_040) {
> -        qemu_printf("BUS ERROR\n");
> +        g_string_append_printf(buf, "BUS ERROR\n");
>      } else {
> -        qemu_printf("Phy=%08x Flags: ", env->mmu.mmusr & 0xfffff000);
> +        g_string_append_printf(buf, "Phy=%08x Flags: ",
> +                               env->mmu.mmusr & 0xfffff000);
>          /* flags found on the page descriptor */
>          if (env->mmu.mmusr & M68K_MMU_G_040) {
> -            qemu_printf("G"); /* Global */
> +            g_string_append_printf(buf, "G"); /* Global */
>          } else {
> -            qemu_printf(".");
> +            g_string_append_printf(buf, ".");
>          }
>          if (env->mmu.mmusr & M68K_MMU_S_040) {
> -            qemu_printf("S"); /* Supervisor */
> +            g_string_append_printf(buf, "S"); /* Supervisor */
>          } else {
> -            qemu_printf(".");
> +            g_string_append_printf(buf, ".");
>          }
>          if (env->mmu.mmusr & M68K_MMU_M_040) {
> -            qemu_printf("M"); /* Modified */
> +            g_string_append_printf(buf, "M"); /* Modified */
>          } else {
> -            qemu_printf(".");
> +            g_string_append_printf(buf, ".");
>          }
>          if (env->mmu.mmusr & M68K_MMU_WP_040) {
> -            qemu_printf("W"); /* Write protect */
> +            g_string_append_printf(buf, "W"); /* Write protect */
>          } else {
> -            qemu_printf(".");
> +            g_string_append_printf(buf, ".");
>          }
>          if (env->mmu.mmusr & M68K_MMU_T_040) {
> -            qemu_printf("T"); /* Transparent */
> +            g_string_append_printf(buf, "T"); /* Transparent */
>          } else {
> -            qemu_printf(".");
> +            g_string_append_printf(buf, ".");
>          }
>          if (env->mmu.mmusr & M68K_MMU_R_040) {
> -            qemu_printf("R"); /* Resident */
> +            g_string_append_printf(buf, "R"); /* Resident */
>          } else {
> -            qemu_printf(".");
> +            g_string_append_printf(buf, ".");
>          }
> -        qemu_printf(" Cache: ");
> +        g_string_append_printf(buf, " Cache: ");
>          DUMP_CACHEFLAGS(env->mmu.mmusr);
> -        qemu_printf(" U: %d\n", (env->mmu.mmusr >> 8) & 3);
> -        qemu_printf("\n");
> +        g_string_append_printf(buf, " U: %d\n", (env->mmu.mmusr >> 8) & 3);
> +        g_string_append_printf(buf, "\n");
>      }
>  
> -    qemu_printf("ITTR0: ");
> -    dump_ttr(env->mmu.ttr[M68K_ITTR0]);
> -    qemu_printf("ITTR1: ");
> -    dump_ttr(env->mmu.ttr[M68K_ITTR1]);
> -    qemu_printf("DTTR0: ");
> -    dump_ttr(env->mmu.ttr[M68K_DTTR0]);
> -    qemu_printf("DTTR1: ");
> -    dump_ttr(env->mmu.ttr[M68K_DTTR1]);
> +    g_string_append_printf(buf, "ITTR0: ");
> +    dump_ttr(env->mmu.ttr[M68K_ITTR0], buf);
> +    g_string_append_printf(buf, "ITTR1: ");
> +    dump_ttr(env->mmu.ttr[M68K_ITTR1], buf);
> +    g_string_append_printf(buf, "DTTR0: ");
> +    dump_ttr(env->mmu.ttr[M68K_DTTR0], buf);
> +    g_string_append_printf(buf, "DTTR1: ");
> +    dump_ttr(env->mmu.ttr[M68K_DTTR1], buf);
>  
> -    qemu_printf("SRP: 0x%08x\n", env->mmu.srp);
> -    dump_address_map(env, env->mmu.srp);
> +    g_string_append_printf(buf, "SRP: 0x%08x\n", env->mmu.srp);
> +    dump_address_map(env, env->mmu.srp, buf);
>  
> -    qemu_printf("URP: 0x%08x\n", env->mmu.urp);
> -    dump_address_map(env, env->mmu.urp);
> +    g_string_append_printf(buf, "URP: 0x%08x\n", env->mmu.urp);
> +    dump_address_map(env, env->mmu.urp, buf);
>  }
>  
>  static int check_TTR(uint32_t ttr, int *prot, target_ulong addr,
> diff --git a/target/m68k/monitor.c b/target/m68k/monitor.c
> index 2bdf6acae0..003a665246 100644
> --- a/target/m68k/monitor.c
> +++ b/target/m68k/monitor.c
> @@ -9,17 +9,22 @@
>  #include "cpu.h"
>  #include "monitor/hmp-target.h"
>  #include "monitor/monitor.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-machine-target.h"
>  
>  void hmp_info_tlb(Monitor *mon, const QDict *qdict)
>  {
> -    CPUArchState *env1 = mon_get_cpu_env(mon);
> +    g_autoptr(GString) buf = g_string_new("");
> +    CPUState *cpu = mon_get_cpu(mon);
>  
> -    if (!env1) {
> +    if (!cpu) {
>          monitor_printf(mon, "No CPU available\n");
>          return;
>      }
>  
> -    dump_mmu(env1);
> +    cpu_format_tlb(cpu, buf);
> +
> +    monitor_printf(mon, "%s", buf->str);
>  }
>  
>  static const MonitorDef monitor_defs[] = {
> 

Acked-by: Laurent Vivier <laurent@vivier.eu>

