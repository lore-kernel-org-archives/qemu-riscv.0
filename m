Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hxxg9-0007I7-T6
	for mharc-qemu-riscv@gnu.org; Wed, 14 Aug 2019 14:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1hxxg7-0007H7-U1
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 14:07:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1hxxg6-0002cc-D4
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 14:07:19 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:34294)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hxxg6-0002c8-6g
 for qemu-riscv@nongnu.org; Wed, 14 Aug 2019 14:07:18 -0400
Received: by mail-pf1-x444.google.com with SMTP id b24so3531573pfp.1
 for <qemu-riscv@nongnu.org>; Wed, 14 Aug 2019 11:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BYMZIJRAjZIOACutjhNqljiEiMOmv7+eNJtz5BWVSgw=;
 b=hepls6ws1FXVROt6tr7O2nbFJcHq/sukUcuQAC0kC5+ycaHM1JfKTjXuNUwE2RMfNQ
 /FX4dIL+rlz9nA843y1h+qLNCmJYGsbP12rcVsaS4wMLVQWO7NDiypJZaNHPsRfpqWrv
 YQMs9GpdY4tjnFdvnzFsNSZcLs2R3DO6Leg/0Hks5d07xvxfrmnmWO61tdXxbYiLCv8O
 XYJPciZ/WOBe3joiwHKpGvinFr3m4ko9J9jeWBkFwRwLQQhmVWEK1vNhw6rmvmXUrwd6
 r5kkxSKu8HKMI3twUtLKOQwi6xfdqyQa6b309A93O0thOzMmyClld8YxiAx0p3otLzKa
 8DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BYMZIJRAjZIOACutjhNqljiEiMOmv7+eNJtz5BWVSgw=;
 b=fqrL1loNq/455OhS4eo6h3VyBD7/QuKgvnu7e1v9xP8PcZsg9d+DgHkIHYO+IA7Jt+
 wtp33Fyf4uqYlTrXLR7sWFLQLdF3H79sXbr0a4ffoz+uSaioCZVX210/Unhw3aIVCraH
 XZ389trD3rdSGRQyxKITy3AXlpekMQ8JrThcwCVr0bHUTSa7eqZ29Uz7SeMl7Fi4wxxO
 H+0p521AGCsqMPsLiY1Io+9pQgJl1IG7xNf6/DGPLVxOEKKx6fqJUm9z9qNMUNTqpDq/
 HKTfIIl4QmD3htrcWZVX0DDWwuVqX8jZs5YJSf7KyhIDdi63VYnI6XcOFSUIgoAIFK7P
 m8HA==
X-Gm-Message-State: APjAAAV7TuZl5zsppSoV7naSaicFJDTReM6RlVeL8H1rVuPJxZNwlovS
 TfLLwLvZkk6lMwxjksUqMQWfRg==
X-Google-Smtp-Source: APXvYqy4F7rriy4VoxSPVX1QlZ3crKkoK6y2dlG8veTj0821JfFtb4ymEc3gwmmtmwt5jd9Sgbagxw==
X-Received: by 2002:a62:aa13:: with SMTP id e19mr1171919pff.37.1565806036961; 
 Wed, 14 Aug 2019 11:07:16 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f26sm531371pfq.38.2019.08.14.11.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:07:16 -0700 (PDT)
Date: Wed, 14 Aug 2019 11:07:16 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Aug 2019 10:56:01 PDT (-0700)
In-Reply-To: <CAKmqyKOikOJCp0d7ivt2tvd9P56xGZKEh_OrGBf4qo0hQOidJA@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-dea7d47b-8f66-44b1-84c8-6b5a04ee0b86@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] [PATCH-4.2 v2 5/5] target/riscv: Fix Floating
 Point register names
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
X-List-Received-Date: Wed, 14 Aug 2019 18:07:21 -0000

On Tue, 13 Aug 2019 10:06:58 PDT (-0700), alistair23@gmail.com wrote:
> On Mon, Aug 12, 2019 at 4:08 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Tue, 30 Jul 2019 16:35:34 PDT (-0700), Alistair Francis wrote:
>> > From: Atish Patra <atish.patra@wdc.com>
>> >
>> > As per the RISC-V spec, Floating Point registers are named as f0..f31
>> > so lets fix the register names accordingly.
>> >
>> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > ---
>> >  target/riscv/cpu.c | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> > index f8d07bd20a..af1e9b7690 100644
>> > --- a/target/riscv/cpu.c
>> > +++ b/target/riscv/cpu.c
>> > @@ -40,10 +40,10 @@ const char * const riscv_int_regnames[] = {
>> >  };
>> >
>> >  const char * const riscv_fpr_regnames[] = {
>> > -  "ft0", "ft1", "ft2",  "ft3",  "ft4", "ft5", "ft6",  "ft7",
>> > -  "fs0", "fs1", "fa0",  "fa1",  "fa2", "fa3", "fa4",  "fa5",
>> > -  "fa6", "fa7", "fs2",  "fs3",  "fs4", "fs5", "fs6",  "fs7",
>> > -  "fs8", "fs9", "fs10", "fs11", "ft8", "ft9", "ft10", "ft11"
>> > +  "f0", "f1", "f2",  "f3",  "f4", "f5", "f6", "f7",
>> > +  "f8", "f9", "f10",  "f11",  "f12", "f13", "f14", "f15",
>> > +  "f16", "f17", "f18",  "f19",  "f20", "f21", "f22", "f23",
>> > +  "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31"
>> >  };
>> >
>> >  const char * const riscv_excp_names[] = {
>>
>> I actually don't think this one is right: riscv_int_regnames uses the ABI
>> names, so this should match.  I'd be OK switching both of them, but not just
>> one.
>
> I like that the int registers use the ABI names though, as I find that useful.
>
> What about we change the registers to use both? As in something like
> x0/zero for all registers?
>
> The disadvantage is that it's a little longer, but it seems the most useful.

I'm fine with that, as long as it doesn't show up in the GDB XML stuff as that 
will likely cause issues.

> Alistair
>
>>
>> I've queued the other four patches.

