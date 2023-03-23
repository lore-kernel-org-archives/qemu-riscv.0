Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfFkn-0004BP-Mr
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 03:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pfFki-0004B2-Ci; Thu, 23 Mar 2023 03:52:53 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pfFkg-0002r3-DP; Thu, 23 Mar 2023 03:52:52 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MlfGs-1qNyU331Vq-00indb; Thu, 23 Mar 2023 08:52:29 +0100
Message-ID: <51d17772-3d63-ab6c-3dc3-44cb9dd6a9d1@vivier.eu>
Date: Thu, 23 Mar 2023 08:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH qemu v3] linux-user: Emulate /proc/cpuinfo output for riscv
To: Afonso Bordado <afonsobordado@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <324c2fd4-7044-0dd9-7ad9-b716fbefa5d9@gmail.com>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <324c2fd4-7044-0dd9-7ad9-b716fbefa5d9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4/NeyB8q4BoVSYK031OE68WU+tm4DBpWwyqL6syZwCV5rgBZRVc
 aX5ByyaCfLXot/7VEfB43/+hycx81+LQB/TyeIlYvUzdaBn3vULB40Rs5kCEow58LXkuXC9
 NlfJNJ4nBcYXWzVTGOQYf7pL4ORtFrEAdDiVuQwlqK42fFZKEPw5kjdqlASs/NJWpVXc9fh
 WcSAUScqeiQCtM8SZzFVw==
UI-OutboundReport: notjunk:1;M01:P0:dGfwoI0xEic=;oif2c2PluStKueSycsAagxLnvlI
 3e7vi7kONGyIu31uMvJVKDRyC9IXuGaXNkIsSMwOVjJzgJ7yMrVj0j2QdVPx/x1sHNvuxxcp1
 Rrgt4RSb6YG6Kqlhhy+eD/KMEdvNfKdDlsCis5AYRXv+uCQ3yp0KSPLVbFWz0oxGZOmKmEcV4
 cFY27lIT7E7p76a5JCe21ggVwaqtBxmeAgvG81IZjWsnXArmfTas5e0LwvN1DpmDq95gq16fO
 GjuwnTWBzGIe2DvfsbxoS4fzpfpVtGbeD2djCO1Df54aGEWkyv9ecRaV9JdAgdO7+TSKx26/j
 A7tXqGgCq8SzaEvAalA4u2aOdTbbPTbfCIgEvvCWplvQtMVufDURqMrDR0MFpydgwfQF3+tsY
 SOJTsjOOX02bZxQj7uJGJFwdQZsIWVeDuVscYudiWAtpZl2x7V6609Ahk3WDGVjK2xEDdj1IZ
 QkXJF2su1ptF5mM6Luwsv8g1i1fiznk18KwLTtROVsqTaIL8o13vmw731L5lIz2BoGzpglVmL
 GEbIWmbR84JxPW33DThxxY/hwGqTm25hfgIxQNooXSUS6JEAfOhEzxPQ/Al1rh64PozsHg8wC
 ekOhsRT9d/90iFG5NwAeZ+qZaB7L09zGnwzAYtbpxCUIU/xnIiNJx5gRPulvGhb77or79w3vi
 qj8gZa8qPWHEE5CdlNTWQJmpIwx4RRrg5ipy429S2g==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Mar 2023 07:52:54 -0000

Le 21/03/2023 à 19:25, Afonso Bordado a écrit :
> RISC-V does not expose all extensions via hwcaps, thus some userspace
> applications may want to query these via /proc/cpuinfo.
> 
> Currently when querying this file the host's file is shown instead
> which is slightly confusing. Emulate a basic /proc/cpuinfo file
> with mmu info and an ISA string.
> 
> Signed-off-by: Afonso Bordado <afonsobordado@gmail.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
> 
> Thanks everyone for reviewing! Should I resend this once the 8.0
> freeze is over? Or does someone queue it for inclusion in the next
> version?

I queue this for 8.1 in the linux-use branch.

