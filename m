Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kX88F-0001cG-Lq
	for mharc-qemu-riscv@gnu.org; Mon, 26 Oct 2020 15:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kX88E-0001ZM-2v
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2020 15:26:14 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kX88B-0000wJ-Sc
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2020 15:26:13 -0400
Received: by mail-pg1-x544.google.com with SMTP id x13so6614593pgp.7
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2020 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mjts2GkaRqscG5JomBcPAZcc0j1f7yqSkoIRfcxfC+g=;
 b=S8prO0r8TLHh8J497E5qU53RhJ+wT0wfHbU40K+xIzfdCLk+4ZllgNldcDq6PPoMCY
 Luoy3qO7kKLeCVxKcC9O5NyEba/62jCJBkh1szsYkIGfZ8lYVq4mJNoiunK7m3Dq20sK
 fluKPXg21VPVdkpm0mY/9BW+gMAto2zsIoeSZMP5D9adxF89KDafA/OlKZqHl7J0joI1
 qEM4Ee5o/iXTm7Ur6BUZCxkV+i769ImynO5cCeOlXerkg+9btXw5badYCUZgaah7T6d2
 nfkBP+fx6YFtR7RjTNjhK+Rc8Ky7vNq4/lQlPeq4/xKCycXPdLoFNOm5D4id63rbo0Ov
 eJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mjts2GkaRqscG5JomBcPAZcc0j1f7yqSkoIRfcxfC+g=;
 b=AuXD/JWG0Wl0nk6PlpeJ9XIFRXKBHgMWVf8ss445pAMPdjt4OM6QFS5f9+ch6HmPqe
 6Rut2puOiBRcylhxKY18AtNMjuI+9NAHiLNMcuRstf6G9LkVCRavagA+74qElxlDfvye
 p2ptxH5i2Wo7cb9+NeMfi+qnihAcx32/PuR3oIYd5K7E6/+9pJbJRORPfimXGU0sDIHj
 esXxof2dhkLLzo5XdHMsTV6Zf9d+eVwptXFjCIEvSbpZOHYLn/SAjqyhqN5SbwPsloVd
 DHRHGyZJW6ahB2f2bFcoHJqEXRQJn7/yINyYwr3Zh37nrh3uRWbD7fCikTdS047K7fY1
 SuAQ==
X-Gm-Message-State: AOAM5302Hm3QJ4MEX5UyQwV3MQT6jYwG3t0o5DVTYqCtl8cIfO3vbD4O
 4VQ3MwTiGpM3/g6KbdrsdIPCJQ3hQaHYog==
X-Google-Smtp-Source: ABdhPJzm1viLcovURrsyc7nIMvHhAN2OJxsu9M7cdxJx0Qvzn5v9wCddn6xNij21yTF71389SjMz1Q==
X-Received: by 2002:a63:d442:: with SMTP id i2mr15353746pgj.181.1603740370061; 
 Mon, 26 Oct 2020 12:26:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z10sm12432929pff.218.2020.10.26.12.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 12:26:09 -0700 (PDT)
Subject: Re: [PATCH] riscv: Add semihosting support [v8]
To: Alistair Francis <alistair23@gmail.com>, Keith Packard <keithp@keithp.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <20201023214940.917885-1-keithp@keithp.com>
 <CAKmqyKMzHARF7C9Lo8SYFBbPNa_=ibbWBNnedwFbe8AY=DdXVA@mail.gmail.com>
 <8736246ub3.fsf@keithp.com>
 <CAKmqyKP6CE1YpkfKo6=zghAbdN58oQvYNoafq70dvmR6OHyhtg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32eb3f3a-1256-ac68-c2ad-e887269ee796@linaro.org>
Date: Mon, 26 Oct 2020 12:26:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKP6CE1YpkfKo6=zghAbdN58oQvYNoafq70dvmR6OHyhtg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.167,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 26 Oct 2020 19:26:14 -0000

On 10/24/20 8:00 AM, Alistair Francis wrote:
>>>> +#define RISCV_EXCP_SEMIHOST                      0x10
>>>
>>> I don't see this in the RISC-V spec, it seems to just be reserved, not
>>> for semihosting.
>>
>> Hrm. It's entirely an internal implementation detail in QEMU and matches
>> how semihosting works in the ARM implementation -- the presence of the
>> semihosting breakpoint raises this exception which is then handled in
>> the usual exception processing path.
> 
> It's not fully internal though. Someone running with the `-d int`
> command line argument will see these exceptions, which don't
> correspond to anything in the spec.
> 
> Is there some way we could at least convey that information to users?

This is no different to EXCP_DEBUG, really, which is also internal to qemu but
user-visible in the same way.  Just adjust the logging in riscv_cpu_do_interrupt.


r~

