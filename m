Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6ABC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 09:51:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0Ik7-0008JW-TP; Tue, 07 Nov 2023 04:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r0Ik5-0008IX-SX
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 04:51:29 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r0Iju-00074J-HG
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 04:51:26 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5a82c2eb50cso59479587b3.2
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 01:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699350677; x=1699955477; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=80v6yP4QAb/eXkBqA6nw6mTc6HYaYv/UJIOSjzOiz50=;
 b=mF3kJSyXuk1I2sldZfmchH7Jc33ixWZfGFqxPK8XSYFSuz1E1J+BS4RigPRZujM5hH
 EixIwA5wJmLM5CIQT1eQxqsDWcgNR1cxFPVEQkaQuUXUVB/BS5GTtdThDoOCHPiY+7+Y
 k8pFOjoXRnxC99jGcMu4HqzTbqBH3HA2cyXtajmf0X31mcTFMaqlBzleKMRTx0+YnYjf
 MdW8usrgC7E6Ftfkd8ENC0fE2j+74cIudpvnHU6G4UhYUaU/84ZWRc1vAfP9FLdTuwH5
 mpp8v/4CMgNJGu1mnyB/vduvZp7vokbJkETQ3X6Z8Vfaj7cDdM+WsWX77ox3zRDKRHy1
 gKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699350677; x=1699955477;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=80v6yP4QAb/eXkBqA6nw6mTc6HYaYv/UJIOSjzOiz50=;
 b=JE0EHUNn3mOA/0GkSSMkrLjoO3vTVemVi5wLzSOaN59IlLHz+n5HYZbmIpx8bOF9Lf
 hkUAbMw6qI9Qmsky0bLcO+b+6P7M4VFg/ked6adPp6fmtZw5/l1PyIPLwQxS8Cy7nI5a
 itoniMDug/w9+nx4bDSvJBg+BtrMlW1HdKy4DLnIsATWHpHhMJMXSQxmnuWGgVb7r0LF
 +xSgyXP764xalz5vc9FPj+UF/lFb98c2Ma3QTp/45HpntZeAH/TrG7Eh3rKPsEZi78uz
 3CLYwZgDybhXJKChNSTbnsRIpr1I5eFgs4k65EL0fQ3oSGC8XtAlkOhH3P0iEk/MA0kZ
 CwEg==
X-Gm-Message-State: AOJu0Yz4ZxTncolzQuKJ/1kkMIXscPmvtdiUA31qk056CaJlQFA1snt7
 fvyJXNSgAgpusBXdg4N3+8n8vA==
X-Google-Smtp-Source: AGHT+IFfmGWpoIIpWXjG0r1G/A14QesymrhATJVLsoZZZeH9TCpF7o1Y8aNQw5JUSBD+8a8CVacSLQ==
X-Received: by 2002:a81:8393:0:b0:5a7:b797:d1e4 with SMTP id
 t141-20020a818393000000b005a7b797d1e4mr9914213ywf.21.1699350677088; 
 Tue, 07 Nov 2023 01:51:17 -0800 (PST)
Received: from [192.168.68.107] ([179.193.10.161])
 by smtp.gmail.com with ESMTPSA id
 bt13-20020a05690c072d00b005a82f14b8dbsm5327968ywb.49.2023.11.07.01.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 01:51:16 -0800 (PST)
Message-ID: <e768af9e-9e48-4b37-aa77-ee865e56717c@ventanamicro.com>
Date: Tue, 7 Nov 2023 06:51:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: don't enable Zfa by default
To: Jerry ZJ <jerry.zhangjian@sifive.com>, alistair.francis@wdc.com,
 palmer@dabbelt.com, frank.chang@sifive.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20231106111440.59995-1-jerry.zhangjian@sifive.com>
 <c2901c07-9eef-449c-857a-6d2553aeb170@ventanamicro.com>
 <b1df8107-d0f1-4827-94bd-3f8c7cd3ea57@Spark>
 <0fbc4857-d9b3-4327-8a00-3fb277f05ef5@ventanamicro.com>
 <258be47f-97be-4308-bed5-dc34ef7ff954@Spark>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <258be47f-97be-4308-bed5-dc34ef7ff954@Spark>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 11/6/23 23:53, Jerry ZJ wrote:
> Use use mode QEMU can reproduce this
> Reproduce steps
> 
> Compile: riscv64-unknown-elf-clang -march=rv32imac_zicsr_zifencei_zba_zbb ./test.c -o hello_rv32imac
> 
> Run: qemu-riscv32 -cpu rv32,g=false,f=false,v=false,d=false,e=false,h=false,c=true,m=true,i=true,a=true,Zicsr=true,Zifencei=true,zmmul=true,zba=true,zbb=true ./hello_rv32imac

