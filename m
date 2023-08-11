Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A449C001DB
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 11:22:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUQE6-0000Hp-3l; Fri, 11 Aug 2023 07:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qUQE4-0000HQ-Mk
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 07:22:40 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qUQE2-0002OZ-SZ
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 07:22:40 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bc9811558cso1725452a34.0
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 04:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1691752957; x=1692357757;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SLWfmyNgq+oC2V4EytuMHgaXAUo5ypQF9INQ+VaJqOc=;
 b=YDMuhQvO7d09rzSC4fQ8Tm0q5v157pjHGEcMlfJRKAf00jiQ2AVCKpkVXU5fw2NTsC
 obUi+55LXqpAUY7klRQPikTkdMP4xznvReoLdoL4teO+4k48FHLLvgkJqw+qzw3VnhRh
 Xj1rjYL0yo0QNTZ7uWovs8F/AunhbrJbSBBTUcBDI+VlHqwxfF+DwFej4H7GW7/1UZAc
 8WD3grzOUTQifBpiY6r7iut9ef23r2vxgUfMXpx7oyZ3w22LiG8xKGM3mmVigSQnKRo2
 kUFQeOdZDooBRfW0SqhbkvwumbGNBfFn1PjfFQFI0FEw5MA5iOpVhSCSdGITH/qzsktV
 Ia5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691752957; x=1692357757;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SLWfmyNgq+oC2V4EytuMHgaXAUo5ypQF9INQ+VaJqOc=;
 b=K/coxqObqfMWkzOLKsdZ31GRL7UMRVTx3s1UaFSqDonTSsweb8eMiSjlvi3qcK+YIV
 kC31VPbgbgTGAZm4Z9XHQwazm8SbDfVBKdcNKAJJEdZ+0tdRmMM3DmIr9kuUL5b0e1Ly
 vWphTm6iOlPQzNYo22sNNBGRTMspNm1bZklH1ANGFuEFDyc9ZkjU+AnVE4mPR0OusHQU
 1bH1GhFWHlVPBFwNWCexHlTy7On72Ek4singZvYrGto3ZGh35bd4aWhTTS/qTApDcbvH
 vaszGr523EWQMzN0qcuZCGY6twq+lCStzDpfZ9AT6gg3rVUwkTGaNg8Z2oriVG7hw6UE
 tpQA==
X-Gm-Message-State: AOJu0Yz7PUKJOWqD8askopYtBLs6UXIN/wQNKZ8ufiXRLre4y7/uYwUR
 LdJyYiXCqtIRez8Qh+TsehtNNQ==
X-Google-Smtp-Source: AGHT+IEgoPCRlRT6th+xr4X2Faj9/wgCFAwSPWY4nyaq6lNW3XnBZcDPqSpaovnNLYNtHWbNfxNO9g==
X-Received: by 2002:a05:6830:4517:b0:6b8:19d8:6925 with SMTP id
 i23-20020a056830451700b006b819d86925mr1487982otv.12.1691752957322; 
 Fri, 11 Aug 2023 04:22:37 -0700 (PDT)
Received: from ?IPV6:2804:14c:f435:9162::100f? ([2804:14c:f435:9162::100f])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a9d7750000000b006b9cc007e87sm1509728otl.20.2023.08.11.04.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 04:22:36 -0700 (PDT)
Message-ID: <a2a67b5b-e32e-5555-241c-521452025178@ventanamicro.com>
Date: Fri, 11 Aug 2023 08:22:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] riscv: zicond: make default
To: Alistair Francis <alistair23@gmail.com>,
 Vineet Gupta <vineetg@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, kito.cheng@gmail.com,
 Jeff Law <jeffreyalaw@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230808181715.436395-1-vineetg@rivosinc.com>
 <20230808181715.436395-2-vineetg@rivosinc.com>
 <ff43edc3-f160-e57d-deb1-185601ed5b7d@ventanamicro.com>
 <1aa3bdff-0db4-c589-8863-56bbea825fda@rivosinc.com>
 <CAKmqyKP2jQ1TYFNjMJNJxGqxHgq5fe5RhBhJDiPE1DoBXpf0gw@mail.gmail.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKP2jQ1TYFNjMJNJxGqxHgq5fe5RhBhJDiPE1DoBXpf0gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.972,
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



