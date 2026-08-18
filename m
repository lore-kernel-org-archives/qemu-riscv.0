Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65CFC5DF7D
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 23:48:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wwTX8-0005mu-Kb; Tue, 18 Aug 2026 19:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwTX7-0005mg-NA
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 19:47:53 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwTX5-0004As-8c
 for qemu-riscv@nongnu.org; Tue, 18 Aug 2026 19:47:53 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-38e69bdb0fcso453299a91.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Aug 2026 16:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787096870; x=1787701670; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fc56p3k8uuRnc97EoofyEUOBaGfYaZmyJH4nBz5RWwg=;
 b=iwSgs1gxtvASv5VsQOeHUgqJ+ijL3AuzzpBoiFR7fjH3cedk2yTUZ2jmUCxgwebGl9
 lrJ1/trT5BoRKyRzqvke3IbqR/WXza16rT+jMuYgezbr6q4GYIVJy5TEfQjHTcVYigkQ
 xwrmXQDivo2ESOAAogldx6cBY6mPdbn2SNY3iC5TVOsG7fwJiYDRJ7E6r+nAna1pBJMP
 Kxn0GqjWm4u/UNzKlRSQwIJ6OZIUMsqkz0tx33Ges4UcQz3f+3fjMCtRuS/y1j3ZOn9x
 T7JIMNOXHFD+E8gvhLwsiBS4zWbaj++THW3XdGgF77cliROSyP70WvsTVCZ3yVWBXoHL
 Q+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787096870; x=1787701670;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fc56p3k8uuRnc97EoofyEUOBaGfYaZmyJH4nBz5RWwg=;
 b=ZSqwE6IoqdiC07O97Uv/bjYNaYTFpzY80iBs4+ED5GihavHWZvU74JEEsYgPjD8Hb0
 dQI0PR/0W9sd4M7H66irUYHVQhkOEO8XXNoUnVFdi10wMqCd2LQXG9YgIKJRrz+1QQYD
 DIkeMI9rf7GmIEvwLX83d7LAWEE3vtAdKsi7ZrpBUeqiXdrk+US85wdf+g1kAByJhhrn
 b9pIbOs3GiwnVjo9biOcfrphUUirf2XqUOG7nOWotDPXOSXKqP+vfZwMV6hPol7cjuhC
 jE87KccsMfAKbzBhJ6c03Ij541XZjJYmPhm6qDckWOcppGunI5gsz+P/zdPeITwh+5Fx
 agug==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr2EckZ78+ZFmVuShb06jJqjiFKHQZREhKhfTtQt+us8egeyFdz/qKxzGHg72ryhhnOgBmyfW4B3vqJ@nongnu.org
X-Gm-Message-State: AOJu0YyxPOSGPy1R9XU1wYhbPGwCYgZtVNAT198C3CT86Ve2vO/agPhb
 iOuwc0+k7SqkgheV4MI0xuBtA69uOpCblWp7Z9Gaj0wVLJtjdS9rLJYXj5hxVdHCOW4wyI7TWmv
 Rq0rc
X-Gm-Gg: AR+sD11CK8eAXakllYrAWiEdf3UY0Hszb6YHRwLiK5TS5RW1AzgUFuk9MSVxhDeHJbn
 TFP68xDjFEWdO7jMY/ni2bq0Hgm7821eNO3SIcLa12StN5ZQsZoQ68lYw+AEs4PoDR7EKdCRRps
 yh/vrYs3vbUhBfIu3EQRV6YVhAwU9IGgKHRVhnhW3bdm/HKajI197NKCQGKfGWpinvGuBiozfmI
 eVPvd57IsfOlk0nst/I+w038rMSfDgsCb0ZmzlzW/JWBmm5LGjwNAiSDE178jkSVfpJCXuG0Q5P
 3o0mFH6YReATq9+TweaDVBwmvUIGa2WmCKx3N8FWJELXJnP9KjWADjNwFY+6QJNe2OXQ1U36DwQ
 rh4BsJDzwqWu5TxKYQcRLweJCshw9w3A5yYkQ+NyQRXh4ZCowr6hjfDw+kEHQ6b+MgqFHgeAf7H
 sOMoyR47md67ZvP/ELev+WtFGo/yagwWEn2jGIE9sVj5b8IKGAkFYmwWZ4Y+Nfyued/Zrcb89k4
 DjgWcLcWV3hDsmaUMI=
X-Received: by 2002:a17:90b:164c:b0:393:19a3:4e5 with SMTP id
 98e67ed59e1d1-395812c6e07mr783639a91.16.1787096869446; 
 Tue, 18 Aug 2026 16:47:49 -0700 (PDT)
Received: from [192.168.122.51] ([173.164.107.233])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3957fb87174sm379525a91.12.2026.08.18.16.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 16:47:48 -0700 (PDT)
Message-ID: <00df9c29-1bbb-41c2-958c-dd5d57c35564@linaro.org>
Date: Tue, 18 Aug 2026 16:47:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/18] target/riscv: Recognize watchpoints with
 first/last
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-17-richard.henderson@linaro.org>
 <c25aa359-4519-483e-aa7e-2ba69daa18c2@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <c25aa359-4519-483e-aa7e-2ba69daa18c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 8/17/26 22:43, Philippe Mathieu-Daudé wrote:
> On 15/8/26 22:37, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/riscv/tcg/cpu_helper.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
>> index 11f2654da1..3318e82ea7 100644
>> --- a/target/riscv/tcg/cpu_helper.c
>> +++ b/target/riscv/tcg/cpu_helper.c
>> @@ -1784,8 +1784,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, vaddr first, 
>> vaddr last,
>>            * Otherwise we'll throw a debug exception and execution
>>            * will continue elsewhere.
>>            */
>> -        cpu_check_watchpoint(cs, address, size, MEMTXATTRS_UNSPECIFIED,
>> -                             wp_access, retaddr);
>> +        cpu_check_watchpoint(cs, first, last - first + 1,
>> +                             MEMTXATTRS_UNSPECIFIED, wp_access, retaddr);
> 
> Maybe squash in "accel/tcg: Replace size with first/last in TCGCPUOps.tlb_fill"

No, because that one explicitly makes no other code changes.


> or re-order just after?

Ok.

> I'm confused by this single WP change in middle of PMP API ones.
It's just before the last use of size is removed.  :-/


r~

