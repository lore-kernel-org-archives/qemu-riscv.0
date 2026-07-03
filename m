Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E39C43458
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 04:35:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfVcm-0000sz-Js; Fri, 03 Jul 2026 00:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wfVcc-0000rl-Kj
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 00:35:30 -0400
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wfVca-00018R-4P
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 00:35:26 -0400
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id 0F3BA1D00118;
 Fri,  3 Jul 2026 00:35:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Fri, 03 Jul 2026 00:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1783053319;
 x=1783139719; bh=3e7oy/lHK7SWCwer9wsoySWAFiKReyhnzvgqQV8oG7Y=; b=
 kNI2n14Rkup0beSqtlDl6iQ4ai08WInsgLhhOzVSvumKD20uvGcXxj/Z9ruil+5r
 hgGnnwwIil2KpV4RbSbVLCKczO9Z3nUQG4Mit4S3QRLlrO3JCH8/XjVGXm7sZlxh
 B/pPk9z0ZJAtaZrEQuTH0AcFjJPQ143aqRgJCMkj1SGL9Xr5mVx7iCfD3rFLwfhB
 Fk8JxyzyK8dyCSYcYQKE8BBKj74/F8yvTpVmwIJtJJYEKUqoH4H82+NUmesq++8S
 IORo7mmj8GRwST++FbHx76sUM3Pu9Bx6rGWwWDNwb0F0FQKXEXx8ENzyJpveassx
 lwZpMCHoGlLWUObonOqgTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1783053319; x=1783139719; bh=3
 e7oy/lHK7SWCwer9wsoySWAFiKReyhnzvgqQV8oG7Y=; b=o5MUuDD8guoSxGxfy
 qohbWkYKstnfq7I/4vZLICrSK4hXFLh6mg2WRW77dFSZwZVpNtR+4mDNDujH9HJf
 Xd/aflCrTleT7vBb9a6SR7OTtv824WpJSZXBDzGY6GBjzMeqPyIoNB0r1nUR5z77
 bRDvnjUiwkMgmS1UWwm2/MzuN34BBUGmT+taA+Abe9Rwec7r9U4nhS+29jhmXBPU
 rms1S5s9ygi7xAsWTvNOYEio0Pxjx4ZYGHKDY9gRuL5wFZLmb4qMsfYAWhYMU3rP
 ntfKgYc7UO8kmIe7Sm2QO1J1dLGD94I7xymWlDZJEixJCuOJkRnnanGxcEwWuH7N
 B15Vw==
X-ME-Sender: <xms:BzxHapgGJR6ZxSlOx3Z2ENOdrmKXY9-u-VzobEf1uExYmknKm6YPnw>
 <xme:BzxHakD-Y9YgKWQWKtTN137OsPTk7FYpMN6e1pC7ft2nAdmko-GacfCEaefInBsyB
 HHeOekg_KnKWW5zcaVDTshvwNBcdy00jYCxP0PmlHs7Ib2jhTbsuTEF>
X-ME-Received: <xmr:BzxHamu3STa-YkX8EneWOsL2BCtqEB748oloGgVhON1xYRRcoOsV-mQeE-Z2COObxQ>
X-ME-Proxy-Cause: dmFkZTGjmAM9LQ1IdbTKqSY7VqWoXIBYbrAxFJlLXzRS6VP6J1APUrIQP+XBcbhzKaVm1v
 +hkd7zbCDOyK2n3eIuR2mBmowTcmOywLub+SNHP2vbysx8c4O0tsIUuNw8NTJHDx+0Sx2L
 UA/CRo4ohBc4k+XYOEWfOlNcmLquv6T91Su7c40jLERfpgW3jAgNbIzX2fdFSLvxj/J27O
 7Zhkf0KO0Hb8q/oZOiqOj+w7UkBTE3xq1Ex1W/QVt3dCz9ZD2RD4FZOQG4OtOdigvOsl6V
 P7ktUz60jaPapBvvea6asPRbQ5HYSx7LN1Z3qxAL61/MYMncpj1ObAhxsCDDGC91mx6yp7
 71TuY6COvX+jk0Xc18MUbfCz25CNGZyd3VBI8NpdnOmSKqBUn5R7ek7gpArwjzqASuA8TO
 4nSDYr9XW9MCkl8Nb6WlB0qeJqgiX5q8vF3l/6oiBhLg9EddPx7LCFMIuzIFbbfWBnvMRm
 4Y4RpHWQKL408HzHkSi2XW0nxgN7Br4qTQwve22t54H8u7kaMDF/LzxlwEhO3keJtLiYfC
 O4Xz2BT8han3UJIpzkOdX93S1z6KlOjylqRVQ4iQvqaBlzl5skkbK6gU6uoS1HtkOZ1NIG
 HuBygCUAHZaZ/Szc7BiXoxVxaSMS83VrTWduBOdVFJqRhDPRdGPnRUl0ctvg
