Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630D9E7B604
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:48:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qo1Hu-0002Ke-Ko; Wed, 04 Oct 2023 08:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qo1Hq-0002GW-7q; Wed, 04 Oct 2023 08:47:34 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qo1Ho-0006Dw-3K; Wed, 04 Oct 2023 08:47:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D20FE7456AA;
 Wed,  4 Oct 2023 14:46:45 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 950297456A7; Wed,  4 Oct 2023 14:46:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 93132745681;
 Wed,  4 Oct 2023 14:46:45 +0200 (CEST)
Date: Wed, 4 Oct 2023 14:46:45 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>, 
 David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 13/13] system: Rename softmmu/ directory as system/
In-Reply-To: <e3341fd8-b122-ac6a-4a55-07fa80c5142f@linaro.org>
Message-ID: <7145d71d-a255-05f9-d36a-6e2375cdec78@eik.bme.hu>
References: <20231004090629.37473-1-philmd@linaro.org>
 <20231004090629.37473-14-philmd@linaro.org>
 <e3341fd8-b122-ac6a-4a55-07fa80c5142f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1512138473-1696423605=:55550"
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1512138473-1696423605=:55550
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 4 Oct 2023, Philippe Mathieu-Daudé wrote:
> On 4/10/23 11:06, Philippe Mathieu-Daudé wrote:
>> The softmmu/ directory contains files specific to system
>> emulation. Rename it as system/. Update meson rules, the
>> MAINTAINERS file and all the documentation and comments.
>> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>
>>   include/sysemu/runstate-action.h        |  2 +-
>
>>   rename {softmmu => system}/timers-state.h (100%)
>>   create mode 100644 system/trace.h
>>   rename {softmmu => system}/arch_init.c (100%)
>>   rename {softmmu => system}/async-teardown.c (100%)
>>   rename {softmmu => system}/balloon.c (100%)
>>   rename {softmmu => system}/bootdevice.c (100%)
>>   rename {softmmu => system}/cpu-throttle.c (100%)
>>   rename {softmmu => system}/cpu-timers.c (100%)
>>   rename {softmmu => system}/cpus.c (100%)
>>   rename {softmmu => system}/datadir.c (100%)
>>   rename {softmmu => system}/device_tree.c (100%)
>>   rename {softmmu => system}/dirtylimit.c (100%)
>>   rename {softmmu => system}/dma-helpers.c (100%)
>>   rename {softmmu => system}/globals.c (100%)
>>   rename {softmmu => system}/icount.c (100%)
>>   rename {softmmu => system}/ioport.c (100%)
>>   rename {softmmu => system}/main.c (100%)
>>   rename {softmmu => system}/memory.c (100%)
>>   rename {softmmu => system}/memory_mapping.c (100%)
>>   rename {softmmu => system}/physmem.c (99%)
>>   rename {softmmu => system}/qdev-monitor.c (100%)
>>   rename {softmmu => system}/qemu-seccomp.c (100%)
>>   rename {softmmu => system}/qtest.c (100%)
>>   rename {softmmu => system}/rtc.c (100%)
>>   rename {softmmu => system}/runstate-action.c (100%)
>>   rename {softmmu => system}/runstate-hmp-cmds.c (100%)
>>   rename {softmmu => system}/runstate.c (100%)
>>   rename {softmmu => system}/tpm-hmp-cmds.c (100%)
>>   rename {softmmu => system}/tpm.c (100%)
>>   rename {softmmu => system}/vl.c (100%)
>>   rename {softmmu => system}/watchpoint.c (100%)
>>   rename {softmmu => system}/meson.build (100%)
>>   rename {softmmu => system}/trace-events (100%)
>
> Maybe I should also move include/sysemu/ -> include/system/
> to keep it coherent?

I think I've proposed some years ago to rename softmmu to sysemu because 
besides actual softmmu code it conrains a lot of system emulation. Calling 
it system is also similar, maybe less specific than sysemu but basically 
the same.

Regards,
BALATON Zoltan
--3866299591-1512138473-1696423605=:55550--

