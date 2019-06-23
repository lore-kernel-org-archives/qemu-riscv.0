Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hf3fG-0005Qb-PB
	for mharc-qemu-riscv@gnu.org; Sun, 23 Jun 2019 10:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37590)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hf3fD-0005Kf-3j
 for qemu-riscv@nongnu.org; Sun, 23 Jun 2019 10:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hf3fB-0006x1-SL
 for qemu-riscv@nongnu.org; Sun, 23 Jun 2019 10:40:15 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41488)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hf3fB-0006tc-Gs
 for qemu-riscv@nongnu.org; Sun, 23 Jun 2019 10:40:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id m30so6017503pff.8
 for <qemu-riscv@nongnu.org>; Sun, 23 Jun 2019 07:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=JjLddzaHvI3t2A9kPY+y1r7NmbWgqxj/rvlxecyOHM0=;
 b=fz+/z1PXg6WHsvAjiGKApnMB9T3DxpFXD127X2dHLuM4DMGbGyhIndTmo7jELy4OjY
 Xu6leONWmq5+YL5zp6N5UzsUga2B/lHde7uMdYRi6+8c5n8CCV2TNoJSi1KPK87sfBOD
 YL//ISXdvTotcn1sXP4RpPGblHNvgSkIC1Mj5Lz4fnYheUzF2FAAPH8fkAtDbKyUNWf/
 Ki4ooRewXMWWvLRipue6YxaDC6Yq7D5OE27s2COVS+9BxvMD8BfMYk93fQFw4dwLysmY
 lecGLjtPsaM5YwzmKzQhEGfyDPRlRmyoveR46QPvINCL/zFQ7FNE0NJmWn+yhqAj95FE
 IQMw==
X-Gm-Message-State: APjAAAXCyO1k6xuKXYZsVG8gvFHBQA3Y9LJ+5Ey+dJrtWvhX4znjjk4G
 CRUEM/pXqnd9FMoLz1hM39JiKg==
X-Google-Smtp-Source: APXvYqxrYKl+RuI0nkjCn7BRHBxzJRRVVdxDftaglqxIhkNiBk8Qr6Xg8/PMvBXtnt7plMgT8/a89g==
X-Received: by 2002:a63:e506:: with SMTP id r6mr5526499pgh.324.1561300811248; 
 Sun, 23 Jun 2019 07:40:11 -0700 (PDT)
Received: from localhost (220-137-89-38.dynamic-ip.hinet.net. [220.137.89.38])
 by smtp.gmail.com with ESMTPSA id
 p67sm12326919pfg.124.2019.06.23.07.40.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 23 Jun 2019 07:40:10 -0700 (PDT)
Date: Sun, 23 Jun 2019 07:40:10 -0700 (PDT)
X-Google-Original-Date: Sat, 22 Jun 2019 22:39:49 PDT (-0700)
In-Reply-To: <CAEUhbmWJYE+BUfE5v-TrmQ=xzhV8HuxFhBQrtU74T6TKfTZXCw@mail.gmail.com>
CC: alistair23@gmail.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-ab33da75-40fa-4fec-8f96-28a3287ef952@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.194
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: sifive_test: Add reset
 functionality
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
X-List-Received-Date: Sun, 23 Jun 2019 14:40:16 -0000

On Thu, 20 Jun 2019 22:40:24 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Palmer,
>
> On Fri, Jun 21, 2019 at 10:53 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 19 Jun 2019 06:42:21 PDT (-0700), bmeng.cn@gmail.com wrote:
>> > Hi Alistair,
>> >
>> > On Tue, Jun 18, 2019 at 1:15 AM Alistair Francis <alistair23@gmail.com> wrote:
>> >>
>> >> On Fri, Jun 14, 2019 at 8:30 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >> >
>> >> > This adds a reset opcode for sifive_test device to trigger a system
>> >> > reset for testing purpose.
>> >> >
>> >> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>> >> > ---
>> >> >
>> >> >  hw/riscv/sifive_test.c         | 4 ++++
>> >> >  include/hw/riscv/sifive_test.h | 3 ++-
>> >> >  2 files changed, 6 insertions(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
>> >> > index 24a04d7..cd86831 100644
>> >> > --- a/hw/riscv/sifive_test.c
>> >> > +++ b/hw/riscv/sifive_test.c
>> >> > @@ -21,6 +21,7 @@
>> >> >  #include "qemu/osdep.h"
>> >> >  #include "hw/sysbus.h"
>> >> >  #include "qemu/module.h"
>> >> > +#include "sysemu/sysemu.h"
>> >> >  #include "target/riscv/cpu.h"
>> >> >  #include "hw/riscv/sifive_test.h"
>> >> >
>> >> > @@ -40,6 +41,9 @@ static void sifive_test_write(void *opaque, hwaddr addr,
>> >> >              exit(code);
>> >> >          case FINISHER_PASS:
>> >> >              exit(0);
>> >> > +        case FINISHER_RESET:
>> >> > +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>> >> > +            return;
>> >> >          default:
>> >> >              break;
>> >> >          }
>> >> > diff --git a/include/hw/riscv/sifive_test.h b/include/hw/riscv/sifive_test.h
>> >> > index 71d4c9f..c186a31 100644
>> >> > --- a/include/hw/riscv/sifive_test.h
>> >> > +++ b/include/hw/riscv/sifive_test.h
>> >> > @@ -34,7 +34,8 @@ typedef struct SiFiveTestState {
>> >> >
>> >> >  enum {
>> >> >      FINISHER_FAIL = 0x3333,
>> >> > -    FINISHER_PASS = 0x5555
>> >> > +    FINISHER_PASS = 0x5555,
>> >> > +    FINISHER_RESET = 0x7777
>> >>
>> >> Do you mind sharing where you got this value from? I can't find
>> >> details on this device in the SiFive manuals.
>> >>
>> >
>> > I don't think this is a device that actually exists on SiFive's
>> > chipset. It's hypothetical.
>>
>> The device actually does exist in the hardware, but that's just an
>> implementation quirk.  Essentially what's going on here is that the RTL
>> contains this device, which has a register and then a behavioral verilog block
>> that causes simulations to terminate.  This is how we exit from tests in RTL
>> simulation, and we've just gone ahead and implemented the same device in QEMU
>> in order to make it easy to have compatibility with those bare-metal tests.
>> Due to how our design flow is set up we end up with exactly the same block in
>> the ASIC.  The register is still there, but the behavioral code to exit
>> simulations doesn't do anything so it's essentially just a useless device.
>> Since it's useless we don't bother writing it up in the ASIC documentation, but
>> it should be in the RTL documentation.
>>
>> I'm not opposed to extending the interface in the suggested fashion, but I
>> wanted to check with the hardware team first to see if they're doing anything
>> with the other numbers.  I'm out of the office (and somewhat backed up on code
>> review) until July, so it might take a bit to dig through this.
>
> Thanks for the clarification. The main reason of adding this
> functionality is to provide software a way of rebooting the whole
> system. Please provide update after you consult SiFive hardware guys
> :)

Ya, it makes sense.  My only worry here is that we have some way of doing this
already, in which case I'd just want to make sure it matches.

