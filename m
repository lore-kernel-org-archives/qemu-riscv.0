Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3OC1-0002RP-Oc
	for mharc-qemu-riscv@gnu.org; Fri, 31 Dec 2021 15:08:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3OC0-0002PH-Cd
 for qemu-riscv@nongnu.org; Fri, 31 Dec 2021 15:08:00 -0500
Received: from [2607:f8b0:4864:20::1035] (port=56227
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3OBy-00015p-Vc
 for qemu-riscv@nongnu.org; Fri, 31 Dec 2021 15:08:00 -0500
Received: by mail-pj1-x1035.google.com with SMTP id iy13so24217220pjb.5
 for <qemu-riscv@nongnu.org>; Fri, 31 Dec 2021 12:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hdsj0Lp/8fh7hpvT87fjGFU+kaFDguNJtjevDTV84Y4=;
 b=KsWprDx3RQX12U+FXWoBABpc0V+fgF3BUYZ/DOnzrG/Sa9m7LJzIjYIGdFkKxLDGd0
 BGKKslINjN71kM8cOoUplZBadFGA9ALc8MEaAbQrp87eianKLKui+FSRnkH6DHMKtU1T
 xGdsCQI2hkmk4zCIm37VktVyOwtDydUoU1zDkbjQeNNwktjp10l0Hc4vQJAhiAPkrdtM
 bT0S9CJJu2rLR+epVTY4VZkX9ZkW/fgw/pOcQN964Tlsy8jWPp1CP94KsuWbkNOKiOVd
 dD+l5XFG+OkrF0x9dZNRNcYPrdZ6TZF69a6u8SjbL6FnDg7jbOqXDq6c3HJs3wpz/xvu
 HJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hdsj0Lp/8fh7hpvT87fjGFU+kaFDguNJtjevDTV84Y4=;
 b=dTA9S4/GscOVLXj1E4KcRRNlErIjv0HJeNXZi2TpWbglorFhWVgqzlM0vdrkG3Ne7x
 PJwSntNlTQIuIpBgoE6AIxLNWHlqTAsC6wahAmDub7Q9hA00pDxacI5FjuFThYwWwkKO
 ohxLKzVz998ChIPTtD0ZwVux3DcNYAYu4c3k6h909a0711JvY/oABd85ntkwLDZhCNUi
 hSscVf+R6s/c3mjbELUf9xA6bx8G2gLsGRcdaJlkHwGDDfBk7g3SZfWkp2Dg8ftbmdSK
 O9+0wDvh2ggnEGLlZ/C36NW8BZowCHGh6nnR8UHuO7+2kXGezE5KmTtWWl7m5WbgIri7
 QDRw==
X-Gm-Message-State: AOAM532LK2Z5w2xLcHQTvz1mrVERzK8B2mocViw1FhMKD1KEftIikmue
 oK3e+e11bATaUfqDsR9/j3eJBA==
X-Google-Smtp-Source: ABdhPJylCjbnB2uOhVNt2sGk9VSlZeTfloZA+e6y697zKBPRogO899fE1xzYGKAs/NSGp8Sidlu78A==
X-Received: by 2002:a17:90b:388d:: with SMTP id
 mu13mr44845249pjb.86.1640981277613; 
 Fri, 31 Dec 2021 12:07:57 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:9312:6940:7d21:4efb?
 ([2601:1c0:6101:be80:9312:6940:7d21:4efb])
 by smtp.gmail.com with ESMTPSA id mi5sm32842256pjb.21.2021.12.31.12.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 12:07:57 -0800 (PST)
Subject: Re: [PATCH v2 4/6] target/riscv: add support for zdinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <71a505a1-fd9f-6cbd-2bbc-6bce301bf1f4@linaro.org>
Date: Fri, 31 Dec 2021 12:07:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231032337.15579-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 31 Dec 2021 20:08:00 -0000

On 12/30/21 7:23 PM, Weiwei Li wrote:
> +    if (reg_num != 0) {
> +        switch (get_ol(ctx)) {

get_xl, not get_ol, two instances.


> +#ifdef TARGET_RISCV32
> +    {
> +        TCGv_i64 t = ftemp_new(ctx);
> +        tcg_gen_concat_i32_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1]);
> +        return t;
> +    }
> +#else
> +    {
> +        TCGv_i64 t = ftemp_new(ctx);
> +        tcg_gen_deposit_i64(t, cpu_gpr[reg_num], cpu_gpr[reg_num + 1], 32, 32);
> +        return t;
> +    }

Unify these two cases and use tcg_gen_concat_tl_i64.


r~

