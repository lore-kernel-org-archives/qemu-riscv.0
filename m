Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A38C5CFC1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 20:02:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wuy6F-0000DZ-HY; Fri, 14 Aug 2026 16:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1wuy6E-0000Cs-CI
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 16:01:54 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1wuy6B-00068Z-Ex
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 16:01:53 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-38ea87caafeso1297494a91.3
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 13:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20251104.gappssmtp.com; s=20251104; t=1786737703; x=1787342503;
 darn=nongnu.org; 
 h=content-transfer-encoding:content-type:mime-version:message-id:to
 :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=YrVtN9FHS76Esyh7eMWICwS5dx95gcrkhmNKAjrP5BA=;
 b=tdyKue6/M0MA+Dxfhp6o6jgl8PkJa7dzcoSxNuigbD5wOvwYPW5V33oMU3YcU0SHj/
 R2uuY6YFr/YPyIH1bTqHkjkldFqCUI0IrPT4lVjTtzLW1k8fjbTZxY46Z65NCPM2e3Ya
 Cbn8jJtixkF7W+iascN8RMIxmLsmka/Y3e09deLhNY4sJUn8Xh4Oe6WTpAViSDiIo5EX
 Ez4odpVlIfnkYj0akPfm+MtCTqMt8B+guoAKyxX9TkS4a1jrIyW3GgxhFKvyJDH1MaFG
 yQ687DQDXXroSdMx4DnKUp3t0a5pOqc0f0ETy8rpFfA9dbBSWUtF4cIjSnsHvpIXOJzd
 402A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786737703; x=1787342503;
 h=content-transfer-encoding:content-type:mime-version:message-id:to
 :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=YrVtN9FHS76Esyh7eMWICwS5dx95gcrkhmNKAjrP5BA=;
 b=AVGYQ8mY/Sa0XW9jGogwVP4W9znIhhYNO7MW3P0mPJ2PP0sR0dCjVDiEQ4OYddNB9H
 4o5rLzHsnWBhEuzzn58fh3DqIw3r4JwGQjuSkj4r3y0FfYVHYTmWcPKSsFrRPZzr5YHF
 X6f8bbVULrxUQpe8f0DT168qqpE2KFhd53g6iDZv9xqN4GXmvXao6DZgBSG0KbTBNs/z
 +tA6OBseuHF4o3FBsBTYfHD/tQsC5BNVch8OVESxX2OBfotYW74nya7wVQYP51FwOS/6
 XLqeQSa13RmgR6VEcjkuUxmCorC/mXG/l0tyDqtsbNYg3ZHD1U6+Hwu15gtXIsAOj+MG
 /++Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rru3axGTFkBx3CT2c6NeyWvqW0kIgKWevWGXJGOOyzk9oacpp2QkldUUtAo7A9iFLN8gEi/ZZm1g6A3@nongnu.org
X-Gm-Message-State: AOJu0YysrDYMaMaCOmSerq9SFJe209L5QiND54qNL+XV8WCBNIcZ7Jdf
 65w44zd/Uwo56nrgfcCXvixPsXz35PQ0m1zB2goCqmN2AVdtn+MaR8OvPJzEF/umeiI=
X-Gm-Gg: AR+sD11ClvFxeaMAw4RI9r+W4KimyT1/lp4Spp/mrOKnigp61rOyAKYRrxU8PLGoscZ
 I+PbINYH8Zjs9+4aF606f/Nrx4bKHt2jxZQiWD+LwTnsH9yRn7QIjDEo/gOZQBLo3SAaNwnlpyW
 Q5yGps7NECj2jHzoSFMhABxFDgw3iuRVHTyFwZXu915op4MSuS0q6iEalETzg2mzjjwUaAq/5x6
 /aX1khmGDAblI4cXJGRn5+dltplb4uwxG1+7vyzpka3eZzC1r5TKO//1OA2zg6IkQx46wuRfpxr
 T0sRLz0S2pXQlEMkfFY6TJnDSLHnt25EUFWiHj+2DuySfUWds8ONUZDcm7Dcem5vFThPqelntBw
 e7CJxDW78ODElQRRy3k2ziWZW7JbYrUdIsOATbvV9vQVggSEWIy51MxSPmfOVdPkjiTq6sacLap
 RtHdocRxtiOc896FruNl+6sVLEn8xOC9NfRh+FiC3NAFF1ZlL/Ee7Y/DBInj99cnHjDVyzEtB+q
 w==
X-Received: by 2002:a17:90b:5606:b0:381:25ce:bcc2 with SMTP id
 98e67ed59e1d1-3933b78b698mr9740212a91.6.1786737703037; 
 Fri, 14 Aug 2026 13:01:43 -0700 (PDT)
