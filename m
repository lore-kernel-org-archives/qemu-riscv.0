Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j9d0N-0002vv-3G
	for mharc-qemu-riscv@gnu.org; Wed, 04 Mar 2020 18:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1j9d0J-0002vN-Si
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 18:00:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1j9d0I-0000SY-CM
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 18:00:39 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:42185)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1j9d0H-0000S7-Qw
 for qemu-riscv@nongnu.org; Wed, 04 Mar 2020 18:00:38 -0500
Received: by mail-pl1-x641.google.com with SMTP id u3so1711464plr.9
 for <qemu-riscv@nongnu.org>; Wed, 04 Mar 2020 15:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=A+8YyLnxsylnT/bWU3JoXEptrIiLtpYK4ca11ZtIoAs=;
 b=NTPJHBv7LkdVcUWy2EkjCDrONjt7gDGWd/PifAFSwwXzPJKFRXZZImih4SbsidHCp0
 ldMlnwzALdXXC61B/2SH9tF7WvOayz0FUkCTzfYinYYW9O+eRyynwFL5VmiT96voSweM
 77bqHAkkWibQJGnDGTj2YWienbf3Ba3uAdHUF84SiU8YvNIdX+K3O5SckGjQXJMT7H5L
 U9mCM020A/hALwHxv2Jr29ldwQqBS0kYci+JZPTJF6g5LLeoU+BJBFXsINUOYzMxCcE6
 eXolXU/tuR1UrVloSlOQPGEmaAaOucoKPKThSJ5UE8gJVXGZYuBh1o7wUyDFGnvA8AfN
 VajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=A+8YyLnxsylnT/bWU3JoXEptrIiLtpYK4ca11ZtIoAs=;
 b=Q+7Cnvqfp11iqU/F7sAPKmROPSN77GoHlG/bgxswMdgrdfGfgEtst8sp/IATy8lPxc
 /55CIdEYbT9AjItDJ9iCxHduLtrRC3Im6K7SQbCHvueMRzS3nY6079FolN5GXti3Bg2f
 97eKP73uE65uj6LVe3/YbQXCdxMbpQdpe/i6sjyd9XHt072vDSnbZgc/b29d8rF5LbCf
 50PpQve6lPxyUYXoHGk/d9WacWkNdQrNMWK8P/pY11vfjOPT90UHVb1f6S01MNM1749C
 CHnhP28XQhp6tNP7LoCRzn2MwxAacl+CTSb4NkA+/byvZ4SWwD3eVTWbd4udUZExCWCG
 d9yg==
X-Gm-Message-State: ANhLgQ1oh/BIpxF7BPH+8BmA4SR/aBUuFhj1j5IQCeNXx/MGdFRo4TaI
 1rqoFX0l8/ZUFfBKf4zZVnUBiw==
X-Google-Smtp-Source: ADFU+vvrG1qKiFIdxgmRRB+pjG2jOxtVpzaUwBiKVUq8u3S44i7fJ2gWwm4wtYnqkLQDQwe1/O6avQ==
X-Received: by 2002:a17:902:ab81:: with SMTP id f1mr5251896plr.5.1583362836166; 
 Wed, 04 Mar 2020 15:00:36 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id k5sm14229898pfp.66.2020.03.04.15.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 15:00:35 -0800 (PST)
Date: Wed, 04 Mar 2020 15:00:35 -0800 (PST)
X-Google-Original-Date: Wed, 04 Mar 2020 15:00:20 PST (-0800)
Subject: Re: [PATCH v2] riscv: sifive_u: Add a "serial" property for board
 serial number
In-Reply-To: <1581861317-30977-1-git-send-email-bmeng.cn@gmail.com>
CC: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, sagark@eecs.berkeley.edu,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-fb3ea639-87e6-406b-a679-a568f6d7edf9@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Wed, 04 Mar 2020 23:00:41 -0000

On Sun, 16 Feb 2020 05:55:17 PST (-0800), bmeng.cn@gmail.com wrote:
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
>
> ---
>
> Changes in v2:
> - Move setting OTP serial number property from riscv_sifive_u_soc_init()
>   to riscv_sifive_u_soc_realize(), to fix the 'check-qtest-riscv' error.
>   I am not really sure why doing so could fix the 'make check' error.
>   The v1 patch worked fine and nothing seems wrong.
>
>  hw/riscv/sifive_u.c         | 21 ++++++++++++++++++++-
>  include/hw/riscv/sifive_u.h |  1 +
>  2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 0e12b3c..ca561d3 100644
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
> @@ -434,7 +435,6 @@ static void riscv_sifive_u_soc_init(Object *obj)
>                            TYPE_SIFIVE_U_PRCI);
>      sysbus_init_child_obj(obj, "otp", &s->otp, sizeof(s->otp),
>                            TYPE_SIFIVE_U_OTP);
> -    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", OTP_SERIAL);
>      sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
>                            TYPE_CADENCE_GEM);
>  }
> @@ -453,6 +453,18 @@ static void sifive_u_set_start_in_flash(Object *obj, bool value, Error **errp)
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
> @@ -464,11 +476,17 @@ static void riscv_sifive_u_machine_instance_init(Object *obj)
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
>  {
>      MachineState *ms = MACHINE(qdev_get_machine());
> +    SiFiveUState *us = RISCV_U_MACHINE(ms);
>      SiFiveUSoCState *s = RISCV_U_SOC(dev);
>      const struct MemmapEntry *memmap = sifive_u_memmap;
>      MemoryRegion *system_memory = get_system_memory();
> @@ -554,6 +572,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      object_property_set_bool(OBJECT(&s->prci), true, "realized", &err);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->prci), 0, memmap[SIFIVE_U_PRCI].base);
>
> +    qdev_prop_set_uint32(DEVICE(&s->otp), "serial", us->serial);
>      object_property_set_bool(OBJECT(&s->otp), true, "realized", &err);
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->otp), 0, memmap[SIFIVE_U_OTP].base);
>
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

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks.  This is in the queue for the soft freeze.

