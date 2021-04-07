Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUBk9-0004Tm-6h
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 13:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lUBk8-0004Tb-Au; Wed, 07 Apr 2021 13:13:28 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:33394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lUBk6-0005K5-KV; Wed, 07 Apr 2021 13:13:28 -0400
Received: by mail-il1-x12f.google.com with SMTP id r17so9128614ilt.0;
 Wed, 07 Apr 2021 10:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GxIyfdQPV0zp+yUIvoxWSFfl4k6Sbxpo05NEOXnTjmQ=;
 b=LMOzypF8Dv086E+GIVPpT3W45lBFC7SbF3yYQ6Yw/Y9+7uZq6gOUyfod2p/wwjzw7+
 +X/VD0E+tMA7WueYGgYjQskj1xFPjvS0vn9mJ0gx52LUTMs5Ht6N7IZr3DAoS7e3f9xW
 YX2xJpvRJUALOVS4sqA6kBC/AXwXKshkedqK4sWLuvEolfeUoHH+BR7Eesrn8O/iL5NM
 8Cx4eUxZyhsq4nKWovSL/VIen7mmdXF4FHMcL+GCfPSP33SBJEqsbOwIy03ajxA+f79z
 J7hw5NnyneDbTI6S8jl2AmXiwRiNxTCVuncZWB/W+FiuXyZwTPj//3euGXvgmJrpe++9
 rxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GxIyfdQPV0zp+yUIvoxWSFfl4k6Sbxpo05NEOXnTjmQ=;
 b=qBU+vIWdVauXymSk+dpfDjANiw/z2JEuqrqSg3lIrP0D0919vsQbaHMvNVnpNrZ4fz
 uo5zmfWuRlNyEXTg8hGHF+EUsVe6VNqwqPXXTfORDiieOiQsnyeyCDm9Hv1mr0hQqWNA
 H46B7gB5C6Z7ZRYJ9sLqLFNDzpfDQ1pHwU0FZhghRB3w35y8eneprfYM7w2OfGg9+Pha
 wu4vBSNDuwvFGBH4qFuVfhiW7FM47B+My/ri61J7/kg7Odp2QgDXEkFPoLjDaMvjZE54
 0/3dEAung4Bq0sIPuPUvhYNFMM65R5dMw9ECC0TJ7Ynd3hGlybqatieV1haF8ykDZAOX
 Em7Q==
X-Gm-Message-State: AOAM533eNahDVpx5oibcXSof2y4NwOKZ8l+TWRJcKHg/p16d8bPwp4O1
 wRHL1FRXSstUzKTZ3YkNkhNHVA/E6oYs0IzFjWQ=
X-Google-Smtp-Source: ABdhPJzunNkQr4toLvzpy4OC5MMf2CVKIeQqa6P35czHPxdEUGOck4G0gozBqojvuqgFNiWS7CnpajqRU+hA5wFt99U=
X-Received: by 2002:a05:6e02:1ca7:: with SMTP id
 x7mr2823230ill.267.1617815605112; 
 Wed, 07 Apr 2021 10:13:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <7efb55362999a5b709ea8e7fa0ea188e740d9c67.1617393702.git.alistair.francis@wdc.com>
 <81cbeace-c357-1ef3-1a1c-f1b266e66a98@linaro.org>
In-Reply-To: <81cbeace-c357-1ef3-1a1c-f1b266e66a98@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Apr 2021 13:11:03 -0400
Message-ID: <CAKmqyKMabQjq0Rwp_kNQLrW-SB5rnZ9yc0Sr9qg=2KhN1cq7xw@mail.gmail.com>
Subject: Re: [PATCH v1 4/8] target/riscv: Remove the hardcoded MSTATUS_SD macro
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Wed, 07 Apr 2021 17:13:28 -0000

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
>      tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
>

That works, thanks!

Alistair

>
> r~

