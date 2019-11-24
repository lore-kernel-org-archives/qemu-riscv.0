Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iYmR4-0001HB-Mt
	for mharc-qemu-riscv@gnu.org; Sun, 24 Nov 2019 02:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iYmR2-0001EU-U1
 for qemu-riscv@nongnu.org; Sun, 24 Nov 2019 02:35:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iYmR1-0007VP-Io
 for qemu-riscv@nongnu.org; Sun, 24 Nov 2019 02:35:56 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:38224)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iYmQy-0007U0-Vk; Sun, 24 Nov 2019 02:35:53 -0500
Received: by mail-lf1-x144.google.com with SMTP id q28so8555662lfa.5;
 Sat, 23 Nov 2019 23:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2NIWd2V+BoD2R7kVAtzNAq+nRRdu513tjVeVMOAHXJU=;
 b=G51FSc4lBRwBNetv4D6c6IaL/4JRqU4NJ9UGrkbCbNREv/qk3ia0Zq5tZCLetjz8xP
 Xsb0NkatlJghcZ7en0DAmKHf2oN8tF/7fM6tADOY/PZiwaW2xmjAYn+UAHdlIXCIazzO
 gvyeVSpmfA6n2PJNluRI/1QFxca9ztgK8IIU0YFe+aZnWETT5AwhIjQzd/eovnB5elqL
 4oSCacB0VTwddUQAXQJydFITwshDX+g2jcLcy5q4vJpyozcVblDmIaaMD6k8H9NnMqdc
 cJ+BJYalDe7pltnBM8cPVD8eAFnJbM9X1WPbnkjPaKEjKIse/LhVYlknfefHI2okGMIq
 lC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2NIWd2V+BoD2R7kVAtzNAq+nRRdu513tjVeVMOAHXJU=;
 b=CPlpL00VgI5jRIBDyjsd0PjqR8CtgwbJWanG4trecqtrGBaUyQJ7e+0/QYKlksxFPM
 F2pn2m/z9IwqHkFD2JAGvksgANSsy/dUuIdZL20FOxK8GjEftFr6tTmXj9xh2tmh1/bW
 xgk36ybgX/BIaBR4PUy+7xN9iPPmEdUrlsAmqHjCcxVL09rkb0hFNAX/PkOmiVx8vfis
 E/rKzfh6s5sq7LH5NXgGIDjzt+YBUfiSluWTYgRIve8Ep9WV1CPHSsgkp7u/uT1ZsT4q
 wbhApqrDorS4PAZ73Y8rxNV+ITEKrpzpdtH+EnLaVVC4Ta21rEghhHQYXz01GjAMXuWv
 4RZw==
X-Gm-Message-State: APjAAAWoHneHWKVJGzUAKwqAs1ZGeqFNJDuSYSehOMx4URDqohYqHot2
 KZHJOI6JGbMA/HejbwwJjTL8jXmpWwIbHwsOGPE=
X-Google-Smtp-Source: APXvYqzhGqhJkwqgMn8peCcLIBZHOoi0BZHLTY4M10qRMG2qiFYvNmXRWu8kmBi0yyrl9zIcEypruvqOciNvLUL50T4=
X-Received: by 2002:a05:6512:4c1:: with SMTP id
 w1mr16857852lfq.141.1574580951491; 
 Sat, 23 Nov 2019 23:35:51 -0800 (PST)
MIME-Version: 1.0
References: <1573916930-19068-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1573916930-19068-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 23 Nov 2019 23:35:24 -0800
Message-ID: <CAKmqyKPtk6V+9Z9dgMSa_thgPCP_B6jQmQCoGAw1=BczfPyKVw@mail.gmail.com>
Subject: Re: [PATCH] riscv: sifive_u: Add a "serial" property for board serial
 number
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
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
X-List-Received-Date: Sun, 24 Nov 2019 07:35:58 -0000

On Sat, Nov 16, 2019 at 7:09 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> At present the board serial number is hard-coded to 1, and passed
> to OTP model during initialization. Firmware (FSBL, U-Boot) uses
> the serial number to generate a unique MAC address for the on-chip
> ethernet controller. When multiple QEMU 'sifive_u' instances are
> created and connected to the same subnet, they all have the same
> MAC address hence it creates a unusable network.
>
> A new "serial" property is introduced to specify the board serial
> number. When not given, the default serial number 1 is used.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c         | 21 ++++++++++++++++++++-
>  include/hw/riscv/sifive_u.h |  1 +
>  2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 9552abf..e1a5536 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -34,6 +34,7 @@
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> +#include "qapi/visitor.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "hw/sysbus.h"
> @@ -401,6 +402,7 @@ static void riscv_sifive_u_init(MachineState *machine)
>  static void riscv_sifive_u_soc_init(Object *obj)
>  {
>      MachineState *ms = MACHINE(qdev_get_machine());
> +    SiFiveUState *us = RISCV_U_MACHINE(ms);
>      SiFiveUSoCState *s = RISCV_U_SOC(obj);
>
>      object_initialize_child(obj, "e-cluster", &s->e_cluster,
> @@ -433,7 +435,7 @@ static void riscv_sifive_u_soc_init(Object *obj)
>                            TYPE_SIFIVE_U_PRCI);
>      sysbus_init_child_obj(obj, "otp", &s->otp, sizeof(s->otp),
>                            TYPE_SIFIVE_U_OTP);
> -    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", OTP_SERIAL);
> +    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", us->serial);
>      sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
>                            TYPE_CADENCE_GEM);
>  }
> @@ -452,6 +454,18 @@ static void sifive_u_set_start_in_flash(Object *obj, bool value, Error **errp)
>      s->start_in_flash = value;
>  }
>
> +static void sifive_u_get_serial(Object *obj, Visitor *v, const char *name,
> +                                void *opaque, Error **errp)
> +{
> +    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
> +}
> +
> +static void sifive_u_set_serial(Object *obj, Visitor *v, const char *name,
> +                                void *opaque, Error **errp)
> +{
> +    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
> +}
> +
>  static void riscv_sifive_u_machine_instance_init(Object *obj)
>  {
>      SiFiveUState *s = RISCV_U_MACHINE(obj);
> @@ -463,6 +477,11 @@ static void riscv_sifive_u_machine_instance_init(Object *obj)
>                                      "Set on to tell QEMU's ROM to jump to " \
>                                      "flash. Otherwise QEMU will jump to DRAM",
>                                      NULL);
> +
> +    s->serial = OTP_SERIAL;
> +    object_property_add(obj, "serial", "uint32", sifive_u_get_serial,
> +                        sifive_u_set_serial, NULL, &s->serial, NULL);
> +    object_property_set_description(obj, "serial", "Board serial number", NULL);
>  }
>
>  static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 82667b5..7cf742e 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -59,6 +59,7 @@ typedef struct SiFiveUState {
>      int fdt_size;
>
>      bool start_in_flash;
> +    uint32_t serial;
>  } SiFiveUState;
>
>  enum {
> --
> 2.7.4
>
>

