Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC2EEB64D9
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 00:04:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEIff-0005D1-Ik; Tue, 27 Jun 2023 20:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEIfc-0005Ce-Oz
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 20:04:28 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qEIfX-0004oF-Tc
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 20:04:26 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5658573b1faso842701eaf.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 17:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687910660; x=1690502660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3kBv7QeNj/L+noL8nO2h+0iDRT12aUSxYkAtl53jAi4=;
 b=Rnn7Eqdq4TNXlohf9uyWabF9KVzX7xWCEfwLmDajC76aVSUIRF/TOASe4PvZXJW7fg
 KkVJ4KqvgfB16pDy6Mk76WvAkHVoZCV9/uF03sBYLdT8DbCVFzlns+a251QgsatemJrT
 P6lfFlbkSz8lzTcdXvYSoJiBKkAUwZLvz1y+5HjZY+vQv/eIyGPF9cNgoPAdgPHSELup
 cT2OpQDu/VO5+6Q325rbIkZmFlNd81IXGofihCa2Esv2uMrt6kwppLYmiPDF13Yq4mJ+
 SffXIcOF5Lg+bBOT3snWGci4AgSpPlHJ9aYjR99atvfLEsUPQIqJuXs3c2Fq/D20+OTe
 NOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687910660; x=1690502660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3kBv7QeNj/L+noL8nO2h+0iDRT12aUSxYkAtl53jAi4=;
 b=MFdfxKrHMXhA5XBHgYMrtIRwsPbxbx9ic6SzngqZbE1IXQ4iQ8YyOwp/XiDcWcl7fP
 7QDY4R08h/m64SDpDGNbvJ6hoqhyG1fCa3rd1/6Ez4X9HoTQqZfqrdPr6R9p2Q+1GGi9
 ngcSh42fiHZat+PU/ExeTRFYup88z0ikBxoNi8pQ5WP3EwnDNRDdnOPMj2UdK8dUSyFN
 owv6IUwJKi4RdE3BmeB7yxMgWtiim2UGW2ITm7Pjw5+hXUNgYRQKoeQ3TD86EVwP6xlo
 6wK8zvlulUcffVLGGZb0WbS1Cnm2xBfYpvjcqilL7XRvCc0daCqQ2z8n1gtz1KNKVaFQ
 81kw==
X-Gm-Message-State: AC+VfDx4JFENSt6SfKT08ZxrMc4bLM72zb3MYvOukL4DUcX4xOjs39H5
 iisXDTY2PoA6SYF0itGJ53mxug==
X-Google-Smtp-Source: ACHHUZ5iOHPTCivLVlkJ/bgUpxCWdrlEjYkCfHieo9GOdMK/KFLL4VRj4mS2g4DdbJI4CT2YpWbELA==
X-Received: by 2002:a4a:e8db:0:b0:565:84b0:845d with SMTP id
 h27-20020a4ae8db000000b0056584b0845dmr2586101ooe.6.1687910660313; 
 Tue, 27 Jun 2023 17:04:20 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 f14-20020a4ada4e000000b00558c88d131asm1751798oou.36.2023.06.27.17.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 17:04:20 -0700 (PDT)
Message-ID: <997135f3-f9a3-7974-118c-48e8fb1e04d2@ventanamicro.com>
Date: Tue, 27 Jun 2023 21:04:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 11/19] target/riscv/cpu: add misa_ext_info_arr[]
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com
References: <20230627163203.49422-1-dbarboza@ventanamicro.com>
 <20230627163203.49422-12-dbarboza@ventanamicro.com>
 <e217dfb9-a4c2-12e3-6053-ef2167f30a05@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <e217dfb9-a4c2-12e3-6053-ef2167f30a05@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.103,
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



On 6/27/23 18:29, Philippe Mathieu-Daudé wrote:
> On 27/6/23 18:31, Daniel Henrique Barboza wrote:
>> Next patch will add KVM specific user properties for both MISA and
>> multi-letter extensions. For MISA extensions we want to make use of what
>> is already available in misa_ext_cfgs[] to avoid code repetition.
>>
>> misa_ext_info_arr[] array will hold name and description for each MISA
>> extension that misa_ext_cfgs[] is declaring. We'll then use this new
>> array in KVM code to avoid duplicating strings.
>>
>> There's nothing holding us back from doing the same with multi-letter
>> extensions. For now doing just with MISA extensions is enough.
>>
>> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 60 ++++++++++++++++++++++++++--------------------
>>   target/riscv/cpu.h | 11 ++++++++-
>>   2 files changed, 44 insertions(+), 27 deletions(-)
> 
> 
>> +const MISAExtInfo misa_ext_info_arr[] = {
>> +    [RVA] = {"a", "Atomic instructions"},
>> +    [RVC] = {"c", "Compressed instructions"},
>> +    [RVD] = {"d", "Double-precision float point"},
>> +    [RVF] = {"f", "Single-precision float point"},
>> +    [RVI] = {"i", "Base integer instruction set"},
>> +    [RVE] = {"e", "Base integer instruction set (embedded)"},
>> +    [RVM] = {"m", "Integer multiplication and division"},
>> +    [RVS] = {"s", "Supervisor-level instructions"},
>> +    [RVU] = {"u", "User-level instructions"},
>> +    [RVH] = {"h", "Hypervisor"},
>> +    [RVJ] = {"x-j", "Dynamic translated languages"},
>> +    [RVV] = {"v", "Vector operations"},
>> +    [RVG] = {"g", "General purpose (IMAFD_Zicsr_Zifencei)"},
>> +};
> 
> Personally I prefer using a getter() helper because we can check in
> a single place for empty entries in the array.
> 
> IIUC this 13-entries array takes 4MiB (RVV is '1<<21' = 2MiB).
> 
> Wouldn't it be clever to index by [a-z]? Except "x-j"...


Well .. RVA is 1<<0, RVC is 1<<2, up to RVV 1<<21. I guess this array can
be indexed at zero, and then we create a getter() that retrieves the element
we want using ctz32() to find the right index. Something in the likes of:

MISAExtInfo *get_misa_ext_info(uint32_t bit)
{
     return &misa_ext_info_arr[ctz32(bit)];
}

And now, since we're using a getter, we don't need to export the whole array
anymore.

I'll see how it plays out. Thanks,


Daniel

> 
> 

