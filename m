Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmpd4-0000FB-Rz
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jan 2019 19:45:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gmpd1-00005h-Vf
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 19:45:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gmpUV-0000Cj-E8
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 19:37:04 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38931)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gmpUV-0000Bg-4V
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 19:37:03 -0500
Received: by mail-pf1-x443.google.com with SMTP id r136so3864319pfc.6
	for <qemu-riscv@nongnu.org>; Thu, 24 Jan 2019 16:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=Ov3WHkrv2J8/Xm2Q/Oh5Zql+BNLqvaISw9FuueU3lGE=;
	b=KulFifw/6XJrypAL1PqNwiifACt4wPP1JvdbDwlX8H8XuTOm2LJ8YViCJoFcuz0UQp
	jDQOrRgBKEiM/PWM/DxfVaMFRFrtuFkLlnWgdab3vf4xc1E1NT8dW1MlaQ02UQjmcCdV
	45KLpava0ToyoX6YF/C5M/WZBFqKG1sx2JVxiqoZCLSzJa7feZm1VsCu2qj5C03joSem
	V/0RsTCgVtWQKg7hmNS1TMIVnAFXlIfHawcrAX4hYkHZg1DQ8xHthXKdfahYZbpbOcQG
	2ZUd1rOeZN5O3Z3+rUzmKHWxOz1nKT4fMZpXi1KCGBSldJseRPwoFxj7ddzFYskDtP7T
	SoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=Ov3WHkrv2J8/Xm2Q/Oh5Zql+BNLqvaISw9FuueU3lGE=;
	b=U4/vb1y3Ius4YyaM5T4duBTtEjbFOfLUpOzrx2BQ8UteGgak5nq+LAnUac84fsYgUd
	OUKtTVyHpJ181N1fUENWc7xeQbIJbxB7GKjtKquCL7ms6aWycZvlHGzAjcxPrio2/7x1
	e8LCArV5j9VwbmWVUuhqBfo0LSRIof0UmdkN76AyFMzfrD2Mi12MOPUc24jkppj1Jcfx
	mDH7Au8G0J1rLlXDKBEuRUvHXG87SDf+TJ5Y89ftySVol3yYp2rFSi4vSoxVcULrpV5n
	KfZw6k7dVbsInJqxPrFm5WIAbpjvPIsG3aTnR2qAYDMMb5pyAQ7hEA2BbrPsM0ZoDCQI
	unVQ==
X-Gm-Message-State: AJcUuke59F8dM5LDsTzlkFsXgHaNTIhlT/MaTCqMZrSNmTBUds9aVcmO
	Uq2GYvhIOqoxTN6d3GXzO7w7Xq7Uy/8=
X-Google-Smtp-Source: ALg8bN61P1I9iQETtnh+Ln6Jf2JU8px0HxXaNowbDQVIlgPQyN7Tn02WN2IfEiTB3Lz5RN6/JIla5Q==
X-Received: by 2002:a63:2905:: with SMTP id p5mr8065096pgp.178.1548376622075; 
	Thu, 24 Jan 2019 16:37:02 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	n21sm32517331pfg.84.2019.01.24.16.37.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jan 2019 16:37:01 -0800 (PST)
Date: Thu, 24 Jan 2019 16:37:01 -0800 (PST)
X-Google-Original-Date: Thu, 24 Jan 2019 16:35:18 PST (-0800)
In-Reply-To: <f7184f107ba99dab6b85da6916fc09663ffd3e21.1547510220.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair23@gmail.com,
	Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-3c01575f-3b0a-4ee3-be42-260e5bb39956@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 8/8] RISC-V: Add misa
 runtime write support
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2019 00:45:53 -0000

