Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piQQS-0003rZ-M0
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 21:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQQR-0003rD-AC
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:53:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQQP-0002UI-HK
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:53:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id l14so15926975pfc.11
 for <qemu-riscv@nongnu.org>; Fri, 31 Mar 2023 18:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680313980;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QLAZFwHlh5SwcxAOt8Y1UUV+ilqnV5kP7DPC34kMca0=;
 b=UPt1TOBzWnMpWfQa0RzQjzlMki5DaZecZV2I/6gbE2W25NyYLVBK8WurKentGi3/Oi
 GA1zn4+bwkX72MCzXD1soSdP1ZwMzBzQcbbqNNJz+tX41pmv+dSSmuJAMAp6Ib5hHCZ/
 zkl0fQODRSmQl/3MI+/Bu0Xnn7RRzoTp0XEY/p+65ceStYIfHlQON0BGjgCJB9914PF+
 7rV1uGATBCg6RO4GqTJkerTGpLDQ6chPPuP3f5hOWZmNuubDN2pujKXulvxelTXB45hu
 usHmtrl8kQ52bm8Gt7+4NQhRrXUsPZ7hv0VCzmUFIbgJj+vJljKGxtU8Bq1JOqz3zLP4
 19jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680313980;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QLAZFwHlh5SwcxAOt8Y1UUV+ilqnV5kP7DPC34kMca0=;
 b=iKIc7S8B1DpsTT28jdFC39/amOITw+G3Rd6hy3h4NtzQ8Hp0WUadrp/lrq+xKyD1H2
 Ru3GKs+1Wm2+hHVfH487/R0jTrUNoUu+Hxvkn1L8XsWYMKPcakUtsJaFBiuBh7hdCeT3
 Z/vd+RF3aDurzwnLFk/6T/Wl/POdQ1SyIfQUxX2keBFpOLEqCU03f3xsAgd0ByGZsS6B
 4tTA0IuLw1spdYcxs0vR1cLByOwvgTgCHcR4nmtFbr99ezZhT7N4Weq2QRNtRbZhnCcA
 Arzv4qKfGoP8WoxxvRL8L7com9E7ERjwxcx4G5BOoUuPcKZBCmg+5XXWv9D5jCIMP4X0
 rZmw==
X-Gm-Message-State: AAQBX9ekYJJdFOqj1v/ow9Y+QXc5wNzsiL+Xxp2iPq/HPQIXGzw5uZbo
 OqDSvfMIJGCThOadI1Q2rDwJRg==
X-Google-Smtp-Source: AKy350Y4zxm8euY4TBv6venx3QHOT7nONciAImJXeQOJMdtxL0hk4F3IPjGDk9Og9pU7mQKF6iLMTQ==
X-Received: by 2002:a62:1b85:0:b0:627:ecd4:84a5 with SMTP id
 b127-20020a621b85000000b00627ecd484a5mr26631804pfb.14.1680313979891; 
 Fri, 31 Mar 2023 18:52:59 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a635752000000b0050301745a5dsm2155728pgm.50.2023.03.31.18.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:52:59 -0700 (PDT)
Message-ID: <a669c6d9-98c6-5ad6-df56-319b12229eb6@linaro.org>
Date: Fri, 31 Mar 2023 18:52:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 6/8] accel/tcg: Fix tb mis-matched problem when
 CF_PCREL is enabled
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-7-liweiwei@iscas.ac.cn>
 <3cf2469f-fd47-544d-1343-663a5e6c5b8d@linaro.org>
In-Reply-To: <3cf2469f-fd47-544d-1343-663a5e6c5b8d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 01 Apr 2023 01:53:03 -0000

On 3/31/23 18:26, Richard Henderson wrote:
> On 3/31/23 08:06, Weiwei Li wrote:
>> A corner case is triggered  when tb block with first_pc = 0x80000008
>> and first_pc = 0x800000200 has the same jump cache hash, and share
>> the same tb entry with the same tb information except PC.
>> The executed sequence is as follows:
>> tb(0x80000008) -> tb(0x80000008)-> tb(0x800000200) -> tb(0x80000008)
>>
>> 1. At the first time tb for 0x80000008 is loaded, tb in jmp_cache is
>> filled, however pc is not updated.
>> 2. At the second time tb for 0x80000008 is looked up in tb_lookup(),
>> pc in jmp cache is set to 0x80000008.
>> 3. when tb for 0x800000200 is loaded, tb for jmp cache is updated to
>> this block, however pc is not updated, and remains to be 0x80000008.
>> 4. Finally at the last time tb for 0x80000008 is looked up, tb for
>> 0x800000200 is mismatched.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   accel/tcg/cpu-exec.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index c815f2dbfd..faff413f42 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -983,6 +983,9 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
>>                   h = tb_jmp_cache_hash_func(pc);
>>                   /* Use the pc value already stored in tb->pc. */
>>                   qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
>> +                if (cflags & CF_PCREL) {
>> +                    qatomic_set(&cpu->tb_jmp_cache->array[h].pc, pc);
>> +                }
> 
> Good catch on the bug, but incorrect fix.  Need
> 
> if (cflags & CF_PCREL) {
>      qatomic_set(&cpu->tb_jmp_cache->array[h].pc, pc);
>      qatomic_store_release(&cpu->tb_jmp_cache->array[h].tb, tb);
> } else {
>      /* Use the pc value already stored in tb->pc. */
>      qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
> }

Queuing the fix to tcg-next.

r~

