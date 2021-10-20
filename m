Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdH6q-00019q-DH
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 15:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mdH6R-00015N-7Q; Wed, 20 Oct 2021 15:18:22 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:37288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mdH6K-0004U2-61; Wed, 20 Oct 2021 15:18:15 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 5AE554212B;
 Wed, 20 Oct 2021 21:18:05 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 4824360067;
 Wed, 20 Oct 2021 21:18:05 +0200 (CEST)
Received: from [192.168.1.36] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 6F9AF14005D;
 Wed, 20 Oct 2021 21:18:04 +0200 (CEST)
To: Richard Henderson <rth7680@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-12-frederic.petrot@univ-grenoble-alpes.fr>
 <1eb7ef2b-b636-3c93-a2d3-4d498da9865d@gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v3 11/21] target/riscv: support for 128-bit bitwise
 instructions
Message-ID: <2f7facfa-41c2-fc3b-718f-c921af5ce2c2@univ-grenoble-alpes.fr>
Date: Wed, 20 Oct 2021 21:18:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1eb7ef2b-b636-3c93-a2d3-4d498da9865d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
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
X-List-Received-Date: Wed, 20 Oct 2021 19:18:31 -0000

Le 20/10/2021 à 19:47, Richard Henderson a écrit :
> On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
>> The 128-bit bitwise instructions do not need any function prototype change
>> as the functions can be applied independently on the lower and upper part of
>> the registers.
>>
>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
>> ---
>>   target/riscv/translate.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index e8f08f921e..71982f6284 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -429,6 +429,17 @@ static bool gen_logic_imm_fn(DisasContext *ctx, arg_i *a,
>> DisasExtend ext,
>>         gen_set_gpr(ctx, a->rd, dest);
>>   +    if (get_xl_max(ctx) == MXL_RV128) {
>> +        if (get_ol(ctx) ==  MXL_RV128) {
>> +            uint64_t immh = -(a->imm < 0);
>> +            src1 = get_gprh(ctx, a->rs1);
>> +            dest = dest_gprh(ctx, a->rd);
>> +
>> +            func(dest, src1, immh);
>> +        }
>> +        gen_set_gprh(ctx, a->rd, dest);
>> +    }
> 
> If ol < RV128, you're storing the low dest into the gprh, which is wrong.  It
> should be the sign-extension of the low part.  But that should happen for all
> writes.

  Thanks for your feedback (on the other parts too) that I'll apply.

  On this specific case, in gen_set_gprh I check that the operation is not on
  128 bit in which case I propagate the sign of the low part instead of using
  dest (the spec says that the sign should propagate to misa_xl_max, irrelevant
  of xl).
  This implicitly forces the order in which the functions must be called as you
  noticed, and introducing a higher level function as you suggest would indeed
  make things more readable, and this can probably be applied in most places.

Frédéric
-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

