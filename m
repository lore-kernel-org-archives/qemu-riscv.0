Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhvyC-00064D-9V
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 11:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhvy7-0005tu-CN
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 11:44:59 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:44609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhvy4-0002yX-M1
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 11:44:59 -0400
Received: by mail-qt1-x835.google.com with SMTP id j1so12004761qtq.11
 for <qemu-riscv@nongnu.org>; Tue, 02 Nov 2021 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dna/UH4yg89my5SsQkkPpca8BrkzXNFTI/oIwKQLjBU=;
 b=cY9ZEriJpfQrcElN/HX++JiLgLgt9ztNdUQLpm3As5yu2dV6wq0icYJ7Rv4Cxe/bUX
 2h4bqqzlCtgqd/dIqXtwMZXxUFJNAMem8LPKn0fddYDa3uP3FUgi8WFAbq6rESjbPkhI
 tNtGhNv4kU6fWOGOBDL5bzQIikIw7WHnyC18NnlUxIWRp/YsWOeBKOP5Ie90hA5CQ5xS
 DFziGpwtM+wGaD+EIoIG+ZjPtbomc1T78ylkc6J1DaLvWa0uEjjzpaLSEE5k7qjgsCLf
 kVUjjKiUs4D2zbPvQfcObYD+gK4uLKB1NgyuFGpKq1fA2I9UiL57eEJwuVk/ofJ4mDTL
 S1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dna/UH4yg89my5SsQkkPpca8BrkzXNFTI/oIwKQLjBU=;
 b=zjGMsnZy9rNwuPx0WrVihJ2L5H1XTFglsnZwGH4GyrSIOnofkKchgAzMSSPDUNBI3x
 yigtopoyUuLswo5NwroX5dH8CYGc3nM5jjdz/4CmRN8wdw9YH6FCP4P0LIP/nC9XXbIY
 HJzeKRltqKtwnwzvxKh2p2Cfd2KW81CQqGFHIuCGq2Kw36ZH+eY4CEP6J+vWKPfPS1yP
 hv3g1HnWa79S8HoqY/RMgg2NJ4qJhPMq6pZ0I3xAWhsuUanHpu+Ir7SklG3km5By7VTo
 TgK3P75M3LDSKkdmaUC0m0Jg1Ary+iyI/vWcOV96el9wPDppTrqBw6HCOmZSOVpFGYTU
 mfYg==
X-Gm-Message-State: AOAM532BZ1PbZwYNU/6ZQW8rfA++2OVQd/e0BjA2e3nNoMrCyXX7s7Ux
 1vVqEOTGE1lOGQ5INgItoe/E3Q==
X-Google-Smtp-Source: ABdhPJzFAly6i05tDQoaCmIQ4EbU/t3UlL1J9UYrevMWMhKziW5qNLUYdOcUggOurys/hhBh+0pAKw==
X-Received: by 2002:ac8:7d89:: with SMTP id c9mr29660413qtd.88.1635867895502; 
 Tue, 02 Nov 2021 08:44:55 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id d18sm2569175qtb.70.2021.11.02.08.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 08:44:55 -0700 (PDT)
Subject: Re: [RFC 2/6] target/riscv: rvk: add implementation of instructions
 for Zbk* - reuse partial instructions of Zbb/Zbc extensions - add brev8
 packh, unzip, zip, etc.
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
 <20211102031128.17296-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5523b929-316e-a119-af1a-2a4aba4ee86d@linaro.org>
Date: Tue, 2 Nov 2021 11:44:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102031128.17296-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 02 Nov 2021 15:44:59 -0000

On 11/1/21 11:11 PM, liweiwei wrote:
> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>

You managed to get the whole patch description into the subject line.
Please break it up.

> +target_ulong HELPER(grev)(target_ulong rs1, target_ulong rs2)
> +{
> +    return do_grev(rs1, rs2, TARGET_LONG_BITS);
> +}

Are we expecting to see the full grev instruction at any point?  If not, we can certainly 
implement Zbk with a simpler implementation.

