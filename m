Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC43C61DBE
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 21:33:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzLFJ-0008T7-NY; Wed, 26 Aug 2026 17:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzLFI-0008Sv-CJ
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:33:20 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzLFG-00086X-MM
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 17:33:20 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-cc1c8d4a959so861624a12.3
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 14:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787779996; x=1788384796; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zbDi9CWyyIgqYshN8Htrv/hOz0PiVueQikIoXKRX0uY=;
 b=wH+NDohvWVRg9LshrOJ4zSecVTyMjVe5tb+YLC6yGdvzrnH1FgOEG93TdccRBbTLv2
 zZyQPxUJ3x2Ds1/zG1wo1GQ7Cfg369w2BFkKq0Kr54S/OJmisxp8aMxDflfwITcZISVY
 Uj1d3R3MEP6H80hSXfjIThFepIQSc8AEKz+nDjtro4NAot2nB/LcTY28L9ln/BpWjCGy
 O+dvzmf5cNzryJcQl++Vga/e7Cxq9cs7JyHjgfanXZjyLxvMtFkVLgp0qsx+V66DFz6Z
 TK4RZmdRd9vSjeB0C/7j1zNrpb4NN31s6oE+yzzrl15uGkYy7bICpb/YXju7+8vNg1Ge
 HWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787779996; x=1788384796;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zbDi9CWyyIgqYshN8Htrv/hOz0PiVueQikIoXKRX0uY=;
 b=Xl9QmRTIpW4vXwQ+FrkPt8aDdQO/MjwG3T4N6dSiP60yM0+ioUx+5VkdPREKlKzRw8
 vBBSl9CcX0PTjl57zNh6wkduTEk7FsKtuhR7v6VvVer75TJ9SS1UEhJbybALZWjcPLjk
 Mz/Kc/xOUlW2Gxtj1xbrpVCVaWC5RyeuiGhcB4PjPxBAQpYy7K7cSvdMQOgB05U4Rjtr
 wIBTAmJt01mcIJl3QEV8MJSx7DiechjVRRUt4Dcl9FJ3mPW5SSE+A3XXkTx4FpDLUDWE
 GA85L/VxyhQBrQn2Etat3YbGoi/i9FC83fdhfqF+lNZKFPZC8QGS2QuBkcvIlF1g1AR2
 INvg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpkrqTZAKpfwpb7N06BgswxTQXyN9xsIZvhcHzRN6BS36CuwQZphhurhfISIx6eiIiEdCecVPaqZTxj@nongnu.org
X-Gm-Message-State: AFuF++ndKMimqa0ts3w7wSQJFv/7CJ9kdFrZmV/eruDQIPjdu2tRq4k9
 6i104CBJ8eQoPuDEbIPZfO7vDTqTwXS5Smg0ll429DPuDHZx7JQpHNxm/zytBjDTMBg=
X-Gm-Gg: AR+sD1129NhQcPZwLwpy1ukF/4AAkFngbkDiwEz4xNe88d3hn0I4USoI+ch2giFFcIg
 xUeBz62TEBBG0k9VTCu9rYjk4FG9w+26fBLN5c+KXeBHw2uWcRODgraJqw0oFqP1L1yApTdUbIy
 /TmnHEVVyTwXFkCQOP4S2WrbFrl76zH8wC2OdNyX0ePtQgY2hmVifAfQy3oqYhPLHljW/FoapIM
 HH+sUAO9vU41IhGv1/7sBrj2ZHk8tpbY0amzeftP2qQqEkiWpYtCf0yf4ttD9S3aVECEeyLChs2
 MLy4LoO4cbvgrgay5665ug3gyQqXJUvo0BMWfPcEOWY7Q3AsOKdM6flHDvCuj05RmsL3XNUolfs
 jqnCkdlxXTv9Zqjw4iODHxr51tA6J8QDPOQ9hRkjRhwXci/EDhdUD6/+ryB2QuL/Syum5CCTANt
 hsw0ij0MuZX+GpfAEpFr7pT2d1YJxIIbbDZDmwZlvYOjQA1yVFMLAR1/JlVGXFfmp6dWYbXrnBK
 f2OMD7Y3R1JUDcPetCRKNXVN99l
X-Received: by 2002:a17:90a:d2c6:b0:38e:5c6:4db9 with SMTP id
 98e67ed59e1d1-3966d3dafb9mr21562185a91.11.1787779996067; 
 Wed, 26 Aug 2026 14:33:16 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39645d31f44sm9575039a91.10.2026.08.26.14.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 14:33:15 -0700 (PDT)
Message-ID: <0dd6b0e8-be0e-423d-8e9f-733682514451@linaro.org>
Date: Wed, 26 Aug 2026 14:33:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/23] target/riscv: Rewrite vext_ldff
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, frank.chang@sifive.com, qemu-riscv@nongnu.org
References: <20260815194549.1377505-1-richard.henderson@linaro.org>
 <20260815194549.1377505-12-richard.henderson@linaro.org>
 <ao3JcPyrC7cZaCgp@sifive.com>
 <2db8ac0a-1b37-450d-8c11-2c5da46ca97a@linaro.org>
 <ao8wupCB3A-7-4-K@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <ao8wupCB3A-7-4-K@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

On 8/26/26 11:40, Max Chou wrote:
> Sorry, my previous example was unclear. It does not need a 1-byte PMP
> region: RISC-V PMP definition allows the minimum 4-byte PMP region,
> which exactly matches one e32 element.
>
> For example, with vl=3, vstart=0, e32, and v0.mask = [1, 0, 1],
> configure locked PMP entries as follows:
>
>    PMP0: NA4   [base + 4, base + 7], L, ---    # element 1, no read
>    PMP1: NAPOT target page,          L, R      # lower-priority page allow
>
>    bytes:       base       base + 4     base + 8
>                 +-----+    +-----+      +-----+
>    element:       0          1            2
>    mask:          1          0            1
>    access:     active      inactive      active
>    PMP:        PMP1 R      PMP0 ---      PMP1 R
>
> The RISC-V spec defines that masked vector loads access memory and raise
> exceptions only for active elements.
> Therefore this situation has reads only for elements 0 and 2; PMP0 must
> not create an access-fault condition for this instruction.
>
> My concern is that the page probe may be unsafe in some situations
> because PMP permissions can change at 4-byte granularity inside a
> target page, while the probe includes bytes which are not part of
> active vector memory operations.
>
> Maybe we could use the page probe only when it returns flags == 0,
> and otherwise fall back to checking only active elements or active
> runs?

Ok, thanks for the clear example.  flags == 0 does not help with this case.

What we want is to probe the first active element, with 
probe_access_full.  For this particular case, where a PMP rule matches 
something smaller than the page, we will have set lg_page_size < 
TARGET_PAGE_BITS.  So we get the fault (or not) for the first element 
exactly, and can then tell via flags and lg_page_size whether the rest 
of the page can use the fast or slow paths.

> I'm trying to create masked fauly-only-first + PMP test for this.

Thanks, that would be helpful.  Similarly for masked not-first-fault, 
please?


r~


