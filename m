Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lCm3L-00029N-Cr
	for mharc-qemu-riscv@gnu.org; Thu, 18 Feb 2021 11:21:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCm3F-00026s-Rp
 for qemu-riscv@nongnu.org; Thu, 18 Feb 2021 11:21:15 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCm31-00048p-Fv
 for qemu-riscv@nongnu.org; Thu, 18 Feb 2021 11:21:13 -0500
Received: by mail-pl1-x635.google.com with SMTP id s16so1507814plr.9
 for <qemu-riscv@nongnu.org>; Thu, 18 Feb 2021 08:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P77YELK87BOgcPoZEZy/x9GQK5K1mig6M7xaV4MFRko=;
 b=uxstqCll+DnakMWzFWBOZQ3hlG4G8uDfykxF824UGdCo1fTTTmxShwgZz+9hybppCt
 uPRCL9NAoTg9NvFppWgHWNkwSlmwWXTjnmYBjfTM6FlJcOLqf3D2u0ECdFcqbXkf9NE0
 T3myYzf3M5GNtmDYkYp+/O+xJ7i5TsZY70iq4ARtdcN91DsDcYLQMttdBFQVCHxR0Ml4
 a0DjZO14UfYOaUsJtKTD2eL7GxlKBjZ2xWRjC4o5+IgH3ToXu0TJdaD/A0cIGLnDa2Dg
 rXRYau07O/3y7nzMUbbqkv6YoCXr5lZdeDF915pxURwCc/raBVOcOsxScTOicWigONKH
 3ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P77YELK87BOgcPoZEZy/x9GQK5K1mig6M7xaV4MFRko=;
 b=b5PKWWWuQWCJJEZ0tTsGZG8x301MK9kAbhYk/CrAbRXXRLaHt9AwXatzIcLICbFeLA
 MsLXR9KZxhYstTF4/wLcr1s+r5cVOz9hfx2zr3Zy49nzxAZ57tAfd9guZ6YXZY1ldYOK
 a5ZcJzwSIk7ygJTAFPyFdFiAGdLSi6gdhpxEgjxHbZLGUdcwEIaSIJmJDvpWhqpIriay
 KgnrsMyMUGeXHYvTG69MC+kdXVQSlz5JBJSk1KsUDfhr6Fnv2qv4PidzShoAKwIsrsxB
 T4/eBeBt3/ELrtwMuUXJzA1DL1TCnbfvc/hh8hNUKRYRtEGlmVoEX39IwzUjmlXQLMbS
 S68Q==
X-Gm-Message-State: AOAM531PzHw1KHHOJEoh5NBF7pZqZ4UOImIJW3xh+2rzfIcMX8Hpu+JL
 +qIlbrmWktOSEqApqae147jZ+g==
X-Google-Smtp-Source: ABdhPJxn7HhS5puj4NbhQXGBWj4jXbYi8ZWA1MjwWMVtztzx3/w6GmsFTh1w/prlECVcfSaRQcFrbA==
X-Received: by 2002:a17:90a:654a:: with SMTP id
 f10mr4666488pjs.202.1613665252029; 
 Thu, 18 Feb 2021 08:20:52 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 203sm499407pfy.105.2021.02.18.08.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 08:20:49 -0800 (PST)
Subject: Re: [PATCH 04/38] target/riscv: 16-bit Addition & Subtraction
 Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair23@gmail.com, palmer@dabbelt.com
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-5-zhiwei_liu@c-sky.com>
 <d9715335-51a3-eb08-c04f-7a7ce6858ac7@linaro.org>
 <2144374b-8101-f307-6109-3775378226de@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2192352c-be78-f8e0-df27-e2c25e937160@linaro.org>
Date: Thu, 18 Feb 2021 08:20:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2144374b-8101-f307-6109-3775378226de@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 18 Feb 2021 16:21:17 -0000

On 2/18/21 12:39 AM, LIU Zhiwei wrote:
> On 2021/2/13 2:03, Richard Henderson wrote:
>> On 2/12/21 7:02 AM, LIU Zhiwei wrote:
>>> +    if (a->rd && a->rs1 && a->rs2) {
>>> +#ifdef TARGET_RISCV64
>>> +        f64(vece, offsetof(CPURISCVState, gpr[a->rd]),
>>> +            offsetof(CPURISCVState, gpr[a->rs1]),
>>> +            offsetof(CPURISCVState, gpr[a->rs2]),
>>> +            8, 8);
>>> +#else
>> This is not legal tcg.
>>
>> You cannot reference as memory anything which has an associated tcg_global_mem.
> Thanks.
> 
> Do you mean referring  a global TCGTemp as memory will cause not consistent
> between TCGContext::temps and
> CPUArchState field?

Yes, there is nothing that will keep them in sync.


r~

