Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BC2C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 05:34:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4awy-0007Tl-BM; Thu, 01 Jun 2023 01:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4aww-0007G6-HH; Thu, 01 Jun 2023 01:34:14 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4awu-0004nO-R2; Thu, 01 Jun 2023 01:34:14 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-456cf200a0fso102577e0c.2; 
 Wed, 31 May 2023 22:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685597651; x=1688189651;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8yHtiNLb2bFk1IWmGgY4QLb2FmEHPL2LqT9nDnfXnrs=;
 b=EMad10ZopNDXUk1z261dV8hcJM+Adwg2lDzMcoQSiLcJCeB10Kgq51Ou7+TGA9oHp4
 QrT5UPX5WnyLmFvRBgXj9MQMuua26jaLMK35+1DKgR0/dzWECnh2Egix/usdnGfXmyeT
 BOqz8OpB6XjxDHk3YzLTI/OYklpWTykbFRzxIRt8C10T4/OVn0Tsxk/7eq4nPyK7nIU3
 InCfWyGCjVyPmf9QuC+T0WrtMaSJZfQXQ6aJ+wlTzBMYEK6d/gHqrRR9/EjcwsmtsSlV
 AJZIMrsPbtWsUOEsxWFlwbaLX7IRTf2bPb9wHDnheEExsDtWIQnjj1PusAwQZY2iZP5A
 2vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685597651; x=1688189651;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8yHtiNLb2bFk1IWmGgY4QLb2FmEHPL2LqT9nDnfXnrs=;
 b=aWW94+Wh/W0U3fR4Nf16c/a8cbZ3bosIpnrCqlZMoPN9Yg6qzmGbb2N384U2xdHXll
 MAngeMGGX0sasDsFHSQOdtaYdvP86ZPxpOgk8LcA/VIkgGM9Mqz8poLpLihJK2K9YAjz
 CP/IrAPY/j8CCP5c1p7KvbZu7w3Hqx6qCdrVBcJr9VJN8VnDUW2277BKRMjYk5uGLj/2
 W3rPp3EWFvqo7ZKJJ3CQCi9qi5+x3APZKnqCYq8jb+R1cVYWeSE5rbWbg1lHa/+WG+tk
 iFfLliK0nS1mL/NcB+qzhAgmjlmB9/X0aEqUUWP+OiJsMkqzQTf4ErrcE0SI6DRsu8ou
 bXOA==
X-Gm-Message-State: AC+VfDyIoZjQroTeIh4CrKNIK1oqgCXM3gBlDPCYT63GwM6y8Hncjy1z
 fZ+9wKg/K8uaXroR3mAkqwBTuIU8j5eRqXwizbU=
X-Google-Smtp-Source: ACHHUZ6S6qq3x7SPCc9PLN+K4fzi8zp5fYrCD2XNoXW5dMcCYhSSefH8UNJL7JwJFslrS85Kj5/gCMfVgSXc30mFKyw=
X-Received: by 2002:a1f:4390:0:b0:456:d02e:321a with SMTP id
 q138-20020a1f4390000000b00456d02e321amr675444vka.1.1685597651509; Wed, 31 May
 2023 22:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230601045910.18646-1-sunilvl@ventanamicro.com>
 <20230601045910.18646-3-sunilvl@ventanamicro.com>
In-Reply-To: <20230601045910.18646-3-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 1 Jun 2023 15:33:45 +1000
Message-ID: <CAKmqyKNKDhYhAmkdB5PkOAD-goANOka78XbnALktxbdPkqqHYg@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] riscv/virt: Support using pflash via -blockdev
 option
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jun 1, 2023 at 3:01=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.com>=
 wrote:
>
> Currently, pflash devices can be configured only via -pflash
> or -drive options. This is the legacy way and the
> better way is to use -blockdev as in other architectures.
> libvirt also has moved to use -blockdev method.
>
> To support -blockdev option, pflash devices need to be
> created in instance_init itself. So, update the code to
> move the virt_flash_create() to instance_init. Also, use
> standard interfaces to detect whether pflash0 is
> configured or not.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reported-by: Andrea Bolognani <abologna@redhat.com>
> Tested-by: Andrea Bolognani <abologna@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 3e5dc649c3..76c7a3ba3b 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1246,6 +1246,7 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
>      const char *firmware_name =3D riscv_default_firmware_name(&s->soc[0]=
);
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry =3D 0;
> +    BlockBackend *pflash_blk0;
>
>      /*
>       * Only direct boot kernel is currently supported for KVM VM,
> @@ -1266,7 +1267,8 @@ static void virt_machine_done(Notifier *notifier, v=
oid *data)
>      firmware_end_addr =3D riscv_find_and_load_firmware(machine, firmware=
_name,
>                                                       start_addr, NULL);
>
> -    if (drive_get(IF_PFLASH, 0, 0)) {
> +    pflash_blk0 =3D pflash_cfi01_get_blk(s->flash[0]);
> +    if (pflash_blk0) {
>          if (machine->firmware && !strcmp(machine->firmware, "none") &&
>              !kvm_enabled()) {
>              /*
> @@ -1499,8 +1501,6 @@ static void virt_machine_init(MachineState *machine=
)
>      sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
>          qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
>
> -    virt_flash_create(s);
> -
>      for (i =3D 0; i < ARRAY_SIZE(s->flash); i++) {
>          /* Map legacy -drive if=3Dpflash to machine properties */
>          pflash_cfi01_legacy_drive(s->flash[i],
> @@ -1527,6 +1527,8 @@ static void virt_machine_instance_init(Object *obj)
>  {
>      RISCVVirtState *s =3D RISCV_VIRT_MACHINE(obj);
>
> +    virt_flash_create(s);
> +
>      s->oem_id =3D g_strndup(ACPI_BUILD_APPNAME6, 6);
>      s->oem_table_id =3D g_strndup(ACPI_BUILD_APPNAME8, 8);
>      s->acpi =3D ON_OFF_AUTO_AUTO;
> --
> 2.34.1
>
>