> +target_ulong HELPER(xperm)(target_ulong rs1, target_ulong rs2, uint32_t sz_log2)
> +{
> +    target_ulong r = 0;
> +    target_ulong sz = 1LL << sz_log2;
> +    target_ulong mask = (1LL << sz) - 1;
> +    for (int i = 0; i < TARGET_LONG_BITS; i += sz) {
> +        target_ulong pos = ((rs2 >> i) & mask) << sz_log2;
> +        if (pos < sizeof(target_ulong) * 8) {
> +            r |= ((rs1 >> pos) & mask) << i;
> +        }
> +    }
> +    return r;
> +}

This could become a static inline do_xperm, and provide two specific xperm4 and xperm8 
helpers; the compiler would fold all of the sz_log2 stuff into a more efficient 
implementation.

> +target_ulong HELPER(unshfl)(target_ulong rs1,
> +                            target_ulong rs2)
> +{
> +    target_ulong x = rs1;
> +    int i, shift;
> +    int bits = TARGET_LONG_BITS >> 1;
> +    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
> +        if (rs2 & shift) {
> +            x = do_shuf_stage(x, shuf_masks[i], shuf_masks[i] >> shift, shift);
> +        }
> +    }
> +    return x;
> +}
> +
> +target_ulong HELPER(shfl)(target_ulong rs1,
> +                          target_ulong rs2)
> +{
> +    target_ulong x = rs1;
> +    int i, shift;
> +    shift = TARGET_LONG_BITS >> 2;
> +    i = (shift == 8) ? 3 : 4;
> +    for (; i >= 0; i--, shift >>= 1) {
> +        if (rs2 & shift) {
> +            x = do_shuf_stage(x, shuf_masks[i], shuf_masks[i] >> shift, shift);
> +        }
> +    }
> +    return x;
> +}

Similar comment as for grev.

> +# The encoding for zext.h differs between RV32 and RV64.
> +# zext_h_32 denotes the RV32 variant.
> +{
> +  zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
> +  pack       0000100 ..... ..... 100 ..... 0110011 @r
> +}

Note to self: improve tcg_gen_deposit to notice zeros, so that the more general pack 
compiles to zero-extension.

> @@ -556,6 +563,81 @@ static bool gen_unary_per_ol(DisasContext *ctx, arg_r2 *a, DisasExtend ext,
>       return gen_unary(ctx, a, ext, f_tl);
>   }
>   
> +static bool gen_xperm(DisasContext *ctx, arg_r *a, int32_t size)
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    TCGv_i32 sz = tcg_const_i32(size);
> +    gen_helper_xperm(dest, src1, src2, sz);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +    tcg_temp_free_i32(sz);
> +    return true;
> +}
> +
> +static bool gen_grevi(DisasContext *ctx, arg_r2 *a, int shamt)
> +{
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    if (shamt == (TARGET_LONG_BITS - 8)) {
> +        /* rev8, byte swaps */
> +        tcg_gen_bswap_tl(dest, src1);
> +    } else {
> +        TCGv src2 = tcg_temp_new();
> +        tcg_gen_movi_tl(src2, shamt);
> +        gen_helper_grev(dest, src1, src2);
> +        tcg_temp_free(src2);
> +    }
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
> +static void gen_pack(TCGv ret, TCGv src1, TCGv src2)
> +{
> +    tcg_gen_deposit_tl(ret, src1, src2,
> +                       TARGET_LONG_BITS / 2,
> +                       TARGET_LONG_BITS / 2);
> +}
> +
> +static void gen_packh(TCGv ret, TCGv src1, TCGv src2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_ext8u_tl(t, src2);
> +    tcg_gen_deposit_tl(ret, src1, t, 8, TARGET_LONG_BITS - 8);
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_ext16s_tl(t, src2);
> +    tcg_gen_deposit_tl(ret, src1, t, 16, 48);
> +    tcg_temp_free(t);
> +}
> +
> +static bool gen_shufi(DisasContext *ctx, arg_r2 *a, int shamt,
> +                       void(*func)(TCGv, TCGv, TCGv))
> +{
> +    if (shamt >= TARGET_LONG_BITS / 2) {
> +        return false;
> +    }
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = tcg_temp_new();
> +
> +    tcg_gen_movi_tl(src2, shamt);
> +    (*func)(dest, src1, src2);
> +
> +    gen_set_gpr(ctx, a->rd, dest);
> +    tcg_temp_free(src2);
> +    return true;
> +}

All of the gen functions belong in insn_trans/trans_rvb.c.inc.


r~

