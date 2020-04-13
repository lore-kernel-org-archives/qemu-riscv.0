Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jO6Dj-0002ab-Qv
	for mharc-qemu-riscv@gnu.org; Mon, 13 Apr 2020 17:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jO6Dh-0002Xe-1G
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 17:02:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jO6Df-0005Tx-Nd
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 17:02:16 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42585)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jO6Dd-0005Sl-3c; Mon, 13 Apr 2020 17:02:13 -0400
Received: by mail-ed1-x544.google.com with SMTP id s10so5789872edy.9;
 Mon, 13 Apr 2020 14:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s2UGnlYUIEu4wY/N07cBtoh8iurspPtqjLWiG88cOaU=;
 b=WTki7mfHovlfUbdyt9/3OQuJfvsVdvY9OI9o9RlNPT3pXKEj0YvGphKnJ4uPvrX5sJ
 pFWf455EaNQwM0LZgfcejCSqod2wTtzPzkHaYhQBg3eB2ueKK7wZToArpcKHELAVpJxV
 WwGLVsCgH+4lWVcOeKbK9NpBg1wFwQjb8JSMgSt0a/Fzzt/WtJ6hEzuOcqsB9ILFmxx4
 uwDgenUUgKRVaPgl1RPPXE0cB19QRvpM+wYeAoV9XrtbzWiyqUx/dUOfoohlUKzqSJKT
 SzWNlq4GNE6knxRNTXpbxrPGLJohLVvkyWbFHZzf6gao6sPmwe9cnLtXgUheFYnMRY5P
 jIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=s2UGnlYUIEu4wY/N07cBtoh8iurspPtqjLWiG88cOaU=;
 b=b7B+ft44gjlToq+jj5Gu9tBcKOEpqJjVhUkOkSZZgln3BREVDnyfNr/qZ7NhJ/7k/i
 qUI7g2NvfFnIZDJj9q/1ly2RuGNLVMk/UAK5wEnjutc7uy4e8j1ypx5F6Gx3NqTy91VW
 Sz00SDCNM294QiDDz4lbxFbOiamXxisy03gBvrCsVa96HLyoiTgaLN8W6kRvDdDuEzR0
 vBHeran0YDW39Z6uEF25P9xJNxcYOCyhPmMPitjR61pOqWXoAi3fS0PKXITjX66j9oHl
 ThPFMWdtaT2kR/xd4tkAJIgpQBpl4viK4aD/99elJBmsCJZS1OClq9IkVjROgmU5pyw9
 yhpg==
X-Gm-Message-State: AGi0PuZcws8JNyV51HUJWAPCiavd/Ybt4FEuBziOMKoYscWER1vTuTlR
 qJtW+Hn1EyeusNfZNhm/Kgs=
X-Google-Smtp-Source: APiQypL4ePuSsMcFSGqgCdNDG72GsYmzkPQOHce5epcoEjH/NAGyO5XVPxGTdBafXGkv0goULa6ybQ==
X-Received: by 2002:a17:906:459:: with SMTP id
 e25mr5749546eja.379.1586811731734; 
 Mon, 13 Apr 2020 14:02:11 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id rk25sm1660893ejb.14.2020.04.13.14.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 14:02:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH-for-5.1 v3 03/24] hw/arm/allwinner-a10: Move some code
 from realize() to init()
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-ppc@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Markus Armbruster <armbru@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Xie Changlong <xiechanglong.d@gmail.com>, Fam Zheng <fam@euphon.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Kevin Wolf
 <kwolf@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>, Peter Chubb <peter.chubb@nicta.com.au>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <effeb6fb-57b6-3b5c-f9b3-c7d2f7541532@amsat.org>
Date: Mon, 13 Apr 2020 23:02:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200412223619.11284-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::544
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
X-List-Received-Date: Mon, 13 Apr 2020 21:02:18 -0000

