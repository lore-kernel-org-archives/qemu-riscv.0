Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZIPD-0004rN-Ta
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 16:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pZIP8-0004qT-Og; Mon, 06 Mar 2023 16:29:59 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pZIP6-0000Qd-WB; Mon, 06 Mar 2023 16:29:58 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MjxW4-1qJemO1DAG-00kRIB; Mon, 06 Mar 2023 22:29:44 +0100
Message-ID: <44381e72-25de-e685-3a9c-7e18e0008e92@vivier.eu>
Date: Mon, 6 Mar 2023 22:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH qemu] linux-user: Emulate /proc/cpuinfo output for riscv
To: ~abordado <afonsobordado@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <167811752616.21558.7117682501860352029-0@git.sr.ht>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <167811752616.21558.7117682501860352029-0@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J/7aMfC/7nVW9DmhxcG3Z8TWtkTgQuFKrEkttsHLb1A9G30/hZ3
 QatV3W3/RB8dbftFK1g0IsMK7sMUw7/9dBFZ9QQ/zuIS1TaJg7GrSDO+iycrXC5JteyhOka
 DsEhAtnjsdJR1QpmBdduubc3vmaQ6AGHqPgEtsa4CyCT5+nlx4Nq+1103vdhdmwB6BxGFaD
 9d9p4GjUzLIaIIoDHMjyQ==
UI-OutboundReport: notjunk:1;M01:P0:20UOeLPeAkE=;wf6o71zgoLHH5hiK+QOYJ7aBHAG
 pXEr+3TB3s9BBKDAbZMkWE+aYwWGN/QfID3f676BRQcTIYzqxHJkc95iU7urdc0IPyAJN0TWA
 t7JT28y2ecnGV3cV3O5WcoIXnTKECraHIUhF4JKEcv+AY1sJNEgvUI1ky1sJchufeIuXjCgSj
 yEcwLkv5A4QPoqESN9TIAvzOQGgYTEbd0tDs8fVOMFSrRk48jhHq9CGax06niIx76VIiNxzDy
 zZkq5WkxOgVhk9rcbV+ccIcEPYi0JeHXwiBFowmWZn39moXKQW2WPFo+KiX2oTYjmhx311Fnz
 VbaXQsKMEdFhwwNbpwZPdCNM9pTCbbEzPudgj3oo/pQx6WnETwY/kywGBmXYc9puL0J8MISAk
 6vEU94DleMa/e9wY5y7SCr6r/p/wDFMAxVmYDRNpmyCQXa1T0h1Qw+FzpHDwC3CBxwgWCgqi0
 nyaE0mi/vVbx6yKK9h+XPsvIsuulfKyqVr5t7MgmuYR3Vyb8mI4H+3+BfPvikvdls6B3OY4gv
 9FdABWGoZUpE36vlB/iO2lgMQ3UUtT8tM9XN49diKPpP8UiMmJemZCS50UpMRw3b2zMCeVdsC
 TpHXWGRlSXFFMkO+PLLiYfOCg6Q6VdPen5+vulxu/7adBrUhDUve/AqLU+c9+D95ZmtdUdGgz
 PmTESx1o1mWoXWdPjtZU+X55jdeXlI1R0QMkCrCY+A==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
X-List-Received-Date: Mon, 06 Mar 2023 21:30:01 -0000

Le 05/03/2023 à 15:34, ~abordado a écrit :
> From: Afonso Bordado <afonsobordado@gmail.com>
> 
> RISC-V does not expose all extensions via hwcaps, thus some userspace
> applications may want to query these via /proc/cpuinfo.
> 
> Currently when querying this file the host's file is shown instead
> which is slightly confusing. Emulate a basic /proc/cpuinfo file
> with mmu info and an ISA sting.
> 
> Signed-off-by: Afonso Bordado <afonsobordado@gmail.com>
> ---
>   linux-user/syscall.c              | 32 +++++++++++++++++++++++++++++--
>   tests/tcg/riscv64/Makefile.target |  1 +
>   tests/tcg/riscv64/cpuinfo.c       | 30 +++++++++++++++++++++++++++++
>   3 files changed, 61 insertions(+), 2 deletions(-)
>   create mode 100644 tests/tcg/riscv64/cpuinfo.c
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a6c426d73c..eda2bc5df0 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8183,7 +8183,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
>   }
>   
>   #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
> -    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
> +    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
> +    defined(TARGET_RISCV)
>   static int is_proc(const char *filename, const char *entry)
>   {
>       return strcmp(filename, entry) == 0;
> @@ -8261,6 +8262,33 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   }
>   #endif
>   
> +#if defined(TARGET_RISCV)
> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
> +{
> +    int i;
> +    int num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> +    RISCVCPU *cpu = env_archcpu(cpu_env);
> +    char *isa_string = riscv_isa_string(cpu);
> +    bool is_32_bit = riscv_cpu_xlen(&cpu->env) == 32;
> +    const char *mmu;
> +
> +    if (cpu->cfg.mmu) {
> +        mmu = (is_32_bit) ? "sv32" : "sv48";
> +    } else {
> +        mmu = "none";
> +    }
> +
> +    for (i = 0; i < num_cpus; i++) {
> +        dprintf(fd, "processor\t: %d\n", i);
> +        dprintf(fd, "hart\t\t: %d\n", i);
> +        dprintf(fd, "isa\t\t: %s\n", isa_string);
> +        dprintf(fd, "mmu\t\t: %s\n", mmu);
> +        dprintf(fd, "uarch\t\t: qemu\n\n");
> +    }
> +    return 0;
> +}
> +#endif
> +
>   #if defined(TARGET_M68K)
>   static int open_hardware(CPUArchState *cpu_env, int fd)
>   {
> @@ -8285,7 +8313,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
>   #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
>           { "/proc/net/route", open_net_route, is_proc },
>   #endif
> -#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
> +#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
>           { "/proc/cpuinfo", open_cpuinfo, is_proc },
>   #endif
>   #if defined(TARGET_M68K)
> diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
> index cc3ed65ffd..df93a2ce1f 100644
> --- a/tests/tcg/riscv64/Makefile.target
> +++ b/tests/tcg/riscv64/Makefile.target
> @@ -4,6 +4,7 @@
>   VPATH += $(SRC_PATH)/tests/tcg/riscv64
>   TESTS += test-div
>   TESTS += noexec
> +TESTS += cpuinfo
>   
>   # Disable compressed instructions for test-noc
>   TESTS += test-noc
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
> +    char buffer[BUFFER_SIZE];
> +    FILE *fp = fopen("/proc/cpuinfo", "r");
> +    assert(fp != NULL);
> +
> +    while (fgets(buffer, BUFFER_SIZE, fp) != NULL) {
> +        if (strstr(buffer, "processor") != NULL) {
> +            assert(strstr(buffer, "processor\t: ") == buffer);
> +        } else if (strstr(buffer, "hart") != NULL) {
> +            assert(strstr(buffer, "hart\t\t: ") == buffer);
> +        } else if (strstr(buffer, "isa") != NULL) {
> +            assert(strcmp(buffer, "isa\t\t: rv64imafdc_zicsr_zifencei\n") == 0);
> +        } else if (strstr(buffer, "mmu") != NULL) {
> +            assert(strcmp(buffer, "mmu\t\t: sv48\n") == 0);
> +        } else if (strstr(buffer, "uarch") != NULL) {
> +            assert(strcmp(buffer, "uarch\t\t: qemu\n") == 0);
> +        }
> +    }
> +
> +    fclose(fp);
> +    return 0;
> +}

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

