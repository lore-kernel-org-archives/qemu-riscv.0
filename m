Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3kKu-0001jZ-H3
	for mharc-qemu-riscv@gnu.org; Sat, 01 Jan 2022 14:46:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3kKr-0001co-Vo
 for qemu-riscv@nongnu.org; Sat, 01 Jan 2022 14:46:38 -0500
Received: from [2607:f8b0:4864:20::633] (port=45755
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3kKq-0005RW-9q
 for qemu-riscv@nongnu.org; Sat, 01 Jan 2022 14:46:37 -0500
Received: by mail-pl1-x633.google.com with SMTP id w24so22206355ply.12
 for <qemu-riscv@nongnu.org>; Sat, 01 Jan 2022 11:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8969tUHfXRWgTbX6sm68tXRe/102EeKxQ84VJR272Bw=;
 b=CDTYetogW7wZJbF6adxSObh5UqDdX5DNTxCXrcpDF00TQmEUObjVlb72Nc3n3gBqyu
 nfVnkLMm30NV3tAVDh9wj3L70DQgqnmxeka/UUvWbaQPsKXlmHzjnR6olbK3pXUwIvRe
 061tiAcf7bwGCE3iX0WOQsN9yhduNKwONAyJ9x73wKUYRl5syKpMQJ9YkOeep8xJ3ko5
 4uX8vUcnoCSSqFXb/8Dl647A8ZtrDwDXhN/ZK+lQGGThQvQa+Dv2P7gQaM+VuLKKM2VE
 C6sjd6/f7MkIzgF4Is/oHDJ39y6AqHt4x0cy7/w0AFK7iaxTPslq3J270ORcv+aJvCo9
 k3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8969tUHfXRWgTbX6sm68tXRe/102EeKxQ84VJR272Bw=;
 b=eNc5J8vQqGj+X8HSocILJS4ykmvrz2g3dU0YWC2U0Pw+oFcnP6E8732d1R6+JFBwTU
 uU35kI6lUFj5ph/ER/X8oWqLItmEVS3OWHhtUzktx3FVDicpzB2zGi3VNit8kXKADR5r
 u3gFVUwnRjTZtCx9Psfxn5pS5iNl8pwvsPlxI5uMSso3kAJF0qywdPf/7/p5lciV+SdT
 rNYtoIgmOW3l3qqn1OP81O38m1t7UeQwO9r29HnKJ0DOqBhyzdeKK5OSor9/puApl/lO
 cHP+sGMfctRNcNPDu+J8lw2xQJjJgQfl0zP8R6fZqkGB/pdqpOYyQ6Wl6kiz2q0voMCS
 hBqA==
X-Gm-Message-State: AOAM530jIM2BBZ4E3AQq8zj6fEBrxBDTuSX5SnXJuabc55iV/h05hiXq
 0z3waJKVgUoVMfCJmkZZShffkA==
X-Google-Smtp-Source: ABdhPJz9nhhia3nllvcZUUU6DUeXw7Qi+/8V+wgdYUNR5kBQLkoQth7q4EzeIuObgmXoktFgY5+FXA==
X-Received: by 2002:a17:90a:c087:: with SMTP id
 o7mr48109218pjs.91.1641066394391; 
 Sat, 01 Jan 2022 11:46:34 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:ffc3:704e:e577:9222?
 ([2601:1c0:6101:be80:ffc3:704e:e577:9222])
 by smtp.gmail.com with ESMTPSA id h13sm17762364pgq.63.2022.01.01.11.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jan 2022 11:46:33 -0800 (PST)
Subject: Re: [PATCH v2 2/6] target/riscv: hardwire mstatus.FS to zero when
 enable zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-3-liweiwei@iscas.ac.cn>
 <09ecdc1d-2f51-d5bf-1ecd-9ab6c132fd2e@linaro.org>
 <4b38e2e8-f288-f53a-71a6-f34feafb18b4@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <43631cc8-64c1-9998-f693-51bff18b0671@linaro.org>
Date: Sat, 1 Jan 2022 11:46:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4b38e2e8-f288-f53a-71a6-f34feafb18b4@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 01 Jan 2022 19:46:38 -0000

On 12/31/21 9:55 PM, Weiwei Li wrote:
>> This shouldn't be necessary because it should never have been set.
> Yes, I think so. However, I have a question about MSTATUS_MIE and MSTATUS_MPRV, will they 
> be set before cpu reset?

Yes, via warm reset.

>> I would think it would be more correct to have a positive test for RVF, rather than a 
>> negative test for ZFINX?
> It may  deviate from the original value of mstatus_mask with a positive test for RVF.

Oh, you mean misa_ext?  Hmm.  Interesting point.

When F extension is not implemented, FS is either hardwired to zero (without S-mode) or 
optionally zero.  So this looks like an existing bug to be fixed.


r~