On 4/13/20 12:35 AM, Philippe Mathieu-Daudé wrote:
> Coccinelle reported:
> 
>   $ spatch ... --timeout 60 --sp-file \
>     scripts/coccinelle/simplify-init-realize-error_propagate.cocci
>   HANDLING: ./hw/arm/allwinner-a10.c
>   >>> possible moves from aw_a10_init() to aw_a10_realize() in ./hw/arm/allwinner-a10.c:77
> 
> Move the calls using &error_fatal which don't depend on input
> updated before realize() to init().
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v3: Typo 'depend of' -> 'depend on' (eblake)
> ---
>  hw/arm/allwinner-a10.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 62a67a3e1a..f41395734a 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -60,10 +60,18 @@ static void aw_a10_init(Object *obj)
>          int i;
>  
>          for (i = 0; i < AW_A10_NUM_USB; i++) {
> +            char bus[16];
> +
>              sysbus_init_child_obj(obj, "ehci[*]", OBJECT(&s->ehci[i]),
>                                    sizeof(s->ehci[i]), TYPE_PLATFORM_EHCI);
>              sysbus_init_child_obj(obj, "ohci[*]", OBJECT(&s->ohci[i]),
>                                    sizeof(s->ohci[i]), TYPE_SYSBUS_OHCI);
> +            object_property_set_bool(OBJECT(&s->ehci[i]), true,
> +                                     "companion-enable", &error_fatal);
> +
> +            sprintf(bus, "usb-bus.%d", i);
> +            object_property_set_str(OBJECT(&s->ohci[i]), bus, "masterbus",
> +                                    &error_fatal);
>          }
>      }
>  
> @@ -72,6 +80,11 @@ static void aw_a10_init(Object *obj)
>  
>      sysbus_init_child_obj(obj, "rtc", &s->rtc, sizeof(s->rtc),
>                            TYPE_AW_RTC_SUN4I);
> +
> +    memory_region_init_ram(&s->sram_a, obj, "sram A", 48 * KiB,
> +                           &error_fatal);
> +    memory_region_add_subregion(get_system_memory(), 0x00000000, &s->sram_a);

Unfortunately this makes qtest/device-introspect-test fail:

(qemu) device_add allwinner-a10,help
(qemu) device_add allwinner-a10,help
RAMBlock "sram A" already registered, abort!
Aborted (core dumped)

(gdb) bt
#1  0x00007ffff5089895 in abort () at /lib64/libc.so.6
#2  0x0000555557324445 in qemu_ram_set_idstr (new_block=0x614000026a40,
name=0x602000231a50 "sram A", dev=0x633000038800) at exec.c:2023
#3  0x00005555595ed050 in vmstate_register_ram (mr=0x633000049610,
dev=0x633000038800) at migration/savevm.c:2921
#4  0x0000555557569a85 in memory_region_init_ram (mr=0x633000049610,
owner=0x633000038800, name=0x55555a4da6a0 <str> "sram A", size=49152,
errp=0x55555c908d00 <error_fatal>)
    at memory.c:3170
#5  0x0000555557b7cadf in aw_a10_init (obj=0x633000038800) at
hw/arm/allwinner-a10.c:84
#6  0x00005555599b0c09 in object_init_with_type (obj=0x633000038800,
ti=0x61300001da80) at qom/object.c:376
#7  0x0000555559994350 in object_initialize_with_type
(data=0x633000038800, size=97024, type=0x61300001da80) at qom/object.c:516
#8  0x0000555559996756 in object_new_with_type (type=0x61300001da80) at
qom/object.c:684
#9  0x0000555559996832 in object_new (typename=0x60200022e8b0
"allwinner-a10") at qom/object.c:699
#10 0x000055555979e809 in qmp_device_list_properties
(typename=0x60200022e8b0 "allwinner-a10", errp=0x7fffffffafc0) at
qom/qom-qmp-cmds.c:153
#11 0x00005555582b68cd in qdev_device_help (opts=0x607000120130) at
qdev-monitor.c:282


> +    create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
>  }
>  
>  static void aw_a10_realize(DeviceState *dev, Error **errp)
> @@ -113,11 +126,6 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(sysbusdev, 4, qdev_get_gpio_in(dev, 67));
>      sysbus_connect_irq(sysbusdev, 5, qdev_get_gpio_in(dev, 68));
>  
> -    memory_region_init_ram(&s->sram_a, OBJECT(dev), "sram A", 48 * KiB,
> -                           &error_fatal);
> -    memory_region_add_subregion(get_system_memory(), 0x00000000, &s->sram_a);
> -    create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
> -
>      /* FIXME use qdev NIC properties instead of nd_table[] */
>      if (nd_table[0].used) {
>          qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
> @@ -149,12 +157,6 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
>          int i;
>  
>          for (i = 0; i < AW_A10_NUM_USB; i++) {
> -            char bus[16];
> -
> -            sprintf(bus, "usb-bus.%d", i);
> -
> -            object_property_set_bool(OBJECT(&s->ehci[i]), true,
> -                                     "companion-enable", &error_fatal);
>              object_property_set_bool(OBJECT(&s->ehci[i]), true, "realized",
>                                       &error_fatal);
>              sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
> @@ -162,8 +164,6 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
>              sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
>                                 qdev_get_gpio_in(dev, 39 + i));
>  
> -            object_property_set_str(OBJECT(&s->ohci[i]), bus, "masterbus",
> -                                    &error_fatal);
>              object_property_set_bool(OBJECT(&s->ohci[i]), true, "realized",
>                                       &error_fatal);
>              sysbus_mmio_map(SYS_BUS_DEVICE(&s->ohci[i]), 0,
> 

