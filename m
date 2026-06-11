Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2B7CD98CE
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 12:38:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wXefa-0003TH-IW; Thu, 11 Jun 2026 08:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wXefZ-0003Sy-4y
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 08:38:01 -0400
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wXefW-0004rK-16
 for qemu-riscv@nongnu.org; Thu, 11 Jun 2026 08:38:00 -0400
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 671901D001A3
 for <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 08:37:56 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 11 Jun 2026 08:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm1; t=1781181476; x=1781267876; bh=Dc
 wLD5rjA30of6nylUV4nqSOjUjTRT6x4gEcElWHcIk=; b=pOWcqZtjs5UT3uYi36
 qqR8ymDoEm9SpzvSlbufbRoF3S6B/ni6kVTJGwpi9R4F/c8l/KvWudlYMq9RP+I/
 FHajZ35fcV0xB+908VsCL8qv3GeHEW9iDFcMQqqsOVPufEBKqxbdFUixM/lW4J2e
 xmnRrolK44gl0+J4esygONYbFMe9RKRGS64tEpqLTCOUM9QNPvGuPCkhEhfg/czS
 2HO8qGsp2imuqVaB/4SQdcVEmEE8yZ0u6zXJldZMLLGDbMUgkNygHhnH/2Z6yFAO
 yLalLp0qGr4RVBGOPMFw8eY9SUWKzrhZcgUWKxGVx6UthUlBFZ5nRGculZAY2STU
 hO2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1781181476; x=1781267876; bh=DcwLD5rjA30of6nylUV4nqSOjUjTRT6x4gE
 cElWHcIk=; b=Yq2JhLkwQ5GzQSUFGUXpmvT0mpV5F5gwhm0m+NmxFkhnPn9H+cG
 qjVl6Z55kxOhIbOmXjftZVXzE3BBzCm3Joeop5tuUOdvEG6CohMenvWdgoyHMAKC
 47N7i+GZckT1didtaf2oSmyogZVDVvb3+Ojg3qDNAvEIJm9Kg65/J8viDnTjkIQL
 GX2F3BIIXWRrRbvhZhkWUxu622s5DLk/4S4edjotbLrswBBUIAvbkmk6qHlXG+Ks
 1YqAkLRvHzyObtZ1WZlUR15krcjUbLyB1t+y5Xf/RlzGKyz13pJrD1a/auwK4Nnu
 YzqVL2RFc9m1qNbSbFpVrK7I7aNp/BzIpzA==
X-ME-Sender: <xms:JKwqamKBKDGHUzIy6wvEB4R9emOj66QQq3-Q_L8xeuXyVMID-WzNuA>
 <xme:JKwqakC0cge3awRjKJwD0HLCaxFpnV_rVowt3x5BpnhsfbwqhwOb8QPdR2MOO4NQ8
 _JZLF3S9pfLeDaf1YlR9WcMp0-5zR49FGE1KhjvMoWxgxURW1myog>
X-ME-Received: <xmr:JKwqahwMee1EvndKc5LWUVUgxMIDFAH85hgWl89iMpnZbEIOWDbnGV1d5vKY4Zh2Lw>
X-ME-Proxy-Cause: dmFkZTFnabU1R/LSFcRfkOgtibdnawTTX8EU1QQSmPt4cElZ8QIw6YuaovE1gZY1DDz0JZ
 QHr7VzcHnLGd5xG3E/r4QoY3EpVTCX2fwV+33jX3FprayrG8PoKhi2x81DtWrH282vM0v1
 abHP//57q5Dgx2F3rqC7PpPdjWXDZuL53FXVGM9b8W8Isq0Je5ljpUqNW9SMaZmOtig/g1
 hksVu55IBO6iIVnuDSQKhlEpHkIbL2hl8QzzzZi8xrOROtcsCiuLRY2AR2zXA2x6IniJK8
 uTWO6bVYvVs5CQ6TVDjWj3/RweQ5rcB+vCcZnddEfWIlBM/CEmA1/xL3yc/jddDTQ3Ehlh
 7zY2/4rVf/X87gN9YDGNfr+xpNadlAVAfhJCmgeDDiqq+PPjWDEdcZe5oN0jwU3eQ8sQda
 pBvJccN4tYW4oPaeMkFfRDdnT6jwgZayrfACh8SyNhFDZPY1uQJc3WAjKya0dNZhRe0/EY
 gcdEr65EXuDiOJBSsVMnpMj2ITZzhoI8Upb+OV0P7tbkk4TnSk8ofaU+6zLBvfXHUlpdEo
 D0nLqcuvmBqUY+QElNhlPoveFCvb7K0RK6gpH/wBi+8MdRAkAfifyjhhtb/kUmNjWs6sv4
 hW2RL1sXV3gTiacAI2YyYq9Oz8MlgBqYrCBHW7jNd5vgpeSpNW1KRL+6iP+w