I'll definitely send patches to add a 'rv32i' CPU after seeing the amount of
X=false you're having to use here. You'll be doing something like:

qemu-riscv32 -cpu rv32i,c=true,m=true,a=true,Zicsr=true,Zifencei=true,zmmul=true,zba=true,zbb=true ./hello_rv32imac

I.e. you'll only enable what you need. You won't have to disable defaults you
don't want. I can put you in the CC if you want to give it a shot.

> 
> Then you will get the following error message:
> qemu-riscv32: Zfa extension requires F extension
> 
> Since Zfa has just been ratified, I suppose disabling it by default makes sense and will not break anything that exists.

Please elaborate a bit more in the commit msg (feel free to add the command line you
sent) about how inconvenient it is to deal with having to disable 'zfa' when you want
'F' disabled. I'll ack it.


Thanks,

Daniel

> 
> Best Regards,
> Jerry ZJ
> *SiFive Inc. Taiwan*
> On Nov 7, 2023 at 00:38 +0800, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, wrote:
>>
>>
>> On 11/6/23 12:21, Jerry ZJ wrote:
>>> We do have some cases that failed. SiFive e-series cores (https://static.dev.sifive.com/SiFive-E21-Manual-v1p0.pdf <https://static.dev.sifive.com/SiFive-E21-Manual-v1p0.pdf>) do not have F extension (For example: rv32imc_zicsr_zifencei_zba_zbb). When we use the corresponding extension options to configure QEMU, i.e., rv32, i=true, m=true, a=true, c=true, Zicsr=true, Zifencei=true, zba=true, zbb=true, the QEMU will have the following error.
>>> Zfa extension requires F extension
>>
>> Can you send your whole command line? I'm unable to reproduce it here. This
>> will boot:
>>
>> ./build/qemu-system-riscv32 -M virt -cpu rv32,i=true,m=true,a=true,c=true,zicsr=true,zifencei=true,zba=true,zbb=true --nographic
>>
>>
>> In a side note, we have a new CPU type (still pending, not yet queue) called
>> "rv64i", which comes only with 'RVI' enabled and nothing else - no defaults,
>> nothing.
>>
>> I believe this use case you testing here would benefit from a "rv32i" CPU that
>> does the same but for 32 bits. Then you can specify the whole CPU and not worry
>> about hidden defaults. Does that makes sense?
>>
>>>
>>> IMHO, we should not enable Zfa extension by default, especially when Zfa requires F to be enabled implicitly.
>>
>> If the rv32 use case you mentioned is really breaking because of zfa and
>> Fm, I'm fine with disabling zfa because it's now a bug. We just need a
>> reproducer.
>>
>>
>> Thanks,
>>
>> Daniel
>>
>>>
>>> Best Regards,
>>> Jerry ZJ
>>> *SiFive Inc. Taiwan*
>>> On Nov 6, 2023 at 22:55 +0800, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, wrote:
>>>>
>>>>
>>>> On 11/6/23 08:14, Jerry Zhang Jian wrote:
>>>>> - Zfa requires F, we should not assume all CPUs have F extension
>>>>> support.
>>>>
>>>> We do not have a case where this happen, do we? The default CPUs have F
>>>> enabled (see misa_ext_cfgs[] in target/riscv/tcg/tcg-cpu.c), so zfa being
>>>> enable isn't a problem for them. Vendor CPUs might not have F enabled, but
>>>> they don't use the default values for extensions, so they're not affected.
>>>> Having zfa enabled by default does not hurt the default CPU setups we have.
>>>>
>>>> I am not a fan of these defaults for rv64 and so on, but once we set them to
>>>> 'true' people can complain if we set them to 'false' because it might break
>>>> existing configs in the wild. We need a strong case (i.e. a bug) to do so.
>>>>
>>>>
>>>> Thanks,
>>>>
>>>> Daniel
>>>>
>>>>
>>>>>
>>>>> Signed-off-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
>>>>> ---
>>>>> target/riscv/cpu.c | 2 +-
>>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>>> index ac4a6c7eec..c9f11509c8 100644
>>>>> --- a/target/riscv/cpu.c
>>>>> +++ b/target/riscv/cpu.c
>>>>> @@ -1247,7 +1247,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>>>>> MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
>>>>> MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
>>>>> MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
>>>>> - MULTI_EXT_CFG_BOOL("zfa", ext_zfa, true),
>>>>> + MULTI_EXT_CFG_BOOL("zfa", ext_zfa, false),
>>>>> MULTI_EXT_CFG_BOOL("zfh", ext_zfh, false),
>>>>> MULTI_EXT_CFG_BOOL("zfhmin", ext_zfhmin, false),
>>>>> MULTI_EXT_CFG_BOOL("zve32f", ext_zve32f, false),