Received: from localhost ([192.184.165.199]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1413889bca5sm17312133c88.12.2026.08.14.13.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 13:01:42 -0700 (PDT)
Date: Fri, 14 Aug 2026 13:01:42 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Aug 2026 13:01:41 PDT (-0700)
Subject: Re: Regular QEMU RISC-V Call
In-Reply-To: <da7e0e41-50d0-4fbf-a733-567a563f2692@app.fastmail.com>
CC: daniel.barboza@oss.qualcomm.com, joel@jms.id.au, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, qemu-riscv@nongnu.org,
 max.chou@sifive.com, mikey@neuling.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair@alistair23.me
Message-ID: <mhng-CD4B9E6C-F77D-4A7D-9118-A21A9776D3FA@Palmers-Mini.rwc.dabbelt.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 14 Aug 2026 13:00:04 PDT (-0700), alistair@alistair23.me wrote:
> On Wed, 22 Jul 2026, at 5:02 AM, Daniel Henrique Barboza wrote:
>>
>>
>> On 7/21/2026 3:37 PM, Alistair Francis wrote:
>> > On 17/6/26 09:18, Alistair wrote:
>> >> On Tue, 16 Jun 2026, at 8:35 PM, Alistair Francis wrote:
>> >>> On 16/6/26 16:07, Joel Stanley wrote:
>> >>>> On Thu, 11 Jun 2026 at 13:52, Alistair <alistair@alistair23.me> wrote:
>> >>>>> For the time, I'm picking Wednesday the 17th of June at 10AM AEST (UTC+10). Hopefully that works ok for everyone. If it doesn't let me know and we might be able to move it around.
>> >>>
>> >>> That means the meeting should start in a little less then 13 and a half
>> >>> hours! I'll send out a Teams invite tomorrow
>> >
>> > Hey!
>> >
>> > I realised that it's now been a month. I leave for holidays in a few days, am currently recovering from some sickness and don't have any agenda items. So let's skip this month and start again in August
>>
>> In fact the meeting was yesterday according to the calendar invite Palmer sent
>> :D figured that ppl forgot about it and I dropped the call after 10 minutes.
>>
>> If we're going to stick with Palmer's existing invite the next meeting will be
>> August 18th 10AM UTC+10.
>
> My Teams meeting thing had the 17th of August.
>
> I only get back on the 17th, so let's do the Thursday the 17th at the same time.

I'm super lost now...

> So 2 days later then Palmers event. Does that work?
>
>>
>> As an agenda for next call I have a couple of topics:
>>
>> - ongoing Debug related work.  Hopefully we'll have some Debug 0.13/1.0 patches
>> under review by that date;
>
> I see them. Hopefully by then I can review them.
>
> Alistair
>
>> - there is a chance that common efforts led by ARM folks (single binary, multi accel ..)
>> will spill in the RISC-V tree.  I'll talk with Phil and Pierrick later this week and see
>> if there's something to do on our side.
>>
>>
>> Cheers,
>> Daniel
>>
>>
>> >
>> > Alistair
>> >
>> >>
>> >> Call in details are below. Starting in 40 minutes!
>> >>
>> >> ________________________________________________________________________________
>> >> Microsoft Teams meeting
>> >>
>> >> Join:
>> >> https://teams.microsoft.com/meet/275503449279724?p=C2D0EDrqxwFb5LuRnB
>> >>
>> >> Meeting ID:
>> >> 275 503 449 279 724
>> >>
>> >> Passcode:
>> >> kS9Vg23i
>> >>
>> >> ________________________________________
>> >> Need
>> >>   help? |
>> >> System reference
>> >> Dial in by phone
>> >>
>> >> +1
>> >>   408-627-4258,,498330396#
>> >> United States, San Jose
>> >> Find
>> >>   a local number
>> >> Phone conference ID:
>> >> 498 330 396#
>> >>
>> >> Join on a video conferencing device
>> >>
>> >> Tenant key:
>> >> wdc@m.webex.com
>> >>
>> >> Video ID:
>> >> 119 833 426 2
>> >>
>> >> More
>> >>   info
>> >> For organizers:
>> >> Meeting
>> >>   options |
>> >> Reset dial-in PIN
>> >>
>> >> ________________________________________________________________________________
>> >>
>> >>>
>> >>>>
>> >>>> I'll be on, hopefully in the right timezone this time around. 9:30 ACST.
>> >>>>
>> >>>>> If anyone has anything they want to discuss let me know. I can send an agenda and confirmed meeting time out in a few days.
>> >>>>
>> >>>> Two agenda items:
>> >>>>
>> >>>> * RISC-V Code Policy
>> >>>>
>> >>>> https://lore.kernel.org/qemu-riscv/057cb481-c6f3-489c-aad7-1bee152fc336@alistair23.me/
>> >>>>
>> >>>> Good idea writing down your expectations somewhere everyone can see.
>> >>>> Do you want to raise it as a topic and we can talk it through?
>> >>>
>> >>> Yep!
>> >>>
>> >>>>
>> >>>> * Machine model use cases
>> >>>>
>> >>>> I wanted to share my perspective on the system emulator machines, what
>> >>>> they are for, who they are for, and hear what others had to say.
>> >>>
>> >>> Sounds good as well
>> >>>
>> >>> Alistair
>> >>>
>> >>>>
>> >>>> See you on the call tomorrow.
>> >>>>
>> >>>> Cheers,
>> >>>>
>> >>>> Joel
>> >>>
>> >>>
>> >
>>
>>

