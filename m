Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nz6yP-0005z6-5d
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 21:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz6yN-0005yr-Vz; Wed, 08 Jun 2022 21:28:32 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nz6yM-0006hJ-8z; Wed, 08 Jun 2022 21:28:31 -0400
Received: by mail-qt1-x82a.google.com with SMTP id x16so12917102qtw.12;
 Wed, 08 Jun 2022 18:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dtIs6eyEUnYfUo3cvdlrG9kK3tNCEnWx8WlU9pfb0aA=;
 b=luhALfkiLc4+lvjj5zLPxpoLrueC62XLs8P34QNZW5+dAQJKMYAv6E5SWHZevihtV3
 CnsulFM5Orp441/z56BmMp5G2Fzp++O91D2tMso6v+Q86wWDmBxccvAG30H4OzSx1sLl
 3cplhOJ+ODaGeYEyJE0XB7hloP9RI6JAv77fRHD84lJ23vtLp80BcCrXeZxc6k6xxYtB
 qNC1J/lvU/YBwaeM359jI7IgalJqE5WrLdukk+vWrJLPrxlCZQGcrYpP+irGJtOpfs4G
 +VRKtjU3XL0UYiIaBCxnkAEN+DDzmivY09uwAVh2yv6mudFXo8agbAMZg3MfIiqIvklt
 HDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtIs6eyEUnYfUo3cvdlrG9kK3tNCEnWx8WlU9pfb0aA=;
 b=qqEibHW24XYBxhbznjymKk0u1/Ulp2OS1WGiuJvez4kij+Q7tvGNaFHr6ekAcThUZR
 8BFrLZdTQspRki1yKv7H+z7+fvuKjv9JmxJ+W3A0Q28WBkwiwWTcXp1tQ/HyNkctHh7i
 ofz363/NmBjur3njAldJ5R6BXDIHfPzeY6GiF1cE5qDp3+HX6OKIVCTYq03T6FD5tCU9
 sBqi1GpDML2apmDsXzf+BfL03l5dOwfuaEsBGUb4hM8Plh2SPNy7uR2P/b0TAketJ0Te
 oQ/22qAu9/adeP6xUZIRC/Njb5M6CA3P6p4JqVMpgxZHgDDuM2dnUfZ8eJM19xWB0VKL
 NElQ==
X-Gm-Message-State: AOAM530obzAk/UmdvzvhPzqfKiyBw8jAIBjlYq2K8wVjaq5NRcKxxCX3
 RdJEhwumREmq/6A/4zLh67Agn8MQWGMh8g9DFa4=
X-Google-Smtp-Source: ABdhPJwygZEZnt/mnFg/H12XKS9TXdpWeqlMC05UUf1sQA4ZOTjz4jKlyKdW2QlHFxP0mcyQWiWhmjVDLzoCHf9wsFY=
X-Received: by 2002:ac8:7d55:0:b0:305:732:680b with SMTP id
 h21-20020ac87d55000000b003050732680bmr3760971qtb.391.1654738108756; Wed, 08
 Jun 2022 18:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220608161405.729964-1-apatel@ventanamicro.com>
 <20220608161405.729964-3-apatel@ventanamicro.com>
In-Reply-To: <20220608161405.729964-3-apatel@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 9 Jun 2022 09:28:17 +0800
Message-ID: <CAEUhbmUy0BWoHMvuwzwqrXN6f1rrwGFszAmiWkucHtARMAHhUw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] target/riscv: Add dummy mcountinhibit CSR for priv
 spec v1.11 or higher
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82a.google.com
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
X-List-Received-Date: Thu, 09 Jun 2022 01:28:32 -0000

On Thu, Jun 9, 2022 at 12:15 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The mcountinhibit CSR is mandatory for priv spec v1.11 or higher. For
> implementation that don't want to implement can simply have a dummy
> mcountinhibit which always zero.

which is always

>
> Fixes: a4b2fa433125 ("target/riscv: Introduce privilege version field in
> the CSR ops.")

The "Fixes" tag should be put in one single line, so that scripts
relying on such won't be broken.

> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 3 +++
>  target/riscv/csr.c      | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 4d04b20d06..4a55c6a709 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -159,6 +159,9 @@
>  #define CSR_MTVEC           0x305
>  #define CSR_MCOUNTEREN      0x306
>
> +/* Machine Counter Setup */
> +#define CSR_MCOUNTINHIBIT   0x320
> +
>  /* 32-bit only */
>  #define CSR_MSTATUSH        0x310
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6dbe9b541f..409a209f14 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3391,6 +3391,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_MIE]         = { "mie",        any,   NULL,    NULL,    rmw_mie           },
>      [CSR_MTVEC]       = { "mtvec",      any,   read_mtvec,       write_mtvec       },
>      [CSR_MCOUNTEREN]  = { "mcounteren", any,   read_mcounteren,  write_mcounteren  },
> +    [CSR_MCOUNTINHIBIT] = { "mcountinhibit", any, read_zero, write_ignore,
> +                                             .min_priv_ver = PRIV_VERSION_1_11_0 },
>
>      [CSR_MSTATUSH]    = { "mstatush",   any32, read_mstatush,    write_mstatush    },
>
> --

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

