Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hZU6a-0001Wx-3e
	for mharc-qemu-riscv@gnu.org; Sat, 08 Jun 2019 01:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59723)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hZU6P-0001Vr-Vm
 for qemu-riscv@nongnu.org; Sat, 08 Jun 2019 01:41:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hZU6O-0001WF-U2
 for qemu-riscv@nongnu.org; Sat, 08 Jun 2019 01:41:17 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:35416)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hZU6M-0001Ut-UX
 for qemu-riscv@nongnu.org; Sat, 08 Jun 2019 01:41:16 -0400
Received: by mail-pf1-f172.google.com with SMTP id d126so2332396pfd.2
 for <qemu-riscv@nongnu.org>; Fri, 07 Jun 2019 22:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0xFujibSNYzWMLVp8zBawg+0B0c5vMsRBy4UZe+YTh8=;
 b=AYihXmP1cnU9FxAWYt5PXDhHG4jVeqh7+OfwqyaLY4hd+NYyHyD3gpFHZyBTdTT4tu
 3bUGNbNRO0wWDDZACUfUwH5JWhZgR3VFJkPjq510NGU+OPpZz06AcErHiwEvrYHAgDho
 GQsEkjLyAsE5mT6MwrOEHgx3N0/ajwb8EuAd6aBfQ2HtbJMI/Nu2gSFHTJBEZJ4ZgGRT
 /mJYRUM2ITnCYrlEpQhj/xY++6mXBt6K71FouuvA/+NH1JKAVpw1dn2Pg8rNjxv8bwWA
 mrWEa085lB/bfo92mkRfQzJZ2Arv3qwB1VtCO6y1enYnwe5ab8sTaCM7cs9xaHIYm4ol
 V9Sw==
X-Gm-Message-State: APjAAAVbT4QTCyrpSTwFyrs9R/D/TTx/NOyNUQ669dTKnVkNOLzAKQNN
 n1R1iN/83kBW61+cK3mkQi5skg==
X-Google-Smtp-Source: APXvYqwWwPq6c5pMpiwr3aOT4NFXgsBFf+bMOBpBtkrZ19WmSIA9Uq49ihBfsjjwpEZqAqV6FW943A==
X-Received: by 2002:a17:90a:9514:: with SMTP id
 t20mr9413798pjo.124.1559972472276; 
 Fri, 07 Jun 2019 22:41:12 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r11sm955628pgs.39.2019.06.07.22.41.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 22:41:11 -0700 (PDT)
Date: Fri, 07 Jun 2019 22:41:11 -0700 (PDT)
X-Google-Original-Date: Fri, 07 Jun 2019 18:33:12 PDT (-0700)
In-Reply-To: <CAFXwXrkEVJgPEZtvzyekJEZDk90XvntHkdfUe0s37RZ-ir1MKw@mail.gmail.com>
CC: marco@decred.org, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-9a9b8dc8-4249-4695-9b30-9303df3a9c6d@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.172
Subject: Re: [Qemu-riscv] [Qemu-devel] Fwd: [joel@sing.id.au: atomic
 failures on qemu-system-riscv64]
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
X-List-Received-Date: Sat, 08 Jun 2019 05:41:20 -0000

On Thu, 06 Jun 2019 19:50:57 PDT (-0700), richard.henderson@linaro.org wrote:
>>
>> Also, unless I'm misunderstanding something our implementation of LR/SC is
>>
> pretty broken.  We're just using a CAS to check if the value changed, which
>> suffers from the ABA problem that LR/SC is there to fix in the first
>> place.  I
>> might be missing something here, though, as it looks like MIPS is doing
>> essentially the same thing.
>>
>
> All of our load-lock/store-conditional implementations do the same.
>
> You are correct that we do not implement the exact correct semantics.
> Correct semantics, as far as I know, cannot be modeled without emulating
> everything in a serial context, including caches.
>
> We therefore make a considered choice to observe that while ll/sc can be
> used to do all kinds of wild and woolly things, no one actually does so.
> What people actually do is write portable code, using c/c++ atomic
> primitives. And that all of these can be done with cmpxchg, because that's
> what x86 has.
>
> Using that choice, we can provide multi-threaded smp emulation that,
> demonstrably, works.

OK, that makes sense.  I was just worried that we were screwing something up on
our end.

