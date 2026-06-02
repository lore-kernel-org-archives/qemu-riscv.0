Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8F9CD6E56
	for <qemu-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 02:05:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUEVa-0006aK-I1; Mon, 01 Jun 2026 22:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wUEVY-0006Wf-6l
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 22:05:32 -0400
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wUEVW-0001Qt-69
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 22:05:31 -0400
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 9B37114001A6;
 Mon,  1 Jun 2026 22:05:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Mon, 01 Jun 2026 22:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm1;
 t=1780365929; x=1780452329; bh=kA9c1H2S3QHOiDG2k2ekvwP+S+xYu3ts
 Bkc/NhVnlNY=; b=gX9kRKZPn4CR50E03Uh0ZXMAUW65eBeX/sS54LiZTaIl9pQv
 CIiJ1EsKqF7qFrA5KnUNe2WuDq3pa3tvVoNUUSYmZTEMrs22VPRncmATdIsB5rwm
 eYSZrYGK3gue8WGzVi9tYZzgZnpDTvsKR4QKdPL/aTnMwGJBFOzg8I1Xn7Sac4o5
 7kBE82K5BkHzW95xQaIsmSKJMtmrlw/EF6oY1MCTafc13Vpn0LZtliDR2F8yInLH
 pfhNTsvg3YR/KUtuezJg7aWme/6ncIOYp3Lzma0nUAGb4D+04zuMQfPlQHvS7sMO
 NNSC+p16xfwjkRtgFBDtZRlfw4xGBwGpJp9RHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780365929; x=
 1780452329; bh=kA9c1H2S3QHOiDG2k2ekvwP+S+xYu3tsBkc/NhVnlNY=; b=O
 FzIs0XAZs5sSSN++Z5ykKjaTpsXwpxyXRq5kyevB7P/XWHRs2JcTU9+KTHTkcD78
 +6/NKOC8IqodXQnhKEC1EjSpq1OXk3Y7BntPxXioRDVgo+X3Fa29RTpUQAtk2dyn
 RiEy2rNyec0itr2CC0Dekp2aM+46Pj9FhA3CFfLlsAQp8/sr6Ub2TFARYjCdN85u
 J13LC8wgk09GIXcj8J2dQvlJr0qBxgbW05qHcakgoHFEHPkYUmp80wEbVJSGJp9o
 rZbk6dZ7at3kR5BzLgyOCF6rzeiCEpiKjoYjbOXAOktZwjAPzLEIJhJrP5SftvCI
 3pFJkqkSzokl7PX4J/pPA==
X-ME-Sender: <xms:aToeanFhejSV7v2hepDEmSd541xZlbrb6SEc6miULXRLWrLsMU67WQ>
 <xme:aToeagrwfd874KNzYmqkp5sl9_o-EKPB8xo3XMgzgmqZsXwEvD524ptRNfShu_osb
 FqfsXudzegvxwOJvGezDQzmqH4Bo7MfpecxoClmZzJnE8RvDfXQ55tP>
X-ME-Received: <xmr:aToear45f1Joi1c-BAoCRp6VP3wUqvwV97QBvD9nEClGJ5p0Qj4iQTiWeOGoVchebw>
X-ME-Proxy-Cause: dmFkZTFaNZqhvWgKfQPOvVkpc2IRF6LL6p/ILZPbq4AgaPlE0xBz4SR54xNrF5JaD0sZoL
 aOy4fbMRYlEEFT0QPs23MVYxSwPCltXiyDwOKqu6oILPKXM4pipspXbdHNhTwCw+iowxo4
 KQNdRmZUn/6rx7h4foUZtZXAu8zQGhhFaxskh/a+B9NIHVjHFy0cwrJGHm4omjGwdQMyuL
 NrVoDmZJlT9mVn7otdq4poIumDDiBESxhJFULkAch59KM8F3wV5B70HqTMW7EFyGmt+hir
 OqMR+yDU0KkGZkVF21YlF/sFev5JfmNpBtN1z1CPZCGWUjlVFI3CSYy50ZuFe6UlahXzHH
 Dxn2yC0mR6HOEOTZJ2kVkkFWLStfns6WDAaMu/9AiFGRaIhHbHS+Iq7TylJTuEbYydDOQD
 0XUG/ibyoQOBU3q5WadtpZ7cyYZnDqIDiM+bFNrGJcQvGq1WFJ1rvMnjn2sHyHmkH7Xcns
 PGuwhv4Sbf68oHzFY2ko43ifjAKjJIhaLK1tPvnPDtHEFtiRt9pS5Z/5jpGXxzL8O7qqwE
 +aq4xhIkKJY3I8ASTSGRpOCWQdP9gdNRUyKrvRgPZqBRkQcCE6pzXPe4+4ssgyOff6gky+
 GK9F1wFJ81Ssl7tOcF+Hz/oivBejDRUkU2eaxbmEY3G78bUYA2JAcz1ukLxw
