Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmmj-0000qO-Tc
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 09:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmmi-0000ob-Af
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 09:21:16 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmmf-0007uF-FM
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 09:21:15 -0400
Received: by mail-oi1-x22b.google.com with SMTP id f17so6289399oiw.10
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 06:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679923272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NQgzUwcTkiqqke1WAz+jivsBIw9LvXCTUxUY7Poqw0E=;
 b=XzOhrwjO7yYyIOjQDF0GieUx3DkeHmOW/DLFBy6MAaAgkzIDpTKuTghRzKdG6z3Qy7
 SuPdcrc+JATtA6fpN9r6+WEhcIUZSz/djmG9ef+jwaLioweShUT36ztkzPBLvEQ1n5z1
 5UO+lLtFqtaAxCif69J+lW22BvEGEGhIWfz/1Jff7PEwrRHaHNY77G6spIKVgxxT5KRy
 VDzYf2QdPHj62tmA7HcXM7LMFxyn8RGG0RisZIWGD0zKEBEwQvUbMMl6cltUw6v9EnXm
 kck/eZ3n2paJN8eTiVlMNEEvCe8F7M6J1plvr0jw7McNbW04UqoNk9+7/d1Ojm4sIfL4
 FI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679923272;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NQgzUwcTkiqqke1WAz+jivsBIw9LvXCTUxUY7Poqw0E=;
 b=H2Zv0g7RWs1zdM/7y0A+jhdxvGs3fAbRS/5h1aHZ61aujlf/oLkXfFNdkSa7b8385x
 +qYXP4nMkw6ozw0PdEWuGlsBErYl9tCkf9fU82KGwIgbwIkYJ8r3EXE+Wud87xsOlexI
 v+Qzby+WuQ68PPi7xdHoMFwc/VmWqjYPVilp4PJeawk+QR1nFKrva9G5rUbf+flGCY5O
 uu7ZkesNrio0GTQi+OVvKcd7SbRJYSi3FqENb30MNfQlQr4cMc+VyWfrq6kyMtSfpzSy
 eZhwXktDEtGQ9SoDoTlaIUjsXqlwrLafogeDhkR0DVXxa/wABrmrnTumZu/85uKih7au
 nhbw==
X-Gm-Message-State: AO0yUKUoCxUu9KRlO59AXurT/iE7oIJ3GHh92A7t+5PkJNVSbJb5VVwB
 yYn8cVRQ+dBA/lSFhTagUTR/Dw==
X-Google-Smtp-Source: AK7set+I7bUpeZfyqYAQBnDzati6n6VSoCS5xiJep3Rxcuk0yrE3/qobt038BcJ77h491daDCtjMbQ==
X-Received: by 2002:a05:6808:15a7:b0:386:e073:6996 with SMTP id
 t39-20020a05680815a700b00386e0736996mr6845385oiw.26.1679923272346; 
 Mon, 27 Mar 2023 06:21:12 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 g56-20020a0568080df800b0037d8c938d62sm11009392oic.50.2023.03.27.06.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 06:21:11 -0700 (PDT)
Message-ID: <ddb740fb-5b4c-b88f-fde8-6bb14b20ed17@ventanamicro.com>
Date: Mon, 27 Mar 2023 10:21:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/5] target/riscv: take xl into consideration for vector
 address
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-5-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230327100027.61160-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 27 Mar 2023 13:21:16 -0000



On 3/27/23 07:00, Weiwei Li wrote:
> Sign-extend the vector address when xl = 32.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/vector_helper.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index a58d82af8c..07477663eb 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -172,6 +172,9 @@ static inline uint32_t vext_get_total_elems(CPURISCVState *env, uint32_t desc,
>   
>   static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
>   {
> +    if (env->xl == MXL_RV32) {
> +        addr = (int32_t)addr;
> +    }
>       return (addr & ~env->cur_pmmask) | env->cur_pmbase;
>   }
>   

