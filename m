Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZG9Z-0001Dx-30
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 14:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pZG9X-0001DP-4T
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 14:05:43 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pZG9U-0005ss-Ko
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 14:05:42 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so14156761pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 11:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678129539;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=AdUabjeHoTMIg2ZnIlufVFdj9nNJwj+JzKwhRjYSAcw=;
 b=mRZ3rkhe6EKNj8U+K3W5S1LQRkQdzW9x3TanrI5fDP2W5RI+lVPBzrZf6UoEVozDrf
 5y2RKQM5Aj9vXLgdVhqtadZVPzvBTvV3cQjvm/K+jXRczh6+62tOOxopOnxxCPijZD1x
 9Hujq164A+yTqs6hCpq4P90eeyPQNVtZH1dCT0jH+ix5KWLN1PdemPC26/sLjpjyoNjN
 Cf2ePFP8dXYjt0XOb/aZdbaIyOEfAgNFPJfrBIdFUrfIlZTj6+MtoZYZL4HZEx8oUGJ0
 WztQUrC3OEUkZe3IjKnJkh+8yIns2Vnu5EpExWEtYVUJVc/N0XaU2axqsefCtppSchz4
 EJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678129539;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AdUabjeHoTMIg2ZnIlufVFdj9nNJwj+JzKwhRjYSAcw=;
 b=Ic/3ZyXOWx6nljr6wYY1Ey9YbtZK+aC2vuApC2txZDy1y1HhpsTGUNKxYSwpoVIrWJ
 2rlyyz5mUvsy9Y74OPKSiQfTjOZ4CK/axVPWSuF2pTkLWy1uaSVqhP7nQOMkZejL9v/y
 nN46Ub3RUpLXPCdcv3Soz3Kt6wlyZzo4G8L+Z/xfYzDrTDA5f79bDRZRapgUPLaYfS3u
 RQhoha5/l63ZbuaEdYlQ5nqGCtZ5GepUVnBfppfhkq2JvjQNVZMpDy4jggUV6ECg4JzY
 gdMtgFD2dKUgRQ+nTI2rGM+1lkC+qBcaSddyG6ilpHz7FIWzWs+jfzZt40j7uajZaHa5
 1ezA==
X-Gm-Message-State: AO0yUKUtWSrOXAoG6phGYj8vdKrvsixLm5UiqGnfaWY66L12Jfj70Oqr
 EtgP850qeZMcJLXlWZkKpNpVJQ==
X-Google-Smtp-Source: AK7set9KEW54oJwQuVrH0EE6uL/OT6GIWelU0DIZ1q66Coz6XHKu9lMNo/HZXjycWc5qRvWEjkqilw==
X-Received: by 2002:a05:6a20:9390:b0:c6:ff46:c713 with SMTP id
 x16-20020a056a20939000b000c6ff46c713mr14403285pzh.57.1678129538380; 
 Mon, 06 Mar 2023 11:05:38 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 w3-20020aa78583000000b005abc30d9445sm6601429pfn.180.2023.03.06.11.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 11:05:38 -0800 (PST)
Date: Mon, 06 Mar 2023 11:05:38 -0800 (PST)
X-Google-Original-Date: Mon, 06 Mar 2023 11:04:47 PST (-0800)
Subject: Re: [PATCH qemu] linux-user: Emulate /proc/cpuinfo output for riscv
In-Reply-To: <167811752616.21558.7117682501860352029-0@git.sr.ht>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, laurent@vivier.eu,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: abordado@git.sr.ht
Message-ID: <mhng-5ff602dd-41c0-4221-b408-713c9db3d2ff@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 06 Mar 2023 19:05:43 -0000

On Sun, 05 Mar 2023 06:34:37 PST (-0800), abordado@git.sr.ht wrote:
> From: Afonso Bordado <afonsobordado@gmail.com>
>
> RISC-V does not expose all extensions via hwcaps, thus some userspace
> applications may want to query these via /proc/cpuinfo.
>
> Currently when querying this file the host's file is shown instead
> which is slightly confusing. Emulate a basic /proc/cpuinfo file
> with mmu info and an ISA sting.

Kind of an orthogonal issue, but maybe we should default to having no 
/proc/cpuinfo (or an empty one, or something that can be detected as 
obviously QEMU) on systems that don't otherwise provide one (maybe when 
target != host)?  I'd bet that there's a lot of subtle oddness when 
trying to parse other systems' /proc/cpuinfo all over the software 
stack, and defaulting to something obvious could be easier for folks to 
debug.

That doesn't need to block this one, though.

> Signed-off-by: Afonso Bordado <afonsobordado@gmail.com>
> ---
>  linux-user/syscall.c              | 32 +++++++++++++++++++++++++++++--
>  tests/tcg/riscv64/Makefile.target |  1 +
>  tests/tcg/riscv64/cpuinfo.c       | 30 +++++++++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 2 deletions(-)
>  create mode 100644 tests/tcg/riscv64/cpuinfo.c
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a6c426d73c..eda2bc5df0 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8183,7 +8183,8 @@ void target_exception_dump(CPUArchState *env, const char *fmt, int code)
>  }
>  
>  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
> -    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
> +    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA) || \
> +    defined(TARGET_RISCV)
>  static int is_proc(const char *filename, const char *entry)
>  {
>      return strcmp(filename, entry) == 0;
> @@ -8261,6 +8262,33 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>  }
>  #endif
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
>  #if defined(TARGET_M68K)
>  static int open_hardware(CPUArchState *cpu_env, int fd)
>  {
> @@ -8285,7 +8313,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
>  #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
>          { "/proc/net/route", open_net_route, is_proc },
>  #endif
> -#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
> +#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISCV)
>          { "/proc/cpuinfo", open_cpuinfo, is_proc },
>  #endif
>  #if defined(TARGET_M68K)
> diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefile.target
> index cc3ed65ffd..df93a2ce1f 100644
> --- a/tests/tcg/riscv64/Makefile.target
> +++ b/tests/tcg/riscv64/Makefile.target
> @@ -4,6 +4,7 @@
>  VPATH += $(SRC_PATH)/tests/tcg/riscv64
>  TESTS += test-div
>  TESTS += noexec
> +TESTS += cpuinfo
>  
>  # Disable compressed instructions for test-noc
>  TESTS += test-noc
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
> -- 
> 2.34.7

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I know this might sound weird as I'm aiming to still take those ACPI 
patches, but I'm going to call it too late for 8.0 for this one for me.  
I'm fine if the linux-user folks want to pick this up, though, as IIRC 
these usually go through that tree anyway so that's fine with me.

I'm also not opposed to calling this a bug fix, but that's kind of 
pushing it...

Thanks!

