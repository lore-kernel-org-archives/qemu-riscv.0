Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C762EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 14:03:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFEiZ-00027x-Q3; Fri, 30 Jun 2023 10:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qFEiY-00027M-6i
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 10:03:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qFEiV-0004ZN-Fo
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 10:03:21 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31297125334so1724593f8f.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688133798; x=1690725798;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JjOovlwcCV2yDttkbGy8I5PveRSxsCy1Ojfp3YMRiVA=;
 b=tLQJmH2k0lVeETIzcsDrYttzf4XASVEVWqhBjPQLQaKk1fCqyGdvwRcZX0SzhrN+Jc
 BUnAxPAV6rDulyxObcq4xMKwkMznUrcIJnKWF9vl1/wfa9OhIzptb4UFeGzu3cbPU8pZ
 dhzosIw+5HmB2nMfnxdKJ4UB4r3tFkw6aNWXRIbz/+EkJY3Ub7j0oEJCfPcdbN3N9Zz2
 npjsyKZoShGcegkt4Z/bYW5btmuFi+w1IIhPTZaaetRrMRzvJV+gnejXBPs5VDZV4Pyc
 NOBQcKlo5vaF9iIYSHlpeyM9f6Wa+/KDXt5XFZOgy3SVhtZup72N9EgmOBSD3ccVjkSO
 kTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688133798; x=1690725798;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JjOovlwcCV2yDttkbGy8I5PveRSxsCy1Ojfp3YMRiVA=;
 b=Re7cC9Q6j9vupzlGC4Ea98zAXp1E70xN2gJ5Mzsqu+5OSwQ+aqGzkFHT6sTGuZiAE5
 mAuOnqGCJqUE0JJuAip4rulC43NOhGUj+RRSnx8GQD9++Gq+EAe3rrvG9BHcPq5apOBq
 UD3bAwBbFdSYXdVLdXI6SF9WstFVfG/qwOw+o/Bz4V1vca7xoOfHRtPYNw2VTmjCEiAf
 qBy93GWnFQlzWJ0Uw/F3j2HwhmpB7K0Ao5Xy344+TBP+0YGmvcO4hqRlNIYirPe97X4l
 e92itHkNqoniMx9BljquRr3lYRo9wxt7UWyu5fvLt9Ld1EDca5ZtZyHBs5rwRYVMwMmo
 XDww==
X-Gm-Message-State: AC+VfDx+DnFMLq3MCgjkW6S5k6EQWfP1VyFSuQXDZfy/E1FqQgdxC0cE
 HT5rv6lXM09qXKFVpVqH/rg3bg==
X-Google-Smtp-Source: ACHHUZ50wubOxQyS5QSJUqIzDI4+3w5Js/aBTg/vjXgZfenzA/ULFLbOOIYgWXMbzb8NBE/bIB3M2A==
X-Received: by 2002:a5d:4244:0:b0:313:e88d:e6d3 with SMTP id
 s4-20020a5d4244000000b00313e88de6d3mr7147840wrr.14.1688133797704; 
 Fri, 30 Jun 2023 07:03:17 -0700 (PDT)
Received: from [192.168.1.208] ([139.47.41.96])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d504a000000b00313e8dc7facsm16639964wrt.116.2023.06.30.07.03.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 07:03:17 -0700 (PDT)
Message-ID: <55279432-e4fe-7309-ac6f-5e2a4b86f47c@linaro.org>
Date: Fri, 30 Jun 2023 16:03:14 +0200
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
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> +bool trans_fmvh_x_d(DisasContext *ctx, arg_fmvh_x_d *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFA(ctx);
> +    REQUIRE_EXT(ctx, RVD);
> +    REQUIRE_32BIT(ctx);
> +
> +    TCGv dst = dest_gpr(ctx, a->rd);
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +
> +    tcg_gen_extract_i64(t1, cpu_fpr[a->rs1], 32, 32);
> +    tcg_gen_trunc_i64_tl(dst, t1);
> +    gen_set_gpr(ctx, a->rd, dst);

I think you would prefer

   tcg_gen_srai_tl(t1, cpu_fpr[rs1], 32);

so that dst is sign-extended to begin, instead of zero-extended.  You don't see an error 
because gen_set_gpr, for MXL_RV32, sign-extends the stored value.

However, the tcg optimizer would elide the second sign-extend if it can see that the value 
is already sign-extended.  So this could reduce to 1 operation instead of 2.


r~

