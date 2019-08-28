Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2lmW-0000eX-CB
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 20:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i2lmT-0000eJ-Lg
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 20:25:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i2lmR-0005Ms-Ms
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 20:25:45 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33834)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i2lmR-0005Lu-HO
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 20:25:43 -0400
Received: by mail-pf1-f195.google.com with SMTP id b24so480064pfp.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Aug 2019 17:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MOGJnj17RIRzj1dwudwBS01XxxpTk8EtL+lfQdNJ+5s=;
 b=kVNZkTJYoqFTbKpWY6efdo1hgtRorvMJE7+bFDTn32YY8eNx2n5C9HVZsJw15vC2hC
 HL6VFtVNf4m2ERK3QlcHqht99YqaMt7pVABLuAFrfV7eUpHvcg6chZwI2nXxOqvGzdax
 kcIVDxW8KxZfVF87KbeNnKJb1VG14LEIzGdeP1sHj4Wa87yiEKGaKU9/kXVxnpEHtTr7
 qSwVJzodibbn9MtCSWgxNfzkwbHkeD9khzr6wHxnbGI0LL3y4TugC+2GxKy4RZttZpvd
 hW6fI2Rpw1q026ZG8nxwv0WSUVvSuRVQCaIIaCTWM2RUHYSHybLqzaj63UcsnPz49a2d
 1iLg==
X-Gm-Message-State: APjAAAWgI0GvMh7Q4idvKf+gk85AZJM/2EiPgoBPLI5AT/CO3QA+wfRt
 6tO96ov6/gqoGjxmm/CmELMhxw==
X-Google-Smtp-Source: APXvYqwi3KkrqdaRqqJz5L0/OqlgsT4ILuq2JayzV5pZxLanOLg14rYI+6fQDYhHkL9c+Q/WZ9zT/w==
X-Received: by 2002:a62:8281:: with SMTP id w123mr1489330pfd.36.1566951941514; 
 Tue, 27 Aug 2019 17:25:41 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z4sm468966pfg.166.2019.08.27.17.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 17:25:40 -0700 (PDT)
Date: Tue, 27 Aug 2019 17:25:40 -0700 (PDT)
X-Google-Original-Date: Tue, 27 Aug 2019 17:25:30 PDT (-0700)
In-Reply-To: <CAKmqyKNZsmN6WmHLH8kL85oGYe6eX_pPmUXqUMr8Avhs--TYbQ@mail.gmail.com>
CC: zhiwei_liu@c-sky.com, fintelia@gmail.com,
 Peter Maydell <peter.maydell@linaro.org>, aleksandar.m.mail@gmail.com,
 qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu, 
 bastian@mail.uni-paderborn.de, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-3bd1bd91-a925-4437-8320-9cdc49912e6a@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
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
X-List-Received-Date: Wed, 28 Aug 2019 00:25:47 -0000

