Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1neWg0-0005gn-41
	for mharc-qemu-riscv@gnu.org; Wed, 13 Apr 2022 02:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1neWfm-0005fJ-9a; Wed, 13 Apr 2022 02:40:14 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:37658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1neWfk-0000w5-6s; Wed, 13 Apr 2022 02:40:13 -0400
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id B27634043A;
 Wed, 13 Apr 2022 08:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1649832008;
 bh=zkFRF6VZhSZ7O+Ld1XDYuJsRsV75QofhXaumaR0tUL0=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=kAtLKxlJLEQdUOSp8PaKxcq6YBgHuhjwQdmk3MGCJMPG795w0TjUTUN27UeTJnSb4
 hnrGlOTv7069hX7DeJcUUorngIlN+tNWTbpMCcln8Tv/eVxcIL2XwbEnVkVfC4GBrh
 43gvPO8lYuEHg2qmxyZJGLnYP8V8U7VMYZS/e9UfgAoUyEeKJs9BHfMOm5qRouq3bV
 gzBhG5ZfEoj9I1/xrYCcP05TdMhAQSYNFUOxxczM+9lLnBFZF2KFvvZ/7I1Qj6sxSo
 Xe5gYCtXX7Zf6A1NzS5j8xwe37OED2RHNdVLL1Bic8sTp34Mi6n+aKH09qR2XGDI1l
 HdRhcvhc18KMA==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhub.u-ga.fr (Postfix) with ESMTP id B003A100065;
 Wed, 13 Apr 2022 08:40:08 +0200 (CEST)
Received: from [192.168.1.62] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 0276B40081;
 Wed, 13 Apr 2022 08:40:07 +0200 (CEST)
Message-ID: <414ac8a5-f1dc-7a30-06e2-16ee764571db@univ-grenoble-alpes.fr>
Date: Wed, 13 Apr 2022 08:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com
References: <20220409094612.1908512-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20220409094612.1908512-2-frederic.petrot@univ-grenoble-alpes.fr>
 <16256d45-740c-c858-b5ce-3eb1e4b10565@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH] target/riscv: replace TARGET_LONG_BITS in gdbstub
In-Reply-To: <16256d45-740c-c858-b5ce-3eb1e4b10565@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 13 Apr 2022 06:40:16 -0000



Le 09/04/2022 à 17:39, Richard Henderson a écrit :
> On 4/9/22 02:46, Frédéric Pétrot wrote:
>> Now that we have misa xlen, use that in riscv gdbstub.c instead of the
>> TARGET_LONG_BITS define, and use riscv_cpu_mxl_bits to provide the number of
>> bits in a consistent way.
>>
>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>> ---
>>   target/riscv/gdbstub.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
>> index 9ed049c29e..1602f76d2b 100644
>> --- a/target/riscv/gdbstub.c
>> +++ b/target/riscv/gdbstub.c
>> @@ -305,7 +305,7 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int 
>> base_reg)
>>       CPURISCVState *env = &cpu->env;
>>       GString *s = g_string_new(NULL);
>>       riscv_csr_predicate_fn predicate;
>> -    int bitsize = 16 << env->misa_mxl_max;
>> +    int bitsize = riscv_cpu_mxl_bits(env);
> 
> This isn't correct, changing from using max to current mxl.
> 
> You might think this is ok, because this will run up in startup, but it really 
> runs whenever gdb attaches to the stub.  Which could be anytime.

   I guess it should then be gdb responsibility to check mxl/sxl/uxl and act
   accordingly.
   I'll introduce a new macro then.
   Thanks,
   Frédéric

> 
> 
> r~

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

