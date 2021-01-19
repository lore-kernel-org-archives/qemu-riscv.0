Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1uxn-00075b-Q0
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 12:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uxh-00072p-Hc; Tue, 19 Jan 2021 12:38:37 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:33053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1uxg-0000qd-1A; Tue, 19 Jan 2021 12:38:37 -0500
Received: by mail-io1-xd2c.google.com with SMTP id w18so41267228iot.0;
 Tue, 19 Jan 2021 09:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lu8LQ8daA/h8PmYD2TnZ31WFd7LjbAagekmzwQTsWzk=;
 b=ds7z9JcabvcFrxmXH8yXqv8U1XRzpSVnaqz9mGB+d7QAtrij4cNSN+80/zi5MCyN5x
 Za4fA/++K7SP0lTTCNY8oub44GVuwrhcXtgnDrpMHJi0Dheo7FfMwCsTYpFqmuAIGA3S
 mXDa3/Uvqc0i3JNO2SJwCN7S41btwlgaENQkp3oHi5A4eCdmk4YI+oL8GJ+5znawE3OX
 hc1p230ArViZ+x1bkrPQJ0eVx2yia8PD/4uVZKHyb4Dav3bCydclpeGJKvR7USehCnH0
 YBippKk3ILMJlD+OZ99Q616jaTzG8JlXZTLHe++06oVxoNOG/RBaYsVeJLhXbzbQ6Djt
 8YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lu8LQ8daA/h8PmYD2TnZ31WFd7LjbAagekmzwQTsWzk=;
 b=etzWqMBVVyVwj6QgbaStprtJOGQqbxAtKa0r0mRK24NQM87awVUUYEm4yJXtzYacbg
 lPokTvB9fHTOh8s9H8Muc+PYMZ1sYGbbU1GHL5rSn90B0j8wi3EhxXfzuXEclm4Itgaf
 8RlZQqiOZz0unRZHEAokDfIlaMYpUbMWg98XYu/MKTE4x+PyTwdh/aOqJzC4xKWEiOsq
 V7hwnQ796koQNZlPPdZ6QR6eguKnERL14zOMXEWXQWmXiF5oFigJQ2vy7oypb8cUKnce
 p4Vpcu8NRjFX09eh3tbklDITRSm2lFdeAIXq8bwgjX9PmZIIosOgJhSniT45Ru4JNmCt
 xfkw==
X-Gm-Message-State: AOAM533Vv/piMGy5BampaznoX9vGstXhB3Kima3tYeNftww3q23Tphgp
 l2SovDOQ6WSbaeEiKdv6Pmq+ECPBvwBtEsLqWJA=
X-Google-Smtp-Source: ABdhPJyaz60cAssaiI1NKPUcLJgRF+OMPxeYSP0EHoXz1QiAe+TxqHeaSnQLjzEoNJvlemzxpkmWh+b6JLUrrxDXK0o=
X-Received: by 2002:a92:4b06:: with SMTP id m6mr2299800ilg.177.1611077913463; 
 Tue, 19 Jan 2021 09:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-9-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-9-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 09:38:07 -0800
Message-ID: <CAKmqyKNhx+zkstaSHRX6z5MJ7=zW-D_zwJvV6=JSC1Ke9KE3vg@mail.gmail.com>
Subject: Re: [PATCH v6 08/72] target/riscv: rvv-1.0: add vcsr register
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2021 17:38:39 -0000

On Tue, Jan 12, 2021 at 1:55 AM <frank.chang@sifive.com> wrote:
>
> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h |  7 +++++++
>  target/riscv/csr.c      | 21 +++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 8edf81692e6..2538580a62a 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -60,9 +60,16 @@
>  #define CSR_VSTART          0x008
>  #define CSR_VXSAT           0x009
>  #define CSR_VXRM            0x00a
> +#define CSR_VCSR            0x00f
>  #define CSR_VL              0xc20
>  #define CSR_VTYPE           0xc21
>
> +/* VCSR fields */
> +#define VCSR_VXSAT_SHIFT    0
> +#define VCSR_VXSAT          (0x1 << VCSR_VXSAT_SHIFT)
> +#define VCSR_VXRM_SHIFT     1
> +#define VCSR_VXRM           (0x3 << VCSR_VXRM_SHIFT)
> +
>  /* User Timers and Counters */
>  #define CSR_CYCLE           0xc00
>  #define CSR_TIME            0xc01
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6eda5bacb7c..4ac1ed8cfa8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -335,6 +335,26 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
>      return 0;
>  }
>
> +static int read_vcsr(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = (env->vxrm << VCSR_VXRM_SHIFT) | (env->vxsat << VCSR_VXSAT_SHIFT);
> +    return 0;
> +}
> +
> +static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +#if !defined(CONFIG_USER_ONLY)
> +    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
> +        return -1;
> +    }
> +    env->mstatus |= MSTATUS_VS;
> +#endif
> +
> +    env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
> +    env->vxsat = (val & VCSR_VXSAT) >> VCSR_VXSAT_SHIFT;
> +    return 0;
> +}
> +
>  /* User Timers and Counters */
>  static int read_instret(CPURISCVState *env, int csrno, target_ulong *val)
>  {
> @@ -1397,6 +1417,7 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_VSTART] =              { vs,   read_vstart,      write_vstart      },
>      [CSR_VXSAT] =               { vs,   read_vxsat,       write_vxsat       },
>      [CSR_VXRM] =                { vs,   read_vxrm,        write_vxrm        },
> +    [CSR_VCSR] =                { vs,   read_vcsr,        write_vcsr        },
>      [CSR_VL] =                  { vs,   read_vl                             },
>      [CSR_VTYPE] =               { vs,   read_vtype                          },
>      /* User Timers and Counters */
> --
> 2.17.1
>
>