On Thu, 22 Aug 2019 15:37:15 PDT (-0700), alistair23@gmail.com wrote:
> On Wed, Aug 21, 2019 at 6:56 PM liuzhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>>
>> On 2019/8/22 上午3:31, Palmer Dabbelt wrote:
>> > On Thu, 15 Aug 2019 14:37:52 PDT (-0700), alistair23@gmail.com wrote:
>> >> On Thu, Aug 15, 2019 at 2:07 AM Peter Maydell
>> >> <peter.maydell@linaro.org> wrote:
>> >>>
>> >>> On Thu, 15 Aug 2019 at 09:53, Aleksandar Markovic
>> >>> <aleksandar.m.mail@gmail.com> wrote:
>> >>> >
>> >>> > > We can accept draft
>> >>> > > extensions in QEMU as long as they are disabled by default.
>> >>>
>> >>> > Hi, Alistair, Palmer,
>> >>> >
>> >>> > Is this an official stance of QEMU community, or perhaps Alistair's
>> >>> > personal judgement, or maybe a rule within risv subcomunity?
>> >>>
>> >>> Alistair asked on a previous thread; my view was:
>> >>> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03364.html
>> >>> and nobody else spoke up disagreeing (summary: should at least be
>> >>> disabled-by-default and only enabled by setting an explicit
>> >>> property whose name should start with the 'x-' prefix).
>> >>
>> >> Agreed!
>> >>
>> >>>
>> >>> In general QEMU does sometimes introduce experimental extensions
>> >>> (we've had them in the block layer, for example) and so the 'x-'
>> >>> property to enable them is a reasonably established convention.
>> >>> I think it's a reasonable compromise to allow this sort of work
>> >>> to start and not have to live out-of-tree for a long time, without
>> >>> confusing users or getting into a situation where some QEMU
>> >>> versions behave differently or to obsolete drafts of a spec
>> >>> without it being clear from the command line that experimental
>> >>> extensions are being enabled.
>> >>>
>> >>> There is also an element of "submaintainer judgement" to be applied
>> >>> here -- upstream is probably not the place for a draft extension
>> >>> to be implemented if it is:
>> >>>  * still fast moving or subject to major changes of design direction
>> >>>  * major changes to the codebase (especially if it requires
>> >>>    changes to core code) that might later need to be redone
>> >>>    entirely differently
>> >>>  * still experimental
>> >>
>> >> Yep, agreed. For RISC-V I think this would extend to only allowing
>> >> extensions that have backing from the foundation and are under active
>> >> discussion.
>> >
>> > My general philosophy here is that we'll take anything written down in
>> > an official RISC-V ISA manual (ie, the ones actually released by the
>> > foundation).  This provides a single source of truth for what an
>> > extension name / version means, which is important to avoid
>> > confusion.  If it's a ratified extension then I see no reason not to
>> > support it on my end.  For frozen extensions we should probably just
>> > wait the 45 days until they go up for a ratification vote, but I'd be
>> > happy to start reviewing patches then (or earlier :)).
>> >
>> > If the spec is a draft in the ISA manual then we need to worry about
>> > the support burden, which I don't have a fixed criteria for --
>> > generally there shouldn't be issues here, but early drafts can be in a
>> > state where they're going to change extensively and are unlikely to be
>> > used by anyone.  There's also the question of "what is an official
>> > release of a draft specification?".
>> > That's a bit awkward right now: the current ratified ISA manual
>> > contains version 0.3 of the hypervisor extension, but I just talked to
>> > Andrew and the plan is to remove the draft extensions from the
>> > ratified manuals because these drafts are old and the official manuals
>> > update slowly.  For now I guess we'll need an an-hoc way of
>> > determining if a draft extension has been officially versioned or not,
>> > which is a bit of a headache.
>> >
>> > We already have examples of supporting draft extensions, including
>> > priv-1.9.1.  This does cause some pain for us on the QEMU side (CSR
>> > bits have different semantics between the specs), but there's 1.9.1
>> > hardware out there and the port continues to be useful so I'd be in
>> > favor of keeping it around for now.  I suppose there is an implicit
>> > risk that draft extensions will be deprecated, but the "x-" prefix,
>> > draft status, and long deprecation period should be sufficient to
>> > inform users of the risk.  I wouldn't be opposed to adding a "this is
>> > a draft ISA" warning, but I feel like it might be a bit overkill.
>> >
>> Hi, Palmer
>>
>> Maybe it is the headache of open source hardware. Everyone cooperates to
>> build a better architecture.
>>
>> In my opinion, we should focus on the future. The code in QEMU mainline
>> should evolve to the  ratified extension step by step, and only support
>> the best extension at last.
>>
>> At that time,  even many hardwares just support  the deprecated draft
>> extension,  the draft codes should be in the wild and maintained by the
>> hardware manufactures.
>>
>> But before that,  it is better to  have a draft implementation. So that
>> We can work step by step to accelerate the coming of the ratified
>> extension.
>>
>> Even at last draft extension implementation are deprecated, they are not
>> meaningless. The manufactures may use  the  history commit to support
>> their hardwares that
>>
>> only support drafted extension.
>
> Overall I agree with Palmer that we should accept all extensions in
> the RISC-V foundations ISA manual once the extension has reached some
> level of maturity.
>
> I think it then makes sense to only keep the latest version of these
> drafts until they are ratified. At that point we do have to support
> the ratified version for longer.

My number one constraint here is that QEMU remains a useful tool.  I'd love to 
support every version of every extension ever published (along with allowing 
for control of all the optional features), but there are just more important 
things to do so that's not going to happen.  That said, I also want to make 
sure that there is some stability in QEMU -- specifically because having a 
RISC-V implementation that supports multiple targets is very useful.  I started 
hacking on QEMU because I wanted to test my other software and it's just too 
cumbersome to keep around a pile of RISC-V implementations to test everything 
against.

In terms of which drafts we keep, I think it's best to just play this by ear -- 
for example, I'd be in favor of keeping draft extensions around if they end up 
widely implemented, and doubly so if they're similar to the ratified extension.  
The CLIC would be a good candidate for this: it's in all sorts of hardware, but 
the actual ratified spec may be a bit different than the drafts.  In that case 
I'd be in favor of keeping around the draft specs for a long time, as they're 
probably going to be pretty easy to support.

> Alistair
>
>>
>> Best Regards,
>>
>> Zhiwei
>>
>> >>
>> >> Alistair
>> >>
>> >>>
>> >>> thanks
>> >>> -- PMM
>> >

