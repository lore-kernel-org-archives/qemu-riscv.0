Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B61EB64DA
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 19:30:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIwaY-0002uq-Jj; Mon, 10 Jul 2023 15:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qIwaX-0002ug-6V
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 15:30:25 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qIwaU-0007iD-9L
 for qemu-riscv@nongnu.org; Mon, 10 Jul 2023 15:30:24 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1b8b4748fe4so24027945ad.1
 for <qemu-riscv@nongnu.org>; Mon, 10 Jul 2023 12:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1689017416; x=1691609416; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=01jGvtYbeW2F1rF92ARgyTHNZ0vjiZmIVWM3U7xsUn0=;
 b=d5Vd83E5SbXXIPxHRNYLrxbxE5ntGuzwz/gpgfgbLbaJYaJN6gRAecFLhkTU0aVO8d
 TkgTqb/Kg3Qq/b4zp+1Qt/h/lc+6j5TkMHVPlYS72Wrc2KJacgTfgsXPPH507lI32F4l
 NnwqTCJuHljGiLeYwFSscCwiPgVCd3EL3584mdqsih5f8E+SMjml0fEFsxkAJdKKFXyC
 nB17i/qvhzbc+f/pu8617E0ONMzMEzliQY+tu8FPT/gFoTAjVF1eb+TlUyhfNwyedGsH
 65RcRrrhTYZHVkcX4goAHYF00mhGY9Zk4p+X5w8UTlM//yzq5XDM/JAY8TkCAxIMooL2
 P3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689017416; x=1691609416;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01jGvtYbeW2F1rF92ARgyTHNZ0vjiZmIVWM3U7xsUn0=;
 b=bg5B+YdAPO2u7okishI81GT/BvTsq7ujbEpy23awnxBYBs96V8w7VRsx8eJwv1C7wh
 063eh1b9F26Q3qOeQSyAeITy7rQd1jvLqsT2bUUQpQCF1VIiXCi49bSwdO7L+6QyuBfY
 DUno6BPgQDijUERSENK/ZrN6CKJI5OM0uAhuG/UJZ6oO1GWh0tY6IwUGPqq+//V6e8si
 0oEICPT7HQ5rKcw/ByHiLTjHZnOsvz/ztaZ1InLlZqX9WB7tXWwiHF06eB9IcpcNvUJG
 ERplN8AkA2NGv7rW4+rs7RL85LVnF9QmnNlmBy454mjtA5FDTANnFS/sYVPyMZzGe99a
 vXIQ==
X-Gm-Message-State: ABy/qLY8IjMofMXPv7G60p5A+gbeDMmVD5mzKlyXApZSsvmpLCqgTOXD
 t0+NgXxvLXrzsLEuV+mYOvhcszMN5hIzpoDkk+Q=
X-Google-Smtp-Source: APBJJlHRlB1A+TUcGay4euiSZu2a4mgaX6z/FdESs34ThJN5+Y++EYrXIGE7RvFvix39O0TVcuJYYQ==
X-Received: by 2002:a17:902:d48c:b0:1b8:b288:6274 with SMTP id
 c12-20020a170902d48c00b001b8b2886274mr12651699plg.18.1689017416464; 
 Mon, 10 Jul 2023 12:30:16 -0700 (PDT)
Received: from localhost ([50.38.6.230]) by smtp.gmail.com with ESMTPSA id
 w19-20020a1709027b9300b001ae3f73b9c1sm262133pll.101.2023.07.10.12.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 12:30:15 -0700 (PDT)
