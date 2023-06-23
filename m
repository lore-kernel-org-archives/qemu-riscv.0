Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DFEEB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 14:28:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qChlk-00023n-OD; Fri, 23 Jun 2023 10:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qChlj-00021M-MA
 for qemu-riscv@nongnu.org; Fri, 23 Jun 2023 10:28:11 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qChlh-0001YV-UF
 for qemu-riscv@nongnu.org; Fri, 23 Jun 2023 10:28:11 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1a9b0ec6f4cso541772fac.0
 for <qemu-riscv@nongnu.org>; Fri, 23 Jun 2023 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687530488; x=1690122488;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JnPZcrq7lfsRPS/lp4cOqBOioMOgDIDT5mcdEZlVQPY=;
 b=chxoLgXV5ynhZnSsovHBJtZQJNjhV7mmvpZAwI6YWP28xgEHT1LRcTmKjNnbMxqmKM
 yciAAJrvY8eIB+DTI1O6cyXIZqT+xQjG0SIv5OZJXVEvQQcYJiaROQc6RRjdmmjKlMcb
 OokJdAse2rh7lmssSpLUDvhce/lpq6+PA8Aqn9R2hLFYAxOUx1p1ByEOoGG3TJup/SVp
 rIRUEtiwcK4ef/eZkLRyyZnHmr0u/aPFpni5COhkZA6zNC8qHEy2JMElubaEF4CUid8i
 cSjVMgH8KbO/tYrnK4TwaDC5lWEBI1TJoAKAoN6giRzC46fq+4kVvs6Qi3fhs3DYh4BF
 qGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687530488; x=1690122488;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JnPZcrq7lfsRPS/lp4cOqBOioMOgDIDT5mcdEZlVQPY=;
 b=cSAHLoKxBDtWpBxMJ3pYalcomeiF1LXD51/jcdLb97+ljghb2TkiLqwvbiPDZMGTly
 7KCJ5wnTrfb0VuOS4BBwRWV01B5kZXKl0Q+t8yK0jRR1tL55HQVbHJjglrWl5R3pUPIA
 kTPHyue5QgiNQzFxfUIy34w/bHJChnlRgn1gu37gLDvul3UNinCcyyjNTf2p0JiLPbp3
 mXlZAFEINSn8/f/iTjIQG+7l+kb6FtgiYIkMJVwgRevjkON4JWaTgxhZx6rJMPzvlZHZ
 dTbp6P5nuHwg/QDf8gniC80Fg7WYNmxe8PlIieOEGHrudfufnz0jjMAO4ryFIXsKSH6P
 o8QA==
X-Gm-Message-State: AC+VfDw4RXEJHZkSoz5WdfCMtWde7LLRyAsxXw/fVMk8dQKpvk//ksMU
 iPvBcze8+qdRSyjH+aNWKJpiLw==
X-Google-Smtp-Source: ACHHUZ73wrs9TYlh835Xbdgb9RP3g2640jTmY9Mu78FtZOteeAC2mfMSFViM52cN0jl3YzHWnOr3Sg==
X-Received: by 2002:a05:6870:d412:b0:1a6:cba1:7cce with SMTP id
 i18-20020a056870d41200b001a6cba17ccemr13506130oag.32.1687530488423; 
 Fri, 23 Jun 2023 07:28:08 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 j2-20020a4ac542000000b0055e0e084fb6sm3680842ooq.12.2023.06.23.07.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 07:28:08 -0700 (PDT)
Message-ID: <c1056ba9-4418-d6ce-536b-93155fff84a2@ventanamicro.com>
Date: Fri, 23 Jun 2023 11:28:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 16/19] target/riscv/cpu.c: create KVM mock properties
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230622135700.105383-1-dbarboza@ventanamicro.com>
 <20230622135700.105383-17-dbarboza@ventanamicro.com>
 <20230623-421ca497f9f83486881b9d9c@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230623-421ca497f9f83486881b9d9c@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 6/23/23 06:58, Andrew Jones wrote:
