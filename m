Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i0WKm-00049F-O7
	for mharc-qemu-riscv@gnu.org; Wed, 21 Aug 2019 15:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54785)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1i0WKi-000484-Gn
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2019 15:31:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1i0WKg-0005jz-Ct
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2019 15:31:48 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:41075)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1i0WKe-0005Wi-HR
 for qemu-riscv@nongnu.org; Wed, 21 Aug 2019 15:31:46 -0400
Received: by mail-pl1-x642.google.com with SMTP id m9so1863618pls.8
 for <qemu-riscv@nongnu.org>; Wed, 21 Aug 2019 12:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=X1tYQICcT1TcvBHCeuRcjOVj2LjQo3Fx9K9EITnTngI=;
 b=NePQKqDzhhN1UR5RPsKF/wvNh7kfRJlAwNbNNFZFCbld/mQ7kT0IomYB0zO0CHUw3x
 x4pi57HXq1OasLRiXEj1SP+rFiypEHwYzsEK9FB07BxFTbhbX33FQuZ5aIW1MbQtJ1Za
 GYfh40v4XdswynJFchmknuQ3h1geMFzs9f1DBYrLXu0qiwkSze6HV6xIlixj4kcy87lI
 SG5c/cC/lYmH35RKa+/1llb7BK96iS7CjIeRj8Tb7j8JjlNpoFAWGfTrrdkp6K9Sn5bt
 JM0tNr5Qg6TORW6hvN8dfofIue59QdE9jvBcWnlWgo824w97AumMGzUO+ODpsblmVBQu
 ddEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=X1tYQICcT1TcvBHCeuRcjOVj2LjQo3Fx9K9EITnTngI=;
 b=hUapnJvjlFJFlSTLtooU8j6ytTzvlWv5xwXffJth5qKhJD2w63Jq/g6LgHLOkgodhx
 JS80F4S2uQWMoQ+XqE39DSOwQ/4Uz6605kWKQkL7/KRn/Mtb5DmiWja690NYb0Se45AF
 r3zMYEqCptMwkZI+x36lC8QOB7AwfWNKQBwYZVwX4Bk0zkHW4lLDy0WK7seM1q5iWrou
 dLVJuoAVTxIVckGm0WB1RpoYq6ID1+tsukdzaJkFnodEPBcUa4tdbL2VVaydf3cJLYT1
 OTav/Gzk9PtHHUePTG72qFhTwdyJySiqwJzmo4KHtJ7qtyfB7idmH2LFnC0RtXhN/BB6
 upoA==
X-Gm-Message-State: APjAAAVom6lMlen2XC2n8CJtr2TT73d6XBxxr062+RzUufqyD0jEeVyP
 A0QU1KCmLJ5d4aeKlVA9v5713g==
X-Google-Smtp-Source: APXvYqzEOA9wUM0sIA/7o7Qym737sXiB+8IZgNqVIjRo7yHlfUcaEDdfDWYrrciltpLud3CLvMZVIA==
X-Received: by 2002:a17:902:5a0d:: with SMTP id
 q13mr6499478pli.5.1566415901098; 
 Wed, 21 Aug 2019 12:31:41 -0700 (PDT)
Received: from localhost (wsip-184-188-36-2.sd.sd.cox.net. [184.188.36.2])
 by smtp.gmail.com with ESMTPSA id 16sm48884127pfc.66.2019.08.21.12.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 12:31:40 -0700 (PDT)
Date: Wed, 21 Aug 2019 12:31:40 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Aug 2019 12:30:25 PDT (-0700)
In-Reply-To: <CAKmqyKM44ZAHgc5cYAiAXXtVG=dMcX1i7FLn+2mMwM1Av4Gqzg@mail.gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>, aleksandar.m.mail@gmail.com,
 qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu, bastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, zhiwei_liu@c-sky.com
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-04cdd93a-df3e-4de0-b1f5-0365f2be0fab@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Wed, 21 Aug 2019 19:31:50 -0000

On Thu, 15 Aug 2019 14:37:52 PDT (-0700), alistair23@gmail.com wrote:
> On Thu, Aug 15, 2019 at 2:07 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Thu, 15 Aug 2019 at 09:53, Aleksandar Markovic
>> <aleksandar.m.mail@gmail.com> wrote:
>> >
>> > > We can accept draft
>> > > extensions in QEMU as long as they are disabled by default.
>>
>> > Hi, Alistair, Palmer,
>> >
>> > Is this an official stance of QEMU community, or perhaps Alistair's
>> > personal judgement, or maybe a rule within risv subcomunity?
>>
>> Alistair asked on a previous thread; my view was:
>> https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg03364.html
>> and nobody else spoke up disagreeing (summary: should at least be
>> disabled-by-default and only enabled by setting an explicit
>> property whose name should start with the 'x-' prefix).
>
> Agreed!
>
>>
>> In general QEMU does sometimes introduce experimental extensions
>> (we've had them in the block layer, for example) and so the 'x-'
>> property to enable them is a reasonably established convention.
>> I think it's a reasonable compromise to allow this sort of work
>> to start and not have to live out-of-tree for a long time, without
>> confusing users or getting into a situation where some QEMU
>> versions behave differently or to obsolete drafts of a spec
>> without it being clear from the command line that experimental
>> extensions are being enabled.
>>
>> There is also an element of "submaintainer judgement" to be applied
>> here -- upstream is probably not the place for a draft extension
>> to be implemented if it is:
>>  * still fast moving or subject to major changes of design direction
>>  * major changes to the codebase (especially if it requires
>>    changes to core code) that might later need to be redone
>>    entirely differently
>>  * still experimental
>
> Yep, agreed. For RISC-V I think this would extend to only allowing
> extensions that have backing from the foundation and are under active
> discussion.

My general philosophy here is that we'll take anything written down in an 
official RISC-V ISA manual (ie, the ones actually released by the foundation).  
This provides a single source of truth for what an extension name / version 
means, which is important to avoid confusion.  If it's a ratified extension 
then I see no reason not to support it on my end.  For frozen extensions we 
should probably just wait the 45 days until they go up for a ratification vote, 
but I'd be happy to start reviewing patches then (or earlier :)).

If the spec is a draft in the ISA manual then we need to worry about the 
support burden, which I don't have a fixed criteria for -- generally there 
shouldn't be issues here, but early drafts can be in a state where they're 
going to change extensively and are unlikely to be used by anyone.  There's 
also the question of "what is an official release of a draft specification?".  

That's a bit awkward right now: the current ratified ISA manual contains 
version 0.3 of the hypervisor extension, but I just talked to Andrew and the 
plan is to remove the draft extensions from the ratified manuals because these 
drafts are old and the official manuals update slowly.  For now I guess we'll 
need an an-hoc way of determining if a draft extension has been officially 
versioned or not, which is a bit of a headache.

We already have examples of supporting draft extensions, including priv-1.9.1.  
This does cause some pain for us on the QEMU side (CSR bits have different 
semantics between the specs), but there's 1.9.1 hardware out there and the port 
continues to be useful so I'd be in favor of keeping it around for now.  I 
suppose there is an implicit risk that draft extensions will be deprecated, but 
the "x-" prefix, draft status, and long deprecation period should be sufficient 
to inform users of the risk.  I wouldn't be opposed to adding a "this is a 
draft ISA" warning, but I feel like it might be a bit overkill.

>
> Alistair
>
>>
>> thanks
>> -- PMM

