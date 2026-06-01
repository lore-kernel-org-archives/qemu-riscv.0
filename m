Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6005CD6E56
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 09:32:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTz0X-00042J-Av; Mon, 01 Jun 2026 05:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wTz0V-000426-4e
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 05:32:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wTz0Q-0000yI-QX
 for qemu-riscv@nongnu.org; Mon, 01 Jun 2026 05:32:24 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6517l1Ac201403
 for <qemu-riscv@nongnu.org>; Mon, 1 Jun 2026 09:32:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K/2WWlqEW0k7cOj699L5GqYdUxFcaUvN2CvYiAox0Ek=; b=SliNDVg9UTSQQZWm
 IpdwNHIMsjuaFqS4tGSznvyh+6ue0A8otZM1fXLvKVt1wI8Rqy62t0FXHIk0i8+3
 ahK/6QrLMDa1jykbXN7ZzuhmabByvDll442vhe3MN5rhVMaoiVLv4zEtW6xTb/fY
 oRFB5tr2t/MBpUNY0RBXeiO6fOYzC7jshCytN0wRuhj/NGheP4R2WYzPSjvNqX9P
 vxMf5Et0hzGAy9YxPDL6ZVvwde5cNFg3iFjeMz8UsEU/xtCbR00yoKrqL2/CwP/+
 vkLkjpAOZNyil87TBH5V06RlBRdRtFx4Vw9ExD57GPBSTRMtyoKXTgDZQCDTx8Uk
 4wS9gg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fey5t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 01 Jun 2026 09:32:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8ccd77414afso45907496d6.3
 for <qemu-riscv@nongnu.org>; Mon, 01 Jun 2026 02:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780306339; x=1780911139; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K/2WWlqEW0k7cOj699L5GqYdUxFcaUvN2CvYiAox0Ek=;
 b=eDGphO7wt2e7kOycrXZ1tTUaT69FX8GcLC/tVTNnMCWm5GyWZoTTmLtYTRjBmX6m7J
 bYTM6e6U7xLAzDXyMdg8TzdOkIqyl3GmiNVOBIEnid4MTUSGA32qwRRcN0Dqre+hWFea
 gTf40XDJSxSf3Ay5Y95RP+jxJeZlmb0YoSqma79SNOLiZYRI0lSGoW6oKyp4Vp22qAlK
 mrIPBs/IXnLCN8WnfWbJT2FJJ7EOYJbsLY8WV8hAcuWYYvTlIM42GWBEfpEh54/UBR6K
 7bc2UqOF9jEJ5HcxWEwEzZl3CbWhnMyOqvgaPP51c4fADqPVw5lgy3e1/VFRY2MbzTZA
 OqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780306339; x=1780911139;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/2WWlqEW0k7cOj699L5GqYdUxFcaUvN2CvYiAox0Ek=;
 b=pp2oo53pC1SfxiOHY7xP66jk1avBRXulXIoafw9nCpmJUY4HjloSkMmnbPr4GZ9b+k
 tW0eM3+7zloN/TWmKk/uaMHZUbRGV7ZpCEBb1VRTZyAkVoDGhQ58+kHeq8baRG8/61eS
 ODqwCyVpJclL8z9C++DmXPdNKrvw54E8P0ORxK+d+TE05FwcGjJJ23OPcp7z2e5G9ne7
 vjRHcT9pEb6tLdCKYYL+fKXpJagBvJphVooF4eleL2hDw5gTfgyyicrkBjMEvGNFVmXB
 nT0pJjXgg7jFnW1jT41n/+rjZMfAiHLZeYoi4qP/orauUeC6Kfx7Nsj3pEiBRFfrZonV
 xPNg==
X-Gm-Message-State: AOJu0YzQ99Ew+1qKL38uHxcfcyH+tqyZ7c03c6mz7RztfMX6qrNjsCQy
 Nbi0eXbRmhDmHxLnfeWEhcHWLnL3NviNM99MytODJMbmlaWMiLhgViFLSOV+G7nk26cTQgs8Su8
 FKhNZXwdHVVcbwPN525hmLZgvn5bjgBBtr5N/DJn2+UOClneXD+lqQ+g7yw==
