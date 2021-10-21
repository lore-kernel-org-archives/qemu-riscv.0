Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdaq4-0002ra-LN
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 12:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mdaq2-0002pR-SJ; Thu, 21 Oct 2021 12:22:42 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:58604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mdapz-0000mZ-US; Thu, 21 Oct 2021 12:22:42 -0400
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id E1E39425FB;
 Thu, 21 Oct 2021 18:22:35 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id CCA1660067;
 Thu, 21 Oct 2021 18:22:35 +0200 (CEST)
Received: from [130.190.109.101] (eduroam-109101.grenet.fr [130.190.109.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 1B00440063;
 Thu, 21 Oct 2021 18:22:35 +0200 (CEST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-5-frederic.petrot@univ-grenoble-alpes.fr>
 <3cd0ab2a-1261-066c-cd74-6ce226d1d1b0@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v3 04/21] target/riscv: additional macros to check
 instruction support
Message-ID: <546fec4a-6a13-d92d-e9b1-c98550de38c7@univ-grenoble-alpes.fr>
Date: Thu, 21 Oct 2021 18:22:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3cd0ab2a-1261-066c-cd74-6ce226d1d1b0@linaro.org>
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
X-List-Received-Date: Thu, 21 Oct 2021 16:22:43 -0000

Le 20/10/2021 à 16:08, Richard Henderson a écrit :
> On 10/19/21 2:47 AM, Frédéric Pétrot wrote:
>> +
>> +#define REQUIRE_64_OR_128BIT(ctx) do { \
>> +    if (get_xl(ctx) == MXL_RV32) {     \
>> +        return false;                  \
>> +    }                                  \
>> +} while (0)
> 
> So... you've left REQUIRE_64BIT accepting RV128, so that means that your current
> REQUIRE_64_OR_128BIT is redundant.  Is that intentional?
> 
> It does seem like all places that accept RV128 should accept RV64, but perhaps
> that's just your "limited" caveat in the cover letter.

  My bad, indeed there is no instruction only required by RV64. "Limited" was
  related to the minimal support of the priviledge spec.
> You don't use REQUIRE_32_OR_64BIT at all.  Remove it?

  It's a bug : some compressed insns are only RV32/RV64 (this is linked to
  the other bug in the order in which the insns stand in the insn16.decode
  file that you pointed out).

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

