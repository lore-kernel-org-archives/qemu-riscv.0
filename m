Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1485AEB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 13:55:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFEZq-0000JG-03; Fri, 30 Jun 2023 09:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qFEWS-0006ZC-8X
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 09:50:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qFEWN-0007N5-KO
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 09:50:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-307d20548adso2163624f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688133043; x=1690725043;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GeP/byp38OpUiqSNZCHCnsGfeTkOvL+izLKxOwhNKo0=;
 b=wwcZPSpvDR87G3b4hFFxeqB6jkqsZ/QldJlsMSGGM2fCSt+M3jaDwJahYSCNQNgUrI
 wrn8iJzVDeUWQGvc3qJK13UL1bxfdkmO0ubU6OSsEpwN6GQBpcdyUm6P0LFvDLzfBVVT
 JAxLjaarIpQqMR3YxA0Mn2FPAstIfxs4X87zkQCReKGikYkLGpOjIoU7n3DoNEld+k2x
 4pAEdQ3l3P9iCf/NPXnNoaCo+xakLXgY5faBgr3yU0JTcgISZcj2uIed3ODsntyC3RTm
 MSoz/faaLGIuM4rIYByYr07aTj9fqaKKkPUI7yM4UBqnmbVZE0N9kw5YUzriiFCi3RLH
 9WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688133043; x=1690725043;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GeP/byp38OpUiqSNZCHCnsGfeTkOvL+izLKxOwhNKo0=;
 b=AxsTAusPQFJy5OCo7hTMuzwkyDe1qWuEWbSGafF2eBTEMbZiwUZ+bF2aTib8zcEB78
 TqoMi/cMSJKGzkGTZzJ8yvw6Q3lJpifvy+dLImMAUd1NZNpltTuTgizk41ODtfGJHDGm
 C/x83PBlrcubMOj2gEmntYFg9yICKQVCfaUtFBPFsW7GAtFuoVxqExnrpxh+TjmlNm4e
 3Np7uOuwOCjsx8kUuhjAA2EoueqlV46sX2aTjdjj8H8MMslGigfr67FJdnwPcRrWy7H7
 mUfjc18Njr6/G/pAiVDK+ilxxA0MfCSzC3GBPixLa2ThSoRZWmzfFeVE13UxVDvwkdxU
 OSsg==
X-Gm-Message-State: ABy/qLYGMcznvndXywEZXpWPyPdDjZ5yqgfX2SG+13V93vTY77TBIjyB
 cc6pW6BZifyTM0339yuBQUh1aQ==
X-Google-Smtp-Source: APBJJlFgdvP7SZ3nI9CPIBgHoncECd8GNcSz8O6TFDg6bfkcYzU9eenMvVss3lh//TbmX04KAm7ulw==
X-Received: by 2002:a5d:6e56:0:b0:313:f33c:24c4 with SMTP id
 j22-20020a5d6e56000000b00313f33c24c4mr2176697wrz.39.1688133043584; 
 Fri, 30 Jun 2023 06:50:43 -0700 (PDT)
Received: from [192.168.1.208] ([139.47.41.96])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a5d4ec6000000b0030ae849c70csm18299953wrv.37.2023.06.30.06.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 06:50:43 -0700 (PDT)
Message-ID: <1c1a1c63-ed99-807c-7f21-b41a8a61b69c@linaro.org>
Date: Fri, 30 Jun 2023 15:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5] riscv: Add support for the Zfa extension
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>,
 liweiwei@iscas.ac.cn, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Rob Bradford <rbradford@rivosinc.com>
References: <20230630115239.1920012-1-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230630115239.1920012-1-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 6/30/23 13:52, Christoph Muellner wrote:
> +bool trans_fmvp_d_x(DisasContext *ctx, arg_fmvp_d_x *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_32BIT(ctx);
> +
> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_ZERO);
> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_ZERO);
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +    TCGv_i64 t2 = tcg_temp_new_i64();
> +
> +    tcg_gen_ext_tl_i64(t1, src1);
> +    tcg_gen_ext_tl_i64(t2, src2);
> +    tcg_gen_shli_i64(t2, t2, 32);
> +    tcg_gen_or_i64(t2, t2, t1);
> +    tcg_gen_mov_i64(cpu_fpr[a->rd], t2);

This isn't right, because tcg_gen_ext_tl_i64 does signed extension.

But this whole operation is

     tcg_gen_concat_tl_i64(cpu_fpr[a->rd], src1, src2);

(which isn't a great name, but chosen long ago).

You can also use EXT_NONE, since we'll be discarding the upper bits.


r~

