Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lNY4H-0007Jc-Jt
	for mharc-qemu-riscv@gnu.org; Sat, 20 Mar 2021 05:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNY4B-0007GB-OC; Sat, 20 Mar 2021 05:38:47 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lNY49-0008Bc-Fs; Sat, 20 Mar 2021 05:38:43 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1616233107; cv=none; d=zohomail.in; s=zohoarc; 
 b=eAzUCx5F3FAJ8qVdbw4Bsem+s491DFI7njhq/ML+TjQPIreLv8dp6Aa5e0qDX5F+qkYoO8p7egGocGsc+s3gdLw7rdCKoefiWScjU6vQ34+jQInAzdOmbjUAz9pmZLhpJAByLqtSxq4odFGdwVS3M7HCqbXhw2hOqC1qg2DBGdY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1616233107;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ZCDS8Nmm4LXS59HVi5Bgz5VC0FY3RgPFIMAnSlFKoQc=; 
 b=FMJrGCzsWpvh4sk/COjiJZk3nqgp25to9J6S8PrSQYxD/Bu33kBnMSVYm7jV2Sz1NNFrMLherhxhdrkM6mUwOaMk9bPQnKhQ8moQ9thGs+6Q57MTznFhkZ9Xj1M5gYtI5iYxcNAKq7gfgBZLwyvUdPoymetd65n3KAGTTjZbJ3o=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1616233107; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=ZCDS8Nmm4LXS59HVi5Bgz5VC0FY3RgPFIMAnSlFKoQc=;
 b=clSrhbsraCplUH5PPlJ+KuywDgqtfOmR3MQ3Uo0h3Uw85Q9wVMxdOEoGw5JHLfkL
 clULoWBvQmC65eIZ5ScpVC1mlQ0QAUdJkI6jbRvgciCnTTPKzV19Y8HPUUJgbwWFWMn
 wVJ7M2uizTj6C4lyllFVGslJS1iuzeLPK+UF8D3w=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1616233105862914.9664377455897;
 Sat, 20 Mar 2021 15:08:25 +0530 (IST)
Date: Sat, 20 Mar 2021 15:08:25 +0530
From: Vijai Kumar K <vijai@behindbytes.com>
To: "Alistair Francis" <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Message-ID: <1784f0009c4.2768405041006.3269321445638908202@behindbytes.com>
In-Reply-To: <CAKmqyKOJ43cf__vXXpEQANPRfyyNFT5WVEcc-hnkfWAPg2kt_g@mail.gmail.com>
References: <20210314083936.76269-1-vijai@behindbytes.com>
 <20210314083936.76269-4-vijai@behindbytes.com>
 <CAKmqyKOJ43cf__vXXpEQANPRfyyNFT5WVEcc-hnkfWAPg2kt_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/riscv: Connect Shakti UART to Shakti platform
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Received-SPF: pass client-ip=103.117.158.51;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o51.zoho.in
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 20 Mar 2021 09:38:47 -0000




---- On Fri, 19 Mar 2021 19:17:58 +0530 Alistair Francis <alistair23@gmail.com> wrote ----

 > On Sun, Mar 14, 2021 at 5:11 AM Vijai Kumar K <vijai@behindbytes.com> wrote: 
 > > 
 > > Connect one shakti uart to the shakti_c machine. 
 > > 
 > > Signed-off-by: Vijai Kumar K <vijai@behindbytes.com> 
 > > --- 
 > >  hw/riscv/shakti_c.c         | 7 +++++++ 
 > >  include/hw/riscv/shakti_c.h | 2 ++ 
 > >  2 files changed, 9 insertions(+) 
 > > 
 > > diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c 
 > > index e96436a3bf..07cc42a380 100644 
 > > --- a/hw/riscv/shakti_c.c 
 > > +++ b/hw/riscv/shakti_c.c 
 > > @@ -133,6 +133,12 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp) 
 > >          shakti_c_memmap[SHAKTI_C_CLINT].size, 0, 1, 
 > >          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE, 
 > >          SIFIVE_CLINT_TIMEBASE_FREQ, false); 
 > > +    qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0)); 
 > > +    if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) { 
 > > +        return; 
 > > +    } 
 > > +    sysbus_mmio_map(SYS_BUS_DEVICE(&sss->uart), 0, 
 > > +                    shakti_c_memmap[SHAKTI_C_UART].base); 
 >  
 > Are there no interrupts? 
 >  
 > Alistair 

Not in the initial implementation. Interrupt support was added to the UART IP meanwhile. I did not test it.
Will come as a separate patch later.

Thanks,
Vijai Kumar K

 >  
 > >      /* ROM */ 
 > >      memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom", 
 > >                             shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal); 
 > > @@ -151,6 +157,7 @@ static void shakti_c_soc_instance_init(Object *obj) 
 > >      ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(obj); 
 > > 
 > >      object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY); 
 > > +    object_initialize_child(obj, "uart", &sss->uart, TYPE_SHAKTI_UART); 
 > > 
 > >      /* 
 > >       * CPU type is fixed and we are not supporting passing from commandline yet. 
 > > diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h 
 > > index 6c66a160f5..3abb080d3c 100644 
 > > --- a/include/hw/riscv/shakti_c.h 
 > > +++ b/include/hw/riscv/shakti_c.h 
 > > @@ -21,6 +21,7 @@ 
 > > 
 > >  #include "hw/riscv/riscv_hart.h" 
 > >  #include "hw/boards.h" 
 > > +#include "hw/char/shakti_uart.h" 
 > > 
 > >  #define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc" 
 > >  #define RISCV_SHAKTI_SOC(obj) \ 
 > > @@ -33,6 +34,7 @@ typedef struct ShaktiCSoCState { 
 > >      /*< public >*/ 
 > >      RISCVHartArrayState cpus; 
 > >      DeviceState *plic; 
 > > +    ShaktiUartState uart; 
 > >      MemoryRegion rom; 
 > > 
 > >  } ShaktiCSoCState; 
 > > -- 
 > > 2.25.1 
 > > 
 > > 
 > > 
 > 

