Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93950CCD194
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 12:08:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v9Mle-0007x9-Jg; Thu, 16 Oct 2025 08:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9MlZ-0007wI-Hz
 for qemu-riscv@nongnu.org; Thu, 16 Oct 2025 08:07:34 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9MlQ-0006po-QE
 for qemu-riscv@nongnu.org; Thu, 16 Oct 2025 08:07:33 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-426fc536b5dso343324f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 16 Oct 2025 05:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760616438; x=1761221238; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8nl8+aCVc6MnHi449xOsXy7u+daf8qJov2bS5j31z5E=;
 b=iBSIjEheruCM2mc7EXJ5p8gAg7jutqV5cQepdK1cFuL0YSXGc2KIUTenBAbdiUinea
 fNO+U3IX+UU37x2uuR7v6mPeIgLiffiPOJbQ0CEnlTbDxldYZN2Wtfie8SE2+pP/Ywe3
 CKcxW8C63D+SF1RThJkSUXMzWQpdRsbmLUZ/BqVX1kV6jVM6jMsFS0Ns5q45NcSKPaF4
 PQkXiu+rH0X1mjQZTuEdNZs8rNqBNbUTHrzEy5cCiOeYNhNnUwGONzicVcXcLId5KNaI
 z1C0rpJK/rxDiTJ1EjqLTvOVO9BsZ+ygOhkkVuE816fpX18X8X6YV4SzFKTQksNCcBU1
 MvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760616438; x=1761221238;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8nl8+aCVc6MnHi449xOsXy7u+daf8qJov2bS5j31z5E=;
 b=jsTFNFu0pklUb2sUgSxJhdCLuIp5F0WA6HCrrj9H7D7WseJCYeRt3CD5wefkAAXx0E
 KkJuyAGxJNCGnfKiug4FXoLxqXhVWibYM8tUAeCM2LW85wguTyKybseJtQqmCB46O+uN
 hLYo1paC1KLSCfGbw85F9OSSJWABEg6A/y6IZa0FhkPvBYzumZy05gmfUiCRoBjFh6/D
 uDPjby65w4dTRElizq1xsbIkvxBCSE1tT9w+E1KNTjc92e9NH3UrKRfEF7LLeE49vaN6
 6WAt+EihEoUYIDqUTOf4szsvpGb0cwkDP1/c7RmQ9gEAs/XDLZjx84vAE3TylceM3h3B
 bNfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk/c8RJ0S2GM5D5rOrmJoMKB9zp5V2Wzqd9/yPUGS273LGVypjHx6M2kOooRr3vVILqSVGX47aNuhS@nongnu.org
X-Gm-Message-State: AOJu0YybH15bexUoAyFayrA5JcR7fQUSltKriPoT2P0KuydN8CPGyn8a
 pPO4QN7mvBo3vbdn03t2NOTyhiskyYRV4E4Bd/iZkCBDGIRWNm4xX4WxsqL/3cDnHz4=
X-Gm-Gg: ASbGncu22Q4PlMWwsRm8dbBgZ7RAQgd7haIEL8286ukvyk2QJVI4OiCJAzvnmwO3oZV
 H7rx109iJqRpjM6dFDEaMZwQindu5LVcB1BU+52FiogTrFoqIpMdm/iwLy+JiHyL4bEkE7s9wrQ
 zcBMTyg5gGHKbi0Eq0Ci+1C7vEajInOPgQy5vi/8Cp8hIfzlumnmUsQoQIj3+iLuZt2ya1QyKrw
 ns5qDzSgFM5JT97z6pG8N2uZYlGqMXGEGl6p0O3AOXoJYCh2Fe4OX9DlqBl9MjdRYbdjjzvmBQK
 nGX1JKhYMFKY9BRIr9+6EMpjRUJqne9dsyJ55wXgJxNLmJqAMJb+vlKyJ4B6JD6s+R9SmlYZKUr
 z6a9lCZ9xoL9LCbbzPd3oun6tueUOxDePYOhSwijsoyswaAt58SCW/kn/fciCD+1qt2VV5hFjXx
 GJJzCARJIECcH0lMJCNUk0TfJ6YttZA0erSCEF/vxnwYVBUtPyz1tcWeniXw==
X-Google-Smtp-Source: AGHT+IF+gUKvX2um9gIt2ygqlGKR3ctLIlBvcTtGe0sYSWZWeLQvlmodCoil7b1kYlwpX7W7wYLRgw==
X-Received: by 2002:a05:6000:2010:b0:402:4142:c7a7 with SMTP id
 ffacd0b85a97d-42666ac6f35mr23553877f8f.16.1760616437597; 
 Thu, 16 Oct 2025 05:07:17 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm33816743f8f.35.2025.10.16.05.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 05:07:16 -0700 (PDT)
Message-ID: <7b263ac1-b8a8-475c-a59a-23b8d419f6e6@linaro.org>
Date: Thu, 16 Oct 2025 14:07:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] overall: Replace HOST_BIG_ENDIAN #ifdef with
 runtime if() check
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20251010134226.72221-1-philmd@linaro.org>
 <5e4d3a1a-ee13-40c3-b470-d68f5b6b4ad1@redhat.com>
 <614c4af0-1fea-4d48-bb52-a1ef60302b9a@linaro.org>
In-Reply-To: <614c4af0-1fea-4d48-bb52-a1ef60302b9a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SUSPICIOUS_RECIPS=2.51,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 10/10/25 16:37, Philippe Mathieu-Daudé wrote:
> On 10/10/25 15:51, Paolo Bonzini wrote:
>> On 10/10/25 15:42, Philippe Mathieu-Daudé wrote:
>>> Replace compile-time #ifdef with a runtime check to ensure all code
>>> paths are built and tested. This reduces build-time configuration
>>> complexity and improves maintainability.
>>>
>>> No functional change intended.
>>
>> No need to repost (and I didn't review), but please change throughout 
>> the commit message to mention a *compile-time* if() check.  The code 
>> for the wrong endianness will not make it past compilation, and 
>> mentioning runtime checks left me wondering if you had mistaken HOST 
>> for TARGET.
> 
> I want HOST, and hope the changes are correct: I meant to express the
> code is elided by the compiler, indeed not at *runtime* 🤦 I'll reword
> the commit description. Thanks for catching this.

What about:

   Replace preprocessor-time #ifdef with a compile-time check
   to ensure all code paths are built and tested. This reduces
   build-time configuration complexity and simplifies code
   maintainability.

?

