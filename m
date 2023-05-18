Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E097C77B7D
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 14:41:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzeon-0001Bb-5G; Thu, 18 May 2023 10:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pzeol-0001BG-US
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 10:41:23 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pzeoi-0002FP-Kc
 for qemu-riscv@nongnu.org; Thu, 18 May 2023 10:41:23 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ae4baa77b2so15604095ad.2
 for <qemu-riscv@nongnu.org>; Thu, 18 May 2023 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684420878; x=1687012878; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=NW9LLhYTca2cJhIK8XTt/Nh6/suVOD01pOd44VESQ5c=;
 b=GdQCfpRE0SGkqI8Vw1uWDvMc/zSC6F72zrNhKYOwqVqPZV/RZMos7OTMzDYss7hYL8
 PfK5imLMaQkbv4WlOsl8BqmcScUPe2jfxZoms54uoW5xrOsXUPyG/zQbU/P90MQMaZOi
 rGlatnT1iW1m5JZ6/Vfrho2i2n91eRAqkhgCQ/Uonr6wYA8mYiKOhfS4Y1O/2kr/mKto
 YC+5Qz9hI+y9ZnYoo6/zqZPwqUEO9QYJcK+eBaXMb8ofHT4em+rF3f2SH0ARTkzeZ5B3
 vIRIqX2OlKm/djkHqAGmllJmSLXy59VJokCfXyOdTOf4epv65yuSWuXHxmf4p4lzsAEl
 P2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684420878; x=1687012878;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NW9LLhYTca2cJhIK8XTt/Nh6/suVOD01pOd44VESQ5c=;
 b=D5JS9LROYJ9qypfAPGZcMEjEquS9EEdPedGC4bK2WPXJLKvpPnHjDdeJZKv4Rst+6U
 k1iD1zBt3vs4acqNwwAfc6V4kH66zDoKOyeyI/uewabwifnUIB2E4NlFOSYugMj1nM6K
 SqrgoKKPvW4pFE01Vr0tEdakaBPpyyY/8Tffouq/0RNBl5VZLb9mfPUQKLpbXMKP/KPJ
 1TAx1g9M2NzQve15bch/2iOMBXeF0wf522us5bhqhkQuLQzkaxhgNv4Xz73Exz56/cDM
 idy3H/KFm1cnFdvRRmCSnNuhrbBjJnMUJoJ/v5lVZ15vp3vLXuhVmQWXCgWfCdOtO4qV
 XgVA==
X-Gm-Message-State: AC+VfDwQr6PvPn56YU29IMv19KgPaQoQ7jDJz0XMQXsj8t55TP/0pvom
 vyHgVY6vQ8UNriZ3bJqh6UGygw==
X-Google-Smtp-Source: ACHHUZ6JxPhsiDataOovPdM7nE2IyeWvbCpA+HWBCPdSdabHeOsCxcgZRnCilCby2R6wCo4Qatxqpg==
X-Received: by 2002:a17:903:41c6:b0:1ac:482e:ed4d with SMTP id
 u6-20020a17090341c600b001ac482eed4dmr3743263ple.18.1684420877838; 
 Thu, 18 May 2023 07:41:17 -0700 (PDT)
Received: from localhost ([135.180.227.0]) by smtp.gmail.com with ESMTPSA id
 h5-20020a170902680500b001a245b49731sm1534690plk.128.2023.05.18.07.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 07:41:17 -0700 (PDT)
Date: Thu, 18 May 2023 07:41:17 -0700 (PDT)
X-Google-Original-Date: Thu, 18 May 2023 07:41:15 PDT (-0700)
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
In-Reply-To: <20230518-hammock-doornail-478e8ea8e6a7@wendy>
CC: anup@brainfault.org, ajones@ventanamicro.com,
 Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, apatel@ventanamicro.com,
 atishp@atishpatra.org, jrtc27@jrtc27.com, 
 rick@andestech.com, ycliang@andestech.com, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, 
 u-boot@lists.denx.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
Message-ID: <mhng-95b99ff5-9024-4672-bb84-7599f7a05129@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62f.google.com
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

