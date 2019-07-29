Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hsBc8-0004nq-UF
	for mharc-qemu-riscv@gnu.org; Mon, 29 Jul 2019 15:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38874)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hsBc4-0004nK-RE
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 15:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hsBc1-000317-Pe
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 15:47:15 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43031)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hsBby-0002zo-7C
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 15:47:11 -0400
Received: by mail-pl1-f195.google.com with SMTP id 4so20912214pld.10
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2019 12:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=W/z83AzHFaw3DGAxqhEjaZdGLVFWMoRJnIy84bro/BA=;
 b=DSHNouoP8h+knWNd85SLC/DQOoOzBdmcwB2l0seme0mqKwDQDFok3QzZ8HMfpP9vYs
 NxpQZ9dAk0IcncC2qVKyMNL21UFITswch+OLTnKCvHu0k5rZbq+B6KTp8PkEvchBNCKZ
 5G3cdQV52DGsYOPeqjsUxVyVyj/bPn6yrMTeMhC55MUao2OtzmpRUtiCtZRyBQ4fJopt
 fzyAHCOKB0Sh3dHQ6neQIZ/uKrDIiaZ54N9Rs8OUSaUxYbNuYdDIoUodc1/1EJgNnpes
 BSwL4XRtXQAXMi0SQbwrydPvHKtNG1Mc841sheORtvDYLvvOTibqkPjiPwjsoHbvidl4
 MINA==
X-Gm-Message-State: APjAAAUR1czOfQJnnKlz5N9tqcYQ5O9Uu9sK+VF3pCzDQjni8nz5DypV
 ICcozIkoJgk4W/uKZcaT4s46gSbd
X-Google-Smtp-Source: APXvYqzut3i/aGaWphpOb2tpNZduIsZZe2FObezlR1A5+vg9ZVe9PdQwlpGjnhYnqOB8LpU1+Wd6cA==
X-Received: by 2002:a17:902:2983:: with SMTP id
 h3mr112554620plb.45.1564429628364; 
 Mon, 29 Jul 2019 12:47:08 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x26sm80575076pfq.69.2019.07.29.12.47.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 12:47:07 -0700 (PDT)
Date: Mon, 29 Jul 2019 12:47:07 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Jul 2019 12:46:56 PDT (-0700)
In-Reply-To: <CAEUhbmWfS8TPTRa-Ovc1gnPUC-3ofA4G+sR7PaSNzfWT-fPNfQ@mail.gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-2dc6a880-670f-449e-9361-9cf2ae4af4ee@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.195
Subject: Re: [Qemu-riscv] [PATCH] riscv: sifive_test: Add reset functionality
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
X-List-Received-Date: Mon, 29 Jul 2019 19:47:18 -0000

On Mon, 22 Jul 2019 22:30:15 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Palmer,
>
> On Sat, Jul 20, 2019 at 9:47 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Fri, 14 Jun 2019 08:15:51 PDT (-0700), bmeng.cn@gmail.com wrote:
>> > This adds a reset opcode for sifive_test device to trigger a system
>> > reset for testing purpose.
>> >
>> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> > ---
>> >
>> >  hw/riscv/sifive_test.c         | 4 ++++
>> >  include/hw/riscv/sifive_test.h | 3 ++-
>> >  2 files changed, 6 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
>> > index 24a04d7..cd86831 100644
>> > --- a/hw/riscv/sifive_test.c
>> > +++ b/hw/riscv/sifive_test.c
>> > @@ -21,6 +21,7 @@
>> >  #include "qemu/osdep.h"
>> >  #include "hw/sysbus.h"
>> >  #include "qemu/module.h"
>> > +#include "sysemu/sysemu.h"
>> >  #include "target/riscv/cpu.h"
>> >  #include "hw/riscv/sifive_test.h"
>> >
>> > @@ -40,6 +41,9 @@ static void sifive_test_write(void *opaque, hwaddr addr,
>> >              exit(code);
>> >          case FINISHER_PASS:
>> >              exit(0);
>> > +        case FINISHER_RESET:
>> > +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>> > +            return;
>> >          default:
>> >              break;
>> >          }
>> > diff --git a/include/hw/riscv/sifive_test.h b/include/hw/riscv/sifive_test.h
>> > index 71d4c9f..c186a31 100644
>> > --- a/include/hw/riscv/sifive_test.h
>> > +++ b/include/hw/riscv/sifive_test.h
>> > @@ -34,7 +34,8 @@ typedef struct SiFiveTestState {
>> >
>> >  enum {
>> >      FINISHER_FAIL = 0x3333,
>> > -    FINISHER_PASS = 0x5555
>> > +    FINISHER_PASS = 0x5555,
>> > +    FINISHER_RESET = 0x7777
>> >  };
>> >
>> >  DeviceState *sifive_test_create(hwaddr addr);
>>
>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>
> Thanks a lot!
>
>> Sorry this took a while, but it's in the hardware now.  I'll merge this, but
>> I'm considering it a new feature so it'll be held off a bit.
>
> "but it's in the hardware now", do you mean the code I added (0x7777)
> is now supported by a newer version SiFive test device with compatible
> string "sifive,test1", and can actually do the system wide reset?

No, the hardware is still a "sifive,test0" as plumbing through the reset is
trickier than I wanted to take on.  I just reserved the 0x7777 code and
implemented it by triggering an unsupported function error, so we don't
accidentally use it for something else later.

