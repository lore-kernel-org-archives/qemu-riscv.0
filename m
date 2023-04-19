Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pp0d9-00047b-Po
	for mharc-qemu-riscv@gnu.org; Wed, 19 Apr 2023 01:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pp0d3-00046r-Gl
 for qemu-riscv@nongnu.org; Wed, 19 Apr 2023 01:45:19 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pp0cx-0007OF-6p
 for qemu-riscv@nongnu.org; Wed, 19 Apr 2023 01:45:16 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n43-20020a05600c502b00b003f17466a9c1so838908wmr.2
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 22:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681883109; x=1684475109;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V2NNHo9WyQj9h/OoXJnEhLeRoCAc+gvCBIaTb3x7QC8=;
 b=OSGzf2ypCFzubmSZMIxAhj6frdyMFwUttw0E9UGM/CvoNbzHtyaFT4OAetDIV5uIUY
 3wkSgbFKi6Q6PvF6WMgAvWaKHIxI1IB0mfsnol2uvRB7MdVioV85y0T003jSjxmwdhGw
 mv/w7wJP9y8SeXDcs6UaqMeQuVIn29lQThiWvS05v3nXRhA5q2ZqlEkxzq8pTpPge0XF
 13LYC4UUf8jmukN07t8jUc1be9qklU7zrtVou69yKbLIH18BppLfJRdtj/AnZm3ipcs9
 f37TD1yZn6oiNcEJEK0lwnWLq8SOSnoq7xq8enYQ9m/oaSu7l1Leu/Coa7enJlFP3r5J
 ffgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681883109; x=1684475109;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V2NNHo9WyQj9h/OoXJnEhLeRoCAc+gvCBIaTb3x7QC8=;
 b=TmlK7nLv7rnxpIdJMvU7fFpRS6B8GIqAZvjk10PAJyVbsS7heZN7G1hHUno8C1pfzf
 56Vl7iKLYj/r1J3ZtplfCXUzUxZeQYjMqGdzkNkym06lYKtRcvYdFKC03JurAXC48atE
 /DPYtzTV3Ukf4hnn/mAEsLFKV9YO0ZHQItTW1/oRauneXHsl8RrAk97Ya+mC3dSM/V80
 e9Fylx/BKtN2Ut+U21OO50RNxYzdNq1wIdSPEwUjFjph86tLr+PcbfV7er2fAoM9kd5o
 P2W8iFFpjqtMW+Asr8KGbJtuPqOHZHczIMGmdD4niOMxqfkDZAbmRKBftCzHTmejATS+
 ztAA==
X-Gm-Message-State: AAQBX9fnOYwzgR+Ru7W/TdzH09rlSIW6tYGe6D7grIzv29pdoC6flc59
 C8uc5d2wZTgsnte4gzZRjya/DbYldMWIaJDT4cfokuRl
X-Google-Smtp-Source: AKy350bWvEhF5khk4kdS+6aKM9UgbZxMnIjbPxeGsFkgcBwto0eqJMxTWK37I9iNgkAseFLGwmNt8A==
X-Received: by 2002:a05:600c:3644:b0:3f1:738f:d3d1 with SMTP id
 y4-20020a05600c364400b003f1738fd3d1mr6774777wmq.4.1681883109587; 
 Tue, 18 Apr 2023 22:45:09 -0700 (PDT)
Received: from [192.168.58.227] (103.red-83-56-31.staticip.rima-tde.net.
 [83.56.31.103]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c468500b003f18141a016sm436369wmo.18.2023.04.18.22.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 22:45:09 -0700 (PDT)
Message-ID: <34a0e33a-a7b4-dd5a-f968-5d4666abf4e3@linaro.org>
Date: Wed, 19 Apr 2023 07:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 5/7] accel/tcg: Uncache the host address for
 instruction fetch when tlb size < 1
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
 <20230419032725.29721-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230419032725.29721-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 19 Apr 2023 05:45:19 -0000

On 4/19/23 05:27, Weiwei Li wrote:
> Fix https://gitlab.com/qemu-project/qemu/-/issues/1542.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1542

> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> ---
>   accel/tcg/cputlb.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index e984a98dc4..efa0cb67c9 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1696,6 +1696,11 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
>       if (p == NULL) {
>           return -1;
>       }
> +
> +    if (full->lg_page_size < TARGET_PAGE_BITS) {
> +        return -1;
> +    }
> +
>       if (hostp) {
>           *hostp = p;
>       }


