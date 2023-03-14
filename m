Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbvwC-0006dM-1q
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 00:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbvw7-0006bl-C9; Tue, 14 Mar 2023 00:06:55 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbvw5-0001Bf-Ee; Tue, 14 Mar 2023 00:06:55 -0400
Received: by mail-vs1-xe30.google.com with SMTP id e19so6626589vsu.4;
 Mon, 13 Mar 2023 21:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678766811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBv3Ln9Z6VXD2aMGmb/14bEKAd8SZHLgdBj6mnUUfW8=;
 b=eWW3WrUkW3AEt/A6UJk6cqXqhCRGw01mgvRYOSZ29FzSGR6RAh0qkDbvCcD6IMJA20
 72tg0GTI8kshTuAbLb8vYUQlS027bHcMCVeQ51iWAsAPsdTGpuAVw0wT9EIxckgpqBGK
 Qyh4G8Qd8ZjiSuv6dtrtP5j6N24yjkWf6WkIFdzTRnp8Rtg/HRTyGhm6NN+PYkDmtt4e
 X2wk4FMiVd40QmARf+PqCkb7krGNZH/YRiSM4ZVzHIu0iohIqPyifbAIpOiQqbCgY9Ef
 BYEL/7Th6gWUBHYne81ji9jSG7ERcwCIXILqT8x3yI8BbHBfkmggg1OW+lrHMKS1ix2C
 QUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678766811;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bBv3Ln9Z6VXD2aMGmb/14bEKAd8SZHLgdBj6mnUUfW8=;
 b=xD8Os2b1I2X7yMVqN7Yr5blMZPmTS9SNUmC92sCA6LG54rWY60UF56g9+mhlxomk6J
 XdTHHAJUDHjDcxzulqNLnQ4jB5v+5r5+cErocqx4slCBQHEz6L3qe7ZZU8k4tEqRAO+r
 XeRwYlfnGmBtEv6Cve5wjTF6Gb0hfMICLAptcYt9uqWfv70SFMEuWoiFHB85jIXbV1Q3
 AsPn2mI7pbso0gFe8LVMGm/MpAYo1LT7r4UmI6WCWG9MQz1ysvzOKNSHRFwg92nY8hM5
 d8QdkyR6bvlRt5lQMWuwhVjNXD4+4jeVb25jCVv+U4MFsagHUK5iTkHXwNMsVRCjOoB+
 +cmQ==
X-Gm-Message-State: AO0yUKU9uH8elV6wl5cw0KEKPirrxOMVd14eaVDYUYRS4dQf10PObMZH
 xB6N1+NJbZWAQjf57VaV25KO6wLCPMa2gVAji9OpWJeGel4=
X-Google-Smtp-Source: AK7set9gvVwoHq9yVfJetm6TC/5mJjyeb1B6muxsi/UJwRodgto5rVZbmoP4zwB0CrXizsqDgz6Pdc99vdHhgNuZ4A8=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr23150223vsk.3.1678766811575; Mon, 13
 Mar 2023 21:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <167873059442.9885.15152085316575248452-0@git.sr.ht>
In-Reply-To: <167873059442.9885.15152085316575248452-0@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Mar 2023 14:06:25 +1000
Message-ID: <CAKmqyKNe6KHHgsVywjMBJexfDNrX-wY1DXpoDJ4gK64s7Zoz9A@mail.gmail.com>
Subject: Re: [PATCH qemu v2] linux-user: Emulate /proc/cpuinfo output for riscv
To: "~abordado" <afonsobordado@gmail.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 04:06:55 -0000

On Tue, Mar 14, 2023 at 6:28=E2=80=AFAM ~abordado <abordado@git.sr.ht> wrot=
e:
>
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

With the changelog below these dashes:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair


>  linux-user/syscall.c              | 34 +++++++++++++++++++++++++++++--
>  tests/tcg/riscv64/Makefile.target |  1 +
>  tests/tcg/riscv64/cpuinfo.c       | 30 +++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+), 2 deletions(-)
>  create mode 100644 tests/tcg/riscv64/cpuinfo.c
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 24cea6fb6a..0388f8b0b0 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8230,7 +8230,8 @@ void target_exception_dump(CPUArchState *env, const=
 char *fmt, int code)
