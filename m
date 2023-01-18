Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIBro-0001Tm-HQ
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 12:04:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIBrW-0001Q4-Cs
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 12:04:42 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIBrU-0004uO-11
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 12:04:34 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so2082663wmq.0
 for <qemu-riscv@nongnu.org>; Wed, 18 Jan 2023 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GhIDJla6/nA+BKdGW5qzvhtWK2xWORu3BQcD1wwO0es=;
 b=d+09P83IkLs9WjOxmj91WCRYPvd2D6SiN3Ubk5ptU2wWit26TxWwILBUm+U+jD2o82
 DbHUz9MGUOtUE5hHHiO6BlWjzaPTRqpi1pClmF9pk5xaGuU5kpyciQPPpBjhaKgPKDks
 3H5dbX6shxF0K0P9MVA+1EYpYWKtd5+OCYriMXJFlhjPZoTLNJtV9OPmg8kUWih73LJk
 1RZTnHFoK77u6Ge8Lwhvdtaij7I3+1jo4hw+lmANurHWUa0NVmW8by+r0KAGmFWI8b3x
 LWkCr0YQQyMVYq9LBm9NSDPXhYryhXu3JFHzECVGzgFRXKW3khMuEMsiiEH/wTwlp0bR
 EGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GhIDJla6/nA+BKdGW5qzvhtWK2xWORu3BQcD1wwO0es=;
 b=ZHeXhc6PygOpEQWiC6pgUkkKHcM5j6lM1MRSCPSzG0BLHBJcC7ed4+iu382t63SwN6
 1MjQtER2PwT4VabXEreQ7rc7S+s9BJ6mWm9SfsOyFSM7j2LX6c32zD2pf7NGJOYaKrAc
 fMVt17fDxSATblb4lu2y1rCTYkARLgLvuu+81RhTMvHS1CJBivqKIUNqrqDryHWSLgVK
 7KdXdzWCUX8TggpOLDjBGjlPPH4DaAsdVo5cpl5J189J+lkGsVo6B4CpkbEyG1QOj6mU
 deA9I60+8jg6Wv0nzHxYnBqD1XVHwj6XdG7U2xIsFFm0AvlP0gzX9SmDOaNWtpNSCVgE
 P+Bg==
X-Gm-Message-State: AFqh2krV3Jswe12ixbIbahysFSYnABc6Sc2j2mwxhyyXmOCY1bsw3bkO
 LEm1qZpBhtk7G++Br2fL8W5+4g==
X-Google-Smtp-Source: AMrXdXtdGVU8envdYG2TAXpMYp+bfMGnNfXVZvhx8/UfRWX7bOMNcpAgCTXPTrJ+LPy/vD7nRsYhYg==
X-Received: by 2002:a05:600c:714:b0:3d9:ed30:79d with SMTP id
 i20-20020a05600c071400b003d9ed30079dmr7455171wmn.18.1674061469522; 
 Wed, 18 Jan 2023 09:04:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c074a00b003db0ee277b2sm2324070wmn.5.2023.01.18.09.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 09:04:29 -0800 (PST)
Message-ID: <5f6c99eb-fca8-2270-fa4d-758e548b05b1@linaro.org>
Date: Wed, 18 Jan 2023 18:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/4] bulk: Coding style fixes
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Gan Qixin <ganqixin@huawei.com>
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230111083909.42624-1-philmd@linaro.org>
 <20230111083909.42624-3-philmd@linaro.org>
 <fd06e139-c6e8-e978-c0ed-3e9aca258f19@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fd06e139-c6e8-e978-c0ed-3e9aca258f19@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Wed, 18 Jan 2023 17:04:43 -0000

On 18/1/23 17:09, Thomas Huth wrote:
> On 11/01/2023 09.39, Philippe Mathieu-Daudé wrote:
>> Fix the following checkpatch.pl violation on lines using the
>> TARGET_FMT_plx definition to avoid:
>>
>>    WARNING: line over 80 characters
> 
> It's just a warning...
> 
>> @@ -420,8 +421,9 @@ static int get_segment_6xx_tlb(CPUPPCState *env, 
>> mmu_ctx_t *ctx,
>>                   hwaddr curaddr;
>>                   uint32_t a0, a1, a2, a3;
>> -                qemu_log("Page table: " TARGET_FMT_plx " len " 
>> TARGET_FMT_plx
>> -                         "\n", ppc_hash32_hpt_base(cpu),
>> +                qemu_log("Page table: " TARGET_FMT_plx
>> +                         " len " TARGET_FMT_plx "\n",
>> +                         ppc_hash32_hpt_base(cpu),
>>                            ppc_hash32_hpt_mask(cpu) + 0x80);
>>                   for (curaddr = ppc_hash32_hpt_base(cpu);
>>                        curaddr < (ppc_hash32_hpt_base(cpu)
> 
> ... and in cases like this, I'd really prefer the original line.
> 
> I think it would be better to just fix it if checkpatch.pl really throws 
> an ERROR instead of a WARNING.

See this thread and its references ¯\_(ツ)_/¯
https://lore.kernel.org/qemu-devel/CAFEAcA-yMZjJW=AJm=XLbrub1D-8iX0OKE78V_TzQmfC2RdXyw@mail.gmail.com/


