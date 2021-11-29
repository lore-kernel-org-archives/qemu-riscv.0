Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mrhd2-0004UQ-8N
	for mharc-qemu-riscv@gnu.org; Mon, 29 Nov 2021 09:27:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrhd0-0004Nx-Cl; Mon, 29 Nov 2021 09:27:34 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:36830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mrhcr-0001LS-M5; Mon, 29 Nov 2021 09:27:34 -0500
Received: from mailhost.u-ga.fr (mailhost1.u-ga.fr [152.77.1.10])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 1285E4035F;
 Mon, 29 Nov 2021 15:27:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1638196038;
 bh=T9/4HLvwPIW+zb/rCES44C4+xHGatVwg8z2JAbgbfeI=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=HHwZK6L7US/OIxsHODwcvq63OBC/Dr5chnPw0VCBMDf9o/PiqWNOKYyMgjVNDFPnF
 mB+gtNPVqMpGnDWgiUi2t62MIknBOJ7PscX89ugZ5WR/fHDhEJVQtfPNWpSBf17IL7
 dNVnSkDUy/m0d68XBAWbNu1Ew/x73ZpsWJz4/Gi+ipo5PmUKpLJUMBA0f0TqwJ+7ND
 eZ4aaQKaMu8s6npqU0C7flgpns2RuDaFQSqk1YPabT2yek7Lcg2VSzBGMTBs+4uJut
 WYkK2lbw4Q1EfCmT9HGWMHLpTkX3olG5sXMIElFNPHqLB5RWUQVQQqzxqeRFUh0tq6
 J3fED2SmRDLsg==
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id C034360074;
 Mon, 29 Nov 2021 15:27:17 +0100 (CET)
Received: from [192.168.1.64] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 2B65C40069;
 Mon, 29 Nov 2021 15:27:17 +0100 (CET)
Message-ID: <2e6d2c92-3374-0400-9bf5-128c3c1d2132@univ-grenoble-alpes.fr>
Date: Mon, 29 Nov 2021 15:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211128135719.50444-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211128135719.50444-4-frederic.petrot@univ-grenoble-alpes.fr>
 <a37bf796-567e-2331-be42-38f756b105cd@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH v6 03/18] qemu/int128: addition of div/rem 128-bit
 operations
In-Reply-To: <a37bf796-567e-2331-be42-38f756b105cd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (41)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
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
X-List-Received-Date: Mon, 29 Nov 2021 14:27:35 -0000

On 29/11/2021 11:07, Richard Henderson wrote:
> On 11/28/21 2:57 PM, Frédéric Pétrot wrote:
>> --- /dev/null
>> +++ b/util/int128.c
>> @@ -0,0 +1,145 @@
>> +#include "qemu/osdep.h"
>> +#include "qemu/host-utils.h"
>> +#include "qemu/int128.h"
> 
> Missing file header and copyright boilerplate.
> 
>> +#ifdef CONFIG_INT128
>> +
>> +Int128 int128_divu(Int128 a, Int128 b)
>> +{
>> +    return (__uint128_t)a / (__uint128_t)b;
>> +}
>> +
>> +Int128 int128_remu(Int128 a, Int128 b)
>> +{
>> +    return (__uint128_t)a % (__uint128_t)b;
>> +}
>> +
>> +Int128 int128_divs(Int128 a, Int128 b)
>> +{
>> +    return a / b;
>> +}
>> +
>> +Int128 int128_rems(Int128 a, Int128 b)
>> +{
>> +    return a % b;
>> +}
> 
> I think we should simply expose these inline, and let the compiler call its 
> runtime function directly.

   Thanks.
   Ok, I'll drop that and handle the CONFIG_INT128 directly in the rv128
   div/rem helpers then.
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

