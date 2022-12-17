Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6LE7-0007Q1-74
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 19:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LE1-0007Ma-Hz
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:38:49 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LDy-0005HU-Qm
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:38:49 -0500
Received: by mail-pg1-x531.google.com with SMTP id f9so2843073pgf.7
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 16:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iZ7t150LD+fHFcVkoHUY4qdqwU8UWj1E+gqLmH6I/EE=;
 b=GMNos0pBK5YBIMoKQS3Ymay1SCIwr/ZQEGZq/NCxfj9tHnVBMMQYz5T9swoMoy0I0Q
 Sktu0bKQriT+ZG52ui+sQRoVwOrd5xs90Y5kcWJ7BuvJd/xgKHs7w1XOcshIKKHr2N/U
 WgXXfV3nlttpkSKp41uqcCmFkVlacxFrb5e17Nv01iCuNsRhnVHBhi3NcY14jexNn6Xj
 A85zExGuN4BKvNPzvBKJB5ybDuNIguv6sLROpf2hxNKPlamuRn0aCGKEQtc0PC5RR3OR
 s9TPbAVec1gTSbEi3jwr37l9xwu4mETNxoGy4wFAfPW+H+p2cmf/UeD936rwlLr9QPQo
 7HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iZ7t150LD+fHFcVkoHUY4qdqwU8UWj1E+gqLmH6I/EE=;
 b=2KK6lNdVbg6s9Vg81f7qgUoXjMR49dqhCsIGjFNUnqCpfMlqNS2dCK9pRXN1OQSngS
 m/tdU9z1kYfBSPFmo/uKHqHEMquw85CN9XZS8OApTdoPjBO8PAL55XNHVSxKf4Ra2eja
 Qn0I8GO4rhpbgwhnMnLpu8hW1U75VM0Tzqc3MZ/AbfurwVJSLJbRP2k33MWDPWod6WKm
 s654HGybVhvSQz2XjOonunn2VUiMkPFOOyC2yTmcgJgqZeyJl5fGT/gzXJLG5mVUG7Tr
 YpFDxuWdh1R4C5ebM7oibNOFQp76DWJkchuGRZU1o7dFdYII/glSHXXTxKVJb4AXcjfB
 N5Fw==
X-Gm-Message-State: ANoB5pmje7yp2qnu0O+5taE3Vtmr04jc3S6tN4T8zOZUoxWlzy9gKEF5
 QWMmpcDTK5EtmM0+JxzeIkyIpg==
X-Google-Smtp-Source: AA0mqf6/qpPwiLD2/H4bc7cnsJ4tYlMqYGdPQVN/nFfkgupuAOsC9wbNKNzN/7bXayMuqv84+/pGWA==
X-Received: by 2002:aa7:82d7:0:b0:575:a4f5:7812 with SMTP id
 f23-20020aa782d7000000b00575a4f57812mr33286755pfn.4.1671237525350; 
 Fri, 16 Dec 2022 16:38:45 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020aa79534000000b005779110635asm2064557pfp.51.2022.12.16.16.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:38:44 -0800 (PST)
Message-ID: <112ddce1-ffc4-d50b-9cc8-72578faba11d@linaro.org>
Date: Fri, 16 Dec 2022 16:38:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 07/10] target/ppc/internal: Restrict MMU declarations to
 sysemu
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
 <20221216220539.7065-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
X-List-Received-Date: Sat, 17 Dec 2022 00:38:54 -0000

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/ppc/internal.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 337a362205..901bae6d39 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -242,9 +242,12 @@ static inline int prot_for_access_type(MMUAccessType access_type)
>       g_assert_not_reached();
>   }
>   
> +#ifndef CONFIG_USER_ONLY
> +
>   /* PowerPC MMU emulation */
>   
>   typedef struct mmu_ctx_t mmu_ctx_t;
> +
>   bool ppc_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access_type,
>                         hwaddr *raddrp, int *psizep, int *protp,
>                         int mmu_idx, bool guest_visible);
> @@ -266,6 +269,8 @@ struct mmu_ctx_t {
>       int nx;                        /* Non-execute area          */
>   };
>   
> +#endif /* !CONFIG_USER_ONLY */

Eh.  I suppose.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


