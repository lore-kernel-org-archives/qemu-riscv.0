Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0cKn-0003xy-EN
	for mharc-qemu-riscv@gnu.org; Wed, 21 Aug 2019 21:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1i0cKj-0003sz-Gc
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2019 21:56:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1i0cKh-0001NP-TF
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2019 21:56:13 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:39139)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1i0cKe-0001Jp-92; Wed, 21 Aug 2019 21:56:08 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07441657|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.249713-0.0208414-0.729446; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03275; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=10; RT=10; SR=0;
 TI=SMTPD_---.FG9x9hN_1566438956; 
Received: from 172.16.28.187(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.FG9x9hN_1566438956)
 by smtp.aliyun-inc.com(10.147.42.253);
 Thu, 22 Aug 2019 09:56:01 +0800
To: Palmer Dabbelt <palmer@sifive.com>, alistair23@gmail.com,
 Jonathan Behrens <fintelia@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, aleksandar.m.mail@gmail.com,
 qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 bastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <mhng-04cdd93a-df3e-4de0-b1f5-0365f2be0fab@palmer-si-x1c4>
From: liuzhiwei <zhiwei_liu@c-sky.com>
Message-ID: <96d32c8a-a4a2-9e40-d5be-97a0617703ac@c-sky.com>
Date: Thu, 22 Aug 2019 09:50:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <mhng-04cdd93a-df3e-4de0-b1f5-0365f2be0fab@palmer-si-x1c4>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 121.197.200.217
Subject: Re: [Qemu-riscv] [Qemu-devel] RISC-V: Vector && DSP Extension
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
X-List-Received-Date: Thu, 22 Aug 2019 01:56:15 -0000


On 2019/8/22 上午3:31, Palmer Dabbelt wrote:
> On Thu, 15 Aug 2019 14:37:52 PDT (-0700), alistair23@gmail.com wrote:
>> On Thu, Aug 15, 2019 at 2:07 AM Peter Maydell 
>> <peter.maydell@linaro.org> wrote:
>>>
>>> On Thu, 15 Aug 2019 at 09:53, Aleksandar Markovic
>>> <aleksandar.m.mail@gmail.com> wrote:
>>> >
>>> > > We can accept draft
>>> > > extensions in QEMU as long as they are disabled by default.
>>>
>>> > Hi, Alistair, Palmer,
>>> >
>>> > Is this an official stance of QEMU community, or perhaps Alistair's
>>> > personal judgement, or maybe a rule within risv subcomunity?
>>>
>>> Alistair asked on a previous thread; my view was:
>>> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03364.html
>>> and nobody else spoke up disagreeing (summary: should at least be
>>> disabled-by-default and only enabled by setting an explicit
>>> property whose name should start with the 'x-' prefix).
>>
>> Agreed!
>>
>>>
>>> In general QEMU does sometimes introduce experimental extensions
>>> (we've had them in the block layer, for example) and so the 'x-'
>>> property to enable them is a reasonably established convention.
>>> I think it's a reasonable compromise to allow this sort of work
>>> to start and not have to live out-of-tree for a long time, without
>>> confusing users or getting into a situation where some QEMU
>>> versions behave differently or to obsolete drafts of a spec
>>> without it being clear from the command line that experimental
>>> extensions are being enabled.
>>>
>>> There is also an element of "submaintainer judgement" to be applied
>>> here -- upstream is probably not the place for a draft extension
>>> to be implemented if it is:
>>>  * still fast moving or subject to major changes of design direction
>>>  * major changes to the codebase (especially if it requires
>>>    changes to core code) that might later need to be redone
>>>    entirely differently
>>>  * still experimental
>>
>> Yep, agreed. For RISC-V I think this would extend to only allowing
>> extensions that have backing from the foundation and are under active
>> discussion.
>
> My general philosophy here is that we'll take anything written down in 
> an official RISC-V ISA manual (ie, the ones actually released by the 
> foundation).  This provides a single source of truth for what an 
> extension name / version means, which is important to avoid 
> confusion.  If it's a ratified extension then I see no reason not to 
> support it on my end.  For frozen extensions we should probably just 
> wait the 45 days until they go up for a ratification vote, but I'd be 
> happy to start reviewing patches then (or earlier :)).
>
> If the spec is a draft in the ISA manual then we need to worry about 
> the support burden, which I don't have a fixed criteria for -- 
> generally there shouldn't be issues here, but early drafts can be in a 
> state where they're going to change extensively and are unlikely to be 
> used by anyone.  There's also the question of "what is an official 
> release of a draft specification?".
> That's a bit awkward right now: the current ratified ISA manual 
> contains version 0.3 of the hypervisor extension, but I just talked to 
> Andrew and the plan is to remove the draft extensions from the 
> ratified manuals because these drafts are old and the official manuals 
> update slowly.  For now I guess we'll need an an-hoc way of 
> determining if a draft extension has been officially versioned or not, 
> which is a bit of a headache.
>
> We already have examples of supporting draft extensions, including 
> priv-1.9.1.  This does cause some pain for us on the QEMU side (CSR 
> bits have different semantics between the specs), but there's 1.9.1 
> hardware out there and the port continues to be useful so I'd be in 
> favor of keeping it around for now.  I suppose there is an implicit 
> risk that draft extensions will be deprecated, but the "x-" prefix, 
> draft status, and long deprecation period should be sufficient to 
> inform users of the risk.  I wouldn't be opposed to adding a "this is 
> a draft ISA" warning, but I feel like it might be a bit overkill.
>
Hi, Palmer

Maybe it is the headache of open source hardware. Everyone cooperates to 
build a better architecture.

In my opinion, we should focus on the future. The code in QEMU mainline 
should evolve to the  ratified extension step by step, and only support 
the best extension at last.

At that time,  even many hardwares just support  the deprecated draft 
extension,  the draft codes should be in the wild and maintained by the 
hardware manufactures.

But before that,  it is better to  have a draft implementation. So that 
We can work step by step to accelerate the coming of the ratified 
extension.

Even at last draft extension implementation are deprecated, they are not 
meaningless. The manufactures may use  the  history commit to support 
their hardwares that

only support drafted extension.

Best Regards,

Zhiwei

>>
>> Alistair
>>
>>>
>>> thanks
>>> -- PMM
>

