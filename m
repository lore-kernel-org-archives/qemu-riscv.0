Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBRZx-0006h5-UZ
	for mharc-qemu-riscv@gnu.org; Fri, 20 Sep 2019 18:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33387)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iBRZt-0006dq-K9
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 18:40:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iBRZr-0008Qj-O7
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 18:40:37 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:45351)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iBRZr-0008M9-5d
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 18:40:35 -0400
Received: by mail-pf1-x442.google.com with SMTP id y72so5442815pfb.12
 for <qemu-riscv@nongnu.org>; Fri, 20 Sep 2019 15:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TaZ6yCIhc7FrZ/8pQ2Uf580lBs/WJu0+Pmb7HjYtIFs=;
 b=ct6RZ4WVpJgD1dsI9FBA+H8RvVusZatEnCqm/iMpxi0zw3kfDE7+QI8YpZyn2hmSfR
 IJmrd8cMOv0wPFk/BPgtfy4BVEY2qaNbAcqwEY+H2Pa7owBy33Gz7f+H0TqCsg7dfQKg
 Uo8ijMzfUlIXB0CPVGeELwTk2wdrMlNXj60nI5pp3gAxg4lQqzE8rEqUyiHCDuhhZ/Tt
 KQN7PhwT0WtQu+E5P+TFoZowtF1LLd3hA6VlAEDIqyEv3Lg5gsdYDFfaB/YBZdnfTrZ0
 C+S42NPiqE/yBv9MIuZUYllOdx6lYnZtNnAKKfpCXbLQy7p9VELYY4LhKWoG8RcqJrEc
 bbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TaZ6yCIhc7FrZ/8pQ2Uf580lBs/WJu0+Pmb7HjYtIFs=;
 b=oyw89ky9DVdM6Vv+TUXYDt+gGIYrmeiUpW2RjzWpVp6pV/iPoM8NLJ2PYPyHrgyDxI
 hGc+4Q0c8sp3Mi0ca9gr8Al9hru9eDirVD58E33PjZUMl2oQqQ4cLfc3915dzxMSpdlA
 GLI/b+Sabs3WJ5xpW9Btiv5yn2zT8u3NA4Po83+CM/7BQPXWEVuSo/RdZW9FR014smRG
 VLm2sEFANvZaZA038KG6eh9OvKFwwqyhrde9EjzcqwybyEPrcdDTiHxM5kKYQxln//Nr
 ruH58B1bMPJDXDiF1eQewNwzUY8dnqXGotF2wO7By1YTu498jmsG8R+72KLrNoBKVLp4
 59TQ==
X-Gm-Message-State: APjAAAUBzoEbhc8AzjDWyGlNoLWvMSxWtndNhp4JAN+KW4nLm9I2KMbP
 yO3zQ3dRifsoIfX4SiXtUMlIxg==
X-Google-Smtp-Source: APXvYqy37LpUonLdzNfB3hT6rjqMXIEpEWy3PBpCUQQowENf8ZBUtGSwCJ7EIFxsutjKxkysnbdAIQ==
X-Received: by 2002:a63:925d:: with SMTP id s29mr17686796pgn.144.1569019233509; 
 Fri, 20 Sep 2019 15:40:33 -0700 (PDT)
Received: from localhost ([2607:fb90:5de:df7b:9794:c3bf:6169:a06c])
 by smtp.gmail.com with ESMTPSA id n8sm538959pgd.57.2019.09.20.15.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 15:40:32 -0700 (PDT)
Date: Fri, 20 Sep 2019 15:40:32 -0700 (PDT)
X-Google-Original-Date: Fri, 20 Sep 2019 15:37:49 PDT (-0700)
Subject: Re: [Qemu-devel] [PULL 04/32] target/riscv: Implement
 riscv_cpu_unassigned_access
In-Reply-To: <CAKmqyKPPqzo+dKqXoqmBpuaHp3hbdzA=mpgqECMLGX+whn2pcw@mail.gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-939dc1af-ff30-4ff4-83b5-c93807eb7180@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Fri, 20 Sep 2019 22:40:39 -0000

On Tue, 17 Sep 2019 09:37:47 PDT (-0700), alistair23@gmail.com wrote:
> On Tue, Sep 17, 2019 at 6:56 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Fri, 16 Aug 2019 at 09:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >
>> > On Thu, 15 Aug 2019 at 23:17, Palmer Dabbelt <palmer@sifive.com> wrote:
>> > > You're more than welcome to take them over.  I've got something that boots
>> > > Linux on my unassigned_access branch (github.com/palmer-dabbelt/qemu), but I
>> > > haven't sanitized the whole port for physical accesses and I haven't convinced
>> > > myself that my hook implementation is correct.
>> >
>> > Rather than doing
>> >    if (retaddr) {
>> >        cpu_restore_state(cs, retaddr, true);
>> >    }
>> >
>> > at the start of the hook I think you just want to pass 'retaddr'
>> > as the final argument to riscv_raise_exception() instead of
>> > using GETPC(). Other than that I think the hook itself is right.
>> >
>> > The 'git grep' regexes in docs/devel/loads-stores.rst are handy
>> > for finding the places where the target code is doing physical
>> > accesses. IIRC the only ones I found with a quick scan were the
>> > PTE loads in get_physical_address() via ldl_phys/ldq_phys, which will
>> > now return 0 and run into the 'invalid PTE' code path. I don't
>> > know whether your architecture requires some different behaviour
>> > for bus errors on page table walk than that (you might want to
>> > specifically code the error path anyway or comment it even if the
>> > behaviour is right, to be a bit more explicit that it can happen).
>>
>> Gentle ping -- would somebody like to have a go at the riscv
>> do_transaction_failed hook conversion? I think it should be
>> straightforward, and riscv is now the only architecture still
>> using the old unassigned_access hook and preventing us from
>> getting rid of it entirely.
>
> Thanks for the ping Peter, I forgot about this.
>
> @Palmer I have taken your patches, made some changes based on Peter's
> comments and rebased them on your PR branch.
>
> I'll double check, but the hook implementation looks correct and I
> can't see any other obvious unsanitised physical accesses so it should
> be ok. I'll send them out today if I don't find any issues.

Thanks!

>
> Alistair
>
>>
>> thanks
>> -- PMM

