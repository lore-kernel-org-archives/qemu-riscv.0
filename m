Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmouG-0004dF-PQ
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 22:13:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmouE-0004cU-Tv; Mon, 15 Nov 2021 22:13:10 -0500
Received: from [2607:f8b0:4864:20::d29] (port=41559
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmouD-0001hC-C8; Mon, 15 Nov 2021 22:13:10 -0500
Received: by mail-io1-xd29.google.com with SMTP id y16so24127167ioc.8;
 Mon, 15 Nov 2021 19:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FjM7Fdqy/Og8DD/Ztwl8hX/alv9qvougFhs01SEpgL8=;
 b=ZR8omFL01uHjRGze/l27pX/dF8PoQznppyZQUJnxcZ021HI2uGFKQZVhrmBQmH64pj
 EdLkx98ETZbnp84ng68PRJTc07NaBcbVd3smz49b09mUUbvGbjaq+NloqJjZ8/3JVatM
 ToDYWcTDlMbxint3f1fbkepBOZ7aN2kJY2cZkVTtcd+U6P69inyD+dz3LrbvFuPeFyZ0
 aDkgl1l8MggvDlqRkC57UHH7GnppTg+anbkWmwTtN5Ez305j5Y8kzFQ1deSx/w9YAlGD
 rNotvDnx7uT7X/IMZk5NXcC+Q9iNPVsSBsBAfZv2KkFIdrTmK8OQJQ6iqScvGHB5WPeH
 3mVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FjM7Fdqy/Og8DD/Ztwl8hX/alv9qvougFhs01SEpgL8=;
 b=c2EE3AwOE/wxuvIjGGrOhuy6QcA4DVKSA6sbZVcwKuy3sngNSaKTeq57fQpj02pFnW
 Vvy+pBcO3nt1LTDaFN3q3bGlg4AIejLwN1LgvOktQxmJGJi2ejXQMVuJyG7tNBRneInS
 rGwKd1m0muTy5+1+rQ8GBsUnDPHFXgrslv7i6Xppv55h+qTykNmHRGIBEN3uThRAE/Hr
 NbZh3BZry06bX5V7n4hcYdhSknjfpdDVOlPMZlQzZvGnOS0oNsW5LEy3Ld92kFklxSHW
 v42Drtqs4yn5LgRmDP8iaPUwbuXfavX4MDZoKmLrShqDa0sd/KjRt2Ua34+xWM+WZd7a
 gi2g==
X-Gm-Message-State: AOAM533ld4cO4RyBzwSTUY2rwAKrgpkcEnbb01cAzY3dAqIf6E8kMmog
 lOZxcJUhsEvbnYbwA+29HychtDgj7boztz300WI=
X-Google-Smtp-Source: ABdhPJxwb3beVxpAG0pC5fvjsGYUzR0TK3r9O6lUWKZ8ZLS0XbmFc/QRz7EOjjGcHbRpeEQKBQbMfGav1cVZlYLTHvM=
X-Received: by 2002:a6b:f212:: with SMTP id q18mr2573032ioh.16.1637032387856; 
 Mon, 15 Nov 2021 19:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-6-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-6-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Nov 2021 13:12:41 +1000
Message-ID: <CAKmqyKPD4pBHK6G+Y-YRN-msPV1g_rj_-qPHwMLpJcQc_42JSw@mail.gmail.com>
Subject: Re: [PATCH v4 05/20] target/riscv: Use gdb xml according to max mxlen
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Tue, 16 Nov 2021 03:13:11 -0000

On Fri, Nov 12, 2021 at 1:54 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/gdbstub.c | 71 +++++++++++++++++++++++++++++++-----------
>  1 file changed, 52 insertions(+), 19 deletions(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 23429179e2..8d0f9139d7 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -24,11 +24,23 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
> +    target_ulong tmp;
>
>      if (n < 32) {
> -        return gdb_get_regl(mem_buf, env->gpr[n]);
> +        tmp = env->gpr[n];
>      } else if (n == 32) {
> -        return gdb_get_regl(mem_buf, env->pc);
> +        tmp = env->pc;
> +    } else {
> +        return 0;
> +    }
> +
> +    switch (env->misa_mxl_max) {
> +    case MXL_RV32:
> +        return gdb_get_reg32(mem_buf, tmp);
> +    case MXL_RV64:
> +        return gdb_get_reg64(mem_buf, tmp);
> +    default:
> +        g_assert_not_reached();
>      }
>      return 0;
>  }
> @@ -37,18 +49,32 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cs);
>      CPURISCVState *env = &cpu->env;
> -
> -    if (n == 0) {
> -        /* discard writes to x0 */
> -        return sizeof(target_ulong);
> -    } else if (n < 32) {
> -        env->gpr[n] = ldtul_p(mem_buf);
> -        return sizeof(target_ulong);
> +    int length = 0;
> +    target_ulong tmp;
> +
> +    switch (env->misa_mxl_max) {
> +    case MXL_RV32:
> +        tmp = (int32_t)ldl_p(mem_buf);
> +        length = 4;
> +        break;
> +    case MXL_RV64:
> +        if (cpu_get_xl(env) < MXL_RV64) {
> +            tmp = (int32_t)ldq_p(mem_buf);
> +        } else {
> +            tmp = ldq_p(mem_buf);
> +        }
> +        length = 8;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    if (n > 0 && n < 32) {
> +        env->gpr[n] = tmp;
>      } else if (n == 32) {
> -        env->pc = ldtul_p(mem_buf);
> -        return sizeof(target_ulong);
> +        env->pc = tmp;
>      }
> -    return 0;
> +
> +    return length;
>  }
>
>  static int riscv_gdb_get_fpu(CPURISCVState *env, GByteArray *buf, int n)
> @@ -198,13 +224,20 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
>          gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
>                                   36, "riscv-32bit-fpu.xml", 0);
>      }
> -#if defined(TARGET_RISCV32)
> -    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
> -                             1, "riscv-32bit-virtual.xml", 0);
> -#elif defined(TARGET_RISCV64)
> -    gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
> -                             1, "riscv-64bit-virtual.xml", 0);
> -#endif
> +    switch (env->misa_mxl_max) {
> +    case MXL_RV32:
> +        gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
> +                                 riscv_gdb_set_virtual,
> +                                 1, "riscv-32bit-virtual.xml", 0);
> +        break;
> +    case MXL_RV64:
> +        gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
> +                                 riscv_gdb_set_virtual,
> +                                 1, "riscv-64bit-virtual.xml", 0);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
>
>      gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
>                               riscv_gen_dynamic_csr_xml(cs, cs->gdb_num_regs),
> --
> 2.25.1
>
>

