Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSLvD-0002Yw-1P
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 11:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lSLvB-0002Y4-1d; Fri, 02 Apr 2021 11:41:17 -0400
Received: from sender-of-o51.zoho.in ([103.117.158.51]:2364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1lSLv8-0004jF-BY; Fri, 02 Apr 2021 11:41:16 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617378063; cv=none; d=zohomail.in; s=zohoarc; 
 b=SMGQeGJVG3/DxMlzsPBmlmA2WxcYSnK7cmaug9fvY5NSouFmwLFwwI5I6QryyiKNbtFF7OniQp61DbKIgmSy2zaN36ohMUN6XvKum9QCGpCMiIAn13o00HE6GH4jVeodUaOBpflsiHgLtrR6e9/zxdBvr6I+HDeE1LyHmcLmcR4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1617378063;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=b9XHrSf/1QpdNkkDHEYBFzxGNrNIsmYCD6m/byGvcAI=; 
 b=J6Z93HpPvIwKEtSC4hlcCZ4OpXQ1p+h/V6cV9KHqrkPCDJ0NMhpiCkKwgMKKf+ZzZedN+flx0DYsyohLSBDo626TTHFR8FUxOAAYnot16rxyu0IJC5zR6slPuK6wX/Ja52k00mH4AxjyoztEvxATgNGipNKYy30uN0CkWUk0NaI=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
 header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617378063; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=b9XHrSf/1QpdNkkDHEYBFzxGNrNIsmYCD6m/byGvcAI=;
 b=fUpeG0pERRNnwZzYIiMvKG+1kvunRPTh3Npf9akMfeYeY40/QozRJt7eTCF4lxnu
 KjbwEm4Q76z6gtLPfKHte45vNcP7k4TO9lNqo/40omru+XAB+sIshPxCTH5T/rFTrns
 1l61fU7jzuG91GKRX1bxPIcS8EEwnOA6NABzf8b4=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1617378061554346.2604210256774;
 Fri, 2 Apr 2021 21:11:01 +0530 (IST)
Date: Fri, 02 Apr 2021 21:11:01 +0530
From: Vijai Kumar K <vijai@behindbytes.com>
To: "Alistair Francis" <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Message-ID: <178933eacf0.29d40a5748832.4360448576483328617@behindbytes.com>
In-Reply-To: <CAKmqyKPCbBznWkOeREnb-r7gHbzhvvjBXafNYkBT1u52+9z7hQ@mail.gmail.com>
References: <20210401181457.73039-1-vijai@behindbytes.com>
 <20210401181457.73039-5-vijai@behindbytes.com>
 <CAKmqyKPCbBznWkOeREnb-r7gHbzhvvjBXafNYkBT1u52+9z7hQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] hw/riscv: Connect Shakti UART to Shakti platform
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
X-List-Received-Date: Fri, 02 Apr 2021 15:41:17 -0000




---- On Fri, 02 Apr 2021 18:35:04 +0530 Alistair Francis <alistair23@gmail.com> wrote ----

 > On Thu, Apr 1, 2021 at 2:15 PM Vijai Kumar K <vijai@behindbytes.com> wrote: 
 > > 
 > > Connect one shakti uart to the shakti_c machine. 
 > > 
 > > Signed-off-by: Vijai Kumar K <vijai@behindbytes.com> 
 >  
 > In future can you please keep the Reviewed by tags when sending a new 
 > version of the patch series? 

Yes. My bad. Sorry about that.

Thanks,
Vijai Kumar K

 >  
 > Reviewed-by: Alistair Francis <alistair.francis@wdc.com> 
 >  
 > Alistair 
 >  
 > > --- 
 > >  hw/riscv/shakti_c.c         | 8 ++++++++ 
 > >  include/hw/riscv/shakti_c.h | 2 ++ 
 > >  2 files changed, 10 insertions(+) 
 > > 
 > > diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c 
 > > index c8205d3f22..e207fa83dd 100644 
 > > --- a/hw/riscv/shakti_c.c 
 > > +++ b/hw/riscv/shakti_c.c 
 > > @@ -125,6 +125,13 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp) 
 > >          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE, 
 > >          SIFIVE_CLINT_TIMEBASE_FREQ, false); 
 > > 
 > > +    qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0)); 
 > > +    if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) { 
 > > +        return; 
 > > +    } 
 > > +    sysbus_mmio_map(SYS_BUS_DEVICE(&sss->uart), 0, 
 > > +                    shakti_c_memmap[SHAKTI_C_UART].base); 
 > > + 
 > >      /* ROM */ 
 > >      memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom", 
 > >                             shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal); 
 > > @@ -143,6 +150,7 @@ static void shakti_c_soc_instance_init(Object *obj) 
 > >      ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(obj); 
 > > 
 > >      object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY); 
 > > +    object_initialize_child(obj, "uart", &sss->uart, TYPE_SHAKTI_UART); 
 > > 
 > >      /* 
 > >       * CPU type is fixed and we are not supporting passing from commandline yet. 
 > > diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h 
 > > index 8ffc2b0213..50a2b79086 100644 
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
 > 

