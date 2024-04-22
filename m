Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0020EC4345F
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 19:46:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ryzb0-0003xd-83; Mon, 22 Apr 2024 15:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryzad-0003Yv-VA
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 15:44:39 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ryzaO-00081E-Ln
 for qemu-riscv@nongnu.org; Mon, 22 Apr 2024 15:44:35 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6eb96620559so3057113a34.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Apr 2024 12:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713815059; x=1714419859; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qErcEianD98YXMxeaoBBmIaYGIAlvM3G251pHMXAt7U=;
 b=sn0yNEOSBjDR/ji/ZN0ZFOam3Fd4no9Hip9VRNtqfF3yE5wxOfaPtz2A7NxIQK0Ldr
 k/eeu757oKCNvA3BiQH8UblzhLHgRFi03eu0UZsWC6H6B03LYISmoVOWlnD83vldCc+e
 yeV7p5mAaO0yyxGUf1ga73FBqrI6hGWeObW2JOsqH7MuHfjEkBt9KAWmYckudjuVcDxZ
 Z+fJ496+eHQC4w2ex+RKo5bdyU4i0xUnvFmJ6rD7G3jfMoWB1is6cZLiaQpBZXlcejjR
 vSB9p6fh/SkY09YClQIK8L4oGZtdWjt/+/uckEQBrppBemskKScNEX5KK+c3vrlxZoip
 wriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713815059; x=1714419859;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qErcEianD98YXMxeaoBBmIaYGIAlvM3G251pHMXAt7U=;
 b=Tts5VwgWTaueWZJzQA/RSW1ZgjHEDQfbptg9YZaxnS8aGXM+wHTWViZpd1HsfzEmrg
 WhrUNjiQajD2ZYG79RcMwrALImN/tDZlCBb1saXn9DRDsMmNmj4/FF3mdzRCPJ1WjoBd
 ETNc5OXqrs0oV/B7R9rbcMXPjWYKnq0e7upPtWi5DZzT5vgKvnkHHrdi5y5FWU/Z7t6J
 40CuSt9+qn4GGGEuf6ililo9mGpx2v/f8F1D75OX/XRLQtyS99StSCTJw5RpdssjTQS1
 ugBJsCmXeaJKfxyUZYiD5uT63/z/mPBSphZhj+5wEKfyoyBqJw3yb1y+oIfx3/Fvr77W
 O+4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDvzXnxG/JPnUfWOwtEFWUK+ACBQMSldg4zyNNVGDu9ugPBURuDUTWekw0+IepTp3AGMrrXzmmCQQXKhRinLk3tjcjwOI=
X-Gm-Message-State: AOJu0Yw+SvmpH1EJ9icUd4VCsqJNR0l8X3dpo0MypFeB3LyqE53N8Ttm
 Pc+6WjGxdWgmTZIRG9AW2QJO/IfAgiyNXBYNHDJQZd2rKVyebfIFRVgRwT4h7KQ=
X-Google-Smtp-Source: AGHT+IGKpReXRApH0g15zcIm9wkyrEx+Qez2nDZiIur6oakr9yM6eVrXKFQz51Q1mSY/i45Ipx4OwA==
X-Received: by 2002:a05:6870:716:b0:22e:7040:3e00 with SMTP id
 ea22-20020a056870071600b0022e70403e00mr10278253oab.8.1713815058993; 
 Mon, 22 Apr 2024 12:44:18 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 s27-20020a63525b000000b006008ee7e805sm1811341pgl.30.2024.04.22.12.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 12:44:18 -0700 (PDT)
Message-ID: <73af7008-f40a-4861-8826-2de4d5fc0564@linaro.org>
Date: Mon, 22 Apr 2024 12:44:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: change RISCV_EXCP_SEMIHOST exception number
 to 63
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Cc: Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
References: <20240422135840.1959967-1-cleger@rivosinc.com>
 <b0fcb589-9217-4d30-8b72-5b0210ea871f@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b0fcb589-9217-4d30-8b72-5b0210ea871f@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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

On 4/22/24 10:45, Daniel Henrique Barboza wrote:
> Palmer, Anup,
> 
> On 4/22/24 10:58, Clément Léger wrote:
>> The current semihost exception number (16) is a reserved number (range
>> [16-17]). The upcoming double trap specification uses that number for
>> the double trap exception. Since the privileged spec (Table 22) defines
>> ranges for custom uses change the semihosting exception number to 63
>> which belongs to the range [48-63] in order to avoid any future
>> collisions with reserved exception.
> 
> 
> I didn't find any reference to a number for the SEMIHOST exception here:
> 
> 
> https://github.com/riscv-non-isa/riscv-semihosting
> 
> 
> Do we have any potential candidates? I would like to avoid, if possible, setting
> RISCV_EXCP_SEMIHOST to 63 as a band-aid just to replace it later on by the real
> value.

RISCV_EXCP_SEMIHOST is internal to the qemu implementation and will never be delivered to 
the guest.

I suggest using a number high in the >64 reserved range which will (likely) never be used 
by any implementation, including ones that *do* define implementation-specific exceptions. 
  Which seems more likely than not within the "implementation defined" range.

E.g. target/i386 uses 0x100+n for qemu internal exceptions.

But in any case, the number can be redefined at will and not cause compatibility issues.


r~

