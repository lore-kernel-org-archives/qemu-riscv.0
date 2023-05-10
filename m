Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4509CC7EE22
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 12:40:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwj6x-0004Er-3X; Wed, 10 May 2023 08:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pwj6s-0004DJ-Ks; Wed, 10 May 2023 08:40:00 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pwj6o-0002s1-By; Wed, 10 May 2023 08:39:56 -0400
Received: from [192.168.0.120] (unknown [61.165.33.195])
 by APP-05 (Coremail) with SMTP id zQCowADn72ePkFtkkDSPIQ--.30012S2;
 Wed, 10 May 2023 20:39:44 +0800 (CST)
Message-ID: <f8da3c0d-5a52-17bf-f8ea-ae72eda7533b@iscas.ac.cn>
Date: Wed, 10 May 2023 20:39:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH] target/riscv: Move zc* out of the experimental properties
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230510030040.20528-1-liweiwei@iscas.ac.cn>
 <ab9c553e-7f38-e1c3-7ac9-4c4814d04ded@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <ab9c553e-7f38-e1c3-7ac9-4c4814d04ded@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADn72ePkFtkkDSPIQ--.30012S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF4kuF13tF1UKFWktw4ruFg_yoW5Zr43pr
 n5GFW7K39xCr95CrW8tr1DJrW8Cw15AasrK3yFva97ArWIkrnFgF1DWr4vgr4xJr4rZw4I
 gF43ur1IvrZ5ta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
 wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5rWrDUUUU
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 2023/5/10 20:23, Daniel Henrique Barboza wrote:
>
>
> On 5/10/23 00:00, Weiwei Li wrote:
>> Zc* extensions (version 1.0) are ratified.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index db0875fb43..99ed9cb80e 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1571,6 +1571,14 @@ static Property riscv_cpu_extensions[] = {
>>         DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>>   +    DEFINE_PROP_BOOL("zca", RISCVCPU, cfg.ext_zca, false),
>> +    DEFINE_PROP_BOOL("zcb", RISCVCPU, cfg.ext_zcb, false),
>> +    DEFINE_PROP_BOOL("zcd", RISCVCPU, cfg.ext_zcd, false),
>> +    DEFINE_PROP_BOOL("zce", RISCVCPU, cfg.ext_zce, false),
>> +    DEFINE_PROP_BOOL("zcf", RISCVCPU, cfg.ext_zcf, false),
>
> I see that zcf has a different ordering in isa_edata_arr[]. Is this 
> intended?

Not really intended. But they are related to F and D extension, and F is 
before D insingle letter extensions.

Regards,

Weiwei Li


>
>     ISA_EXT_DATA_ENTRY(zca, PRIV_VERSION_1_12_0, ext_zca),
>     ISA_EXT_DATA_ENTRY(zcb, PRIV_VERSION_1_12_0, ext_zcb),
>     ISA_EXT_DATA_ENTRY(zcf, PRIV_VERSION_1_12_0, ext_zcf),
>     ISA_EXT_DATA_ENTRY(zcd, PRIV_VERSION_1_12_0, ext_zcd),
>     ISA_EXT_DATA_ENTRY(zce, PRIV_VERSION_1_12_0, ext_zce),
>
>
> Not related to this patch per se. Just wondered if there's some reason 
> for the
> different ordering between these arrays.
>
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>
>
>> +    DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
>> +    DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
>> +
>>       /* Vendor-specific custom extensions */
>>       DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
>>       DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
>> @@ -1588,14 +1596,6 @@ static Property riscv_cpu_extensions[] = {
>>       /* These are experimental so mark with 'x-' */
>>       DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>>   -    DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
>> -    DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
>> -    DEFINE_PROP_BOOL("x-zcd", RISCVCPU, cfg.ext_zcd, false),
>> -    DEFINE_PROP_BOOL("x-zce", RISCVCPU, cfg.ext_zce, false),
>> -    DEFINE_PROP_BOOL("x-zcf", RISCVCPU, cfg.ext_zcf, false),
>> -    DEFINE_PROP_BOOL("x-zcmp", RISCVCPU, cfg.ext_zcmp, false),
>> -    DEFINE_PROP_BOOL("x-zcmt", RISCVCPU, cfg.ext_zcmt, false),
>> -
>>       /* ePMP 0.9.3 */
>>       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>>       DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),


