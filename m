Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEE9C4345F
	for <qemu-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 05:20:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ryPcr-0003vU-Cx; Sun, 21 Apr 2024 01:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryPcf-0003pQ-09
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 01:20:20 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryPcb-0007xJ-VI
 for qemu-riscv@nongnu.org; Sun, 21 Apr 2024 01:20:16 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5ce2aada130so2337698a12.1
 for <qemu-riscv@nongnu.org>; Sat, 20 Apr 2024 22:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713676812; x=1714281612; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lDXAB8ltRRwkbBawSc6C2SFgBQpWEcy0Yr0gdbEefAg=;
 b=UkUqV0LPbqEAn1/4Kve9uA0bMCasiBIgyjBaZqo0kiflLThvtSEWzV9xferP6HvLRp
 6Ks4VL5RtgssOjqriE/aqBHJQVhm4nFiT+7hP83Xx7d9anzBOFRwUNIqtXCJJRy1AGKJ
 /VSymuWccx/+PJYk59PkLOtKi2HJbfA4OaXfiGhPAZLTEAIvl+7y6zs+sMIjIfniaSOX
 Z+IPr260jOy/d70C36FpkPuJ+aZzFidmzNbQOMzbsLH8LSyRMdv9F7EYT1Tz4a878oST
 0R7rT3OeJNxntiGIefAt/h7DuqNRr6hiv7erTPjtrT60bTHIgnhmggRAtYg9imrpGlCm
 24VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713676812; x=1714281612;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lDXAB8ltRRwkbBawSc6C2SFgBQpWEcy0Yr0gdbEefAg=;
 b=Y24u/1E2cQnMc2cFJ1yrEjjlqGh7pNK74nBC1gmjI+3eLeVeJ8860Nhqdq/2eQ4Epe
 NEIb71P4k23xGHQJObElkqYmbdE9nozlC9PRnKVwEeyP6mYstqxOODpc/ug9SxmGTnP3
 23bQrLPin3DW/RAgdWowkp6sF6MyaSCBsPn4HBZy98ScThppo81SUYZwmS6qLFcFNjyO
 67DMyNtcr4WWMQlkPeCqr4h9e+D/xauhRWIDBVA/WdKE+2QsGjygH2ulCIpTS+36+ukG
 QU3p7UftMv/+rbO2/jOIJJZp0vwn0oZ9+Ia3Cjt1o1YnY9B7mLSfGSEdOYXLvzFpY8Xq
 eEsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSAVbdSWXSb/hepKyZFtIcsgmLd6defT9f9BvR4EvwlU76mm/8L9iaKCce5vV/JULQtxJakFJ9YHlA0QE26Wq0paH1qYY=
X-Gm-Message-State: AOJu0YwZfoNAEc8kVEa1K99C/DKczeLqWitmI4s8xG9+yls12GykrjPZ
 84wEez+W4kL/nIunC29rQtL8KG1CnMIrxzsYj8HoFm3k9XJPNej1cf1nHot3IO0=
X-Google-Smtp-Source: AGHT+IHkMyM5opv2eoOylQZroSnk6GqGYbzNWxMP5sTw32UbvTFvHfQW0vjUnKeBk99bL24mNOUByQ==
X-Received: by 2002:a17:902:daca:b0:1e2:7d3b:353c with SMTP id
 q10-20020a170902daca00b001e27d3b353cmr7571336plx.18.1713676812239; 
 Sat, 20 Apr 2024 22:20:12 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 mi8-20020a170902fcc800b001e294f2f30dsm5792306plb.93.2024.04.20.22.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Apr 2024 22:20:11 -0700 (PDT)
Message-ID: <374ff057-b799-47c0-a033-fc17847e98e9@linaro.org>
Date: Sat, 20 Apr 2024 22:20:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] hw/core: Avoid including the full 'hw/core/cpu.h'
 in 'tcg-cpu-ops.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> Only include what is required, avoiding the full
> CPUState API from the huge "hw/core/cpu.h" header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/tcg-cpu-ops.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

