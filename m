Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pp0a6-000386-DJ
	for mharc-qemu-riscv@gnu.org; Wed, 19 Apr 2023 01:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pp0Zx-00037O-1v
 for qemu-riscv@nongnu.org; Wed, 19 Apr 2023 01:42:05 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pp0Zv-0005SV-4m
 for qemu-riscv@nongnu.org; Wed, 19 Apr 2023 01:42:04 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f17eb6b10fso2149325e9.3
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 22:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681882920; x=1684474920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=csLUvFkt2vrtm4GGPAxkC4u0kZAPXWdY2HFAG+g4HCg=;
 b=lyAs45kMx+Fhm77Uier1wYcX290FpF8A+z5E0LQNGUshDOVcrkNrHgphFerOtL7fAe
 XsfwZKvg9pCk41hkHotLMCguIxT0nOQL5IJHsprkBgZWRAbuSxXv93bOCwwS75iA8hTY
 P8NgVJ1GiPSguW4GVdKf9lVePn4HjqZusTHHfO5aX6OjTphf7JB93UEgGddG9SU0i5Qj
 Zui7gIPqDl4NPT/LIbUqhvEvRDfz+HdhZBb0xlA9a2X90HVvO3bbydhKz0k4iR5soJdK
 lpad3wgImMnqnVns5YezQxiA4/2YUI7uA6S+jnIv0x9EOkoT4IQundimoOc0aUS7vimA
 ci9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681882920; x=1684474920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=csLUvFkt2vrtm4GGPAxkC4u0kZAPXWdY2HFAG+g4HCg=;
 b=QQgkLhfi7NZJ6OHThtqyBcMwDuUe/OM0Tg5TfVAzZZRqfN6+GQ2/NUnTq/qLw5/9Tz
 10O3bc4P/OYFRs5ytUmhW/+9YhdUL21IVtOuqXb3eDKJo/83TezuZtKNeEj4XR4gV1NO
 MXNBKc8jNi357MnI7AKbIWgfwfVcuQ0xAqeXYqAcVRbiK2LSgphipRXXIVznVMuJPA8X
 N+ag/fNrH/hy32APqLDSZ8Jno4VxQpVkxUSjtcM5nBwCfrAfUHcb0H1W2++zbKix92Li
 nL9F3iyHjokpkTwPrEZb0jIOuaVt+H8FqZfmqO67lDvEqTevE3RzJb8sD4jlHYFIdkZ0
 /S+w==
X-Gm-Message-State: AAQBX9f3+kVPv2ZRKqRhBfkdR8+QbQ73fuCJ9+uu/9/cl7A5Obb2abMC
 Ie+bnMR4EfBYfao7AjnovMv0Fg==
X-Google-Smtp-Source: AKy350YFNfO8gTmrGZ3S8diMlWOTB91Ii6tn2CqRNBgXmjOTFBMs18z2uBi257V5896IrInNEdzbtg==
X-Received: by 2002:a5d:51d2:0:b0:2fa:f8c2:45f4 with SMTP id
 n18-20020a5d51d2000000b002faf8c245f4mr4135973wrv.0.1681882919896; 
 Tue, 18 Apr 2023 22:41:59 -0700 (PDT)
Received: from [192.168.58.227] (103.red-83-56-31.staticip.rima-tde.net.
 [83.56.31.103]) by smtp.gmail.com with ESMTPSA id
 4-20020a05600c228400b003f17e79d74asm1012272wmf.7.2023.04.18.22.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 22:41:59 -0700 (PDT)
Message-ID: <dd0a4aa6-e9cb-77ad-7a94-2cacf2e740b1@linaro.org>
Date: Wed, 19 Apr 2023 07:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 6/8] accel/tcg: Uncache the host address for
 instruction fetch when tlb size < 1
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230418140632.53166-1-liweiwei@iscas.ac.cn>
 <20230418140632.53166-7-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230418140632.53166-7-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
X-List-Received-Date: Wed, 19 Apr 2023 05:42:05 -0000

On 4/18/23 16:06, Weiwei Li wrote:
> When PMP entry overlap part of the page, we'll set the tlb_size to 1, which
> will make the address in tlb entry set with TLB_INVALID_MASK, and the next
> access will again go through tlb_fill.However, this way will not work in
> tb_gen_code() => get_page_addr_code_hostp(): the TLB host address will be
> cached, and the following instructions can use this host address directly
> which may lead to the bypass of PMP related check.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   accel/tcg/cputlb.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

