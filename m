Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbsvs-0005gZ-Bn
	for mharc-qemu-riscv@gnu.org; Mon, 13 Mar 2023 20:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pbsvo-0005g6-L9; Mon, 13 Mar 2023 20:54:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pbsvm-0005br-Bz; Mon, 13 Mar 2023 20:54:23 -0400
Received: by mail-ed1-x533.google.com with SMTP id ek18so24648601edb.6;
 Mon, 13 Mar 2023 17:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678755259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+LcAzyJ//oJzNUrMnCHkxHjlBp1ZNRSAnsX+NVQQgmU=;
 b=QS+xGwsvtClopAdtblJrcbo5C8rQyDPX2LmPPwKZzGvCzq5nLpqPrN7QPJvKIFnr/j
 x+nWf/w9DuxH7SGqlbPFQhptlRP54D2SVu5pIH9DHeZ9q5GCxq5i9vJ4TEV39mwV0B0Y
 lsTbBLslpYVxjogxtF/dyAcy6El+019js/nRZzfFP0k/pMDSrPVxbKGX/GgyrWVYrjVz
 sS0l8Q21raNUQHzgLXxcx9Exw3EAvtXUbrlt1NtcTa5ZLyzjOXVQ8zxj/MmPlAHxhbvD
 0x397MCxB4ZraTCNTfKMea4uWgrRTEFwk3hWw4SWAdttgDO+wM9dO7DuQsucWO+Bx0sG
 5Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678755259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+LcAzyJ//oJzNUrMnCHkxHjlBp1ZNRSAnsX+NVQQgmU=;
 b=hNjiPnZLej6M4G5sRXbEanueR43ikRzm8gPnLTCQJvIlGsxBW07bmetHwU1dsbnfds
 YnASPwGownDqJCQ5VNm3YiI9Jj4EyJTF/Gic+2SspVWg32MNsv9GNta6oMih9MaqBC32
 pOltSvFS9Q4YdA9V4kWQhxtWvnZh+ykBmpdoQjIhILoxROGnKR1A7auBPkqa6tA8dYK8
 8odvu8DYngLkMaNNZhoK67QwLDyANrcJ/fj61YPyHXYMAO/vYfxYqfMVESj2dsBsCppp
 ARMZRVLKZ917O0XlYYPR/Qawgj3NreidXFUb5N2CwMJtIWCS3eDW8HG6WNeCoRFQ+bKD
 tF+A==
X-Gm-Message-State: AO0yUKVTlabP3qvhkYtzc8D8FxjpnWxteaEHfbnkLKShelOMm+irqzf3
 Vp2yZ4ykAfp35vx54apNPy3r9O868ECgslHLSZw=
X-Google-Smtp-Source: AK7set+j9IdWq/y9T7tmLAJTjTYWDsfLFPGzboaYmiyWeTdCTkaPe0o4bZJB7lsrPr8U/exUwW428jDqzmA/shvmnY0=
X-Received: by 2002:a17:907:d13:b0:926:5020:1421 with SMTP id
 gn19-20020a1709070d1300b0092650201421mr258362ejc.9.1678755259284; Mon, 13 Mar
 2023 17:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <167873059442.9885.15152085316575248452-0@git.sr.ht>
In-Reply-To: <167873059442.9885.15152085316575248452-0@git.sr.ht>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 14 Mar 2023 08:54:07 +0800
Message-ID: <CAEUhbmUeHCznZros16vgEshMQfmEp2qKGHvyos8OLPgyaC7nNw@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 14 Mar 2023 00:54:26 -0000

On Tue, Mar 14, 2023 at 4:29=E2=80=AFAM ~abordado <abordado@git.sr.ht> wrot=
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

The changelog should go below ---

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

Regards,
Bin

