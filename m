Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5952CD5BD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 01:57:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTrtq-0000yz-Kb; Sun, 31 May 2026 21:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wTrtp-0000yr-H7
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 21:57:05 -0400
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wTrtn-0002ec-MK
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 21:57:05 -0400
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id EF378EC00A2;
 Sun, 31 May 2026 21:57:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Sun, 31 May 2026 21:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1780279020; x=1780365420; bh=2iQ0Q2Qf/OmXC6ap6UBK55XXQDI9S+Ku
 xqaVu+QhTMg=; b=W8WVNu6Dzrts5hhWxeRNAp4HXE5kmDThsXrj86b+2KZrUv8e
 L3nBI4Y2lBRTzJVHfAd66iS8aVJpdSaJbFvUtY/6nzDa+geZ0FGssCgZjDdICRwZ
 IyDtUyZdxpDVHfNJCDKHmqt8C676Txgh3v/NBEW5yFgPaMbGivTV6T3B4zJGOBwI
 u/BVki92Wlwz9/wIE3qfPUK8F/zR6UXsbaUml/06MBgTZR5uPd8WSjBCwFvWCNl8
 8sF1Fo2Vf/oGBvvtekIUm6t9T2K0zDYL20LFkiOhXZ4oD3HDXMEJlWvmbaTpmx7U
 0WbbPpDNS/1eAo3G7nIkqurTCVE/sP0nmg9lFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780279020; x=
 1780365420; bh=2iQ0Q2Qf/OmXC6ap6UBK55XXQDI9S+KuxqaVu+QhTMg=; b=o
 FsG1ReFPTueBfXc30QpXfRa1YsVvPC4bWZhyf9YeAAQnsMuXl+MYxVDcnFfk7hBm
 kDYQC0/a1UXR8nlqfRSy5tLuV1BDzrdHq7mOh2Tj7m4+A5pifdjlTm9vAxLpJ1dr
 6gxr58OEExLp6XnqtuEqlCYdOu8C9KrUqN5EfiFpw1i0gT4GvS0SefnleHY7ePZV
 pUPBMqVWFeoRwAPT1z0o3GcVs5weVczITe4igwQ087zQTW00WcxRUC0NhGoKrfkp
 xLGrbVY1MscnszuIDGzTkvDxzCPclgEqaPFsXt2fAX5sZ8caNR4kQJ59llCt4dMG
 O4NMLuw7msDFYwL028YrA==
X-ME-Sender: <xms:7OYcag5OdvoXdus3mpw6qc3DUgf66cS53Py3AjD8Fmgq2FSGyG_Kpg>
 <xme:7OYcapXHObkzTgEXRIHDcdzfP3WDdgw2KKd9WvAQBD6BCayYJAU7nfFotKGdasK83
 XZRcqegWtBwacvavkQmCApNW4pzI8a-F2Tn1GOWEa31r72y77XI9YI>
X-ME-Received: <xmr:7OYcas3gwy6J3i1WV-YbK7apyGh7N3FFOUOipvY8ZvspWBbeu1KX13U-IcszKbhIdA>
X-ME-Proxy-Cause: dmFkZTEE9txAzEAby1qC7oNAxqZuIOsUVS5TzocrfTgVZLMpd5i8hd/8npLlZbM+Qy1+dp
 ZQDiUeXzGDnsK85mO5pSPDxSuURhr5LuXUxByyUYvMDRD6i14ImwQHNf0+gkuxQomHjOx5
 E+V1HkrhG7i4SRgJzLr7jhglhhR7xL/PYKHjOFxzW39vlkbjc9X3IUiRbJIUpMCxI/W94m
 hawcVoNa5qRUfPwFWvdVHQSncLHQPbbbZqxTHDAfJ7t7Ft1DGAwB/7dWFHGyCa87koTDKc
 lyy21AmG1hA770qXFcmB6aS1gB/3CeOTnEOs6siMgbahyfTqFkinnztOo7wXMYpZAp5eKj
 KO8jn0e6uoPhGJhkkWPJSv/qrfRIUfnABuQJwXmc+x54fDcITW3YwgQEWzKDoO6BV/FAAk
 OadAodtH7S50+DTcYS6nSXa3ew/FAZmFc8QMb0VfBVvE0ni7v+pIvUMMAiUBqNIBPsbxRM
 sI+lmstM9mGM06n0nulpCmZHh83jkTvmQU5jTyQxaR4X2o2SnA0R9ex/ef4pSQ/6oZ2C3b
 ohmZBEaM+VELdw3uv/M8yZN45vIo5/0YpeHhMUphRQS6YIsUhIDrKEt9Ah86QX05WXBowd
 tLHTDxri2QaIDOZvaBt0oW7S5S09dQcxDErrjEQ6hDteDWIaS/H8bEPO7Naw