X-ME-Proxy: <xmx:aToeam7px0XfIMabgnDtOU28DEaZWHjDouWQOQWYmn5EUHBU5DJQYQ>
 <xmx:aToeagEuiBsH0D7jWfk1AzipEhaZH5KKPY9Ar3uu_TQp0La2UMteYw>
 <xmx:aToeanTFFoGHXlBj1wZ2b2AXodrCcO1lXE9KO0ioJvorOLmzYh2ARg>
 <xmx:aToeahvIzvSGDSjKI5fumONs0wVEQjVd9nLf655WB1k8FhXHSeMkvg>
 <xmx:aToeakTz5OdptIxi5akzDwi9S1XW1ilQAZfhWtO9yqOsaaIXD63qzhAs>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Jun 2026 22:05:28 -0400 (EDT)
Message-ID: <21c348d5-ba86-46c0-ab37-130419db98bb@alistair23.me>
Date: Tue, 2 Jun 2026 12:05:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QEMU RISC-V Call
To: Chao Liu <chao.liu.zevorn@gmail.com>
Cc: qemu-riscv@nongnu.org
References: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
 <6e25408f-662c-4cd9-93b7-35ea100c81fb@oss.qualcomm.com>
 <81a5c280-973d-4ada-b2f3-3ac4652a2037@app.fastmail.com>
 <ahkrD2h1kaubNtXq@sifive.com>
 <443d2b53-a613-4d46-b750-3a22aa72f67c@app.fastmail.com>
 <3c88b75c-3658-4516-a655-d500de323d8c@alistair23.me>
 <ah1EuI-RI68I22Ow@ChaodeMacBook-Pro.local>
 <ah2VWgbZ33uUvahG@ChaodeMacBook-Pro.local>
Content-Language: en-AU
From: Alistair Francis <alistair@alistair23.me>
In-Reply-To: <ah2VWgbZ33uUvahG@ChaodeMacBook-Pro.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.159;
 envelope-from=alistair@alistair23.me; helo=fhigh-a8-smtp.messagingengine.com
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

