Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHvqS-0003bg-Qu
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 16:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iHvqM-0003Xy-7H
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 16:12:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iHvqI-0002MU-5S
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 16:12:23 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iHvqG-0002H6-3v
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 16:12:21 -0400
Received: by mail-pf1-f196.google.com with SMTP id y5so33904pfo.4
 for <qemu-riscv@nongnu.org>; Tue, 08 Oct 2019 13:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aThD0x6UFYPktJOEJAqWVZoA7jk9LW2iErdUgQ0f3WE=;
 b=WFE23Q3gvweNWJmDqHdRGnW/vYFCTWq+1mxQZ4sXDBAvKUBCb/VV/0U1aaKf31P45P
 3DeCFxmqHjU1kiGQ8B9+JcC/9Zwg67NoJKBpuqKDpfIuxVruDTvRR9Py97MfE0k0Bs5a
 HfyFp1VJjrh6+BHi204s87mUbnfx1NgWf92VTmQbSYUu6sFT//7Gf79vgZvaxEnwz9Uu
 qXfAJGX/AonQHZD/i8y0QM/ijLCfZM9qb4+E/N4LxU12+dKtUM0f7NAWC2bVhZKTKhyY
 R3S9BtU5xwI1YxRswtapfFTJEaXw+h0Lw7LoVL5gvGK1a4NDzXZ880ytwZ/ux89hylvm
 VEXg==
X-Gm-Message-State: APjAAAX3e40XPV/FSjCNBxKcNMuM5xaGjAQVGuEWH+HQTBCFvpbPyOGX
 DYMlAUaR/PuymMAvpVvc4/i+dg==
X-Google-Smtp-Source: APXvYqyvUG0tGBfIUBcjgigNfCTFo+mSG9AGIa0/fKPgOXMsm5DMKNX/EglMY9Y1xqrI7UZS+nPHhA==
X-Received: by 2002:aa7:9f43:: with SMTP id h3mr41669199pfr.215.1570565533190; 
 Tue, 08 Oct 2019 13:12:13 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s1sm38267pjs.31.2019.10.08.13.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 13:12:12 -0700 (PDT)
Date: Tue, 08 Oct 2019 13:12:12 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Oct 2019 13:11:55 PDT (-0700)
Subject: Re: [PATCH v2 4/7] riscv/sifive_u: Add the start-in-flash property
In-Reply-To: <CAKmqyKPMOAq3oeU-_MQHBAbzTv__iKr=uR8WkCfGbH8yk4afFg@mail.gmail.com>
CC: bmeng.cn@gmail.com, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-1d294790-a5b7-4fa7-8b5e-9adf550c5d1a@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.196
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
X-List-Received-Date: Tue, 08 Oct 2019 20:12:27 -0000

On Mon, 30 Sep 2019 11:04:45 PDT (-0700), alistair23@gmail.com wrote:
> On Fri, Sep 27, 2019 at 12:57 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Fri, Sep 27, 2019 at 8:55 AM Alistair Francis
>> <alistair.francis@wdc.com> wrote:
>> >
>> > Add a property that when set to true QEMU will jump from the ROM code to
>> > the start of flash memory instead of DRAM which is the default
>> > behaviour.
>> >
>> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > ---
>> >  hw/riscv/sifive_u.c         | 27 +++++++++++++++++++++++++++
>> >  include/hw/riscv/sifive_u.h |  2 ++
>> >  2 files changed, 29 insertions(+)
>> >
>> > diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
>> > index f5741e9a38..33b55d0d5b 100644
>> > --- a/hw/riscv/sifive_u.c
>> > +++ b/hw/riscv/sifive_u.c
>> > @@ -373,6 +373,10 @@ static void riscv_sifive_u_init(MachineState *machine)
>> >                                         /* dtb: */
>> >      };
>> >
>> > +    if (s->start_in_flash) {
>> > +        reset_vec[6] = memmap[SIFIVE_U_FLASH0].base; /* start: .dword FLASH0_BASE */
>> > +    }
>>
>> Please change to use the way that patch "[v2,7/7] riscv/virt: Jump to
>> pflash if specified" does for consistency, ie:
>>
>>     if (s->start_in_flash) {
>>         start_addr = memmap[SIFIVE_U_FLASH0].base; /* start: .dword
>> FLASH0_BASE */
>>     }
>>
>> > +
>> >      /* copy in the reset vector in little_endian byte order */
>> >      for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
>> >          reset_vec[i] = cpu_to_le32(reset_vec[i]);
>> > @@ -432,8 +436,31 @@ static void riscv_sifive_u_soc_init(Object *obj)
>> >                            TYPE_CADENCE_GEM);
>> >  }
>> >
>> > +static bool virt_get_start_in_flash(Object *obj, Error **errp)
>>
>> sifive_u_get_start_in_flash()
>>
>> > +{
>> > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
>> > +
>> > +    return s->start_in_flash;
>> > +}
>> > +
>> > +static void virt_set_start_in_flash(Object *obj, bool value, Error **errp)
>>
>> sifive_u_set_start_in_flash()
>
> Yep, I have fixed all of these.

Did I miss the v3?

>
> Alistair
>
>>
>> > +{
>> > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
>> > +
>> > +    s->start_in_flash = value;
>> > +}
>> > +
>> >  static void riscv_sifive_u_machine_instance_init(Object *obj)
>> >  {
>> > +    SiFiveUState *s = RISCV_U_MACHINE(obj);
>> > +
>> > +    s->start_in_flash = false;
>> > +    object_property_add_bool(obj, "start-in-flash", virt_get_start_in_flash,
>> > +                             virt_set_start_in_flash, NULL);
>> > +    object_property_set_description(obj, "start-in-flash",
>> > +                                    "Set on to tell QEMU's ROM to jump to " \
>> > +                                    "flash. Otherwise QEMU will jump to DRAM",
>> > +                                    NULL);
>> >  }
>> >
>> >  static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>> > diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
>> > index a921079fbe..2656b43c58 100644
>> > --- a/include/hw/riscv/sifive_u.h
>> > +++ b/include/hw/riscv/sifive_u.h
>> > @@ -57,6 +57,8 @@ typedef struct SiFiveUState {
>> >
>> >      void *fdt;
>> >      int fdt_size;
>> > +
>> > +    bool start_in_flash;
>> >  } SiFiveUState;
>> >
>>
>> Regards,
>> Bin

