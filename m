Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jm3FO-0007OG-2T
	for mharc-qemu-riscv@gnu.org; Thu, 18 Jun 2020 18:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1jm3FL-0007LT-S0
 for qemu-riscv@nongnu.org; Thu, 18 Jun 2020 18:42:59 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1jm3FJ-0001qz-DE
 for qemu-riscv@nongnu.org; Thu, 18 Jun 2020 18:42:59 -0400
Received: by mail-pg1-x542.google.com with SMTP id e9so3592093pgo.9
 for <qemu-riscv@nongnu.org>; Thu, 18 Jun 2020 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=JDsXUrwiyOxKf5EPRtphxAPjkjSRxEUgA9ZOYjRX/kk=;
 b=iJDPgAUEMsw8E8skxCSOsFtCdfWXqnEzKsTTbO085A3ppKwCPV3WL5q1PZchjHH4cQ
 Otyq5E7ytqo3JurXE7nfZQV4WdJITEBa1Afaij1n6YvxFD0lP1MClxEOGPHEjLTD7C5g
 +0A8XzTu2n6FGzH4bMHF9E3mNwreV0Rq/j3kPMpGTk/a19ZELLG6qufq9LiVTiGPXcGm
 WVBDbrphk7hC1U+t4ggXqeS2bTNsrcOT8Z3aZFAG1oNq77mjjBZZow2/PvNAgx5ObYSB
 B59eUnC+B0yVqMh6feh2YESVA3XQlCruLRFXku+RGs2jdFgThFryBQO+eE2bG6LJ5ARF
 rONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=JDsXUrwiyOxKf5EPRtphxAPjkjSRxEUgA9ZOYjRX/kk=;
 b=kiaZc799SV5465zIF1PfJHtuhAuuRdPlcDmSprkFPad0bFE1HB5ltqDPh7a48wrQu4
 r3uPNjWki/J/Inimsb/UGBNvtnCnrtvKudxs6hP0Nbrfin6U2EDFPpV6CVbHsfh6LhBp
 cgN7pRuLGPECxZ5dcwp72aelrQrlF8/JiUCZ7ahXrcU59JPx4k+bM8Gnypb1Y5DoRjOk
 lK6RYl0xhbPYgsY9dVmVeWIQYypdmb24cED/8qjRlZWDbrhJg1nwp7K4V1KKydDmtjy1
 iE+vSCdifJeHV7Si6W/b9uwCv4nYENu5OyUPjXJFpc7mVqP3+7mlb4Ya/swVQrl7ZoJs
 uXoQ==
X-Gm-Message-State: AOAM532DwI8SADb1q7a9fkQY6tD6SEXGhBRByDWQF4eRjCmK2cjmierf
 8PXprgPWi5PklX4tF0IoNE1XfA==
X-Google-Smtp-Source: ABdhPJwa9fza9+H5BE5YttB7nji9Mj6EdEpqwr4CSVnjOsVSExToqj2PGum9/yEyhgVtnYT01NHDSw==
X-Received: by 2002:a62:52d6:: with SMTP id g205mr5641864pfb.78.1592520174976; 
 Thu, 18 Jun 2020 15:42:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y4sm3797849pfr.182.2020.06.18.15.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 15:42:54 -0700 (PDT)
Date: Thu, 18 Jun 2020 15:42:54 -0700 (PDT)
X-Google-Original-Date: Thu, 18 Jun 2020 15:41:33 PDT (-0700)
Subject: Re: [PATCH v1 2/2] sifive_e: Support the revB machine
In-Reply-To: <CAKmqyKPOSdgnWfCR40jXC6qQjeeEr8rfzQaez+Ce92CZstz_aw@mail.gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com
Message-ID: <mhng-1811460a-33f1-4c92-a74e-bdb56605da62@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=palmer@dabbelt.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Thu, 18 Jun 2020 22:43:00 -0000

