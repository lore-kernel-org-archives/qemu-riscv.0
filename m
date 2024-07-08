Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88C1C3271E
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 13:43:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sQodh-00024D-Jm; Mon, 08 Jul 2024 09:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sQode-0001uu-H7
 for qemu-riscv@nongnu.org; Mon, 08 Jul 2024 09:42:42 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sQodc-0007WV-TL
 for qemu-riscv@nongnu.org; Mon, 08 Jul 2024 09:42:42 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42122ac2f38so23971325e9.1
 for <qemu-riscv@nongnu.org>; Mon, 08 Jul 2024 06:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720446159; x=1721050959; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=plam+MFcmfxD2GSE9v6KPzLMJ0N7tVOJ5S4D8FS3to8=;
 b=ed9fy9ampgBfjpwv3hoTuVWDVPbMqSA950XyhPjVbO7fHOu9ehoCvBX8PM/KFbZ0g6
 VPLUmo3UBTNQjtcIFm8F9tmGy+Uvt5cNZTUkSLFlzIlESSB7Txno0Y7T2YC++xkDayz0
 +cFqkJALjD8uH5X3AUWdFPfZisn7I4nnQaPMaZWZxj06gpvalZiPrMBbQR9hTci1uN04
 T9MbfXnbT4a9JXoel1HwhEnCSWpnV7tcbK9/cQ8GHSBPfGj5AlMKGrOmGB7eeV1c5HlR
 ka2TPgUGe12YQFdywiBA4Ubh9H+vedfsCL9f2fPl5H8/OTC0mNFu9ppERnTGAnE5UutF
 fo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720446159; x=1721050959;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=plam+MFcmfxD2GSE9v6KPzLMJ0N7tVOJ5S4D8FS3to8=;
 b=vsGz3omsB4YljZYZXBkFpilGZSQsfEnjKYxv/9UZuO6+OdkqPYiTjRzo3anDaIrPsH
 ObpFTjv8H5+Gk9wy+Lj65Xr5LDpqfynWfxtUXXidD8eFmXddc8nY9M6QFJVhHKDApqQS
 3vEKxDR+Ba77Xy4YxdtIYVMkA3l/zOgxMA6GsVQ4k0ISgIATKAAtNJ7LXSEItRgYhv3K
 U6uidr+CGDB4GLDlBACPKtaYKr94im0ev4i2cbAsQvqwPeQDVrzgy5FxjQQSGJvXvSP0
 RTf+7GiGZjg1oHuStuDnxtmVx3Uotwf3TCxe28ys4RGDQOo6ydGnjuv5SmhnBjGubVMB
 j1UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF7Jzsss7ZMWP7/De4Gx5xLPMojOMovFCoGIAM97J94TcVdBH+UWH7ogvPBeBZK1Hja5Cem1HrdE47TrkGgQpbYgGthiI=
X-Gm-Message-State: AOJu0YwDGXLg3h807AJantpS3vWSzIK8Tr4XhLS8Sc6lkiAtpQYG5wqr
 CxvbqWckWYGHEeq5v/VtwMh5Kqlvr3MP+f0C8b1lC9JzfFCUqunDd8GS2bmiWmE=
X-Google-Smtp-Source: AGHT+IFGKN6JMJSXEBRL2fkDlXZcMt9qQRBsfFoiDK8ValkWdZG1THxZRGnP1WypReeCHB+MpOcAgw==
X-Received: by 2002:a05:600c:4586:b0:426:6f0e:8ba4 with SMTP id
 5b1f17b1804b1-4266f0e8d4bmr3917575e9.8.1720446158849; 
 Mon, 08 Jul 2024 06:42:38 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.169.151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a21cbc6sm167592875e9.24.2024.07.08.06.42.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 06:42:38 -0700 (PDT)
Message-ID: <b94c987e-835a-490f-a4d4-72f87db7f7b1@linaro.org>
Date: Mon, 8 Jul 2024 15:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/riscv: Add support for machine specific pmu's
 events
To: Aleksei Filippov <alexei.filippov@syntacore.com>,
 Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, liwei1518@gmail.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20240625144643.34733-1-alexei.filippov@syntacore.com>
 <2cb94b34-1a5f-4dc9-bec4-78c7008cd79d@linaro.org>
 <a019a09d-9549-4fa9-8b30-befb4df96fc0@syntacore.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <a019a09d-9549-4fa9-8b30-befb4df96fc0@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Hi Aleksei,

On 8/7/24 11:46, Aleksei Filippov wrote:
> On 25.06.2024 21:18, Richard Henderson wrote:
>> On 6/25/24 07:46, Alexei Filippov wrote:
>>> Was added call backs for machine specific pmu events.
>>> Simplify monitor functions by adding new hash table, which going to map
>>> counter number and event index.
>>> Was added read/write callbacks which going to simplify support for 
>>> events,
>>> which expected to have different behavior.
>>>
>>> Signed-off-by: Alexei Filippov <alexei.filippov@syntacore.com>
>>> ---
>>> Changes since v2:
>>>         -rebased to latest master
>>>   target/riscv/cpu.h |   9 +++
>>>   target/riscv/csr.c |  43 +++++++++-----
>>>   target/riscv/pmu.c | 139 ++++++++++++++++++++++-----------------------
>>>   target/riscv/pmu.h |  11 ++--
>>>   4 files changed, 115 insertions(+), 87 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> index 6fe0d712b4..fbf82b050b 100644
>>> --- a/target/riscv/cpu.h
>>> +++ b/target/riscv/cpu.h
>>> @@ -374,6 +374,13 @@ struct CPUArchState {
>>>       uint64_t (*rdtime_fn)(void *);
>>>       void *rdtime_fn_arg;
>>> +    /*machine specific pmu callback */
>>> +    void (*pmu_ctr_write)(PMUCTRState *counter, uint32_t event_idx,
>>> +                          target_ulong val, bool high_half);
>>> +    target_ulong (*pmu_ctr_read)(PMUCTRState *counter, uint32_t 
>>> event_idx,
>>> +                                 bool high_half);
>>> +    bool (*pmu_vendor_support)(uint32_t event_idx);
>>
>> Do these really belong in CPUArchState, rather than RISCVCPUClass?
>>
>> Surely there's more to this series, since these fields are never set...
>>
>>
>> r~
> 
> Initially this callbacks was added to CPUArchState just to be along with 
> similar implementation with rdtime_fn*.
> 
> Yes, you're right, there are more series to this, but, it can't be 
> separated from syntacore specific parts, which is unfortunately not 
> ready yet to be published. So, I can prepare second patch to implement 
> PMU subsystem for virt device. What do you think about it? (I'll send it 
> in the few days).

How can we test your patch meanwhile?

Thanks,

Phil.


