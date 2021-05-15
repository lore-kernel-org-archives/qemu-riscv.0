Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1li05l-0002hx-QG
	for mharc-qemu-riscv@gnu.org; Sat, 15 May 2021 15:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li05f-0002bn-Os; Sat, 15 May 2021 15:36:47 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:22144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li05d-0005ip-Si; Sat, 15 May 2021 15:36:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2008374570E;
 Sat, 15 May 2021 21:36:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id ECAB8745709; Sat, 15 May 2021 21:36:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EB53E745708;
 Sat, 15 May 2021 21:36:42 +0200 (CEST)
Date: Sat, 15 May 2021 21:36:42 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 11/12] hw/isa/vt82c686: Add missing Kconfig dependency
 (runtime error)
In-Reply-To: <20210515173716.358295-12-philmd@redhat.com>
Message-ID: <1bb490db-9635-305f-ff8b-34dd7a524cb9@eik.bme.hu>
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-12-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-273187842-1621107402=:7809"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 15 May 2021 19:36:52 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-273187842-1621107402=:7809
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> When building the Pegasos2 machine stand-alone we get:
>
>  $ qemu-system-ppc -M pegasos2 -bios pegasos2.rom
>  ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)
>  Bail out! ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)
>
> Looking at the backtrace:
>
>  Thread 1 "qemu-system-ppc" received signal SIGABRT, Aborted.
>  (gdb) bt
>  #0  0x00007ffff53877d5 in raise () at /lib64/libc.so.6
>  #1  0x00007ffff5370895 in abort () at /lib64/libc.so.6
>  #2  0x00007ffff6dc4b6c in g_assertion_message_expr.cold () at /lib64/libglib-2.0.so.0
>  #3  0x00007ffff6e229ff in g_assertion_message_expr () at /lib64/libglib-2.0.so.0
>  #4  0x0000555555a0c8f4 in object_new_with_type (type=0x0) at qom/object.c:714
>  #5  0x0000555555a0c9d5 in object_new (typename=0x555555c7afe4 "isa-pit") at qom/object.c:747
>  #6  0x0000555555a053b8 in qdev_new (name=0x555555c7afe4 "isa-pit") at hw/core/qdev.c:153
>  #7  0x00005555557cdd05 in isa_new (name=0x555555c7afe4 "isa-pit") at hw/isa/isa-bus.c:160
>  #8  0x00005555557cf518 in i8254_pit_init (bus=0x55555603d140, base=64, isa_irq=0, alt_irq=0x0) at include/hw/timer/i8254.h:54
>  #9  0x00005555557d12f9 in vt8231_realize (d=0x5555563d9770, errp=0x7fffffffcc28) at hw/isa/vt82c686.c:704
>  #10 0x00005555557e1340 in pci_qdev_realize (qdev=0x5555563d9770, errp=0x7fffffffcca0) at hw/pci/pci.c:2116
>  #11 0x0000555555a06a84 in device_set_realized (obj=0x5555563d9770, value=true, errp=0x7fffffffcda8) at hw/core/qdev.c:761
>  #12 0x0000555555a0ff9e in property_set_bool (obj=0x5555563d9770, v=0x5555563da090, name=0x555555cd7881 "realized", opaque=0x5555560acf80, errp=0x7fffffffcda8) at qom/object.c:2257
>  #13 0x0000555555a0e098 in object_property_set (obj=0x5555563d9770, name=0x555555cd7881 "realized", v=0x5555563da090, errp=0x555555fc3fa0 <error_fatal>) at qom/object.c:1402
>  #14 0x0000555555a12271 in object_property_set_qobject (obj=0x5555563d9770, name=0x555555cd7881 "realized", value=0x5555563cf0a0, errp=0x555555fc3fa0 <error_fatal>) at qom/qom-qobject.c:28
>  #15 0x0000555555a0e3fb in object_property_set_bool (obj=0x5555563d9770, name=0x555555cd7881 "realized", value=true, errp=0x555555fc3fa0 <error_fatal>) at qom/object.c:1472
>  #16 0x0000555555a05b15 in qdev_realize (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/core/qdev.c:389
>  #17 0x0000555555a05b42 in qdev_realize_and_unref (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/core/qdev.c:396
>  #18 0x00005555557e160f in pci_realize_and_unref (dev=0x5555563d9770, bus=0x5555563d32b0, errp=0x555555fc3fa0 <error_fatal>) at hw/pci/pci.c:2181
>  #19 0x00005555557e165b in pci_create_simple_multifunction (bus=0x5555563d32b0, devfn=96, multifunction=true, name=0x555555c9b63b "vt8231-isa") at hw/pci/pci.c:2189
>  #20 0x0000555555867730 in pegasos2_init (machine=0x5555560427a0) at hw/ppc/pegasos2.c:105
>
> The "isa-pit" type (TYPE_I8254) is missing. Add it.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/isa/Kconfig | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
> index 0703512209a..9822a90ce95 100644
> --- a/hw/isa/Kconfig
> +++ b/hw/isa/Kconfig
> @@ -49,6 +49,7 @@ config VT82C686
>     select FDC
>     select USB_UHCI
>     select APM
> +    select I8254
>     select I8257
>     select I8259
>     select MC146818RTC
>
--3866299591-273187842-1621107402=:7809--

