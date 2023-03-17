Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pd4aj-0001ew-1v
	for mharc-qemu-riscv@gnu.org; Fri, 17 Mar 2023 03:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pd4ah-0001eg-Ul; Fri, 17 Mar 2023 03:33:31 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pd4af-0008Lt-Ea; Fri, 17 Mar 2023 03:33:31 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R891e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Ve277gm_1679038399; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Ve277gm_1679038399) by smtp.aliyun-inc.com;
 Fri, 17 Mar 2023 15:33:19 +0800
Message-ID: <83b96d54-1f02-5c88-7f1c-b55b11f53b8d@linux.alibaba.com>
Date: Fri, 17 Mar 2023 15:33:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH qemu v2] linux-user: Emulate /proc/cpuinfo output for riscv
Content-Language: en-US
To: ~abordado <afonsobordado@gmail.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <167873059442.9885.15152085316575248452-0@git.sr.ht>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <167873059442.9885.15152085316575248452-0@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Mar 2023 07:33:32 -0000


On 2023/3/5 22:34, ~abordado wrote:
> From: Afonso Bordado <afonsobordado@gmail.com>
>
> RISC-V does not expose all extensions via hwcaps, thus some userspace
> applications may want to query these via /proc/cpuinfo.
>
> Currently when querying this file the host's file is shown instead
> which is slightly confusing. Emulate a basic /proc/cpuinfo file
> with mmu info and an ISA string.
>
> Changes from V1:
>
> - Call `g_free` on ISA string.
> - Use `riscv_cpu_cfg` API.
> - Query `cpu_env->xl` to check for RV32.
>
> Signed-off-by: Afonso Bordado <afonsobordado@gmail.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/syscall.c              | 34 +++++++++++++++++++++++++++++--
>   tests/tcg/riscv64/Makefile.target |  1 +
>   tests/tcg/riscv64/cpuinfo.c       | 30 +++++++++++++++++++++++++++
>   3 files changed, 63 insertions(+), 2 deletions(-)
>   create mode 100644 tests/tcg/riscv64/cpuinfo.c
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 24cea6fb6a..0388f8b0b0 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8230,7 +8230,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
>   }
>   
>   #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
> -    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
> +    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
> +    defined(TARGET_RISCV)
>   static int is_proc(const char *filename, const char *entry)
>   {
>       return strcmp(filename, entry) == 0;
> @@ -8308,6 +8309,35 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   }
>   #endif
>   
> +#if defined(TARGET_RISCV)
> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
> +{
> +    int i;
> +    int num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> +    RISCVCPU *cpu = env_archcpu(cpu_env);
> +    const RISCVCPUConfig *cfg = riscv_cpu_cfg((CPURISCVState *) cpu_env);
> +    char *isa_string = riscv_isa_string(cpu);
> +    const char *mmu;
> +
> +    if (cfg->mmu) {
> +        mmu = (cpu_env->xl == MXL_RV32) ? "sv32"  : "sv48";
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
> +
> +    g_free(isa_string);
> +    return 0;
> +}
> +#endif
> +
>   #if defined(TARGET_M68K)
>   static int open_hardware(CPUArchState *cpu_env, int fd)
>   {
> @@ -8332,7 +8362,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
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

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei


