Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB200C5475B
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 17:16:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rjjF6-0003de-Iy; Mon, 11 Mar 2024 13:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rjjF5-0003d9-7Z
 for qemu-riscv@nongnu.org; Mon, 11 Mar 2024 13:15:15 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rjjEy-0001Yo-Sd
 for qemu-riscv@nongnu.org; Mon, 11 Mar 2024 13:15:14 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6e64a9df6c3so3766860b3a.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Mar 2024 10:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710177306; x=1710782106; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GVf3MZ1UMLge6oTb9AjZ/BCsVdGEYCghjxu/ZhXFYpM=;
 b=weN61TvBwDsL7pO9QDR16nN9S7KorUANnDL1YPA71OJx6+xc8RTd0o3pszhGUPw/N2
 Ag81N4r5eZ6niGN4Kf7H3IXCBDujPjjmtid9TAbQAMEKmHAvd1wa5afk+nN+TwNEQpiH
 9vSeqphyUBveXlDFsk48QYu/Zw7/YZQnWI4SLaImGPCXKckkVw5F3Bh+tuwdf7xNZd2k
 vpZ+sUG2uVL/AcDYN6btYuCfWU1OINhWGUfwyHlT+mElQA3wB6WZWaJDLeBK5o8tDcCv
 MTiEjifY6WbRWT9xReFQ4JflOBmWO196swsU8AzN4uuAW6pkuEwDrSLYqeSAicPrEsoj
 6Z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710177306; x=1710782106;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GVf3MZ1UMLge6oTb9AjZ/BCsVdGEYCghjxu/ZhXFYpM=;
 b=QSIAooa0ORK4Hl49K2R3WjBzNDLFjlU4NaSXfyd7BpcZ8L08OmiLQWxQ1K2M/ZxyxS
 nOoL5M/16qM7zB9Ddlr6KgD/oeJIUD1IhF5V4aIXGRdjN/XfZicblpqaieEIBD/VRTJ7
 nkQhtwGiDqyRXLcFr/BuSpMV+jWeaNqY8FcJK50GhRWVuuz15EOBGsx7n/ozUUUNaNU4
 07Rmg3JaJRLE20dPxsxhF8q8pWcXadbPcKLvf99/eDJ49lQmoXo4HmcGHNHV/edFq4TC
 jOKBQ/psi5I2ThjaHBNJRRLmj6OPAglB8/k/0QSYH0gJd3oAUy/NBcuwJ4d2BFSZoUML
 r4rA==
X-Gm-Message-State: AOJu0YxdRarVgaXByJsY91oqFm4p1W3+DaqVJvoayN8l4eBoy8mBtJXS
 2Xe1iCHpEVQecLuTuW+W3F4looyFzhczzIU8qHiZgz25wdrOkuqOA1YZXQPHngXKXgNIcIrMS61
 o
X-Google-Smtp-Source: AGHT+IFc+Oxl7Oj00oC6P2AT1s8Ik7QkG3Uo0Zqzo2RTqB3SBxnpdmULdEnbRG5r/eS1rV/xGem1AQ==
X-Received: by 2002:a05:6a20:7d88:b0:1a3:c87:a862 with SMTP id
 v8-20020a056a207d8800b001a30c87a862mr8089376pzj.7.1710177306409; 
 Mon, 11 Mar 2024 10:15:06 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 gx20-20020a056a001e1400b006e65726ab93sm4699700pfb.143.2024.03.11.10.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 10:15:05 -0700 (PDT)
Message-ID: <6ced24cd-657e-48d2-b273-1e5fc471415e@linaro.org>
Date: Mon, 11 Mar 2024 07:15:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] target/riscv: remove 'over' brconds from vector
 trans
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org
References: <20240311135855.225578-1-dbarboza@ventanamicro.com>
 <20240311135855.225578-5-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240311135855.225578-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

On 3/11/24 03:58, Daniel Henrique Barboza wrote:
> Most of the vector translations has this following pattern at the start:
> 
>      TCGLabel *over = gen_new_label();
>      tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
> 
> And then right at the end:
> 
>       gen_set_label(over);
>       return true;
> 
> This means that if vstart >= vl we'll not set vstart = 0 at the end of
> the insns - this is done inside the helper that is being skipped.  The
> reason why this pattern hasn't been a bigger problem is because the
> conditional vstart >= vl is very rare.
> 
> Checking all the helpers in vector_helper.c we see all of them with a
> pattern like this:
> 
>      for (i = env->vstart; i < vl; i++) {
>          (...)
>      }
>      env->vstart = 0;
> 
> Thus they can handle vstart >= vl case gracefully, with the benefit of
> setting env->vstart = 0 during the process.

You'll want to update this comment for VSTART_CHECK_EARLY_EXIT


r~

