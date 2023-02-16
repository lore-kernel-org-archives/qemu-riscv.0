Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSjgD-0005qr-Ia
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 14:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSjgB-0005qB-60
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 14:12:27 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSjg9-0001OG-OE
 for qemu-riscv@nongnu.org; Thu, 16 Feb 2023 14:12:26 -0500
Received: by mail-pl1-x62b.google.com with SMTP id l9so523890plk.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Feb 2023 11:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sJM2vCNggiVN1gq6+2EeiaMfis3BprLLLN/WmGCl1BY=;
 b=RSCIt7plhQVMPcoJO4f26agjayCqW182l8o7/gOozQVJ9/WmMxsPTElQ4ZQ4DU9nC9
 ZuXikS7hB33PVi0Lqr99ZheLe4EF7aeoTVJdzNFzi2F3oGbWkOwxMo1gCKxpzs7/DtWx
 RSKgNJkjC3nIXORWBIJmsmDczDfSvaPRjyBuIliheE32UNWxUe209Wsbg8vH4e0lD0On
 dFHKteka/WMCoMDKjvWTXf56z3X+osVnZOIjxtIoVcXJb7mdBYLVkIKVrLhn4rQ/9Zwe
 kYzRhPGhq02XBqpJafTGwLTv2S0RMd4eFSkSpmU+BurXse3DzCqrYnwbRTrMGyjF7EkT
 3R8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sJM2vCNggiVN1gq6+2EeiaMfis3BprLLLN/WmGCl1BY=;
 b=hu1/C4pKwzSfZTrSbGetSVs+zF+Llh6bCBosqg0nVfHrGQzTsFikCguGsMbDkJazdi
 ollMms7btqWAhdvqH3Vt21l3Twax679BzhvHMJOz8nGR1NCJC3LB7b08TCaOXkgOqZtL
 vaD8oVvxi5ARyWIZJ/shTwx4sJhes/9Om7oV7iOtf4U/DBVYWo0+A1fDmUQGPei4DvHk
 yJDWBGxnwczbqLQAmYiIRRD42z6ly3so8SNvutYJk2ZF7vpTQgWDkyJ3GuNlfpaGmE4z
 +5HhyVVabGWQetzWFTqLBoMilbymnUz0hMTnCEs9QX9B76CeTgocOqjxc/PHmiYfvi4T
 f3wA==
X-Gm-Message-State: AO0yUKV1B/uMW5wfuS3rbynEC/1OBvKaZvjjv+Cp4bazCRbGxlPKaBjj
 0iHEIun/U48PDZRokhYR+3Zg7A==
X-Google-Smtp-Source: AK7set/tCn1GNub1fsBNsG0YjBDxIPCpZ2HxpP/GOr/218DOcnKwHN5gFKFSjVDfrVjiWRWejqsk5A==
X-Received: by 2002:a05:6a20:7290:b0:bc:3290:5759 with SMTP id
 o16-20020a056a20729000b000bc32905759mr7742745pzk.34.1676574744279; 
 Thu, 16 Feb 2023 11:12:24 -0800 (PST)
Received: from [192.168.54.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 r124-20020a632b82000000b004fb48ac77c8sm1521707pgr.85.2023.02.16.11.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 11:12:23 -0800 (PST)
Message-ID: <ca726eda-6df8-bcc0-15ca-3a38b8360d5a@linaro.org>
Date: Thu, 16 Feb 2023 09:12:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 2/9] target/riscv: introduce riscv_cpu_cfg()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230216162126.809482-1-dbarboza@ventanamicro.com>
 <20230216162126.809482-3-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230216162126.809482-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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
X-List-Received-Date: Thu, 16 Feb 2023 19:12:27 -0000

On 2/16/23 06:21, Daniel Henrique Barboza wrote:
> +static inline RISCVCPUConfig riscv_cpu_cfg(CPURISCVState *env)
> +{
> +    return env_archcpu(env)->cfg;
> +}

This structure is 144 bytes.  I don't think you want to be copying it around like that. 
Better to return a const pointer.


r~

