Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYM6W-0005BY-It
	for mharc-qemu-riscv@gnu.org; Thu, 07 Oct 2021 01:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mYM6J-00059A-KS; Thu, 07 Oct 2021 01:37:53 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:34437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mYM6I-0004Dp-73; Thu, 07 Oct 2021 01:37:51 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id q189so10757588ybq.1;
 Wed, 06 Oct 2021 22:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C9SpfKMtTpjSyjxFcx9d+0id7+Uwpp38poZPKInaPL8=;
 b=GLzxEdOIXTBWJ1QwzbWSYhmAsknzuGSz3xJL46KNLxzG88YbF7QMdKOFC1FlDWs5V8
 EfEDOpsZhHFI6gERHdDUBZEOflo+NE/TNZRX/GDIj96E+AdTWYa1JDhm4gJQpElkhDbY
 JlA4q5Iu4NER3sg6EtgAqvLDuQHOZMSjyfthnSUMiBuER0zsWb+KnK0qmq4B5LXPtz19
 eUlrsumQ3Yn4Nlra4xIVQFPWm9vIlKdgSemMqDsE1hwOGl1PY/desGaoHMS9s2wBwChb
 szY9J8Ywat7Frx317/xv1ESB4luFpeRh/X1sYsNAh4x0h4UbcocedWFFz5a+z7jOUhAs
 SRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9SpfKMtTpjSyjxFcx9d+0id7+Uwpp38poZPKInaPL8=;
 b=x4m5LVGCYsPFHlevJ5eSILYTxidrdYjHqngejzQlzkpbVu8lEDz8aa1nLsy2f6YKKH
 JaCArNG1Y8Ailhix3PNONhe+MJd5Z/F54k1l3CcCfE9RJbVYG46C3yoZDn/RoYtzcGkH
 Bgl1hhDX/I7kHQKC/r9XG0uLitYbplHquUdrcKifEpBx42KZatbbbTmL17uc+S6mJje0
 wG1PnyejJ3AZCXp7vkff0iQOMRpbyEPdQhLWDJRRVvwqCctVU09vmlJQZ44uV6Qk0evC
 DZJFD+Srz9SocL5X/gYH/TMybFWKDmCNjNYFSKPME0DYM7wQKgVKmpmpTOsNN4JQsqsU
 0QYg==
X-Gm-Message-State: AOAM531tjULkmf37uuECYxml0rfvkihAo1+fo5luOFYXIv3LNZaHl9GD
 2wOi9GIlWvFwAPWpSOuTXafm9Rkfasy4qPo6zjg=
X-Google-Smtp-Source: ABdhPJwaT9GD9hyAzoJJtrxJIWGp6hMT2pt7NHOIBnDe9H7dmlDEuWTqwYaptwM0KLwsB8uURIn4eyIGwCodMdX/KVs=
X-Received: by 2002:a25:e048:: with SMTP id x69mr2366651ybg.293.1633585068260; 
 Wed, 06 Oct 2021 22:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211003112855.960081-1-rpathak@ventanamicro.com>
In-Reply-To: <20211003112855.960081-1-rpathak@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 7 Oct 2021 13:37:37 +0800
Message-ID: <CAEUhbmUsMrSvQHWWoFRzdUuOyxcaaw=L7h7tk0f5_wsd692=ow@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: csr: Implement mconfigptr CSR
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, pathakraul@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2a.google.com
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
X-List-Received-Date: Thu, 07 Oct 2021 05:37:59 -0000

On Sun, Oct 3, 2021 at 7:29 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> mconfigptr is an mandatory CSR as per the priv spec.

%s/an/a

as per the priv spec v1.12

> This csr holds the physical address of the configuration
> data structure if this data structure is implemented
> Its an readonly csr set to zero making configuration
> data structure not supported.
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---
>  target/riscv/cpu_bits.h | 1 +
>  target/riscv/csr.c      | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 999187a9ee..5dc4729ed5 100644
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
> index 23fbbd3216..2182943f54 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1549,6 +1549,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
>      [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
>      [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
> +    [CSR_MCONFIGPTR] = {"mconfigptr", any,  read_zero    },

Not any, as we need to check the priv version >= 1.12

>
>      /* Machine Trap Setup */
>      [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus     },
> --

Regards,
Bin

