Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmCt4-00081T-Ji
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 08:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCt2-00080l-48
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:14:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCsz-0005Qd-5I
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:14:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso5898497wmb.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Apr 2023 05:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zPOeUlaW68v5F0+HfoZ9nM5o2OGfCIeWCLyL+H57f3g=;
 b=O7EkRVKUj4VdYaBhcAT96V/1y8eVo0/3TdC23NRbjlcN8FKjhTOUNOYVoScdzVG8D9
 5094K+hMcQ5OBCTC40P3E4XidW++eby/Ef0a+pYWkvthravbj4hUNLku5pH+My/4xpeu
 UiNfrmdtoZZiIj84LnrlPs08B3VtU2myz8HezHZQcysIQGpAYJwuANf5TFktTQ6DM7YY
 QVLFssccpOna3FLAtl+tzk73UDRvxfyY+JAyiMYiVr9bT5BUt01X7cIM+qvIYYoJCF3m
 6Q4i/rkMRxhLCpi9MiONH/Wsrac1kNHpmaGNBi/r7wuJ3BqUrAiOMB9bC9B/fxWwnFIt
 1seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zPOeUlaW68v5F0+HfoZ9nM5o2OGfCIeWCLyL+H57f3g=;
 b=jf/fBvS0C5XPr08nnwAy1HNyVLsyEMN9v4sgOfWLWvrcnbnZuCwRHZLvB9eGRsPCNZ
 lMk1BcxcCbSNWWsbSO9RPLIIfMrVZEK/a47oXhYkI4W9ceC2EmfF+/al/fjoyRPflxnY
 8O5uaxkcOG4fE1DInCxzuyaW3W9v1XlC+9hkdM3XF9AeY1dkjC/Tga98/wgA1/WQaWEr
 fjBFZ6dMhazzFFmIbDc5Kbzlvfk6C9bUtk+tdUt+B52ttcxEnN9P+xVIXpsI+SGaXy+u
 1Q0GLSq4wb3CVUG6MQFEjeEW2IkGtmSIXI7X91YU5Z9jLab9Qjr52MOc/ZPuy3X03JpL
 SL3Q==
X-Gm-Message-State: AAQBX9cRAd94/fTDvhYvCvYmDhffPfgC5pRrv8jXPzAdScUxytxAeF/9
 6lXP0NiWJBtxH9TJuutI+trRdA==
X-Google-Smtp-Source: AKy350agKWdeJxFmV/rbVKcMRc4MjSUJQleXW39UROwzWCeJkl/TMlqsUTbgnFf+MvSx6kj0pjLG7w==
X-Received: by 2002:a1c:7914:0:b0:3f0:4428:9445 with SMTP id
 l20-20020a1c7914000000b003f044289445mr6619008wme.14.1681215247244; 
 Tue, 11 Apr 2023 05:14:07 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a7bca53000000b003ede06f3178sm16742878wml.31.2023.04.11.05.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:14:06 -0700 (PDT)
Message-ID: <cfd216ad-ab40-bf2a-8f4b-105a5af961cf@linaro.org>
Date: Tue, 11 Apr 2023 14:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 21/42] tcg/aarch64: Rename ext to d_type in tcg_out_qemu_ld
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 12:14:12 -0000

On 8/4/23 04:42, Richard Henderson wrote:
> The new name is slightly more descritive as "data type",
> where "extend", despite the c type, sounds like a bool.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 4ec3cf3172..40122e1471 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1851,7 +1851,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
>   }
>   
>   static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
> -                            MemOpIdx oi, TCGType ext)
> +                            MemOpIdx oi, TCGType d_type)

Since we have 'data_reg', can we use 'data_type'?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

