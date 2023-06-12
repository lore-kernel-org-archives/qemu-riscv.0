Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70490C7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:31:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8YGc-0007nM-L8; Sun, 11 Jun 2023 23:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1q8YGa-0007n0-OT; Sun, 11 Jun 2023 23:30:52 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1q8YGY-0007Ib-0J; Sun, 11 Jun 2023 23:30:52 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Vkqiq84_1686540639; 
Received: from 30.221.96.167(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vkqiq84_1686540639) by smtp.aliyun-inc.com;
 Mon, 12 Jun 2023 11:30:40 +0800
Message-ID: <6c9a2380-7123-6759-9d08-7b2e3ebf59e9@linux.alibaba.com>
Date: Mon, 12 Jun 2023 11:30:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/4] target/riscv: Make MPV only work when MPP != PRV_M
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-2-liweiwei@iscas.ac.cn>
 <271fae50-e4a9-0cf0-6697-e9ada4eff41f@linux.alibaba.com>
 <c0c093f2-908b-3084-ab4d-a9e3d6d663a5@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <c0c093f2-908b-3084-ab4d-a9e3d6d663a5@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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


On 2023/6/12 11:10, Weiwei Li wrote:
>
> On 2023/6/12 10:45, LIU Zhiwei wrote:
>>
>> On 2023/5/29 20:17, Weiwei Li wrote:
>>> Upon MRET or explicit memory access with MPRV=1, MPV should be ignored
>>> when MPP=PRV_M.
>> Does MPP==PRV_M always indicate the MPV==0?
>
> No, I think . The spec doesn't restrict this. When MPP=PRV_M, MPV wll 
> be 0 in normal case.
>
> But users can set MPV=1 by write to mstatus CSR directly.

Make sense. The fields specification(WARL and others) of mstatus and 
other CSR  always not clear on the specification.  Maybe I missed 
something. But I think this field could be written by the mode software.

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>
> As described in spec, "When an MRET instruction is executed, the 
> virtualization mode V is set to MPV, unless
>
> MPP=3, in which case V remains 0."
>
> MPV is just ignored if MPP = 3. This also can be seen in "table 9.5 
> Effect of MPRV on the translation and protection of explicit memory 
> accesses".
>
> Regards,
>
> Weiwei Li
>
>>
>> Zhiwei
>>
>>>
>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>> ---
>>>   target/riscv/cpu_helper.c | 3 ++-
>>>   target/riscv/op_helper.c  | 3 ++-
>>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index 09ea227ceb..bd892c05d4 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -46,7 +46,8 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool 
>>> ifetch)
>>>             if (mode == PRV_M && get_field(status, MSTATUS_MPRV)) {
>>>               mode = get_field(env->mstatus, MSTATUS_MPP);
>>> -            virt = get_field(env->mstatus, MSTATUS_MPV);
>>> +            virt = get_field(env->mstatus, MSTATUS_MPV) &&
>>> +                   (mode != PRV_M);
>>>               if (virt) {
>>>                   status = env->vsstatus;
>>>               }
>>> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
>>> index f563dc3981..9cdb9cdd06 100644
>>> --- a/target/riscv/op_helper.c
>>> +++ b/target/riscv/op_helper.c
>>> @@ -335,7 +335,8 @@ target_ulong helper_mret(CPURISCVState *env)
>>>           riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, 
>>> GETPC());
>>>       }
>>>   -    target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV);
>>> +    target_ulong prev_virt = get_field(env->mstatus, MSTATUS_MPV) &&
>>> +                             (prev_priv != PRV_M);
>>>       mstatus = set_field(mstatus, MSTATUS_MIE,
>>>                           get_field(mstatus, MSTATUS_MPIE));
>>>       mstatus = set_field(mstatus, MSTATUS_MPIE, 1);

