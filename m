Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214AAEEAA5D
	for <qemu-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 18:10:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qgqmy-0005n0-RN; Thu, 14 Sep 2023 14:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qgqmx-0005mY-7w
 for qemu-riscv@nongnu.org; Thu, 14 Sep 2023 14:10:03 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qgqmu-0004Cu-Sq
 for qemu-riscv@nongnu.org; Thu, 14 Sep 2023 14:10:02 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68cbbff84f6so1759658b3a.1
 for <qemu-riscv@nongnu.org>; Thu, 14 Sep 2023 11:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1694714998; x=1695319798;
 darn=nongnu.org; 
 h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3XImFVD/Zhlk4Yi44GgqSdaqy1l3p/tjKUsfMxGazK0=;
 b=laslGIfeckhkfZdQWobiwKyN9cmetEZBkMvLV5MOc1+VIawQvcPIfDvu+AoNXdplv0
 9MYHAlc5MLK5VfM9ZFyGb+59A+lzfrLWbGWygSdaSLKj0VMajOWt7a/il+Euzba8O/VJ
 Ii6bhabXwgZB1ZpHv1k+ErVVJtqm75WZiilNYC/iRcgs1Nht3rJzMI29L8ExeEoLTRwg
 c5Cx2ZnDOSf7D2UcLml+l1cKBzyA0PFBA+Z/yDN01JFpYvw6sj7VoVQ69NHWtuv7kWvQ
 HP6zG9VD6FEHJwv3hZJ0+IKxXII1Ic/dCemG/NMSPSmATNK6MlNDgqoUPQQWcP8M8I+2
 DQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694714998; x=1695319798;
 h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3XImFVD/Zhlk4Yi44GgqSdaqy1l3p/tjKUsfMxGazK0=;
 b=hH2RjH77PGzoC8khvELJmbchZYo7W0zJC9jDTzKE51eBzO85Q3tl+dZIgJas4vILhL
 BLVchjVL9IbmlgsBySfDWuwEbxcSVjKKW+m2j9RgrUGtg+EdcytVLXABakPgBLrVNghO
 ktvM7WGDfGDfb2DJ783jhAbRu0FP3KXp0o5oRMecqFOsf/41yn+a5gNHX+LcWkTWz/hr
 yQ9bIFdbzdLA7qCAVXBNxbsfzre7kJi8DvfibQx4o5P6+9R80HdBcXBS0isIGp80QIdj
 aAfKPjG+r2pJbapsty/Awc6EvEJWgCwuqrk56Ae4QtH85v3yGJDKvvMpK5P3eMtSygau
 aSdw==
X-Gm-Message-State: AOJu0YxAjm7P6MTo7mteFlePvdeumLTpEUYEq4iYllRbkO+7xguG+tIs
 Y4nNdfi/2JYk2f4Nx+aHBmMKFVAEDA3NXqi2gKM=
X-Google-Smtp-Source: AGHT+IHnP1rirz4v5n5CsoZqQzURCuVB9ZvxrpnO5dOMpdiXoJkOSy53dQOqs5RuWmPBA6523wJ8Uw==
X-Received: by 2002:a05:6a20:8e05:b0:f0:50c4:4c43 with SMTP id
 y5-20020a056a208e0500b000f050c44c43mr3549334pzj.5.1694714998513; 
 Thu, 14 Sep 2023 11:09:58 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 i16-20020aa78b50000000b0068a30f6cf32sm1667033pfd.143.2023.09.14.11.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 11:09:57 -0700 (PDT)
Date: Thu, 14 Sep 2023 11:09:57 -0700 (PDT)
X-Google-Original-Date: Thu, 14 Sep 2023 11:09:54 PDT (-0700)
Subject: Re: RFC: QEMU rv64/rv32 CPU, 'max' CPU and profile support
In-Reply-To: <20230914-bbac51e753252e830905edf1@orel>
CC: abologna@redhat.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-a7562ccd-9a00-462f-9801-8c8c18b516e5@palmer-ri-x1c9a>
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=palmer@dabbelt.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 14 Sep 2023 08:08:40 PDT (-0700), ajones@ventanamicro.com wrote:
> On Thu, Sep 14, 2023 at 07:52:10AM -0700, Andrea Bolognani wrote:
>> On Mon, Sep 11, 2023 at 07:01:38PM -0300, Daniel Henrique Barboza wrote:
>> > On 9/11/23 16:46, Daniel Henrique Barboza wrote:
>> > > On 9/8/23 11:10, Andrew Jones wrote:
>> > > > On Fri, Sep 08, 2023 at 03:28:12AM -0700, Andrea Bolognani wrote:
>> > > > > Wouldn't that be exposed as a named vendor CPU rather than something
>> > > > > that users have to assemble themselves by layering profiles?
>> > > >
>> > > > Combing multiple profiles should be considered as creating a union of the
>> > > > mandatory extensions each profile represents, rather than as layering.
>> > > >
>> > > > Let's take the hypothetical case of C being dropped from rva24u64 as an
>> > > > example. When specifying both rva22u64 and rva24u64
>> > > > (-cpu min64,rva22u64=on,rva24u64=on) the user will get C enabled without
>> > > > even having to know about it, whereas if the user could only select the
>> > > > latest profile (-cpu rva24u64), C would not get enabled unless the user
>> > > > was aware that it needed to be explicitly enabled (-cpu rva24u64,c=on).
>>
>> Right, that's what I had in mind when I was talking about layering.
>> Using the term union is probably more appropriate though :)
>>
>> > > > > If you're working on defining a new CPU model and need fine-grained
>> > > > > control over the exact set of extensions, then you can already do
>> > > > > that by explicitly flipping each one of them on or off, and adding
>> > > > > the ability to layer profiles doesn't add much value except possibly
>> > > > > removing a bit of verbosity. Not particularly compelling IMO.
>> > > >
>> > > > I think it's compelling, because the extension lists that profiles provide
>> > > > are long and mostly uninteresting. For example, how often do we want to
>> > > > type and think about imafd_Zicsr_Zifencei? I think we'd mostly rather take
>> > > > those for granted, and we can, because we just specify 'g' instead. Indeed
>> > > > the profile spec even points out that using profiles as a way to deal with
>> > > > "unwieldy" ISA strings is another motivation for them. A RISC-V QEMU CPU
>> > > > command line is effectively an ISA string, so I think it's appropriate to
>> > > > apply profiles to it as well.
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
>> > > > >    (This also gets really interesting when you start thinking about
>> > > > >    extensions that are optional for the profile... Maybe we need
>> > > > >    something like '-cpu rva23u64,optional-extensions=off' so that
>> > > > >    testing against the baseline for a profile doesn't require combing
>> > > > >    through the spec and disabling extensions manually?)
>> > > >
>> > > > I don't think the profiles (whether they are CPU virtual extensions or
>> > > > CPU models) should enable the optional extensions by default. When
>> > > > software targets a profile (or set of profiles with the virtual
>> > > > extension approach) then it should never assume the optional extensions
>> > > > will be present. Developers should need to consciously include those
>> > > > extensions when creating the QEMU platform used for testing.
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

At the risk of adding to the bikeshedding here:  IMO we should start 
with a small set of CPU types that we know are useful.  We're not going 
to be able to cover everything, hence the options to turn on/off 
extensions/features.  Anything we add needs to go through the 
deprecation process if we remove it, though, so it's a bit of a 
headache.

> Thanks,
> drew

