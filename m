Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVLsH-0005bD-Pz
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 19:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLsG-0005ai-5p
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 19:23:44 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLsE-0000QG-12
 for qemu-riscv@nongnu.org; Thu, 23 Feb 2023 19:23:43 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so1122665pjb.1
 for <qemu-riscv@nongnu.org>; Thu, 23 Feb 2023 16:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kfKaE4zgkzHPvaVz7ODj7i+YDgaWj7UxLNCOcc9yQ5Y=;
 b=r60otlMEIYbQ6v9sFu+PDkwHwbpq/KJjphZ/ydWS5aaCTPm6ZE5gTkXcDNwmyfAuL0
 3M8YIYPB+HMfuVY5o+6KBh9kXcF+cWnOa6UH0ux0fhiSX/M4VPiLiCqrih5gaZ4cM5sO
 cqzaCAtBpcsuXz2aWiXwqn7JnWm/wMXrd58EHTANPivqe3PU5pqhIa6eiSaYHsUhPRe8
 P5o5oOafKKuEolsfuNQ4SqNVttuw1YvzhiNHc7KuYTY61OTubxxHFosbmVUFjMyITqrH
 lIL8eDNchXL9lyU+T54Z8VuW0uLTXsDkwPbTmfwOMB2tzD5Nj8mcWkzQvbgqMiiZIcDg
 SxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kfKaE4zgkzHPvaVz7ODj7i+YDgaWj7UxLNCOcc9yQ5Y=;
 b=0wxJ6eYqjJapB7BRfZSY9EfGlmhmtS4Rn71jJ3qr3LEjGVk+BdlJJjDLiAHj9wzRSt
 RtPgBXhX2ZxxU8UeorMC7NA9O6lnSKIYfD3zH/fZVa7me+ghfXp6SfHt/lDtLiLQHJbR
 cO5FErKSD2KYKldsuWpDpyckffa8BQrW9AYVMf+vilsUI5M85Kdh7NXNCnuh38XozkbI
 fsA1OysNjyUWVI1jdSoFAUyBfFBvHbjXT8WEMq+TEPAP332jskrz1afJP5KEgZJKaR8N
 9zmu+t3fxoPoZ8WE42cHgxFvp+AVvQYQGjpPl5hqvRz17o9SZs8nBjME+AZiXTw3Jttz
 /pCA==
X-Gm-Message-State: AO0yUKXiCkKVu2EtJy0UNoamFJTgUn78VAKwOJD2/dZst91h6wN5ar8q
 OpHR/PWvHjAVADT7Fz554Cc8viSBsOFyZOpQDeY=
X-Google-Smtp-Source: AK7set9+n/4emFTMm110a34dvRcSs53nGjqTBTMD9iP4DIYV9D0RnLLu8hdwlvwuU6Pqov9AhEl6ww==
X-Received: by 2002:a05:6a20:1585:b0:c7:13bf:695e with SMTP id
 h5-20020a056a20158500b000c713bf695emr15791938pzj.18.1677198219228; 
 Thu, 23 Feb 2023 16:23:39 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 r24-20020a62e418000000b00587fda4a260sm5538746pfh.9.2023.02.23.16.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 16:23:38 -0800 (PST)
Message-ID: <d27b10d7-a98e-0f81-6e63-ee13cdcbaff5@linaro.org>
Date: Thu, 23 Feb 2023 14:23:35 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 1/4] tcg: add 'size' param to probe_access_flags()
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-2-dbarboza@ventanamicro.com>
 <78a0f5a5-c2da-c016-1f15-981cf80bf676@linaro.org>
In-Reply-To: <78a0f5a5-c2da-c016-1f15-981cf80bf676@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Fri, 24 Feb 2023 00:23:44 -0000

On 2/23/23 14:19, Richard Henderson wrote:
> On 2/23/23 13:44, Daniel Henrique Barboza wrote:
>> +    if (unlikely(flags & TLB_NOTDIRTY)) {
>> +        notdirty_write(env_cpu(env), addr, 1, full, retaddr);
> 
> That '1' should be 'size'.  Fixed locally.

Hmph, well, that matches the interface, but it's only used to figure out how many pages to 
process, so any len that doesn't cross a page boundary (which we have checked) is equal 
bar the tracepoint.


r~


