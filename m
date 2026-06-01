Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73110CD6E56
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 01:59:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTrwK-0001Z0-AX; Sun, 31 May 2026 21:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wTrwI-0001YB-2i
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 21:59:38 -0400
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wTrwG-0003lI-GD
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 21:59:37 -0400
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 03EFAEC00BD;
 Sun, 31 May 2026 21:59:36 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Sun, 31 May 2026 21:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1780279176; x=1780365576; bh=oH7ftioeWH0RukR+IslbIDwwXDxnPHVU
 s5DJZNo8Y+A=; b=AHWPp8WLMpKjXO/0K6kjmbDs+v5uorVxDUpczeW3azAg9tOW
 Idokw0Z8GHW1fE9o4BPapBJjEkJBNudzLNGd6QdPxJenX3PIKVNN28p0K42g7k0m
 UpZ0TvtefV9vVnw0onGN0iaq/NWcnHL+ohnB3HPHT1k637FO4/XaDsZhoie1OzzK
 xZ2/i/ng7AOiakATzPR01u4stuHdZH5bEQ6uEMrlOHAISuzJIqQ1Lr5n5TbsJlwH
 0FQi4IsA6qRgqprxrBd/WuQBe8GclzDrGbEpOZeaYvka+vfO5vPcA9P1eEsW4ToM
 j87u8I+MJeYMNeyI+goiXeFvAh5c+DTHnv4amA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1780279176; x=
 1780365576; bh=oH7ftioeWH0RukR+IslbIDwwXDxnPHVUs5DJZNo8Y+A=; b=Z
 5AvwrsL6vN022nVImX9IxIw+oKi/Du3lzF/LuKN1EFqOHaQSykeJovJ0YDk6d5bY
 1legOv0+YWLI7ymyu/qjV+EGMkBmibXowxkVixy6HXRgCzznLDojik5x7h1qWwPY
 z/8/lrn3XjMRD+lTnW+ShUZcZq43x4u47PcLsHXs+VjGz0Tr+MRjl9y4tuBhCgoS
 vP9LfNptKxcHbHhMPHZbvvYk0hgen4bNfPnAVLpVPugFbx4KcXxE0aZku5F1VJdG
 St7aWp9yJp0UvMNdj2KP2+aZUf8NyktuzrT/vVhQD76U0dJArpwg3GVmCM1LtRZY
 5M/PPxNcHOz1WwQk4Ar5g==
X-ME-Sender: <xms:h-ccagpeRLmM5yJ_gVeGQCdAVajs8tcojjkODqrVn-S-8vGXCBHwzg>
 <xme:h-ccauH9ol265_QeW_URZprDN8XMV188MgpeeU56a17lVLqzR1Qs2D8Pi8wy3XgBd
 AvKfKEqlwq7VPLeqb2VHBczBITroPlIT9nrDzxZ_RH-UnQx4PcIln4>
X-ME-Received: <xmr:h-ccailHaKyyhh-uA8b4K2uaaWorhI4saCFKHmko6_WN1Y2Q_sDEtBaTSiXsus_xKQ>
X-ME-Proxy-Cause: dmFkZTFW7nnk0vD/6DJ/Y3qBoJBSEu+bhs/EsrAHSDViQSKEz0wQ9+RovygB25vTY76GtK
 iMz5VNKLkHmsqm5n3RWOzxtofgKSliIgGxMWApbEMFgMnbpmI/PCqIs+irnYaQkhcRdXGR
 VS8opRwCrHPIP1KyD8a+5c9h7ZUPjmNOYRdaBsMZrHrFJPdYLlC110ovqsTlqN2CYevNOP
 pYNJyIsWpMREgGvfXv0OrpdZZUu8pLX52LZUG4sf/wG1GryCQL4nXAG9gBKxk+8Aqpx31W
 TldTrXNaiG4Cb7RRz9tqQrqwK8P7WT0HvCUVmekgFj1eRsSpcDTxW/U126rHPqRC8FzTca
 8ek1lluDAluyxq2IoOqcA3g3PTh+6t4cgnmvytE7gFBryrHK8fo8tTnWPb3mFVGndBqKVC
 mNK06X7xApdwsgxHWyrnRCswIcEGatxWL58Y0iKyn3TeI6RN/BkIpPvPTBIeRIbqVkbphW
 h+LofrfxrFvc8nOBkUKMnE6NIiyiVkO8p3swI8n0pBGmqVCXL17wI4rTQYqSSNWF9NZo5h
 BlGedoKgAa2x2PgKrlPjupkDA8xDi58gpqDvTLLCCfrjMqoYgBYVdThpv8KZND3A6AvW5B
 QP8LpLmwgTiDquZ/Un+6AftL51ynjJpK+2StZSH1RL73lmrcssaruwoCsd0g