On Thu, 18 May 2023 07:06:17 PDT (-0700), Conor Dooley wrote:
> On Thu, May 18, 2023 at 07:13:15PM +0530, Anup Patel wrote:
>> On Thu, May 18, 2023 at 4:02 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>> > On Thu, May 18, 2023 at 09:58:30AM +0100, Conor Dooley wrote:
>
>> > > -  riscv,isa:
>> > > -    description:
>> > > -      Identifies the specific RISC-V instruction set architecture
>> > > -      supported by the hart.  These are documented in the RISC-V
>> > > -      User-Level ISA document, available from
>> > > -      https://riscv.org/specifications/
>> > > -
>> > > -      Due to revisions of the ISA specification, some deviations
>> > > -      have arisen over time.
>> > > -      Notably, riscv,isa was defined prior to the creation of the
>> > > -      Zicsr and Zifencei extensions and thus "i" implies
>> > > -      "zicsr_zifencei".
>> > > -
>> > > -      While the isa strings in ISA specification are case
>> > > -      insensitive, letters in the riscv,isa string must be all
>> > > -      lowercase to simplify parsing.
>> > > -    $ref: "/schemas/types.yaml#/definitions/string"
>> > > -    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
>> > > -
>> > >    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>> > >    timebase-frequency: false
>> > >
>> > > @@ -133,8 +117,13 @@ properties:
>> > >        DMIPS/MHz, relative to highest capacity-dmips-mhz
>> > >        in the system.
>> > >
>> > > +oneOf:
>> > > +  - required:
>> > > +      - riscv,isa
>> >
>> > This is the part Anup keeps reminding me about. We can create better ways
>> > to handle extensions in DT and ACPI, but we'll still need to parse ISA
>> > strings to handle legacy DTs and holdouts that keep creating ISA strings,
>> > at least during the deprecation period, since ISA strings are still "the
>> > way to do it" according to the spec.
>> 
>> Coming up with an alternate way in DT is fine but we can't deprecate
>> ISA strings since ISA strings are widely used:
>> 1) Various bootloaders
>
> Aye, for the reason, as I mentioned earlier and in the RFC thread,
> removing existing parsers isn't a good idea.

Removing and deprecating are different.  We can deprecate stuff.

>> 2) It is part of /proc/cpuinfo
>
> That is irrelevant.
>
>> 3) Hypervisors use it to communicate HW features to Guest/VM.
>> Hypervisors can't get away from generating ISA strings because
>> Hypervisors don't know what is running inside Guest/VM.
>
> Generate both :) As things stand, your guests could interpret what you
> communicate to them via riscv,isa differently!
>
>> In the case of ACPI, it is a very different situation. Like Sunil mentioned,
>> ACPI will always follow mechanisms defined by RVI (such as ISA string).
>> Other ACPI approaches such as GUID for ISA extension are simply not
>> scalable and will take a lot more memory for ACPI tables compared to
>> ISA strings.
>
> My proposal should actually suit ACPI, at least for Linux, as it would
> be a chance to align currently misaligned definitions. I won't speak to
> GUIDs or whatever as that's someone else's problem :)

We talked a bit in the patchwork meeting with Drew about ACPI.  Any 
actual spec/encoding would need to be different, of course, but 
conceptually it seems to fit fine.  It's also broadly similar to what 
we've done with riscv_hwprobe() for userspace, which is nice.

>> > Also, if we assume the wording in the spec does get shored up, then,
>> > unless I'm missing something, the list of advantages for this boolean
>> > proposal from your commit message would be
>> 
>> IMO, we should try our best to have the wordings changed in RVI spec.
>
> Yes, doing so is beneficial for all of us regardless of what happens
> here. I do think that it is partially orthogonal - it allows us to not
> design an interface that needs to be capable of communicating a wide
> variety of versions, but I don't think it solves some of the issues
> that riscv,isa has. If I thought it did, I would not have gone to the
> trouble of respinning this patch out of the other approach.
>
>> > * More character choices for name -- probably not a huge gain for ratified
>> >   extensions, since the boolean properties will likely still use the same
>> >   name as the ISA string (riscv,isa-extension-<name>). But, for vendor
>> >   extensions, this is indeed a major improvement, since vendor extension
>> >   boolean property names may need to be extended in unambiguous ways to
>> >   handle changes in the extension.
>> >
>> > * Simpler, more complete DT validation (but we still need a best effort
>> >   for legacy ISA strings)
>> >
>> > * Simpler DT parsing (but we still need the current parser for legacy ISA
>> >   strings)
>> >
>> > > +  - required:
>> > > +      - riscv,isa-base
>> > > +
>> > >  required:
>> > > -  - riscv,isa
>> > >    - interrupt-controller
>> > >
>> > >  additionalProperties: true
>> > > @@ -177,7 +166,13 @@ examples:
>> > >                  i-tlb-size = <32>;
>> > >                  mmu-type = "riscv,sv39";
>> > >                  reg = <1>;
>> > > -                riscv,isa = "rv64imafdc";
>> > > +                riscv,isa-base = "rv64i";
>> > > +                riscv,isa-extension-i;
>> > > +                riscv,isa-extension-m;
>> > > +                riscv,isa-extension-a;
>> > > +                riscv,isa-extension-f;
>> > > +                riscv,isa-extension-d;
>> > > +                riscv,isa-extension-c;
>> 
>> One downside of this new approach is it will increase the size of DTB.
>> Imaging 50 such DT properties in 46 CPU DT nodes.
>
> I should do a comparison between 50 extensions in riscv,isa and doing
> this 50 times and see what the sizes are.

I'm not sure how sensitive people are to DT size (presumably it'd be DTB 
size)?

It's also not clear what we can do about it: RISC-V has lots of 
extensions, that's going to take encoding space.  Sticking with an 
ambiguous encoding because it's smaller seems like a way to get 
burned in the long run.

