Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1memIi-0005Q0-FX
	for mharc-qemu-riscv@gnu.org; Sun, 24 Oct 2021 18:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1memIg-0005Mz-JJ; Sun, 24 Oct 2021 18:49:10 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:53058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1memIe-000275-Av; Sun, 24 Oct 2021 18:49:10 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id A627D418F5;
 Mon, 25 Oct 2021 00:49:02 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 9598960067;
 Mon, 25 Oct 2021 00:49:02 +0200 (CEST)
Received: from [192.168.1.75] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id D052E14005A;
 Mon, 25 Oct 2021 00:49:01 +0200 (CEST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-14-frederic.petrot@univ-grenoble-alpes.fr>
 <63197bd9-52d1-66a1-e056-17d84ba7ec02@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v3 13/21] target/riscv: support for 128-bit shift
 instructions
Message-ID: <79abb064-3f67-7aac-f1b6-f9ab2adbc7f6@univ-grenoble-alpes.fr>
Date: Mon, 25 Oct 2021 00:49:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <63197bd9-52d1-66a1-e056-17d84ba7ec02@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.33,
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
X-List-Received-Date: Sun, 24 Oct 2021 22:49:11 -0000

Le 20/10/2021 à 21:06, Richard Henderson a écrit :
> On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> 
> Hmm.  3 * (and + shift + cmp + cmov) + 2 * (sub + or) = 16 ops.
> Not horrible...
> 
> Let's see.
> 
>     ls = sh & 63;        1
>     rs = -sh & 63;       3
>     hs = sh & 64;        4
> 
>     ll = s1l << ls;      5
>     h0 = s1h << ls;      6
>     lr = s1l >> rs;      7
>     h1 = h0 | lr;        8
> 
>     dl = hs ? 0 : ll;    10
>     dh = hs ? ll : h1;   12
> 
> That seems right, and would be 4 ops smaller.
> Would need testing of course.

  Nice !
  The case when sh is 0 is specific, so we need an additional
  cmov, but this is still 3 ops better.

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

