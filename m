Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL68d-0001KK-Pc
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 11:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mL68c-0001Gj-Eh; Tue, 31 Aug 2021 11:57:26 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:52896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mL68Z-0008Kw-SC; Tue, 31 Aug 2021 11:57:26 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 534D141919;
 Tue, 31 Aug 2021 17:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630425440;
 bh=KbNRKDNUVZyVoxAFsnMJFve4Sf53yh9azq0eP5BG7/k=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=KmR2YWd1sBEPbG4dcvDKqfqkR1LB1NH5sSRTR8dl5FOi3cZTf3+C3yp4CutuFOkq3
 oFhwJLt3C7ZWPcNwJMsSo47cj5DM28K0pd6dlqjQyTgj4TvukFjy1FwmGZA0KqY5t9
 C3lNCFL9i5YI3yfvblF5Uaxko/0YsIuK9DJEonWGK41n/rIsMVR6WHYa7vAJ7TJ9Ib
 +XpXMYBmbEPH7R0B9ZSZjmIFQKQOZrD6tRmcpRqh4mORLp5CQKXqnEyjBwDaKg4LoT
 v+69EDzrRq0f5A3RzuVmfooZVfqSlmXZ/AkzhBAXoBBSOZyezjHBPue7dfu4bAEKHd
 iSGXm2s+Upk+w==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 4D2FE80035;
 Tue, 31 Aug 2021 17:57:20 +0200 (CEST)
Received: from [147.171.132.208] (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id DAB53187E13;
 Tue, 31 Aug 2021 17:57:19 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-4-frederic.petrot@univ-grenoble-alpes.fr>
 <f9094de6-f36a-4da7-d5ef-9fa976ae4c18@amsat.org>
 <653d064f-7020-dce0-a43b-6697e68b79b0@amsat.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH 4/8] target/riscv: 128-bit arithmetic and logic
 instructions
Message-ID: <592eba58-51ec-61db-2896-28cb2b7caa3b@univ-grenoble-alpes.fr>
Date: Tue, 31 Aug 2021 17:57:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <653d064f-7020-dce0-a43b-6697e68b79b0@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (110)
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
X-List-Received-Date: Tue, 31 Aug 2021 15:57:26 -0000

Hello Philippe,

Le 30/08/2021 à 23:40, Philippe Mathieu-Daudé a écrit :
> On 8/30/21 11:38 PM, Philippe Mathieu-Daudé wrote:
>> On 8/30/21 7:16 PM, Frédéric Pétrot wrote:
>>> Adding the support for the 128-bit arithmetic and logic instructions.
>>> Remember that all (i) instructions are now acting on 128-bit registers, that
>>> a few others are added to cope with values that are held on 64 bits within
>>> the 128-bit registers, and that the ones that cope with values on 32-bit
>>> must also be modified for proper sign extension.
>>> Most algorithms taken from Hackers' delight.
>>>
>>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>>> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
>>> ---
>>>  target/riscv/insn32.decode              |  13 +
>>>  target/riscv/insn_trans/trans_rvi.c.inc | 955 +++++++++++++++++++++++-
>>>  target/riscv/translate.c                |  25 +
>>>  3 files changed, 976 insertions(+), 17 deletions(-)
>>
>>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
>>> index 772330a766..0401ba3d69 100644
>>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>>> @@ -26,14 +26,20 @@ static bool trans_illegal(DisasContext *ctx, arg_empty *a)
>>>  
>>>  static bool trans_c64_illegal(DisasContext *ctx, arg_empty *a)
>>>  {
>>> -     REQUIRE_64BIT(ctx);
>>> -     return trans_illegal(ctx, a);
>>> +    REQUIRE_64_OR_128BIT(ctx);
>>> +    return trans_illegal(ctx, a);
>>>  }
>>>  
>>>  static bool trans_lui(DisasContext *ctx, arg_lui *a)
>>>  {
>>>      if (a->rd != 0) {
>>>          tcg_gen_movi_tl(cpu_gpr[a->rd], a->imm);
>>> +#if defined(TARGET_RISCV128)
>>> +        if (is_128bit(ctx)) {
>>
>> Maybe this could allow the compiler eventually elide the
>> code and avoid superfluous #ifdef'ry:
>>
>>            if (TARGET_LONG_BITS >= 128) {
> 
> Actually:
> 
>              if (TARGET_LONG_BITS >= 128 && is_128bit(ctx)) {

  We may have taken a wrong path then, because we have kept
  TARGET_LONG_BITS == 64 for the 128-bit case (as we use the tcg_xxx_tl of the
  64 version to generate our micro-ops, which I admit might be a mistake).

  Frédéric

> 
>>
>>> +            tcg_gen_ext_i64_i128(cpu_gpr[a->rd], cpu_gprh[a->rd],
>>> +                                 cpu_gpr[a->rd]);
>>> +        }
>>> +#endif
>>>      }
>>>      return true;
>>>  }
>>

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

