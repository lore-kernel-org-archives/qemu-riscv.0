Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9A1EB64DD
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 23:08:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qPA1r-0003Eu-LZ; Thu, 27 Jul 2023 19:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPA1q-0003Ek-Ep
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 19:04:18 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qPA1l-0005M4-Da
 for qemu-riscv@nongnu.org; Thu, 27 Jul 2023 19:04:18 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-569bad45b63so1616613eaf.0
 for <qemu-riscv@nongnu.org>; Thu, 27 Jul 2023 16:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1690499051; x=1691103851;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+lLTDyVK5NpTfYC063dCYiFgyLM2yBsbrd9u3I8H5yY=;
 b=WsbeD+eY0Hi5NvjNOZRGFG7n+RoF3Qd1gtO1UekUX/raBUZIN0wSSqf+YdSHllKlCy
 PXcMDK26TuMFb1HvdDqeirTf2K15i47daOEjL/cB/rdZdmoJunkVYTagCr9gu//quOfM
 T8s29Bz2ZCwjAlZ3jkp15TEimdRsQSz3d2vNaLZw1oz6tp62H9pGuSV+erNH7ZoQY53/
 GpeUMrQMsGQHMQqZS/XdQTKbbQ1yWG6C6nY1AINkZghTaid93E3bMJP7phgGbNtIstuJ
 9dnbyAesznl2GTaxkyFgxoqqu/Nb3wG4KlKOTRIH22WJJX3l++iz0ggLuUpwUMhmB8rT
 dnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690499051; x=1691103851;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+lLTDyVK5NpTfYC063dCYiFgyLM2yBsbrd9u3I8H5yY=;
 b=DdP20m1BO8F99VCvCRFrV06yeTk+RWiP0BzN70p2rFoSaIoFzXLoy9ZfRqc1nOECVE
 MDoP6/u2FjKYQIcY/rjKFExHr835IIiGKNY5yZ4ncrCTdfnC9fcrh3FZGpnfOTxzRCO7
 akJhhpEhotGNy+eQshLYQPW3PieVRqos5szg0X4QDB1WPo5uDX//WDT3cupXyWWpFWvj
 iYj0OQytHnq8DKSfT2CQINz3+qkR8/M1NX/gz646s2yKDIZNn2mO3PMoM67Y/et0a7zo
 TuFS/3WuvvcyR0mNrHJITsv0m4BitrhBBlDGNTL1gltt+U3Tz/R7CqZUwBS+6ui/bgdu
 j+ow==
X-Gm-Message-State: ABy/qLackh/bCfc0Hm0hhk2nDy/J2ByPNF8m3eiGKcEYdxKANcM0xX/h
 iO9j19btE8LfHk9V1ouD8QxNRA==
X-Google-Smtp-Source: APBJJlHkkN3Z4HR1uKumni6OLE3kYTP4UgBiM1XQIDFcASoRwfe/djgOR9GTxdx00/8e3ckiOx9/4A==
X-Received: by 2002:a05:6870:d613:b0:1b0:3821:f09b with SMTP id
 a19-20020a056870d61300b001b03821f09bmr660676oaq.13.1690499051322; 
 Thu, 27 Jul 2023 16:04:11 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-36.dial-up.telesp.net.br.
 [201.69.66.36]) by smtp.gmail.com with ESMTPSA id
 s16-20020a056830125000b006b9cc67386fsm1077321otp.66.2023.07.27.16.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 16:04:11 -0700 (PDT)
Message-ID: <f08254a6-e251-b920-9a09-39f2dfc2cdde@ventanamicro.com>
Date: Thu, 27 Jul 2023 20:04:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Content-Language: en-US
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-riscv <qemu-riscv@nongnu.org>, Andrew Jones <ajones@ventanamicro.com>
References: <35a847a1-2720-14ab-61b0-c72d77d5f43b@ventanamicro.com>
 <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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



On 7/27/23 10:28, Andrea Bolognani wrote:
> Sorry for being late to the party, and I see that you're already a
> few versions in with the actual patches. Hopefully nothing I write
> here is going to be too disruptive of the work you've already done :)

