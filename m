Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9aXr-00017C-S8
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:32:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aXo-00015K-GL; Mon, 17 Jan 2022 17:32:08 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=39701
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9aXn-0006fz-1T; Mon, 17 Jan 2022 17:32:08 -0500
Received: by mail-io1-xd2b.google.com with SMTP id v6so23332060iom.6;
 Mon, 17 Jan 2022 14:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EjNGB7poZCAU7Rpz1PZ+LxHLQL0hC/pyLbX9nOjSXPQ=;
 b=UAmYyOLuq8DudE0GYlGeWdoPBLeXKjnfXHEUtgI2u/WmMPGxcDVoDtDgumQHu8RXjz
 5W/hdVXjSdlwbi+BVp0yAZJzpe/vYT6YQl1b92roJVFySlPPGJ2WiiSYsM+K7gQzZKHB
 RaLCpnHVxytRYwNuoUcsDee2BfFWwm/uBg5CqjQY3G+ASU1yTP8z6NX8AMFGvOVeSJ5q
 42wciocrSw6xVh/M2Gd6knB3FxRBca4huTfVyYZTGS1k8bMDZkIxtGqClv3BoG9HYbse
 xMV4rEL0aJd+GpSGF1VjK6K50UwVHBtY+TDP5W8c4s480EwnervhKwdtWKado4Q0u8Q5
 5zZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EjNGB7poZCAU7Rpz1PZ+LxHLQL0hC/pyLbX9nOjSXPQ=;
 b=HM6SAkoprZKiasofr4GSeZJaYU+Vk4ghsHlDizxOtjDlA+3vEz9rZnjw/xslbS2zJ4
 0rpteUES8mKAxcUrjgtZ/stm7OFIDpD3Br8Zoy9J4Tw2z/DfuRMdqSk7CWjXwbrNoqc8
 cFaMuFzu9OjWtm2ksL634Ee2z+VsZaD4r5w2iLQsZ4IfOIkBAJqBtzDmawZUam4OlsVv
 0HJw7LgYEEp65NUswGLFEVbsYCXBayc5QgGP3nJOQUoOrKvrAbFYf42Zq49eBrG6Lo3C
 EukXPZWEbTl+SeyQeXnlpCObZ+0lZ9c2JPu6uwqwGyBszpnFXrh1QeMY0dofH+RI/l6p
 LIRw==
X-Gm-Message-State: AOAM531BnHZY//mGxNHjaa5xhbGKukXE47KHE/96qLmi6QiVYU8h+5JH
 jsHl7ygT6OGU3+Ip96R1iBJMOiJAG3LGX0Nf8PN9LJywsyVq8/Pj
X-Google-Smtp-Source: ABdhPJzfkhn4l+ARKv22XfMz5uIERqlJnz32573iqYmeYHQwDqaQ2s/GOeg0m2k/R7okYcmgHhKotDUPvC6G2ZwEo5s=
X-Received: by 2002:a02:6954:: with SMTP id e81mr10426556jac.63.1642458717341; 
 Mon, 17 Jan 2022 14:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-6-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-6-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:31:31 +1000
Message-ID: <CAKmqyKPMRy+ZgS+qb0ixNc0ALvPs=CCfPv_RTq8_xsX6m8-zVQ@mail.gmail.com>
Subject: Re: [PATCH 05/17] target/riscv: rvv-1.0: Add Zve64f support for
 vsmul.vv and vsmul.vx insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Mon, 17 Jan 2022 22:32:08 -0000

On Wed, Dec 29, 2021 at 12:37 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> All Zve* extensions support all vector fixed-point arithmetic
> instructions, except that vsmul.vv and vsmul.vx are not supported
> for EEW=64 in Zve64*.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 658cfbe10e..a1e403fe86 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2121,8 +2121,31 @@ GEN_OPIVX_TRANS(vasub_vx,  opivx_check)
>  GEN_OPIVX_TRANS(vasubu_vx,  opivx_check)
>
>  /* Vector Single-Width Fractional Multiply with Rounding and Saturation */
> -GEN_OPIVV_TRANS(vsmul_vv, opivv_check)
> -GEN_OPIVX_TRANS(vsmul_vx,  opivx_check)
> +
> +static bool vsmul_vv_check(DisasContext *s, arg_rmrr *a)
> +{
> +    /*
> +     * All Zve* extensions support all vector fixed-point arithmetic
> +     * instructions, except that vsmul.vv and vsmul.vx are not supported
> +     * for EEW=64 in Zve64*. (Section 18.2)
> +     */
> +    return opivv_check(s, a) &&
> +           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
> +}
> +
> +static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
> +{
> +    /*
> +     * All Zve* extensions support all vector fixed-point arithmetic
> +     * instructions, except that vsmul.vv and vsmul.vx are not supported
> +     * for EEW=64 in Zve64*. (Section 18.2)
> +     */
> +    return opivx_check(s, a) &&
> +           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew != MO_64 : true);
> +}
> +
> +GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)
> +GEN_OPIVX_TRANS(vsmul_vx,  vsmul_vx_check)
>
>  /* Vector Single-Width Scaling Shift Instructions */
>  GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
> --
> 2.31.1
>
>

