Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B77EB64DB
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 13:14:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q9moH-0004X5-Qm; Thu, 15 Jun 2023 09:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9moG-0004Uw-60; Thu, 15 Jun 2023 09:14:44 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q9moD-0003eY-Ck; Thu, 15 Jun 2023 09:14:43 -0400
Received: from [192.168.100.156] (unknown [117.61.100.158])
 by APP-05 (Coremail) with SMTP id zQCowADHzBy0DotkRj29Ag--.24970S2;
 Thu, 15 Jun 2023 21:14:29 +0800 (CST)
Message-ID: <e274be8a-a863-8c39-9806-349b37e94b50@iscas.ac.cn>
Date: Thu, 15 Jun 2023 21:14:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2 1/6] target/riscv: Add properties for BF16 extensions
Content-Language: en-US
To: Rob Bradford <rbradford@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230615063302.102409-1-liweiwei@iscas.ac.cn>
 <20230615063302.102409-2-liweiwei@iscas.ac.cn>
 <4b6274c6741baf435b5579f5a089c65997a8e0e6.camel@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <4b6274c6741baf435b5579f5a089c65997a8e0e6.camel@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADHzBy0DotkRj29Ag--.24970S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF4ktF1DurykJF43Zr18Zrb_yoW5trykpr
 4kGa90kryDJrykCw17Jr1UJa4UCr18X3Wvgwsaqa47ZFW3GrWYqr1Uur1qgF1UJF48GF4Y
 9w1UuFnrZrsrXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-Originating-IP: [117.61.100.158]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 2023/6/15 20:58, Rob Bradford wrote:
> On Thu, 2023-06-15 at 14:32 +0800, Weiwei Li wrote:
>> Add ext_zfbfmin/zvfbfmin/zvfbfwma properties.
>> Add require check for BF16 extensions.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   target/riscv/cpu.c     | 20 ++++++++++++++++++++
>>   target/riscv/cpu_cfg.h |  3 +++
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 881bddf393..dc6b2f72f6 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1059,6 +1059,11 @@ void
>> riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>           return;
>>       }
>>   
>> +    if (cpu->cfg.ext_zfbfmin && !riscv_has_ext(env, RVF)) {
>> +        error_setg(errp, "Zfbfmin extension depends on F
>> extension");
>> +        return;
>> +    }
>> +
>>       if (riscv_has_ext(env, RVD) && !riscv_has_ext(env, RVF)) {
>>           error_setg(errp, "D extension requires F extension");
>>           return;
>> @@ -1109,6 +1114,21 @@ void
>> riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>           return;
>>       }
>>   
>> +    if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zfbfmin) {
>> +        error_setg(errp, "Zvfbfmin extension depends on Zfbfmin
>> extension");
>> +        return;
>> +    }
>> +
>> +    if (cpu->cfg.ext_zvfbfmin && !cpu->cfg.ext_zve32f) {
>> +        error_setg(errp, "Zvfbfmin extension depends on Zve32f
>> extension");
>> +        return;
>> +    }
> I don't think this is correct - from the spec:
>
> "This extension [Zvfbfmin] depends on the Zfbfmin extension and either
> the "V" extension or the Zve32f embedded vector extension."
>
> So this should be:
>
> +    if (cpu->cfg.ext_zvfbfmin && !(cpu->cfg.ext_zve32f || cpu-
>> cfg.ext_v) {
> +        error_setg(errp, "Zvfbfmin extension depends on Zve32f or V
> extension");
> +        return;
> +    }

Zve32f will be enabled when V is enabled. So we can simply check Zve32f 
here.

Regards,

Weiwei Li

> Cheers,
>
> Rob
>
>> +
>> +    if (cpu->cfg.ext_zvfbfwma && !cpu->cfg.ext_zvfbfmin) {
>> +        error_setg(errp, "Zvfbfwma extension depends on Zvfbfmin
>> extension");
>> +        return;
>> +    }
>> +
>>       /* Set the ISA extensions, checks should have happened above */
>>       if (cpu->cfg.ext_zhinx) {
>>           cpu->cfg.ext_zhinxmin = true;
>> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
>> index c4a627d335..7d16f32720 100644
>> --- a/target/riscv/cpu_cfg.h
>> +++ b/target/riscv/cpu_cfg.h
>> @@ -75,6 +75,7 @@ struct RISCVCPUConfig {
>>       bool ext_svpbmt;
>>       bool ext_zdinx;
>>       bool ext_zawrs;
>> +    bool ext_zfbfmin;
>>       bool ext_zfh;
>>       bool ext_zfhmin;
>>       bool ext_zfinx;
>> @@ -84,6 +85,8 @@ struct RISCVCPUConfig {
>>       bool ext_zve64f;
>>       bool ext_zve64d;
>>       bool ext_zmmul;
>> +    bool ext_zvfbfmin;
>> +    bool ext_zvfbfwma;
>>       bool ext_zvfh;
>>       bool ext_zvfhmin;
>>       bool ext_smaia;


