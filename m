Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547D2CDB482
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 19:08:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qr12U-0003Bj-GE; Thu, 12 Oct 2023 15:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qr12O-0003B8-Rl
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 15:08:01 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qr12L-00041X-5m
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 15:07:59 -0400
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3512c43adebso4688385ab.3
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697137675; x=1697742475; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yQ24/KUi48gyZrd7efj3RE7PqH3iS6rbI6hob8rqNa4=;
 b=duC0Wcg8IeLCFpPSN771F8xoHOD7M61XOHy+30Wj0Bwa0BimkfhMvUKnOrReh1WdRa
 AkbPgV8chWen7Ws57hY1pMjSR/v98u+TzHjz4Pf9wbAu0erM8ZMZJXyDh/FTGMMiKP/Q
 1XXFqXw9ruLlkgZpgCBG3flHE+AzBF7sbUi+lqreCpqvMxCztToxJJ1f5MQSvlIq/aww
 pg/itA+1DMQi1NZxNViTpqvfbbbjZd/86GfCdLH3TO5TmiltRSGpyuvvx+Di33133LWs
 Yj/3VL3QivayIuiro5oXkhnlgp2suyORBCRZAuI+ESveERYJwNIfnkgwq3/vLoAksCgI
 zXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697137675; x=1697742475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yQ24/KUi48gyZrd7efj3RE7PqH3iS6rbI6hob8rqNa4=;
 b=q7SC5qFrEHLtFNuCB9qicZySpOvQAZIMMObjaUgWFq3Vy8lt5LYQ2sOlXo8gLlDLxm
 m2zdwwD3k4y8GnkqbwnI7snFhnYLaG7nxTVltitlwA/iUYUom0PdTkdcvSLF4hG9YZqu
 HMQTeKcFLzrBYXNnS5WSWrm5MJE7Y02vfmhNxLljsX0DMfWL/vXgWtG8VbRuMj3QWetH
 RMd6Ia2ufaU31+9I1UYdB/QQBbd3jL5W1dc2hrU/9ssAMV24bEG3TyjzCYAslpuiF8Ny
 v/6EALspIm2CToyORPr9VUTHrxpkEnmAjD1W+PUBsH2XNHzlcUTZk9gpOSOrwUdOycAz
 /w7A==
X-Gm-Message-State: AOJu0YwjAKhiRJOKUJkHuKK4Hr1+nlPess+lo8YX1GA3Q4qeB0lro+Pa
 IZSrrxLc96IXI0M7BIuLqjw1vB2izLARpsjQyj0=
X-Google-Smtp-Source: AGHT+IE4RCQyp0/d5HzpamuDQeyFq3kltNxnlPfd7Ig8VK1+AWgbYSqhwY7d1IGBubLtmrMBpQE60Q==
X-Received: by 2002:a05:6e02:1e02:b0:350:f0bb:6a42 with SMTP id
 g2-20020a056e021e0200b00350f0bb6a42mr35030401ila.29.1697137674868; 
 Thu, 12 Oct 2023 12:07:54 -0700 (PDT)
Received: from [192.168.68.107] ([177.94.42.196])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a639c09000000b005781e026905sm2033458pge.56.2023.10.12.12.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 12:07:54 -0700 (PDT)
Message-ID: <a89189d3-2975-487e-9d2e-bd8ea60feba5@ventanamicro.com>
Date: Thu, 12 Oct 2023 16:07:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] riscv: RVA22U64 profile support
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20231006132134.1135297-1-dbarboza@ventanamicro.com>
 <CAKmqyKP=4kGpO=8D13iJw7pJSkD9CFary_DHt236+e1GFMAngA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CAKmqyKP=4kGpO=8D13iJw7pJSkD9CFary_DHt236+e1GFMAngA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-il1-x130.google.com
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



On 10/11/23 00:01, Alistair Francis wrote:
> On Sat, Oct 7, 2023 at 12:23 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> Hi,
>>
>> Several design changes were made in this version after the reviews and
>> feedback in the v1 [1]. The high-level summary is:
>>
>> - we'll no longer allow users to set profile flags for vendor CPUs. If
>>    we're to adhere to the current policy of not allowing users to enable
>>    extensions for vendor CPUs, the profile support would become a
>>    glorified way of checking if the vendor CPU happens to support a
>>    specific profile. If a future vendor CPU supports a profile the CPU
>>    can declare it manually in its cpu_init() function, the flag will
>>    still be set, but users can't change it;
>>
>> - disabling a profile will now disable all the mandatory extensions from
>>    the CPU;
> 
> What happens if you enable one profile and disable a different one?

