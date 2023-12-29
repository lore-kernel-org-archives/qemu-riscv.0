Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E07FC46CD3
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 09:55:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJ9aY-0000AS-BH; Fri, 29 Dec 2023 04:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJ9aW-00009z-Rn; Fri, 29 Dec 2023 04:55:32 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJ9aT-0003Gb-Ta; Fri, 29 Dec 2023 04:55:32 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 3E3BAC000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1703843644;
 bh=8cJORYoWtCHQCvB6p9nERNVGCc6twexDcV18x4J3THs=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=PHF/vUjtsVV2Rz2fVdxfzo0UYSLH1qzLuz2MqDwB4FczaVpDEt8Bf6fJdHAkjFul6
 0MLec8Sr6/e3MWDcDIppy4/nveBVmWRbhB7WKcQ/od7Q0z2Pd2HcEHMkfDX6UAgTqf
 Y6zve36XMVE63YWAbjW9+nVKYjoFTWdDHYN/aIMKxKWpkOmb8YMWkVLPI4NWyFnuS/
 GI6bVh/Cyk/IW0AJ/OyG4NblE+ZKMTODerl83PXUNmHD7ay/AMPdMJKiEYCfPQg26g
 xRo+iUOMC+9sm+ISzfKS0GFQGBbbwj9vTWfn805u31koMW3A2e+83jRi5JOqjmRWes
 W/lc+oFT5NANw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1703843644;
 bh=8cJORYoWtCHQCvB6p9nERNVGCc6twexDcV18x4J3THs=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=FZHppnsXjkRBwaN+yY4/+rqUxoJesglY6/uUjMUIOVsh9lyibRDYy0QXGeVlQPkHL
 gNI5XkM8A0ySXtqdVKv+ynq1yEkcT7UNmFlVfdH7N+1TJC9otq6+h9sJXQYfrje0Dv
 BcwI7Cpn7OP4qhZsRT0LeqA1TO87xrXPCpVcBTaBrfUzuSVytT3QRLjrBc61DqLzWH
 Kx4TXMqgPuWgATIuCvW+fIO4AJ7BIe1iDolABKJ+J8KVgUOPa3pp2SPnkysf67OKLV
 8oeAlCc9AilibrWUGrkk70/zJ8Q8TT5da3XZWoi6OQXm+2AZzgFv/xgoRlAlWC9ZJ0
 O3t6ZCKmqGB2Q==
Message-ID: <3d6ed7cd-a5ab-41f3-87bb-a08ae637e45a@syntacore.com>
Date: Fri, 29 Dec 2023 12:54:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv/tcg: do not set defaults for non-generic
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 <qemu-riscv@nongnu.org>
CC: <qemu-devel@nongnu.org>, <zhiwei_liu@linux.alibaba.com>,
 <liwei1518@gmail.com>, <bin.meng@windriver.com>, <alistair.francis@wdc.com>,
 <palmer@dabbelt.com>
References: <20231229080302.125418-1-vladimir.isaev@syntacore.com>
 <44b63588-dfa6-4572-a767-84677ee6c0a2@ventanamicro.com>
Content-Language: en-US, ru-RU
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
In-Reply-To: <44b63588-dfa6-4572-a767-84677ee6c0a2@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=vladimir.isaev@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

29.12.2023 12:15, Daniel Henrique Barboza wrote:
> 
> On 12/29/23 05:02, Vladimir Isaev wrote:
>> riscv_cpu_options[] are exported using qdev and some of them are defined
>> with default values. This is unfortunate since riscv_cpu_add_user_properties()
>> is called after CPU instance init and there is no clear way to disable MMU/PMP
>> for some CPUs.
>>
>> Can't define them as NODEFAULT since we still need defaults for generic CPU.
>>
>> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
>> ---
> 
> This issue is fixed by this series:
> 
> 
> "[PATCH v2 00/16] target/riscv: deprecate riscv_cpu_options[]"
> 
> https://lore.kernel.org/qemu-riscv/20231222122235.545235-1-dbarboza@ventanamicro.com/
> 
> 
> Feel free to give it a go. Thanks,
> 
> 
> Daniel

Works for me, thank you!

Vladimir Isaev
> 
> 
>>   target/riscv/tcg/tcg-cpu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
>> index 8a35683a345d..9ffce1c9f7b0 100644
>> --- a/target/riscv/tcg/tcg-cpu.c
>> +++ b/target/riscv/tcg/tcg-cpu.c
>> @@ -937,6 +937,8 @@ static void riscv_cpu_add_multiext_prop_array(Object *obj,
>>    */
>>   static void riscv_cpu_add_user_properties(Object *obj)
>>   {
>> +    bool use_def_vals = riscv_cpu_is_generic(obj);
>> +
>>   #ifndef CONFIG_USER_ONLY
>>       riscv_add_satp_mode_properties(obj);
>>   #endif
>> @@ -950,6 +952,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
>>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
>>
>>       for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
>> +        prop->set_default = prop->set_default && use_def_vals;
>> +
>>           qdev_property_add_static(DEVICE(obj), prop);
>>       }
>>   }

