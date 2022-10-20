Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olTfz-0008RS-TT
	for mharc-qemu-riscv@gnu.org; Thu, 20 Oct 2022 07:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTdk-0004kd-8K
 for qemu-riscv@nongnu.org; Thu, 20 Oct 2022 07:23:08 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olTdS-00083a-PX
 for qemu-riscv@nongnu.org; Thu, 20 Oct 2022 07:23:07 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so2746053pjl.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Oct 2022 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4eI4hua//BBjk3jco+ZYdxRFiCwLlZJfiUPHwQxcsf4=;
 b=GaQU9Z+9e9U9EYiurEGr/8lCGoSOpy+oGq3eop/UlPRBzkbhngHFlpzzf0KvZfLVwQ
 vvJdN4jb7kAGiAWZRR9bESO2hgaLK/M8QFEPiUokXLsBZwxRIAlqDQo+dqZnZEKK8uCv
 r2U+Q3R4dFt3HGH86nmo8PvZT6Xt1M8q+a6S/IcndxjHl5PTAzBxlDjg5n7KDzAJZJeT
 OkqeDSQM2xUsicrKEGdXAeUUsgZpepVUt2KTgEejh5G2Bs0dZuLhzQgPh6qp2ntjfWWt
 XPSEQ34Dm3IMiF1qRV6rvZQO0pJHxu+HXYVSEw4ceMf9rlzspIJS2/MqYSAWV+3TCmAZ
 0ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4eI4hua//BBjk3jco+ZYdxRFiCwLlZJfiUPHwQxcsf4=;
 b=4AIGnvNneEgSHtANe3dhPt9Qf20MP95CVdDRzYvsi8ngrK3elTUcip7aEppJvkoGNG
 lt3hFsk5mrwCnmXnkVyPXfYJYzQGHi1J5qE9uBMHCA1v12fJn4w1TY+M/azB5r7dXWCk
 DYLRJPfBubycQNBKv6nDob7mrqaz1EKfqHTM3GPzxquEmdCyU4ti2RbO6lP8eJyWs0WM
 915mI5fl5mVvY/4RexEz+duV+dtD349M4Lue2Pl6RJv6y4tzFnBz5XK38ROUo8T/gpYw
 0XQa+FCN+0mPxJFH+etwRNOxQZdSYBqvhyVjijsOjberMY4536xG2meiKBdt2dRzAbE7
 elBA==
X-Gm-Message-State: ACrzQf13jAhvpKGJXyTmp0k1anBv+WyW4nhR/EAY+a/iWMI+zqRPymi+
 I0PAtXrIAj8HtB/Qj3uTcn2EdQ==
X-Google-Smtp-Source: AMsMyM6Oeb3jdzdUrmpcyZiJp9qiSNQztrwYLa2e7MC04xwoNaq8VuLC8Bqa1c8zxQtxtZ6DRIKvRw==
X-Received: by 2002:a17:90b:4d0d:b0:20d:6fc0:51 with SMTP id
 mw13-20020a17090b4d0d00b0020d6fc00051mr43984815pjb.10.1666264969205; 
 Thu, 20 Oct 2022 04:22:49 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a056a00005200b00561b02e3118sm13138296pfk.106.2022.10.20.04.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:22:48 -0700 (PDT)
Message-ID: <49246207-2202-0239-65f5-1f0b44d8bd64@linaro.org>
Date: Thu, 20 Oct 2022 21:22:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH 2/3] tcg/riscv: Fix tcg_out_opc_imm when imm exceeds
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 lzw194868@alibaba-inc.com
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
 <20221020104154.4276-3-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020104154.4276-3-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Oct 2022 11:23:11 -0000

On 10/20/22 20:41, LIU Zhiwei wrote:
> TYPE-I immediate can only represent a signed 12-bit value. If immediate
> exceed, mov it to an register.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target.c.inc | 28 +++++++++++++++++++++++-----
>   1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 32f4bc7bfc..bfdf2bea69 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -668,7 +668,12 @@ static void tcg_out_addsub2(TCGContext *s,
>       if (!cbh) {
>           tcg_out_opc_reg(s, (is_sub ? opc_sub : opc_add), th, ah, bh);
>       } else if (bh != 0 || ah == rl) {
> -        tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));
> +        if (bh == sextract(bh, 0, 12)) {
> +            tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));
> +        } else {
> +            tcg_out_movi(s, TCG_TYPE_TL, th, (is_sub ? -bh : bh));
> +            tcg_out_opc_reg(s, opc_add, th, ah, th);
> +        }

This value is currently constrained by 'M': +/- 0xfff.
You're suggesting that the fix should be to use 'I', which is signed 12-bit.

But this fix is definitely in the wrong place.


r~

