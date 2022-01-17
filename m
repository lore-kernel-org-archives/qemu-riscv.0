Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9aWc-0000ba-4k
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:30:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aWX-0000YG-Hu; Mon, 17 Jan 2022 17:30:50 -0500
Received: from [2607:f8b0:4864:20::d31] (port=38474
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aWV-0006Vp-8Z; Mon, 17 Jan 2022 17:30:49 -0500
Received: by mail-io1-xd31.google.com with SMTP id w7so18127852ioj.5;
 Mon, 17 Jan 2022 14:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mR+8I6s4kOmNe5sthdqXA9ByBR4CKg5jyeVgO73oWHA=;
 b=XNRWtk9OePh/4P9BAHTMyy4pv5ln5KkK6Th0Tk7xlN70yhjNlf//+rZqCZucWZIpB9
 qynLY8hc27dAIFq9xJCoAQVsobjFic3HQ9IgdCqDWMA3/4xu03xWR3feI5zlUt0gnb+U
 Ig5AZo8oWXpxNUdZW1zysed+Q2UL8uHG2ePK2zGVEYoIOLC01Rk34CZSwrdvoHQFkGdD
 K1BkTxL3JARfQsfxPiXUmj7bbkXNu6b1CHQpvUtLUnxkn+IkO6rbjSuMqYXpFHfCuNmt
 hV8wxifIz7G/6fFF+Jbw2yYUMa1R89P1Nos64ubD1hzr8wJGrchgNeQ+xDIhsJSAw/i2
 oMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mR+8I6s4kOmNe5sthdqXA9ByBR4CKg5jyeVgO73oWHA=;
 b=6sDr/AaKsxaeGcu1BUbJKLgxwstP7S4fJSzYxnkRBBI+yn0oq3fUzl3EkDGos3q1/T
 cxP/ChwexuzoqxFAB9mg+i4nuctBk/l8s6UinDS+R3c2bLnOY1QfUgB2swvZTvYtPtFS
 SPMrSyduV6qjdpKORQqi2XkXimS5/yjpB5fOKxnRHc3jpfXa+s0EKNR4WIfnn32+hpMp
 9Grehhfqc+fQOw6UmC5jSgfMryWRz6boZaxwzJMRyG4ZKcOyX5crAteHXr4IYmRceek+
 djPAzCirsg8AFMtsj6m1g+ljcGWqaV0Stw6wQffb9cvTx6brAKhp+vrymEWXUa/Tok4e
 F5CA==
X-Gm-Message-State: AOAM532AA5quv1GhSZhqk3fSiPlAu3vJMDWaiZ6y1m4DDQYwpR664XV9
 TTN0fC0XUKpQ2W3FY83nXNck1eoUxmITZgp/lOg=
X-Google-Smtp-Source: ABdhPJwUQkwTT9n9o2JqAYG13GBJN/yYQvYju9u9q8sycgg5hv8A+ydWM9KGNa3ahH/7iCOTrfykf9Lkf6vZ8BQ80oI=
X-Received: by 2002:a02:a818:: with SMTP id f24mr10842065jaj.125.1642458645760; 
 Mon, 17 Jan 2022 14:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-5-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-5-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:30:19 +1000
Message-ID: <CAKmqyKNm1XxsiJ8u8Wg5jjcwqNpkoRUeLQoOgGv71CTVxbfTWQ@mail.gmail.com>
Subject: Re: [PATCH 04/17] target/riscv: rvv-1.0: Add Zve64f support for vmulh
 variant insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Mon, 17 Jan 2022 22:30:52 -0000

On Wed, Dec 29, 2021 at 12:36 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> All Zve* extensions support all vector integer instructions,
> except that the vmulh integer multiply variants that return the
> high word of the product (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx,
> vmulhsu.vv, vmulhsu.vx) are not included for EEW=64 in Zve64*.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 820a3387db..658cfbe10e 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1906,14 +1906,41 @@ GEN_OPIVX_TRANS(vmaxu_vx, opivx_check)
>  GEN_OPIVX_TRANS(vmax_vx,  opivx_check)
>
>  /* Vector Single-Width Integer Multiply Instructions */
> +
> +static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
> +{
> +    /*
> +     * All Zve* extensions support all vector integer instructions,
> +     * except that the vmulh integer multiply variants
> +     * that return the high word of the product
> +     * (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx, vmulhsu.vv, vmulhsu.vx)
> +     * are not included for EEW=64 in Zve64*. (Section 18.2)
> +     */
> +    return opivv_check(s, a) &&
> +           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
> +}
> +
> +static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
> +{
> +    /*
> +     * All Zve* extensions support all vector integer instructions,
> +     * except that the vmulh integer multiply variants
> +     * that return the high word of the product
> +     * (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx, vmulhsu.vv, vmulhsu.vx)
> +     * are not included for EEW=64 in Zve64*. (Section 18.2)
> +     */
> +    return opivx_check(s, a) &&
> +           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
> +}
> +
>  GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
> -GEN_OPIVV_TRANS(vmulh_vv, opivv_check)
> -GEN_OPIVV_TRANS(vmulhu_vv, opivv_check)
> -GEN_OPIVV_TRANS(vmulhsu_vv, opivv_check)
> +GEN_OPIVV_TRANS(vmulh_vv, vmulh_vv_check)
> +GEN_OPIVV_TRANS(vmulhu_vv, vmulh_vv_check)
> +GEN_OPIVV_TRANS(vmulhsu_vv, vmulh_vv_check)
>  GEN_OPIVX_GVEC_TRANS(vmul_vx,  muls)
> -GEN_OPIVX_TRANS(vmulh_vx, opivx_check)
> -GEN_OPIVX_TRANS(vmulhu_vx, opivx_check)
> -GEN_OPIVX_TRANS(vmulhsu_vx, opivx_check)
> +GEN_OPIVX_TRANS(vmulh_vx, vmulh_vx_check)
> +GEN_OPIVX_TRANS(vmulhu_vx, vmulh_vx_check)
> +GEN_OPIVX_TRANS(vmulhsu_vx, vmulh_vx_check)
>
>  /* Vector Integer Divide Instructions */
>  GEN_OPIVV_TRANS(vdivu_vv, opivv_check)
> --
> 2.31.1
>
>

