Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUWV6-00044H-Su
	for mharc-qemu-riscv@gnu.org; Thu, 08 Apr 2021 11:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lUWV4-00042N-NU; Thu, 08 Apr 2021 11:23:18 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:39815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lUWV3-0001XM-61; Thu, 08 Apr 2021 11:23:18 -0400
Received: by mail-il1-x12c.google.com with SMTP id b17so2110385ilh.6;
 Thu, 08 Apr 2021 08:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gcd/vsZtjno3B6I1lJLXfrhYz7HPZzQS2ctns6uBjbc=;
 b=TusA41Hbblxx1lrgxRm8z1hHAmHH41My0n/A2H1l2MZ4L+s8NzDS250WgYX3Nd28UH
 X2khSN8zr4VIqdxOkjdMXklmxb7XnxRSLXClzePu0/Edi5BklEeqlwOSF+0Ny7SEqG2p
 lLvb/P0bPY+mQgjwAErPJMP4ULJFP0S9GHEzuk0NSWnZN5tzt6HHRHzdBGvaPuaRkFe8
 RWVinPtK+Pb9S6NCyoISmnYMhi9FP2IleFRWSaWnCYHLrT6drvRnaqjV8HslodBm4I0d
 MfFTKagMbvgipAIqz/1/S/ajH5z8gEqld/LrkY9fEGG7TwawUvm0Ivb3tcmUKb92d2R+
 iW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gcd/vsZtjno3B6I1lJLXfrhYz7HPZzQS2ctns6uBjbc=;
 b=BfRcE2skbFvH8baNlgk/T83vqLbLnYxbsR1JD7eIT40kmaXnJ2s4EwX9rYD3F1i0XI
 173wweYmVBgLaW9WbK4+FX6Kt7pPsa9CtSJVjoDumWYhgADT+Erszxn0+/4kordh6IGm
 I/cT+99MNVisoHEymuuTYTvyX9/t8yRrUS075um29HZ+VYjMPO8IrTgpw3GmHdGTS+nr
 9EAwkbJfkDd081a/A1AgkHEbSzasFu2G3QppJ016fpFuWoKJm2cAFZfMt2KL0zuiGbrM
 CqG5TOQS3OMRgn1WcMpiF8OOfUtZAKVVrWheOxpAhd6Hg+H45LPmLKYxxiIUWX3WRmKb
 rtww==
X-Gm-Message-State: AOAM530oPjipEH55gdAtNBYtBbvgAYJMHY5Xs668UrCAfO/72A33Bdoc
 SBRy1LU1558zfVNxqkro+IlCrXSqF/cCFiSaB0A=
X-Google-Smtp-Source: ABdhPJwoFMyAq9sNmn0ewKT5R7ZIRGmq/5ZLDj2uKQHZOPkNY2vuNQGJTlGudPETloxiagybc/4l6wkUjJaWW8wXbSE=
X-Received: by 2002:a05:6e02:5a2:: with SMTP id
 k2mr7531543ils.177.1617895395162; 
 Thu, 08 Apr 2021 08:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <7efb55362999a5b709ea8e7fa0ea188e740d9c67.1617393702.git.alistair.francis@wdc.com>
 <81cbeace-c357-1ef3-1a1c-f1b266e66a98@linaro.org>
In-Reply-To: <81cbeace-c357-1ef3-1a1c-f1b266e66a98@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Apr 2021 11:20:53 -0400
Message-ID: <CAKmqyKNN7y=WV5=Bqd7zjLrYL620QOzrz=YR0XgdxMe+pLBxcw@mail.gmail.com>
Subject: Re: [PATCH v1 4/8] target/riscv: Remove the hardcoded MSTATUS_SD macro
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Thu, 08 Apr 2021 15:23:19 -0000

On Mon, Apr 5, 2021 at 11:10 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/2/21 1:02 PM, Alistair Francis wrote:
> > @@ -369,6 +369,9 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
> >   static void mark_fs_dirty(DisasContext *ctx)
> >   {
> >       TCGv tmp;
> > +    CPUState *cpu = ctx->cs;
> > +    CPURISCVState *env = cpu->env_ptr;
> > +
> >       if (ctx->mstatus_fs == MSTATUS_FS) {
> >           return;
> >       }
> > @@ -377,12 +380,24 @@ static void mark_fs_dirty(DisasContext *ctx)
> >
> >       tmp = tcg_temp_new();
> >       tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
> > -    tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS_SD);
> > +    if (riscv_cpu_is_32bit(env)) {
>
> This is less than ideal, and will be incorrect long term.
> You should check ctx->misa instead.
>
> Eventually you'll need to change riscv_tr_init_disas_context to not just copy
> ctx->misa from env.  At present we flush all translation blocks when misa
> changes, which works.  But you won't want to do that when the hypervisor is
> 64-bit and the guest is 32-bit.
>
> Anyway, I think it would be a good idea to create a helper local to translate,
> akin to has_ext().
>
> > +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS32_SD);
> > +    } else {
> > +#if defined(TARGET_RISCV64)
> > +        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | MSTATUS64_SD);
> > +#endif
>
> The ifdefs are ugly.  I presume there's some sort of compiler warning here?
> Does it go away if you cast to target_ulong?
>
> How about
>
>      target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;

It turns out clang doesn't like this, so I might still be stuck with ifdefs.

Alistair

>      tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
>
>
> r~

