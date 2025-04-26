Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E497C369CB
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 14:12:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u8gGf-0005ud-8S; Sat, 26 Apr 2025 10:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u8gGX-0005to-O7
 for qemu-riscv@nongnu.org; Sat, 26 Apr 2025 10:12:26 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u8gGV-0002Me-W5
 for qemu-riscv@nongnu.org; Sat, 26 Apr 2025 10:12:25 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7370a2d1981so2691891b3a.2
 for <qemu-riscv@nongnu.org>; Sat, 26 Apr 2025 07:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745676742; x=1746281542; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vnMd1tAgvkRKzVKm87CYqGYGJ1gOJIvWHyt5iVs0x6g=;
 b=DKOLegiZgF11dDfM5v5t28MFmEO7IhNxFkMqXnSy3bXrL68TymqbEXyUMd2WkUWJ3N
 VRjSX8plbMvHRfrmNN7+EzNoFQFylJfqw3kM6lwzsU3arLpTWEJqFF2Pf3C4NYCfEiM6
 MkGbcITA6cfjntHjmwcrQetyowhXnLo9mWisReKJQA2IY9lGte9Bj5BSofu4U9ZGSYls
 YjFZDQXma7LbyqtRSdGiYumTXoAjP38cLnt5yntOtK5lPRjFyU3cyXbC0DUj/7BOmv7B
 IFra/1/NVq1KbrcRNCFR4vm+Hq/7m5s3R/z/IBycodfqjCrKb6/RTxihVCJekHYaNubO
 7XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745676742; x=1746281542;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vnMd1tAgvkRKzVKm87CYqGYGJ1gOJIvWHyt5iVs0x6g=;
 b=t+l8h3XXgKtZcNYxM2ZtiN8e3BcTlY1/8Hdha/cKzoJiQL4lmIgVVupVTdvo7y4tMO
 XmSfeCB6NUYinE/1CAzaa/V8ceD0ps8Qh7WRJ3nq7sMwNsFEMnCGYhUZcid2+Dm4dnFT
 RywcvQXm+al+uHQj+buPtxr2NdYyVl+vsKs2V8suBEj3OQyomUnWeiMzeymBosmBZqax
 7Cnl9tjhMPebrhzTEzMrCzBi3g3WtNNVmJenCDvix/mBGNcz97z8/JIZ5wr1c3+avF7w
 wreU/O4W2J0ZQJJeOQoQwI1AXs7kpkC21U81k9WaRMSAnPolIzMMtxhbx1fYoX3i0OMv
 7OuA==
X-Gm-Message-State: AOJu0YxkVCRhQ+7yLSh794h5mmcuVlA7jC+jvqVkzW93hWzksNYAn8q9
 9Cu8jsHsXKR26oMtHoLVUgOlmuoJX+zZxHoOJ9hUeGo9pNAPm7nXvIhbuf2f+Tc=
X-Gm-Gg: ASbGnctMNAwRcdZDXWfJNeTSMfYEXXfXC8TFnvCG0corMCsBGPTu4hUnMVM2o3yp/Ko
 eAbWU8TiwNSrnqFupcr0GtWbuBHBbVtWLo7jjI3q39ccI2NYZQWMw06eZ7nGeydMpr+SDkIo8u/
 NOenJpw0rbOuLXZk1GNqr3BJtmIGvY+eMi5u5H3F7wrS3V5kVdK+ipgJBoqaXPDy2jKtVjFe65o
 u/Yyfdw3bJoVGtprAfmt44PZn+lIBle9xLHkxqrIhpQXLZzKom8Lme7h4VoZw1IEvhGXbRf0T9G
 +3e0Svi8dulTjmDPvzvxuEtoZZhW17NZkEgE1QVFESikkP/grRJBqBH6/VkpG96cuka/aL18Ej6
 wYZfxKno=
X-Google-Smtp-Source: AGHT+IGsJK9diS2N02oMGGH5kRfBlCRgJYKzMfQVnr8uPfd9sI70gjD+GtQ9PPTp7YT7pfGi5U/z9g==
X-Received: by 2002:a05:6a20:9f8f:b0:1f1:432:f4a3 with SMTP id
 adf61e73a8af0-2046a56d06emr3907049637.23.1745676741855; 
 Sat, 26 Apr 2025 07:12:21 -0700 (PDT)
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25967aedsm4834233b3a.83.2025.04.26.07.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Apr 2025 07:12:21 -0700 (PDT)
Message-ID: <dffe288e-5d28-4d56-8584-5d0b15365b72@linaro.org>
Date: Sat, 26 Apr 2025 07:12:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH alternate 2/2] target/riscv: Fix write_misa vs aligned
 next_pc
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20250425165055.807801-1-richard.henderson@linaro.org>
 <20250425165055.807801-3-richard.henderson@linaro.org>
 <1521e92e-699d-443b-8542-439854e6764a@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <1521e92e-699d-443b-8542-439854e6764a@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 4/25/25 15:20, Daniel Henrique Barboza wrote:
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index c52c87faae..992ec8ebff 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -2111,10 +2111,13 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>>       val &= env->misa_ext_mask;
>>       /*
>> -     * Suppress 'C' if next instruction is not aligned
>> -     * TODO: this should check next_pc
>> +     * Suppress 'C' if next instruction is not aligned.
>> +     * Outside of the context of a running cpu, env->pc contains next_pc.
>> +     * Within the context of a running cpu, env->pc contains the pc of
>> +     * the csrw/csrrw instruction.  But since all such instructions are
>> +     * exactly 4 bytes, next_pc has the same alignment mod 4.
> 
> 
> By "outside of the context of a running CPU" you mean a halted CPU, correct?

Correct, e.g. from gdbstub.

> 
> And now, for a running CPU, env->pc has the pc of csrw/csrrw because of patch 1.

Correct.

> Otherwise it would contain a pc that was synchronized via the last
> synchronize_from_tb, or any other insn that happened to sync env->pc in
> the same TB via gen_update_pc(). We're not keeping env->pc up to date all
> the time because it would be extra work that wouldn't be needed most of the
> time. Am I too off the mark?

Correct.

> 
> The reason I'm asking is because I see at least one place (get_physical_address())
> where it's stated that "the env->pc at this point is incorrect".

Correct, since get_physical_address is called from riscv_cpu_tlb_fill, which can be called 
during the processing of any guest memory operation.


> And I see env->pc
> being either the current PC or the next insn PC depending on the situation.
> Reading these 2 patches clarified it a bit (assuming I'm not completely incorrect,
> of course).

I would expect env->pc to be more or less random in get_physical_address, with a bias 
toward the PC of the first instruction of the TB.

I'm not sure why get_physical_address has that comment.  The current pc isn't relevant to 
resolving a virtual address.  It only becomes relevant when there is a fault, and the pc 
is restored via unwinding along the fault path.


r~

