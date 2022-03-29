Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZEjG-00043J-VH
	for mharc-qemu-riscv@gnu.org; Tue, 29 Mar 2022 12:29:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nZEjE-00042j-TC; Tue, 29 Mar 2022 12:29:56 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:38044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1nZEjB-00022J-Rn; Tue, 29 Mar 2022 12:29:55 -0400
Received: from mailhub.u-ga.fr (mailhub-1.u-ga.fr [129.88.178.98])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id C9ED64025F;
 Tue, 29 Mar 2022 18:29:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1648571389;
 bh=qE3OiJKrPwJ+8I6rGY74/OK07nzmeXcWe1n5Tt1cBGc=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=D8vAbWAvfpFOYlxUkapkgW5ucQvAaQgzdNKdlXTQRLYhP3+vMOBnrR7PWyFdeX9B3
 0ITb6YpTFk+b+kgtQFa+WOgMYxLIKQYRIwW5vV7Zjh4IVnig9+z87ydvv01J3ZAlvO
 61yF3GerjPUa/am8/Q8iW8bgwu+sGWGdcny7DECbBe5AXQgG2ebjxZfLywJGFGDy45
 6kuhGkGxEvD/NSU+xjN0+MmzhZ9+8s4NXpGyaRVZqqo7xHgBF5gD/DG/4bq+c0q8Ak
 Lrxs6EhO96Zq/xYnaCVqAHEShRJBnlB3+lOQbfauofayJTz/Mcc/RVyty1TeNPlwS7
 XkucSyMJJJ3qQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhub.u-ga.fr (Postfix) with ESMTP id C785710005A;
 Tue, 29 Mar 2022 18:29:49 +0200 (CEST)
Received: from [147.171.132.208] (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 90161140057;
 Tue, 29 Mar 2022 18:29:49 +0200 (CEST)
Message-ID: <0b23307b-5427-0882-9bc6-bd2bd22f0c3d@univ-grenoble-alpes.fr>
Date: Tue, 29 Mar 2022 18:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: fr
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair23@gmail.com>, Frank Chang <frank.chang@sifive.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <cover.1648473008.git.research_trasio@irq.a4lg.com>
 <4a4c11213a161a7eedabe46abe58b351bb0e2ef2.1648473008.git.research_trasio@irq.a4lg.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v2 1/1] target/riscv: misa to ISA string conversion fix
In-Reply-To: <4a4c11213a161a7eedabe46abe58b351bb0e2ef2.1648473008.git.research_trasio@irq.a4lg.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
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
X-List-Received-Date: Tue, 29 Mar 2022 16:29:57 -0000

Hello,

Le 28/03/2022 à 15:11, Tsukasa OI a écrit :
> Some bits in RISC-V `misa' CSR should not be reflected in the ISA
> string.  For instance, `S' and `U' (represents existence of supervisor
> and user mode, respectively) in `misa' CSR must not be copied since
> neither `S' nor `U' are valid single-letter extensions.
> 
> This commit also removes all reserved/dropped single-letter "extensions"
> from the list.
> 
> -   "B": Not going to be a single-letter extension (misa.B is reserved).
> -   "J": Not going to be a single-letter extension (misa.J is reserved).
> -   "K": Not going to be a single-letter extension (misa.K is reserved).
> -   "L": Dropped.
> -   "N": Dropped.
> -   "T": Dropped.
> 
> It also clarifies that the variable `riscv_single_letter_exts' is a
> single-letter extension order list.
> 
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>   target/riscv/cpu.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ddda4906ff..1f68c696eb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,7 +34,7 @@
>   
>   /* RISC-V CPU definitions */
>   
> -static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
> +static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
>   
>   const char * const riscv_int_regnames[] = {
>     "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
> @@ -901,12 +901,12 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>   char *riscv_isa_string(RISCVCPU *cpu)
>   {
>       int i;
> -    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) + 1;
> +    const size_t maxlen = sizeof("rv128") + sizeof(riscv_single_letter_exts);
>       char *isa_str = g_new(char, maxlen);
>       char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);

To avoid one dependency on TARGET_LONG_BITS that is not necessary now that we
have mxl, I would suggest to replace the previous line with:
      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d",
                                   1 << (4 + cpu->env.misa_mxl_max));

Frédéric

