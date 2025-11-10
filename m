Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0359CCFA13
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 12:55:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vIRQV-0007gn-FS; Mon, 10 Nov 2025 07:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vIQtk-0004D6-0l
 for qemu-riscv@nongnu.org; Mon, 10 Nov 2025 07:21:39 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1vIQtg-0000hk-AW
 for qemu-riscv@nongnu.org; Mon, 10 Nov 2025 07:21:26 -0500
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b679450ecb6so2314098a12.2
 for <qemu-riscv@nongnu.org>; Mon, 10 Nov 2025 04:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1762777282; x=1763382082; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e44jDuR+hMq8gfTXbw9E1tkIcgT9CLYBdOdZSJsryjM=;
 b=m5xUhvUG/s6/JRyKPV9o647JoIAXOkX3b1ezXk4c2GbHr1pQJjJr21uR9/aO6svmWt
 u+K80gBkRn7wre6CCzC/2DDUwYiol46k1oVx0N8Vz1Y0qbs1UjkI05zd0qOjGeXcRgNe
 hqZPmXpFfo/6W+tJZ0KOpYU11QeswLWLmQa5oq4632N7f9MuAf8a2LTvoLHYqCAUOBW8
 uoXqrvCr/YS9NCXFQXtrRA+KpZnEadWxFRw6wCdd+MU3w0yDCp60Dhuu/56fVxjPWOjv
 CIgjmBrSaBLYQAtOPw7Nqk1+FG7t8BPJuTugnubD9ykpngJFScYXT0BKQo7wU9uFRHXT
 4blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762777282; x=1763382082;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e44jDuR+hMq8gfTXbw9E1tkIcgT9CLYBdOdZSJsryjM=;
 b=Cr6LLo1Q7eEit/c16lql7oYJ1UjudVPR9Kc/w7t5dZ5vsAgVvf6Ls1o65pbGlSXtAt
 7POTX/SRuV7kocG35157DPOWFHPANxhNnZ7NsMxo+lw2qvilJB2D6m35E1NXizFFBMtu
 92W1l/gXp96mYktqIAgMdqXoGI+txWHnfuIs7RYpX1EaLg94hRdTSyli0MxqNs7QAAqs
 d5fesINeccSSf1yderJN/kfZy1clFDDkj9edKNZ+WUjIpN9G+5awTi50/6LgRWAaEqJN
 fwzK/nmeVXLmavtuUUv9jApMmMhAdCR3XL1Wz6BcYMYlfKjpDZCAEF8LuPP0SGxKUgEq
 oFOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU59JdGg50XvO4HinBPbNz0YINJ3++rGA56jxJcn9lMTj3mSdZx+32hjWjoNfml1TXaMICYUN+qeXsT@nongnu.org
X-Gm-Message-State: AOJu0YwqJZ5jz1yMYPvy9AepLCf3oEv2o6nABXvkb3gIjk66Pg3GEMrE
 eGWIxGK8HYwCb+BRiR+i0Bdepvy19cDSOtNnVOWmkDI/IODxqmws8NzYthgDkwzQdp4=
X-Gm-Gg: ASbGncuQr3uh/XgFzG8BFss8avp4+aVWWCQPUFfY40a+WJzvUMSYjuuxmfPlorcAh9V
 vu8khxURodrIRkJ0utUYsO6woi5Mz3Omb6Xzbun1IwBLSOIK23/1t2PUL7grsM/XwPpqHEIv/QT
 96qtyouO7LlU08fkJSvWFHfcWGUZN5No5zshPPSoTEVw250mqNNwJblQIwekJgydI9G1jL7YxeR
 qVY6lf7r+RV9+PsEuI++nfDttQ2nVfnuj55FdwDks8eOvTgcisNxyoRNymRWYp+V6y8zC6j8R8K
 dOPaXF3nCJOz91E86wDllYKkht82ZhE3B+MGyM5452hQxTP9WgSMegLA4Bs542IjhPFvUSmc3Jt
 HrV2qd8kIh8fpaXbUqZsvghIYPxv9J+Vto28eTzGPme4g3b4ZbNPd/fZcgkvUDYEknUohLBoL/3
 8pnUmSBWFFBLWCmQ==
X-Google-Smtp-Source: AGHT+IE4vTHsDkQwpy8eWI9w4CA8/OgXexqzA46hhJ1XrLGM6B7ajCq3iKsVSRyqf/sWV92F3GOIpA==
X-Received: by 2002:a17:903:a90:b0:295:7f1f:a808 with SMTP id
 d9443c01a7336-297e56b8c0cmr99514005ad.38.1762777281841; 
 Mon, 10 Nov 2025 04:21:21 -0800 (PST)
Received: from [192.168.68.110] ([179.93.21.233])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0cc76c0e8sm11621965b3a.52.2025.11.10.04.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 04:21:21 -0800 (PST)
Message-ID: <6374e937-6de9-4d86-a833-fc519e91fac8@ventanamicro.com>
Date: Mon, 10 Nov 2025 09:21:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] riscv: riscv,isa fixes + check script
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
References: <20251106112044.162617-1-dbarboza@ventanamicro.com>
 <20251106-napped-haunt-109e9e24ad40@spud>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20251106-napped-haunt-109e9e24ad40@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x532.google.com
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



On 11/6/25 12:48 PM, Conor Dooley wrote:
> On Thu, Nov 06, 2025 at 08:20:42AM -0300, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> We have an array called isa_edata_arr[] in target/riscv/cpu.c which
>> needs to be always kept in the RISC-V specification riscv,isa order.
>> Easier said that done: as more and more extensions are added we're
>> failing to keep up with the array ordering in the review process.
>>
>> I have considered changing how we're retrieving riscv,isa to not rely on
>> the array ordering (in fact I have code that does that). We would sort
>> the enabled extensions using riscv,is ordering during init time, before
>> writing it in the DT, ignoring the current isa_edata_arr ordering. When
>> all was said and done that sounded a bit extreme and I think there's
>> other stuff we can try first.
> 
> FWIW, I have yet to actually see a parser for it in a "real" application
> that relied on the ordering. It probably makes a parser more complicated
> to write than one where the ordering is ignored. The only time I can really
> see ordering mattering is if something has a very simple bit of code and
> is looking for "rv##ima" or similar, and using a string comparison
> function.
> Either way, my point basically is that you shouldn't have to go to any
> extreme effort to make sure it is perfect, particularly when it comes to
> the multiletter stuff as, at least for devicetree, the binding has never
> enforced ordering for multiletter extensions. I know ACPI cites spec
> order (and spec definitions, so GL there lol), and there could be relevant
> for some ACPI only code where the devicetree parser is not being reused.

Thanks for the insight. Yeah, I haven't seen software caring that much about
the riscv,isa ordering either. In case it exists it would be broken in QEMU
given that we're using the wrong order :D


Thanks,

Daniel