On 2/6/26 00:26, Chao Liu wrote:
> cc: qemu-riscv
> On Mon, Jun 01, 2026 at 10:15:22PM +0800, Chao Liu wrote:
>> On Mon, Jun 01, 2026 at 11:56:57AM +0800, Alistair Francis wrote:
>>>
>>>
>>> On 30/5/26 20:43, Alistair wrote:
>>>> On Fri, 29 May 2026, at 4:00 PM, Max Chou wrote:
>>>>> On 2026-05-28 21:37, Alistair wrote:
>>>>>> On Thu, 28 May 2026, at 5:13 AM, Daniel Henrique Barboza wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 5/27/2026 9:15 AM, Alistair Francis wrote:
>>>>>>>> Hello everyone,
>>>>>>>>
>>>>>>>> There has been some interest recently about setting up a call to discuss QEMU RISC-V and the current status.
>>>>>>>>
>>>>>>>> So I wanted to setup a chat next week AEST (UTC+10) time to discuss a few things on a call.
>>>>>>>>
>>>>>>>> I was thinking 1PM on Monday the 1st of June.
>>>>>>>
>>>>>>> Can we make it 10AM AEST?
>>>>>>
>>>>>> Sure! Let's do that
>>>>>
>>>>> Both work for me. Thx
>>>>
>>>> Great! I'll send a meeting link out on Monday.
>>>
>>> Hello everyone,
>>>
>>> We had the meeting today.
>>>
>>> A few of my key takeaways after the meeting:
>>>
>>>   * We need a new stricter extension requirement as there are just too many
>>> extensions being submitted.
>>>      * I'm thinking requiring upstream tests to use the extension and at
>>> least some proof the extension is used and provides value before it is
>>> reviewed. Thoughts?
>>>   * Someone? Tenstorrent? will submit documentation to QEMU to describe a few
>>> key Vector options that people should test their code against
>>>   * Joel to send Sdtrig patches supporting both debug spec versions.
>>> Otherwsie deprecate current 0.13 version
>>>   * Anton to send vector patches
>>>   * Schedule these regularly, but not on a Monday. How about 10AM (so same
>>> time) on a Wednesday?
>>>
>>>
>>> Portia kindly took notes that are below:
>>>
>>>
>>> QEMU Community Meeting Notes
>>>
>>> QEMU RISC-V extension policies
>>> * There are too many extensions coming through and cannot keep up with
>>> reviews.
>>> * Is there even code that runs using them?
>>> * Discussed requiring some test as part of accepting these, TCG test or kvm
>>> unit tests
>>>      * RVI is supposed to do compliance test, we could ask for these tests,
>>> but they generally don't seem to exist
>>> * Discussed having deprecation scheduled but the burden is on submission not
>>> maintainance.
>>>
>>> Vector cross implementation issue
>>> * There is a lot of optionality in the architecture but most software is
>>> just being developed against the RVS32 and QEMU defaults.
>>>      * For example, GPG Is broken on the K3 since it has a non. 128 vector
>>> length.
>>> * Suggested having a fuzzer CPU option to run which would randomize certain
>>> profile compliant options
>>>      * All options are already available in the command line so this doesn’t
>>> add much, just makes it easier for people to test more options
>>> * Silicon companies have some test vectors of this but it doesn’t help the
>>> fact that upstream developers don’t use these options.
>>> * Write QEMU documentation (wiki or docs) with 3-5 combinations that it is
>>> recommended to test against.
>>>      * Projects can be pointed at this for CI
>>>
>>> Upstream issues
>>> * sdtrig debug patches
>>>      * There are two ratified debug specs, 1.0 and 0.13. They are
>>> incompatible, all sdtrig patches break the previous ratified version.
>>
>> Agreed, this direction makes sense to me.
>>
>> I have been working on upstreaming sdext and Debug Module 1.0 support,
>> and I will rework the series according to these requirements.

If it isn't too hard or messy to support both that's probably the best 
bet. Otherwise we can look at dropping "debug" support and replace it 
with sdtrig.

>>
>> In particular, I will split the Debug Module changes into smaller series
>> and provide sufficient test coverage.
>>
>> The sdext and Debug Module work had already been validated internally
>> at my previous company, Tecorigin, although that was based on QEMU 9.2.
>>
>>>      * stdtrig is needed to be profile compatible so there is a push to
>>> remove 0.13.
>>>      * Joel is working on adding Sdtrig support while supporting 0.13 as
>>> well.
>>>
>>
>> For the Debug Module series, I would prefer to continue on top of Joel’s
>> sdtrig compatibility work, since my patches also touch sdtrig.
>>
>> If possible, I would also like to sync with Joel on the approach.
>>
>> Alistair, do you have any thoughts on this?

Not really, see if you guys can standardise on one approach and go from 
there.

>>
>>> * Vector bugs found from trace matching
>>>      * Have found QEMU bugs from trace matching to emulation platforms are
>>> they upstreamable? It can be useful for finding QEMU bugs.
>>>      * Vector is really slow , would be wary if it impacts performance
>>
>> Do we plan to improve RVV emulation performance later?

I don't :)

>>
>> I did some work before based on Paolo Savini’s strided vector memory access
>> patches, with extra optimization and testing. But this kind of performance
>> change can easily break correctness, so I have been careful with it.

Patches are welcome, but we need to focus on correctness before performance.

>>
>> Given the vector bugs found by trace matching, maybe we should add more tests
>> first, such as TCG tests, before doing more RVV performance work.

That's a good idea. A better test coverage would help catch issues with 
future performance improvements.

Alistair

>>
>>>      * Don’t want more custom options, try and send patches that tweak QEMU's
>>> implementation to be more like real hardware without optionality.
>>>
>>
>> ---
>>
>> I was onboarding at my new company this morning, so I only caught the first half
>> of the meeting. Overall, it sounds good to me, and I’ll keep contributing upstream
>> as much as I can.
>>
>> Thanks,
>> Chao
>>> Alistair
>>>
>>>
>>>>
>>>> Alistair
>>>>
>>>>>
>>>>> rnax
>>>>>
>>>
>>>


