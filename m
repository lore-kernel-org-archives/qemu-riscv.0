Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmm2C-0006Or-LX
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 19:09:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmm2B-0006OY-5l; Mon, 15 Nov 2021 19:09:11 -0500
Received: from [2607:f8b0:4864:20::130] (port=45756
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmm29-0005Iy-Qa; Mon, 15 Nov 2021 19:09:10 -0500
Received: by mail-il1-x130.google.com with SMTP id i12so18460429ila.12;
 Mon, 15 Nov 2021 16:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4/6xaW+V/crk6zfVv5GUamaT/4SwSJuDANDrwMirYg4=;
 b=LUVjIL1xri7LKoBeiCtmrilmMKkeJu/8aQxZBNh5VbmXcbIBwv6q9QJnRGOJomyn8p
 ykI87Wb4G1/6Iwvp50MnRWhi0n8ZDOKxDpX6s5gQgUhopYI2nPLSJ/He5uA/mlFTdAHj
 pRizp3f48TadbMuErjyrVWYuYqJwxb+JKKYadc3NwEGT/BQUfppoVHnADlQQVbFWz5fe
 QNuXHHiIYASt9DtFyryXIDbEtaCgjE3CTs2l0j5zd+VenPOgvX542d+kIJRbVhxcx9RG
 W5MBfryTK2dbElaSakP/YLFEZK19/Q7ZJG3GY2fRCw/5n9LWTavvU/3PCG0MyN6QyfK1
 FqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4/6xaW+V/crk6zfVv5GUamaT/4SwSJuDANDrwMirYg4=;
 b=wDnDX//cLTmuajBKEZmxJfq0G0F18Z/QHyomYNkMRpZK6BXsBPCC406o6ezgNwxV/y
 XuuF1wK/IOU7s9vfbjWhYvf6SEPiFNVvNI0XFPwpEbXa/J4JS48ukroWhuLWQnDU0Wef
 IVTErSTY8gzHclMriczbZMYY6KWf9fu+IkqoO70wFabuGTFYgyCu3ttD4hZO7oeY1nD3
 vqsDlrQW68DuZtKXj4hOynBtlc3WuNLV3SojF5qaDkgiM++u0OIJlTEKbCs9D1UoJotK
 W0lDI6T49wAH++lUCa9GDrJDSHpl87DuADLWShdbCFRHGR0ihC/4c0BCABNTS8PX/Mx7
 323w==
X-Gm-Message-State: AOAM530M/NdtUsD/Msc2CYr+lCszFIk2U28B2WZFqAgQaizfLSI3K2ri
 +HZ/ymxuxix2vtMHPJBv4GcKGxbONradG5u2Nw0=
X-Google-Smtp-Source: ABdhPJwTdMv+0FNtd/DVr1ErXaINHGoXPqhW0lAgbGzjKt86KrfMn+PsThd5xi38ujM9/axCTLc1tfLzFQnRq4NLZB8=
X-Received: by 2002:a92:cda2:: with SMTP id g2mr1857320ild.46.1637021348433;
 Mon, 15 Nov 2021 16:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-5-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-5-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Nov 2021 10:08:42 +1000
Message-ID: <CAKmqyKOQ81ZZ9WUHwCBpbPOF2m12b9CqjHt6B+thRis9sJMFuw@mail.gmail.com>
Subject: Re: [PATCH v4 04/20] target/riscv: Extend pc for runtime pc write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 16 Nov 2021 00:09:11 -0000

On Fri, Nov 12, 2021 at 2:01 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> In some cases, we must restore the guest PC to the address of the start of
> the TB, such as when the instruction counter hits zero. So extend pc register
> according to current xlen for these cases.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c        | 22 +++++++++++++++++++---
>  target/riscv/cpu.h        |  2 ++
>  target/riscv/cpu_helper.c |  2 +-
>  3 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f812998123..0d2d175fa2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -319,7 +319,12 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr value)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
> -    env->pc = value;
> +
> +    if (cpu_get_xl(env) == MXL_RV32) {
> +        env->pc = (int32_t)value;
> +    } else {
> +        env->pc = value;
> +    }
>  }
>
>  static void riscv_cpu_synchronize_from_tb(CPUState *cs,
> @@ -327,7 +332,13 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>  {
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
> -    env->pc = tb->pc;
> +    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
> +
> +    if (xl == MXL_RV32) {
> +        env->pc = (int32_t)tb->pc;
> +    } else {
> +        env->pc = tb->pc;
> +    }
>  }
>
>  static bool riscv_cpu_has_work(CPUState *cs)
> @@ -348,7 +359,12 @@ static bool riscv_cpu_has_work(CPUState *cs)
>  void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
>                            target_ulong *data)
>  {
> -    env->pc = data[0];
> +    RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
> +    if (xl == MXL_RV32) {
> +        env->pc = (int32_t)data[0];
> +    } else {
> +        env->pc = data[0];
> +    }
>  }
>
>  static void riscv_cpu_reset(DeviceState *dev)
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0760c0af93..8befff0166 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -420,6 +420,8 @@ static inline RISCVMXL riscv_cpu_mxl(CPURISCVState *env)
>  }
>  #endif
>
> +RISCVMXL cpu_get_xl(CPURISCVState *env);
> +
>  /*
>   * A simplification for VLMAX
>   * = (1 << LMUL) * VLEN / (8 * (1 << SEW))
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 4c048cc266..79aba9c880 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -35,7 +35,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
>  #endif
>  }
>
> -static RISCVMXL cpu_get_xl(CPURISCVState *env)
> +RISCVMXL cpu_get_xl(CPURISCVState *env)
>  {
>  #if defined(TARGET_RISCV32)
>      return MXL_RV32;
> --
> 2.25.1
>
>

