Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noMsq-0004fJ-RN
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 06:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1noMsn-0004b2-Hc; Tue, 10 May 2022 06:14:21 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:52942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1noMsk-00007p-8q; Tue, 10 May 2022 06:14:20 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DDABA746324;
 Tue, 10 May 2022 12:14:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 84E0F7462D3; Tue, 10 May 2022 12:14:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 82D6074581A;
 Tue, 10 May 2022 12:14:14 +0200 (CEST)
Date: Tue, 10 May 2022 12:14:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Thomas Huth <thuth@redhat.com>
cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, mopsfelder@gmail.com, 
 qemu-ppc@nongnu.org, =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-RISC-V <qemu-riscv@nongnu.org>
Subject: Re: QEMU 32-bit vs. 64-bit binaries
In-Reply-To: <d1b04636-b1db-d13e-36b3-d45fb8cf9ad0@redhat.com>
Message-ID: <fe30ac22-89fe-9f27-d37-278b95ae189@eik.bme.hu>
References: <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
 <877d6tzs2e.fsf@pond.sub.org>
 <32e5877d-ba45-ac63-d24e-1f9f8676c6bb@redhat.com>
 <CAFEAcA8Ff45KeuQm-v8MwXX_i+P51uF-ovpQvtGD3hx1bi3A9g@mail.gmail.com>
 <Ynou3EnxfSmrzGT0@work-vm> <d1b04636-b1db-d13e-36b3-d45fb8cf9ad0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 10 May 2022 10:14:23 -0000

On Tue, 10 May 2022, Thomas Huth wrote:
> On 10/05/2022 11.22, Dr. David Alan Gilbert wrote:
>> * Peter Maydell (peter.maydell@linaro.org) wrote:
>>> On Tue, 10 May 2022 at 10:01, Thomas Huth <thuth@redhat.com> wrote:
>>>> 
>>>> On 10/05/2022 10.54, Markus Armbruster wrote:
>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>> 
>>>>> [...]
>>>>> 
>>>>>> I once suggested in the past already that we should maybe get rid of
>>>>>> the 32-bit variants in case the 64-bit variant is a full superset, so
>>>>>> we can save compile- and test times (which is quite a bit for QEMU),
>>>>>> but I've been told that the 32-bit variants are mostly still required
>>>>>> for supporting KVM on 32-bit host machines.
>>>>> 
>>>>> Do we still care for 32-bit host machines?
>>>> 
>>>> As long as the Linux kernel still supports 32-bit KVM virtualization, I
>>>> think we have to keep the userspace around for that, too.
>>>> 
>>>> But I wonder why we're keeping qemu-system-arm around? 32-bit KVM support
>>>> for ARM has been removed with Linux kernel 5.7 as far as I know, so I 
>>>> think
>>>> we could likely drop the qemu-system-arm nowadays, too? Peter, Richard,
>>>> what's your opinion on this?
>>> 
>>> Two main reasons, I think:
>>>   * command-line compatibility (ie there are lots of
>>>     command lines out there using that binary name)
>>>   * nobody has yet cared enough to come up with a plan for what
>>>     we want to do differently for these 32-bit architectures,
>>>     so the default is "keep doing what we always have"
>>> 
>>> In particular, I don't want to get rid of qemu-system-arm as the
>>> *only* 32-bit target binary we drop. Either we stick with what
>>> we have or we have a larger plan for sorting this out consistently
>>> across target architectures.
>> 
>> To my mind, qemu-system-arm makes a lot of sense, and I'd rather see the
>> 32 bit guests disappear from qemu-system-aarch64.
>> It's difficult to justify to someone running their aarch virt stack why
>> their binary has the security footprint that includes a camera or PDA.
>
> I'm not very familiar with KVM on ARM - but is it possible to use KVM there 
> with an arbitrary machine? If that's the case, a user might want to use KVM 
> on their 64-bit host to run a 32-bit guest machine, and then you need to keep 
> the 32-bit machines in the -aarch64 binary.
>
> Something like that is at least theoretically possible with ppc64, I think: 
> Using KVM-PR, it should be possible to run a g3beige (i.e. 32-bit) machine on 
> a 64-bit host. Not sure whether anybody has tried that in recent times (afaik 
> KVM-PR is in a rather bad shape nowadays), but it might have been possible at 
> one point in time in the past. (PPC folks, please correct me if I'm wrong)

https://www.talospace.com/2018/08/making-your-talos-ii-into-power-mac.html

Regards,
BALATON Zoltan