X-Gm-Gg: Acq92OHulMddKu/2Ctq/tyFTipdE1iKqUVK9HYpyWTOV/CTzwF1f+ZS7FX16ES6cpnS
 WE7GjrV1xy4AbrfMTw3ihcg/SpsgqoDpDDNaGnSM8UP4qrUJyV32fBqojCqaJh3mbQ3UNcrAJ9y
 trQATuBVeroRNK3iXPLzHtOD7AD4eCZ8DsLj8eqRD7DEckGYHxYeTBxdvM72GzYeRDOsL+Xb+1c
 j2qu856ynZjahGNHBnMO7pMHPTeEii1t0cDklrVQfBDjjTGcWCqkVgbKVbJWZst8fn2T5tMtqZb
 M/mYzp48IIlbwqFbjtz35ToEnSEoU1yDimjdXLLAh33bRt03/zA1AYzGbxZv6nEdQ0M62RSm/+e
 9JOhlRGD0Zty7RMd7KHIBIXqtIP9ukLD7hZdQeaEbH/cEl9pTgPtuJ8LUBxVbmmPaI36B
X-Received: by 2002:a05:6214:c63:b0:8ae:3e38:54ca with SMTP id
 6a1803df08f44-8ccefa65152mr172296306d6.0.1780306339511; 
 Mon, 01 Jun 2026 02:32:19 -0700 (PDT)
X-Received: by 2002:a05:6214:c63:b0:8ae:3e38:54ca with SMTP id
 6a1803df08f44-8ccefa65152mr172296006d6.0.1780306338955; 
 Mon, 01 Jun 2026 02:32:18 -0700 (PDT)
Received: from [192.168.68.106] ([177.170.117.62])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8ccea064f97sm88372236d6.13.2026.06.01.02.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 02:32:18 -0700 (PDT)
Message-ID: <a02f618f-7e0e-4bac-9748-afa0469c3a60@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 06:32:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QEMU RISC-V Call
To: Alistair Francis <alistair@alistair23.me>, Max Chou <max.chou@sifive.com>
Cc: qemu-riscv@nongnu.org
References: <e2576b58-9356-4d88-8485-42256b2a2366@alistair23.me>
 <6e25408f-662c-4cd9-93b7-35ea100c81fb@oss.qualcomm.com>
 <81a5c280-973d-4ada-b2f3-3ac4652a2037@app.fastmail.com>
 <ahkrD2h1kaubNtXq@sifive.com>
 <443d2b53-a613-4d46-b750-3a22aa72f67c@app.fastmail.com>
 <3c88b75c-3658-4516-a655-d500de323d8c@alistair23.me>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3c88b75c-3658-4516-a655-d500de323d8c@alistair23.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UlADOn5Asynq6EbKt-UFmOFkQ20-lkiL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5NiBTYWx0ZWRfX653i5UAFSjMm
 KGgJCaYRh1HRNbXiX0btDvQqcnwOR+Jpx5uZX/SRk/R/ryaOyw+KkfOQqbpztaXShQJlNPbMQyO
 W4Pi5Y6E7cmxQgdi8Vf9vmA6H/0ogwnxi539NY/NQnOZnAz2d7KGuJ4xB+k1m7SIwkdj29wjBVc
 P7IdbJz2IReBcLlXHRKKTzqJtr4qRDj8UWjj3IjZkumx0Pn+ZPP+XuXme+kc8xqEo6/PAvwG6pq
 90e32gsqjs0TQ/jESLJPGKt+1UtkQWArqmvx6AZoUUDjttXpkReBs5j3i3yYL0Ms/rEErEHVXIS
 h/GJ2QxH8gVA1Dw+hcMUGqYtshQKQVTWy6Nynydb0ZtzMGXwKk0YNk1dYMrqigt+vnAPup/UxCQ
 0Wiofaloc0xwvZkgBxlvDiuo0DuU4a4xM98bPXQ7WlV/2ZqZUnII+jDPlg1VCyUlLdBtBm3oLkt
 G4OuQ+FCiwIgQSI//Bg==
X-Proofpoint-GUID: UlADOn5Asynq6EbKt-UFmOFkQ20-lkiL
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d51a4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=gdiugJE53z4H+vvYeRBHqw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=z6iPYi3Yopa2DsWXjukA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010096
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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



On 5/31/2026 10:56 PM, Alistair Francis wrote:
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
>>>>>> There has been some interest recently about setting up a call to discuss QEMU RISC-V and the current status.
>>>>>>
>>>>>> So I wanted to setup a chat next week AEST (UTC+10) time to discuss a few things on a call.
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

