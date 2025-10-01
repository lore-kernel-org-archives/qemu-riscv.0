Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868A0CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 18:39:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v41j4-0005Vi-As; Wed, 01 Oct 2025 14:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v41it-0005O4-54
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 14:38:45 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v41ic-0007VZ-2N
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 14:38:41 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso990985e9.3
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 11:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759343902; x=1759948702; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3/bwK0Puit+/BlxX00s7LpTO74tTRI4xjl/ObzNkssw=;
 b=yJnhzy+4hs1zI5Zboa7tzn4GvL7v4jIlqMrxrqABCClJaSWqhmBKF6IeS5uFP4xQjr
 sU1gpiPfjvJB4aS4w4rlz5L1yCI3DBd3hM1JTeBEbZvD9zCs6ic2LFLUp1gUD2x1xpGy
 ATbeZFHTBO24asKSi8Gypi5KqPWdOA+aRL+EjVxhP5k3HqKE0rQCeinx6Q+V6/YNK8A9
 CSAhjwP7R/nkGbQz3y1I63m5wWtZfSzV9sMSlMjVWUO256oqMz2NRoa9vZ5KaRaiIO0x
 wLxv4v5XM/v0dG7W/ngWNErZxrRyeJ2R5C4mycEG26JseYkDE9px6k/pwu7s8yubsdeA
 8LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759343902; x=1759948702;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3/bwK0Puit+/BlxX00s7LpTO74tTRI4xjl/ObzNkssw=;
 b=ZuKLLhok4RY1Ya13DhPoxHx6nOh9Cm4gp9xTX3l9mp43DpOrTlthIutrzmJ/ShLNuk
 tSWS0tLABTJccVWiZ1a15kDGeTZ8x3nYxE3LfgV6Q7tSOrH7kJm2FXnCoptszSjDuGms
 qDtw/pYncRGZ56qxgVrE60esxsDLb3QAve5LghFa8z3mh7w3+i4n8JJTRPRPbRC3rIT7
 8syurRcJeCR+3vc5L8cYbpsQUyIHK1E9/lRcoaQ4cbCsjg+HH/SblKL6btt3iDKuZY/Z
 MRGFG7uJaJ48ckO5LR5pOmDM+mhdLzhxegz60SZ7F/K4v+cIK9p416ejYyT/JVlnl8cp
 P4SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvvUhMP5GAp9locm4S7eA0N9Z2xv41dWgPMv8SvP2V44xWbqTCgeSdXmb4mSECdb0IqdSfn43OFHUu@nongnu.org
X-Gm-Message-State: AOJu0Yyh/x8Ry0jpDeMNkgxy2kNGZtCwNkd0OUFUCblR5M2JxsJ0d0qQ
 NubGrtGyEKQFJnXY/Jr5UHriz37r9xhcSGul1jz5TX2YMKXUqAm1ZIo78IGs4F6DqZQ=
X-Gm-Gg: ASbGncvPtJNytLSBue4gEukH/gPO1tFCru51F5ADtIU+WMjkTmECYJDQ++ycA1KURZS
 nIlXLL7Xg/4izXtnA6kqtnQfNfegSTZ2vkrzHWHbv8glyztVXiXw+K0B/XRVS0FDF7NsjtRgcGy
 oa0Xkp0VYTaPocfL+vSoKH9eQqPRd29dZ2JrFi/LIBmHgvUVAJkIOLeNDVPgBnbANV+lcAHyGh4
 TayFXzCmwYrJ60YMOJKXRr1h3h2zOYp4nXiiTPBrxJyznC2ZKIFFEEpeWcnKhEJTyu8Rx2wryX9
 jVS8fbFtbxjkLDm1mrYl2kALHGdsHO9FVaRml8Gign4lUJDtJQi7yASLVDl+7gLLYR3dAMEwciS
 kqAYcmXO+fXKAjnTTprVhkQHFGeKmFDjY+bai/iYpQ9q+QHAf+tPZM9aMOz+kzk8628mRLoLRgh
 Go5cpxubJQy4qycVcezSU=
X-Google-Smtp-Source: AGHT+IGx6UiTpbvYa5RVE+Ww2cUlmGQoD+6deTu6MRRli7uzDzb8L4c1jhtw/9ZS+I6gAwit2m2h1A==
X-Received: by 2002:a05:600c:c093:b0:45b:4a98:91cf with SMTP id
 5b1f17b1804b1-46e61faa217mr24206275e9.15.1759343901417; 
 Wed, 01 Oct 2025 11:38:21 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e675b557fsm25329725e9.0.2025.10.01.11.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 11:38:20 -0700 (PDT)
Message-ID: <5556bf04-0a3e-4963-83e5-a7ff25d65567@linaro.org>
Date: Wed, 1 Oct 2025 20:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] hw/core/cpu: Remove @CPUState::as field
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu
 <peterx@redhat.com>, armbru@redhat.com
References: <20251001150529.14122-1-philmd@linaro.org>
 <CAFEAcA-daogqBPxt72qTM6BuMuD1wuw+vXZwxLUQftwY2FZk=w@mail.gmail.com>
 <b5280074-e87c-4838-b816-eb9e42dd090c@linaro.org>
 <2a53049c-01e2-4f0e-ac51-f55d50173b22@linaro.org>
In-Reply-To: <2a53049c-01e2-4f0e-ac51-f55d50173b22@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Hi,

On 1/10/25 18:42, Philippe Mathieu-Daudé wrote:
> On 1/10/25 18:35, Richard Henderson wrote:
>> On 10/1/25 09:08, Peter Maydell wrote:


>>> Targets that use multiple address spaces need to be careful
>>> about which AS they use by definition. Unless we have a
>>> track record of code in those targets carelessly using
>>> cpu->as when it should do something else, I'm not sure
>>> that there's a benefit that makes it worth making the
>>> "use the one and only AS this CPU will ever have" more awkward.
>>
>> I agree.
>>
>> Moreover, '0' as a default is just as bad as cpu->as, because you're 
>> giving no thought to the selection.  Similarly using 
>> MEMATTRS_UNSPECIFIED.  When such things matter, we need the real 
>> attributes and/or as piped down from the proper memory reference.

W.r.t MEMATTRS_UNSPECIFIED, is it better to have a legacy API using
it discreetly under the hood, or have it explicit by using the
recommended API without changing the default values?

To kill a legacy API such replacement is worthwhile IMHO,
otherwise the code stays in a limbo, we have issues with
developpers using different APIs / styles, etc. Also maintainers
are Cc'ed during conversion series, so they can suggest better
replacement for defaults such MEMATTRS_UNSPECIFIED.

Regards,

Phil.

