Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lZOfj-0000xQ-QT
	for mharc-qemu-riscv@gnu.org; Wed, 21 Apr 2021 22:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZOfh-0000vN-9v; Wed, 21 Apr 2021 22:02:25 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:35369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZOff-0005G9-7U; Wed, 21 Apr 2021 22:02:25 -0400
Received: by mail-io1-xd2e.google.com with SMTP id h141so35635529iof.2;
 Wed, 21 Apr 2021 19:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=47CP7kfPiYHtpv+nejxGjM12khQPQ6XuB6Hbcq60c+0=;
 b=vajrbtZB1lTzzGht1pm5bsa0uecNIwi55mJzsv3yI8UBOJLZzb1Syx27XzBUG+lrwP
 3MuKWbpmTpIqiZenPo1XhM8EXIGi7Up+rNKNh54oJrf9OxcZGsLjBZZX2h4F5Vn2iOQe
 waaF0pdKgXjzklmpYR+tEB/GGKW1Bv86oOnJZh9xnwCYbC8U0f85Yr3Ha3bFYRW9Prdn
 hrS352TFmB/+UFoCi/yvwU5AEhlnIDUfY6ocXShGKPiOKm2pfrSnWC3io8GJbW5H4quE
 SvFxlEWPLhvL5JZ+OM7xjdI9s8OOXk5xCQiefBpJvila3XFKpMCZZefP0ajI3c0wyW5B
 Oylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=47CP7kfPiYHtpv+nejxGjM12khQPQ6XuB6Hbcq60c+0=;
 b=hWNCqFKRjumBnQsuDpCKQQFtGf4DA8Oxncy1rdqQJZy9ymL0kbiOUFQXnUK7BsI5Cf
 oDeR+LPOt9l0lJhQjcRKI5vD/VNOmWeRL+oOC1tr67leSpqguKgIFfEfsM8PqnPXru4A
 lufR1UUfIi23jeSpq9uNXXGiUJdfUf/68wrUQvJVNbNsJ48oz5BipBrEnNJJlt+2CSMY
 l8EeYkhOyudlOBxm7arY2s7NtaXA2bt/3ivCKvDQGPVeTK+wrc3kRXaKKIbB9Ez8ywgw
 g1m3DrFKMlWPFCLvcy7QnQhhtPeBplMZN2eAWBnDI+mwK+3Cv0W+giOJq39FegDrvcpJ
 LUnQ==
X-Gm-Message-State: AOAM5317Sd21195Id6A3dG3G9dOGl8HZIutLKcsCrjkGJsBWHn+U+k9N
 Ih7O28I/hon7IQ5kkwn8HHDEGwk+mCN3VFwMWus=
X-Google-Smtp-Source: ABdhPJxGXOXnbm+sVJnY8SJf391Gnh+UqJkbsrJwNVb1s4WXDyZtEAt2jTQw7b/GR04FMps/rjcFyy247dK+YlBcHOk=
X-Received: by 2002:a6b:7808:: with SMTP id j8mr749629iom.118.1619056941774;
 Wed, 21 Apr 2021 19:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618356725.git.alistair.francis@wdc.com>
 <058e2779f8bcd25816bc2338a44ab6f1b2d549db.1618356725.git.alistair.francis@wdc.com>
 <77d3d314-a03e-e081-04c0-a22447fd2658@linaro.org>
In-Reply-To: <77d3d314-a03e-e081-04c0-a22447fd2658@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Apr 2021 12:01:50 +1000
Message-ID: <CAKmqyKPTB0+8fy5p3VwyZ7ke6cv4N8s-O7oOHKNkU+JSJV9T5g@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] target/riscv: Consolidate RV32/64 32-bit
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Thu, 22 Apr 2021 02:02:25 -0000

On Wed, Apr 14, 2021 at 1:42 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/13/21 4:34 PM, Alistair Francis wrote:
> > -#ifndef CONFIG_USER_ONLY
> > -# ifdef TARGET_RISCV32
> > -#  define is_32bit(ctx)  true
> > -# else
> > +#ifdef TARGET_RISCV32
> > +# define is_32bit(ctx)  true
> > +#else
> >   static inline bool is_32bit(DisasContext *ctx)
> >   {
> > -    return !(ctx->misa & RV64);
> > +    return (ctx->misa & RV32) == RV32;
>
> Why the change here?  Also note the previous comment about fixing this to false
> for TARGET_RISCV64 && CONFIG_USER_ONLY.

Whoops, I squashed this in to the original patch.

>
> >   static bool trans_fcvt_l_d(DisasContext *ctx, arg_fcvt_l_d *a)
> >   {
> >       REQUIRE_FPU;
> >       REQUIRE_EXT(ctx, RVD);
> > +    REQUIRE_64BIT(ctx);
>
> I think you should always put the 64-bit check first.
> That way, on TARGET_RISCV32, the entire function folds away.

Fixed

>
> >
> > -    TCGv t0 = tcg_temp_new();
> > +    TCGv_i64 t0 = tcg_temp_new_i64();
> >       gen_set_rm(ctx, a->rm);
> >       gen_helper_fcvt_l_d(t0, cpu_env, cpu_fpr[a->rs1]);
> > -    gen_set_gpr(a->rd, t0);
> > -    tcg_temp_free(t0);
> > +    gen_set_gpr(a->rd, (TCGv) t0);
>
> So... I really don't like the cast.
>
> This is fixable one of two ways.
> (1) Change the real helper to use target_ulong.
> (2) Use the gen_helper_* stubs that I talked about in reply to v1.
>
> > @@ -390,8 +390,9 @@ static bool trans_fmv_x_d(DisasContext *ctx, arg_fmv_x_d *a)
> >   {
> >       REQUIRE_FPU;
> >       REQUIRE_EXT(ctx, RVD);
> > +    REQUIRE_64BIT(ctx);
> >
> > -    gen_set_gpr(a->rd, cpu_fpr[a->rs1]);
> > +    gen_set_gpr(a->rd, (TCGv) cpu_fpr[a->rs1]);
>
> This one's different, and might be worth
>
> #ifdef TARGET_RISCV64
>    gen_set_gpr
> #else
>    qemu_build_not_reached
> #endif

I have changed the helpers to use target_ulong

>
> > +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> > @@ -303,11 +303,11 @@ static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
> >
> >       TCGv t0 = tcg_temp_new();
> >
> > -#if defined(TARGET_RISCV64)
> > -    tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
> > -#else
> > -    tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
> > -#endif
> > +    if (!is_32bit(ctx)) {
> > +        tcg_gen_ext32s_tl((TCGv) t0, (TCGv) cpu_fpr[a->rs1]);
> > +    } else {
> > +        tcg_gen_extrl_i64_i32((TCGv_i32) t0, cpu_fpr[a->rs1]);
> > +    }
>
> I think you should leave this ifdef alone.  The ifdef has determined the size
> of target_ulong and thus the size of TCGv, and thus the correct move to use.
>
> If TARGET_RISCV64 and is_32bit, the high bits are ignored; the fact that they
> happen to be copies of the sign bit is irrelevant.

Dropped.

Alistair

>
>
> r~