X-ME-Proxy: <xmx:BzxHapaDq2CFw4ZhEwVexqlGVI-gNYzZ_J1WGyBb_LjeU70si2kMBg>
 <xmx:BzxHapVITo3lcp5Ja_QfhVDnt-eRGlHn3MbkCtJ0V-PaWAWAMmpMVg>
 <xmx:BzxHat6wfjwRuoU2aYlMpg9IBItdfWVEAhNKEVxACwZXfiuwOoCoww>
 <xmx:BzxHakh1FQGPB5LEjQ6bHh2mOyV2VGXRXlx-BttYlroM_tjwTNvTUw>
 <xmx:BzxHapoysCViIQ_jImYsTm7BysnYte5xN8l9hDACtH_Slwsz1flSZdIw>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jul 2026 00:35:18 -0400 (EDT)
Message-ID: <9549a2a6-f26b-4057-bea5-f4a92e0d94c6@alistair23.me>
Date: Fri, 3 Jul 2026 14:35:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RISC-V Code Policy
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org
References: <057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me>
 <66d9c9a3-f3f0-480a-96bd-8e237c47c732@oss.qualcomm.com>
Content-Language: en-AU
From: Alistair Francis <alistair@alistair23.me>
In-Reply-To: <66d9c9a3-f3f0-480a-96bd-8e237c47c732@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.145;
 envelope-from=alistair@alistair23.me; helo=fout-b2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

On 16/6/26 22:33, Daniel Henrique Barboza wrote:
> 
> 
> On 6/11/2026 9:37 AM, Alistair Francis wrote:
>> Hey,
>>
>> The current state of QEMU RISC-V is very swamped. It's mostly only me 
>> reviewing patches (Daniel does review a lot as well) and I don't have 
>> time to get to everything.
>>
>> So I wanted to propose some stricter requirements on upstreaming 
>> features. The idea being that we can improve the quality which should 
>> reduce review burden and also help filter out some stuff that maybe 
>> doesn't need to go upstream.
>>
>> The idea would be to extend our https://wiki.qemu.org/Documentation/ 
>> Platforms/RISCV#RISC-V_Foundation_Extensions section to be the following.
>>
>> """
>> As RISC-V has a huge range of possible extensions, QEMU has guidelines 
>> for supporting them all.
>>
>> If an extension is frozen or ratified by the RISC-V foundation, it can 
>> be upstreamed to QEMU. Generally we will try to support as many 
>> versions as feasible, following the usual QEMU deprecation policy to 
>> remove old versions. We take efforts not to remove ratified extensions.
>>
>> As there are so many extensions and so few reviewers for QEMU RISC-V 
>> we do have some extra requirements at the moment. All new extensions 
>> much include unit tests. This will require testing the new 
>> instructions and/or CSR accesses, most likely by adding test cases to 
>> `tests/tcg/`. We also require all new extensions to have a 
>> justification of why they should be added. This helps reviewers 
>> allocate time. Examples of reasons would be: "my hardware xxx is 
>> shipping with this extension", "it is required for xxx profile", "it 
>> enables this cool and useful feature". Being an official RISC-V 
>> extension is not enough of a justification at this time.
> 
> I believe most of the features being contributed fall in the "this is a
> cool and useful feature" in the end, so hopefully we don't need to ask
> people about 'what hardware are you trying to support' ... sometimes we'll
> contribute stuff that is related to HW that can't be disclosed ATM, but if
> the feature is useful for everyone that shouldn't be a blocker.
> 
> To be honest I wouldn't mention "my hardware xxx is shipping with this new
> extension" in the doc.  If the code is good and it's a useful feature and
> has test cases I believe that's enough.  This wording can be intimidating
> and scare away what would be legitimate contributions otherwise.
> 
> 
>>
>> If an official RISC-V foundation extension is in a reasonable draft 
>> state, that is not too many changes are still expected, it can be 
>> supported experimentally by QEMU. Experimental support means it must 
>> be disabled by default and marked with a "x-" in the user facing CPU/ 
>> board properties. Draft extensions must also include unit tests and a 
>> justification of why we should support it.
>>
>> Note that official RISC-V foundation drafts must be hosted by RVI and 
>> the code must be developed against the latest tag. The QEMU series 
>> must point to the exact spec used for the extension
>>
>> Draft extensions should also try to include the version information in 
>> the property. Draft extensions can be enabled by specific CPUs or 
>> boards if the hardware supports that extension.
>>
>> QEMU will only support the latest version of patches submitted for a 
>> draft extension. A draft extension can also be removed at any time and 
>> does not follow QEMU's deprecation policy.
>> """

