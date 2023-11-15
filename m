Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672FEC07548
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 11:27:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3E30-00021b-Rc; Wed, 15 Nov 2023 06:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1r3E2h-0001vR-CK; Wed, 15 Nov 2023 06:26:47 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1r3E2f-0000So-FK; Wed, 15 Nov 2023 06:26:47 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8A99E75A4B7;
 Wed, 15 Nov 2023 12:27:10 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7D15975A406; Wed, 15 Nov 2023 12:27:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 79326756066;
 Wed, 15 Nov 2023 12:27:10 +0100 (CET)
Date: Wed, 15 Nov 2023 12:27:10 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gavin Shan <gshan@redhat.com>
cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-ppc@nongnu.org, imp@bsdimp.com, kevans@freebsd.org, 
 richard.henderson@linaro.org, pbonzini@redhat.com, 
 peter.maydell@linaro.org, imammedo@redhat.com, philmd@linaro.org, 
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, 
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com, 
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com, 
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu, 
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com, 
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net, 
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com, 
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org, 
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de, 
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: Re: [PATCH v5 02/31] target/hppa: Remove
 object_class_is_abstract()
In-Reply-To: <dc3b8e48-1d33-480f-99bc-57e1242db13d@redhat.com>
Message-ID: <9f9a2839-6702-43e2-79de-1d6f3b2f6618@eik.bme.hu>
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-3-gshan@redhat.com>
 <35cae9bd-2240-2399-2212-e12f1683bf90@eik.bme.hu>
 <dc3b8e48-1d33-480f-99bc-57e1242db13d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1723340199-1700047630=:4658"
X-Virus-Scanned: ClamAV using ClamSMTP
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--3866299591-1723340199-1700047630=:4658
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 15 Nov 2023, Gavin Shan wrote:
> On 11/15/23 21:18, BALATON Zoltan wrote:
>> On Wed, 15 Nov 2023, Gavin Shan wrote:
>>> No need to check if @oc is abstract because it has been covered
>>> by cpu_class_by_name().
>>> 
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>> target/hppa/cpu.c | 1 -
>>> 1 file changed, 1 deletion(-)
>>> 
>>> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
>>> index 04de1689d7..fc4d2abad7 100644
>>> --- a/target/hppa/cpu.c
>>> +++ b/target/hppa/cpu.c
>>> @@ -163,7 +163,6 @@ static ObjectClass *hppa_cpu_class_by_name(const char 
>>> *cpu_model)
>>>     ObjectClass *oc = object_class_by_name(typename);
>>> 
>>>     if (oc &&
>>> -        !object_class_is_abstract(oc) &&
>>>         object_class_dynamic_cast(oc, TYPE_HPPA_CPU)) {
>> 
>> Might as well remove the line break as the remaining expression fits in 80 
>> chars.
>> 
>
> Yes, but the whole chunk of code will be removed in PATCH[03]. So I think
> we needn't the extra effort to adjust the format in PATCH[02]?

Yes, if it's gone later then does not matter.

Regards,
BALATON Zoltan

> Thaks,
> Gavin
>
>>>         return oc;
>>>     }
>>> 
>> 
>
>
>
--3866299591-1723340199-1700047630=:4658--

