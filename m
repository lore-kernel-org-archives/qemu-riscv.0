Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9078C36001
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 12:53:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tusuX-0003KL-E9; Wed, 19 Mar 2025 08:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tussf-0001rn-Ew
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 08:51:01 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tussZ-0006oh-J6
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 08:50:45 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-22409077c06so169638525ad.1
 for <qemu-riscv@nongnu.org>; Wed, 19 Mar 2025 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1742388638; x=1742993438; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Rc9600+NFzOCAqvbzrl4Mc9z30rP+N90z1s0bKSmK6w=;
 b=MzkEzEUMB1jgaLl3yyWerCsQoWCTJv7lYVxhu/gsKRCrtDMjGihUR6vNF2zXQB0YRi
 Fw2gYY6l/kL07dGToagWPQK9y4mzHXexh3rK8YsXfIMQN0jYiYqQ4Q2/ZwdzueLJVKcM
 xR2vsDL9Omh0dGWd+pf+LsYEhTbIbjKX7k7J7zhnLacMVFrXPbvyKVI5OHKr8m8karrA
 ISNbNm691gAz3svsacaUT40AqOeyTm6WMUsaFUTkt8psqo9KloFAq9qgVDkDicDAU+wp
 0PTQQnmKq9HhK6QxCKT/TaR7VV7zG9vKDB0nHZ3gyaOekyIf0FxNwAGWe1zyACP1Fwax
 Hj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742388638; x=1742993438;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rc9600+NFzOCAqvbzrl4Mc9z30rP+N90z1s0bKSmK6w=;
 b=Fu+PlzdWUO2aoAYVDhp2woNusckTqgMKPRXWeO7S4JYUPDDDQkpnyPdmlZOenrLYFl
 d+gOW15Rrf4VAhDxSg8db7r6qE4WKAKdeSNwGO5cDBTIoh4SnxBYHKf/4RL92P0yNpY1
 LYNLZmJNQUDJf7rHMEn2xEzCErndyX7zaTgy9csCEc6nI4JTSubQ5pOdhpr8VOLi+GOf
 CqKu40hbMDrOYmshKAqqKlQr8x1B/x2veJDcGkDvmg/sXmfaxECIjamBtH1VBAPr5IvP
 oghb8oQraG+UvGFjgHdAC7u0ynw+jNoCQV29okKwolcEGn+4rSrUCWgvLmLHe0YUnOzJ
 9S+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA62Kr1cT2L9GANlAJiL89yaN5bMo8Iz63fOoUnhHVPx/mVWit7YkpdNnFLMTz4cqtBempUVbVM0sK@nongnu.org
X-Gm-Message-State: AOJu0Yw12qxyw5xxEjspfNh/c7izGtgeer7w7CB/NXJpq9w+liuXxmA4
 +/KGiiF3g3DMfAoaOpNJ47qXGHueHZENB5rLIqbizjalQe1rir+x4Xvo7qvxr+vJRdP25f+jFrj
 3
X-Gm-Gg: ASbGncvUvqmdCO/AdzMQjnZ9b/MEKLKvBF/wdxCZl/io0V69UTDbKiiZzO4lLCsb/Sb
 d2GL05mqUu9sZW80egm9RvDGxLzWtvEUg0t6dW2Y5qc59jiOL1SQiX+au6n68WRMmzDbIEOOfYD
 spwvjqRYARZ5hz/TPfL0FKG/Qp4LVwatIoupPgoMz38BnZqic5JOCHgLEc/iS608q2CvxU4o7vD
 J1x5MOkNerCvIeVWd6R9AdMI8eGkXKO7uPvjrxBPe4n0FiCjjF8LBpcZHxFftt9ZRc44p2NAz4v
 ZNzdOf3iY8WzP8HlNRnfkOsXDU2yJseYYurmJ5UlcICQI7WvOhMXGAs9bz8=
X-Google-Smtp-Source: AGHT+IGUgP1w1yM2JyQqdBmyW1pVIRknyemqFz6ZKVb/0rXLIhpaRCIbOh9Zbm+lFYYktirMVK0IFQ==
X-Received: by 2002:a05:6a21:168e:b0:1f5:8f7f:8f19 with SMTP id
 adf61e73a8af0-1fbeb5a7545mr4257021637.10.1742388638045; 
 Wed, 19 Mar 2025 05:50:38 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.117.79])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-737115295e5sm11508813b3a.23.2025.03.19.05.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 05:50:37 -0700 (PDT)
Message-ID: <a7ffa471-c5f6-4a80-9e2c-f1b4d0c19b64@ventanamicro.com>
Date: Wed, 19 Mar 2025 09:50:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: emulated riscv PLIC
To: Yanfeng Liu <yfliu2008@qq.com>, qemu-riscv <qemu-riscv@nongnu.org>
References: <tencent_B08E6CCE1DE2E1580A782D03697B9EC40F05@qq.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <tencent_B08E6CCE1DE2E1580A782D03697B9EC40F05@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62b.google.com
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



On 3/19/25 4:55 AM, Yanfeng Liu wrote:
> Dear experts,
> 
> I am wondering the emulated riscv PLIC in QEMU allows triggering an interrupt by
> writing directly to the memory mapped pending register?
> 
> For example, to trigger PLIC interrupt 12, I wrote uint32_t (1 << 12) to
> 0xc001000. But with QEMU v6.2 this seems has no effect.

Can you test with a newer QEMU release? There were a lot of bug fixes and
changes that landed in the PLIC emulation in the last 3 years.

Thanks,

Daniel

> 
> Regards,
> yf
> 
> 


