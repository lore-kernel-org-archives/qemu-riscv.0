Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7098EE7FF4
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 05:58:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qfZvM-0007L4-8a; Mon, 11 Sep 2023 01:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qfZvA-0007IH-Sg; Mon, 11 Sep 2023 01:57:16 -0400
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qfZv7-0004yA-OR; Mon, 11 Sep 2023 01:57:16 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VrlO8m1_1694411823; 
Received: from 30.221.110.218(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VrlO8m1_1694411823) by smtp.aliyun-inc.com;
 Mon, 11 Sep 2023 13:57:04 +0800
Message-ID: <7e2977aa-2de4-6ba9-af74-03b5619f3eb2@linux.alibaba.com>
Date: Mon, 11 Sep 2023 13:56:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RESEND] qemu/timer: Add host ticks function for RISC-V
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, pbonzini@redhat.com
Cc: atishp@atishpatra.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 lzw194868@alibaba-inc.com
References: <mhng-87182386-83b7-4ce7-af3d-f0cc10b292f8@palmer-ri-x1c9>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <mhng-87182386-83b7-4ce7-af3d-f0cc10b292f8@palmer-ri-x1c9>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.100;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-100.freemail.mail.aliyun.com
X-Spam_score_int: -113
X-Spam_score: -11.4
X-Spam_bar: -----------
X-Spam_report: (-11.4 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/9/9 22:45, Palmer Dabbelt wrote:
> On Sat, 09 Sep 2023 00:18:02 PDT (-0700), pbonzini@redhat.com wrote:
>> Il sab 9 set 2023, 03:35 Atish Patra <atishp@atishpatra.org> ha scritto:
>>
>>> On Fri, Sep 8, 2023 at 3:29 AM Paolo Bonzini <pbonzini@redhat.com> 
>>> wrote:
>>> >
>>> > Queued, thanks.
>>> >
>>>
>>> I didn't realize it was already queued. Gmail threads failed me this 
>>> time.
>>> @Paolo Bonzini : Can you please drop this one as this will break as
>>> soon as the host riscv system
>>> has the latest kernel ? I have provided more details in the original
>>> thread.
>>>
>>> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg01941.html
>>
>>
>> If you have dynamic clock adjustment, does rdcycle increase with a fixed
>> frequency or does it provide the raw number of clock cycles? If the 
>> latter,
>> I agree that it should be provided by perf; but if the frequency is 
>> fixed
>> then it would be the same as rdtsc on Intel.
>
> That really depends on exactly how the system is set up, but there are 
> systems for which the rdcycle frequency changes when clock speeds 
> change and thus will produce surprising answers for users trying to 
> use rdcycle as a RTC.  We have rdtime for that, but it has other 
> problems (it's trapped and emulated in M-mode on some systems, so it's 
> slow and noisy).
>
> So we're steering folks towards perf where we can, as at least that 
> way we've got a higher-level interface we can use to describe these 
> quirks.

OK. I will send a v2 patch using rdtime.

Thanks,
Zhiwei

>
>>
>> Paolo
>>
>>
>>>
>>> > Paolo
>>> >
>>> >
>>>
>>>
>>> -- 
>>> Regards,
>>> Atish
>>>
>>>

