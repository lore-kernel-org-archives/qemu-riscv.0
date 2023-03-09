Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paIjW-0007DI-Ml
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 11:03:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paIfq-0001Jx-0R
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 10:59:22 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paIfo-00067I-AB
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 10:59:21 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1767a208b30so2787665fac.2
 for <qemu-riscv@nongnu.org>; Thu, 09 Mar 2023 07:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678377558;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=en/x0++neyKzTTW7zBGiQHkzbDqUKzcRNTpSI8eOXuA=;
 b=jDugWqAv2yoOjpWuwMNhE9p54wVnQkjYwUsCUVJwfHVkEF1Hs1eGocs4jPT/7pc4HW
 g0M1wu9ikUinHdcuiO1sn1+R6nzgWpX4oBlWfouWztPZyGi0mD2TvDYBHUpUuJslviBw
 qGweYZPyyb2IZU82NKalY3zLAENVyeRiCK6O2UfaB4rVOf+lWh6ngBtMhLeQAXUojlEi
 nelZLE7UvGMjJDzdcFBClDsx+MHWgmGmHYFCChH9G5KwNSjbmRlY6lyykw7/zzn7HK5b
 31avZ9BOqlvUXPUXVgPQ/LS4PCXHRR0c4MrLrgp3b3eLOINhkH6BExm0WGYUlbJaxp73
 NXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678377558;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=en/x0++neyKzTTW7zBGiQHkzbDqUKzcRNTpSI8eOXuA=;
 b=7barfrFSWraPD677cAof/MeMrHkrs7qlNcoG+qMtd1g5H+YLFPL1ZgcInVmKRh0w3D
 VLilczPW1AYj5mQjn4JKy1/1JURIsH9XUZxUS6dRVChy3p9i6rh1JjZRvRYuUmttCVGV
 iCuqchoeYJINxJnn+7JlTL7eTzoZ8wHo+8VkIApSXSmP9qnT4raH8uPMJdiTadhBUKUT
 dZl6q1qnnGhH8aibkQA03gTkmB4/azaC9Yp6yB3/n8fiVdrEPNA9T5lftfgdt7CPdvHS
 1bk2ALKv23bJzpM5np43vPqNKpTN55HHI8nLr1pp2tl3iU4zhZWlMHPh1OjMnWgNnKGt
 Ouew==
X-Gm-Message-State: AO0yUKUMH5j0/zDIYcnyEjyn8s1SxYT3z6UHaZ8m/juYwucuaMa0beIi
 GSYlMvmkbuzsAUstDokFkuON3A==
X-Google-Smtp-Source: AK7set9OUefXpCzqbwFGBUrnSo0vAHnuydtOShPxfH8+A5GF25j+2zXt8GS8xa6QxrO7qQAZjaKebg==
X-Received: by 2002:a05:6870:ec86:b0:172:29bb:5b77 with SMTP id
 eo6-20020a056870ec8600b0017229bb5b77mr13951182oab.48.1678377558174; 
 Thu, 09 Mar 2023 07:59:18 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a4addcd000000b005251ba039f4sm7412355oov.23.2023.03.09.07.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 07:59:17 -0800 (PST)
Message-ID: <ed57ece2-57aa-40ce-7917-51d339e55c20@ventanamicro.com>
Date: Thu, 9 Mar 2023 12:59:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 04/17] target/riscv: add PRIV_VERSION_LATEST macro
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
 <20230308201925.258223-5-dbarboza@ventanamicro.com>
 <551d736a-3219-c90f-1fd2-b7c9074a4f6d@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <551d736a-3219-c90f-1fd2-b7c9074a4f6d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
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
X-List-Received-Date: Thu, 09 Mar 2023 15:59:22 -0000



On 3/8/23 20:00, Richard Henderson wrote:
> On 3/8/23 12:19, Daniel Henrique Barboza wrote:
>>       PRIV_VERSION_1_11_0,
>>       PRIV_VERSION_1_12_0,
>>   };
>> +#define PRIV_VERSION_LATEST PRIV_VERSION_1_12_0
> 
> Any reason not to make this a enumeration value:
> 
>    PRIV_VERSION_LATEST = PRIV_VERSION_1_12_0
> 
> ?

Hm, not particularly. I'll do that.


Daniel

> 
> r~

