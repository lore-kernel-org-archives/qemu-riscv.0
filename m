Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62D2C4452B
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 18:38:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wmFLm-0005Jn-W6; Tue, 21 Jul 2026 14:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wmFLd-0005JJ-Ty
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 14:37:47 -0400
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair@alistair23.me>)
 id 1wmFLb-0005fC-F9
 for qemu-riscv@nongnu.org; Tue, 21 Jul 2026 14:37:45 -0400
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailflow.stl.internal (Postfix) with ESMTP id 71DA113000FD;
 Tue, 21 Jul 2026 14:37:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 21 Jul 2026 14:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm2;
 t=1784659060; x=1784666260; bh=eemNflwkxUgYVPuzvSpVLDA8/Sz5RW7P
 XzBjtrrdgLY=; b=A33s0itNK53eNjkszVnlRLlaeWzFVHjPN3GVVKONUhaVnXpw
 lTPDeZgVA+rpnHqCFedz2DGE13w3C5Lb+9dP3tV9VK1K/43e1raNqAwIYkk3oF26
 HY/7daGCmR4TtWK1JEBHrT6mX0kM5DmJehUut1W9OeJV9lYbzelMxnN/Q0uJ/DOl
 1Wc8z+U5fd3oPtsYb8+0xmGrGYdttoH65WTKMePvV4JN/592LOajIevI/ejCgPXN
 peaOzPYUHGRdwpDa5nGlpwzNBDSIozL8K1IaISmdQ6XYiYoWr87siQShTnutizzk
 EKNckJbvzuV/DZ5qgzBcSuL9OsEyYIKf4FAOaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784659060; x=
 1784666260; bh=eemNflwkxUgYVPuzvSpVLDA8/Sz5RW7PXzBjtrrdgLY=; b=q
 5IqQaIyvhMQGZVrzwpdS+O5Lm7Wb5JGGvgGxzLP5ICA3w6trot1QfZ4KmCoIX5dd
 gkk3VA3hjIJCSOJvt0WJVXtqrE2jCxC/kLZviPiCPI/XpsvNkEpPWCtX6ubRZ+Gz
 RWBnOh48o749/tR3bwKoxiQ1wf+eREfsr3kK6Qka4CVz9QXqx4oPzQJvROugdrmx
 mK4HQqnDrUYjUz+SXf8NIFk2CF6qtWtwfl9xfLZgM7vKz5IcEbA3MYVzaMoFlbyS
 BM9iZiO90ckB4WQYzvmv0855dAi+s+R3NRZNYVB0ggl8S3M/0kegRjxbPaTEV3Zp
 PuLaqBU/DGADrnPxBm9yQ==
X-ME-Sender: <xms:c7xfaoQu67RCtr_9KD5Ha_vgvuKy4zDlG3UkOFqeLAX90exqgVCWHA>
 <xme:c7xfamMcP7-MItaQUiQzLDei6TAoEx4DB-8V6IPQd6pDU-97t6KDo8wflewEeuNog
 2ZBAbUllwNezcj_agH4cacoErWAu6M-2dV53UZvh5Eigq1BVnb1EMo>
X-ME-Received: <xmr:c7xfamgEq-8vusxWjYxmTxDtXx_np_gJt0S9IQlaEm78oenPHx4JFbLIsL0Srbpxk18>
X-ME-Proxy-Cause: dmFkZTEdcD5iXXicsjWiXgo+ugOSgE0hNp5MNG7Za8G5D5FlfuecsoRmPM2di6/UnOhf4x
 peNM8qzj20Ldan0Pe9Kpv+m22zfvD6g6SYQrMytn7Ef8e75uxiU4/8xFvBWLZkzk2YjJF5
 DdcCekK7RjLGAs4dmenkh0t8p1/8w32G0K/MvPt8/h5g6Fo9Lg+ULvtQdEzcnATLgMJbXe
 QSwkPl3geA2XqOwLDHm/cyOGZWZYXN2KV0QCgQ2dlpsZe6iD7xPw5d3SjJch/Ot9VatBbh
 JK1y7m10BjHMevj35gCnV31NSCd1h7BP2eJ8Qw5VaKOLZFv3oJFfgjYWBrtkDr+WA5NKfr
 fr9sHdP0RqDS6rHhA0fqbhTCa5LWBVGhYNVLEyHOFWMuJqrSPylwitUNBcVmd0WtFlWw1W
 kg6/Qbj1/mzj9+Y5ZE4Fsd+LuyghxY4qqQ82rQ9+QkJIk8SFYc8BEaODAyWX0xcO66mnLl
 MN7xJAKfmYFWKuiurCyp7WHP0MyPkl1kDVspPe/w99KXcLfQXg/CwcLKA/jt00E3t63RWz
 5qk2bm+tNbOZ9S5MEk1REOYv/tOOyNsGhtRzbyGeu0rn/AtyXE0TY3BXYZpxq7KwP2UInT
 +znoV2dJfTRsmuJSCBE0mYQrMRgIi/BLjcOwAE9KUqvfucQGMuqtga1NKFDQ
