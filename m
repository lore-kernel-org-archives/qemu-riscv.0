Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC72E-0005fg-7l
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC72C-0005fX-5e
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:01:08 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC728-0005Yb-Mg
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:01:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id y6so1198630plk.10
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WbPHQTTjvMsStxrMck/05mmh2y41CDjoNrc1NEqLsDk=;
 b=F0NZ/ubK+Sh66Q/Fwq8Wx5UUG5UptwfGOF31qnUT/zveF0Ru2UNhcyd0xvG424lB1A
 pH2LiHW2kKCkFshOP3Nvz/3zX2I9mptWzFB5cp061gzPXUJEbaON28ArOYDjjcYRskpG
 Aamp5sQuHBn8rhvApz1l0jJ04vwd5w4c7K1Clf0GhYqdbiUIIBOmXSLqX9XIG9wU7LfN
 qQApQ9GVqVcycAGfp33ACR622QRfo98NlCmBpJjyXU5tD0wHbsDXa5vXXl4dosddBHKH
 tXyQ8CHX3XBdV7POPGCCKjMeeFnwkhC/nU1+dLfwBGf4orecnwyIuKc08YO9oxLc4TAL
 Q0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WbPHQTTjvMsStxrMck/05mmh2y41CDjoNrc1NEqLsDk=;
 b=JeLg2NShq1vJ1jDOBi7X76/4YJtrlSesiSrVi+cCuA20Dr4pxUKQ4HU6H1KksDBrcP
 8Tw4LiqeuHHgO8IJzG3V+Kpihe+csanreG8KUfRdjhtIPKDG4oNVsMTB2PYkJuVhP5Nv
 lBDtUgs/FKSGkoYKdo8gOX7qC8YOBXGgoQ6IUv3zOf7zVwn83IgLdytQe8W6YQw9ZVKw
 WSTOMmurqSEU3eshZB5FM7ALc+I69DZMD1wQLKmEeJfz54cbyGldPHtgL1p2WaAdb0kD
 Hy6aixLC+ly2KGxO4Fuws7d0y5JeCx/wWkzIWpJw/BgX8dilqPlpC4CtVvWv2EoBKyOV
 kTcg==
X-Gm-Message-State: AOAM533TMMvgQcuTEnrrW/2szi/pkbR3IL+1i547uQl4u699nTZJvkq4
 codMw3g84F2VIDyCUhGVcQi6sQ==
X-Google-Smtp-Source: ABdhPJy+5FMMdSyy7rB0WdUYjsKJDduA+UQ4LSuJjwidHZYgLummJ2aogv1JJfoBHIdYBIcZ1jmRTQ==
X-Received: by 2002:a17:90b:4d06:: with SMTP id
 mw6mr4204416pjb.226.1598731262048; 
 Sat, 29 Aug 2020 13:01:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w6sm3055589pgr.82.2020.08.29.13.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:01:01 -0700 (PDT)
Subject: Re: [RFC v4 36/70] target/riscv: rvv-1.0: floating-point move
 instruction
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-37-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8976125-e692-cf9e-5d23-e1e48f6ea72d@linaro.org>
Date: Sat, 29 Aug 2020 13:00:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-37-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 20:01:08 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
>  static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
>  {
>      if (require_rvv(s) &&
> +        has_ext(s, RVF) &&
>          vext_check_isa_ill(s) &&
>          require_align(a->rd, 1 << s->lmul) &&
>          (s->sew != 0)) {
> +        TCGv_i64 t1 = tcg_temp_local_new_i64();
> +        /* NaN-box f[rs1] */
> +        do_nanbox(s, t1, cpu_fpr[a->rs1]);

Don't you need to check

  s->sew == MO_64 ? has_ext(s, RVD) : has_ext(s, RVF)

?

It might be worth folding that into it's own helper function, which also
incorporates the s->sew != 0 check.  E.g.

static bool require_rvf(Disascontext *s)
{
    switch (s->sew) {
    case MO_16:
    case MO_32:
        return has_ext(s, RVF);
    case MO_64:
        return has_ext(s, RVD);
    default:
        return false;
    }
}

> +        TCGv_i64 t1 = tcg_temp_local_new_i64();
> +        /* NaN-box f[rs1] */
> +        do_nanbox(s, t1, cpu_fpr[a->rs1]);
> +
>          if (s->vl_eq_vlmax) {
>              tcg_gen_gvec_dup_i64(s->sew, vreg_ofs(s, a->rd),
> -                                 MAXSZ(s), MAXSZ(s), cpu_fpr[a->rs1]);
> +                                 MAXSZ(s), MAXSZ(s), t1);
>              mark_vs_dirty(s);
>          } else {
>              TCGv_ptr dest;

Recall that local temps get written to the stack at branches.

You should avoid the local temp by computing do_nanbox on both arms of this IF.
 In the else branch, do_nanbox should be after the brcond.


r~