> On Thu, Jun 22, 2023 at 10:56:57AM -0300, Daniel Henrique Barboza wrote:
>> KVM-specific properties are being created inside target/riscv/kvm.c. But
>> at this moment we're gathering all the remaining properties from TCG and
>> adding them as is when running KVM. This creates a situation where
>> non-KVM properties are setting flags to 'true' due to its default
>> settings (e.g.  Zawrs). Users can also freely enable them via command
>> line.
>>
>> This doesn't impact runtime per se because KVM doesn't care about these
>> flags, but code such as riscv_isa_string_ext() take those flags into
>> account. The result is that, for a KVM guest, setting non-KVM properties
>> will make them appear in the riscv,isa DT.
>>
>> We want to keep the same API for both TCG and KVM and at the same time,
>> when running KVM, forbid non-KVM extensions to be enabled internally. We
>> accomplish both by changing riscv_cpu_add_user_properties() to add a
>> mock/no-op boolean property for every non-KVM extension in
>> riscv_cpu_extensions[]. Then, when running KVM, users are still free to
>> set extensions at will, we'll treat non-KVM extensions as a no-op, and
>> riscv_isa_string_ext() will not report bogus extensions in the DT.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c | 36 +++++++++++++++++++++++++++++++++---
>>   1 file changed, 33 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index b65db165cc..f5209f0789 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1720,6 +1720,18 @@ static Property riscv_cpu_extensions[] = {
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>> +
>> +static void cpu_set_cfg_noop(Object *obj, Visitor *v,
>> +                             const char *name,
>> +                             void *opaque, Error **errp)
>> +{
>> +    bool value;
>> +
>> +    if (!visit_type_bool(v, name, &value, errp)) {
>> +        return;
>> +    }
>> +}
>> +
>>   /*
>>    * Add CPU properties with user-facing flags.
>>    *
>> @@ -1738,9 +1750,27 @@ static void riscv_cpu_add_user_properties(Object *obj)
>>       riscv_cpu_add_misa_properties(obj);
>>   
>>       for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
>> -        /* Check if KVM didn't create the property already */
>> -        if (object_property_find(obj, prop->name)) {
>> -            continue;
>> +        if (riscv_running_kvm()) {
>> +            /* Check if KVM didn't create the property already */
>> +            if (object_property_find(obj, prop->name)) {
>> +                continue;
>> +            }
>> +
>> +            /*
>> +             * Set every multi-letter extension that KVM doesn't
>> +             * know as a no-op. This will allow users to set values
>> +             * to them while keeping their internal state to 'false'.
>> +             *
>> +             * We're giving a pass for non-bool properties since they're
>> +             * not related to the availability of extensions and can be
>> +             * safely ignored as is.
>> +             */
>> +            if (prop->info == &qdev_prop_bool) {
>> +                object_property_add(obj, prop->name, "bool",
>> +                                    NULL, cpu_set_cfg_noop,
>> +                                    NULL, NULL);
>> +                continue;
>> +            }
>>           }
>>   
>>           qdev_property_add_static(dev, prop);
>> -- 
>> 2.41.0
>>
> 
> I think we should actually fail with an error when the user tries to
> enable an extension KVM doesn't support. Otherwise a user may be
> confused as to why their Zawrs=on didn't provide them a machine with
> Zawrs. And, when KVM learns how to provide that support to guests
> (Zawrs is actually on my TODO...), then migrating the same VM to
> later KVM/QEMU will actually enable the feature, possibly confusing
> the guest.
> 
> So, we should probably just not add any extension properties to KVM
> guests which can't be enabled. Then, as we add support to KVM, we'll
> add the properties too.

By 'extension properties' do you mean just the flags that enable/disable them,
like '-cpu, rawrs=<bool>', or also the other properties related to extensions
that KVM might not support, like 'vlen' and 'elen' from RVV? I'd say that it's
ok to leave things such as 'vlen' because the user won't be able to enable RVV
in KVM anyways.

And what error do we want to throw? With this patch it's easy to just add an
Extension zawrs is not available using KVM" error message. Otherwise we can
not add the property at all and then QEMU will fail with a "property cpu.X not
found" type of error. Both will error out, question is whether we want to be
more informative about it.

Thanks,


Daniel


> 
> Thanks,
> drew

