Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9295FC7114C
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:35:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sjSCM-0001n7-AV; Wed, 28 Aug 2024 19:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sjSCK-0001me-NA
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2024 19:35:32 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sjSCJ-0001ir-0G
 for qemu-riscv@nongnu.org; Wed, 28 Aug 2024 19:35:32 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6bada443ffeso683057b3.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Aug 2024 16:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724888130; x=1725492930; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lON+BypX7CrB1nai/sY59BRqWJ8WkiirBXiMsCPJxpY=;
 b=eWX3JoZqAZr7epzFV8OZMQ0sHZgaREUiisN5rKkGsmf3lna17b0QyxlTmJP1L4avmH
 nGKx//t/FHlVe0c1u15ts4hVlhtOYN6KgczaWXzwv90tb4c7ixmVI5vr+MxmWpvubyCJ
 Bd3KMfhOoqR821eMOMm3Gf0J5z3668ZGFZfzmevNaIULQ0cZrpDtunmA08ckZ8bJzlt0
 qJXcRRWx1p/Uh6cmq6jL7E4ejyi/pn4KcHbSxC9KOGk0zydnqI/wxUYAfRyieD5LQ1cJ
 icEWTZC0WPSds7tW9s6NtWRmB79Xi0cvHTh7MB9gQt+9ugBSbOwQ+xiLdGb/udYG9d8E
 LaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724888130; x=1725492930;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lON+BypX7CrB1nai/sY59BRqWJ8WkiirBXiMsCPJxpY=;
 b=If73Z60GFgU3A4FJAK5Fg9v6g2AsPEGSms1/dJ24P9uFOdTXtNhvw9aqD1Jk6WEQ4c
 Gv9IOrnAkDHbBUbQfrPY5Jqssv8aN7VYa/Jm9Y6qIrk1BWCFLpDI5jdE2p1phwnLhnc5
 mRqxtVmW/VdiXvRH1nQtJ8FXty2d6LtcY+W/fKVmd+2dAoAAwpoQIuEcAuaqDYCFMg89
 WK2oY72buo401ftOTvCuQbl1VJJ2BUo6lQswwiCVzPjEVU2srVmq1hWHvw1DD/LAg7ue
 YyS/2MKEBdDFG6fxhKqXC26GWuuP6KVd9J5yRIQjV6VdrOcEZaxJf/qLSr1wJv5lfvTq
 1HVw==
X-Gm-Message-State: AOJu0YydOPAO8qPHV1+eriSAlAph/tcfd6booUo56oLl2qwxUo3NYUqZ
 6jdoNchH5iFNIlO+oAarz07o1pvCW5+2l6E9JLVIijubHSUDwx0a0u8g/jbeqMk=
X-Google-Smtp-Source: AGHT+IGWnjAfSU5XqheSf663PqJ/VqOHPodG/ROskXigv8o/a2EB6sogiWrMGNxnDuOtgKWQcQEOPA==
X-Received: by 2002:a05:690c:dc1:b0:6a9:4fdd:94df with SMTP id
 00721157ae682-6d286c7c24dmr7431007b3.24.1724888129591; 
 Wed, 28 Aug 2024 16:35:29 -0700 (PDT)
Received: from [192.168.98.227] ([172.58.111.246])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-6d2d419eda7sm14237b3.58.2024.08.28.16.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 16:35:29 -0700 (PDT)
Message-ID: <dea380d9-1f84-4c88-a638-bbfff45e4e18@linaro.org>
Date: Thu, 29 Aug 2024 09:35:15 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/15] tcg/riscv: Enable vector TCG host-native
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240813113436.831-1-zhiwei_liu@linux.alibaba.com>
 <20240813113436.831-16-zhiwei_liu@linux.alibaba.com>
 <7eabd980-ec6c-4748-8ada-f9d6228ee2ef@linaro.org>
 <8883511a-fa31-4703-9302-5a7d511d2067@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8883511a-fa31-4703-9302-5a7d511d2067@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/27/24 18:31, LIU Zhiwei wrote:
> We will use this one. But probe the vlen in util/cpuinfo-riscv.c has no meaning as we 
> sometimes use the compiler settings or hw_probe API. In these cases, the vlen detected in 
> util/cpuinfo-riscv.c is zero.

Pardon?

While you might check __riscv_zve64x at compile-time, you would still fall through to


---
     }

+   if (info & CPUINFO_ZVE64X) {
+       unsigned long vl;
+       asm("vsetvli %0, r0, e64" : "=r"(vl));
+       if (vl) {
+           riscv_vlen = vl * 8;
+       } else {
+           info &= ~CPUINFO_ZVE64X;
+       }
+   }
+
     info |= CPUINFO_ALWAYS;
     cpuinfo = info;
---

Do not attempt to merge the vsetvli from the SIGILL probe; I expect that path to become 
unused and eventually vanish.


r~

