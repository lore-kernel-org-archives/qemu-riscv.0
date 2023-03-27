Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgqU8-0001xu-CN
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 13:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgqU3-0001xH-6f
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 13:18:18 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgqU1-0008QG-HI
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 13:18:14 -0400
Received: by mail-pl1-x630.google.com with SMTP id k2so9075083pll.8
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679937488;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dwx3UmJ/5Z+3rNirob01JQiB4B+Cln0ebYrYuadPQYk=;
 b=QG4SlZHhdS+NieP6D2zp3x8gITVlFjwMR/CqxDyq1Zql2qFatAa/xrPiU/qNhKPCJc
 Qkq+B8u3ir6PGD766lKdQ/KtGUCapKO/tS8EqYyBaEvfp6TFht12tyAsWAVbl/P2+WlV
 z6y2j2LZRuMVWJ1/Baq1xACHB84AeO2vahrV4E93FtAI50PJ0zDArZMIBK5Nm2W8Fu/U
 5ErQitAzvSjHqcGiZj0cN2afKndmlbOo73NAIZfzKdRLVRz7QN90gpBpYzreY9aIxp5J
 wnWVJPeNolV+WXI1D404IVzGFkq62NQgAaYNytH2N+QarHWneTeTbT38fkXLQO0dMMZx
 jH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679937488;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dwx3UmJ/5Z+3rNirob01JQiB4B+Cln0ebYrYuadPQYk=;
 b=bosJUjIn+H4hESycAgwMNUSeojVyaI1DbJvUvvc9i6qwri1lY2J3q/TYuDberE0Sgy
 05BD4WJilwz2EBcvzeV5/Y7LEEAYtzfPCy6uA8X2WESrFSr6iv3n1vIbkCcEtnI2BtC0
 t5oc9+tMhcCJROjTf/A5iiu30q3WBktTpvexHlP0nakjKmta8pYk2KQxC9GZfnZPGOwl
 mbh2hzueCuj08l8CpX8n89sFKZ6oBjfzu+NhulY7xY7DUEX6dt8G8CnLOtkSXHgVHY2Q
 OIHJeFgvyJBLgOHjPTOul0E4vs2MWZcM9+skZiyEAPXmZ694/AWY4+BAkIkT+Hm/jfph
 cHOQ==
X-Gm-Message-State: AO0yUKWbCfmmQ/Mu6RDQmdjK5bVw2xOzSDWR0kg6DAoWl3nfWXQxR4W6
 By/RnJRzEtmwJvZblBD6W+PnAw==
X-Google-Smtp-Source: AK7set8WNbBoQ+TD2+FIl4LkcDDQsadrjlel1WSq08nunLHFTm20RpQf7Cb4MaK2DnwifnBcAHC9zg==
X-Received: by 2002:a05:6a20:4d90:b0:d6:c9e2:17a1 with SMTP id
 gj16-20020a056a204d9000b000d6c9e217a1mr10229988pzb.62.1679937488056; 
 Mon, 27 Mar 2023 10:18:08 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa785d1000000b005a8c92f7c27sm19257021pfn.212.2023.03.27.10.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 10:18:07 -0700 (PDT)
Message-ID: <b02cc37d-8a51-fed3-5a93-4d9f3873b5ae@linaro.org>
Date: Mon, 27 Mar 2023 10:18:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] riscv: Add support for the Zfa extension
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230327080026.3266574-1-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230327080026.3266574-1-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Mar 2023 17:18:18 -0000

On 3/27/23 01:00, Christoph Muellner wrote:
> +uint64_t helper_fminm_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
> +{
> +    float32 frs1 = check_nanbox_s(env, rs1);
> +    float32 frs2 = check_nanbox_s(env, rs2);
> +
> +    if (float32_is_any_nan(frs1) || float32_is_any_nan(frs2)) {
> +        return float32_default_nan(&env->fp_status);
> +    }
> +
> +    return nanbox_s(env, float32_minimum_number(frs1, frs2, &env->fp_status));
> +}

Better to set and clear fp_status->default_nan_mode around the operation.

> +uint64_t helper_fround_s(CPURISCVState *env, uint64_t frs1)
> +{
> +    if (float32_is_zero(frs1) ||
> +        float32_is_infinity(frs1)) {
> +        return frs1;
> +    }
> +
> +    if (float32_is_any_nan(frs1)) {
> +        riscv_cpu_set_fflags(env, FPEXC_NV);
> +        return frs1;
> +    }
> +
> +    int32_t tmp = float32_to_int32(frs1, &env->fp_status);
> +    return nanbox_s(env, int32_to_float32(tmp, &env->fp_status));
> +}

Very much incorrect, since int32_t does not have the range for the intermediate result. 
In any case, the function you want is float32_round_to_int, which eliminates the 
zero/inf/nan special cases.  It will raise inexact, so perfect for froundnx, but you'll 
need to save/restore float_flag_inexact around the function.

> +uint64_t helper_fli_s(CPURISCVState *env, uint32_t rs1)
> +{
> +    const uint32_t fli_s_table[] = {

static const.  You don't need to use float32_default_nan, use the correct architected 
constant.  This entire operation should be done at translation time.

> +target_ulong helper_fcvtmod_w_d(CPURISCVState *env, uint64_t frs1)
> +{
> +    if (float64_is_any_nan(frs1) ||
> +        float64_is_infinity(frs1)) {
> +        return 0;
> +    }
> +
> +    return float64_to_int32(frs1, &env->fp_status);
> +}

Incorrect, as float64_to_int32 will saturate the result, whereas you need the modular result.

There is code to do the conversion mod 2**64 in target/alpha/ (do_cvttq).  We should move 
this to generic code if it is to be used by more than one target.

> +bool trans_fmvp_d_x(DisasContext *ctx, arg_fmvp_d_x *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_32BIT(ctx);
> +
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +
> +    tcg_gen_extu_tl_i64(t1, src1);
> +    tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd], t1, 32, 32);
> +    mark_fs_dirty(ctx);
> +    return true;
> +}

This does not match the linked document, which says that this insn has two inputs and sets 
the complete fpr.


r~

