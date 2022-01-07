Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n5wA5-000735-D4
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jan 2022 15:48:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5wA3-00070v-W9
 for qemu-riscv@nongnu.org; Fri, 07 Jan 2022 15:48:32 -0500
Received: from [2607:f8b0:4864:20::531] (port=36444
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5w9z-0001Oj-1U
 for qemu-riscv@nongnu.org; Fri, 07 Jan 2022 15:48:31 -0500
Received: by mail-pg1-x531.google.com with SMTP id 200so6425860pgg.3
 for <qemu-riscv@nongnu.org>; Fri, 07 Jan 2022 12:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IDQ08ou8NyZNbVkVlsSgc8MGSAtJOyzlIeLvHBE1jyc=;
 b=CJ2iU5VUvQJjcaMEp/r+mYRM0wXic7kU85TMNIrPLdoZ29gEO/pW/3iiTek4NYuoDm
 UqVBNNKNHEizLw/CqlrLPbpFjizaOhUq9CBWgeT8PoWSWxNxjXD+lfY18HTKoGkHwI4X
 jsDtvk+GQYPY/91qoBgL1CZ71erQI0Qrxhm0TZneTAt98me67oDNTioffucT1JJpOVNP
 mxlMLewtAPZphmakeXHFhoq5zL4CRxvyh+y6DKhrPQdsiepvdIMkrXDHk6bdy2I64/5p
 D5cHEIIih42846lBArj/kzkh0ukppcUItdP301TT9BWLeePzljE7/CWIpihNYHy76Psq
 JE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IDQ08ou8NyZNbVkVlsSgc8MGSAtJOyzlIeLvHBE1jyc=;
 b=KroN1PH0NaA+hagwTZccLyfWC9uv5IwvOGnn7W89fDKolh9HyOwx6Uehsqe1qCcBEg
 9h6uXYBHUbuKi7YqEKz8rpPB+jwE4fDEfO2ZnVWoL69mR8w5zLp6SuQobdRkcXGz6vPc
 522RvnFm4Ao4qxZU3urp9XFWEpK/cE9fQIcjUN7vYH5bKvUU0r8+4hTH+aH1d0Gi80+d
 OOKqqiepMGLXg7DmaRuHlve8IqyQ93sEFWe4ClbC6jvhrtqcwnjj+Dd9RqvKQUMvVAUF
 6l4B159IB9woXN0H6nuBBdyQpi/MdLsXzG/y5+1bQIzMRcs5IgaPtmoFaey5x8ithKvW
 Sv1g==
X-Gm-Message-State: AOAM533oYc3a+kaIfn70j7WFEvH7nsoyjsjx7YNVFs2sQfA0PNtokt1t
 e/+hD2XBKAe6YJrrayXpGrk9jQ==
X-Google-Smtp-Source: ABdhPJxGiO28wLTMm8XUr8bSsr89XjkKVI6gNc0TvcA41MKrOhh2zy/JkXXZrcqVt6/HCO5PnB6otQ==
X-Received: by 2002:a63:2146:: with SMTP id s6mr57687089pgm.253.1641588505590; 
 Fri, 07 Jan 2022 12:48:25 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id l12sm7041448pfc.181.2022.01.07.12.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 12:48:25 -0800 (PST)
Subject: Re: [PATCH v3 2/6] target/riscv: hardwire mstatus.FS to zero when
 enable zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20220107112749.981-1-liweiwei@iscas.ac.cn>
 <20220107112749.981-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06256f71-8d17-a9ab-b45d-5bb1034453f3@linaro.org>
Date: Fri, 7 Jan 2022 12:48:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220107112749.981-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 07 Jan 2022 20:48:32 -0000

On 1/7/22 3:27 AM, Weiwei Li wrote:
> @@ -342,6 +342,11 @@ static void mark_fs_dirty(DisasContext *ctx)
>   {
>       TCGv tmp;
>   
> +    /* hardwire mstatus.FS to zero when enable zfinx */
> +    if (ctx->ext_zfinx) {
> +        return;
> +    }
> +
>       if (ctx->mstatus_fs != MSTATUS_FS) {

This should also test RVF.

Finally, there needs to be a change to write_misa -- MSTATUS_FS needs to be cleared when 
RVF is disabled.


r~