On 8/10/23 15:07, Alistair Francis wrote:
> On Tue, Aug 8, 2023 at 6:10 PM Vineet Gupta <vineetg@rivosinc.com> wrote:
>>
>>
>>
>> On 8/8/23 14:06, Daniel Henrique Barboza wrote:
>>> (CCing Alistair and other reviewers)
>>>
>>> On 8/8/23 15:17, Vineet Gupta wrote:
>>>> Again this helps with better testing and something qemu has been doing
>>>> with newer features anyways.
>>>>
>>>> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
>>>> ---
>>>
>>> Even if we can reach a consensus about removing the experimental (x-
>>> prefix) status
>>> from an extension that is Frozen instead of ratified, enabling stuff
>>> in the default
>>> CPUs because it's easier to test is something we would like to avoid.
>>> The rv64
>>> CPU has a random set of extensions enabled for the most different and
>>> undocumented
>>> reasons, and users don't know what they'll get because we keep beefing
>>> up the
>>> generic CPUs arbitrarily.
> 
> The idea was to enable "most" extensions for the virt machine. It's a
> bit wishy-washy, but the idea was to enable as much as possible by
> default on the virt machine, as long as it doesn't conflict. The goal
> being to allow users to get the "best" experience as all their
> favourite extensions are enabled.
> 
> It's harder to do in practice, so we are in a weird state where users
> don't know what is and isn't enabled.
> 
> We probably want to revisit this. We should try to enable what is
> useful for users and make it clear what is and isn't enabled. I'm not
> clear on how best to do that though.

Yeah, thing is how we define 'useful for users'. If you take a look at this
thread where we discussed the 'max' CPU design:

https://lore.kernel.org/qemu-riscv/35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com/

The 'max' CPU design is rather straightforward, the profile support is also
straightforward (I'll work on that soon), but the role of the rv64 CPU is
confusing.

IMO we should freeze the current rv64 extensions, document it, and the leave
it alone unless we have a very good reason to enable more stuff. We'll have the
max CPU for the use case where users want the maximum amount of stable features
and, with profile support, we can make rv64 operate with a predictable set of
extensions. Seems like a good coverage.


Thanks,

Daniel

> 
> Again, I think this comes back to we need to version the virt machine.
> I might do that as a starting point, that allows us to make changes in
> a clear way.
> 
>>
>> I understand this position given the arbitrary nature of gazillion
>> extensions. However pragmatically things like bitmanip and zicond are so
>> fundamental it would be strange for designs to not have them, in a few
>> years. Besides these don't compete or conflict with other extensions.
>> But on face value it is indeed possible for vendors to drop them for
>> various reasons or no-reasons.
>>
>> But having the x- dropped is good enough for our needs as there's
>> already mechanisms to enable the toggles from elf attributes.
>>
>>>
>>> Starting on QEMU 8.2 we'll have a 'max' CPU type that will enable all
>>> non-experimental
>>> and non-vendor extensions by default, making it easier for tooling to
>>> test new
>>> features/extensions. All tooling should consider changing their
>>> scripts to use the
>>> 'max' CPU when it's available.
>>
>> That would be great.
> 
> The max CPU helps, but I do feel that the default should allow users
> to experience as many RISC-V extensions/features as practical.
> 
> Alistair
> 
>>
>>>
>>> For now, I fear that gcc and friends will still need to enable
>>> 'zicond' in the command
>>> line via 'zicond=true'.  Thanks,
>>
>> Thx,
>> -Vineet
>>

