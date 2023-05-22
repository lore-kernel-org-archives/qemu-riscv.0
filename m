Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9770EC7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 May 2023 14:27:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q16VU-0005A2-Be; Mon, 22 May 2023 10:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q16VS-00059K-8E; Mon, 22 May 2023 10:27:26 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q16VP-0004DS-Ol; Mon, 22 May 2023 10:27:26 -0400
Received: from [192.168.0.120] (unknown [61.165.33.195])
 by APP-01 (Coremail) with SMTP id qwCowACnrJjEe2tkGYt1Aw--.2777S2;
 Mon, 22 May 2023 22:27:17 +0800 (CST)
Message-ID: <5d70173d-75d0-a072-2e36-777d91496df5@iscas.ac.cn>
Date: Mon, 22 May 2023 22:27:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 3/7] disas/riscv.c: Support disas for Zcm* extensions
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230519021926.15362-1-liweiwei@iscas.ac.cn>
 <20230519021926.15362-4-liweiwei@iscas.ac.cn>
 <0ca6bb76-ba1c-4185-6faf-e70f979849da@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <0ca6bb76-ba1c-4185-6faf-e70f979849da@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACnrJjEe2tkGYt1Aw--.2777S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCry8Kr1fuw1UXr1xury8Zrb_yoWruF1kpr
 1kJr1UJryUJr18Jr1UJr1UJryUJr1UJw1UJr1UJF1UJr1UJr1jqr1UXr1jgr1UJr48Jr1U
 Jr1UJr1UZr1UJrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW5XwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
 x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.091,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 2023/5/22 21:10, Daniel Henrique Barboza wrote:
> In fact, apparently checkpatch.pl is not too happy about this patch:
>
> On 5/18/23 23:19, Weiwei Li wrote:
>> Support disas for Zcmt* instructions only when related extensions
>> are supported.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   disas/riscv.c | 20 ++++++++++++--------
>>   1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/disas/riscv.c b/disas/riscv.c
>> index 729ab684da..9e01810eef 100644
>> --- a/disas/riscv.c
>> +++ b/disas/riscv.c
>> @@ -2501,7 +2501,7 @@ static void decode_inst_opcode(rv_decode *dec, 
>> rv_isa isa)
>>                   op = rv_op_c_sqsp;
>>               } else {
>>                   op = rv_op_c_fsdsp;
>> -                if (((inst >> 12) & 0b01)) {
>> +                if (dec->cfg->ext_zcmp && ((inst >> 12) & 0b01)) {
>>                       switch ((inst >> 8) & 0b01111) {
>>                       case 8:
>>                           if (((inst >> 4) & 0b01111) >= 4) {
>> @@ -2527,16 +2527,20 @@ static void decode_inst_opcode(rv_decode 
>> *dec, rv_isa isa)
>>                   } else {
>>                       switch ((inst >> 10) & 0b011) {
>>                       case 0:
>> -                        if (((inst >> 2) & 0xFF) >= 32) {
>> -                            op = rv_op_cm_jalt;
>> -                        } else {
>> -                            op = rv_op_cm_jt;
>> +                        if (dec->cfg->ext_zcmt) {
>> +                            if (((inst >> 2) & 0xFF) >= 32) {
>> +                                op = rv_op_cm_jalt;
>> +                            } else {
>> +                                op = rv_op_cm_jt;
>> +                            }
>>                           }
>>                           break;
>>                       case 3:
>> -                        switch ((inst >> 5) & 0b011) {
>> -                        case 1: op = rv_op_cm_mvsa01; break;
>> -                        case 3: op = rv_op_cm_mva01s; break;
>> +                        if (dec->cfg->ext_zcmp) {
>> +                            switch ((inst >> 5) & 0b011) {
>> +                            case 1: op = rv_op_cm_mvsa01; break;
>> +                            case 3: op = rv_op_cm_mva01s; break;
>> +                            }
>
> At this point:
>
> ================
> 3/7 Checking commit 989059d476f9 (disas/riscv.c: Support disas for 
> Zcm* extensions)
> ERROR: trailing statements should be on next line
> #51: FILE: disas/riscv.c:2541:
> +                            case 1: op = rv_op_cm_mvsa01; break;
>
> ERROR: trailing statements should be on next line
> #52: FILE: disas/riscv.c:2542:
> +                            case 3: op = rv_op_cm_mva01s; break;
>
> total: 2 errors, 0 warnings, 35 lines checked
>
> Patch 3/7 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> ================
>
Yeah. I also found this errors when I ran the checkpatch.pl.

However, this is the usual code style in this file. So I didn't fix it.

Regards,

Weiwei Li

>
> The issue predates your patch. It would be very nice of you if you can 
> fix it
> though :D
>
>
>
> Daniel
>
>
>>                           }
>>                           break;
>>                       }


