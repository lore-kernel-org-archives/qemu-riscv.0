Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pv0d9-00058H-D4
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 14:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv0d8-000583-JQ
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 14:58:10 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv0d4-00046N-Kj
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 14:58:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-30644c18072so1477717f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 11:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683313065; x=1685905065;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XwsOKCZcG8dxRC/FHTq259hilGllCAYBzaMsqg4bGAA=;
 b=Vwngw8ATlGqKotdkwpD9rjzqElmB0wHCJR7SLEWS3lxRPccIcWnv/E5usy5QkseALS
 Apt38GOv9VWnd3+lgjsSU10gPVHe4pcwrzvJKvRjqnaku+qA0QNufMUTfw8wHi3eL0X7
 6NETeshi8VKsRdjR3fkvmHvpDwFJEHEE3/aN5IGTtj2ueweCqxZ11ZSD7IxpKMgmoJWM
 WVTghFFx5SWkOxAEIbhL1PMIgsPGXRs/EAEqzAJvVTGmwfaNjy2+r5j8tI1Hb/ukVEOE
 43aLXHJM6YYG5e9OqvtURlLQV6UwHLy9cd1dSgfA8QI4BIZCee/HRyH9kqfH3HQhdTr7
 JeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683313065; x=1685905065;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XwsOKCZcG8dxRC/FHTq259hilGllCAYBzaMsqg4bGAA=;
 b=N1IB+2A+W5mR5uXUf9PNaJ1B2GZ0Ltmq0SyCxWxRdqFLt+o1NGqEKtU2WvwKg/6g7H
 YN5WG6nt8t33V8txztanK32RZFlv5HiR74tix94hQlyOSFELt1g9vY48o1LiOdtOWFRq
 7HgK+cdQBiMZoa0/iQyLYiQVX/C0EJGytF5jtL8LPF9ffoUFHqorcnCx/M1kVbQUnmzp
 2j/L81XSl/BFW2ZSvInZQVmripJKbUpYfBUgJjfEe2m4luVpFsZNsc9Fh1zhzMJgTyZe
 RgLXrQu6C8ppQiAcnX0vekq+TzkS3btPSyoHieRLUKz8UjhSZOnQh8e5CcpfeH+PtG9F
 h3DQ==
X-Gm-Message-State: AC+VfDwn8DvErztAxaSk+g3xB60wxAeMzNrtLIYn8kMuexMJixzWPsp2
 dC/qhWILUCuBquHZp+bIwY5D9g==
X-Google-Smtp-Source: ACHHUZ4+Xt3Ag3A/uB07vr4ecLaqBVznZ17ztP6nDataDQjXU1HIjRqhU060CAi7MlebIsQ8fPpsZQ==
X-Received: by 2002:adf:e909:0:b0:306:2c5c:980a with SMTP id
 f9-20020adfe909000000b003062c5c980amr1966953wrm.31.1683313065542; 
 Fri, 05 May 2023 11:57:45 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b00306344eaebfsm3173365wrx.28.2023.05.05.11.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 11:57:45 -0700 (PDT)
Message-ID: <45cba357-ba20-399a-27e6-5e99741179d0@linaro.org>
Date: Fri, 5 May 2023 19:57:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 03/57] accel/tcg: Introduce tlb_read_idx
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-4-richard.henderson@linaro.org>
 <CAFEAcA858-D37=MrvYnGxBVkL1V14wZ_JLEzFahbweRUDvPmwg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA858-D37=MrvYnGxBVkL1V14wZ_JLEzFahbweRUDvPmwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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
X-List-Received-Date: Fri, 05 May 2023 18:58:10 -0000

On 5/4/23 16:02, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:15, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Instead of playing with offsetof in various places, use
>> MMUAccessType to index an array.  This is easily defined
>> instead of the previous dummy padding array in the union.
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>> @@ -1802,7 +1763,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>>       if (prot & PAGE_WRITE) {
>>           tlb_addr = tlb_addr_write(tlbe);
>>           if (!tlb_hit(tlb_addr, addr)) {
>> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {
>> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_STORE,
>> +                                addr & TARGET_PAGE_MASK)) {
>>                   tlb_fill(env_cpu(env), addr, size,
>>                            MMU_DATA_STORE, mmu_idx, retaddr);
>>                   index = tlb_index(env, mmu_idx, addr);
>> @@ -1835,7 +1797,8 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>>       } else /* if (prot & PAGE_READ) */ {
>>           tlb_addr = tlbe->addr_read;

read

>>           if (!tlb_hit(tlb_addr, addr)) {
>> -            if (!VICTIM_TLB_HIT(addr_write, addr)) {

write

>> +            if (!victim_tlb_hit(env, mmu_idx, index, MMU_DATA_LOAD,
>> +                                addr & TARGET_PAGE_MASK)) {
> 
> This was previously looking at addr_write, but now we pass
> MMU_DATA_LOAD ?

This is the read portion of the read+write check.  The write portion is above in the 
previous hunk.  So this is an existing error, fixed here, and I hadn't noticed.


r~

