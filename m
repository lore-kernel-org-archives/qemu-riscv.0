Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdGvc-0003WG-Ql
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 15:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdGvb-0003RE-3G
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 15:07:07 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdGvW-0001Dq-CW
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 15:07:06 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so1253898pjl.2
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 12:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8T0ASnC2AEKxtoVK4GdyqxCeZjT67QbxnKzeH37StBs=;
 b=tmpwsPwB61XZ+WEPNKxStCcAlB0/s9U6N95tAqKjtOmV7bxYGoLdlbGqJUYni0MIal
 +DYIO498sAJsSVDpfOOWFI+qPpzDLtfFwlm7XLFw6LsZhskpaL1B1MPbaZO0rD9u4HEg
 fm/Rw2Eau5peTO21E3dxNYnaUQqGdqtl0ptm+occ0Z3hYzKMRCRRdYViF3k/LQJLjCBJ
 L1pdVlh1cxtC3d0AGj7LHwMNJ3ls1Hq8FiUw1v8HV+hg6tld8V/jginK2zKLrOzzpeJ4
 +VGUIeq9CxrbPEQ/J2Egxh9/eFojraeVon2dZAZ5SCGZRoNy36rKstyKw+xm6sc1NGDo
 SsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8T0ASnC2AEKxtoVK4GdyqxCeZjT67QbxnKzeH37StBs=;
 b=NB10XLxcSxlIq/UUS1vQWyvPkJF3Yx8FoT/A7CSfeFz++8oGBxM31BLWhhGH4ZVjhe
 hbat1x818wVeyc/VCCuKy4j2mnCY3oJAjkv/vIHqLYswzrD/RrC/dgyFW/KcZjmNC83B
 dDbhAEvPPeGBlza3POaMbmOEOQJpyzyqvam8U3UR0dsijttRJZT/khf1kxzPO58xJe/c
 uUMeWjJfsET/nNZVtOBxY3aH7aOW2Zef51aN8ZXFJb50ThavZ99hA1c9fuKQSfrwVY6V
 h/Irb3DvRhDgghRt2L79Ut+xUJprux0RVp1jwb9939By1bYonipbjLK98r3Qmiv5j6vo
 ghlw==
X-Gm-Message-State: AOAM530M81EsDd8zQhhnNRnedW5kVeFHkJeINsm7aHKHlxt6fRXD1HhW
 IXz88sxFHjQKMo81THvrOiuhrA==
X-Google-Smtp-Source: ABdhPJxKPNmDwP9EEFtqx5lF/iFyMuHFvhLJJcaMzk5nL6P8j69dUYSCAKZdD2WAqPRVadD76qiq6A==
X-Received: by 2002:a17:90a:a08d:: with SMTP id
 r13mr863635pjp.191.1634756820254; 
 Wed, 20 Oct 2021 12:07:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id o6sm3431327pfp.79.2021.10.20.12.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 12:06:59 -0700 (PDT)
Subject: Re: [PATCH v3 13/21] target/riscv: support for 128-bit shift
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-14-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <63197bd9-52d1-66a1-e056-17d84ba7ec02@linaro.org>
Date: Wed, 20 Oct 2021 12:06:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-14-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 20 Oct 2021 19:07:07 -0000

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> +    } else {
> +        TCGv src1l = get_gpr(ctx, a->rs1, ext),
> +             src1h = get_gprh(ctx, a->rs1),
> +             destl = tcg_temp_new(),
> +             desth = tcg_temp_new();

Don't do this comma, reuse of type and indent thing.
I know there are several instances.

> +        if (max_len < 128) {
> +            func(destl, src1l, a->shamt);
> +            gen_set_gpr(ctx, a->rd, destl);
> +            gen_set_gprh(ctx, a->rd, desth);

You hadn't initialized desth.  Again, where gen_set_gpr and gen_set_gpr128 are clearer 
than this.

>       int olen = get_olen(ctx);
>       if (olen != TARGET_LONG_BITS) {
>           if (olen == 32) {
>               f_tl = f_32;
> -        } else {
> +        } else if (olen != 128) {
>               g_assert_not_reached();
>           }
>       }
> -    return gen_shift_imm_fn(ctx, a, ext, f_tl);
> +    return gen_shift_imm_fn(ctx, a, ext, f_tl, f_128);

Surely it would be cleaner to split out f_128 at this point, and not pass along f_128 to 
gen_shift_imm_fn?

>   static bool gen_shift(DisasContext *ctx, arg_r *a, DisasExtend ext,
> -                      void (*func)(TCGv, TCGv, TCGv))
> +                      void (*func)(TCGv, TCGv, TCGv),
> +                      void (*f128)(TCGv, TCGv, TCGv, TCGv, TCGv))
>   {
> -    TCGv dest = dest_gpr(ctx, a->rd);
> -    TCGv src1 = get_gpr(ctx, a->rs1, ext);
>       TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>       TCGv ext2 = tcg_temp_new();
>   
>       tcg_gen_andi_tl(ext2, src2, get_olen(ctx) - 1);
> -    func(dest, src1, ext2);
>   
> -    gen_set_gpr(ctx, a->rd, dest);
> +    if (get_xl_max(ctx) < MXL_RV128) {
> +        TCGv dest = dest_gpr(ctx, a->rd);
> +        TCGv src1 = get_gpr(ctx, a->rs1, ext);
> +        func(dest, src1, ext2);
> +
> +        gen_set_gpr(ctx, a->rd, dest);
> +    } else {
> +        TCGv src1l = get_gpr(ctx, a->rs1, ext),
> +             src1h = get_gprh(ctx, a->rs1),
> +             destl = tcg_temp_new(),
> +             desth = tcg_temp_new();

Should be dest_gpr*.

> +
> +        if (get_olen(ctx) < 128) {
> +            func(destl, src1l, ext2);
> +            gen_set_gpr(ctx, a->rd, destl);
> +            gen_set_gprh(ctx, a->rd, desth);
> +        } else {
> +            assert(f128 != NULL);

I think you don't want to assert, but just return false.  This will make all of the Zb 
instructions come out undefined for rv128, which is probably what you want.  You'd want to 
do that earlier, before all the get_gpr* above.

> @@ -447,9 +486,75 @@ static bool trans_sub(DisasContext *ctx, arg_sub *a)
>       return gen_arith(ctx, a, EXT_NONE, tcg_gen_sub_tl);
>   }
>   
> +enum M128_DIR {
> +    M128_LEFT,
> +    M128_RIGHT,
> +    M128_RIGHT_ARITH
> +};

Why "M"?

> +         cnst_zero = tcg_constant_tl(0);

This is ctx->zero.

Lots of instances throughout your patch set
though this is the first time I noticed.

> +    tcg_gen_setcondi_tl(TCG_COND_GEU, tmp1, arg2, 64);

You should fold this test into the movcond.

> +        tcg_gen_movi_tl(tmp, 64);
> +        tcg_gen_sub_tl(tmp, tmp, shamt);

tcg_gen_subfi_tl.

The indentation is off in gen_sll_i128.

Hmm.  3 * (and + shift + cmp + cmov) + 2 * (sub + or) = 16 ops.
Not horrible...

Let's see.

     ls = sh & 63;        1
     rs = -sh & 63;       3
     hs = sh & 64;        4

     ll = s1l << ls;      5
     h0 = s1h << ls;      6
     lr = s1l >> rs;      7
     h1 = h0 | lr;        8

     dl = hs ? 0 : ll;    10
     dh = hs ? ll : h1;   12

That seems right, and would be 4 ops smaller.
Would need testing of course.


r~

