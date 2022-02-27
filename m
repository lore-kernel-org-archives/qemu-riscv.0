Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOPQT-0007pO-Ov
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 14:41:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOPQQ-0007of-Tc
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 14:41:47 -0500
Received: from [2607:f8b0:4864:20::1036] (port=44856
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOPQO-0002uU-9h
 for qemu-riscv@nongnu.org; Sun, 27 Feb 2022 14:41:45 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so9473004pjb.3
 for <qemu-riscv@nongnu.org>; Sun, 27 Feb 2022 11:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=940MO+X4eBqW2wmHSN3ybdx3xPO6huTRezCKUkU+jx0=;
 b=zu7Kag8kLpjJXJ0We/xL+gD303hiNezUHbAkxvUkc3e0lWBWK1b3Ud7ZwBpIQTYU42
 2YsSuf9Mbc/Yjud47UMI6re1wyPn9lmZtAtSp075qzn9ENqrEeqMoy/kda/Zcm1+25Yq
 N900XyJtQs2F0sPfNVwe7/k72FXoBubvcNBM+EhoI7VbSvRh9KzTF909k5s9+6SOsuT7
 3CcVSU1nBKvyf6zsZQqBYG1NjKBDCCHmRifW/6VcsRvQWNMwnTpz/pMp0fiQMGAKoxLK
 1Qovr6ns1+G8nWT9SPipHginSgVG590Mf/Z5n2WMzqJToQlaytTA3tim0KEfW1SJIfvO
 zZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=940MO+X4eBqW2wmHSN3ybdx3xPO6huTRezCKUkU+jx0=;
 b=defPef6X32zB/lq0dUSNqi6tTgFFWHrdEHn4tIUHTMhAZQxk1xtbRQHaIQ7p8aabqn
 FAzS9DMRMd/n99Nz0zdaood3EGnJXVmY7OAoMayxf5OLPXLDrMU6xUld2dKNHrFXxsNr
 OayMkuXp30McxW2ckvluS6Ym0a2Y+1gOH4V5fmrsrbA6w8hJ95LshNa8VXQ7Gh0tLsR3
 im0dSzZmOokdfNA9VtY0AfH8Sv+Gxrck6VGETnsWRvjV/OzaNI3GkTF9BD2jCZle5yzO
 cHDrbsZ6k9efuufNX14ZPU79VbubqpEK9Kn9JqL9GOu+sym7yFGI+km2q1X4M4lEJNB/
 /0vg==
X-Gm-Message-State: AOAM532Phbs+0X8DBQH97rWnPbMK8/isEJYNdatw2yPT1M/xbVX2r2OP
 2aQAqt5cDCnBY4mRHXxwQfgQPw==
X-Google-Smtp-Source: ABdhPJyJ907JsunhMQQdjiQ0INjuaslZDpVZcgAH9tHSyTg9GB+X6QPWf1bRECc7GOwKDZfwOmdPmA==
X-Received: by 2002:a17:903:234c:b0:150:751c:434b with SMTP id
 c12-20020a170903234c00b00150751c434bmr12568076plh.22.1645990902010; 
 Sun, 27 Feb 2022 11:41:42 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:23be:43d9:7006:705a?
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a63fe57000000b0036490068f12sm8292612pgj.90.2022.02.27.11.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 11:41:41 -0800 (PST)
Message-ID: <7ee13327-b442-fca8-5618-6a32492ea027@linaro.org>
Date: Sun, 27 Feb 2022 09:41:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 11/14] target/riscv: rvk: add support for zksed/zksh
 extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-12-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220227142553.25815-12-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-List-Received-Date: Sun, 27 Feb 2022 19:41:48 -0000

On 2/27/22 04:25, Weiwei Li wrote:
>   - add sm3p0, sm3p1, sm4ed and sm4ks instructions
> 
> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/crypto_helper.c            | 49 +++++++++++++++++
>   target/riscv/helper.h                   |  6 +++
>   target/riscv/insn32.decode              |  6 +++
>   target/riscv/insn_trans/trans_rvk.c.inc | 72 +++++++++++++++++++++++++
>   4 files changed, 133 insertions(+)
> 
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
> index fd50a034a3..d712854a9c 100644
> --- a/target/riscv/crypto_helper.c
> +++ b/target/riscv/crypto_helper.c
> @@ -391,4 +391,53 @@ target_ulong HELPER(sha512sum1)(target_ulong rs1)
>       return ROR64(a, 14) ^ ROR64(a, 18) ^ ROR64(a, 41);
>   }
>   #undef ROR64
> +
> +#define ROL32(a, amt) ((a >> (-amt & 31)) | (a << (amt & 31)))
> +
> +target_ulong HELPER(sm3p0)(target_ulong rs1)
> +{
> +    uint32_t src = rs1;
> +    uint32_t result = src ^ ROL32(src, 9) ^ ROL32(src, 17);
> +
> +    return sext_xlen(result);
> +}
> +
> +target_ulong HELPER(sm3p1)(target_ulong rs1)
> +{
> +    uint32_t src = rs1;
> +    uint32_t result = src ^ ROL32(src, 15) ^ ROL32(src, 23);
> +
> +    return sext_xlen(result);
> +}
> +#undef ROL32
> +

Same comments as before, with the sticker being that you've defined ROL32 twice.

> +target_ulong HELPER(sm4ed)(target_ulong rs2, target_ulong rt, target_ulong bs)
> +{
> +    uint8_t bs_t = bs;

Why the intermediate?  And again, perhaps better to pass in shamt.

> +
> +    uint32_t sb_in = (uint8_t)(rs2 >> (8 * bs_t));
> +    uint32_t sb_out = (uint32_t)sm4_sbox[sb_in];
> +
> +    uint32_t linear = sb_out ^ (sb_out << 8) ^ (sb_out << 2) ^ (sb_out << 18) ^
> +        ((sb_out & 0x3f) << 26) ^ ((sb_out & 0xC0) << 10);
> +
> +    uint32_t rotl = (linear << (8 * bs_t)) | (linear >> (32 - 8 * bs_t));

Again, broken rotate expression.

> +target_ulong HELPER(sm4ks)(target_ulong rs2, target_ulong rs1, target_ulong bs)

Same.

> +static bool trans_sm3p0(DisasContext *ctx, arg_sm3p0 *a)
> +{
> +    REQUIRE_ZKSH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +
> +    gen_helper_sm3p0(dest, src1);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    return true;
> +}

gen_unary, etc.

> +static bool trans_sm4ks(DisasContext *ctx, arg_sm4ks *a)
> +{
> +    REQUIRE_ZKSED(ctx);
> +
> +    TCGv bs = tcg_const_tl(a->bs);
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
> +
> +    gen_helper_sm4ks(dest, src2, src1, bs);
> +    gen_set_gpr(ctx, a->rd, dest);
> +
> +    tcg_temp_free(bs);
> +    return true;
> +}

Reuse that helper you created for aes32esmi et al back in patch 6.


r~

