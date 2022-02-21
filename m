Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMGRm-0003F8-Do
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 16:42:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGRl-0003C1-2s; Mon, 21 Feb 2022 16:42:17 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=43574
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGRj-0000Y0-KN; Mon, 21 Feb 2022 16:42:16 -0500
Received: by mail-io1-xd2b.google.com with SMTP id m185so17650678iof.10;
 Mon, 21 Feb 2022 13:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hxuIw9VJUgoO7iSFVD2hy28+5jP61hdnOJ1IATOHxLg=;
 b=QpcqDgBe/MX4vAQgsQJHRtHg0URyotAQ/mybvzf7CgLWuPv3WKtOWi6cHSLb/6RPc9
 VtAk3qyIUCausFZv4t9fRsB4+ACe4gtaossCQNfj0hN08fA1WODNta++Uri7B5/ohJgp
 l94v/7317kv+Bu9+93zDNkLoZM94SWF16bmm+EWXb/1vwM4hcZwU0nSsVuvqoWmHBNCV
 q9fk6qmJBU6ZWvlWIJuNHTwoVPPpZAkC71amzoDMYTJ4/yYyNZWSRmBKg3LrHOeraD2p
 /ea5yfh+TvOiYhcQrKjyu0ZGtPHgX+7IR3JAVL3yHdHLLBg7BF2SvPEfDbDGbcSqx6gY
 8chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hxuIw9VJUgoO7iSFVD2hy28+5jP61hdnOJ1IATOHxLg=;
 b=KbhZVHpm7KG8ZMpNOMghdlqT6K3HRQX5rx5mapo0p/hJC1NfwMFyzX1qCqx6vhrkcl
 h6dP3GeGANGxskuIuoIEgJrbatYZfDNRgR3H02CgfkpluUw+2p5CzrkNyIC3TEMifqXm
 TpwTcg+Vptw1YH0o7d/xEvdQ+KSW80NdEZrZIOhl3nXCY2VhQniaz6KFsqo5wTbBJCYZ
 7dMt1D1ybcSlw+oShBax62Py1trdFKkB90Wgd27epYe+WCO7B9YvnQkd2wcwmQr5ybST
 vU3VjLkKwnftUkVex3u0ow6PvVQDPM3c6PsN7Ie07gQiNpyY0rSI/5X0awykC8OqJ9FQ
 bz0Q==
X-Gm-Message-State: AOAM532o+tHLsZJK/v4MjhD/Klf38VLwT0qrwfp1FAaCySKQsX0FO85X
 EsCp4x7dV4v9COeRs31j+HkglCash3NfB1g7Auc=
X-Google-Smtp-Source: ABdhPJyD9b30GIZCOpY5/2mMLPEifzDwTNZS+MeqNeiececkR0xLU55yA3QUG2B6mIYIFVcHO4N1i5WZ3MFy5JYn6Tc=
X-Received: by 2002:a05:6638:25b:b0:314:21b0:fb61 with SMTP id
 w27-20020a056638025b00b0031421b0fb61mr16486585jaq.66.1645479734263; Mon, 21
 Feb 2022 13:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20220206091835.1244296-1-atishp@rivosinc.com>
 <20220206091835.1244296-5-atishp@rivosinc.com>
In-Reply-To: <20220206091835.1244296-5-atishp@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Feb 2022 07:41:47 +1000
Message-ID: <CAKmqyKPuPRXZkuV4g+AYNRn8HPriBbnnnW-cK7+F9=3jhLat2Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] target/riscv: Add support for mconfigptr
To: Atish Patra <atishp@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 21 Feb 2022 21:42:17 -0000

On Sun, Feb 6, 2022 at 7:43 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> RISC-V privileged specification v1.12 introduced a mconfigptr
> which will hold the physical address of a configuration data
> structure. As Qemu doesn't have a configuration data structure,
> is read as zero which is valid as per the priv spec.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_bits.h | 1 +
>  target/riscv/csr.c      | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index f96d26399607..89440241632a 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -148,6 +148,7 @@
>  #define CSR_MARCHID         0xf12
>  #define CSR_MIMPID          0xf13
>  #define CSR_MHARTID         0xf14
> +#define CSR_MCONFIGPTR      0xf15
>
>  /* Machine Trap Setup */
>  #define CSR_MSTATUS         0x300
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 25a0df498669..18fe17b62f51 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3021,6 +3021,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
>      [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
>
> +    [CSR_MCONFIGPTR]  = { "mconfigptr", any,   read_zero,
> +                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
>      /* Machine Trap Setup */
>      [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
>                                                 read_mstatus_i128                   },
> --
> 2.30.2
>
>

