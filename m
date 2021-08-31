Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL7WP-0003Xe-5n
	for mharc-qemu-riscv@gnu.org; Tue, 31 Aug 2021 13:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mL7WH-0003Ic-PY; Tue, 31 Aug 2021 13:25:58 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:49128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mL7WF-0000Tn-3K; Tue, 31 Aug 2021 13:25:57 -0400
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id BA4BA41796;
 Tue, 31 Aug 2021 19:25:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1630430747;
 bh=D2vc3cDTZlAkHxiFqXcPkOWq4uAlsZqxPojhoqaIn4s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=v+mlu5BAfH4zMtpY4V0K7Qw0adotcaupHPEXWQ9zLzipy2U4fH/+5pPL165K3vdL7
 NsLErdrRE0vOsekzFYoWktisLS54bBk9TCL5QZWgB1zr2d29Ni28MVvL4Gyu9TXRO6
 zJzPOtrl2FBDs0r1TX+y56ZhO2cZQMTsGhtPtI4KYe/GN7FtIcWH03BcYEM0IEK3Dm
 hVmU3U3rSri4ewVso72OcCL/GU39Cl3U+7GmE4nq3UVulgyBuvhx53d9TrbgZmwWIC
 dmg2r3CCIFlV1/ha17hMyMU+7NCR4aFduf13gIVlCp+IoczsXjONdqIpHbj73HrvVt
 xS0LRxtQvthLQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
 by zm-mta-out.u-ga.fr (Postfix) with ESMTP id B487E802D3;
 Tue, 31 Aug 2021 19:25:47 +0200 (CEST)
Received: from [147.171.132.208] (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 6E95E187E13;
 Tue, 31 Aug 2021 19:25:47 +0200 (CEST)
Subject: Re: [PATCH 0/8] RISC V partial support for 128-bit architecture
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210830171620.126296-1-frederic.petrot@univ-grenoble-alpes.fr>
 <CAKmqyKPZeN-gNpaQC+gRJnZeLowurawP_4+ro2O762OK-85e4g@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Message-ID: <82117ebc-653b-a2bf-2640-0563effe36bc@univ-grenoble-alpes.fr>
Date: Tue, 31 Aug 2021 19:25:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPZeN-gNpaQC+gRJnZeLowurawP_4+ro2O762OK-85e4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
X-List-Received-Date: Tue, 31 Aug 2021 17:26:02 -0000

Le 31/08/2021 à 05:15, Alistair Francis a écrit :
> On Tue, Aug 31, 2021 at 5:29 AM Frédéric Pétrot
> <frederic.petrot@univ-grenoble-alpes.fr> wrote:
>>
>> This series of patches aims at adding partial 128-bit support to the riscv
>> target, following the (unratified) RV128I specification, Chapter 7 of
>> riscv-spec document dated 20191214.
>> It provides support for all user integer (I) instructions and for an M
>> extension which follows the definition of the 32 and 64-bit specifications.
>> We also included minimal support for 128-bit csrs.
>> Among the csrs, we selected misa, to know the mxlen in which the processor
>> is, mtvec, mepc, mscratch and mstatus for minimal kernel development, and
>> satp to point to the page table.
>> We fallback on the 64-bit csrs for the others.
>>
>> In the last patch, we propose a "natural" extension of the sv39 and sv48
>> virtual address modes using 16KB pages, that we believe suitable for
>> 128-bit CPU workloads.
>>
>> There are two strong assumptions in this implementation:
>> - the 64 upper bits of the addresses are irrelevant, be they virtual or
>>   physical, in order to use the existing address translation mechanism,
>> - the mxlen field stays hardwired, so there is no dynamic change in
>>   register size.
>>
>> As no toolchain exists yet for this target, we wrote all our tests in asm
>> using macros expanding .insn directives.
>> We unit tested the behavior of the instructions, and wrote some simple
>> user level performance tests: on our examples the execution speed of the
>> 128-bit version is between 1.2 to 5 time slower than its 32 and 64-bit
>> counterparts.
> 
> Are you able to share these tests? I would like to add them to my
> RISC-V tests so that I can catch any regressions

  Sure.
  I made a repo on github: git@github.com:fpetrot/128-test.git
  Note that the unit tests are nicely wrapped up, while the functional
  ones are more targeting the human, so to say.
  Feel free to use as you wish.

  Frédéric

> 
> Alistair
> 

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

