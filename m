Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mqFzO-0005vS-4n
	for mharc-qemu-riscv@gnu.org; Thu, 25 Nov 2021 09:44:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mqFzM-0005vE-JT; Thu, 25 Nov 2021 09:44:40 -0500
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:48726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mqFzJ-0004oL-Iy; Thu, 25 Nov 2021 09:44:40 -0500
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 3717440369;
 Thu, 25 Nov 2021 15:44:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=univ-grenoble-alpes.fr; s=2020; t=1637851472;
 bh=Sir65W8wSrb9DKwgN7qZ+0Ib/Io8sHJZdoHYHJ/JaUY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=2XSZrQ6VmYyRokHq93YYLjrll8YnVZOXGTaDQlGOrcLp50jG3cx785ZE2O97G+FWL
 PCHDqCoNku+tJUytrPtk9JeWqIoFkrNo2zJtPpzqa5FdBkzrlkwyJE/ojhLLDGKgb2
 h9Plev9284SAcIgmPpvIZuvC100Wl9S3zx2nUSc03GXuy9J/4DfuhUJWD3Lha8HIBP
 UKkOilwiaQk3L/9YZhyouMBipuw0fRqY5ggMYCEkrwmsX9IGSyiMNViKr9CU0ujews
 RXADW7wuhj9d0O8vz43qvyj2MfjnX9IhOnsZOPZZvPNA/JqCCHfrHGyG9gxc5kt3Wf
 ZKzEmRTHRqRaQ==
Received: from smtps.univ-grenoble-alpes.fr (smtps2.u-ga.fr [152.77.18.2])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 1FA5360066;
 Thu, 25 Nov 2021 15:44:32 +0100 (CET)
Received: from [192.168.1.64] (35.201.90.79.rev.sfr.net [79.90.201.35])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 54A26140079;
 Thu, 25 Nov 2021 15:44:31 +0100 (CET)
Message-ID: <3fb387e9-407d-9ea0-063a-a96b45a7df16@univ-grenoble-alpes.fr>
Date: Thu, 25 Nov 2021 15:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 07/18] target/riscv: setup everything so that
 riscv128-softmmu compiles
Content-Language: fr
To: Alistair Francis <alistair23@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng
 <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-8-frederic.petrot@univ-grenoble-alpes.fr>
 <CAKmqyKM_6QH40iesGaCYLxWHzRyfoFACEH+eiOY-_YQTpeo=nw@mail.gmail.com>
 <a68d73ec-bde8-5869-842f-e45bbdbdc5ed@univ-grenoble-alpes.fr>
 <88c5fc89-49a3-0dd3-87bb-287ba590f915@amsat.org>
 <CAKmqyKN69JDsRfFvuJGaDxyP+LS+90PGjD-ACtFhdGmnBguApg@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <CAKmqyKN69JDsRfFvuJGaDxyP+LS+90PGjD-ACtFhdGmnBguApg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (42)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.18.2
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
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
X-List-Received-Date: Thu, 25 Nov 2021 14:44:41 -0000

On 25/11/2021 12:47, Alistair Francis wrote:
> On Wed, Nov 24, 2021 at 5:33 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Frédéric,
>>
>> On 11/24/21 07:55, Frédéric Pétrot wrote:
>>> On 24/11/2021 07:12, Alistair Francis wrote:
>>>> On Sat, Nov 13, 2021 at 1:16 AM Frédéric Pétrot
>>>> <frederic.petrot@univ-grenoble-alpes.fr> wrote:
>>>>>
>>>>> This patch is kind of a mess because several files have to be slightly
>>>>> modified to allow for a new target. In the current status, we have done
>>>>> our best to have RV64 and RV128 under the same RV64 umbrella, but there
>>>>> is still work to do to have a single executable for both.
>>>>> In particular, we have no atomic accesses for aligned 128-bit addresses.
>>>>>
>>>>> Once this patch applied, adding risc128-sofmmu to --target-list produces
>>>>> a (no so useful yet) executable.
>>>>
>>>> I can't remember if we discussed this before, but do we need the
>>>> riscv128-sofmmu executable? Can we instead just use a riscv64-sofmmu
>>>> executable?
>>>
>>>    Hello Alistair,
>>>    Richard was also advocating for a single executable, but pointed out that
>>>    we need to disable mttcg because there is a need for specific tcg
>>> support for
>>>    128-bit aligned atomics.
>>>    Given my understanding of that part of QEMU, I choose the easy way to
>>> disable
>>>    it once and for all at compile time until we have that.
>>
>>
>> In rv128_base_cpu_init():
>>
>>    if (qemu_tcg_mttcg_enabled) {
>>        /* Missing 128-bit aligned atomics */
>>        error_report("128-bit RISC-V currently does not work"
>>                     " with Multi Threaded TCG. Please use:"
>>                     " -accel tcg,thread=single");
>>        exit(EXIT_FAILURE);
>>    }
> 
> That seems like a good option! I think we could add this to the CPU
> realise function.
> 
> The problem with a riscv128-sofmmu executable is that it's hard to get
> rid of in the future. We are very slowly moving towards a single
> executable and adding a new one means we are stuck with it for a
> while.
> 
> Alistair

   Ooups, I replied yesterday to Philippe that I would work that out, but I
   missed the reply all button, sorry.

   Frédéric
> 
>>
>> Regards,
>>
>> Phil.

-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