X-ME-Proxy: <xmx:7OYcau1oJdEta99S5vldJSl0icZXky9Yyn94XyiQJftJa1EM8k6ZJg>
 <xmx:7OYcan8WEFQ5AcJXIYWP7sCtcdN_5FtR-xVVf4401G3KEhuzVL_Saw>
 <xmx:7OYcaj0vtSgPSjW5_CH8dxHWXnxhCpZX3-EqmrA23e7-UdgAZUr9-w>
 <xmx:7OYcas_0pP0FVOKv4KIi5up-Xw6YyEuewassE_WaOnVvRLUmtkNsjw>
 <xmx:7OYcasz0frisiu0LTi8QyVbgBtlHMTuHiT1IXOqfliCivBSaPbgCCIU->
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 31 May 2026 21:56:59 -0400 (EDT)
Message-ID: <3c88b75c-3658-4516-a655-d500de323d8c@alistair23.me>
Date: Mon, 1 Jun 2026 11:56:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QEMU RISC-V Call
From: Alistair Francis <alistair@alistair23.me>
To: Max Chou <max.chou@sifive.com>
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-riscv@nongnu.org
References: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
 <6e25408f-662c-4cd9-93b7-35ea100c81fb@oss.qualcomm.com>
 <81a5c280-973d-4ada-b2f3-3ac4652a2037@app.fastmail.com>
 <ahkrD2h1kaubNtXq@sifive.com>
 <443d2b53-a613-4d46-b750-3a22aa72f67c@app.fastmail.com>
Content-Language: en-AU
In-Reply-To: <443d2b53-a613-4d46-b750-3a22aa72f67c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=103.168.172.151;
 envelope-from=alistair@alistair23.me; helo=fout-a8-smtp.messagingengine.com
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



On 30/5/26 20:43, Alistair wrote:
> On Fri, 29 May 2026, at 4:00 PM, Max Chou wrote:
>> On 2026-05-28 21:37, Alistair wrote:
>>> On Thu, 28 May 2026, at 5:13 AM, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 5/27/2026 9:15 AM, Alistair Francis wrote:
>>>>> Hello everyone,
>>>>>
>>>>> There has been some interest recently about setting up a call to discuss QEMU RISC-V and the current status.
>>>>>
>>>>> So I wanted to setup a chat next week AEST (UTC+10) time to discuss a few things on a call.
>>>>>
>>>>> I was thinking 1PM on Monday the 1st of June.
>>>>
>>>> Can we make it 10AM AEST?
>>>
>>> Sure! Let's do that
>>
>> Both work for me. Thx
> 
> Great! I'll send a meeting link out on Monday.

Hello everyone,

We had the meeting today.

A few of my key takeaways after the meeting:

  * We need a new stricter extension requirement as there are just too 
many extensions being submitted.
     * I'm thinking requiring upstream tests to use the extension and at 
least some proof the extension is used and provides value before it is 
reviewed. Thoughts?
  * Someone? Tenstorrent? will submit documentation to QEMU to describe 
a few key Vector options that people should test their code against
  * Joel to send Sdtrig patches supporting both debug spec versions. 
Otherwsie deprecate current 0.13 version
  * Anton to send vector patches
  * Schedule these regularly, but not on a Monday. How about 10AM (so 
same time) on a Wednesday?


Portia kindly took notes that are below:


QEMU Community Meeting Notes

QEMU RISC-V extension policies
* There are too many extensions coming through and cannot keep up with 
reviews.
* Is there even code that runs using them?
* Discussed requiring some test as part of accepting these, TCG test or 
kvm unit tests
     * RVI is supposed to do compliance test, we could ask for these 
tests, but they generally don't seem to exist
* Discussed having deprecation scheduled but the burden is on submission 
not maintainance.

Vector cross implementation issue
* There is a lot of optionality in the architecture but most software is 
just being developed against the RVS32 and QEMU defaults.
     * For example, GPG Is broken on the K3 since it has a non. 128 
vector length.
* Suggested having a fuzzer CPU option to run which would randomize 
certain profile compliant options
     * All options are already available in the command line so this 
doesn’t add much, just makes it easier for people to test more options
* Silicon companies have some test vectors of this but it doesn’t help 
the fact that upstream developers don’t use these options.
* Write QEMU documentation (wiki or docs) with 3-5 combinations that it 
is recommended to test against.
     * Projects can be pointed at this for CI

Upstream issues
* sdtrig debug patches
     * There are two ratified debug specs, 1.0 and 0.13. They are 
incompatible, all sdtrig patches break the previous ratified version.
     * stdtrig is needed to be profile compatible so there is a push to 
remove 0.13.
     * Joel is working on adding Sdtrig support while supporting 0.13 as 
well.

* Vector bugs found from trace matching
     * Have found QEMU bugs from trace matching to emulation platforms 
are they upstreamable? It can be useful for finding QEMU bugs.
     * Vector is really slow , would be wary if it impacts performance
     * Don’t want more custom options, try and send patches that tweak 
QEMU's implementation to be more like real hardware without optionality.

Alistair


> 
> Alistair
> 
>>
>> rnax
>>


