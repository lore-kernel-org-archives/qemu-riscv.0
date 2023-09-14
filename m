Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA714EEAA71
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 21:12:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qgtd0-0007N8-NZ; Thu, 14 Sep 2023 17:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qgtcz-0007N0-HI
 for qemu-riscv@nongnu.org; Thu, 14 Sep 2023 17:11:57 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qgtcx-00066h-NY
 for qemu-riscv@nongnu.org; Thu, 14 Sep 2023 17:11:57 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1c4cd0f6cb2so789533fac.0
 for <qemu-riscv@nongnu.org>; Thu, 14 Sep 2023 14:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1694725914; x=1695330714; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZrFNTkwD3/36Kzqx3uC5h6GBQ8HIUpOInq8dV4DXCXE=;
 b=KICAMS7ipZitZfmKYU0Drh74XCowfHTfwRR2QINyw+ODVfOUd0vynlEFp6HTCopevC
 LQ72Ds4LCyJVxebHhX+6v3PzTnpmHbo/+oeYxqoB456d7TPN69Yci39ASPw7DK7o1R3u
 rbBHAJU/HUcBTxy/PxyMKuvMcEZ6eC8MYkchk3gaHNjdtmKaflRYPWdmMOziFlvOUfOx
 jAGMg/6UaFTBJMz9E0kfw9hdPawf6sQDMAE6yi7sula1Bg/c22eHqXudk3bJJYWL0KBA
 sBdXNf+4I4JcAg8cwBlRA9R3KUVf5wW06XtR8dhOr+D7fqUaNduaIoDgDxbsc2XiDu4r
 MaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694725914; x=1695330714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZrFNTkwD3/36Kzqx3uC5h6GBQ8HIUpOInq8dV4DXCXE=;
 b=vqvlSjNBXM6cyOWjBEvvW+OyQep2EDbdn4w0/kakP5MSQn0r9M2nX90r1GlJHl2nEO
 4b3vRUZpv65RYkTYIxF3CBJVmn+FQwiA00xakxhU2trg/lqxxJIdbexkoJ2RtSzrwjlm
 Xe64UIbY/EM1u0TZrIJhZ/F23Q9Z7idIyBYHV0WpHs3ELdQvPnkCxCiYozp2vKUSGCtZ
 knG08CEe1eYDgkB0TJ8B1oHv8tz6KcSIQFiqRgflLroXR3fQtZNrWRB3B1LoAv3oJer3
 GoaXB+4TKFg11FBcVDm0Z3xaszRZMhggLHXTcjC0reHUNq6EE5wS2uEkYcm70aig7Uol
 qL5Q==
X-Gm-Message-State: AOJu0Yz7pZ90CjLHPe83uZ32umuUA5aR/+SymBg5rdchsEQixkXac372
 20rMIJk+pVSiPaKNKYYufSB7D5aSTIhhULGDmG8=
X-Google-Smtp-Source: AGHT+IH0Y5isgEtH5EsLeT0gs4NggN76vJFBWmsZLg743JwXRofipdYTHzqqoB630X5nlLlSUr43Ng==
X-Received: by 2002:a05:6870:e40c:b0:1b0:4166:8c19 with SMTP id
 n12-20020a056870e40c00b001b041668c19mr2260615oag.14.1694725913976; 
 Thu, 14 Sep 2023 14:11:53 -0700 (PDT)
Received: from [192.168.68.107] ([177.9.182.82])
 by smtp.gmail.com with ESMTPSA id
 bp16-20020a056871281000b001c4d922b4fasm1217852oac.8.2023.09.14.14.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 14:11:53 -0700 (PDT)
Message-ID: <5d47b0f1-4950-81ee-9e0f-d135658152e5@ventanamicro.com>
Date: Thu, 14 Sep 2023 18:11:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Andrea Bolognani <abologna@redhat.com>
Cc: qemu-riscv <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
References: <CABJz62NyVNu4Z1qmCG7MyJkGG_9yWxjUFHHWjmoQEP6unRrHNA@mail.gmail.com>
 <f08254a6-e251-b920-9a09-39f2dfc2cdde@ventanamicro.com>
 <CABJz62PzGr1Frou3AkpPudQa6MjS+HJs6f=B1T1gDa4Da5gpTg@mail.gmail.com>
 <20230908-5d71b8701d6efed371138954@orel>
 <20230908-5a7f4c1da93e556147100a70@orel>
 <CABJz62NP6COZVJQT8p3t1Lx4BWGbEUdMatVeZaRSvuEJjW6h5A@mail.gmail.com>
 <20230908-fc90cf18948effff759d1b9d@orel>
 <d023da43-cb72-73bd-019b-c3070074a163@ventanamicro.com>
 <478778e1-db73-5b41-e00e-3de8b6dcd340@ventanamicro.com>
 <CABJz62M4xQwdp_8NJRex=Ne9XeiqSw3JZZ0Pfd8fQdvoDESxDA@mail.gmail.com>
 <20230914-bbac51e753252e830905edf1@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230914-bbac51e753252e830905edf1@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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



