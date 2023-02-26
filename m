Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWLfz-0000Wy-2r
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 13:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWLfy-0000Wg-0i
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 13:23:10 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWLfv-0001dv-U5
 for qemu-riscv@nongnu.org; Sun, 26 Feb 2023 13:23:09 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so2553007wmc.5
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 10:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ld8KcmfAQtcho9ilfL3v00KZb1K+TTmv4az97OnsF9A=;
 b=ak5SAyqWZJ+KGO+So/+s4Pxfc5ZuTP9OL4+Jug7nrNBQAEWfMr4/DI8Uu1OeJuskl4
 lIqzqnJ+1ioh66lKvw4pYgFWxZoiZuxaeIDq//lwd8jeLYtUEzLc7DPYFUr624cuforc
 nuouc2n3OjE6bxXJSffc+XTwVkZA+1BIYXtACNcPQNE4q7RWjznIqmeU6nHHr0gQH5UT
 TbXhz5b3xvc/u091lIBQvIyKe3J67WEb+KUbY4qPyWSHZJ+EAOUjLq+Dh0n7Mt0T2qcJ
 Fdmg8am8a64C0DrC1dL0egyepAXe9Oyb2lX3Y+KafzKiSK4xv7sI86LKSgWwSzo5phSE
 1A5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ld8KcmfAQtcho9ilfL3v00KZb1K+TTmv4az97OnsF9A=;
 b=4cznOtJho9tK4tJtHP9M+S9t9UYZVek5YFwvspsJQq9cPk+Xp/SSBCys/po5GOUHTm
 kJgsZEQSSvwl+pzDAowbZFIUv2qKW/E0r28lilA3HttJBODWQRrJMSFnPAvSc1yltHlu
 nBUNOfuJgg3xoZxho8yCwsZNj0w5OQzVuqJrgon/XXCBnye7JFvLqoxh867nSQO0NkFk
 ETWkA9LMPPfHmfUD0jQzf7EKf8oC1YZmfzFowbt3bfNpoxJdvjWEGw0GVE5ypsQk88+K
 0LgQf8P7C5N4ZSgALHtNY/1BTW+Mc3nObs0jgbqczz4KxfXGwz42ysKEEiVb+/SVWkp1
 qCAQ==
X-Gm-Message-State: AO0yUKVO9G3HAmXEAuKSbbseHukcj9Ige+mGZCaskG9qDuvYhrL1mQXU
 RTvFbynRonq08eIQbngi6CkDaw==
X-Google-Smtp-Source: AK7set+C5vuXDyn0N3DwmfJhGYbTudTvN0JCpVOf4L9WMJ98qWMHNsAm687O5phQuyuhgvTfrXApuA==
X-Received: by 2002:a05:600c:2183:b0:3ea:edd7:1f24 with SMTP id
 e3-20020a05600c218300b003eaedd71f24mr7703130wme.39.1677435785398; 
 Sun, 26 Feb 2023 10:23:05 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a05600c348200b003e8f0334db8sm10385154wmq.5.2023.02.26.10.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 10:23:04 -0800 (PST)
Message-ID: <27f27069-b14a-45da-7e79-bdbd378e1a72@linaro.org>
Date: Sun, 26 Feb 2023 19:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] target/riscv/vector_helper.c: create
 vext_set_tail_elems_1s()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Frank Chang <frank.chang@sifive.com>
References: <20230226170514.588071-1-dbarboza@ventanamicro.com>
 <20230226170514.588071-2-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230226170514.588071-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Sun, 26 Feb 2023 18:23:10 -0000

On 26/2/23 18:05, Daniel Henrique Barboza wrote:
> Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
> load / store instructions") added code to set the tail elements to 1 in
> the end of vext_ldst_stride(), vext_ldst_us(), vext_ldst_index() and
> vext_ldff(). Aside from a env->vl versus an evl value being used in the
> first loop, the code is being repeated 4 times.
> 
> Create a helper to avoid code repetition in all those functions.
> Arguments that are used in the callers (nf, esz and max_elems) are
> passed as arguments. All other values are being derived inside the
> helper.
> 
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/vector_helper.c | 86 +++++++++++++-----------------------
>   1 file changed, 30 insertions(+), 56 deletions(-)


> +static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
> +                                   void *vd, uint32_t desc, uint32_t nf,
> +                                   uint32_t esz, uint32_t max_elems)
> +{
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +    uint32_t vta = vext_vta(desc);
> +    uint32_t registers_used;
> +    int k;
> +
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +
> +    if (nf * max_elems % total_elems != 0) {
> +        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }

   for (unsigned k = 0; k < nf; ++k) {
       vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
                         (k * max_elems + max_elems) * esz);
   }

   if (nf * max_elems % total_elems != 0) {
       uint32_t cnt = (nf * max_elems) * esz;
       vext_set_elems_1s(vd, vta, cnt, QEMU_ALIGN_UP(cnt, vlenb));
   }

I suspect ROUND_UP() could be used if vlenb is a power of 2.

