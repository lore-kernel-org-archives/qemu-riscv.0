Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pofcL-0006YK-IZ
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 03:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pofcJ-0006Xq-EI
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 03:19:07 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pofcG-0002Lh-OR
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 03:19:07 -0400
Received: by mail-ej1-x630.google.com with SMTP id q23so61179290ejz.3
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 00:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681802342; x=1684394342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dDUnzshs4UVOybq5HFDQ/f4wFNNatkoiaYrpiEF1snM=;
 b=KLJ509c5NypapLEY8L253Q8llL35uzFXVrVDV8q1VQd/5pXvJSXIlyi0F16JOLD6ac
 Tn+BT+d4iXgDHiSeEN3n8mUI4+FsaF/5alAitm7YwVn/aR+3LsEQz2DZzbmA1w8QPmvL
 92K1NE5O0jwECzwKj0opz9g/piGpIgN8sGCl72VZapyG0jKHoglTwJZ47ZQLyKGPuFL0
 6i2ijCWoRKNsPLHnxQbBOetaM7S3QeXUFgr5Mmh+wWyLZu+Kx931Dw5rnZsi/ykIzrgx
 Ux7QX30VjoihqzuBELUU04ZkamHDx7Gsxp9J9SW7U4nya9xlrQH1syx/GpszrtqakA+q
 c1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681802342; x=1684394342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dDUnzshs4UVOybq5HFDQ/f4wFNNatkoiaYrpiEF1snM=;
 b=HbagYuoQoouI8y+CnDbtVWJfTKSOsDkBw1D2/O8GD/473yZfVL/XVsKAveEwHl7iJg
 mfarU0VwD+zfqzbkyJTPauK4rbMatsir1FDVz/3v6xjLzfYiQ/k8kQfK/4AY2xGZgXHr
 ZwhXY89BKb2Kcmmjb5cRDQun35aMVWMgFcD2CaGUi1QLXfQ6ONTIgWqPUFnxTLP28FZB
 3kayq1yeOjMUZbou+DEzvBU6BVxtRME+UJ26tcfB/G744TmDJkC0WIHwo6HmAd0sNB/M
 I4E4j3CnutqxBgsMipBHFEcwJcdrAZsdgMD9sOj2nJ6k0mFJZN6Wo1ruWzyh5TWm8NEF
 C2KA==
X-Gm-Message-State: AAQBX9feKDNftbNi9fgmY1ji2heJBeARE/TdgUfHCVnQFliexAhp1ekT
 d57PVr/7ICHnvDvpYAurFcXHqQ==
X-Google-Smtp-Source: AKy350b7QivJiDP7/PTv0AE2MxImHTmZEJV4WMB4rJnvVV121R5IYF9qpvHTaH6VWjm2UkMrD0FIlg==
X-Received: by 2002:a17:907:d01:b0:94f:1ce7:1864 with SMTP id
 gn1-20020a1709070d0100b0094f1ce71864mr10015726ejc.38.1681802342306; 
 Tue, 18 Apr 2023 00:19:02 -0700 (PDT)
Received: from [192.168.58.227] ([91.223.100.53])
 by smtp.gmail.com with ESMTPSA id
 mj1-20020a170906af8100b0094e4684e5c0sm7637549ejb.25.2023.04.18.00.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 00:19:01 -0700 (PDT)
Message-ID: <e2288c5f-b4a1-9105-6c2e-60e51decd91d@linaro.org>
Date: Tue, 18 Apr 2023 09:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 6/6] accel/tcg: Remain TLB_INVALID_MASK in the address
 when TLB is re-filled
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-7-liweiwei@iscas.ac.cn>
 <a256a5fd-e408-74a3-5476-694d216e08d8@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a256a5fd-e408-74a3-5476-694d216e08d8@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.284,
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
X-List-Received-Date: Tue, 18 Apr 2023 07:19:07 -0000

On 4/17/23 18:25, Daniel Henrique Barboza wrote:
> 
> 
> On 4/13/23 06:01, Weiwei Li wrote:
>> When PMP entry overlap part of the page, we'll set the tlb_size to 1, and
>> this will make the address set with TLB_INVALID_MASK to make the page
>> un-cached. However, if we clear TLB_INVALID_MASK when TLB is re-filled, then
>> the TLB host address will be cached, and the following instructions can use
>> this host address directly which may lead to the bypass of PMP related check.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
> 
> For this commit I believe it's worth mentioning that it's partially reverting
> commit c3c8bf579b431b6b ("accel/tcg: Suppress auto-invalidate in
> probe_access_internal") that was made to handle a particularity/quirk that was
> present in s390x code.
> 
> At first glance this patch seems benign but we must make sure that no other
> assumptions were made with this particular change in probe_access_internal().
> 
> 
> Thanks,
> 
> Daniel
> 
>>   accel/tcg/cputlb.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index e984a98dc4..d0bf996405 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -1563,13 +1563,6 @@ static int probe_access_internal(CPUArchState *env, target_ulong 
>> addr,
>>               /* TLB resize via tlb_fill may have moved the entry.  */
>>               index = tlb_index(env, mmu_idx, addr);
>>               entry = tlb_entry(env, mmu_idx, addr);
>> -
>> -            /*
>> -             * With PAGE_WRITE_INV, we set TLB_INVALID_MASK immediately,
>> -             * to force the next access through tlb_fill.  We've just
>> -             * called tlb_fill, so we know that this entry *is* valid.
>> -             */
>> -            flags &= ~TLB_INVALID_MASK;


I missed the original patch, but this is definitely wrong.

Clearing this bit locally (!) is correct because we want to inform the caller of 
probe_access_* that the access is valid.  We know that it is valid because we have just 
queried tlb_fill (and thus for riscv, PMP).

Clearing the bit locally does *not* cause the tlb entry to be cached -- the INVALID bit is 
still set within the tlb entry.  The next access will again go through tlb_fill.

What is the original problem you are seeing?  The commit message does not say.


r~

