Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F822CDB465
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 03:40:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsawT-0007Sv-H7; Mon, 16 Oct 2023 23:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qsawR-0007SH-DZ; Mon, 16 Oct 2023 23:40:23 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qsawO-00068J-A5; Mon, 16 Oct 2023 23:40:23 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VuLKwWo_1697514009; 
Received: from 30.221.98.192(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VuLKwWo_1697514009) by smtp.aliyun-inc.com;
 Tue, 17 Oct 2023 11:40:10 +0800
Message-ID: <4baff7a3-6c2e-4b67-88fa-0e7dbd91c272@linux.alibaba.com>
Date: Tue, 17 Oct 2023 11:39:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] target/riscv: Do not allow MXL_RV32 for
 TARGET_RISCV64
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20231014033545.15220-1-akihiko.odaki@daynix.com>
 <20231014033545.15220-2-akihiko.odaki@daynix.com>
 <597bf4be-207b-400a-be49-bc18900809a0@ventanamicro.com>
 <CAKmqyKPqk1sURLQNBoH0MeSJVSut72XiN4H0uT=95S953o7Taw@mail.gmail.com>
 <aa47e609-9da4-4274-8335-c07740c14d72@linux.alibaba.com>
 <CAKmqyKMF8TVq3rHFQCm3BnLtS5ipha1Qfs9Z7aH5VaQU-=KAEQ@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <CAKmqyKMF8TVq3rHFQCm3BnLtS5ipha1Qfs9Z7aH5VaQU-=KAEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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


On 2023/10/17 11:32, Alistair Francis wrote:
> On Tue, Oct 17, 2023 at 12:14 PM LIU Zhiwei
> <zhiwei_liu@linux.alibaba.com> wrote:
>>
>> On 2023/10/16 9:51, Alistair Francis wrote:
>>> On Sun, Oct 15, 2023 at 4:05 AM Daniel Henrique Barboza
>>> <dbarboza@ventanamicro.com> wrote:
>>>>
>>>> On 10/14/23 00:35, Akihiko Odaki wrote:
>>>>> TARGET_RISCV64 does not have riscv-32bit-cpu.xml so it shouldn't accept
>>>>> MXL_RV32.
>>>>>
>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>> ---
>>>> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>>>
>>>>
>>>>>     target/riscv/tcg/tcg-cpu.c | 3 ++-
>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>>>>> index a28918ab30..e0cbc56320 100644
>>>>> --- a/target/riscv/tcg/tcg-cpu.c
>>>>> +++ b/target/riscv/tcg/tcg-cpu.c
>>>>> @@ -161,10 +161,11 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>>>>>         case MXL_RV128:
>>>>>             cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
>>>>>             break;
>>>>> -#endif
>>>>> +#elif defined(TARGET_RISCV32)
>>>>>         case MXL_RV32:
>>>>>             cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
>>>>>             break;
>>>>> +#endif
>>> This isn't the right fix. The idea is that riscv64-softmmu can run
>>> 32-bit CPUs, so we instead should include riscv-32bit-cpu.xml
>> Agree. I'd like to go on the work. The question is that we don't have
>> 64-bit OpenSBI which supports booting 32-bit Linux.
>> So even we have implemented the SXLEN 32bit, we may not have the
>> software to test it.
> Ah! So I was first talking around just a full 32-bit CPU.
>
> So for example:
>      qemu-system-riscv64 -machine opentitan
>
> So we are using qemu-system-riscv64 to run a 32-bit only CPU.

Yes, if the 32-bit only cpu only has M mode, it can work now.

I have tried this for Xuantie E series cpu, for example the e902,  in 
the wild tree.

>
> Then we can think about SXLEN

Agree, maybe we can expose these cpus now.

Thanks,
Zhiwei

>
>> Do you support the SXL upstreaming with no testing?
> No, it should be tested
>
> Alistair
>
>> Thanks,
>> Zhiwei
>>
>>> Alistair
>>>
>>>>>         default:
>>>>>             g_assert_not_reached();
>>>>>         }