X-ME-Proxy: <xmx:JKwqaoNk2_XLu2X4aRnpKjV-xa52FkzSuPLPbOXihRAI5sbZbK5hgw>
 <xmx:JKwqag_pnYnJ-rX761pfs5cgQ8ql9ZZEP_7zlmuiH1DoYsYSfL_Xvw>
 <xmx:JKwqaoo26bu2_c1Xw5Yzl-N4M8gcQD_EDPthiqkJTsazLiWA7A8lJg>
 <xmx:JKwqai4qqR36XkBLkXkQ03lo36XAolqWb-_u5_vuiz7-V5vVxaBE0A>
 <xmx:JKwqap5ENB2efxBeDomPT9mi37xlrgPBWaoqNxjqSwa-qzzh1kSRiKYU>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <qemu-riscv@nongnu.org>; Thu, 11 Jun 2026 08:37:55 -0400 (EDT)
Message-ID: <057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me>
Date: Thu, 11 Jun 2026 22:37:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-AU
To: qemu-riscv@nongnu.org
From: Alistair Francis <alistair@alistair23.me>
Subject: RISC-V Code Policy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hey,

The current state of QEMU RISC-V is very swamped. It's mostly only me 
reviewing patches (Daniel does review a lot as well) and I don't have 
time to get to everything.

So I wanted to propose some stricter requirements on upstreaming 
features. The idea being that we can improve the quality which should 
reduce review burden and also help filter out some stuff that maybe 
doesn't need to go upstream.

The idea would be to extend our 
https://wiki.qemu.org/Documentation/Platforms/RISCV#RISC-V_Foundation_Extensions 
section to be the following.

"""
As RISC-V has a huge range of possible extensions, QEMU has guidelines 
for supporting them all.

If an extension is frozen or ratified by the RISC-V foundation, it can 
be upstreamed to QEMU. Generally we will try to support as many versions 
as feasible, following the usual QEMU deprecation policy to remove old 
versions. We take efforts not to remove ratified extensions.

As there are so many extensions and so few reviewers for QEMU RISC-V we 
do have some extra requirements at the moment. All new extensions much 
include unit tests. This will require testing the new instructions 
and/or CSR accesses, most likely by adding test cases to `tests/tcg/`. 
We also require all new extensions to have a justification of why they 
should be added. This helps reviewers allocate time. Examples of reasons 
would be: "my hardware xxx is shipping with this extension", "it is 
required for xxx profile", "it enables this cool and useful feature". 
Being an official RISC-V extension is not enough of a justification at 
this time.

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

I'm also thinking about extending 
https://wiki.qemu.org/Documentation/Platforms/RISCV#RISC-V_Machines

"""
As RISC-V Machines are user facing they follow QEMU's deprecation 
policy. Backwards incompatible changes should be avoided, but that is 
somewhat board dependent. For example soft core boards (like OpenTitan) 
are in flux and likely to change while the `virt` board is fixed to 
allow developers to target a stable machine.

Adding new features to boards is acceptable as that doesn't break 
existing users.

When new features are added there should be a justification as to why we 
want this feature.

Where possible boards based on physical hardware should model the 
hardware as closely as possible. Information (ideally a datasheet) 
should also be provided to provide technical details about the hardware.

Machines that aren't maintained and/or used will be deprecated. 
Submitters are expected to help maintain the machine after it has been 
accepted.

All new boards must include a boot test to boot a guest on the board. 
Generally if the board supports Linux then the boot test should boot 
Linux on the board.
"""

Any thoughts or comments on these?

Alistair