On Wed, 10 Jun 2020 15:13:49 PDT (-0700), alistair23@gmail.com wrote:
> On Thu, May 28, 2020 at 11:13 AM Alistair Francis <alistair23@gmail.com> wrote:
>>
>> On Thu, May 21, 2020 at 8:57 AM Alistair Francis <alistair23@gmail.com> wrote:
>> >
>> > On Wed, May 20, 2020 at 4:08 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> > >
>> > > On Thu, 14 May 2020 13:47:10 PDT (-0700), Alistair Francis wrote:
>> > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > > > ---
>> > > >  hw/riscv/sifive_e.c         | 35 +++++++++++++++++++++++++++++++----
>> > > >  include/hw/riscv/sifive_e.h |  1 +
>> > > >  2 files changed, 32 insertions(+), 4 deletions(-)
>> > > >
>> > > > diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
>> > > > index 472a98970b..cb7818341b 100644
>> > > > --- a/hw/riscv/sifive_e.c
>> > > > +++ b/hw/riscv/sifive_e.c
>> > > > @@ -98,10 +98,14 @@ static void riscv_sifive_e_init(MachineState *machine)
>> > > >          memmap[SIFIVE_E_DTIM].base, main_mem);
>> > > >
>> > > >      /* Mask ROM reset vector */
>> > > > -    uint32_t reset_vec[2] = {
>> > > > -        0x204002b7,        /* 0x1000: lui     t0,0x20400 */
>> > > > -        0x00028067,        /* 0x1004: jr      t0 */
>> > > > -    };
>> > > > +    uint32_t reset_vec[2];
>> > > > +
>> > > > +    if (s->revb) {
>> > > > +        reset_vec[0] = 0x200102b7;        /* 0x1000: lui     t0,0x20010 */
>> > > > +    } else {
>> > > > +        reset_vec[0] = 0x204002b7;        /* 0x1000: lui     t0,0x20400 */
>> > > > +    }
>> > > > +    reset_vec[1] = 0x00028067;        /* 0x1004: jr      t0 */
>> > > >
>> > > >      /* copy in the reset vector in little_endian byte order */
>> > > >      for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
>> > > > @@ -115,8 +119,31 @@ static void riscv_sifive_e_init(MachineState *machine)
>> > > >      }
>> > > >  }
>> > > >
>> > > > +static bool sifive_e_machine_get_revb(Object *obj, Error **errp)
>> > > > +{
>> > > > +    SiFiveEState *s = RISCV_E_MACHINE(obj);
>> > > > +
>> > > > +    return s->revb;
>> > > > +}
>> > > > +
>> > > > +static void sifive_e_machine_set_revb(Object *obj, bool value, Error **errp)
>> > > > +{
>> > > > +    SiFiveEState *s = RISCV_E_MACHINE(obj);
>> > > > +
>> > > > +    s->revb = value;
>> > > > +}
>> > > > +
>> > > >  static void sifive_e_machine_instance_init(Object *obj)
>> > > >  {
>> > > > +    SiFiveEState *s = RISCV_E_MACHINE(obj);
>> > > > +
>> > > > +    s->revb = false;
>> > > > +    object_property_add_bool(obj, "revb", sifive_e_machine_get_revb,
>> > > > +                             sifive_e_machine_set_revb, NULL);
>> > > > +    object_property_set_description(obj, "revb",
>> > > > +                                    "Set on to tell QEMU that it should model "
>> > > > +                                    "the revB HiFive1 board",
>> > > > +                                    NULL);
>> > > >  }
>> > > >
>> > > >  static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
>> > > > diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
>> > > > index 414992119e..0d3cd07fcc 100644
>> > > > --- a/include/hw/riscv/sifive_e.h
>> > > > +++ b/include/hw/riscv/sifive_e.h
>> > > > @@ -45,6 +45,7 @@ typedef struct SiFiveEState {
>> > > >
>> > > >      /*< public >*/
>> > > >      SiFiveESoCState soc;
>> > > > +    bool revb;
>> > > >  } SiFiveEState;
>> > > >
>> > > >  #define TYPE_RISCV_E_MACHINE MACHINE_TYPE_NAME("sifive_e")
>> > >
>> > > IIRC there are way more differences between the un-suffixed FE310 and the Rev
>> > > B, specifically the interrupt map is all different.
>> >
>> > The three IRQs that QEMU uses for the SiFive E (UART0, UART1 and GPIO)
>> > all seem to be the same.
>>
>> Ping!
>
> Ping^2
>
> Applying to RISC-V tree.

They're not: uart0 is interrupt 3 on the rev b but 5 on the non-rev b (which
they don't call rev a but I'm going to :)).  There's isn't even a uart1 in the
DTS on the rev a, and the GPIO interrupts are different as well.

The DTS files are in SiFive's SDK:

https://github.com/sifive/freedom-e-sdk/blob/master/bsp/sifive-hifive1-revb/core.dts
https://github.com/sifive/freedom-e-sdk/blob/master/bsp/sifive-hifive1/core.dts

which should also generate some test programs.  When I was there we tested on
QEMU for the platforms that were supported, so there should be some support for
doing so still.

>
> Alistair
>
>>
>> >
>> > Alistair

