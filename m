Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdnh7-0004aG-Ur
	for mharc-qemu-riscv@gnu.org; Fri, 22 Oct 2021 02:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mdnh6-0004V8-CP; Fri, 22 Oct 2021 02:06:20 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:59088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mdnh4-0005Nu-29; Fri, 22 Oct 2021 02:06:19 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id EF24241B95;
 Fri, 22 Oct 2021 08:06:10 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id DA7BD60070;
 Fri, 22 Oct 2021 08:06:10 +0200 (CEST)
Received: from [192.168.1.75] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 1879A40063;
 Fri, 22 Oct 2021 08:06:10 +0200 (CEST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-7-frederic.petrot@univ-grenoble-alpes.fr>
 <820e8060-694d-9566-9d7a-da7ef9e06d21@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v3 06/21] target/riscv: array for the 64 upper bits of
 128-bit registers
Message-ID: <ab652765-8cb8-58e6-9906-090d2b0df91b@univ-grenoble-alpes.fr>
Date: Fri, 22 Oct 2021 08:06:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <820e8060-694d-9566-9d7a-da7ef9e06d21@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (40)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.867,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Oct 2021 06:06:20 -0000

Le 20/10/2021 à 16:44, Richard Henderson a écrit :
> On 10/19/21 2:47 AM, Frédéric Pétrot wrote:
>> The upper 64-bit of the 128-bit registers have now a place inside
>> the cpu state structure, and are created as globals for future use.
>>
>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
>> ---
>>   target/riscv/translate.c | 5 ++++-
>>   2 files changed, 5 insertions(+), 1 deletion(-)
>>       for (i = 1; i < 32; i++) {
>>           cpu_gpr[i] = tcg_global_mem_new(cpu_env,
>>               offsetof(CPURISCVState, gpr[i]), riscv_int_regnames[i]);
>> +        cpu_gprh[i] = tcg_global_mem_new(cpu_env,
>> +            offsetof(CPURISCVState, gprh[i]), riscv_int_regnames[i]);
> 
> This will just be confusing in the tcg dumps -- let's not name the two temps the
> identically.

  Agreed.

> Honestly, I'm not 100% thrilled about the / that appears in the current name; I
> think it would be easiest to do
> 
>   g_string_printf("x%d", i)
> and
>   g_string_printf("x%dh", i)

  Registers sw names are used by gcc -S and the default objdump -d output,
  and also by disas/riscv.c, so dropping them might be a bit rough.
  For now I'll just add an h in the existing names, and suggest we wait to see
  if anyone cares.

  Frédéric
-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

