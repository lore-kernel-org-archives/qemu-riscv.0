Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAGtN-0008Hm-Lp
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 14:45:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nAGtH-0008G9-4u; Wed, 19 Jan 2022 14:45:07 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:44052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nAGtE-0008Nd-Qc; Wed, 19 Jan 2022 14:45:06 -0500
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 3BBB840233;
 Wed, 19 Jan 2022 20:44:59 +0100 (CET)
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by mailhub.u-ga.fr (Postfix) with ESMTP id 3913E10006E;
 Wed, 19 Jan 2022 20:44:59 +0100 (CET)
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 29C4B60066;
 Wed, 19 Jan 2022 20:44:59 +0100 (CET)
Received: from [192.168.1.64] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 6E26C4006D;
 Wed, 19 Jan 2022 20:44:58 +0100 (CET)
Message-ID: <d654ab4d-7347-f6ce-2845-d319c318f978@univ-grenoble-alpes.fr>
Date: Wed, 19 Jan 2022 20:44:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RESEND] target/riscv: fix RV128 lq encoding
Content-Language: fr
To: Christoph Muellner <cmuellner@linux.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20220118163245.2596468-1-cmuellner@linux.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20220118163245.2596468-1-cmuellner@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 19 Jan 2022 19:45:09 -0000

Le 18/01/2022 à 17:32, Christoph Muellner a écrit :
> If LQ has func3==010 and is located in the MISC-MEM opcodes,
> then it conflicts with the CBO opcode space.
> However, since LQ is specified as: "LQ is added to the MISC-MEM major
> opcode", we have an implementation bug, because 'major opcode'
> refers to func3, which must be 111.
> 
> This results in the following instruction encodings:
> 
> lq        ........ ........ .111.... .0001111
> cbo_clean 00000000 0001.... .0100000 00001111
> cbo_flush 00000000 0010.... .0100000 00001111
> cbo_inval 00000000 0000.... .0100000 00001111
> cbo_zero  00000000 0100.... .0100000 00001111
>                               ^^^-func3
>                                        ^^^^^^^-opcode

   Hello Christoph,
   I see page table 26.1 of the last riscv-isa-manual.pdf what is called major
   opcodes in my understanding, and MISC-MEM is one of them with value 00_111_11.
   The value for func3 that I chose comes from
   https://github.com/michaeljclark/riscv-meta/blob/master/opcodes
   which admittedly is out-dated, but I don't see any particular value for
   LQ/SQ in the new spec either (I mean, riscv-isa-manual.pdf, any pointer we
   could refer to ?).
   I have nothing against changing the opcode, but then we need to change
   disas/riscv.c which also uses the previous opcode to dump instructions when
   running with -d in_asm.

   Frédéric
> 
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> ---
>   target/riscv/insn32.decode | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5bbedc254c..d3f798ca10 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -168,7 +168,7 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
>   
>   # *** RV128I Base Instruction Set (in addition to RV64I) ***
>   ldu      ............   ..... 111 ..... 0000011 @i
> -lq       ............   ..... 010 ..... 0001111 @i
> +lq       ............   ..... 111 ..... 0001111 @i
>   sq       ............   ..... 100 ..... 0100011 @s
>   addid    ............  .....  000 ..... 1011011 @i
>   sllid    000000 ......  ..... 001 ..... 1011011 @sh6

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

