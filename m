Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pTJWF-00059Z-Eu
	for mharc-qemu-riscv@gnu.org; Sat, 18 Feb 2023 04:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pTJWD-000581-I7
 for qemu-riscv@nongnu.org; Sat, 18 Feb 2023 04:28:33 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pTJWB-0008B8-Vy
 for qemu-riscv@nongnu.org; Sat, 18 Feb 2023 04:28:33 -0500
Received: by mail-oi1-x22c.google.com with SMTP id bd2so552726oib.1
 for <qemu-riscv@nongnu.org>; Sat, 18 Feb 2023 01:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DIa8j9bz6MRNdmbdMkc/Z+jMkMfQQHhLjS3nelQIF7M=;
 b=lP/1PNhiDtq813i/IcGjXpCCm8QeC6YrijxkmI1c+uvRainnxEoJGzSvA2xmhvkd+S
 MSr4NOxNl/19o1qBL5mQnsf43JGA/V18VlXOlILGGUFMBD02FcGFEQ75XOPb4QXzV8Wh
 4gW3cNuVbJy3hgUqM5x2Zkfl9XbMZKYuEk/L+bvQq60AThVGG4Q0QpRB6e0RKwCKTpeX
 Vh0Cr5CPGj1MXipmtNNOEVpjioB2fwWTUPlMEIkByhFiXzxjj89gFm1M07NawbRTMepn
 TVZZnrH+wnRrW8qKPmLddEgE1mL6829tyagN91cMnuEOdx2etVAe1OXgUvYU3MXr+XSG
 gU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DIa8j9bz6MRNdmbdMkc/Z+jMkMfQQHhLjS3nelQIF7M=;
 b=VRxKFWSOclGE/m06e04mAUDmRL7PBAUXO3tbnKHodkBEE3iqzPIKSZRIJXzA9gRcns
 YpYbSQNXvYsplEx0DjauvL3uFE+CQwX7sZ4inwBtsaC7/Z9m8shtmHj9QQruVmT3jiXF
 gAdjWfUk0ffLPmPT/mb3Xv3QF5md/AI3SSnZ1+bdbnod1d49PNKzsmq6KjOLCt6WmXlv
 cXl16LewIKb5GPWtULMnh2vF3m5LoGdUESEWt5UQYbf6gBXax/LJgBc2DA+b4T91iVht
 IOgKAzrU7qDH0q991Y6ufPKvcEuVcrtJzOtaMaKR5aaGB9jktVfan81PSUP7BdRZtekr
 dBtg==
X-Gm-Message-State: AO0yUKW2AdB5V8JMwuw5mLqN/z3NMtVrYfyCacxRWYEWwqTBwU8JXKzs
 loUo2d+CcCDOyZrD4mKbON5Eag==
X-Google-Smtp-Source: AK7set+JCV+WmOq79Tby0tqxww+SGWjOxpzsEQIEMRWO0U8adpgpdsZwehZusOgOUdpb1I9MhYw4/A==
X-Received: by 2002:aca:1110:0:b0:37f:ae54:155a with SMTP id
 16-20020aca1110000000b0037fae54155amr2271640oir.32.1676712510255; 
 Sat, 18 Feb 2023 01:28:30 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 b132-20020aca348a000000b0037b6f5d6309sm2812811oia.2.2023.02.18.01.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Feb 2023 01:28:29 -0800 (PST)
Message-ID: <d468f8c6-f8ec-6d40-44ab-3e76df458680@ventanamicro.com>
Date: Sat, 18 Feb 2023 06:28:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v6 2/4] target/riscv: implement Zicboz extension
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230217203445.51077-1-dbarboza@ventanamicro.com>
 <20230217203445.51077-3-dbarboza@ventanamicro.com>
 <20408b85-2ad0-4cbc-4ccd-c512ba15ba06@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20408b85-2ad0-4cbc-4ccd-c512ba15ba06@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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
X-List-Received-Date: Sat, 18 Feb 2023 09:28:33 -0000



On 2/18/23 00:44, Richard Henderson wrote:
> On 2/17/23 10:34, Daniel Henrique Barboza wrote:
>> +void helper_cbo_zero(CPURISCVState *env, target_ulong address)
>> +{
>> +    RISCVCPU *cpu = env_archcpu(env);
>> +    uintptr_t ra = GETPC();
>> +    uint16_t cbozlen;
>> +    void *mem;
>> +
>> +    check_zicbo_envcfg(env, MENVCFG_CBZE, ra);
>> +
>> +    /* Get the size of the cache block for zero instructions. */
>> +    cbozlen = cpu->cfg.cboz_blocksize;
>> +
>> +    /* Mask off low-bits to align-down to the cache-block. */
>> +    address &= ~(cbozlen - 1);
>> +
>> +    mem = tlb_vaddr_to_host(env, address, MMU_DATA_STORE,
>> +                            cpu_mmu_index(env, false));
>> +
>> +    if (likely(mem)) {
>> +        /* Zero the block */
>> +        memset(mem, 0, cbozlen);
>> +    }
>> +}
> 
> Not correct.  This fails to zero the block at all under a number of conditions.

Ops. The 'else' conditional in which we would zero the mem in case it's an I/O
region got lost in the middle of rebasing it seems ....

By the way, looking at the lack of any probing in this particular function and at
the probe_writes() that ARM does, I read the spec again. A paragraph in 2.5.2
says:

"A cache-block zero instruction is permitted to access the specified cache block whenever
a store instruction is permitted to access the corresponding physical addresses and when
the PMAs indicate that cache-block zero instructions are a supported access type. If access
to the cache block is not permitted, a cache-block zero instruction raises a store page fault
or store guest-page fault exception if address translation does not permit write access or
raises a store access fault exception otherwise. During address translation, the instruction
also checks the accessed and dirty bits and may either raise an exception or set the bits as
required."

PMA (Physical Memory Access) doesn't seem to be implemented in RISC-V, or at the very least
it's not using the PMA acronym, so let's skip that for now. I'll add a comment mentioning
it in the code mentioning that PMA for I/O should be checked and we're not doing it.

But PMA aside, we have wording and conditionals that resembles the cache-block management
permissions and so on, with the exception that we're not caring about LOAD access this time
around. So I guess we'll also need here something like what check_zicbom_access() is doing
in the next patch.


Thanks,

Daniel



> Please have a closer look at the feedback on v5.
> 
> 
> r~

