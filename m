Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfYuM-0006xC-4X
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 22:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfYuL-0006x0-Ao; Tue, 26 Oct 2021 22:43:17 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:36838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfYuJ-0006fp-8J; Tue, 26 Oct 2021 22:43:17 -0400
Received: by mail-il1-x12d.google.com with SMTP id l13so1420394ilh.3;
 Tue, 26 Oct 2021 19:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YevOtso0DNuLYKbIJNfutHHkjbxNvZl6Thyyvv/B1fk=;
 b=oXt3KtRLRDliUGgm2C8XKiml1ljqkXLO6KwkjYXXYro+WzZSzvQ+oUPjGnDT4qtajw
 YQokMr1rYsvBt7kv1fyCG9zwQ1rNXo+3yTVUhyiaecafkNke8yz0WLhAQJNVmqGav21D
 SdYSsg4RJ3LTC1329WhOeF7B9ERcxDw6Awn9JRwY09ncD3ga4Nbal/G5sSQRzDjP3oVp
 aQ4bka4INGOgYmzesammakTrL3WXknMK/syKwexwyo6ccD0pSYpBHRzcLH1hAR5PDPQ6
 7jgJKvHYy5FVPgikqR0Q5JIkxr/wL/270UWRPVSr7IiE6Kc0S0iau0vuPf4EiAYmeHlf
 rcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YevOtso0DNuLYKbIJNfutHHkjbxNvZl6Thyyvv/B1fk=;
 b=D8TxctjhT3wtaLWeNLcv7JMR1qsQAQ6Z9REZkKhX2tyJ050sNRg/C/boUqPDy1IIQo
 veUiLuwp6czJjsaWcQsto9nRbSR0zFquVrm84sy1F1YgXwV8OmtWE8bMpZXavbNm9Ojq
 9VFDYOk2jDLipLChqoDYo1JzIAYX8gQE3fGKqLBabQ1ycH43NN0nMuiCphk2i4AX7MS8
 JJYMtOqFPe12vqnXTy8kKplySl4yW1N/fam9W9vtjIGGMOQO00iy5Z78lbFiIyB3qpCh
 uyE8G72cfU8u1HGu7/c+fe21nVLlYvmrFZVBP1Jl/rLO23KZTgG4x0Rx5ex1+oax9oR2
 hi3w==
X-Gm-Message-State: AOAM532WZV7wXeBj/Q7wNT8S6SzmYR0jS3diJUWUJnKks1Ijp9hk4uQe
 3HgIBOFWDrF+yXF/MrM7CIwmKHW+WeSbXAP/Eg8=
X-Google-Smtp-Source: ABdhPJyjNdcF5s9eOwFVJkxJtBURuoVkvNfnZ00baJyxdHi3jNwuDu0TmsJ/2oJr47cjuuxa0i5zZwnluNt6ifIAOuo=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr17048746ilo.208.1635302593800; 
 Tue, 26 Oct 2021 19:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211025124319.195290-1-rpathak@ventanamicro.com>
 <20211025124319.195290-3-rpathak@ventanamicro.com>
In-Reply-To: <20211025124319.195290-3-rpathak@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 Oct 2021 12:42:47 +1000
Message-ID: <CAKmqyKMVEZkKdp0vmFo_tc4oFuVhaTRXBiB-uEksYtfjyRibqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/riscv: csr: Implement mconfigptr CSR
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Wed, 27 Oct 2021 02:43:17 -0000

On Mon, Oct 25, 2021 at 10:55 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---
>  target/riscv/cpu_bits.h |  1 +
>  target/riscv/csr.c      | 19 +++++++++++++++----
>  2 files changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index cffcd3a5df..e2f154b7c5 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -140,6 +140,7 @@
>  #define CSR_MARCHID         0xf12
>  #define CSR_MIMPID          0xf13
>  #define CSR_MHARTID         0xf14
> +#define CSR_MCONFIGPTR      0xf15
>
>  /* Machine Trap Setup */
>  #define CSR_MSTATUS         0x300
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 69e4d65fcd..2d7f608d49 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -209,6 +209,16 @@ static RISCVException epmp(CPURISCVState *env, int csrno)
>
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
> +
> +static RISCVException priv1p12(CPURISCVState *env, int csrno)
> +{
> +       if (env->priv_ver >= PRIV_VERSION_1_12_0) {
> +               return RISCV_EXCP_NONE;
> +       }
> +
> +       return RISCV_EXCP_ILLEGAL_INST;
> +}
> +
>  #endif
>
>  /* User Floating-Point CSRs */
> @@ -1569,10 +1579,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MINSTRETH] = { "minstreth", any32, read_instreth },
>
>      /* Machine Information Registers */
> -    [CSR_MVENDORID] = { "mvendorid", any,   read_zero    },
> -    [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
> -    [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
> -    [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> +    [CSR_MVENDORID] = { "mvendorid",   any,            read_zero    },
> +    [CSR_MARCHID]   = { "marchid",     any,            read_zero    },
> +    [CSR_MIMPID]    = { "mimpid",      any,            read_zero    },
> +    [CSR_MHARTID]   = { "mhartid",     any,            read_mhartid },

Why change these?



> +    [CSR_MCONFIGPTR] = {"mconfigptr",  priv1p12,       read_zero    },

This looks fine, but there are more changes then this in v1.12.
Looking at the preface we need mret/sret changes at least. It also
looks like some other changes will need to be implemented or at least
checked.

Alistair

>
>      /* Machine Trap Setup */
>      [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus     },
> --
> 2.25.1
>
>