Oh, Monday 10am AEST is still Sunday for me.  Got stuff messed up in my
head :D I thought it was today (Monday for me, so it would be Tuesday
morning Australia).

> 
> A few of my key takeaways after the meeting:
> 
>   * We need a new stricter extension requirement as there are just too many extensions being submitted.
>      * I'm thinking requiring upstream tests to use the extension and at least some proof the extension is used and provides value before it is reviewed. Thoughts?


The root problem is that we have a lot of people that consumes the code
silently, i.e. they're not vocal about "I care about this feature".  This
makes a criteria like "proof the extension is used" harder.

And the main nature of how qemu-riscv is consumed, enabling development
of other pieces of the stack (OpenSBI, kernel ...), promotes this behavior
where having stuff in QEMU earlier helps.  Recent examples are the Server
Ref Platform board and the smmtt extensions Zhiwei sent last month.


I'm not sure if we can put a process on it.  Maybe we should go case by
case instead ... and note that a patch sent to the ML doesn't mean
auto-acceptable either.  As an example my e-trace patches are buried
since January.  I'll eventually re-send those (maybe this week).  If there's
no reviewer interest then it's up to the maintainer to take them or not.
So maybe the existing process already works ...


>   * Someone? Tenstorrent? will submit documentation to QEMU to describe a few key Vector options that people should test their code against
>   * Joel to send Sdtrig patches supporting both debug spec versions. Otherwsie deprecate current 0.13 version

In that case I ask to name the older version "sdtrig-0.13" and make
the current "debug" an alias to sdtrig-0.13.

And if we could make this happen ASAP that would be appreciated - the
current sdtrig situation is holding back the "sdext" patches from Chao,
which in turn are holding back the riscv-server-ref board.  If we could
make all this happen for this release (code freeze beginning of July)
that would be terrific.

>   * Anton to send vector patches
>   * Schedule these regularly, but not on a Monday. How about 10AM (so same time) on a Wednesday?

Works way better than Monday 10am AEST :D

> 
> 
> Portia kindly took notes that are below:
> 
> 
> QEMU Community Meeting Notes
> 
> QEMU RISC-V extension policies
> * There are too many extensions coming through and cannot keep up with reviews.
> * Is there even code that runs using them?
> * Discussed requiring some test as part of accepting these, TCG test or kvm unit tests
>      * RVI is supposed to do compliance test, we could ask for these tests, but they generally don't seem to exist


RVI is doing compliance tests using riscv-arch-test:

https://github.com/riscv/riscv-arch-test

They're working on a sort of certification process with QEMU and other RISC-V
emulators (Sail, whisper, Spike ...).  I suppose more bugs will be coming
our way.

RVI got me involved directly in the last 2 weeks because they claimed they
were opening Gitlab bugs and they weren't seeing action, and it would be
nice to have some stuff fixed before RVI Summit Europe.  I did some work
on them and now seems like we have more people from the community joining
in fixing bugs, which is awesome.


Cheers,
Daniel


> * Discussed having deprecation scheduled but the burden is on submission not maintainance.
> 
> Vector cross implementation issue
> * There is a lot of optionality in the architecture but most software is just being developed against the RVS32 and QEMU defaults.
>      * For example, GPG Is broken on the K3 since it has a non. 128 vector length.
> * Suggested having a fuzzer CPU option to run which would randomize certain profile compliant options
>      * All options are already available in the command line so this doesn’t add much, just makes it easier for people to test more options
> * Silicon companies have some test vectors of this but it doesn’t help the fact that upstream developers don’t use these options.
> * Write QEMU documentation (wiki or docs) with 3-5 combinations that it is recommended to test against.
>      * Projects can be pointed at this for CI
> 
> Upstream issues
> * sdtrig debug patches
>      * There are two ratified debug specs, 1.0 and 0.13. They are incompatible, all sdtrig patches break the previous ratified version.
>      * stdtrig is needed to be profile compatible so there is a push to remove 0.13.
>      * Joel is working on adding Sdtrig support while supporting 0.13 as well.
> 
> * Vector bugs found from trace matching
>      * Have found QEMU bugs from trace matching to emulation platforms are they upstreamable? It can be useful for finding QEMU bugs.
>      * Vector is really slow , would be wary if it impacts performance
>      * Don’t want more custom options, try and send patches that tweak QEMU's implementation to be more like real hardware without optionality.
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


