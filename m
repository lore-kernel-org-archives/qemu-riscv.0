Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F72C02181
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 16:57:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tbMvT-0004fL-2z; Fri, 24 Jan 2025 11:52:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbMvM-0004UZ-FN
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 11:52:52 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbMvJ-0002EZ-Dl
 for qemu-riscv@nongnu.org; Fri, 24 Jan 2025 11:52:52 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-21670dce0a7so47835175ad.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Jan 2025 08:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737737568; x=1738342368; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5SrGboY5Zy7ffuvT4caufs3RR7JVCHcOQhNBCd5Ag/M=;
 b=QfFT3igknQ5HqZoawASIS39iMND85LqSaGDKUQR+Pvw1f9J2wy6OtrMrkhCXhODEkd
 ztQjlHb6NW9BEnIzXIjvWNLB4iGvLnYujaFl2tsiy+SVfWNFS4F6l7rFAiMEpu1LUpBe
 WOYRiBvheB/zs47jJNTTFDkBNgAtZdsayFB6mMyFoT6R0GxnNGB2G6V4NMEDhqikmo2M
 BGFsbM5ZRoehoJimwUKA8+tZTRInjxMYRs6AY7pkqLZ0Ys7kVDnaie8DkVXhGYhXN6lK
 rFFjOJDTDeSxcW6IwgGUDmeBMaba+6y/3TKxM0QpeltOn7px68hcRMACnqIQoHeV4koT
 Sm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737737568; x=1738342368;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5SrGboY5Zy7ffuvT4caufs3RR7JVCHcOQhNBCd5Ag/M=;
 b=BC8noXOGZzeDaqrY+ZB58nFkiH8V7VuAUF+fG/7krB4Ypy0Pxw3zBhchkqQc2dEv8Z
 HLn44/h6qxQOC1ux8HTxwWFX3bCgwkGcQtgC8+mh7o3CyqL6l6tewZdDp0P+aj2kXEkC
 /v1GYxSc5BuZWrPEKtmGy+5A47+PLZ8ta1mdtrJ2Ph5so4grG1DwmegCq5Nt32FJq3YE
 eQCmVEygWWVMwALAZpmEJDNMKpTJDa9UfuxMiNY334Q4Bjz0DlWIBZ9VxJv9ILXH4HYc
 guOTNplXj8OjmSkVubeLq0a+bQ6d3hh1+J7TlzZ/gibiQTdzExWV6EVkjzFhI/6uyx34
 2ZEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzmc2o46y54Qo4tvkMNzeM8fNbhktKBdFc3DPCfY3f1JoeOs/rgg4qEUqP1PkU0EEMdy5s8JRFvI1R@nongnu.org
X-Gm-Message-State: AOJu0YwJKd0RcW26QgEu99QNiLV4KhxI3f5GFQpkmF5F0ICP/mmZIVgW
 1S74YDNIC9uwHgGwqNOLlsF6sjOKj4Fl7hUZBCFzlPpaBPdglM8pCwTrqK7xZ2Q=
X-Gm-Gg: ASbGncvdhQnPnX3yGxZ8rsdfo3RR3fcc80vwNAPRTIMmmTYEY01XJyeIT5nHAoER++q
 UYUAJNYKn6B4sQehiMg1aQs5DNyTgxY+UcvwT3BW+nJYKYDsOMhglldaB6GDYBsRWmEfs1qo6EV
 iuckJdHAFP1005JLRPbLRTjM7eCbhxPXT8WD+ij06v72KbxzI+MCaE3nA07RUfnRz8TSooIWO1c
 ZsdbGH8Z+Quaxm6aY1G/lNnYpxMRL+QftNQqGukhzHqKZYbOYvvbxTFc5ncVbEpMWDULX37r3q7
 o+QHvtk6YmtbYTNkIgdmpGSL
X-Google-Smtp-Source: AGHT+IEd7GZjYYgT4y9hFkl6koaGVEufcxy9ev7jrh5j36mguEfcnDmtwFOO+8woig7xmsABPMtJZw==
X-Received: by 2002:a17:903:2290:b0:216:5e6e:68cb with SMTP id
 d9443c01a7336-21c3540d18cmr492087505ad.16.1737737567818; 
 Fri, 24 Jan 2025 08:52:47 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da414cb13sm18525345ad.188.2025.01.24.08.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 08:52:47 -0800 (PST)
Message-ID: <6ca4531c-5f72-45d4-a3d7-ddc8fdad6964@linaro.org>
Date: Fri, 24 Jan 2025 08:52:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/28] cpus: Restrict cpu_has_work() to system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> This method is not used on user emulation, because there
> is always work to do there.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/core/cpu.h | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

