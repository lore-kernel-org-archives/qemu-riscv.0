Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL6CC-0006QU-Qh
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 12:01:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mL6C5-0006LY-Ah; Tue, 31 Aug 2021 12:01:02 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:54278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mL6C3-0002On-4F; Tue, 31 Aug 2021 12:01:00 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 4544741ACA;
 Tue, 31 Aug 2021 18:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630425656;
 bh=ZRHKN+TIIJsyB5bfuTDGgMioascTjLl17SGZdS6BNtk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=g+KnhLyXcj/c+ePCnzk7nuqQGce81nC6gDPPWo8Y47rgyyi0d/1BYPizUAJjzMiu4
 TIAbAY38Nwlzi17+hjZi0TlZIzIITOMqa+cGaStqKTetkNKVWuWMCAgE9xpTGVzYcI
 CqTY8B2WNG3xNywFLvV/cQR9zs5ehAYu+C1XB/WXGa9rhtuuILM/DS07ssGGbV4tZV
 s7V+TrI7BPZZjxk7LZnCAP3IpaBMUfCE9NRxf927ry5YkZ+wvvWWS4DplugW4J19sR
 AC9PLUFxrbap4FWi46YLWY1udgaBBRwZT0hmmvt7C1QoMXE8+DTGr6yoeliAMZZVoy
 z0ldpNNj4oFbA==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id 401DC80035;
 Tue, 31 Aug 2021 18:00:56 +0200 (CEST)
Received: from [147.171.132.208] (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id C87C4187E1F;
 Tue, 31 Aug 2021 18:00:55 +0200 (CEST)
Subject: Re: [PATCH 3/8] target/riscv: Addition of 128-bit ldu, lq and sq
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-3-frederic.petrot@univ-grenoble-alpes.fr>
 <d494ea6e-4eed-7d74-b9f7-130201a8294f@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Message-ID: <2c8e43c4-6edb-947f-95f6-49d08fa23005@univ-grenoble-alpes.fr>
Date: Tue, 31 Aug 2021 18:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d494ea6e-4eed-7d74-b9f7-130201a8294f@linaro.org>
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
X-List-Received-Date: Tue, 31 Aug 2021 16:01:03 -0000

Hello Richard,

Le 31/08/2021 à 04:24, Richard Henderson a écrit :
> On 8/30/21 10:16 AM, Frédéric Pétrot wrote:
>> +#if defined(TARGET_RISCV128)
>> +/*
>> + * Accessing signed 64-bit or 128-bit values should be part of MemOp in
>> + * include/exec/memop.h
>> + * Unfortunately, this requires to change the defines there, as MO_SIGN is 4,
>> + * and values 0 to 3 are usual types sizes.
>> + * Note that an assert is triggered when MemOp is MO_SIGN|MO_TEQ, this value
>> + * being some kind of sentinel.
> 
> https://lore.kernel.org/qemu-devel/20210818191920.390759-24-richard.henderson@linaro.org/

  Thanks for the pointer,
  Frédéric
> 
> 
> 
> r~

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

