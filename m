Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP8Jq-0008Ng-Nb
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 12:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP8Jm-0008I8-C1
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 12:56:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP8Jl-0004wf-3S
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 12:56:34 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35316)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP8Jk-0004w6-TD
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 12:56:33 -0400
Received: by mail-pg1-x541.google.com with SMTP id c8so7282759pgb.2
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 09:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7QjzFN0npZElQvBMgyEyOgLMwR1v53vRNPgzVoDubjE=;
 b=RVwMoFSfrSfdW3iDDbCG5Maq/hrSrN5zfpE3QLjlyoNCk2Nhu+sh0BUh90ildNiG6Q
 wWGxYw+Ii3Td6H+cBxItDfWmHTK6rjd3h9KfQNx1l3CjNr1MDw59xIJb9CK6N9PYQqvS
 LYBojLIoScXOon0tSgmG9lULurMND3Q7DEK9yF49jMOlb9s0PYkGVyxQ520IJrpRbTkS
 tbf929v8Y1ie8GpLZgHw2rx0a2tuiqAaCVpCcFW0dEmOw3ZWDyobayvGwBNY/kKpq2xd
 +ZPXgPyq9UUPHVKSHoNj2gcVz5eYJpBEQR/4rReumjYw4g0hgVwTMda7s1Nd1jDei1NZ
 VecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7QjzFN0npZElQvBMgyEyOgLMwR1v53vRNPgzVoDubjE=;
 b=UPMO2UOt8Cxxb2rfhnkONKA3MNRjDJEhP6WJ5PUjgPa5034zIz8jLYWR8LAwrH06F0
 c1urPry9LUsYnjbVqkl+rEiA/NT4Aos2cCjrlue81Hx1JeuTzLyHgqclVcXbV4WfASAj
 xkxrAOkI2UpvSBMksuj36Mh7PoI+3gQ3SDQGXfcoZdNmrV6324Pd+M4R7JJ6CfecWYhV
 8AzqoXw6NthhucMh7sIXJ8PD9CRUNpdLQfsWtoHfDDXobb1OByJKOMqe1SZmwahK6Uyo
 DMNYjBCFib6kVoVXt/qaKTvCaNlTGAt5QQYiVX5nfWMgPkZ9C2pgD7lgsh7bI5oWobCx
 Q0ZA==
X-Gm-Message-State: APjAAAX19zaTiEF8FkHoS0qXRjQTJZYrh9I7KftkAsEnPNlyzvKzYrGw
 OC4dCrvnoMP8mskI1WEM7hjPwQ==
X-Google-Smtp-Source: APXvYqxLlmDBZg/P/vEF8ikzHnQffFtewrj9TzaWVoQNGC13iKdBk6LVrKEwayd/n2sMqP5zjZigzQ==
X-Received: by 2002:a17:90a:cf8d:: with SMTP id
 i13mr238909pju.139.1572281791228; 
 Mon, 28 Oct 2019 09:56:31 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id t27sm11803729pfq.169.2019.10.28.09.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 09:56:30 -0700 (PDT)
Date: Mon, 28 Oct 2019 09:56:30 -0700 (PDT)
X-Google-Original-Date: Mon, 28 Oct 2019 09:55:55 PDT (-0700)
Subject: Re: [PATCH v1 1/1] opensbi: Upgrade from v0.4 to v0.5
In-Reply-To: <CAP+75-XUbnCDp-JH6JRnGLqVMxDWTFa9kPHJaZXm3NfCzZUbYg@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: philmd@redhat.com
Message-ID: <mhng-90e9ee91-7ee7-488a-8db0-35d39043f2fc@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Mon, 28 Oct 2019 16:56:37 -0000

On Sat, 26 Oct 2019 01:46:45 PDT (-0700), philmd@redhat.com wrote:
> On Sat, Oct 26, 2019 at 10:45 AM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> Hi Alistair,
>>
>> On 10/26/19 1:15 AM, Alistair Francis wrote:
>> > This release has:
>> >      Lot of critical fixes
>> >      Hypervisor extension support
>> >      SBI v0.2 base extension support
>> >      Debug prints support
>> >      Handle traps when doing unpriv load/store
>> >      Allow compiling without FP support
>> >      Use git describe to generate boot-time banner
>> >      Andes AE350 platform support
>>
>> Do you mind amending the output of 'git shortlog v0.4..v0.5'?
>
> Err this comment is for Palmer, if Alistair agree (no need to repost).

Works for me.  I've included the shortlog as part of the patch on my for-master 
branch, unless there's any opposition I'll include this in my next PR.

>
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > ---
>> > You can get the branch from here if the binaries are causing issues:
>> > https://github.com/alistair23/qemu/tree/mainline/alistair/opensbi.next
>>
>> You can use 'git format-patch --no-binary'.
>>
>> >
>> >   pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 36888 -> 40984 bytes
>> >   pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 45064 -> 49160 bytes
>> >   pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 40968 -> 45064 bytes
>> >   roms/opensbi                                 |   2 +-
>> >   4 files changed, 1 insertion(+), 1 deletion(-)
>> [...]
>> > diff --git a/roms/opensbi b/roms/opensbi
>> > index ce228ee091..be92da280d 160000
>> > --- a/roms/opensbi
>> > +++ b/roms/opensbi
>> > @@ -1 +1 @@
>> > -Subproject commit ce228ee0919deb9957192d723eecc8aaae2697c6
>> > +Subproject commit be92da280d87c38a2e0adc5d3f43bab7b5468f09
>> >

