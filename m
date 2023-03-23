Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfG5K-0000Kk-Qs
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 04:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pfG5I-0000Gu-E0; Thu, 23 Mar 2023 04:14:08 -0400
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pfG5F-0001HC-S0; Thu, 23 Mar 2023 04:14:08 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MiaHf-1q9wK931uR-00fkWz; Thu, 23 Mar 2023 09:13:42 +0100
Message-ID: <d3e2b0e3-d398-6b1c-f94a-299a8cad55f2@vivier.eu>
Date: Thu, 23 Mar 2023 09:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH qemu v3] linux-user: Emulate /proc/cpuinfo output for riscv
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
To: Afonso Bordado <afonsobordado@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <324c2fd4-7044-0dd9-7ad9-b716fbefa5d9@gmail.com>
 <51d17772-3d63-ab6c-3dc3-44cb9dd6a9d1@vivier.eu>
In-Reply-To: <51d17772-3d63-ab6c-3dc3-44cb9dd6a9d1@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ud5juV0/+0pOIQu0fxDgqTudW1Wa8iPdgpk/cj1BvR9//DcP0KA
 EWDjm31hZD/wsNQaODI4Dst8D1z8vDaEKfR6lHwRYv+fWExiAZT+K9RGCcfyF1jLy1zHkJV
 sCfdlvjHAtzU7V3UiSJvTaYyoUdJ/c7e2DmFNhddg7o+kHrSeJdDGcHkVgWtLLdSYN/D+Wg
 9wRNdajWE+GFfYwN4bEtQ==
UI-OutboundReport: notjunk:1;M01:P0:ASpH1J6COG8=;Cgcwx2+Yo4+sDcM7pr8z1Q7YS0c
 9Cl5FuAYvkITfMKd6i0ARkxy7vhOHleboZNJAu1k3l76B5E4WTyNK/OrRQQDP8e3VvIAF4wpB
 /w4KfRi5S4NQSa3x5rhu4hbwErYnsj+69xeFeptV2ZPl1EA5uuHNqm9bz+ejrGORRZO2x+p9r
 /i0Moo38tCOXB7AxT3K4eE49ft/NUk6hKwv5aMrhyG3nwGquqdDkR+v1V92dEmH7R1CwCKuw4
 6PVs2IEaj0f/AdkHiNASqUM78cJD0DUoOZuE1UnbSEIC1np3itFzCfXnUTI0x4bdQDpq2xhKY
 9EYJS9NrmFBokxHlJ4RMjL2dJoGVwPkoOQnsR8t/yoPvK7A8NWRtdqntrvZ3RWNWDETUdy+hE
 dgkn06HaJiYck2LboBlE6XAInv9mz1LLrn4rO6PQjEIRh+zCO5PU7LpVQNc3iJw8/IUEW8D3q
 ZI1BkxaRvYT++/HpUsOb8/hqrGiKB2MUjr/eDJPKsKB+H28HqWTBe31lOIl1OJPkM9r0veOZe
 D3eS64jsPXnQ9HEU94XJCv5XnbLIe9wJxKiAxEpI4ApRce/xm4Jo1smtMxRDniG8GTnJMTkn6
 /Kbi3K03/BYZYpk2KBJL/r70w1gSsnPYeCw+G6WxGLf2SLkCSEdreeBksd0ceFS+NarWfgy5T
 oAOEisNwYv8e0RGyarF7235DcY1mGR+sTTzGDj8WFw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
X-List-Received-Date: Thu, 23 Mar 2023 08:14:08 -0000

Le 23/03/2023 à 08:52, Laurent Vivier a écrit :
> Le 21/03/2023 à 19:25, Afonso Bordado a écrit :
>> RISC-V does not expose all extensions via hwcaps, thus some userspace
>> applications may want to query these via /proc/cpuinfo.
>>
>> Currently when querying this file the host's file is shown instead
>> which is slightly confusing. Emulate a basic /proc/cpuinfo file
>> with mmu info and an ISA string.
>>
>> Signed-off-by: Afonso Bordado <afonsobordado@gmail.com>
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>
>> Thanks everyone for reviewing! Should I resend this once the 8.0
>> freeze is over? Or does someone queue it for inclusion in the next
>> version?
> 
> I queue this for 8.1 in the linux-use branch.

I've applied v2 as v3 seems to be corrupted. I've removed the changelog from the commit message.

Thanks,
Laurent

