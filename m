Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0494EB64DC
	for <qemu-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 22:39:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDYNj-0001rr-Kf; Sun, 25 Jun 2023 18:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDYNh-0001r5-V4
 for qemu-riscv@nongnu.org; Sun, 25 Jun 2023 18:38:53 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qDYNg-0004u1-4x
 for qemu-riscv@nongnu.org; Sun, 25 Jun 2023 18:38:53 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b5d57d7db9so2067335a34.3
 for <qemu-riscv@nongnu.org>; Sun, 25 Jun 2023 15:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687732730; x=1690324730;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ISS/smCVifo+a+uKKirROqpR45erzvjLcgWv+GzlXpU=;
 b=bV93JcBBSJL3vrmAgaYilj/2j+dyEDJUzZ6vNrNzjuimGHH5hTA5pT1aLSdtNjSNsJ
 0csLbzSuVwvkTjNY7in8fDLwevh+4SXcOxkK307k+RWgVZMkvCNXW+tp7d/cisoafWOE
 80IS37KW2FiJw0JWBvz8BIzmqGqMIVNRiArMPz6+w8FlpbcHhiI2O4Imak8LzC5qTNGf
 qGFGnWN1fxRzEa4aYYYC2lW4LskqEN2tgTyvol0b3e16Gex9I1KiZHBFxFJaP0I1ejVE
 YZRfoqHjqRf0ct+aSVwoFFUgteYlqh9mlc1dmwLl0QY1NGoBaplTYNwKMXnILhtKbBJL
 fHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687732730; x=1690324730;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ISS/smCVifo+a+uKKirROqpR45erzvjLcgWv+GzlXpU=;
 b=csxcB+sgLSWClO6DG40qExZXhKQIpawzVJwfrl3tJtJ44iil1N2go+biS404lPsAkv
 fgyPnPAPcOPY0oKaQiimBY3f+JX0YfbeXGh3MTfe3spFwGaDVp7OVavA9VV0S9aTsehD
 Uf9VE39byCCX719Xjh9IR2PEvd5hXOWvS09qDkykB73ADv6vJ6hlbryjPK9xhPPGA2aM
 wEZ8MRJ0rQlJHQHqsTQkeEM8GsQu6asQL0eSpU9yDDYgUYl45g6UjaWTah9u7dgYRbiN
 3VCaMMKInVLs32g46+a4v5HRxdhPkbcLt7bUhue/KL3/r2N4F3iBHoJAXgcrQUCmqUsq
 2V1w==
X-Gm-Message-State: AC+VfDz91Yi2mw6psrCSehatMz6VPQKGkKEfJMLQfLfxLdRQ/qZRfFga
 2xCtmrt57+/x2W+KF5JmBnL81w==
X-Google-Smtp-Source: ACHHUZ5Zt8Z7XfsAdPSl3iIA6X7hb7MlinhfEEJlzWZKSJUg2oPbEJNL6HRGvbk29mUOx2SZRCl1Yw==
X-Received: by 2002:a9d:4b02:0:b0:6b7:1ae8:432e with SMTP id
 q2-20020a9d4b02000000b006b71ae8432emr8318813otf.13.1687732730378; 
 Sun, 25 Jun 2023 15:38:50 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 w19-20020a9d6393000000b006b74a5a2712sm496403otk.15.2023.06.25.15.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 15:38:50 -0700 (PDT)
Message-ID: <19bcdc7d-9061-ae6a-1745-560b2b6e135b@ventanamicro.com>
Date: Sun, 25 Jun 2023 19:38:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 12/19] target/riscv: add KVM specific MISA properties
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230622135700.105383-1-dbarboza@ventanamicro.com>
 <20230622135700.105383-13-dbarboza@ventanamicro.com>
 <20230623-df5c527b7dae3e28123be577@orel>
 <6da71298-8345-f0b1-b086-830425db6ec5@ventanamicro.com>
 <20230624-bd82bafb08e5daa8fb81b72f@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230624-bd82bafb08e5daa8fb81b72f@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 6/24/23 04:32, Andrew Jones wrote:
> On Fri, Jun 23, 2023 at 11:14:45AM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 6/23/23 06:38, Andrew Jones wrote:
>>> On Thu, Jun 22, 2023 at 10:56:53AM -0300, Daniel Henrique Barboza wrote:
>>> ...
>>>> +#define KVM_MISA_CFG(_bit, _reg_id) \
>>>> +    {.offset = _bit, .kvm_reg_id = _reg_id}
>>>> +
>>>> +/* KVM ISA extensions */
>>>> +static KVMCPUConfig kvm_misa_ext_cfgs[] = {
>>>> +    KVM_MISA_CFG(RVA, KVM_RISCV_ISA_EXT_A),
>>>> +    KVM_MISA_CFG(RVC, KVM_RISCV_ISA_EXT_C),
>>>> +    KVM_MISA_CFG(RVD, KVM_RISCV_ISA_EXT_D),
>>>> +    KVM_MISA_CFG(RVF, KVM_RISCV_ISA_EXT_F),
>>>> +    KVM_MISA_CFG(RVH, KVM_RISCV_ISA_EXT_H),
>>>> +    KVM_MISA_CFG(RVI, KVM_RISCV_ISA_EXT_I),
>>>> +    KVM_MISA_CFG(RVM, KVM_RISCV_ISA_EXT_M),
>>>> +};
>>>> +
>>> ...
>>>> +static void kvm_riscv_add_cpu_user_properties(Object *cpu_obj)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < ARRAY_SIZE(kvm_misa_ext_cfgs); i++) {
>>>> +        KVMCPUConfig *misa_cfg = &kvm_misa_ext_cfgs[i];
>>>> +        int bit = misa_cfg->offset;
>>>> +
>>>> +        misa_cfg->name = misa_ext_info_arr[bit].name;
>>>> +        misa_cfg->description = misa_ext_info_arr[bit].description;
>>>
>>> I'd prefer these be set by KVM_MISA_CFG(), since we can. No need to wait
>>> until runtime if we can do it at compile-time.
>>
>> The compiler will complain about "error: initializer element is not constant" and
>> the build will fail. This happens because, apparently, the compiler doesn't see the
>> imported array as a constant, regardless of the 'const' type.
>>
> 
> You're right. Initialization the way I suggested only works when
> everything is in the same source file. That's a pity. So we can
> either manage it they way you've done here or the way you did
> in a previous patch, which was to include the info array in each
> source file by putting it in the header. I think I prefer the
> approach you used in this version more though.

Alright, let's keep this version then.

Btw I just noticed that I kept your reviewed-by from the previous version in
this patch by accident. Can you please send a r-b for this version (in case
you agree, of course)?


Thanks,

Daniel

> 
> Thanks,
> drew