On Mon, 14 Jan 2019 15:59:00 PST (-0800), Alistair Francis wrote:
> From: Michael Clark <mjc@sifive.com>
>
> This patch adds support for writing misa. misa is validated based
> on rules in the ISA specification. 'E' is mutually exclusive with
> all other extensions. 'D' depends on 'F' so 'D' bit is dropped
> if 'F' is not present. A conservative approach to consistency is
> taken by flushing the translation cache on misa writes. misa_mask
> is added to the CPU struct to store the original set of extensions.
>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Cc: Alistair Francis <Alistair.Francis@wdc.com>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c      |  2 +-
>  target/riscv/cpu.h      |  4 ++-
>  target/riscv/cpu_bits.h | 11 +++++++++
>  target/riscv/csr.c      | 54 ++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 68 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 28d7e5302f..cc3ddc0ae4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -88,7 +88,7 @@ typedef struct RISCVCPUInfo {
>  
>  static void set_misa(CPURISCVState *env, target_ulong misa)
>  {
> -    env->misa = misa;
> +    env->misa_mask = env->misa = misa;
>  }
>  
>  static void set_versions(CPURISCVState *env, int user_ver, int priv_ver)
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a97435bd7b..5c2aebf132 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -86,7 +86,8 @@
>     so a cpu features bitfield is required, likewise for optional PMP support */
>  enum {
>      RISCV_FEATURE_MMU,
> -    RISCV_FEATURE_PMP
> +    RISCV_FEATURE_PMP,
> +    RISCV_FEATURE_MISA
>  };
>  
>  #define USER_VERSION_2_02_0 0x00020200
> @@ -118,6 +119,7 @@ struct CPURISCVState {
>      target_ulong user_ver;
>      target_ulong priv_ver;
>      target_ulong misa;
> +    target_ulong misa_mask;
>  
>      uint32_t features;
>  
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 5439f4719e..7afcb2468d 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -311,10 +311,21 @@
>  #define MSTATUS32_SD        0x80000000
>  #define MSTATUS64_SD        0x8000000000000000ULL
>  
> +#define MISA32_MXL          0xC0000000
> +#define MISA64_MXL          0xC000000000000000ULL
> +
> +#define MXL_RV32            1
> +#define MXL_RV64            2
> +#define MXL_RV128           3
> +
>  #if defined(TARGET_RISCV32)
>  #define MSTATUS_SD MSTATUS32_SD
> +#define MISA_MXL MISA32_MXL
> +#define MXL_VAL MXL_RV32
>  #elif defined(TARGET_RISCV64)
>  #define MSTATUS_SD MSTATUS64_SD
> +#define MISA_MXL MISA64_MXL
> +#define MXL_VAL MXL_RV64
>  #endif
>  
>  /* sstatus CSR bits */
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e2bd374f09..e72fcf1265 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -332,6 +332,58 @@ static int read_misa(CPURISCVState *env, int csrno, target_ulong *val)
>      return 0;
>  }
>  
> +static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    if (!riscv_feature(env, RISCV_FEATURE_MISA)) {
> +        /* drop write to misa */
> +        return 0;
> +    }
> +
> +    /* 'I' or 'E' must be present */
> +    if (!(val & (RVI | RVE))) {
> +        /* It is not, drop write to misa */
> +        return 0;
> +    }
> +
> +    /* 'E' excludes all other extensions */
> +    if (val & RVE) {
> +        /* when we support 'E' we can do "val = RVE;" however
> +         * for now we just drop writes if 'E' is present.
> +         */
> +        return 0;
> +    }
> +
> +    /* Mask extensions that are not supported by this hart */
> +    val &= env->misa_mask;
> +
> +    /* Mask extensions that are not supported by QEMU */
> +    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> +
> +    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
> +    if ((val & RVD) && !(val & RVF)) {
> +        val &= ~RVD;
> +    }
> +
> +    /* Suppress 'C' if next instruction is not aligned
> +     * TODO: this should check next_pc
> +     */
> +    if ((val & RVC) && (GETPC() & ~3) != 0) {
> +        val &= ~RVC;
> +    }
> +
> +    /* misa.MXL writes are not supported by QEMU */
> +    val = (env->misa & MISA_MXL) | (val & ~MISA_MXL);
> +
> +    /* flush translation cache */
> +    if (val != env->misa) {
> +        tb_flush(CPU(riscv_env_get_cpu(env)));
> +    }
> +
> +    env->misa = val;
> +
> +    return 0;
> +}
> +
>  static int read_medeleg(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>      *val = env->medeleg;
> @@ -810,7 +862,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>  
>      /* Machine Trap Setup */
>      [CSR_MSTATUS] =             { any,  read_mstatus,     write_mstatus     },
> -    [CSR_MISA] =                { any,  read_misa                           },
> +    [CSR_MISA] =                { any,  read_misa,        write_misa        },
>      [CSR_MIDELEG] =             { any,  read_mideleg,     write_mideleg     },
>      [CSR_MEDELEG] =             { any,  read_medeleg,     write_medeleg     },
>      [CSR_MIE] =                 { any,  read_mie,         write_mie         },
> -- 
> 2.19.1

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

