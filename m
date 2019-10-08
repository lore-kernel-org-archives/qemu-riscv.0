Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHvql-0003st-E0
	for mharc-qemu-riscv@gnu.org; Tue, 08 Oct 2019 16:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59465)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iHvqf-0003j9-Mh
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 16:12:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iHvqd-0002WN-VU
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 16:12:45 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41784)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iHvqa-0002GK-4t
 for qemu-riscv@nongnu.org; Tue, 08 Oct 2019 16:12:42 -0400
Received: by mail-pg1-f194.google.com with SMTP id t3so5055040pga.8
 for <qemu-riscv@nongnu.org>; Tue, 08 Oct 2019 13:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aIuobeVD6KXRsEP141R/z6/YzVpEt09yHG4/Wz5AGcQ=;
 b=iFO6gELIhaAzpRyxGFAPpBR6SmE+JwcEi21QmlTJa6Q4WmV4vGI8zBg2ngbTfTwsOm
 VmdvxgbDCSdPmJkT7aobSWgsepHl8HkJpS6PtNZUFRg9sxzQyevGGEXKHZNqj7UB72kJ
 sOL2kVl4EJqZpaPBnyfjTrRM/WDYLS3OlhiGtVi+TcMlMQEtTPiRDW6RSRq4lO0CoNjr
 2zp71yrffke4N5COuua8UghocmBcol+Sma5U2uFvE2g7RrX7aVQLxBN3udn2VLROju7V
 1fg9BXp7nPhX+icpozljHTBOHHrCqvy+8JAe5mhbN/g+0mlwxIBhzgpGvsCgVBwPwzQK
 aXkA==
X-Gm-Message-State: APjAAAWZCMwpFFcj/+ze6vBXwntPYABlm2xTjMMUReqrL1B0aFJU1kZ+
 WVXH538lfg+xQsctA/g8govYyg==
X-Google-Smtp-Source: APXvYqxmns/HF6A0xe+jK0Hl4FsdZNvR8psSxWDNcW5zf4ott+2z9QFpzCiZsqSVjvcJSrq9UCUGXA==
X-Received: by 2002:a17:90a:9ab:: with SMTP id 40mr8035714pjo.38.1570565531746; 
 Tue, 08 Oct 2019 13:12:11 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f15sm17197737pfd.141.2019.10.08.13.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 13:12:11 -0700 (PDT)
Date: Tue, 08 Oct 2019 13:12:11 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Oct 2019 13:05:01 PDT (-0700)
Subject: Re: [PATCH v2 4/7] riscv/sifive_u: Add the start-in-flash property
In-Reply-To: <a24af06cea57073f4a75381755ab05e825679445.1569545046.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-695a9235-b999-4aad-a3c1-0a2cdd0a5cdb@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.194
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
X-List-Received-Date: Tue, 08 Oct 2019 20:12:49 -0000

On Thu, 26 Sep 2019 17:44:28 PDT (-0700), Alistair Francis wrote:
> Add a property that when set to true QEMU will jump from the ROM code to
> the start of flash memory instead of DRAM which is the default
> behaviour.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_u.c         | 27 +++++++++++++++++++++++++++
>  include/hw/riscv/sifive_u.h |  2 ++
>  2 files changed, 29 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index f5741e9a38..33b55d0d5b 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -373,6 +373,10 @@ static void riscv_sifive_u_init(MachineState *machine)
>                                         /* dtb: */
>      };
>
> +    if (s->start_in_flash) {
> +        reset_vec[6] = memmap[SIFIVE_U_FLASH0].base; /* start: .dword FLASH0_BASE */
> +    }
> +
>      /* copy in the reset vector in little_endian byte order */
>      for (i = 0; i < sizeof(reset_vec) >> 2; i++) {
>          reset_vec[i] = cpu_to_le32(reset_vec[i]);
> @@ -432,8 +436,31 @@ static void riscv_sifive_u_soc_init(Object *obj)
>                            TYPE_CADENCE_GEM);
>  }
>
> +static bool virt_get_start_in_flash(Object *obj, Error **errp)
> +{
> +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> +
> +    return s->start_in_flash;
> +}
> +
> +static void virt_set_start_in_flash(Object *obj, bool value, Error **errp)
> +{
> +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> +
> +    s->start_in_flash = value;
> +}
> +
>  static void riscv_sifive_u_machine_instance_init(Object *obj)
>  {
> +    SiFiveUState *s = RISCV_U_MACHINE(obj);
> +
> +    s->start_in_flash = false;
> +    object_property_add_bool(obj, "start-in-flash", virt_get_start_in_flash,
> +                             virt_set_start_in_flash, NULL);
> +    object_property_set_description(obj, "start-in-flash",
> +                                    "Set on to tell QEMU's ROM to jump to " \
> +                                    "flash. Otherwise QEMU will jump to DRAM",
> +                                    NULL);
>  }
>
>  static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index a921079fbe..2656b43c58 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -57,6 +57,8 @@ typedef struct SiFiveUState {
>
>      void *fdt;
>      int fdt_size;
> +
> +    bool start_in_flash;
>  } SiFiveUState;
>
>  enum {

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

