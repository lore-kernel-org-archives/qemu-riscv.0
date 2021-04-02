Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lSJWH-0006Yy-WC
	for mharc-qemu-riscv@gnu.org; Fri, 02 Apr 2021 09:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lSJWF-0006VI-KF; Fri, 02 Apr 2021 09:07:23 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:34806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lSJWC-0006gQ-9O; Fri, 02 Apr 2021 09:07:23 -0400
Received: by mail-io1-xd29.google.com with SMTP id x16so5336926iob.1;
 Fri, 02 Apr 2021 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=16yJhlFJ37AtBD6+05BKbsqBPu1GdmOLS8mynxGbx24=;
 b=WqltpAHEraGyV1ieTDdzFAxVyK/khHVA8aEKuPkJ0NQQ5cH3Oy8OjukdlTyF2TqOgE
 P0E4kfiLCaRISeuh2HBcmS1w1e2Id/rpx3qd+CqiP5vCI0MCPXOQ8s2C3aeYRA860vzR
 hdEEUMiHnb62j6EFEjhe8RTkh+emfXADOWJoQDrIJqayMJLjiXues8lkN6zFpDbI4za7
 MnZPQpar13zDJKkv+zYib+GKGaOb24yE1GwjZAwpQoDQI/8rGSH1vClDbiuSQQvVVniG
 5gubJsplD61TvvDR+XmetyktUd5oZ/cs2zLkkrJVDXizlwEweJHpD4LDdd50Y1z/UK2S
 kqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=16yJhlFJ37AtBD6+05BKbsqBPu1GdmOLS8mynxGbx24=;
 b=sUoHRJxhQAqzC0FnyUtV4c5YIR1hTN8xLrft+N/3atscP8OUuNs8lbA05XoXJwrinM
 FoEoabxAoCx7EUNbXOzhBhLvOp3WdT3EfBgr9qTM9hQJrMboWA7+n2vDwsaymyIYMnCj
 zifSk21X7ljtrpmHQ3bh42PxEJknaDXp12eaM+o/HMEIcM6WUNUKgQPlzmudeJhzFRUD
 1fJjQec1I2phcTERRzgUTDAmMQXmGIlX79a7d+qecux0kGhL6A63z3vvPcUqV5JoP/KL
 iaYhoYwyafonOMekejz4C3YC/xymNx1upxLxz8o7Oa8eXzb3cTMv775TRMt4Rq7KH0mW
 mnmg==
X-Gm-Message-State: AOAM532M7w/gJbRF2flLoK4ZVCvezu2Z/31NytDYeGIRjtyirktmKg6b
 /fDcDyz4uLdK4BMPRfwF2b6+AtJOUdWx7Lu3YyQ=
X-Google-Smtp-Source: ABdhPJz3x/G/k6uNQWgCDrfdtyEPUuERXeCmgmFt2FVAKAszm4/rQ/LbOuSLP4QFA5Ja877zcgWCIuKwQXXXrQ5nkOQ=
X-Received: by 2002:a05:6638:224e:: with SMTP id
 m14mr13203781jas.8.1617368838877; 
 Fri, 02 Apr 2021 06:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210401181457.73039-1-vijai@behindbytes.com>
 <20210401181457.73039-5-vijai@behindbytes.com>
In-Reply-To: <20210401181457.73039-5-vijai@behindbytes.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Apr 2021 09:05:04 -0400
Message-ID: <CAKmqyKPCbBznWkOeREnb-r7gHbzhvvjBXafNYkBT1u52+9z7hQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] hw/riscv: Connect Shakti UART to Shakti platform
To: Vijai Kumar K <vijai@behindbytes.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 02 Apr 2021 13:07:23 -0000

On Thu, Apr 1, 2021 at 2:15 PM Vijai Kumar K <vijai@behindbytes.com> wrote:
>
> Connect one shakti uart to the shakti_c machine.
>
> Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>

In future can you please keep the Reviewed by tags when sending a new
version of the patch series?

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/shakti_c.c         | 8 ++++++++
>  include/hw/riscv/shakti_c.h | 2 ++
>  2 files changed, 10 insertions(+)
>
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index c8205d3f22..e207fa83dd 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -125,6 +125,13 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
>          SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
>          SIFIVE_CLINT_TIMEBASE_FREQ, false);
>
> +    qdev_prop_set_chr(DEVICE(&(sss->uart)), "chardev", serial_hd(0));
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&sss->uart), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&sss->uart), 0,
> +                    shakti_c_memmap[SHAKTI_C_UART].base);
> +
>      /* ROM */
>      memory_region_init_rom(&sss->rom, OBJECT(dev), "riscv.shakti.c.rom",
>                             shakti_c_memmap[SHAKTI_C_ROM].size, &error_fatal);
> @@ -143,6 +150,7 @@ static void shakti_c_soc_instance_init(Object *obj)
>      ShaktiCSoCState *sss = RISCV_SHAKTI_SOC(obj);
>
>      object_initialize_child(obj, "cpus", &sss->cpus, TYPE_RISCV_HART_ARRAY);
> +    object_initialize_child(obj, "uart", &sss->uart, TYPE_SHAKTI_UART);
>
>      /*
>       * CPU type is fixed and we are not supporting passing from commandline yet.
> diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
> index 8ffc2b0213..50a2b79086 100644
> --- a/include/hw/riscv/shakti_c.h
> +++ b/include/hw/riscv/shakti_c.h
> @@ -21,6 +21,7 @@
>
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/boards.h"
> +#include "hw/char/shakti_uart.h"
>
>  #define TYPE_RISCV_SHAKTI_SOC "riscv.shakti.cclass.soc"
>  #define RISCV_SHAKTI_SOC(obj) \
> @@ -33,6 +34,7 @@ typedef struct ShaktiCSoCState {
>      /*< public >*/
>      RISCVHartArrayState cpus;
>      DeviceState *plic;
> +    ShaktiUartState uart;
>      MemoryRegion rom;
>
>  } ShaktiCSoCState;
> --
> 2.25.1
>
>

