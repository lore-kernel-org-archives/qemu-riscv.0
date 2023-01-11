Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFlaR-0007ZS-MY
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 19:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaP-0007Y7-Oj
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 19:36:53 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaN-0001jI-HL
 for qemu-riscv@nongnu.org; Wed, 11 Jan 2023 19:36:53 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 b9-20020a17090a7ac900b00226ef160dcaso17339326pjl.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 16:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2DAt0LkBD+q2larCGML+0JPiL8WBvDDxkUPPiQG6zlM=;
 b=rTtv54VDDKuwD3HUVhwNCbU0KR20Ka+beAgVhzjaEQqyYA7xkptlnEstwDzODojk6U
 kB0cBZz8W4rgV8YYwat53cJWAAOIHuaFPUXMz6DJPwvy/3irwOOi/x5CvGlz/wEI7xG0
 onJRwhnyFSGrevYhvXEgshumklB5mrXZToNNZPrjLX346GXZGp9oVgX4oqDlFlDeBBFw
 RuoACqCKrzNLLmitFrfblr9AqdN9NFO+rKA39L9/vRohPSv0H4OAU0j7ASFhVkcFMZor
 Q2M6DREdk/VnZSphpr92GbpY9A0i+neVK9FiIxZVMYhr1wF9WCFSulh/6ErvwqUnc3vO
 Sqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2DAt0LkBD+q2larCGML+0JPiL8WBvDDxkUPPiQG6zlM=;
 b=q2SsQhpncgcefWCWYqOHOB6ahCJwBbMc0L5+QOzp/gnYBfw2En5pprsTv2lsCqDYS0
 le8h3/E72v4bIYmXPK97i38G0wKHeVtnHLtN3IVtSP0HqPtc3k2J2awX96esDta/m1OF
 snelmiWNIMj/qAihxMm+V0bqsYF+twpxJk/QF+wd5eqbWiLD9Z8CfRoZYAxBtfweO0ec
 7s58Qi/+uoOHfLHBD2jTQvZtnFoeKMYmCDFn7Hoezk4QiwMsVLnSH3ABtBFYdLKT19gz
 uTd87gMQuj6opLwR9mzruR31iypZ4nr0OtxklrPI5sHzwIyJ7eE8khwiG2dQKEN0G5Pb
 0/0Q==
X-Gm-Message-State: AFqh2kq8RyyMQD3QBb2B76njJ+KQxb8nnl5WsQmE/Sl349UZ06d0IGfw
 qpoS8zGAZ8jygVGmfAxrVuNLEQ==
X-Google-Smtp-Source: AMrXdXtR0swzSEiLKdwtCYQg8n/uCqRVTysJ+bIZLaHIRldk7ibVEqv2kpo/JQ2QUSuiH/y3e2MPzQ==
X-Received: by 2002:a17:90a:9111:b0:212:f14b:9c3f with SMTP id
 k17-20020a17090a911100b00212f14b9c3fmr4561400pjo.25.1673483810183; 
 Wed, 11 Jan 2023 16:36:50 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 ml21-20020a17090b361500b002135de3013fsm9581017pjb.32.2023.01.11.16.36.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:36:49 -0800 (PST)
Message-ID: <0a5fa04b-5576-3350-a0c6-bfeab2e11cca@linaro.org>
Date: Wed, 11 Jan 2023 09:48:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/4] hw: Remove hardcoded tabs (code style)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
References: <20230111083909.42624-1-philmd@linaro.org>
 <20230111083909.42624-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230111083909.42624-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jan 2023 00:36:54 -0000

On 1/11/23 00:39, Philippe Mathieu-Daudé wrote:
> We are going to modify this code, fix its style first to avoid
> the following checkpatch.pl violations:
> 
>    ERROR: code indent should never use tabs
>    ERROR: space prohibited between function name and open parenthesis '('
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/dma/etraxfs_dma.c | 196 +++++++++++++++++++++----------------------
>   hw/misc/mst_fpga.c   | 162 ++++++++++++++++++-----------------
>   2 files changed, 175 insertions(+), 183 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

