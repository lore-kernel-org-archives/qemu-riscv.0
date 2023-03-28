Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ph03D-0006mv-CV
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 23:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ph03C-0006md-2s
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 23:31:10 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ph03A-0008FZ-Cd
 for qemu-riscv@nongnu.org; Mon, 27 Mar 2023 23:31:09 -0400
Received: by mail-pl1-x62a.google.com with SMTP id ix20so10406602plb.3
 for <qemu-riscv@nongnu.org>; Mon, 27 Mar 2023 20:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679974266;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XjJmA0F5k+ZbyBVXiv7bH/3W6sYN1kzcn8aHqfEsG0g=;
 b=zud3K50DtWdURgPQ0MvFtkedxX89AjpIT5GNjYu0duzMxKv7MZONzTtnU1RAVLBH6G
 a06JGd1ZYQPfAXNMurwPvSsdAKt/8uKcW9tJyPRq5Q7MNk4edE++dtLBTl+3CxBBXB0V
 1t1xl+I4ERCEdTOaFn3W7fIMcXHg4+KWUPYAZrvgzC5GOD1dtYNeH53FHqHDEZlJPqmJ
 KRkTFMKkWl9m4CWB93JaAxfcNKNfBtZO6MaIfixPOV8UtL93SOMX9RQYojZINMbtRMeH
 5pdQLPGBzGLzSukmtN+YZiswmuLb1kBqinHuo7u+k8Oh138+3+kkZu17XVYz4fuMDqEh
 dExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679974266;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XjJmA0F5k+ZbyBVXiv7bH/3W6sYN1kzcn8aHqfEsG0g=;
 b=aQfuckMxugz3EyMG7ftPKD302p44dD+HYnMF7GvmpnfREzeoy0XdVKvnCoKC9HhSl3
 KKnAUg5FRhKIztHtKF5G7O5uIZDNJWOM6de+WGtglwdTT+n6K5T9DiAlU4Yc2xQKQYlW
 Hw4t5kYYrNzKLIZibjOxcB8xsZhhiOo3i5aMgmFCOlOk56+KxJUozTL3vmFAadDtVkc7
 ybYU0ge47t+fCext2Fzvq49d6JAZpMLjEV62p+QDxKwpnzV5fmRnvBW0g8WkfreYtcGb
 kIZa3QGhRnUiqGR0B4+hWy+TTTYlQrfiryPXPBQ/C+VWg45g9eomVQJyAewMiI0eAC+n
 HXzw==
X-Gm-Message-State: AAQBX9d53lv98xP9eozx+e5QVmkvqE7+QgtiQEu926DMUjVUF2OxvyOv
 NNSXt+S31GWM2o1rrvWjL80aWQ==
X-Google-Smtp-Source: AKy350acnRDWRMTAAclLGe35pAhxJ6nUNKitFVHiae5vl64aNkHdSNzk0n3SAYeuPPUJIg/c8Pfxng==
X-Received: by 2002:a17:903:1212:b0:1a2:56f4:d369 with SMTP id
 l18-20020a170903121200b001a256f4d369mr4522421plh.19.1679974266660; 
 Mon, 27 Mar 2023 20:31:06 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170902c21300b001a04ff0e2eesm19967923pll.58.2023.03.27.20.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 20:31:06 -0700 (PDT)
Message-ID: <aa9b6745-341f-2466-70c2-d574ce2a7c6a@linaro.org>
Date: Mon, 27 Mar 2023 20:31:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/5] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-6-liweiwei@iscas.ac.cn>
 <8fed2551-a67d-cd53-f5a1-f089f980aa08@linaro.org>
 <ae53e46c-b7e2-c986-a797-06a2630cc393@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ae53e46c-b7e2-c986-a797-06a2630cc393@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-List-Received-Date: Tue, 28 Mar 2023 03:31:10 -0000

On 3/27/23 18:55, liweiwei wrote:
> 
> On 2023/3/28 02:04, Richard Henderson wrote:
>> On 3/27/23 03:00, Weiwei Li wrote:
>>> @@ -1248,6 +1265,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>>>       qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
>>>                     __func__, address, access_type, mmu_idx);
>>>   +    if (access_type == MMU_INST_FETCH) {
>>> +        address = adjust_pc_address(env, address);
>>> +    }
>>
>> Why do you want to do this so late, as opposed to earlier in cpu_get_tb_cpu_state?
> 
> In this way, the pc for tb may be different from the reg pc. Then the pc register will be 
> wrong if sync from tb.

Hmm, true.

But you certainly cannot adjust the address in tlb_fill, as you'll be producing different 
result for read/write and exec.  You could plausibly use a separate mmu_idx, but that's 
not ideal either.

The best solution might be to implement pc-relative translation (CF_PCREL).  At which 
point cpu_pc always has the correct results and we make relative adjustments to that.


r~

