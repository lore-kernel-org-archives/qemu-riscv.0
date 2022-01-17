Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9awV-0000AY-9y
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:57:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9awQ-000086-Fq; Mon, 17 Jan 2022 17:57:34 -0500
Received: from [2607:f8b0:4864:20::d31] (port=44804
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9awN-0001cm-5Q; Mon, 17 Jan 2022 17:57:34 -0500
Received: by mail-io1-xd31.google.com with SMTP id h23so23246157iol.11;
 Mon, 17 Jan 2022 14:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CqTSL9qiH6yH/f3rnptHzQKZs+4oW8Dand6MRnLI4AM=;
 b=j5WKNQEw1q3HQTvZg+oiF/YcHQ0e9xt/FveqfPnNLp3AwZeB4AKiOkcSy4pcdWyebx
 qZu7Vm4kn44qPBUpcq8XbvRWekFiMGLNKmX0LZNOTlBRdSXv7t0Xq8RJgCJrwHD2X0/j
 bbo+MrvDOLS8uATudVSZxFYkX6aDi8MSQf0kCYnF8XGl3PmV6pMOfoHpxS/7Dy3Izw1z
 3pTpYzB25oVtja96nqX7DYH60oPJQVKOD5RbV+01ecG8PzQI1b+uGbwIm+iWykkVzz3S
 7xWOXOsxtnioagyREgWbtKxFg+PtcOvRIDJyYjeYZz5FF4VQc2F7IBnO/RgCfOoWsR3Z
 gC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CqTSL9qiH6yH/f3rnptHzQKZs+4oW8Dand6MRnLI4AM=;
 b=5r0V7shGkLJDfxoCZeA5OnuZzAQOOttWandn27Ayc/TGEXdFjCtmA4DnQl9AiEKdLe
 3QwfRiWqozChUWCI9hJ8xkpPwE3eMjVadzYgbjILfwPNR9PQB3ioOSGjQjNK57gf5bsA
 TXD+9iG3AByg0wHAWqHENxMhHANA2EUbfG7bbVbOyIzC86RxbcSOLKdZQwPVJBwzSJP7
 +iWUrloPxfQ5vLyEIj5dzqE1zMUUXQNqHdTFc8O3AG+z0x7YOlObrTm/a1ahEpR7i2Fz
 xj6ECUpDPPvGDsRaEnmm9t20R/9avDYEn+gNjrGOkPc57T3k9kRG5MxErgFcCIRrMWrb
 bsNQ==
X-Gm-Message-State: AOAM530NDXCS8kDtsysCK/Nso4jjMtbjKXXfKNWor9fxgiOW5rJVJYrG
 3/kx+yiofBiVL/QTUF8YEPDF4nxK4vf9JcGu2Pg=
X-Google-Smtp-Source: ABdhPJwculi8v9BwNa/6MwYcnmRrecxuM6DsYqREZXwoyX3xphHWVynywtES11xCa/b1agSk7PDUqF85Q7vNAI4wEqc=
X-Received: by 2002:a5e:8912:: with SMTP id k18mr9663695ioj.90.1642460249969; 
 Mon, 17 Jan 2022 14:57:29 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-17-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-17-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:57:03 +1000
Message-ID: <CAKmqyKOb=9wnBb6s_JCK3epK87aJe8KKtNypsYtpCinaHcLVOw@mail.gmail.com>
Subject: Re: [PATCH 16/17] target/riscv: rvv-1.0: Add Zve32f support for
 narrowing type-convert insns
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
X-List-Received-Date: Mon, 17 Jan 2022 22:57:37 -0000

On Wed, Dec 29, 2021 at 12:46 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Vector narrowing conversion instructions are provided to and from all
> supported integer EEWs for Zve32f extension.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index da0e501f85..5214cf08db 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2860,6 +2860,7 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
>      return opfv_narrow_check(s, a) &&
>             require_rvf(s) &&
>             (s->sew != MO_64) &&
> +           require_zve32f(s) &&
>             require_zve64f(s);
>  }
>
> @@ -2868,6 +2869,7 @@ static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
>      return opfv_narrow_check(s, a) &&
>             require_scale_rvf(s) &&
>             (s->sew != MO_8) &&
> +           require_scale_zve32f(s) &&
>             require_scale_zve64f(s);
>  }
>
> @@ -2918,6 +2920,7 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
>             vext_check_isa_ill(s) &&
>             /* OPFV narrowing instructions ignore vs1 check */
>             vext_check_sd(s, a->rd, a->rs2, a->vm) &&
> +           require_scale_zve32f(s) &&
>             require_scale_zve64f(s);
>  }
>
> --
> 2.31.1
>
>

