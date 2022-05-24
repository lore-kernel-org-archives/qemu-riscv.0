Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ntQWF-0007E8-0Y
	for mharc-qemu-riscv@gnu.org; Tue, 24 May 2022 05:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1ntQW8-00077J-3J; Tue, 24 May 2022 05:07:52 -0400
Received: from mail-sender-0.a4lg.com
 ([2401:2500:203:30b:4000:6bfe:4757:0]:48952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1ntQW4-0001NK-G0; Tue, 24 May 2022 05:07:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id E4994300089;
 Tue, 24 May 2022 09:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1653383258;
 bh=ojSMcEm9/W0pSbG06iEN8X9hnLeQSxdkgCSUkiYNn0Q=;
 h=Message-ID:Date:Mime-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=Lk+9ckRTY6Efjoh+8CIUPVHc+uuhGq8ACbj4nWLTt+0kMhotDlSrxyMojsxnY5AJs
 QqtTiEnVeuuvELG/I/9BzzCypLjmWaaALNeMbOGxfhNp9g9pjWngT1A/cojF+xwO2o
 V2WMvQkj9rTNQ1AXWob2KDYDa/k7sXNuaVH6iDIU=
Message-ID: <dbe0a9b9-00bc-870d-f678-13a45e5a3930@irq.a4lg.com>
Date: Tue, 24 May 2022 18:07:36 +0900
Mime-Version: 1.0
Subject: Re: [PATCH v2 2/5] target/riscv: Disable "G" by default
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
 <cab7205f1d7668f642fa242386543334af6bc1bd.1652583332.git.research_trasio@irq.a4lg.com>
 <e803a275-c54b-bc9c-430a-1bbbf5b14115@eldorado.org.br>
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <e803a275-c54b-bc9c-430a-1bbbf5b14115@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 24 May 2022 09:07:54 -0000



On 2022/05/17 3:04, Víctor Colombo wrote:
> On 14/05/2022 23:56, Tsukasa OI wrote:
>> Because "G" virtual extension expands to "IMAFD", we cannot separately
>> disable extensions like "F" or "D" without disabling "G".  Because all
>> "IMAFD" are enabled by default, it's harmless to disable "G" by default.
>>
>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
>> ---
>>   target/riscv/cpu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 00bf26ec8b..3ea68d5cd7 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -812,7 +812,7 @@ static Property riscv_cpu_properties[] = {
>>       /* Defaults for standard extensions */
>>       DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
>>       DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
>> -    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, true),
>> +    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
>>       DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
>>       DEFINE_PROP_BOOL("a", RISCVCPU, cfg.ext_a, true),
>>       DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
>> -- 
>> 2.34.1
>>
>>
> 
> I think the logic looks ok, and (with my limited understanding of the
> code) I agree on the reasoning for the changes in patches 2 and 3.
> Just some clarification needed: where is the value of 'g' checked?
> can the behavior change in this patch cause a situation where
> IMAFD_Zicsr_Zifencei is set but 'g' is not, or does patch 3
> guarantee that in this case 'g' will be set?
> 
> 
> Thanks!
> 

Probably too late to answer but on Alistair's riscv-to-apply.next tree...

target/riscv/cpu.c (19f13a9) line 599-611:
if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                        cpu->cfg.ext_a && cpu->cfg.ext_f &&
                        cpu->cfg.ext_d &&
                        cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
    warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
    cpu->cfg.ext_i = true;
    cpu->cfg.ext_m = true;
    cpu->cfg.ext_a = true;
    cpu->cfg.ext_f = true;
    cpu->cfg.ext_d = true;
    cpu->cfg.ext_icsr = true;
    cpu->cfg.ext_ifencei = true;
}

This is the only place where "G" (ext_g) is read.  Here, if G is enabled
and not all IMAFD_Zicsr_Zifencei are enabled, it enables them with a
warning message.

So, even if "G" is disabled alone, it's harmless.  Note that
IMAFD_Zicsr_Zifencei are enabled by default.

Thanks,
Tsukasa

