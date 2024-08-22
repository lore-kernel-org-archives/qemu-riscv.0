Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C580CC3DA4A
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 05:13:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sh08l-0000q2-QT; Thu, 22 Aug 2024 01:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sh08k-0000oP-0T
 for qemu-riscv@nongnu.org; Thu, 22 Aug 2024 01:13:42 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sh08f-0000zp-3m
 for qemu-riscv@nongnu.org; Thu, 22 Aug 2024 01:13:41 -0400
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-39d20c4be31so1436825ab.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Aug 2024 22:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724303615; x=1724908415; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lxyw4jTUYNSZ08ayEc0bcN0a2ktnE4aAcH1DR5fP/qU=;
 b=k+dXe+4KF8xwzFaa+DNA+042V5fHaY8Dyn5GbuqVmzcF5t2tMCCcA7j3UoiS6YTTpj
 MTiOBwtYm+BkX/D/cj5jAuu9JjDS+IrsWO35hD/gWErILpIe2XUrokP5aMzZ7V750lww
 aTe9hFHVQnyPDFRwjzGq2EW7t+H0eL9QzIOCGNMGcfXkzWlL2T6yOKcmhb41Skbr7NUL
 GQ0+YN1SDD0DE4xUPaU4dlqYJ2bQe5MMz+SlR7LgWx5AneVpAIPhxiNnA/Phl1DkXvXk
 /XFGCLXano4OzwP0fd34XlP6bETv6FGbGP8+zXA+QZoRGEjWnd8R8jGYkq1AFOTwhFqA
 k2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724303615; x=1724908415;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lxyw4jTUYNSZ08ayEc0bcN0a2ktnE4aAcH1DR5fP/qU=;
 b=RnaL9I1GwP4vqpLuDVjxbPV+3kHR5Ef1TyFb+NIa0d5VtE39wV6hAW3NBMgD6iWC/8
 72jOVMqlGEH6xLmAgQMQtFRy8p/BGimoNd1OzRRdgqEGo6glgxD+3mSYs2fWkxM2cZO5
 /3c5x3uh8lSW9SmIp2cX5/6aQ8vxNL8df33JJ6dn+kyNJvmabWTpXUbPEhsGeX3Xw7c6
 peeGaoSvXm1vbGAiOqHiAERDxIR5yglp1vUnpudVkWb2FFTBh1hfbR9qJkDN6oDZLq4C
 QtGSv8rIyDsvidRRT43I9mcdfYppyLxQkn+zoFur8Cd4kj1mJXkld2dHWM0GqJ/Z0A9t
 sf7Q==
X-Gm-Message-State: AOJu0YxtiZlRmYKwj8GKhFakorZB6sDD9G7do6U1P7ErZOtLHfMX3xom
 8/hnqKdWaaJlSnrDtuWEPCWMyYiSrxqVhGf4TUzgx+OC1CLT8owyxLyM9MnvaN4=
X-Google-Smtp-Source: AGHT+IFXftqqVygI38zUvVqLIhqwXqxGgufJHNmngKNxa1MC59ccGGHVwGCA7Z5gnRk8mesjJNRNFQ==
X-Received: by 2002:a05:6e02:156c:b0:39b:64b9:a4bc with SMTP id
 e9e14a558f8ab-39d74ea5bf6mr10395575ab.19.1724303615245; 
 Wed, 21 Aug 2024 22:13:35 -0700 (PDT)
Received: from [172.16.0.208] (180-150-104-113.b49668.bne.static.aussiebb.net.
 [180.150.104.113]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9ac99502sm487215a12.14.2024.08.21.22.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 22:13:34 -0700 (PDT)
Message-ID: <43c01b9f-27a4-43b7-805b-d71509a46dc4@linaro.org>
Date: Thu, 22 Aug 2024 15:13:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/16] target/riscv: AMO operations always raise
 store/AMO fault
To: Deepak Gupta <debug@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 Alistair.Francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jim.shu@sifive.com,
 andy.chiu@sifive.com, kito.cheng@sifive.com
References: <20240821215014.3859190-1-debug@rivosinc.com>
 <20240821215014.3859190-13-debug@rivosinc.com>
 <fbe42e3d-0622-46b4-93eb-ddb13bd4814f@linaro.org>
 <ZsaNQcdSJM9lSVoX@debug.ba.rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZsaNQcdSJM9lSVoX@debug.ba.rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 8/22/24 10:58, Deepak Gupta wrote:
> On Thu, Aug 22, 2024 at 10:43:05AM +1000, Richard Henderson wrote:
>> On 8/22/24 07:50, Deepak Gupta wrote:
>>> @@ -1779,13 +1780,25 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>>>              env->pc += 4;
>>>              return;
>>>          case RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT:
>>> +            if (always_storeamo) {
>>> +                cause = RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
>>> +            }
>>> +            goto load_store_fault;
>>>          case RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT:
>>>          case RISCV_EXCP_LOAD_ADDR_MIS:
>>>          case RISCV_EXCP_STORE_AMO_ADDR_MIS:
>>>          case RISCV_EXCP_LOAD_ACCESS_FAULT:
>>> +            if (always_storeamo) {
>>> +                cause = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
>>> +            }
>>> +            goto load_store_fault;
>>>          case RISCV_EXCP_STORE_AMO_ACCESS_FAULT:
>>>          case RISCV_EXCP_LOAD_PAGE_FAULT:
>>>          case RISCV_EXCP_STORE_PAGE_FAULT:
>>> +            if (always_storeamo) {
>>> +                cause = RISCV_EXCP_STORE_PAGE_FAULT;
>>> +            }
>>> +        load_store_fault:
>>
>> These case labels need to be re-sorted;
> 
> Yeah it looks ugly but I didn't know what's expected. I'll sort cases.
> 
>> you're mising load/store when you're intending to check for load alone. 
> 
> I didn't get this.

Fall through of various case groups into the storeamo checks.
Only the first RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT case is correct.

>> But perhaps in the end maybe just decode_save_opc(ctx, uw2) is better.
>>
>> I expect gen_cmpxchg also needs updating, though I don't have Zacas to hand.
> 
> I prefer decode_save_opc(ctx, uw2) but then
> 
> $git grep decode_save_opc | wc -l 38
> 
> I can update all these locations but it'll be handful.

That's fine.  Let's add the operand and update to pass 0 from existing sites as a separate 
patch.


r~

