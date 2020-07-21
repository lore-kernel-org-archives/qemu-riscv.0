Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxlVO-0005Ud-Mc
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jul 2020 02:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jxlVN-0005UQ-Bt; Tue, 21 Jul 2020 02:11:57 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:44108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jxlVL-0001JO-Pw; Tue, 21 Jul 2020 02:11:57 -0400
Received: by mail-yb1-xb41.google.com with SMTP id g6so9483468ybo.11;
 Mon, 20 Jul 2020 23:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAY5m+cGG10YtrDW1+dkbTaOEqVVG+Z2hxrnyPiNWEs=;
 b=ATOp38A2PaRNTyz9DfgN5y9zDYH4x37t/MwMe7qK3YhD0QLAfmGnWgVpi7+2s0fO+d
 ivNCRBtmt2FGmsThfV4TPBFsCPT8zgiP6upeA7aT+gfHLRNsYX/FEGqUbDPK0A/8KtE+
 qzMwOOcCpeXZ9CoTQRxvUe0k+6bfaHoUphtTIGCXbOE36Ry9TONW+2UwvC9LxQGA/SZS
 6pUwUG7rFxXyM5syMZPIoe0bxO87Hkxk3r0kZtuKNHQmXaATWGFrKr4isibWuapjo4Au
 b4k0XDba1jF+m6UoIN96HgN6WmatGC4oz8pZKFHIo00MY8xsJYmevUhwiGQqR13Oaibf
 +yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAY5m+cGG10YtrDW1+dkbTaOEqVVG+Z2hxrnyPiNWEs=;
 b=U+nvcakbMrXNaVgzxjFg/cxDZEvjBG5/GBhd5c3ux2rdmYzNLPOUdTL1+ytJpHcQh6
 dZv2wSnP05JMpXOJNATTrpKsfSj/Tw1qoDbwJyI53luW29fMrdsZzttJ5WrsS62+d0b8
 YhuYZ4fLMassklllUdnU7gAle5u4fsdO2Zmt6IyQXDQwak5xrXsGcUV49h0aFSNWhdOZ
 4H1bjncjOq4UO7YSNT+OIBhh3hc5JVEaC3pUlBZbluSi+QugnTsU73xsh7zqoOtuy0w3
 sZnH7F0JkYj+hEq5NRRN0WmSHbMC848cjDiwuL6j97g3OUzxhsK0VRCMUItmJPg3GFuI
 GufQ==
X-Gm-Message-State: AOAM530nkWinLscNg/B5vQZSmUdeDMaAZ2lKAQyEAnc/OYj9nr5cH3NZ
 bnMln1b0rWBJRXKvqjDRw0CxGlUx85opT4CE8sA=
X-Google-Smtp-Source: ABdhPJxaaC2PpEZa22Zh3oePn68roI2+j+ObR0UOcHZDPVkfq5hMviKBFDiWyyLjVAJQaUa4bxz/XlHbmFSstSfdYxM=
X-Received: by 2002:a25:e5c3:: with SMTP id
 c186mr39900416ybh.332.1595311914489; 
 Mon, 20 Jul 2020 23:11:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595311277.git.zong.li@sifive.com>
 <f216144b553720ec33d1be8abd225a252ad79a29.1595311277.git.zong.li@sifive.com>
In-Reply-To: <f216144b553720ec33d1be8abd225a252ad79a29.1595311277.git.zong.li@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 21 Jul 2020 14:11:43 +0800
Message-ID: <CAEUhbmWshO9jdG=wB8dFWuq3LxFxxE=8csKd78UVhdfxC8YYQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv/pmp.c: Fix the index offset on RV64
To: Zong Li <zong.li@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 21 Jul 2020 06:11:57 -0000

Hi Zong,

On Tue, Jul 21, 2020 at 2:03 PM Zong Li <zong.li@sifive.com> wrote:
>
> On RV64, the reg_index is 2 (pmpcfg2 CSR) after the seventh pmp
> entry, it is not 1 (pmpcfg1 CSR) like RV32. In the original
> implementation, the second parameter of pmp_write_cfg is
> "reg_index * sizeof(target_ulong)", and we get the the result
> which is started from 16 if reg_index is 2, but we expect that
> it should be started from 8. Separate the implementation for
> RV32 and RV64 respectively.
>
> Changed in v2:
>  - Move out the shifting operation from loop. Suggested by Bin Meng

The changelog should go after --- below

>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  target/riscv/pmp.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 2a2b9f5363..3de6535fbd 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -309,6 +309,7 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>  {
>      int i;
>      uint8_t cfg_val;
> +    uint32_t pmp_entry_base;
>
>      trace_pmpcfg_csr_write(env->mhartid, reg_index, val);
>
> @@ -318,10 +319,15 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>          return;
>      }
>
> +#if defined(TARGET_RISCV32)
> +    pmp_entry_base = (reg_index * sizeof(target_ulong));
> +#elif defined(TARGET_RISCV64)
> +    pmp_entry_base = (reg_index >> 1) * sizeof(target_ulong);
> +#endif

This is not necessary. You can simply do:

#if defined(TARGET_RISCV64)
    reg_index >>= 1;
#endif

> +
>      for (i = 0; i < sizeof(target_ulong); i++) {
>          cfg_val = (val >> 8 * i)  & 0xff;
> -        pmp_write_cfg(env, (reg_index * sizeof(target_ulong)) + i,
> -            cfg_val);
> +        pmp_write_cfg(env, pmp_entry_base + i, cfg_val);
>      }
>  }
>
> @@ -332,11 +338,18 @@ void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>  target_ulong pmpcfg_csr_read(CPURISCVState *env, uint32_t reg_index)
>  {
>      int i;
> +    uint32_t pmp_entry_base;
>      target_ulong cfg_val = 0;
>      target_ulong val = 0;
>
> +#if defined(TARGET_RISCV32)
> +    pmp_entry_base = (reg_index * sizeof(target_ulong));
> +#elif defined(TARGET_RISCV64)
> +    pmp_entry_base = (reg_index >> 1) * sizeof(target_ulong);
> +#endif
> +
>      for (i = 0; i < sizeof(target_ulong); i++) {
> -        val = pmp_read_cfg(env, (reg_index * sizeof(target_ulong)) + i);
> +        val = pmp_read_cfg(env, pmp_entry_base + i);
>          cfg_val |= (val << (i * 8));
>      }
>      trace_pmpcfg_csr_read(env->mhartid, reg_index, cfg_val);

Regards,
Bin

