Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mE3xW-0000uv-QD
	for mharc-qemu-riscv@gnu.org; Thu, 12 Aug 2021 02:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE3xV-0000un-PP
 for qemu-riscv@nongnu.org; Thu, 12 Aug 2021 02:12:53 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE3xU-0001WU-56
 for qemu-riscv@nongnu.org; Thu, 12 Aug 2021 02:12:53 -0400
Received: by mail-pl1-x62d.google.com with SMTP id b7so5922456plh.7
 for <qemu-riscv@nongnu.org>; Wed, 11 Aug 2021 23:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6CiNj3Ch5OF89zBeCVhJiYUIWE2QWuGf7Uumn+yJGLk=;
 b=KHI3jhQoPR/0v0XS2ljnGH0DJoovnc+7xQTRMv8ZjpABLykJZxWwvCtiyOO5BhiBOs
 6YcSsbVr4yjjXAU3A7lvZZ39nUTP0sf7Y6GHyeBch5Uv5WKOjGcO3N1mvwUqBF0TNMMv
 sPQG8L+hkbsxNQzn3pzL2VG9XD/zg5/jPEr3MdqN5Yujkf0yiACRe824txHVWFgNAi8p
 BXvqAPoGPr28RIG3aHKccQLy9O1xWUaulbrI6WK0isuCvFLAJVWdFTNVL0p/M5SyIRWd
 JO+VSjkJ80wU62mBqTpLqhwUHpaNrIPT56iZIWCAzvsppjVqQ8v/drO3rWNvesb5YgWb
 YxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6CiNj3Ch5OF89zBeCVhJiYUIWE2QWuGf7Uumn+yJGLk=;
 b=PSnMGXbc3TtqSg4MNNE1L/py4mil+LD8VyfFSWETgXZ/8EBfsgu7F5B8XOOXByc7va
 KolTA5rjrxA0DEOHDkQvPSiSyFxDhwvjlqUUDhb5vId6zl9JkWxpX56aedeqfZuyZ9+V
 gxMTJdaLlHyiP4vNIQOyYVNKe7SGbJP5foQNASjPQwmZFzpvaiDh8dllxFAPEjf6PDgT
 uQd3d/a29919g+NwQOFw3fgD/rSbhOPLDAuPlyJQAo1trOTHsrahTekGYyknM/xd2Ynn
 4WH00t+NMrKEHRE4sDHrbiN2tBN4h1urld92Tx9HiPhbtHGxop3vV0Jj6UVABV9vSu/4
 P5iw==
X-Gm-Message-State: AOAM533i0JadxHJ7ykxJoj9/2FlHwUP7zBy5JAdAWBjqr5XGpIpQqEsY
 cX/GR5wjbGaTguG5YN/YH7JNrA==
X-Google-Smtp-Source: ABdhPJylQP8vugRtBw7BEgaMwrfmhU5oMsJbNKdO2IYw7HdEHgN/VjO+f1mHHKPgPUWnIri/9ajftQ==
X-Received: by 2002:a17:90a:f314:: with SMTP id
 ca20mr1546036pjb.210.1628748770445; 
 Wed, 11 Aug 2021 23:12:50 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id l126sm1890464pgl.14.2021.08.11.23.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 23:12:44 -0700 (PDT)
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
 <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
 <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
 <249ce5f9-333a-7186-36bb-a2ecadb19254@linaro.org>
 <538f3928-f681-cb9e-7850-48469ea4ccd5@c-sky.com>
 <15f69497-3baf-abf1-ba9e-91ac1e883d63@linaro.org>
 <bbc67da3-3eef-6e57-8610-6b496f30b777@c-sky.com>
 <6cbece33-7f92-0247-7efc-41b34b0b4d7d@linaro.org>
 <d24feab8-1ce9-fef7-6b43-b11377faec04@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6f3a7f2f-d1f3-7910-dec3-75a06b5521bc@linaro.org>
Date: Wed, 11 Aug 2021 20:12:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d24feab8-1ce9-fef7-6b43-b11377faec04@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Aug 2021 06:12:54 -0000

On 8/11/21 7:03 PM, LIU Zhiwei wrote:
> 
> On 2021/8/12 下午12:42, Richard Henderson wrote:
>> On 8/11/21 12:40 PM, LIU Zhiwei wrote:
>>> If the software doesn't use the high part, who cares the really value in high part? Do 
>>> you know the benefit?  Thanks again.
>>
>> I do not.
>>
>> I simply presume that they already have the hardware, in the form of the addw 
>> instruction, etc.
>>
>> The mistake, I think, was changing the definition of "add" in the first place, which 
>> required the addition of a different opcode "addw", which is then undefined for RV32. 
> 
> Sorry, I don't get "the mistake" here. Do you think the specification is not right.

I was critiquing the development of the risc-v specification, in that there are 
complications in the current specification that could have been foreseen and avoided with 
different choices years ago.


>> They should simply have had "addw" and "addq" as different opcodes that didn't change 
>> behaviour.  Etc.
> 
> I don't get  this statement. Is it related to UXL32?

No.  I was just musing.  It's not important.


r~


