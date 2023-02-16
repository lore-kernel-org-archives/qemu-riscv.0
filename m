Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSXOL-00031k-8M
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 01:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSXOH-00031K-85
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 01:05:10 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSXOE-0003zy-KA
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 01:05:08 -0500
Received: by mail-pj1-x102b.google.com with SMTP id bx22so872636pjb.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Feb 2023 22:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YPAS7g6O8WNWzrUY2zy3eOkrWGek+pB3eRFqUg3nm3M=;
 b=xXL+84Ck6XhMJvtLpeX47KfzUpUj3kyNz2cVaSWTPbBBBPYApX5Kp3Df9cgaapBExm
 WR/aDxD2GfqWwDr4SO8MdZInPn+EQ1GJSvEFDPENLXyP+gs3VIpy7WxhJTtu67HmWmoU
 hebDaKxp27O3fDV179h7xfslc1v1usU7eSDg5bzfzvJx6IoR3jGn6camw6Wo8SGve8cA
 mjGmrrr6eCor5FtX4UODAmtb2Ik4UMzFAKs4BgpG05rzZ2kTf3dED5lishNs7O4Y5PE3
 Qej/0Fj+pQ23/puXUO6BWdwBa6C+Dt4j07000Y/e7SQVmBW4H+cs3RDyE1LCfzhKBeaH
 K3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YPAS7g6O8WNWzrUY2zy3eOkrWGek+pB3eRFqUg3nm3M=;
 b=lyCHogPFRVvsctlNMH5AAbn8i8zu086mT62bgo294Foi12XXmluuG8YpwDios2XUCH
 +EtyodPTeBrMP0jzSN4JmXRGhmawDHFaleSRq8pjASSnfQRuKPHSVVGdo7jJJEELV5Ee
 54NpHJnhZbwaXNzlnLsSqq3vhZZc0gR4As7pMQ4/09em5bvw6eEjIdwZu6GnVJTJuium
 IQ303bIBvwnhsocDP04Qfpgbcb3lx4tZ7mFRYcBr8CEAm8iFqmfM2BuOXVMIW3pMtrYq
 Sk1AlDmYAPTbscdbA/Yjbaq9447UYw0gEqRz4oeyVpCjSlAXobawu5gyMiyYDQhILoV0
 lVvQ==
X-Gm-Message-State: AO0yUKXxV1PMdWt7RRXqZJeg58rtnLNfbQA/hpWb8QmcU5Fax0LbL8jh
 1U8t1b1B4krfoRojfw57auPyFA==
X-Google-Smtp-Source: AK7set9nr02l2ZYI4jBMsmpLLBYYP7r+stTyiQaUZNQYNVhOe0IqFwQF+LmNEpFzEPMCj7A9JboDTA==
X-Received: by 2002:a17:902:ea09:b0:19a:82f0:7b0f with SMTP id
 s9-20020a170902ea0900b0019a82f07b0fmr5884719plg.30.1676527504412; 
 Wed, 15 Feb 2023 22:05:04 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 p2-20020a1709026b8200b001992e74d058sm388843plk.7.2023.02.15.22.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 22:05:03 -0800 (PST)
Message-ID: <39c3eae4-2483-afc3-6888-caa45f17c451@linaro.org>
Date: Wed, 15 Feb 2023 20:05:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 RFC Zisslpcfi 7/9] target/riscv: Tracking indirect
 branches (fcfi) using TCG
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-8-debug@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230209062404.3582018-8-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
X-List-Received-Date: Thu, 16 Feb 2023 06:05:12 -0000

On 2/8/23 20:24, Deepak Gupta wrote:
> +    if (cpu->cfg.ext_cfi) {
> +        /*
> +         * For Forward CFI, only the expectation of a lpcll at
> +         * the start of the block is tracked (which can only happen
> +         * when FCFI is enabled for the current processor mode). A jump
> +         * or call at the end of the previous TB will have updated
> +         * env->elp to indicate the expectation.
> +         */
> +        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_LP_EXPECTED,
> +                           env->elp != NO_LP_EXPECTED);

You should also check cpu_fcfien here.  We can completely ignore elp if the feature is 
disabled.  Which means that the tb flag will be set if and only if we require a landing pad.

>   static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
>   {
> +    DisasContext *ctx = container_of(db, DisasContext, base);
> +
> +    if (ctx->fcfi_lp_expected) {
> +        /*
> +         * Since we can't look ahead to confirm that the first
> +         * instruction is a legal landing pad instruction, emit
> +         * compare-and-branch sequence that will be fixed-up in
> +         * riscv_tr_tb_stop() to either statically hit or skip an
> +         * illegal instruction exception depending on whether the
> +         * flag was lowered by translation of a CJLP or JLP as
> +         * the first instruction in the block.

You can "look ahead" by deferring this to riscv_tr_translate_insn.
Compare target/arm/translate-a64.c, btype_destination_ok and uses thereof.
Note that risc-v does not have the same "guarded page" bit that aa64 does.


r~