With this implementation as is the profiles will be evaluated by the order they're
declared in riscv_cpu_profiles[]. Which isn't exactly ideal since we're exchanging
a left-to-right ordering in the command line by an arbitrary order that we happened
to set in the code.

I can make some tweaks to make the profiles sensible to left-to-right order between
them, while keeping regular extension with higher priority. e.g.:


-cpu rv64,zicbom=true,profileA=false,profileB=true,zicboz=false
-cpu rv64,profileA=false,zicbom=true,zicboz=false,profileB=true
-cpu rv64,profileA=false,profileB=true,zicbom=true,zicboz=false

These would all do the same thing: "keeping zicbom=true and zicboz=false, disable profileA
and then enable profile B"

Switching the profiles order would have a different result:

-cpu rv64,profileB=true,profileA=false,zicbom=true,zicboz=false

"keeping zicbom=true and zicboz=false, enable profile B and then disable profile A"


I'm happy to hear any other alternative/ideas. We'll either deal with some left-to-right
ordering w.r.t profiles or deal with an internal profile commit ordering. TBH I think
it's sensible to demand left-to-right command line ordering for profiles only.


Thanks,


Daniel





> 
> Alistair
> 
>>
>> - the profile logic was moved to realize() time in a step we're calling
>>    'commit profile'. This allows us to enable/disable profile extensions
>>    after considering user input in other individual extensions. The
>>    result is that we don't care about the order in which the profile flag
>>    was set in comparison with other extensions in the command line, i.e.
>>    the following lines are equal:
>>
>>    -cpu rv64,zicbom=false,rva22u64=true,Zifencei=false
>>
>>    -cpu rv64,rva22u64=true,zicbom=false,Zifencei=false
>>
>>    and they mean 'enable the rva22u64 profile while keeping zicbom and
>>    Zifencei disabled'.
>>
>>
>> Other minor changes were needed as result of these design changes. E.g.
>> we're now having to track MISA extensions set by users (patch 7),
>> something that we were doing only for multi-letter extensions.
>>
>> Changes from v1:
>> - patch 6 from v1 ("target/riscv/kvm: add 'rva22u64' flag as unavailable"):
>>      - moved up to patch 4
>> - patch 5 from v1("target/riscv/tcg-cpu.c: enable profile support for vendor CPUs"):
>>      - dropped
>> - patch 6 (new):
>>    - add riscv_cpu_commit_profile()
>> - patch 7 (new):
>>    - add user choice hash for MISA extensions
>> - patch 9 (new):
>>    - handle MISA bits user choice when commiting profiles
>> - patch 8 and 10 (new):
>>    - helpers to avoid code repetition
>> - v1 link: https://lore.kernel.org/qemu-riscv/20230926194951.183767-1-dbarboza@ventanamicro.com/
>>
>>
>> Daniel Henrique Barboza (10):
>>    target/riscv/cpu.c: add zicntr extension flag
>>    target/riscv/cpu.c: add zihpm extension flag
>>    target/riscv: add rva22u64 profile definition
>>    target/riscv/kvm: add 'rva22u64' flag as unavailable
>>    target/riscv/tcg: add user flag for profile support
>>    target/riscv/tcg: commit profiles during realize()
>>    target/riscv/tcg: add MISA user options hash
>>    target/riscv/tcg: add riscv_cpu_write_misa_bit()
>>    target/riscv/tcg: handle MISA bits on profile commit
>>    target/riscv/tcg: add hash table insert helpers
>>
>>   target/riscv/cpu.c         |  29 +++++++
>>   target/riscv/cpu.h         |  12 +++
>>   target/riscv/cpu_cfg.h     |   2 +
>>   target/riscv/kvm/kvm-cpu.c |   7 +-
>>   target/riscv/tcg/tcg-cpu.c | 165 +++++++++++++++++++++++++++++++++----
>>   5 files changed, 197 insertions(+), 18 deletions(-)
>>
>> --
>> 2.41.0
>>
>>

