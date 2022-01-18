Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9gKv-0003bs-8d
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 23:43:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gKt-0003Zh-Ry; Mon, 17 Jan 2022 23:43:11 -0500
Received: from [2607:f8b0:4864:20::131] (port=42852
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9gKs-0006PI-Bz; Mon, 17 Jan 2022 23:43:11 -0500
Received: by mail-il1-x131.google.com with SMTP id u5so12285673ilq.9;
 Mon, 17 Jan 2022 20:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cO14mwm5IPzMJDLtpdg1mSjcCDgVr9WXMAScHIzKRVM=;
 b=LmNPLDbbUZ917goQK9KSRuD5ya61fbrXy0/rzF2NYN++1MwNqyeYD/6wsy75pbdZ7A
 2tGq/IXEQUtoSb6ksZrdMxf7TdJJfbNtndbemerLJv4jZpFb1cheY4kXAAlo6fAr8p/7
 Qmb4RAEULlzVi9O5byqUsQo5o5ljYrmeFzzLJiB7rYcdmfjFkqIq4TPiK8/dNwEY+6Ct
 U0KZXJniIdhjefRw3GmYXO6j+L+ZpWgs1O85ZUpAKO/q1xf75y2QO7YziGp213RkcBRJ
 Yewy/6dSrIcJ2da/52RRAaGUYIQ2GKvBKWubHjXQK4dOleIWRD95GcPx0sjpd4VW9hiS
 oTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cO14mwm5IPzMJDLtpdg1mSjcCDgVr9WXMAScHIzKRVM=;
 b=WjoDLdj8NC7LJYxU2RU2Q/xi/Re97mde/g5Nel3cbl6lgmaC5C+Jp6mgccXNhUeviX
 RZtM8xN0ppYlEKCUseD5a/krmNyEWTlLbPavMVxwYzSrFOr8tP2AET4kqcqXdr3r0NQL
 72TPWonrBeseC0tUIA5pyH6hZLtf+DcdpGqlVub8BD8tZPRELZQx6FHcslEvlL8o3Vfu
 OldStaE+63OctDBYdgcKP+VkUA55wrQ/KcYjBaFc7dyXY4RbSv/gpo4jY7enYbZ/mVSX
 St9WRLYmllEmFfIFAqyw5xPcMGwaYRpA0LHPBWQZf8d5Lso83uRAzCIubHgmdEthOMkE
 GhNw==
X-Gm-Message-State: AOAM533srI0rQ7t65wqqspXJRA1XrkhKfSOPhZE7skoMQgJWrOpw3wlb
 dVBVJy4Jd0GuvzlwH6+i2pouIh/E02kvvSmw6Fd7eYeJD6v3GmWf
X-Google-Smtp-Source: ABdhPJxggUuahUQ68Z61KrILkuYp0KT5nieNKS7eFVVmRl1tTocUIEE02OJy/5wc1SZibXQSPAhNVhK52oMf+F1SR9M=
X-Received: by 2002:a05:6e02:6d1:: with SMTP id
 p17mr9649759ils.74.1642480989026; 
 Mon, 17 Jan 2022 20:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20220118014522.13613-1-frank.chang@sifive.com>
 <20220118014522.13613-4-frank.chang@sifive.com>
In-Reply-To: <20220118014522.13613-4-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 14:42:43 +1000
Message-ID: <CAKmqyKMjWN=Ec3m3_H2ArQTHzE8EXgLnZiX-=kPLH8ydRrfVBA@mail.gmail.com>
Subject: Re: [PATCH v2 03/17] target/riscv: rvv-1.0: Add Zve64f support for
 load and store insns
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
X-List-Received-Date: Tue, 18 Jan 2022 04:43:12 -0000

On Tue, Jan 18, 2022 at 11:59 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> All Zve* extensions support all vector load and store instructions,
> except Zve64* extensions do not support EEW=64 for index values when
> XLEN=32.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 5b47729a21..0bf41aaa1e 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -263,10 +263,21 @@ static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf,
>                                  uint8_t eew)
>  {
>      int8_t emul = eew - s->sew + s->lmul;
> -    return (emul >= -3 && emul <= 3) &&
> -            require_align(vs2, emul) &&
> -            require_align(vd, s->lmul) &&
> -            require_nf(vd, nf, s->lmul);
> +    bool ret = (emul >= -3 && emul <= 3) &&
> +               require_align(vs2, emul) &&
> +               require_align(vd, s->lmul) &&
> +               require_nf(vd, nf, s->lmul);
> +
> +    /*
> +     * All Zve* extensions support all vector load and store instructions,
> +     * except Zve64* extensions do not support EEW=64 for index values
> +     * when XLEN=32. (Section 18.2)
> +     */
> +    if (get_xl(s) == MXL_RV32) {
> +        ret &= (!has_ext(s, RVV) && s->ext_zve64f ? eew != MO_64 : true);
> +    }
> +
> +    return ret;
>  }
>
>  /*
> --
> 2.31.1
>
>

