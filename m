Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3kNC-0003Ok-Bl
	for mharc-qemu-riscv@gnu.org; Sat, 01 Jan 2022 14:49:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3kNA-0003LW-7d
 for qemu-riscv@nongnu.org; Sat, 01 Jan 2022 14:49:00 -0500
Received: from [2607:f8b0:4864:20::536] (port=34696
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3kN7-0005t7-K5
 for qemu-riscv@nongnu.org; Sat, 01 Jan 2022 14:48:58 -0500
Received: by mail-pg1-x536.google.com with SMTP id g22so26588617pgn.1
 for <qemu-riscv@nongnu.org>; Sat, 01 Jan 2022 11:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5IiEudQMvResE/8WiUfbWhjW+91YE1wdR/BfYJc4HVQ=;
 b=rQD7joDyMLhlHeZZ79S2K0cHQrU5md/gS0Oe8a1M7tkzFfackImlV5PDs8oLKKEzr4
 r82w6x5LMTAeeghdxuqlW7CeZcL8ByvQcJPSi7TZkbrDeqXH6oulXAxW3HkRzUDmB69j
 Y7XsENVmOKnUXRhAE07ixUg6szz/7//9fUZZ7Ki8KOEy3Lkf1PbV79UHjAgi/KEiJRLn
 5lLgBshLOCIdZ+dl7q2dFiq9u+tPOJOA2mY75T4nXemo/VdX+1HIZyII0xBV64AREH1J
 VeV8eXz1eAyNL8o4aGhZ726i9G0+07qNzuar9gM48CQMvoZkzF9fn2WcMwcNlddRr63W
 8hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5IiEudQMvResE/8WiUfbWhjW+91YE1wdR/BfYJc4HVQ=;
 b=deKrgnTcX3Mpftblbk+vc3gsVcHwBHivh4iKPhRxEMvoDbapf1ji4YdK+WytoN9oTg
 pv96+3AR2EpXgCbkjifKOzv3d5mCzMV8+TfSYUJxpKYRsDNl/7e6W8pQk9OfEOg0qX1U
 j5C6PFSxVa+1SrwiP/qd2MmFhRNnPTqZHMSke6hwLHZ7lZlcsWlO/7+Wt3ZVLk2BvgKB
 sH/moTCrUQoBgAkNgoEvfJjkSqsm59t9t46HwzhZNYy5bYym6KWve8weLOQCMX/0+CTr
 tAuQYEugTKcrP5RB3e51eVbkPY5zaYEXpF7y/t46XGJ7IqZ7nRRLg1hodmybm76lBuh6
 6TcQ==
X-Gm-Message-State: AOAM532oFhwzK7NauIdsrrj6Paq7CpJ/CJR4SSLwhKK4VuYh4Ph/WURN
 TjryVQf5R3YXKt6v1ivbYl8QaA==
X-Google-Smtp-Source: ABdhPJwNIO/UtOBhmBfv1EnEyN559aIEtRkQxPzd7whKisu2YHm5eD0ijGi48ODN9p3QGyFbNiUNVA==
X-Received: by 2002:a63:384d:: with SMTP id h13mr16548141pgn.472.1641066536330; 
 Sat, 01 Jan 2022 11:48:56 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:ffc3:704e:e577:9222?
 ([2601:1c0:6101:be80:ffc3:704e:e577:9222])
 by smtp.gmail.com with ESMTPSA id g16sm31434589pfv.159.2022.01.01.11.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jan 2022 11:48:56 -0800 (PST)
Subject: Re: [PATCH v2 3/6] target/riscv: add support for zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-4-liweiwei@iscas.ac.cn>
 <a522f7f6-b6ad-02de-dabc-0511740aef83@linaro.org>
 <7096a296-f1c2-44e7-d084-1c473b50a711@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <120dea96-eade-bcd6-eea0-0017b165f1ca@linaro.org>
Date: Sat, 1 Jan 2022 11:48:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7096a296-f1c2-44e7-d084-1c473b50a711@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Sat, 01 Jan 2022 19:49:00 -0000

On 12/31/21 10:05 PM, Weiwei Li wrote:
> 在 2022/1/1 上午4:06, Richard Henderson 写道:
>> On 12/30/21 7:23 PM, Weiwei Li wrote:
>>> +    if (reg_num != 0) {
>>> +        switch (get_ol(ctx)) {
>>
>> Oh, you should be using get_xl here and elsewhere in this patch, not get_ol.
> 
> Sorry. I don't know the difference between get_xl and  get_ol. From gpr register 
> read/write function, It seems get_ol is used in register read, and get_xl is used in 
> register write.
> 
> However, "ctx->ol= ctx->xl;" is executed before translate instruction.

ol is the operation length; xl is the register length.

In this case, the operation length doesn't matter -- we're interested in distinguishing 
RV32 and RV64, because that's where the change in semantics comes from.


r~

