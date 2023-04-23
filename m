Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqexF-0000LN-QF
	for mharc-qemu-riscv@gnu.org; Sun, 23 Apr 2023 15:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex5-00009y-6s
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 15:00:47 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex3-0004Od-KH
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 15:00:46 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so3330817f8f.2
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 12:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276444; x=1684868444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9uvrma150yzljMYYaGgTLVWzkYKkZURHEB81TVBTbbc=;
 b=QbIRKXxKh6n4KqK1sg6q3tHLA8kBcokFv8c+zqGbWmGR4CJUA7wKfZs3BTF6Zet3L3
 RVThO00j+CWGCOvKTtHcIoyAKiXWwp5X6hgzQioCpgcobMBdCt9OBIsmkOZNUwLNIkfn
 WuMfbXmpwMmDyrcUEyY2Hdy8p/41WA/66QmOOB9CpZg1E4sDeJpVqY6izugztuow/e7D
 C31OuLDRSm2JTvNv7T0YmP53iMuZjq4zhA5ZjfDtqtzTkaUmF3eKqqu0eITcCVBmY5K4
 ygiKKFHUatjSqhBdEykxR+DCrfI3wpKtgblu3+IMctn8hANkGlUAU2XPmQuYxfPUXLV9
 e14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276444; x=1684868444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9uvrma150yzljMYYaGgTLVWzkYKkZURHEB81TVBTbbc=;
 b=QlZU6si8H9nKThLmKlovPi64pPo6jFWjKZwK81aRwxz3D3vgsLli4McmCXdHrwkU5m
 Hl0BrYFpaxpDc628NA42JENoQ1L4/S0XjGzB2vWrIK4ZlV10klDIyUTIISY+mtx52fyv
 FRsyIIaNui1WQl1OLd94JCfhC5m/BlbNPh3NIbuLc9XYd9S9d2NeifOBOcD8fZJN5SyT
 coQ812dOhpa1iW1i19jaNvhCoNvzIUEFaSA9FhcAH8P4QN2XeVySqOFz1BE3glaUQzxm
 yS1QCRRlenzn58Odm/r9VVETD+Dpz5c8jHiq9IIK1/dEikdTzsE80XwLlDVrv71kz2KY
 RHeA==
X-Gm-Message-State: AAQBX9eFgrItLWstFa5q2Ls7TWm5nLeCi/NxmoY8JKuIjswk5CYqMkhd
 78qRSbQa+Eb6wy0oYX/zq8+MVg==
X-Google-Smtp-Source: AKy350bPJsDnihHKt49/IpdtWe8gMmRtqMfZ2yOmdpRsbr99MMkset/sBmlrRw+7cNo4Fz+UbCtKPA==
X-Received: by 2002:adf:dc89:0:b0:2c9:e585:84b0 with SMTP id
 r9-20020adfdc89000000b002c9e58584b0mr7658645wrj.1.1682276444739; 
 Sun, 23 Apr 2023 12:00:44 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 k6-20020a5d5246000000b002fe87e0706bsm9144310wrc.97.2023.04.23.12.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:44 -0700 (PDT)
Message-ID: <6f54a97a-306d-f375-1fc2-8faaf848ecd0@linaro.org>
Date: Sun, 23 Apr 2023 20:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 33/54] tcg: Introduce arg_slot_stk_ofs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-List-Received-Date: Sun, 23 Apr 2023 19:00:47 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> Unify all computation of argument stack offset in one function.
> This requires that we adjust ref_slot to be in the same units,
> by adding max_reg_slots during init_call_layout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c | 29 +++++++++++++++++------------
>   1 file changed, 17 insertions(+), 12 deletions(-)


> +static inline int arg_slot_stk_ofs(unsigned arg_slot)
> +{
> +    unsigned max = TCG_STATIC_CALL_ARGS_SIZE / sizeof(tcg_target_long);

static const?

Regardless,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    unsigned stk_slot = arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
> +
> +    tcg_debug_assert(stk_slot < max);
> +    return TCG_TARGET_CALL_STACK_OFFSET + stk_slot * sizeof(tcg_target_long);
> +}