X-ME-Proxy: <xmx:h-ccahmm6yjMra-GnBN-p4SBRk77tKM2lZFWlPHNbFMtG0-nCNxxMQ>
 <xmx:h-ccajuq_Vpcb7nofzRRMQRDalIYvawozoSIo4izYtBR_AOnddS9yA>
 <xmx:h-ccakn-58em1Zou8eKpJRk5hlX16PpveIP4H-JO6kEEbOLjSWa1uA>
 <xmx:h-ccauvkW7PMdVzVVf7qPtJPnHsmjoUNcek7LeRlvSPEiXR08H2DKQ>
 <xmx:iOccavjg2N5huLwA_kdHsESybW_nDoBPxL_qbGXv3Vtf3Zcetb-tYgUv>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 31 May 2026 21:59:34 -0400 (EDT)
Message-ID: <1c6d6195-107d-42e2-858d-f9f395de6617@alistair23.me>
Date: Mon, 1 Jun 2026 11:59:32 +1000
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
 <3c88b75c-3658-4516-a655-d500de323d8c@alistair23.me>
Content-Language: en-AU
In-Reply-To: <3c88b75c-3658-4516-a655-d500de323d8c@alistair23.me>
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



On 1/6/26 11:56, Alistair Francis wrote:
> 
> 
> On 30/5/26 20:43, Alistair wrote:
>> On Fri, 29 May 2026, at 4:00 PM, Max Chou wrote:
>>> On 2026-05-28 21:37, Alistair wrote:
>>>> On Thu, 28 May 2026, at 5:13 AM, Daniel Henrique Barboza wrote:
>>>>>
>>>>>
>>>>> On 5/27/2026 9:15 AM, Alistair Francis wrote:
>>>>>> Hello everyone,
>>>>>>
>>>>>> There has been some interest recently about setting up a call to 
>>>>>> discuss QEMU RISC-V and the current status.
>>>>>>
>>>>>> So I wanted to setup a chat next week AEST (UTC+10) time to 
>>>>>> discuss a few things on a call.
>>>>>>
>>>>>> I was thinking 1PM on Monday the 1st of June.
>>>>>
>>>>> Can we make it 10AM AEST?
>>>>
>>>> Sure! Let's do that
>>>
>>> Both work for me. Thx
>>
>> Great! I'll send a meeting link out on Monday.
> 
> Hello everyone,
> 
> We had the meeting today.
> 
> A few of my key takeaways after the meeting:
> 
>   * We need a new stricter extension requirement as there are just too 
> many extensions being submitted.
>      * I'm thinking requiring upstream tests to use the extension and at 
> least some proof the extension is used and provides value before it is 
> reviewed. Thoughts?
>   * Someone? Tenstorrent? will submit documentation to QEMU to describe 
> a few key Vector options that people should test their code against
>   * Joel to send Sdtrig patches supporting both debug spec versions. 
> Otherwsie deprecate current 0.13 version

Whoops, I think this is Nick

Alistair

>   * Anton to send vector patches
>   * Schedule these regularly, but not on a Monday. How about 10AM (so 
> same time) on a Wednesday?
> 
> 
> Portia kindly took notes that are below:
> 
> 
> QEMU Community Meeting Notes
> 
> QEMU RISC-V extension policies
> * There are too many extensions coming through and cannot keep up with 
> reviews.
> * Is there even code that runs using them?
> * Discussed requiring some test as part of accepting these, TCG test or 
> kvm unit tests
>      * RVI is supposed to do compliance test, we could ask for these 
> tests, but they generally don't seem to exist
> * Discussed having deprecation scheduled but the burden is on submission 
> not maintainance.
> 
> Vector cross implementation issue
> * There is a lot of optionality in the architecture but most software is 
> just being developed against the RVS32 and QEMU defaults.
>      * For example, GPG Is broken on the K3 since it has a non. 128 
> vector length.
> * Suggested having a fuzzer CPU option to run which would randomize 
> certain profile compliant options
>      * All options are already available in the command line so this 
> doesn’t add much, just makes it easier for people to test more options
> * Silicon companies have some test vectors of this but it doesn’t help 
> the fact that upstream developers don’t use these options.
> * Write QEMU documentation (wiki or docs) with 3-5 combinations that it 
> is recommended to test against.
>      * Projects can be pointed at this for CI
> 
> Upstream issues
> * sdtrig debug patches
>      * There are two ratified debug specs, 1.0 and 0.13. They are 
> incompatible, all sdtrig patches break the previous ratified version.
>      * stdtrig is needed to be profile compatible so there is a push to 
> remove 0.13.
>      * Joel is working on adding Sdtrig support while supporting 0.13 as 
> well.
> 
> * Vector bugs found from trace matching
>      * Have found QEMU bugs from trace matching to emulation platforms 
> are they upstreamable? It can be useful for finding QEMU bugs.
>      * Vector is really slow , would be wary if it impacts performance
>      * Don’t want more custom options, try and send patches that tweak 
> QEMU's implementation to be more like real hardware without optionality.
> 
> Alistair
> 
> 
>>
>> Alistair
>>
>>>
>>> rnax
>>>
> 


