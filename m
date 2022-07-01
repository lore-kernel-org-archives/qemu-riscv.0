Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o7FpX-0002iX-Kl
	for mharc-qemu-riscv@gnu.org; Fri, 01 Jul 2022 08:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o7FpG-0002d8-Iz; Fri, 01 Jul 2022 08:32:47 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:46733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o7FpB-0005fl-LX; Fri, 01 Jul 2022 08:32:46 -0400
Received: by mail-qt1-x834.google.com with SMTP id he28so274845qtb.13;
 Fri, 01 Jul 2022 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YRhPIQeUa2h7UmE8hwiBhHgZdq9BaNu/fVo2x5VlOZE=;
 b=pM3jB0+mAMp14fJ0FD+jEHd6l+vyZU3VQ7sjZGWVTmXmNbRRoK7FQ2u7R9w+lHGpTY
 ceMQdsuwlMpTlj4rQ9KA7QdrZBqXkdllBtk8xSaNGH6eRCUOao4zG+8MJCcZTczgylkr
 PXIIXIvJRKA1i2n7UFi6Ww6wqqy4taMy7VFqF/okgGWUCnCihRSiKzpDPog5S3kLyzL/
 pw6BmvKevyh5Qn4yrKp9MmmDtgWcgx1BAs1hGwlpHud3VGdMYYKTzLbWre+Mkpv5kIvm
 8jmhj1yEy0sWT9lEOiiiaEk5rDs1d74Zbps+LsOtcPqRbuMF6l46/HfGhTUIzwDn0xWH
 pkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YRhPIQeUa2h7UmE8hwiBhHgZdq9BaNu/fVo2x5VlOZE=;
 b=0ivg5cBD1AIJqER/FardznCiBn2fuQGmmogbOgZKB40RKOF5eVf/HNqPUSCIdaHre9
 o/3My4/t88DPzw9Ik1uZMSWRyEu+dtdL4yVH/wrXP2fgVzMBXYV3fQ4JOAFqlMQ8t+de
 b2tHuaiASIvrh28JH4T7Sd/WI7o2hbRUg5wiBvH4CiX6WkRQh3htGWdMYpK1Sh93oY44
 4zZhJQFybtIKYCR4VJ+0OO9esJybjVS98uKNZvQPkUQChbyEjEKeCAvMq404E6f07vwl
 I9cOtJkLxK2z3deMLGt3fATd+904Kiodm8kVp7gJ8YtQPJk+7DrrjLnp0Ff2qt7HlJLs
 a1cQ==
X-Gm-Message-State: AJIora94QX+l2pdL4QYaufsu9Ph4YlnbxB7POeJPGDH1r5uOgdUsWKzY
 g99LyQgKP49mBRckNGiW8YGAb3hIzKwTk+X+crw=
X-Google-Smtp-Source: AGRyM1vWWNgaZIjod1Zl9WP8Ba69CqUvDjHnwMgmLh+7k//QAnzE0xVA/5Wm083jqU9yHECSgpe1oi9TZFvJbjk9kb4=
X-Received: by 2002:ac8:7d52:0:b0:31d:2828:f with SMTP id
 h18-20020ac87d52000000b0031d2828000fmr11218567qtb.391.1656678759704; 
 Fri, 01 Jul 2022 05:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220629233102.275181-1-alistair.francis@opensource.wdc.com>
 <20220629233102.275181-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220629233102.275181-2-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 1 Jul 2022 20:32:28 +0800
Message-ID: <CAEUhbmV=j3jxUh+UiTGKtSZeXwBdhu+xeO3J_NFZT593TUPVHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Fixup MSECCFG minimum priv check
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 01 Jul 2022 12:32:48 -0000

On Thu, Jun 30, 2022 at 7:31 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> There is nothing in the RISC-V spec that mandates version 1.12 is
> required for ePMP and there is currently hardware [1] that implements
> ePMP (a draft version though) with the 1.11 priv spec.
>
> 1: https://ibex-core.readthedocs.io/en/latest/01_overview/compliance.html
>
> Fixes: a4b2fa433125af0305b0695d7f8dda61db3364b0 target/riscv: Introduce privilege version field in the CSR ops.

The format is

Fixes: 12 digits commit id ("commit title")

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6dbe9b541f..6379bef5a5 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3561,7 +3561,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>
>      /* Physical Memory Protection */
>      [CSR_MSECCFG]    = { "mseccfg",  epmp, read_mseccfg, write_mseccfg,
> -                                     .min_priv_ver = PRIV_VERSION_1_12_0 },
> +                                     .min_priv_ver = PRIV_VERSION_1_11_0 },
>      [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
>      [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
>      [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
> --
>

Other than that,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

