Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC19CC001E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 21:16:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qW1OH-0004Ut-3x; Tue, 15 Aug 2023 17:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW1OD-0004R2-0F
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 17:15:45 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qW1OA-0001XX-EQ
 for qemu-riscv@nongnu.org; Tue, 15 Aug 2023 17:15:44 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6bca5d6dcedso4949011a34.1
 for <qemu-riscv@nongnu.org>; Tue, 15 Aug 2023 14:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692134141; x=1692738941;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E9ZSl0D9DVrW0wFnWc4TtqxAP6HbvQXJLoXsu7DHjJE=;
 b=Ql1ZB77/AprYo3bxaEa7mzbtwc5tF/IzdI8zS2c0aV/mDBWaM48qa7mWyEbfIcPPeH
 NDlt3Q51qDrh7JL6ppuzJ3DM2Jqk9jfbPDs/BRj4HEikV1nCfNMmlrCBXoCQZFynAUxr
 vqAH+nBA5mX+q3QpDhyLfnii3bduD7dEdE8T9QEAyrQrI0W4SXCAzNxTDYwKo4R0YBH+
 LVQB6M8Lm3ONKc4qm1m/7woxNSmLpKC5RRpZrQhZmfOeMjGlPNGzt3NdQzO3xneujGKF
 l6Hr0Ui4Ilpwl0vAL8nrNJewXE2KZlzWXepTJlkXaTRwto6IIetqmKxqW6Dr8ZjSiiAo
 UAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692134141; x=1692738941;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E9ZSl0D9DVrW0wFnWc4TtqxAP6HbvQXJLoXsu7DHjJE=;
 b=jr3TevKjCqymniqYGY+lYexy+wB/Du4fec633GSqrYgoG4mfO29zcMjeimwvNHnSiK
 6/VkIiW3LnCz4Z2MIR2l66NazCE4y2ThLMFp8B5AGfCj4IWI43WuLZDxkuWxo70Fu3Lo
 imebgK14QT5w/KjQwelwRrb3zBbAvgt1/q24pJTTp6hXV35wNP9byXjljCLOB0tTkJhx
 RRZBW+JYLW1ZEmuijFdgX10AS4+b8MZmU/d2xT+vdgVSfs/a2YJRfRjUvOHwz4jKiQ9N
 dJPMpgnF9XeOCFJZCyO85bKydP+V9C8gcB+8gow2e9Azxv8ZrvjrW5ND8Kkmodj+D3Py
 a5Yg==
X-Gm-Message-State: AOJu0YyrD8A8JLCQoKgs1xoes3lPnETbqu4kKAs0TFnThy9UqfoxQL9+
 NlS2+8FQzedkCp0G2IXzTdRrLA==
X-Google-Smtp-Source: AGHT+IFTVWbuiiax+8qRnk5YBLyKhxXtu9hEH1Iwmf5InL2OqYaypJx9pNMB7iPZ/gwP9YkvHJZRSA==
X-Received: by 2002:a9d:7f10:0:b0:6b9:68fb:5a28 with SMTP id
 j16-20020a9d7f10000000b006b968fb5a28mr13048123otq.27.1692134140977; 
 Tue, 15 Aug 2023 14:15:40 -0700 (PDT)
Received: from [192.168.68.108] (189-69-160-189.dial-up.telesp.net.br.
 [189.69.160.189]) by smtp.gmail.com with ESMTPSA id
 r17-20020a9d7cd1000000b006b99f66444bsm5535673otn.71.2023.08.15.14.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 14:15:40 -0700 (PDT)
Message-ID: <9197e0e0-7b68-9fb0-10ab-b6834ade60df@ventanamicro.com>
Date: Tue, 15 Aug 2023 18:15:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 07/12] target/riscv/cpu.c: add
 ADD_CPU_QDEV_PROPERTIES_ARRAY() macro
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230815201559.398643-1-dbarboza@ventanamicro.com>
 <20230815201559.398643-8-dbarboza@ventanamicro.com>
 <40ec95c2-7775-4a40-f73a-8f92d3cfb00c@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <40ec95c2-7775-4a40-f73a-8f92d3cfb00c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.045,
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



On 8/15/23 17:44, Richard Henderson wrote:
> On 8/15/23 13:15, Daniel Henrique Barboza wrote:
>> @@ -1883,6 +1883,13 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>>   }
>>   #endif
>> +#define ADD_CPU_QDEV_PROPERTIES_ARRAY(_dev, _array) \
>> +    do { \
>> +        for (Property *prop = _array; prop && prop->name; prop++) { \
>> +            qdev_property_add_static(_dev, prop); \
>> +        } \
>> +    } while (0)
> 
> Any reason not to make this a proper function?

It was a macro since early versions and remained this way. I don't have
strong feelings in favor or against it.

I assume that you don't fancy this macro usage, and probably for a good reason,
so I guess I'll do another version without macros in this patch and patch 8 (since
it's a similar macro usage).


Thanks,


Daniel


> 
> 
> r~

