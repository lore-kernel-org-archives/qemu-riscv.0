Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3om7-0003bB-Qc
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 18:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3om6-0003ae-B7
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 18:54:14 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:33126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3om4-0007K1-Ei
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 18:54:13 -0400
Received: by mail-pj1-x1041.google.com with SMTP id i92so5351039pje.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 15:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oAtsgfErucMWr9Qd+UivYtdHC9uYMXfeC05waK5hHTI=;
 b=TtDpwqWx0b/z25JnoHOvuO+ggrjyj2XNtM0z5lMJVpB2qI6DcgU40GFbz+uw8/75Lk
 L8oBZbzqeAfZXqBG13v9DZQkwEGXJjYGjGwvctcKqHF/DXG9EzfrkQ7ftMWB1gQAaZQI
 NRf7B+c8+a26IPBcidLAjeMjc2h8lMa39aqUuKRihtEPAjTmTpvJCAHBc6ltgI1Pe6vC
 twPz5blk63L4ONxnaU96cVuNzcjC8AvUsNse/HN9oxEf9u5Kex4kLl8a+n+xrPUvyqIm
 gvi6cT123MZkEP98kSv1RfAZEd78R87bn8F+xG1BD1Y2ajesqsYr/gxqiC1rTOo3AgBc
 WuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oAtsgfErucMWr9Qd+UivYtdHC9uYMXfeC05waK5hHTI=;
 b=uB03Dsfyk2NqgfPzEqOAxaz9/lGnevjkmKJzEgi7ZvswKVRP7kntZxYc7xwAsq2GJK
 3bosjvVv4uaTVBBVDZjytbVF6H+NOkgIMAV3IKHkTSZjCKOWO0NvLeIg250TLYjqn7Oh
 f16vJdYerk1Uvx41HCwXUyf06n3+c6p15NZBkkmsO0v3po0f59cCnXHkwTmc7yv4W0cQ
 fg7+W+elR/8eqLtRPLto4LIpkeHxb/e6SYqfkTfn9LreNDpt8mnZpDCM6PKyVCGtO6g3
 fI4GfHXMAuTf+z15kC3JeDXWxnozgR8+AARU99RvZAegStpKE6aTotT13no2AMg7NIZs
 sKSQ==
X-Gm-Message-State: AOAM533/F+aYsOckn2TvAxgnsvWDA5BINhtwEBwNH53dyD9Zs2Xzf9xH
 KCiJSYQlOZWfbTkL+mZ0sIRSKQ==
X-Google-Smtp-Source: ABdhPJxsXHfC7UDAyAhpBww+Of1+rbQrasFytnt1E7fCEedA1VYMPaK8oO+Cb+viH6z4JibujiqVBQ==
X-Received: by 2002:a17:902:246:: with SMTP id 64mr9820513plc.70.1596754450510; 
 Thu, 06 Aug 2020 15:54:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b25sm9497672pft.134.2020.08.06.15.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 15:54:09 -0700 (PDT)
Subject: Re: [RFC v3 15/71] target/riscv: introduce more imm value modes in
 translator functions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-16-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e5426634-26f6-cc43-cf23-5fffc49ff2b8@linaro.org>
Date: Thu, 6 Aug 2020 15:54:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-16-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 06 Aug 2020 22:54:14 -0000

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Immediate value in translator function is extended not only
> zero-extended and sign-extended but with more modes to be applicable
> with multiple formats of vector instructions.
> 
> * IMM_ZX:         Zero-extended
> * IMM_SX:         Sign-extended
> * IMM_TRUNC_SEW:  Truncate to log(SEW) bit
> * IMM_TRUNC_2SEW: Truncate to log(2*SEW) bit
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 115 ++++++++++++++----------
>  1 file changed, 66 insertions(+), 49 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
> index c2d0865bb9b..0a4dd875e96 100644
> --- a/target/riscv/insn_trans/trans_rvv.inc.c
> +++ b/target/riscv/insn_trans/trans_rvv.inc.c
> @@ -1281,8 +1281,32 @@ static void tcg_gen_gvec_rsubs(unsigned vece, uint32_t dofs, uint32_t aofs,
>  
>  GEN_OPIVX_GVEC_TRANS(vrsub_vx, rsubs)
>  
> +enum {
> +    IMM_ZX,         /* Zero-extended */
> +    IMM_SX,         /* Sign-extended */
> +    IMM_TRUNC_SEW,  /* Truncate to log(SEW) bits */
> +    IMM_TRUNC_2SEW, /* Truncate to log(2*SEW) bits */
> +};

Better to name the enumeration and use it...

> +
> +static int64_t extract_imm(DisasContext *s, uint32_t imm, int imm_mode)

... here.

> +{
> +    switch (imm_mode) {
> +    case IMM_ZX:
> +        return extract64(imm, 0, 5);
> +    case IMM_SX:
> +        return sextract64(imm, 0, 5);
> +    case IMM_TRUNC_SEW:
> +        return extract64(imm, 0, 5) & ((1 << (s->sew + 3)) - 1);
> +    case IMM_TRUNC_2SEW:
> +        return extract64(imm, 0, 5) & ((2 << (s->sew + 3)) - 1);

The extract is redundant with the &.

Alternately, put sew into the extract, like so:

    return extract64(imm, 0, s->sew + 3);
and
    return extract64(imm, 0, s->sew + 4);


> +    default:
> +        g_assert_not_reached();
> +        break;

Unreachable break.

>  static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
> -                        gen_helper_opivx *fn, DisasContext *s, int zx)
> +                        gen_helper_opivx *fn, DisasContext *s, int imm_mode)

Use the enum.

>  static inline bool
>  do_opivi_gvec(DisasContext *s, arg_rmrr *a, GVecGen2iFn *gvec_fn,
> -              gen_helper_opivx *fn, int zx)
> +              gen_helper_opivx *fn, int imm_mode)

Use the enum.


r~