Finally got a chance to update these after our last discussion:

"""
As RISC-V has a huge range of possible extensions, QEMU has guidelines 
for supporting them all.

If an extension is frozen or ratified by the RISC-V foundation, it can 
be upstreamed to QEMU. Generally we will try to support as many versions 
as feasible, following the usual QEMU deprecation policy to remove old 
versions. We take efforts not to remove ratified extensions.

As there are so many extensions and so few reviewers for QEMU RISC-V we 
do have some extra requirements at the moment. The more of these you can 
meet the easier the review process will be.

We want to see clear users of the extension. For example links to the 
patches submitted to upstream compilers, toolchains or kernels. As QEMU 
is generally one of the first projects to receive support the features 
we don't need support to be upstrema in other projects, but being able 
to link to posted GCC patches (for example) supporting your extension 
indicate that the extension has been tested and will be used.

All new extensions much include unit tests. This will require testing 
the new instructions and/or CSR accesses, most likely by adding test 
cases to `tests/tcg/`.

If an official RISC-V foundation extension is in a reasonable draft 
state, that is not too many changes are still expected, it can be 
supported experimentally by QEMU. Experimental support means it must be 
disabled by default and marked with a "x-" in the user facing CPU/board 
properties. Draft extensions must also include unit tests and a 
justification of why we should support it.

Note that official RISC-V foundation drafts must be hosted by RVI and 
the code must be developed against the latest tag. The QEMU series must 
point to the exact spec used for the extension

Draft extensions should also try to include the version information in 
the property. Draft extensions can be enabled by specific CPUs or boards 
if the hardware supports that extension.

QEMU will only support the latest version of patches submitted for a 
draft extension. A draft extension can also be removed at any time and 
does not follow QEMU's deprecation policy.
"""

Alistair

>>
>> I'm also thinking about extending https://wiki.qemu.org/Documentation/ 
>> Platforms/RISCV#RISC-V_Machines
>>
>> """
>> As RISC-V Machines are user facing they follow QEMU's deprecation 
>> policy. Backwards incompatible changes should be avoided, but that is 
>> somewhat board dependent. For example soft core boards (like 
>> OpenTitan) are in flux and likely to change while the `virt` board is 
>> fixed to allow developers to target a stable machine.
>>
>> Adding new features to boards is acceptable as that doesn't break 
>> existing users.
>>
>> When new features are added there should be a justification as to why 
>> we want this feature.
>>
>> Where possible boards based on physical hardware should model the 
>> hardware as closely as possible. Information (ideally a datasheet) 
>> should also be provided to provide technical details about the hardware.
>>
>> Machines that aren't maintained and/or used will be deprecated. 
>> Submitters are expected to help maintain the machine after it has been 
>> accepted.
>>
>> All new boards must include a boot test to boot a guest on the board. 
>> Generally if the board supports Linux then the boot test should boot 
>> Linux on the board.
>> """
> 
> Agree with everything else here
> 
>>
>> Any thoughts or comments on these?
> 
> Reviews are a problem everywhere, not just qemu-riscv, so we can take 
> solace
> in that I guess.
> 
> 
> Cheers,
> Daniel
> 
>>
>> Alistair
>>
>>
> 