We just finished warming up. National anthem starting in a few seconds.
Whole match ahead of us yet :P

> 
> On Mon, Jul 10, 2023 at 02:53:12PM -0300, Daniel Henrique Barboza wrote:
>> 1 - introduce the 'max' CPU. I guess we'll need some prep work in how
>> the extensions are being declared/stored in the code. I'll work on
>> it;
> 
> Yes please. At least for TCG, this is pretty much a no-brainer and
> what most people will probably want to use.
> 
>> 2 - introduce rva23U64/rva23S64. I would like to add a new 'profile' option
>> for generic CPUs, with '-cpu rv64,profile=rva23U64' enabling a whole set
>> of extensions. We would also support enabling optional profile extensions.
>> Yes, we don't have all the profile extensions available yet (neither does
>> the kernel AFAIK) but nothing is stopping us from adding the base
>> framework;
> 
> IIUC profiles are basically shorthands for well-defined sets of
> extensions. The idea definitely sounds valuable, but I wonder how
> we'd expose it from the libvirt XML.

I was thinking about adding them like CPU features, maybe? Like it is
already done for hyperv, gic, sev and so on. So we would have, e.g.:

<features>
   <profile>rva23U64</profile>
</features>


> 
> My question would be, why should this be -cpu rv64,profile=rva23U64
> instead of just -cpu rva23U64? "Base ISA plus a number of extensions"
> pretty much sounds like a named CPU model to me, but I'm sure there
> is more to it :)

We can do what makes sense since it's a virtual CPU model anyways.

The advantage of implementing profiles using a new 'profile' flag instead
of using a new CPU model is that we can pile up profiles on top of
each other using the existing generic CPU (rv64) which is also the default
CPU for some time. Implementing a new profile would then be a matter of
adding a new flag instead of a new CPU model.


> 
>> 3 - reduce the generic CPUs up to the minimum required to boot Linux.
>> Yes, a rather arbitrary criteria, but Linux is the most common OS used
>> by RISC-V QEMU currently so we'll go with what most people are using.
>> This would reduce rv64 to "rv64ima".
> 
> Can't we make the generic CPUs really bare-bones instead?
> 
> Not sure what exactly that would look like, but as long as you can
> enable specific extensions explicitly I don't see the advantage in
> targeting a specific use case (boot Linux), no matter how popular,
> instead of providing useful building blocks for custom behavior.

I agree that it's kind of lame to play favorites here and assume that Linux
is the only case that we care about. There's a high chance that other OSes
like FreeBSD might require even less extensions than Linux, so why can't
we use FreeBSD minimal extension set then?

The idea here is less about 'make rv64 a minimal CPU' and more about 'the
generic CPUs should have a predictable extension set'. Having a criteria
like 'It needs to boot Linux' grant that we will not break (too many)
existing users of these generics default CPUs that became used to a random
set of extensions and, all of a sudden, their setup stop working.

> 
> The use case of booting Linux, and really most RISC-V operating
> systems, should already be well served by -cpu max for TCG and -cpu
> host for KVM.

That's a fair point.

What if we:

- leave the rv64 CPU as is. We'll document the default enabled extensions the
CPU already has and leave it at that. We'll have to refrain from enabling
more default extensions in it though;

- if required, add a new 'barebones' CPU. Call it 'rv64min' or any other
suggestive name. Since it's a new CPU we can really strip it out without
worrying about breaking existing setups. Can be a good CPU for debugging;

- all future profiles are implemented as flags, similar to what we already
do with regular extensions. That will enable us to do things like '-cpu
rv64,rva22U64=true,rva23S64=true' and let user combo profiles that might
be compatible with each other.

And, reproducing here a question LIU Zhiwei asked me in the QEMU SIG meeting,
I believe enabling a profile should do just that - enable a certain set of
extensions. If the user wants to enable a profile and then disable some
mandatory extensions, have at it.


Let me know your thoughts. I have one more prep series to send before
starting the profile implementation, so we have time.


Thanks,

Daniel




> 

