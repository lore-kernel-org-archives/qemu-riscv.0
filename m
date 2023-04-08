Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pl0DH-0004Ha-T3
	for mharc-qemu-riscv@gnu.org; Sat, 08 Apr 2023 00:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl0DG-0004Gy-Br
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:30:06 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl0DD-0007Dj-U9
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:30:06 -0400
Received: by mail-pj1-x102e.google.com with SMTP id v9so5152021pjk.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 21:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680928202;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wQs4SC5lYlKd/34OSFcaA0sSEu14qWxU3jsCupypxlU=;
 b=kUaGPTveG0lxEI28vTpDb9Jw7OfLi4TPDm7kQSZcLfBmpgcZpWdfC+nC/VxxkU8g0D
 uhY6ay8Ow6fqnxgPs2ScCkFW1hcpY7bHeEG4IdUb84QinAnoHlZ/bD+jiGDDXNMAb7wl
 Npca4GkUEsp31W/9wZ0nnBKCzHIqzQFY5qH9Qc0eEflC/0q10hpGTG2fpyWmuFAX5HvI
 oK64dK+t86fzN0Fs16v9ZDiZm2LWdeyflbaMdQKGIXyrAgXu103KIOcVnM9mWpipo5OX
 Nh6sD6s0cr0WvBlYzRNzJAi8pxf7y2zmuhnUcQx+8qbwYEnNCaHWH/aUzB2Bef22N40d
 KNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680928202;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wQs4SC5lYlKd/34OSFcaA0sSEu14qWxU3jsCupypxlU=;
 b=mnAwr4kW6mF/Y/265CjcNxVbtj5CEq5x/w0F/jMH+4rJcssE1xtcj+KeJayXoXW3Cc
 xLYIgqsqZmEPXZuP9limjNQrvbmSInlmSyU1luKRAoyUqQg67aLRtYM5o4aZICyuw2eF
 dKOVFtpjDitpPKhLOV8k79ZL7uS2h8gn4CYC9F2/Ypk2vp6kNfwPx1hlUp14kePtyXDJ
 pyZzN29pNOnjfQcjqKN3DrP9hUUCRF2JqeyMv/a/G+tKCQG0oGHQfPMM1Ye5Qi+JNumB
 mDfnk42eiM5FCPHMNqR1vHOsKUu5wkS0svvIvO+jfRPFJQXcAiPEvia4N7x7yL9RAJO2
 6haw==
X-Gm-Message-State: AAQBX9ev3zB1MTvBBQSAivf1aBTj4o0691rq8nWCFjX7NQ3t5Nj2uXzk
 2+o7eXSFc4p1TwUQaN6jhWfAsw==
X-Google-Smtp-Source: AKy350bSf+NJer4y36s5JHSJa51+w0WLdRxuVnS+TxQLWRCkIT+ZrofzrzsIKVKZztNYWN9UFvABiw==
X-Received: by 2002:a05:6a20:ce1f:b0:d8:bed9:33cf with SMTP id
 ic31-20020a056a20ce1f00b000d8bed933cfmr4258225pzb.17.1680928202146; 
 Fri, 07 Apr 2023 21:30:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a62e90a000000b005a7f8a326a3sm3781655pfh.50.2023.04.07.21.30.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:30:01 -0700 (PDT)
Message-ID: <73bb88d3-7218-6ecf-2feb-2ad340d5e61c@linaro.org>
Date: Fri, 7 Apr 2023 21:29:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 09/10] target/riscv: Restrict KVM-specific fields from
 ArchCPU
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-10-philmd@linaro.org>
 <ef63cacd-ea5a-16bb-994c-bf7a0ea3ac6a@linaro.org>
In-Reply-To: <ef63cacd-ea5a-16bb-994c-bf7a0ea3ac6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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
X-List-Received-Date: Sat, 08 Apr 2023 04:30:06 -0000

On 4/7/23 21:28, Richard Henderson wrote:
> On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
>> These fields shouldn't be accessed when KVM is not available.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>> RFC: The migration part is likely invalid...
>>
>> kvmtimer_needed() is defined in target/riscv/machine.c as
>>
>>    static bool kvmtimer_needed(void *opaque)
>>    {
>>        return kvm_enabled();
>>    }
>>
>> which depends on a host feature.
>> ---
>>   target/riscv/cpu.h     | 2 ++
>>   target/riscv/machine.c | 4 ++++
>>   2 files changed, 6 insertions(+)
> 
> Yeah, the kvm parts need to be extracted to their own subsection.

Oh, but they are.  Ho hum, it's getting late.


r~