> Thanks,
> Laurent
>>
>>
>> Changes from V2:
>> - Update ChangeLog Location
>>
>> Changes from V1:
>> - Call `g_free` on ISA string.
>> - Use `riscv_cpu_cfg` API.
>> - Query `cpu_env->xl` to check for RV32.
>>
>>
>>   linux-user/syscall.c              | 34 +++++++++++++++++++++++++++++--
>>   tests/tcg/riscv64/Makefile.target |  1 +
>>   tests/tcg/riscv64/cpuinfo.c       | 30 +++++++++++++++++++++++++++
>>   3 files changed, 63 insertions(+), 2 deletions(-)
>>   create mode 100644 tests/tcg/riscv64/cpuinfo.c
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 24cea6fb6a..0388f8b0b0 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -8230,7 +8230,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
>>   }
>>
>>   #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
>> -    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
>> +    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
>> +    defined(TARGET_RISCV)
>>   static int is_proc(const char *filename, const char *entry)
>>   {
>>       return strcmp(filename, entry) == 0;
>> @@ -8308,6 +8309,35 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>>   }
>>   #endif
>>
>> +#if defined(TARGET_RISCV)
>> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>> +{
>> +    int i;
>> +    int num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
>> +    RISCVCPU *cpu = env_archcpu(cpu_env);
>> +    const RISCVCPUConfig *cfg = riscv_cpu_cfg((CPURISCVState *) cpu_env);
>> +    char *isa_string = riscv_isa_string(cpu);
>> +    const char *mmu;
>> +
>> +    if (cfg->mmu) {
>> +        mmu = (cpu_env->xl == MXL_RV32) ? "sv32"  : "sv48";
>> +    } else {
>> +        mmu = "none";
>> +    }
>> +
>> +    for (i = 0; i < num_cpus; i++) {
>> +        dprintf(fd, "processor\t: %d\n", i);
>> +        dprintf(fd, "hart\t\t: %d\n", i);
>> +        dprintf(fd, "isa\t\t: %s\n", isa_string);
>> +        dprintf(fd, "mmu\t\t: %s\n", mmu);
>> +        dprintf(fd, "uarch\t\t: qemu\n\n");
>> +    }
>> +
>> +    g_free(isa_string);
>> +    return 0;
>> +}
>> +#endif
>> +
>>   #if defined(TARGET_M68K)
>>   static int open_hardware(CPUArchState *cpu_env, int fd)
>>   {
>> @@ -8332,7 +8362,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, 
>> int
>>   #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
>>           { "/proc/net/route", open_net_route, is_proc },
>>   #endif
>> -#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
>> +#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
>>           { "/proc/cpuinfo", open_cpuinfo, is_proc },
>>   #endif
>>   #if defined(TARGET_M68K)
>> diff --git a/tests/tcg/riscv64/Makefile.target
>> b/tests/tcg/riscv64/Makefile.target
>> index cc3ed65ffd..df93a2ce1f 100644
>> --- a/tests/tcg/riscv64/Makefile.target
>> +++ b/tests/tcg/riscv64/Makefile.target
>> @@ -4,6 +4,7 @@
>>   VPATH += $(SRC_PATH)/tests/tcg/riscv64
>>   TESTS += test-div
>>   TESTS += noexec
>> +TESTS += cpuinfo
>>
>>   # Disable compressed instructions for test-noc
>>   TESTS += test-noc
>> diff --git a/tests/tcg/riscv64/cpuinfo.c b/tests/tcg/riscv64/cpuinfo.c
>> new file mode 100644
>> index 0000000000..296abd0a8c
>> --- /dev/null
>> +++ b/tests/tcg/riscv64/cpuinfo.c
>> @@ -0,0 +1,30 @@
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <assert.h>
>> +
>> +#define BUFFER_SIZE 1024
>> +
>> +int main(void)
>> +{
>> +    char buffer[BUFFER_SIZE];
>> +    FILE *fp = fopen("/proc/cpuinfo", "r");
>> +    assert(fp != NULL);
>> +
>> +    while (fgets(buffer, BUFFER_SIZE, fp) != NULL) {
>> +        if (strstr(buffer, "processor") != NULL) {
>> +            assert(strstr(buffer, "processor\t: ") == buffer);
>> +        } else if (strstr(buffer, "hart") != NULL) {
>> +            assert(strstr(buffer, "hart\t\t: ") == buffer);
>> +        } else if (strstr(buffer, "isa") != NULL) {
>> +            assert(strcmp(buffer, "isa\t\t: rv64imafdc_zicsr_zifencei\n") == 0);
>> +        } else if (strstr(buffer, "mmu") != NULL) {
>> +            assert(strcmp(buffer, "mmu\t\t: sv48\n") == 0);
>> +        } else if (strstr(buffer, "uarch") != NULL) {
>> +            assert(strcmp(buffer, "uarch\t\t: qemu\n") == 0);
>> +        }
>> +    }
>> +
>> +    fclose(fp);
>> +    return 0;
>> +}
> 
> 


