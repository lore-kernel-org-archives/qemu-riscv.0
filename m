Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6LFR-0000Pa-PL
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 19:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LFK-0000Nd-0l
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:40:10 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LFH-0005eG-8O
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:40:09 -0500
Received: by mail-pf1-x433.google.com with SMTP id w26so2845579pfj.6
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jghR/KN8Mxstogtc1na7VoaWWs7m/MAHQG9pSqMvyL4=;
 b=Rv/mOyw7Ah8LF6nR6IQXyfaVfNdPkMUjID6JUw7mzNS8huYc6nELsImhDR4oP5B41g
 tQnbV3XAWiB45Y2fpEy3WrZL5jtb0b6uaBBVVdr458T9/LXN6SvubEyQFOTZVKCSdnfK
 9KUTEbzMSUiwfHkw0jRVeOSY/8A+vrQKFG7dtY38vUWfvqapH5lkg/VQGO4F7g78S7B2
 q60r43W9vRK/Zcz09B1ko6qn1kTnvoxCA/sgvc90BJ5eTWfv9Mr4v2PfNzukgidsWCfs
 5XziQdLT/616w1s802Jw/51cRCvNkUyNNfKz2lKg0AVKWlkUqqu8xQ7k0p+M2REfwcRq
 MAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jghR/KN8Mxstogtc1na7VoaWWs7m/MAHQG9pSqMvyL4=;
 b=7qZaCF6T7GIyg+PQuQRovmu/xzr7juo2SFYBAKZylbSV6B6MMxzcaXLOiW5GeRByd2
 cZlZJ+o6smTjZiVUVm5+ed6v8nPyIVviEWoU6Yg6bL0Ujl36lMFAoL1mTnRhGq/vJVYY
 FyOqFOHCYjuTRwxdgkgyfbngbXgBIRek+P2o5zt36c7jVHyHI+NtqQnk8yqLm38sGeSo
 eiamn9KqiBvyhfUyOEuKPqbXAONalS2ScjPSwYOs8czXkYs6ojD4M45TF71MvrSPPRkl
 PNOoizJ0M4sKnpX4hWyvQWVmkhDmimikzs1hr7RnS+J++7nyk07Ev2zbOgaS4cY2HPC6
 OPMw==
X-Gm-Message-State: AFqh2koZeiQEdDFEynI442sXzlfD06clpWB6bBEaGfUPZhcs10Igfd4p
 b0PzSg53Ga63GGbgtAHyv+8Nsg==
X-Google-Smtp-Source: AMrXdXt0BN5omY/y2JUnMKWZX9iGWkWdY15VO889Yol5mIsNQOWnG0q4NS3c0416bLxpvRxnxBFm8w==
X-Received: by 2002:a62:4ecd:0:b0:57a:69d1:c15b with SMTP id
 c196-20020a624ecd000000b0057a69d1c15bmr389828pfb.21.1671237605594; 
 Fri, 16 Dec 2022 16:40:05 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 y184-20020a6264c1000000b00576d4d69909sm2067625pfb.8.2022.12.16.16.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:40:05 -0800 (PST)
Message-ID: <b4a14228-2f7c-e53b-30aa-3833d5d80992@linaro.org>
Date: Fri, 16 Dec 2022 16:40:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 08/10] target/riscv/cpu: Restrict sysemu-specific fields
 from CPUArchState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-List-Received-Date: Sat, 17 Dec 2022 00:40:12 -0000

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> The 'hwaddr' type is only available / meaningful on system emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/riscv/cpu.h | 34 ++++++++++++++++++----------------
>   1 file changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index fc1f72e5c3..bd4e16d946 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -368,16 +368,6 @@ struct CPUArchState {
>       uint64_t menvcfg;
>       target_ulong senvcfg;
>       uint64_t henvcfg;
> -#endif
> -    target_ulong cur_pmmask;
> -    target_ulong cur_pmbase;
> -
> -    float_status fp_status;
> -
> -    /* Fields from here on are preserved across CPU reset. */
> -    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> -    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
> -    bool vstime_irq;
>   
>       hwaddr kernel_addr;
>       hwaddr fdt_addr;
> @@ -388,6 +378,16 @@ struct CPUArchState {
>       uint64_t kvm_timer_compare;
>       uint64_t kvm_timer_state;
>       uint64_t kvm_timer_frequency;
> +#endif
> +    target_ulong cur_pmmask;
> +    target_ulong cur_pmbase;
> +
> +    float_status fp_status;
> +
> +    /* Fields from here on are preserved across CPU reset. */
> +    QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> +    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
> +    bool vstime_irq;
>   };

Except for fp_status, all of the other fields that you move are sysemu specific.


r~

