Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mlBqo-0002UT-JQ
	for mharc-qemu-riscv@gnu.org; Thu, 11 Nov 2021 10:18:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mlBqm-0002Q5-DP; Thu, 11 Nov 2021 10:18:52 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:51092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mlBqi-0001sY-EF; Thu, 11 Nov 2021 10:18:52 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 4F4A041EFF;
 Thu, 11 Nov 2021 16:18:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1636643923;
 bh=SdiB6I5PH7bgvJH9cf0UkknrDn9WUYAlMtWtcqpZAqM=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=ccfcKxpOqs25qqeUus6cwzeS28vRmaLb/J1+5sKFQeeU2H+TXOWZbeNjx6Y32OIM/
 b2IwMHB9Fbd57g05Kby8biS+BLirTtzuNzYI4HYalJgX/js5f/fMr200ahlCCNn4qa
 /odju1Dnp0vukTwNvUOiqGqGfIyamr0mOSA8m6Mrdzar0PZ6Saa1VYHsZfKlraZi9L
 2P0kZdwEIF9b+6LbIdRI3lPiMDKoHKsHiUTbWTcjThidReUl7g+8zl3J0CuW3PuTp3
 vVMzHmR2Bo7rcDnlLzdspRaztiHnhfxNvDJJdRtzf5tRhxpWaIV1f0wp0qH/nIj8/v
 O4kgXfH5Ja+/w==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 405B660066;
 Thu, 11 Nov 2021 16:18:43 +0100 (CET)
Received: from [192.168.42.102] (unknown [217.114.201.18])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 171A840062;
 Thu, 11 Nov 2021 16:18:42 +0100 (CET)
Message-ID: <00e67460-09de-7b19-3e16-a2f9af3546ae@univ-grenoble-alpes.fr>
Date: Thu, 11 Nov 2021 16:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-21-zhiwei_liu@c-sky.com>
 <663dcab0-3370-7716-2abb-187893de6103@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v3 20/20] target/riscv: Enable uxl field write
In-Reply-To: <663dcab0-3370-7716-2abb-187893de6103@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (40)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 11 Nov 2021 15:18:52 -0000

On 11/11/2021 12:49, Richard Henderson wrote:
> On 11/11/21 6:58 AM, LIU Zhiwei wrote:
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/csr.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 8f8f170768..43eaa6c710 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -553,15 +553,14 @@ static RISCVException write_mstatus(CPURISCVState *env, 
>> int csrno,
>>            * RV32: MPV and GVA are not in mstatus. The current plan is to
>>            * add them to mstatush. For now, we just don't support it.
>>            */
>> -        mask |= MSTATUS_MPV | MSTATUS_GVA;
>> +        mask |= MSTATUS_MPV | MSTATUS_GVA | MSTATUS64_UXL;
>>       }
>>       mstatus = (mstatus & ~mask) | (val & mask);
>>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>> -        /* SXL and UXL fields are for now read only */
>> +        /* SXL fields are for now read only */
>>           mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
>> -        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
>>       }
>>       env->mstatus = mstatus;
> 
> Still missing the update for write_sstatus, which I think is simply an update to 
> sstatus_v1_10_mask.

   I take the liberty to jump in as I face the issue of updating that mask in the
   128-bit patches: sstatus_v1_10_mask is a target_ulong, and when compiling for
   32-bit hosts, we can't just or it with MSTATUS64_S/UXL that lie above the
   32-bit limits.
   I am currently oring in write_sstatus using a uint64_t mask, but this is not
   so nice.

   What solution would be best in your opinion ?
   Thanks,
   Frédéric
> 
> 
> r~
> 
> 

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