Date: Mon, 10 Jul 2023 12:30:15 -0700 (PDT)
X-Google-Original-Date: Mon, 10 Jul 2023 12:29:30 PDT (-0700)
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
In-Reply-To: <72277222-2af6-84ca-9fad-22b0293a6695@ventanamicro.com>
CC: qemu-riscv@nongnu.org, abologna@redhat.com, ajones@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dbarboza@ventanamicro.com
Message-ID: <mhng-2142b63f-6a9b-4646-89df-9b7e0a818523@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 10 Jul 2023 12:26:21 PDT (-0700), dbarboza@ventanamicro.com wrote:
>
>
> On 7/10/23 16:06, Palmer Dabbelt wrote:
>> On Mon, 10 Jul 2023 11:46:34 PDT (-0700), dbarboza@ventanamicro.com wrote:
>>>
>>>
>>> On 7/10/23 15:13, Palmer Dabbelt wrote:
>>>> On Mon, 10 Jul 2023 10:53:12 PDT (-0700), dbarboza@ventanamicro.com wrote:
>>>>> Hi,
>>>>>
>>>>> We don't have a 'max' cpu type in riscv32 and riscv64. This is a special,
>>>>> fictional CPU type that has all possible extensions enabled. It can be
>>>>> either an alias for a real CPU or a new CPU type. It's used by tooling
>>>>> such as libvirt for capabilities probing.
>>>>>
>>>>> Well, in our case it can't be an alias because we don't have any CPU type
>>>>> that enables all extensions. Which brings me to my first question:
>>>>> what's the criteria for marking a certain extension default true/false
>>>>> in rv32/rv64/rv128?
>>>>
>>>> Pretty sure it's just been a somewhat arbitrary decision, with stuff that's likely to be used being enabled when it's added.
>>>>
>>>>> E.g. this is the riscv,isa DT for rv64:
>>>>>
>>>>> rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu
>>>>>
>>>>> It has a lot of extensions but it's missing some common ones like svinval
>>>>> and smstateen.
>>>>>
>>>>> We can add/remove some extensions from these generic CPUs, document it
>>>>> and be done with it. I want to propose a different design though:
>>>>>
>>>>> 1 - introduce the 'max' CPU. I guess we'll need some prep work in how
>>>>> the extensions are being declared/stored in the code. I'll work on
>>>>> it;
>>>>
>>>> IMO it's the right idea in spirit, but there's a handful of conflicting extensions -- mostly vendor stuff, but even some of the standard ones have conflicting encodings.  So I think there's likely to be some decisions to make there, but when there's conflicts there's usually also one called out as being aimed at microcontroller-class systems so there should be a natural choice.
>>>>
>>>>> 2 - introduce rva23U64/rva23S64. I would like to add a new 'profile' option
>>>>> for generic CPUs, with '-cpu rv64,profile=rva23U64' enabling a whole set
>>>>> of extensions. We would also support enabling optional profile extensions.
>>>>> Yes, we don't have all the profile extensions available yet (neither does
>>>>> the kernel AFAIK) but nothing is stopping us from adding the base
>>>>> framework;
>>>>
>>>> Would we also make incompatible extensions forbidden in the profile CPUs?
>>>
>>> I think we can allow those as long as they're not in conflict with mandatory
>>> profile extensions (not sure if there's a case of that).
>>
>> That seems reasonable to me too.
>>
>>>> If we add the 23 profiles, we should probably also add some other bases. We've got a defacto base in Linux that's rv{32,64}ima (plus some cruft as things have drifted around), I think there's also some interest in the 22 profiles.
>>>
>>> rv32/64ima would be the base of the minimal generic CPUs I proposed below.
>>
>> The Linux base has a few other things like Zicntr, Zifencei, Zicsr, etc -- essentially IMA from back before that stuff was all removed.
>
>
> Hmm I guess we'll need some more thought in how we define a minimal set for
> Linux then.

There's a few bits in the kernel docs about it, but they're all kind of 
ad-hoc because we tend to find out about the ISA changes after they 
happen.  Probably still the best starting point, though.

The best one I could find is the RISCV_HWPROBE_BASE_BEHAVIOR_IMA 
description in <https://docs.kernel.org/riscv/hwprobe.html> (though 
looks like we've got some formatting bugs...)

>>>>> 3 - reduce the generic CPUs up to the minimum required to boot Linux.
>>>>> Yes, a rather arbitrary criteria, but Linux is the most common OS used
>>>>> by RISC-V QEMU currently so we'll go with what most people are using.
>>>>> This would reduce rv64 to "rv64ima".
>>>>
>>>> Have a "minimum CPU required to boot Linux" option seems reasonable. Most users will probably want at least FD and C, though, so maybe we want something like that as well?
>>>
>>> I don't mind making the minimal CPU be rv32/64imafdc.
>>
>> Ya, IDK if there's a right answer.  Maybe someone else has a stronger opinion?  IMO it's kind of just a double-edged sword as to which we pick for the minimum.
>
> As long as we change it and document it it should be ok. Users will still be able
> to enable/disable extensions from the base rv64 CPU as well.
>
>
>>
>>>>> The end result is that we would have a max extensions CPU, a barebones
>>>>> generic CPU that can be fully customizable from the ground up, and
>>>>> a profile option to allow users to boost the generic CPUs with a
>>>>> set of extensions. We will avoid having to deal with generic CPUs having
>>>>> an (apparently) arbitrary set of extensions.
>>>>
>>>> IMO we still want to keep the ability to turn on/off extensions, the profiles are a long way from being concrete and we'll still have a lot of systems floating around that don't line up with them.  Being able to test those configurations in QEMU is a huge benefit for users, even if it's a headache to keep around all the options.
>>>
>>> Absolutely. What I meant is that, today, rv64 has a default set of extensions
>>> that seems arbitrary. It would be good to have more predictability, i.e. have
>>> a fixed set of extensions (like rv64imafdc) that users can use as a base to
>>> enable/disable extensions.
>>>
>>> The same thing can be done with profiles. I don't see a reason to forbid users
>>> to do this:
>>>
>>> '-cpu rv64,profile=rva23S64,icbom=false'
>>>
>>> Meaning "I want the rva23S64 profile without Zicbom". The user should be aware that
>>> Zicbom is mandatory for the profile, but since it's being explicitly disabled in the
>>> command line, we can comply. This can be used for debug/development purposes or
>>> the user is doing something silly. As long as it's explicit in the command line
>>> it's fine.
>>
>> Cool, I think I just misunderstood the original post.  I thought you were trying to say we should drop the per-extension properties.  I definitely agree that it's worth taking a look at the base CPUs, what we've got now is kind of just some arbitrary stuff that's left over from when the ISA was a lot simpler.
>>
>> That'd also make the "should we allow incompatible extensions in profiles" questions easier, as we'd essentially just be saying the profile is shorthand for some set of base/extensions.
>>
>> I guess that also brings up what to do with the U/S profiles split.  My guess is that most users just want both to match, so rva23s64 would include all the mandatory rva23u64 base/extensions?
>
> I think so. The profile doc states:
>
> RVA23S64 Mandatory Extensions
>
>   The following unprivileged extensions are mandatory:
>
>    The RVA23S64 mandatory unprivileged extensions include all the mandatory
>    unprivileged extensions in RVA23U64.
>
>
> So '-cpu rv64,profile=rva32S64' would include all the mandatory U64 extensions
> plus all the mandatory S64. We should add both, so S64 will be build on top of
> U64.

Thanks, I'd missed that.  So I think that's an easy one.

>
>
> Thanks,
>
> Daniel
>
>
>
>>
>>> Thanks,
>>>
>>> Daniel
>>>
>>>
>>>>
>>>>> I don't think we'll have too much opposition on adding (1) so I'll get
>>>>> on it. I really would like to hear about (2) and (3). (3) will break
>>>>> users that are using rv64 while counting with that whole set of extensions
>>>>> that are being enabled by default, but this is why we're going to add
>>>>> (2) first.
>>>>>
>>>>>
>>>>> Please comment. Andrea, feel free to give us libvirt/tooling insights.
>>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Daniel

