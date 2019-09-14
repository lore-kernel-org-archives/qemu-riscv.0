Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i9DHo-0002lo-CC
	for mharc-qemu-riscv@gnu.org; Sat, 14 Sep 2019 15:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i9DHl-0002lY-NP
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 15:00:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i9DHk-0001vT-Ej
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 15:00:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37646)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i9DHk-0001v9-92
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 15:00:40 -0400
Received: by mail-pf1-f194.google.com with SMTP id y5so17281533pfo.4
 for <qemu-riscv@nongnu.org>; Sat, 14 Sep 2019 12:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Q+ZtLM++dtjWC3FwNLOVxw/kKAndyJKMVCk+RAU58YA=;
 b=S2WnLTyqNmJLQRJ0qF/pbFeTW+L8Ov0E1jl5s6RnalLkNqN/3b6d+b3aJPO/A6yDUt
 N8ykhzy+7sus58RzRSe4NTkMw8/lsIUEc0TE0wBPy0WWSjIw942zHeSrZ5OXC4Bel1g2
 c+aghdd0+PT4veIZ4y6KSj4QvCqkZx75xKL90lODydrfoHCuhBaDo3HXwxIXWnIS6Jp8
 Z+I743ZHkgzRy/64IkvuR0hPOY6E7DcxhQpwNJ87OFvEQVJFwrVR6JEUt4aVHlhTkp+X
 iiEdcwcr/YLy+nhjeqq0A440eba6wsI+9SBL3gzg0ptlBYmcrqPhNKsgmhidAdd1md8t
 7veA==
X-Gm-Message-State: APjAAAVMIEyIn7nQrjzqgGLC4gOIthXMnrPC2EKhu7E4Hmv0ZFwEy9b0
 oPZOBNwPIGdcZH6M9YFrH7uOQg==
X-Google-Smtp-Source: APXvYqxp61xa6q5WJXeDgHu6godzYQIzCGF/Auzz5QzwereCL5qmpi78AzClM0NV1a+UJtkvV6ZIsQ==
X-Received: by 2002:a63:590f:: with SMTP id n15mr37897296pgb.190.1568487638232; 
 Sat, 14 Sep 2019 12:00:38 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id q22sm38030167pgh.49.2019.09.14.12.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 12:00:37 -0700 (PDT)
Date: Sat, 14 Sep 2019 12:00:37 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2019 11:54:31 PDT (-0700)
In-Reply-To: <CAEUhbmUksfEiGLZ0qzsWkaDOaocTvkEYefiSUmGZT7TftYfmEg@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-165ebd8f-3595-48d3-a614-79f52d81c14c@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: Re: [Qemu-riscv] [PATCH v8 18/32] riscv: sifive_u: Set the minimum
 number of cpus to 2
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
X-List-Received-Date: Sat, 14 Sep 2019 19:00:43 -0000

On Fri, 13 Sep 2019 08:25:21 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Palmer,
>
> On Fri, Sep 13, 2019 at 10:33 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Fri, 06 Sep 2019 09:20:05 PDT (-0700), bmeng.cn@gmail.com wrote:
>> > It is not useful if we only have one management CPU.
>> >
>> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> >
>> > ---
>> >
>> > Changes in v8: None
>> > Changes in v7: None
>> > Changes in v6: None
>> > Changes in v5: None
>> > Changes in v4: None
>> > Changes in v3:
>> > - use management cpu count + 1 for the min_cpus
>> >
>> > Changes in v2:
>> > - update the file header to indicate at least 2 harts are created
>> >
>> >  hw/riscv/sifive_u.c         | 4 +++-
>> >  include/hw/riscv/sifive_u.h | 2 ++
>> >  2 files changed, 5 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> > index 2947e06..2023b71 100644
>> > --- a/hw/riscv/sifive_u.c
>> > +++ b/hw/riscv/sifive_u.c
>> > @@ -10,7 +10,8 @@
>> >   * 1) CLINT (Core Level Interruptor)
>> >   * 2) PLIC (Platform Level Interrupt Controller)
>> >   *
>> > - * This board currently uses a hardcoded devicetree that indicates one hart.
>> > + * This board currently generates devicetree dynamically that indicates at least
>> > + * two harts.
>> >   *
>> >   * This program is free software; you can redistribute it and/or modify it
>> >   * under the terms and conditions of the GNU General Public License,
>> > @@ -433,6 +434,7 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
>> >       * management CPU.
>> >       */
>> >      mc->max_cpus = 4;
>> > +    mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
>> >  }
>> >
>> >  DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
>> > diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
>> > index f25bad8..6d22741 100644
>> > --- a/include/hw/riscv/sifive_u.h
>> > +++ b/include/hw/riscv/sifive_u.h
>> > @@ -69,6 +69,8 @@ enum {
>> >      SIFIVE_U_GEM_CLOCK_FREQ = 125000000
>> >  };
>> >
>> > +#define SIFIVE_U_MANAGEMENT_CPU_COUNT   1
>> > +
>> >  #define SIFIVE_U_PLIC_HART_CONFIG "MS"
>> >  #define SIFIVE_U_PLIC_NUM_SOURCES 54
>> >  #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
>>
>> This fails "make check", so I'm going to squash in this
>>
>> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> index ca9f7fea41..adecbf1dd9 100644
>> --- a/hw/riscv/sifive_u.c
>> +++ b/hw/riscv/sifive_u.c
>> @@ -528,6 +528,7 @@ static void riscv_sifive_u_machine_init(MachineClass *mc)
>>      mc->init = riscv_sifive_u_init;
>>      mc->max_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + SIFIVE_U_COMPUTE_CPU_COUNT;
>>      mc->min_cpus = SIFIVE_U_MANAGEMENT_CPU_COUNT + 1;
>> +    mc->default_cpus = mc->max_cpus;
>
> Thank you for fixing the 'make check'. Shouldn't it be:
>
> mc->default_cpus = mc->min_cpus;

We have 5 harts on the board that this matches, so I figured that'd be the 
better default.

>
> ?
>
>>  }
>>
>>  DEFINE_MACHINE("sifive_u", riscv_sifive_u_machine_init)
>
> Regards,
> Bin

