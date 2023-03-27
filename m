Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgmmR-0000Fw-4M
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 09:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmmN-0008WD-95
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 09:20:57 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgmmK-0007qV-RM
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 09:20:54 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-17ac5ee3f9cso9191475fac.12
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 06:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679923251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qRJHrL2Dgz8DbB+kuB/gPWiNKJiS9iYXd1T8NR2k3cY=;
 b=ebByHNvmvWYlEVTe7qAQwRfzaILwhQ6dGo/qTFy7AjRXpuNJOjzxEeH0NIB16wmgEt
 J4afdmoqn+tiLNY760eVb10AnEfn1s+uzbkwR6hgVNJyhUePWORdhw99Bjs5MpEHZmY7
 wMGkW+FSiUmcSw829qKXMfwde9D5OMvogqaDdhOk788TQNiQgOkBNfOmNwnnadibBRH9
 8gEZZ2l5FziVOlkFWDodEAMN8VARMAhv9yVjROoHb7bt0120WnK3SG0QNmdBzZEFQ5UT
 erFMP3hF9o/FmlBsotg4kwkjmArYvU/AZaFZLrQnEM2HZVvMwDnWny2m31R9lm+S5g+S
 bFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679923251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qRJHrL2Dgz8DbB+kuB/gPWiNKJiS9iYXd1T8NR2k3cY=;
 b=OAF8fVoHacmmxnr+3QiL7lxMnwY3Nx49vVWxAnp6itk9A90Mn8ZHhW1gQGNd4t8Azn
 SylZjoszUo0UBBaVRLZ0duStREERXW+2KWohJxS9S62o/OR3efwJK7kjGPcR8Gdi7HTx
 AuH4LubF2I6GI4fvQ96GX+i8RhjMgWg+lZ7zSxbMm3m/8lCRZ+yS8+3StSDbmiJbzGK0
 2rPui8wSOcqyJEZXyosfnTkXiGHnbVB2qZB34WvYdgtXwMFQI79DyQqiqTSkyevNhgYO
 XKY58+QbQ74tW/2GMBz85yoR5/La5OxFENgyI49agxrJgwBsepkFo7AXmm5/PwZz1uvx
 qkpA==
X-Gm-Message-State: AO0yUKWwCWv4vyWwNa8I+pZvFlcCM8NrI5T8ZKvNXiOpiLSZ6dqN427V
 dS1VNvcZFVEVfgTRA0RRnKkDsQ==
X-Google-Smtp-Source: AKy350arv8eCOaSzXu4g//Z/w0nwhti+xCl32myXpIVbtdnX8U1qA97ix845EeGl+xmnyeMi2YPT7w==
X-Received: by 2002:a05:6870:7096:b0:177:c013:9da4 with SMTP id
 v22-20020a056870709600b00177c0139da4mr7966775oae.29.1679923251555; 
 Mon, 27 Mar 2023 06:20:51 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 yb10-20020a05687167ca00b001727d67f2dbsm9772009oab.40.2023.03.27.06.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 06:20:51 -0700 (PDT)
Message-ID: <6da52806-06ef-dfd0-4769-d0f1df4d8bc4@ventanamicro.com>
Date: Mon, 27 Mar 2023 10:20:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] target/riscv: Fix pointer mask transformation for
 vector address
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-4-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230327100027.61160-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Mar 2023 13:20:58 -0000



On 3/27/23 07:00, Weiwei Li wrote:
> actual_address = (requested_address & ~mpmmask) | mpmbase.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/vector_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 2423affe37..a58d82af8c 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -172,7 +172,7 @@ static inline uint32_t vext_get_total_elems(CPURISCVState *env, uint32_t desc,
>   
>   static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
>   {
> -    return (addr & env->cur_pmmask) | env->cur_pmbase;
> +    return (addr & ~env->cur_pmmask) | env->cur_pmbase;

I'm impressed that this flew under the radar for so long.


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   }
>   
>   /*

