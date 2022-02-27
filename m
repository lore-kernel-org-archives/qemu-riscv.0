Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOOzY-0003GE-MA
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 14:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOzW-0003Ed-Mc
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 14:13:58 -0500
Received: from [2607:f8b0:4864:20::430] (port=45589
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOzU-0002Ef-OE
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 14:13:58 -0500
Received: by mail-pf1-x430.google.com with SMTP id u16so9124053pfg.12
 for <qemu-riscv@nongnu.org>; Sun, 27 Feb 2022 11:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J9XL3HfMJdeUWgEbOUz+unwr/MNeOgMTuI8TYIt9nLI=;
 b=y9UGG3OTogczvdj4VPYdn6EaeZQJzLEjkMChi1DGpGaTrRNCQAk4WyXPupdPRGoRfM
 M7OTn/d3MmCPy5J6FV3NIQA0ewXy5jdGc/r20hjdRfuke+1/ny9zHI+KlWcsvqCjEJC7
 VAUqpdU+HyRuWVc2VxqW4oZDnkRq2PXMReAGhULjMqi/9f3kgVVEtmxNb7tyqZYDQ/sL
 MytjsmzbzaUvFYAafxkb0yJXCvDTUeTkwy5ejbUiyZJNrSR7xFuCDSMMoAE0fq0+cIqd
 bvc2nfqn7tlIxCJ8L4A5SNIY0x+Pkj3qgPYH8VUTVrK8BroTTjrfB8rmeAQLgE0T4h3I
 rDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J9XL3HfMJdeUWgEbOUz+unwr/MNeOgMTuI8TYIt9nLI=;
 b=Dy0ajg5BLGuugqwp7vQB08JDhCSMNuyL11+rKEOENbfnzF0ESItXgB4y+nU+Af4xnZ
 y023YGCy5jL4rKKC68Ie1RJP0tJYTFTJgVRBhRXIGI0BfxdAVS8go53JwPvLuF45GqUi
 fJ1rgQ88WGyPRHXQw8TlXgawCo2M366hSFOBD73cHAWu6tt3W1mkt+bRIw+KrJZF0axS
 1l4gEob4bM3PG+a6+OWOEZaxGPrZD0P1WacwmvfVhqdnGhb/OvnD8cUIdoBTzr62ib4k
 TJAT6D7NkrLjIDFnUXuUwZQh7MNX7V3dfTjI0uVgwLwp6D5BKbbLWur2ANwcXstZnEXZ
 p1HQ==
X-Gm-Message-State: AOAM5331PEs5OFN4pPBMyE7DMUopjjk8l8Nj9TESN/7Rs9DTamn80UoQ
 ochBsYCkzQ44PDlXch9qtPCfkA==
X-Google-Smtp-Source: ABdhPJzNQo0x0cCGpXpaNY9qcBJyl9rH1JIVlTsVPHeP7Bpr1Ha8ItZhTguMwdrOb52GPoA5T9XAvw==
X-Received: by 2002:a63:e42:0:b0:374:7dae:aa98 with SMTP id
 2-20020a630e42000000b003747daeaa98mr14127167pgo.586.1645989235328; 
 Sun, 27 Feb 2022 11:13:55 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:23be:43d9:7006:705a?
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm10993140pfu.62.2022.02.27.11.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 11:13:54 -0800 (PST)
Message-ID: <7dcdb5fc-b440-e3f8-36d0-774865b7bf01@linaro.org>
Date: Sun, 27 Feb 2022 09:13:51 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 07/14] target/riscv: rvk: add support for zkne/zknd
 extension in RV64
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-8-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220227142553.25815-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 27 Feb 2022 19:13:58 -0000

On 2/27/22 04:25, Weiwei Li wrote:
>   - add aes64dsm, aes64ds, aes64im, aes64es, aes64esm, aes64ks2, aes64ks1i instructions
> 
> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/crypto_helper.c            | 136 ++++++++++++++++++++++++
>   target/riscv/helper.h                   |   8 ++
>   target/riscv/insn32.decode              |  11 ++
>   target/riscv/insn_trans/trans_rvk.c.inc | 102 ++++++++++++++++++
>   4 files changed, 257 insertions(+)
> 
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
> index f5a5909538..9e56668627 100644
> --- a/target/riscv/crypto_helper.c
> +++ b/target/riscv/crypto_helper.c
> @@ -136,4 +136,140 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
>   {
>       return aes32_operation(bs, rs1, rs2, false, false);
>   }
> +
> +static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
> +                                           bool enc, bool mix)
> +{
> +    uint64_t RS1 = rs1;
> +    uint64_t RS2 = rs2;
> +    uint64_t result;
> +    uint64_t temp;
> +    uint32_t col_0;
> +    uint32_t col_1;
> +
> +    if (enc) {
> +        temp = AES_SHIFROWS_LO(RS1, RS2);

Ah, those unused macros get used, and with the right type.

> +target_ulong HELPER(aes64ks1i)(target_ulong rs1, target_ulong rnum)
> +{
> +    uint64_t RS1 = rs1;
> +    uint8_t round_consts[10] = {
> +        0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
> +    };

static const.

> +        temp = (temp >> 8) | (temp << 24); /* Rotate right by 8 */

rol32

> +DEF_HELPER_2(aes64esm, tl, tl, tl)
> +DEF_HELPER_2(aes64es, tl, tl, tl)
> +DEF_HELPER_2(aes64ds, tl, tl, tl)
> +DEF_HELPER_2(aes64dsm, tl, tl, tl)
> +DEF_HELPER_2(aes64ks2, tl, tl, tl)
> +DEF_HELPER_2(aes64ks1i, tl, tl, tl)
> +DEF_HELPER_1(aes64im, tl, tl)

DEF_HELPER_FLAGS.

> +%rnum      20:4
...
> +aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 %rnum %rs1 %rd

It is much better to put the field where it belongs,
especially for a one-off like this.

aes64ks1i   00 11000 1 rnum:4 rs1:5 001 rd:5 0010011

The whole of riscv needs a cleanup on this point.


> +static bool trans_aes64esm(DisasContext *ctx, arg_aes64esm *a)
> +{
> +    REQUIRE_ZKNE(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    gen_helper_aes64esm(dest, src1, src2);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}
...
> +static bool trans_aes64es(DisasContext *ctx, arg_aes64es *a)
> +{
> +    REQUIRE_ZKNE(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    gen_helper_aes64es(dest, src1, src2);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}

gen_arith.

> +static bool trans_aes64dsm(DisasContext *ctx, arg_aes64dsm *a)
> +static bool trans_aes64ks2(DisasContext *ctx, arg_aes64ks2 *a)
> +static bool trans_aes64ds(DisasContext *ctx, arg_aes64ds *a)

Likewise.

> +static bool trans_aes64ks1i(DisasContext *ctx, arg_aes64ks1i *a)
> +{
> +    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
> +
> +    if (a->rnum > 0xA) {
> +        return false;
> +    }
> +
> +    TCGv rnum = tcg_const_tl(a->rnum);
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    gen_helper_aes64ks1i(dest, src1, rnum);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    tcg_temp_free(rnum);
> +    return true;
> +}

tcg_constant_tl.

> +
> +static bool trans_aes64im(DisasContext *ctx, arg_aes64im *a)
> +{
> +    REQUIRE_ZKND(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    gen_helper_aes64im(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}

gen_unary.


r~