Thanks,
Laurent
> 
> 
> Changes from V2:
> - Update ChangeLog Location
> 
> Changes from V1:
> - Call `g_free` on ISA string.
> - Use `riscv_cpu_cfg` API.
> - Query `cpu_env->xl` to check for RV32.
> 
> 
>   linux-user/syscall.c              | 34 +++++++++++++++++++++++++++++--
>   tests/tcg/riscv64/Makefile.target |  1 +
>   tests/tcg/riscv64/cpuinfo.c       | 30 +++++++++++++++++++++++++++
>   3 files changed, 63 insertions(+), 2 deletions(-)
>   create mode 100644 tests/tcg/riscv64/cpuinfo.c
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 24cea6fb6a..0388f8b0b0 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8230,7 +8230,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
>   }
> 
>   #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
> -    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
> +    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
> +    defined(TARGET_RISCV)
>   static int is_proc(const char *filename, const char *entry)
>   {
>       return strcmp(filename, entry) == 0;
> @@ -8308,6 +8309,35 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   }
>   #endif
> 
> +#if defined(TARGET_RISCV)
> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
> +{
> +    int i;
> +    int num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> +    RISCVCPU *cpu = env_archcpu(cpu_env);
> +    const RISCVCPUConfig *cfg = riscv_cpu_cfg((CPURISCVState *) cpu_env);
> +    char *isa_string = riscv_isa_string(cpu);
> +    const char *mmu;
> +
> +    if (cfg->mmu) {
> +        mmu = (cpu_env->xl == MXL_RV32) ? "sv32"  : "sv48";
> +    } else {
> +        mmu = "none";
> +    }
> +
> +    for (i = 0; i < num_cpus; i++) {
> +        dprintf(fd, "processor\t: %d\n", i);
> +        dprintf(fd, "hart\t\t: %d\n", i);
> +        dprintf(fd, "isa\t\t: %s\n", isa_string);
> +        dprintf(fd, "mmu\t\t: %s\n", mmu);
> +        dprintf(fd, "uarch\t\t: qemu\n\n");
> +    }
> +
> +    g_free(isa_string);
> +    return 0;
> +}
> +#endif
> +
>   #if defined(TARGET_M68K)
>   static int open_hardware(CPUArchState *cpu_env, int fd)
>   {
> @@ -8332,7 +8362,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
>   #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
>           { "/proc/net/route", open_net_route, is_proc },
>   #endif
> -#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
> +#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
>           { "/proc/cpuinfo", open_cpuinfo, is_proc },
>   #endif
>   #if defined(TARGET_M68K)
> diff --git a/tests/tcg/riscv64/Makefile.target
> b/tests/tcg/riscv64/Makefile.target
> index cc3ed65ffd..df93a2ce1f 100644
> --- a/tests/tcg/riscv64/Makefile.target
> +++ b/tests/tcg/riscv64/Makefile.target
> @@ -4,6 +4,7 @@
>   VPATH += $(SRC_PATH)/tests/tcg/riscv64
>   TESTS += test-div
>   TESTS += noexec
> +TESTS += cpuinfo
> 
>   # Disable compressed instructions for test-noc
>   TESTS += test-noc
> diff --git a/tests/tcg/riscv64/cpuinfo.c b/tests/tcg/riscv64/cpuinfo.c
> new file mode 100644
> index 0000000000..296abd0a8c
> --- /dev/null
> +++ b/tests/tcg/riscv64/cpuinfo.c
> @@ -0,0 +1,30 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <assert.h>
> +
> +#define BUFFER_SIZE 1024
> +
> +int main(void)
> +{
> +    char buffer[BUFFER_SIZE];
> +    FILE *fp = fopen("/proc/cpuinfo", "r");
> +    assert(fp != NULL);
> +
> +    while (fgets(buffer, BUFFER_SIZE, fp) != NULL) {
> +        if (strstr(buffer, "processor") != NULL) {
> +            assert(strstr(buffer, "processor\t: ") == buffer);
> +        } else if (strstr(buffer, "hart") != NULL) {
> +            assert(strstr(buffer, "hart\t\t: ") == buffer);
> +        } else if (strstr(buffer, "isa") != NULL) {
> +            assert(strcmp(buffer, "isa\t\t: rv64imafdc_zicsr_zifencei\n") == 0);
> +        } else if (strstr(buffer, "mmu") != NULL) {
> +            assert(strcmp(buffer, "mmu\t\t: sv48\n") == 0);
> +        } else if (strstr(buffer, "uarch") != NULL) {
> +            assert(strcmp(buffer, "uarch\t\t: qemu\n") == 0);
> +        }
> +    }
> +
> +    fclose(fp);
> +    return 0;
> +}