>  }
>
>  #if HOST_BIG_ENDIAN !=3D TARGET_BIG_ENDIAN || \
> -    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA=
)
> +    defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA=
) || \
> +    defined(TARGET_RISCV)
>  static int is_proc(const char *filename, const char *entry)
>  {
>      return strcmp(filename, entry) =3D=3D 0;
> @@ -8308,6 +8309,35 @@ static int open_cpuinfo(CPUArchState *cpu_env, int=
 fd)
>  }
>  #endif
>
> +#if defined(TARGET_RISCV)
> +static int open_cpuinfo(CPUArchState *cpu_env, int fd)
> +{
> +    int i;
> +    int num_cpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> +    RISCVCPU *cpu =3D env_archcpu(cpu_env);
> +    const RISCVCPUConfig *cfg =3D riscv_cpu_cfg((CPURISCVState *) cpu_en=
v);
> +    char *isa_string =3D riscv_isa_string(cpu);
> +    const char *mmu;
> +
> +    if (cfg->mmu) {
> +        mmu =3D (cpu_env->xl =3D=3D MXL_RV32) ? "sv32"  : "sv48";
> +    } else {
> +        mmu =3D "none";
> +    }
> +
> +    for (i =3D 0; i < num_cpus; i++) {
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
>  #if defined(TARGET_M68K)
>  static int open_hardware(CPUArchState *cpu_env, int fd)
>  {
> @@ -8332,7 +8362,7 @@ static int do_openat(CPUArchState *cpu_env, int dir=
fd, const char *pathname, int
>  #if HOST_BIG_ENDIAN !=3D TARGET_BIG_ENDIAN
>          { "/proc/net/route", open_net_route, is_proc },
>  #endif
> -#if defined(TARGET_SPARC) || defined(TARGET_HPPA)
> +#if defined(TARGET_SPARC) || defined(TARGET_HPPA) || defined(TARGET_RISC=
V)
>          { "/proc/cpuinfo", open_cpuinfo, is_proc },
>  #endif
>  #if defined(TARGET_M68K)
> diff --git a/tests/tcg/riscv64/Makefile.target b/tests/tcg/riscv64/Makefi=
le.target
> index cc3ed65ffd..df93a2ce1f 100644
> --- a/tests/tcg/riscv64/Makefile.target
> +++ b/tests/tcg/riscv64/Makefile.target
> @@ -4,6 +4,7 @@
>  VPATH +=3D $(SRC_PATH)/tests/tcg/riscv64
>  TESTS +=3D test-div
>  TESTS +=3D noexec
> +TESTS +=3D cpuinfo
>
>  # Disable compressed instructions for test-noc
>  TESTS +=3D test-noc
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
> +    FILE *fp =3D fopen("/proc/cpuinfo", "r");
> +    assert(fp !=3D NULL);
> +
> +    while (fgets(buffer, BUFFER_SIZE, fp) !=3D NULL) {
> +        if (strstr(buffer, "processor") !=3D NULL) {
> +            assert(strstr(buffer, "processor\t: ") =3D=3D buffer);
> +        } else if (strstr(buffer, "hart") !=3D NULL) {
> +            assert(strstr(buffer, "hart\t\t: ") =3D=3D buffer);
> +        } else if (strstr(buffer, "isa") !=3D NULL) {
> +            assert(strcmp(buffer, "isa\t\t: rv64imafdc_zicsr_zifencei\n"=
) =3D=3D 0);
> +        } else if (strstr(buffer, "mmu") !=3D NULL) {
> +            assert(strcmp(buffer, "mmu\t\t: sv48\n") =3D=3D 0);
> +        } else if (strstr(buffer, "uarch") !=3D NULL) {
> +            assert(strcmp(buffer, "uarch\t\t: qemu\n") =3D=3D 0);
> +        }
> +    }
> +
> +    fclose(fp);
> +    return 0;
> +}
> --
> 2.34.7
>

