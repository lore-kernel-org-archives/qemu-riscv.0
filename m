Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m39sX-0000Jo-8o
	for mharc-qemu-riscv@gnu.org; Tue, 13 Jul 2021 00:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39sV-0000Ir-UG; Tue, 13 Jul 2021 00:18:39 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:36391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m39sU-0002cF-3p; Tue, 13 Jul 2021 00:18:39 -0400
Received: by mail-io1-xd32.google.com with SMTP id u7so25442070ion.3;
 Mon, 12 Jul 2021 21:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x7Clm5ksw5+HQ36YWYxc8gtzkpJUwJ43fDS5ZJjrGus=;
 b=AkEiiWPVbm89w/J79L5diuQi2rPiBUHuELXLQJmVe8yQE5vejagbewTYnHx2hI2sNg
 Z7wnhe8ZJV6Jyv2Xu5KweSUEW02g7oM4zvfN20cQB/T3GnZvxZLcSNTKk1NrDvM64vnS
 EYIPGzoILeV5GX6J4nTkCKNj7iTd5PlDr4cGrm5yu/dgEbUo2hVwvlcBWJ1u33oaaBBX
 9VYCMHZzdHketOtnrbza6eLg8+Q9hr+AjwXBMduia9FMszpLT8PmYq5BeiN23OYh6pU2
 Ezptoc91YmqK73w5duZIszAbAGvTHKesiF5uuQJzwUvdv3CV5WB5w41w7MAKjqvO9wbH
 gsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x7Clm5ksw5+HQ36YWYxc8gtzkpJUwJ43fDS5ZJjrGus=;
 b=T+WzI9l1mJn3zpFebAAV1cPnZyxnWFpjkhdppvMF85bD6GtiNZWIqBjHtb8DDOV0bY
 37odvZOUjdz8V6uGvp+J6XKMEzpcf0zeNgvWTrEqq7kn8kK8ssBIW83tH7iClrx/jdMk
 pUrR+lXUTRoqk2zxgCr2xChQ/VXYwY/xWOB+6DjUyRd0qBg8fxkId/0o7SP4e8bIMw6g
 KlPoWYJNjobnYQxOA8O3Wi8WRJ6CgOK4m3luVenJW709rcHcYH/h3ONXGm/iDbaFcGGd
 lXOKGbNfA629TWyYALgw4scU2yoRIuXN2NT/K5AwimH59SBL33m+MD5/7ElUqQhbucaH
 8M4Q==
X-Gm-Message-State: AOAM532EWUWPbr13p1ROZRLvUEQCV5ljVBEIEveIYbdSe5YY1VgzyKOT
 wcxjKOXvH2iZH9wZBaL9Xw3TJTKCMBYcoSZuoJA=
X-Google-Smtp-Source: ABdhPJyGxahhUtfDRsAZ8dibh72dKmE6rOi+Oka/4m/JY2EGiPt80FLarUKulFvXfW4CgJRc4HBqpcfshIPwUR1KfF0=
X-Received: by 2002:a02:3781:: with SMTP id r123mr2153957jar.26.1626149916573; 
 Mon, 12 Jul 2021 21:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <20210709042608.883256-8-richard.henderson@linaro.org>
In-Reply-To: <20210709042608.883256-8-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Jul 2021 14:18:10 +1000
Message-ID: <CAKmqyKPskqW_nSeondUs5pMn6a3k=ed=PuX8P45Zxiy8Vx5mQw@mail.gmail.com>
Subject: Re: [PATCH 07/17] target/riscv: Use gpr_{src,
 dst} for integer load/store
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Tue, 13 Jul 2021 04:18:40 -0000

On Fri, Jul 9, 2021 at 2:32 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 45 +++++++++++++++----------
>  1 file changed, 28 insertions(+), 17 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index a603925637..a422dc9ef4 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -138,15 +138,21 @@ static bool trans_bgeu(DisasContext *ctx, arg_bgeu *a)
>
>  static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
>  {
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -    tcg_gen_addi_tl(t0, t0, a->imm);
> +    TCGv dest = gpr_dst(ctx, a->rd);
> +    TCGv addr = gpr_src(ctx, a->rs1);
> +    TCGv temp = NULL;
>
> -    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
> -    gen_set_gpr(a->rd, t1);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(t1);
> +    if (a->imm) {
> +        temp = tcg_temp_new();
> +        tcg_gen_addi_tl(temp, addr, a->imm);
> +        addr = temp;
> +    }
> +
> +    tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
> +
> +    if (temp) {
> +        tcg_temp_free(temp);
> +    }
>      return true;
>  }
>
> @@ -177,19 +183,24 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
>
>  static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
>  {
> -    TCGv t0 = tcg_temp_new();
> -    TCGv dat = tcg_temp_new();
> -    gen_get_gpr(t0, a->rs1);
> -    tcg_gen_addi_tl(t0, t0, a->imm);
> -    gen_get_gpr(dat, a->rs2);
> +    TCGv addr = gpr_src(ctx, a->rs1);
> +    TCGv data = gpr_src(ctx, a->rs2);
> +    TCGv temp = NULL;
>
> -    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
> -    tcg_temp_free(t0);
> -    tcg_temp_free(dat);
> +    if (a->imm) {
> +        temp = tcg_temp_new();
> +        tcg_gen_addi_tl(temp, addr, a->imm);
> +        addr = temp;
> +    }
> +
> +    tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
> +
> +    if (temp) {
> +        tcg_temp_free(temp);
> +    }
>      return true;
>  }
>
> -
>  static bool trans_sb(DisasContext *ctx, arg_sb *a)
>  {
>      return gen_store(ctx, a, MO_SB);
> --
> 2.25.1
>
>