X-ME-Proxy: <xmx:c7xfajk3cmmC-HZBaMCtVg0EnuLtATrxOeNPgEecUoGRcPOqj94DVw>
 <xmx:c7xfaijycE2N76PAg7pD0lV1luaoSaynY2CtifgldJLGjnsnmbOfbQ>
 <xmx:c7xfamEM_I9Vqop1fVmIU_uzC1oUnoyBEuVnMD0KURjYenEkBJ7QSw>
 <xmx:c7xfaktD-qQ7HMXOKa_CTixeLVWJK_sSaqTQ_nritC94rHLYV1tgfQ>
 <xmx:dLxfaibTPnAEaairiIfumfdPny2_YApcjQv5Mzi_gvOnLgBO1EkOPFXF>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jul 2026 14:37:38 -0400 (EDT)
Message-ID: <e282de71-5390-41d8-8a8d-6156aae01079@alistair23.me>
Date: Wed, 22 Jul 2026 04:37:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regular QEMU RISC-V Call
From: Alistair Francis <alistair@alistair23.me>
To: Joel Stanley <joel@jms.id.au>
Cc: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org,
 Max Chou <max.chou@sifive.com>, Michael Neuling <mikey@neuling.org>
References: <6315a319-19d9-4533-83ed-eaba9c0b29d5@app.fastmail.com>
 <CACPK8Xe9JVggXzX9kku-zm7RYzM++fqcr=fx-MdkKiViHdiMYw@mail.gmail.com>
 <ad259828-65b3-4c4a-bf3f-73cc195c19f5@alistair23.me>
 <68917b26-32a2-49e6-94ea-1ca587948f23@app.fastmail.com>
Content-Language: en-AU
In-Reply-To: <68917b26-32a2-49e6-94ea-1ca587948f23@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=202.12.124.137;
 envelope-from=alistair@alistair23.me; helo=flow-b2-smtp.messagingengine.com
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

On 17/6/26 09:18, Alistair wrote:
> On Tue, 16 Jun 2026, at 8:35 PM, Alistair Francis wrote:
>> On 16/6/26 16:07, Joel Stanley wrote:
>>> On Thu, 11 Jun 2026 at 13:52, Alistair <alistair@alistair23.me> wrote:
>>>> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.
>>
>> That means the meeting should start in a little less then 13 and a half
>> hours! I'll send out a Teams invite tomorrow

Hey!

I realised that it's now been a month. I leave for holidays in a few 
days, am currently recovering from some sickness and don't have any 
agenda items. So let's skip this month and start again in August

Alistair

> 
> Call in details are below. Starting in 40 minutes!
> 
> ________________________________________________________________________________
> Microsoft Teams meeting
> 
> Join:
> https://teams.microsoft.com/meet/275503449279724?p=C2D0EDrqxwFb5LuRnB
> 
> Meeting ID:
> 275 503 449 279 724
> 
> Passcode:
> kS9Vg23i
> 
> ________________________________________
> Need
>   help? |
> System reference
> Dial in by phone
> 
> +1
>   408-627-4258,,498330396#
> United States, San Jose
> Find
>   a local number
> Phone conference ID:
> 498 330 396#
> 
> Join on a video conferencing device
> 
> Tenant key:
> wdc@m.webex.com
> 
> Video ID:
> 119 833 426 2
> 
> More
>   info
> For organizers:
> Meeting
>   options |
> Reset dial-in PIN
> 
> ________________________________________________________________________________
> 
>>
>>>
>>> I'll be on, hopefully in the right timezone this time around. 9:30 ACST.
>>>
>>>> If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.
>>>
>>> Two agenda items:
>>>
>>> * RISC-V Code Policy
>>>
>>> https://lore.kernel.org/qemu-riscv/057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me/
>>>
>>> Good idea writing down your expectations somewhere everyone can see.
>>> Do you want to raise it as a topic and we can talk it through?
>>
>> Yep!
>>
>>>
>>> * Machine model use cases
>>>
>>> I wanted to share my perspective on the system emulator machines, what
>>> they are for, who they are for, and hear what others had to say.
>>
>> Sounds good as well
>>
>> Alistair
>>
>>>
>>> See you on the call tomorrow.
>>>
>>> Cheers,
>>>
>>> Joel
>>
>>