On 9/14/23 12:08, Andrew Jones wrote:
> On Thu, Sep 14, 2023 at 07:52:10AM -0700, Andrea Bolognani wrote:
>> On Mon, Sep 11, 2023 at 07:01:38PM -0300, Daniel Henrique Barboza wrote:
>>> On 9/11/23 16:46, Daniel Henrique Barboza wrote:
>>>> On 9/8/23 11:10, Andrew Jones wrote:
>>>>> On Fri, Sep 08, 2023 at 03:28:12AM -0700, Andrea Bolognani wrote:
>>>>>> Wouldn't that be exposed as a named vendor CPU rather than something
>>>>>> that users have to assemble themselves by layering profiles?
>>>>>
>>>>> Combing multiple profiles should be considered as creating a union of the
>>>>> mandatory extensions each profile represents, rather than as layering.
>>>>>
>>>>> Let's take the hypothetical case of C being dropped from rva24u64 as an
>>>>> example. When specifying both rva22u64 and rva24u64
>>>>> (-cpu min64,rva22u64=on,rva24u64=on) the user will get C enabled without
>>>>> even having to know about it, whereas if the user could only select the
>>>>> latest profile (-cpu rva24u64), C would not get enabled unless the user
>>>>> was aware that it needed to be explicitly enabled (-cpu rva24u64,c=on).
>>
>> Right, that's what I had in mind when I was talking about layering.
>> Using the term union is probably more appropriate though :)
>>
>>>>>> If you're working on defining a new CPU model and need fine-grained
>>>>>> control over the exact set of extensions, then you can already do
>>>>>> that by explicitly flipping each one of them on or off, and adding
>>>>>> the ability to layer profiles doesn't add much value except possibly
>>>>>> removing a bit of verbosity. Not particularly compelling IMO.
>>>>>
>>>>> I think it's compelling, because the extension lists that profiles provide
>>>>> are long and mostly uninteresting. For example, how often do we want to
>>>>> type and think about imafd_Zicsr_Zifencei? I think we'd mostly rather take
>>>>> those for granted, and we can, because we just specify 'g' instead. Indeed
>>>>> the profile spec even points out that using profiles as a way to deal with
>>>>> "unwieldy" ISA strings is another motivation for them. A RISC-V QEMU CPU
>>>>> command line is effectively an ISA string, so I think it's appropriate to
>>>>> apply profiles to it as well.
>>
>> I'm not sure this will save a lot of typing unless you're enabling a
>> lot of profiles which are possibly far apart from each other in terms
>> of release year, but I also don't have a very strong opposition to
>> the approach. As you say, we are already effectively implementing it
>> with virtual extensions like "g", so extending the applicability
>> further to cover profiles is not too much of a stretch.
>>
>> I think libvirt will probably need to learn what set of extensions
>> each virtual extension/profile maps to, but since the definition will
>> come directly from actual specifications that shouldn't be a big
>> problem.
>>
>>>>>>     (This also gets really interesting when you start thinking about
>>>>>>     extensions that are optional for the profile... Maybe we need
>>>>>>     something like '-cpu rva23u64,optional-extensions=off' so that
>>>>>>     testing against the baseline for a profile doesn't require combing
>>>>>>     through the spec and disabling extensions manually?)
>>>>>
>>>>> I don't think the profiles (whether they are CPU virtual extensions or
>>>>> CPU models) should enable the optional extensions by default. When
>>>>> software targets a profile (or set of profiles with the virtual
>>>>> extension approach) then it should never assume the optional extensions
>>>>> will be present. Developers should need to consciously include those
>>>>> extensions when creating the QEMU platform used for testing.
>>
>> Fair enough.
>>
>> Should there be a way to explicitly enable all possible optional
>> extensions, then? To allow the developer to verify that the
>> application works correctly on a minimal implementation of the
>> profile, but also takes advantage of optional extensions if they are
>> present? Or would that be achieved by enabling the relevant
>> extensions manually? Or perhaps by using the max CPU model instead?
> 
> We could add a variant of each profile which represents everything the
> profile mentions. That could maybe be held off until the need arises,
> though, since 'max' may satisfy most users which aren't concerned about
> which extensions are mandatory vs. optional.


In my current prototype (not yet sent upstream, hopefully this month) I'm enabling
all possible extensions, both mandatory and optional, with 'rva22u64=true'. Perhaps
we should limit that to enable mandatory exts only, and then add a 'rva22u64-max'
or similar to enable all possible extensions QEMU supports for that profile.


Thanks,


Daniel

> 
> Thanks,
> drew

