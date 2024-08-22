Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14C9C52D7C
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 00:26:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sgve9-0002GU-43; Wed, 21 Aug 2024 20:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgve6-0002EO-0b
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2024 20:25:46 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sgve4-0002Tb-EE
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2024 20:25:45 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-7bb75419123so163357a12.3
 for <qemu-riscv@nongnu.org>; Wed, 21 Aug 2024 17:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724286342; x=1724891142; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/GqJnyljg8TgNL0lceDbsFELq7gBy1lpyCFRvJMcO20=;
 b=nzLTPq1Oi67v62UrbhW+dC5NqttKVX2L4rKucZ9B5lhyDrP4lQBJWJwY63OO0JAKy9
 c5neQLsPMPBe0NFAW4gy4UJYkt6FwkkncDQEplOu+QhPliZbN0ReQ2LQBRbybA4HiYlN
 c4oBxIzpIr3pk3QZh0gFJFfjKhkkshg6N3GvCxHyKAdbOnHkXtuWg+H2PEtwWnZlVe7W
 vZOgKpoA/bbrby6zpdxLseHiC4KSfYr1Cbqc9AY/cBcDq+P3KS9aOK+yGicWCAhMH6c+
 LpeTl1VJ8FoVEO+6mQ9oh7mJraRrBsm7/rw5r2AkCvyylFP0/1xJ0yfvEUKuGesxdnCp
 3wOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724286342; x=1724891142;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/GqJnyljg8TgNL0lceDbsFELq7gBy1lpyCFRvJMcO20=;
 b=rTvZajSEYuBKKjnHs/Y9rK5xhaOSH4FNWDor/wfH67c03B90rpz5GL2KYcrXSVEVm2
 sy08WLIgp+GOgJrBMMF5mmU2t50bQfbZZUucvtTv910n5dNfKlQkiEKh//GPEdMG5MDz
 dHXA3hAWTwQKXUIQ7A0xHep/vO+haQ1UrF9vrPfni/9ilTplLeDocHAbuN6a3MvoY1yI
 H+gauU3v+PbiWQR0imuSpriM/Jq1dnfXR8N5xWdAgg6ifTHUTUE1cFYs6xQOaSb/HTiF
 6nmAbrZFly/znR3YlQC4psidWPO1Tf9iD+RjVvIhJy63ksx062yMURcTYAtxZtEmhlbP
 togQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Q8Fhe6IYINSNWsRHOeSB4+8+C9pJiXYutFewi41YFVej8nXu6NKyPOXZR1fqVNkHD5bZLlVgeBTa@nongnu.org
X-Gm-Message-State: AOJu0Ywtn1/JzaXkyf9800Navhk0ydz07DzxLYLiPwvFRviGuI6GLaEK
 V95U/3myRDRCcVZKyQ9PvGhtCwfWIrH38fGkTYOZdWiYSLrQ+y9tErvXFVdv26A=
X-Google-Smtp-Source: AGHT+IHDsbmO9wL7btcRX+fk/eUc6PnREsTOZEcRIZGaawCD5YSB6q+4JJP8AyCM7hrxNOTo4D0/Tw==
X-Received: by 2002:a17:902:cec7:b0:201:f568:b8fd with SMTP id
 d9443c01a7336-20388b3cd8emr3667235ad.42.1724286342330; 
 Wed, 21 Aug 2024 17:25:42 -0700 (PDT)
Received: from [192.168.98.227] (60-242-98-186.static.tpgi.com.au.
 [60.242.98.186]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-203855dc2c6sm1662535ad.151.2024.08.21.17.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 17:25:41 -0700 (PDT)
Message-ID: <a374b1d5-0812-446b-82ec-c432319a362c@linaro.org>
Date: Thu, 22 Aug 2024 10:25:33 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/16] target/riscv: tracking indirect branches (fcfi)
 for zicfilp
To: Deepak Gupta <debug@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, Alistair.Francis@wdc.com, bmeng.cn@gmail.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com, andy.chiu@sifive.com,
 kito.cheng@sifive.com
References: <20240821215014.3859190-1-debug@rivosinc.com>
 <20240821215014.3859190-6-debug@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240821215014.3859190-6-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 8/22/24 07:50, Deepak Gupta wrote:
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9f08a67a9e..3a56bea8b9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -133,6 +133,18 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
>           flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>       }
>   
> +    if (cpu_get_fcfien(env)) {
> +        /*
> +         * For Forward CFI, only the expectation of a lpcll at

s/lpcll/lpad/, though perhaps the whole paragraph could be simplified.
We don't need to describe the mechanics of the extension, only what data defined by the 
spec are being copied into tb_flags.


> @@ -1270,6 +1275,21 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>       decode_opc(env, ctx, opcode16);
>       ctx->base.pc_next += ctx->cur_insn_len;
>   
> +    /*
> +     * instr decode of `lpad` should have lowered fcfi_lp_expected.
> +     * If not `lpad`, raise sw check exception.
> +     */

Perhaps better as

   If 'fcfi_lp_expected' is still true after processing the instruction,
   then we did not see an 'lpad' instruction, and must raise an exception.
   Insert code to raise the exception at the start of the insn; any other
   code the insn may have emitted will be deleted as dead code following
   the noreturn exception.


r~

