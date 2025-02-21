Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DD8C021AA
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 09:14:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlP6f-0007Xy-Jq; Fri, 21 Feb 2025 04:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlP6d-0007Xb-Vu
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 04:14:00 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tlP6c-0005Vp-4o
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 04:13:59 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2212a930001so49829015ad.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2025 01:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740129236; x=1740734036; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3jbTdLdan86tE7UKjnQHnv2Ec51MntltSBmR4WljQqo=;
 b=pcO/J5pEl5MUU8ULv77K9t2VBMWMyE6Zd4IwfAow+FStGtHFW3NAG86SZvcX0bQlvr
 C02QgMiRQINxXJSpzSXrrDhuVckgVYFBCdHdHBsH+wHmt+obF13W7qYMOyEawBGaPDtd
 9KG9W3vTsNaf5wbHvNRQU9rRsWwlIB8u/Mdjv7xYse7d0el9+b0OxayxXPqeI+XnsE8p
 52bu5wMLMKoQMnOYRQwxYWMiH/5Atf0MaNFldVYk4Sxk0BUYcPs5mtaKaYlj4mf/iLnp
 nFZoEQ5iTfEFEBW0JW2XRkyoPiEdRzAxOARwyTeL+uWoPoLlBh0TS1Er3hq8EKi2Uxy3
 76ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740129236; x=1740734036;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3jbTdLdan86tE7UKjnQHnv2Ec51MntltSBmR4WljQqo=;
 b=OvX15dOLM9whtL0UFfHYXYiRyF777hgFjbXoj0WSZ7LSgkTnrXOuu7aKCHtzy61Vq0
 3AL8q0eaUdEjcoNXfBNh8Y7gEVz+C0OL8fD+s1SeRBL1LrEwhEqwccbFFxRj/7Yjk7ca
 Jc4Tf04Vb1tdS2gOC8QQzvdmHovGAjsR1BsrfvvdLmLw1w9pqFRTFwML2hcilU3fZmAk
 /tzgcqhWn5npieiAr70UGKLV111aHwmr8hmSYRC5MA4a+aqGNXJ1zDyI9yhOsXU9tlws
 N0nBi2pVvDTunibER0Ou0GAy3j/NGk4pCaQ9xanMbPpNq1IRPJohlOJ+dgtq/pe0Bc0z
 7TGA==
X-Gm-Message-State: AOJu0Yw2wrpKtK7KUi7U61WZCEY8LxU24AXK9iFcrCVVD1PDoiR7lOBP
 vX4UuXMuMIbCb6RUSkIIE0NiQUZoMvT9MvNSXqTa5YK1mY1LdeltIrFq2Oi52o4=
X-Gm-Gg: ASbGnctsxzAJxyxuvAGUlsMBEd9M3xodvN6BBBnrzg/+Ah3vfIbdTP8b1FGGjvwqYB0
 0E4BeFljqZSQ6VwC4H4gPTvD3ekhYRuQOegxTdo7DPFmLFbmF+Zsuzx++Bw2SHZI2x3Jg0BkHeb
 811I46ghGl3+xROGuqngIpqF8waWKAjnHgMyeQVlIsTe7NPrLY4jxfk2pIkEFc+bwYFc8T2Ubr5
 8gv3+hUBkGdw8H0FlKCBent6KSNN3z9WvbvrJhbZgToAQ6yAzWWSyWwgf83BQcIHraapwJRjbQL
 bU1yyc/cn/VLfoxsad0vISwnqKM4CSl/pHupnzFF
X-Google-Smtp-Source: AGHT+IHbSZ6z+IMmihqRzY5cozGmDFrNO9eNAJ4y0ZfbPD5Q0iQuM07eOjcFquMhxL4KDOuS7bDE8w==
X-Received: by 2002:a05:6a20:3d8f:b0:1ee:aa06:1a47 with SMTP id
 adf61e73a8af0-1eef52c9ffcmr4727747637.2.1740129235975; 
 Fri, 21 Feb 2025 01:13:55 -0800 (PST)
Received: from [192.168.68.110] ([187.11.154.120])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73256a5680dsm13161680b3a.112.2025.02.21.01.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2025 01:13:55 -0800 (PST)
Message-ID: <b1132069-8684-4ecc-bb82-b9bab597e809@ventanamicro.com>
Date: Fri, 21 Feb 2025 06:13:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: fix C extension disabling on misa write
To: Vladimir Isaev <vladimir.isaev@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bmeng.cn@gmail.com, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 mjc@sifive.com
References: <20250220163120.77328-1-vladimir.isaev@syntacore.com>
 <3ffe3ecf-4bd8-447e-a984-442c71a94f89@ventanamicro.com>
 <8e495335-7f21-47a5-925d-09ecf4b3a08b@syntacore.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <8e495335-7f21-47a5-925d-09ecf4b3a08b@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 2/21/25 4:58 AM, Vladimir Isaev wrote:
> 
> 
> 20.02.2025 20:59, Daniel Henrique Barboza wrote:
>>
>>
>> On 2/20/25 1:31 PM, Vladimir Isaev wrote:
>>> According to spec:
>>> Writing misa may increase IALIGN, e.g., by disabling the "C" extension. If an instruction that would
>>> write misa increases IALIGN, and the subsequent instruction’s address is not IALIGN-bit aligned, the
>>> write to misa is suppressed, leaving misa unchanged.
>>>
>>> So we should suppress disabling "C" if it is already enabled and
>>> next instruction is not aligned to 4.
>>>
>>> Fixes: f18637cd611c ("RISC-V: Add misa runtime write support")
>>> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
>>> ---
>>>    target/riscv/csr.c | 7 ++++---
>>>    1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index afb7544f0780..32f9b7b16f6f 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -2067,11 +2067,12 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>>>        val &= env->misa_ext_mask;
>>>          /*
>>> -     * Suppress 'C' if next instruction is not aligned
>>> +     * Disabling 'C' increases IALIGN to 32. If subsequent instruction's address
>>> +     * is not 32-bit aligned, write to misa is suppressed.
>>>         * TODO: this should check next_pc
>>>         */
>>> -    if ((val & RVC) && (GETPC() & ~3) != 0) {
>>> -        val &= ~RVC;
>>
>> Not related to your changes but it would be nice if we made more use of
>> QEMU_IS_ALIGNED() instead of doing these bitwise ops to check alignment.
>> E.g. to check if pc is aligned to 4: QEMU_IS_ALIGNED(GETPC(), 4).
> 
> will fix, thank you!
> 
>>
>>
>>> +    if (!(val & RVC) && (env->misa_ext & RVC) && (GETPC() & 0x3)) {
>>> +        return RISCV_EXCP_NONE;
>>>        }
>>
>> This will abort the write altogether, skipping valid changes to other bits. What
>> we want is a "val &= ~RVC" if the proper conditions for clearing RVC are met.
> 
> Not sure since specification says:
> 
>> If an instruction that would write misa increases IALIGN, and the subsequent instruction’s
>> address is not IALIGN-bit aligned, the write to misa is suppressed, leaving misa unchanged.
> 
> In my understanding here we should skip all changes to misa, not just C.

Oh, and changing RVC would change IALIGN. Makes sense then to keep this
early exit then. Thanks,

Daniel



> 
> Thank you,
> Vladimir Isaev
> 
>>
>> Thanks,
>>
>> Daniel
>>
>>>          /* Disable RVG if any of its dependencies are disabled */
>>
>>
> 
> 


