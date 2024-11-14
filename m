Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B7AD6A228
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 19:25:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tBfRy-0006Qm-Rs; Thu, 14 Nov 2024 14:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBfRr-0006Mq-GF
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 14:24:11 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tBfRp-00017t-77
 for qemu-riscv@nongnu.org; Thu, 14 Nov 2024 14:24:11 -0500
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7240fa50694so831109b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 14 Nov 2024 11:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731612247; x=1732217047; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nWzEEnlQd4+qzmkCl9aS0fWcrCHVt1NBXqcmw/IuSSs=;
 b=uwY28sOR6jqbcBc7enHsYgTq+99k+1PCavPYCLKPDXE25RVSQIY4gTh8qUjFfDaWt4
 2PT4CS45agn1K5i3iZujxoZzDM/Xz/O8WIOykMlB5FgiRkVVL/FOA0JIq63EWNAFFdmj
 FbPE2ueBhvQe4f3GbwDQAnc2F7CnBd5eZpCMPiFbykyOyFykhq6g+vcw6zAliaJEqpvC
 jJNvGNU6oYnaeMlGF/9PbzeUeihNUM+7D7meFQ8CE3/F3Js7lKaAuD9lftGJj4BG4b1H
 RD9VYC3E0I2uU8eYYTBrbMR3O1RNp6FnlY0MxUb5LWcb+dAikAKwVLuXE8jCdPcRvq5c
 ZD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731612247; x=1732217047;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nWzEEnlQd4+qzmkCl9aS0fWcrCHVt1NBXqcmw/IuSSs=;
 b=VhcplIx9zyp8LPRrv8pfQgkTI5xbC1hXMT03y1Z+CkyusPeYkJO2uRrod8tV86+jxY
 g9Tzot6HlMjghgMdDORP/RHIJdajCCHD0Dz/lbS9Oq/lKSNfQKRHi93pbbtvPXnMaSfx
 ctG/trHIuXEhNSfc+UO4bRRMBdQ9lei0skyqm9kGPBIXCFSOb/roPgRUhlTZdCRPaKL6
 jdOO3Hg0Ss/9YkDo68sx0ih7B/QEHtko1ZWXmhPQmtxVuy84lYvTCoAvoxNduhNY0pV/
 k6WG/1rdwL9HZCJ9ejwv51PJjRwfBmySTCA1r0+Q8v/R+xj3qarEAmUxqnmD2zGpl7g5
 pMsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPM62ATYDUyMvHS50plrxrvkziHD6uRMjdc1cpKu6QiytscVYd9WbsrIUFdg2++WxbslX/eHZb1Jc5@nongnu.org
X-Gm-Message-State: AOJu0YxqNBSTnElfZB+47CH0mvn6rZZX8zpDEt8WvVG6MwiX5uumYYFD
 x1tAG/y+O4P3zKHJXjZ8+IbB/YTl/qZ05EtBH+aGEkbpee3qrxAfFjeCdilmnYc=
X-Google-Smtp-Source: AGHT+IEFNzWQS2Ydh+tt1sUmQqj/IC9+BHv7wRXaOAxzDkVw4G20S9b0lIu4eFluAR1M27fMoJg2Vw==
X-Received: by 2002:a17:90b:1804:b0:2e2:7f8f:3ad7 with SMTP id
 98e67ed59e1d1-2ea154cd17bmr92862a91.7.1731612247433; 
 Thu, 14 Nov 2024 11:24:07 -0800 (PST)
Received: from [192.168.0.4] ([71.212.136.242])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9f1e24ce4sm3506278a91.0.2024.11.14.11.24.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 11:24:06 -0800 (PST)
Message-ID: <30f61376-41c2-4461-9e56-3f98748fd871@linaro.org>
Date: Thu, 14 Nov 2024 11:24:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/24] exec: Declare tlb_set_page_full() in 'exec/cputlb.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Anton Johansson <anjo@rev.ng>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 Peter Xu <peterx@redhat.com>, Pierrick Bouvier
 <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-s390x@nongnu.org
References: <20241114011310.3615-1-philmd@linaro.org>
 <20241114011310.3615-16-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241114011310.3615-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 11/13/24 17:13, Philippe Mathieu-Daudé wrote:
> Move CPU TLB related methods to "exec/cputlb.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cputlb.h     | 23 +++++++++++++++++++++++
>   include/exec/exec-all.h   | 22 ----------------------
>   target/sparc/mmu_helper.c |  2 +-
>   3 files changed, 24 insertions(+), 23 deletions(-)

FYI,

https://lore.kernel.org/qemu-devel/20241114160131.48616-53-richard.henderson@linaro.org/

unexports this (and related functions) entirely.


r~

