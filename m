Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A81C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:33:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1welhY-0001yt-9A; Tue, 30 Jun 2026 23:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1welhW-0001yQ-61
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:33:26 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1welhT-0003RW-7P
 for qemu-riscv@nongnu.org; Tue, 30 Jun 2026 23:33:25 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-664d22d7337so272822d50.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 20:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782876796; cv=none;
 d=google.com; s=arc-20260327;
 b=BChqEj3yBzX+D664LqW3h26yFdhDEotND94qyTpfFSuauAKg3IN+xRCilUAqaXxgdC
 dj4GUevm+lp4SPrlQ92dDWqJiHAfG37dMQdN7DNV1lLKKAb1KdDkrO73ATOQYjUiEzhJ
 /WEtuHF6XMvWd1GGyCkWSwoM7ExIHvpPIfEw/jJ5z2NEwahH8xUQ55ljdnm6B1ZHAZ/S
 egZ8JAcHFc2XF5dCtjKapNgZ1W0uff8W6BIoCsCf13s5W7uhA4KycagF/5DLYRD2aQ75
 DL6xgazTkhCL6rUAv030fxxXbUyJNecWzupuRrLXNICyrsj6ux1oXor4gor6WFb5OEUl
 nf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+EvaKYc+18wzcN7rBEpFRmVKzhrR3e5zdkTpcoIlLJI=;
 fh=+MRjYBw/s97Gvf2oSbOYhIxej/YxexAjs2r7aIFUEZ8=;
 b=Bi+m5WBbFEZTaoGjioKZoG1om+PJgEwSmF+LZNSkUPA0Qjl+E1lanYI6MoJ3ElNUHv
 1Ht+J4YxCYMxJdSjMzSADvAbxYvfven3QBaFaLsKrLs5nZ9E5A1WzkwOp0WnhuxH23IT
 oPMeUUjS0D0iMfAYiNMRlCYfrhG1SKDXEkDsk9pNRdqiuFy7EY2YudywLI8R09oZRZsL
 fxmpadvlTXTiv4h075KPByWNEln/WPrWcuzmZdnTwa/Kho9rOhlqQPSc0ZyOQip36EEZ
 VlyBUsfa1P4CdTpehyxFPSA3Yb6lKONZY3zazv8MFyMVQ/wNtH5BBrMbGdINsFpKdv3l
 kF1g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1782876796; x=1783481596; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+EvaKYc+18wzcN7rBEpFRmVKzhrR3e5zdkTpcoIlLJI=;
 b=jws33jXZ273IFvYaqRFfOKdxpKLCPSOIz80NQ41/0OLgVijEfvR9NwcWe7N5aZIXJc
 2QL4uiUfA8tXOCP5KPSCc+DUe9yn84xzNPMSqZBpgDSv5rs00OnhPmshN2Aalaa2SYzX
 ZANbw6p9nhSR8AJ1XQYm9GXLMnCF+r97oKeIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782876796; x=1783481596;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+EvaKYc+18wzcN7rBEpFRmVKzhrR3e5zdkTpcoIlLJI=;
 b=smeeE9ywJL/NCjJOhuV0TYbG0wAgj72xNowdg1zfXzEpkqkHe8SJi0h84xn77uoDLb
 z7T54WcxnYLunJsBAop7qo17+/d8z/BccETWYXibSOIglIw17t5zPho6xtG7QiHb0OKa
 GxeNO3kutfR91l80LjlR66A6/4iAP2br8+LcRikFhZv16XHiM0pAZh9GTVOEasDKcQLS
 DS7d3sqDV4ZJc13n00dzbOuQFwXalzgXC/zyojZ2N1s8QHWv09ig1VJCtdc+PKxxZVEt
 OXvEx4rp/cujWXQPyexEHC7WVFPG1ac1uPXgUVMuc64RPdRK7e91eXAgk2JJTvOn32G8
 Zvag==
X-Forwarded-Encrypted: i=1;
 AHgh+RrJ0f90ANSGip744rW4xxt48t+6aTnsy+xhr/1Q7v6Otg+4JyHQihiUAwIpYYAq0ikHCzMpg0WayR6/@nongnu.org
X-Gm-Message-State: AOJu0YxemM32ZhNc7r2QKHXJAsjH/PW5DGUa2gLgsCRe76sT2FXZ0ued
 9B6lGZmKTWGktJkbjIhRkTb6LU3DP0GCqT9YrTTGEe21KsF1t3afLMu0T87pSucl/2Tux3p21sv
 Fy5zLp59CFb2C7+FKIuoEUBOG3CDIUiQ=
X-Gm-Gg: AfdE7cndXCcsGUi5lzusfThnyvTM59oyIWUuxto5vplZLzS/SkgObVlt/tjtGsLVGVU
 os/3tBxkAJUoEUkGRPxtJcfll7lijznPAUGe+/AfdT/Q2pAcfWJ8YC0KpPt3Nj6/fiWyzWOPckV
 3S6yEhUtaiktZY1kqdKBnadv94fuxnTijSyL4gm6C3ybqiWRqN+1guYqRU3WBVgWFnIXMBrnBdo
 2Hf/ELtAW2/r1YPSNcWKNulLKnL/0DpMUaEZ1K3ZmFVZJsB4kZ+dXbX0h2H8ecaSfa/ohv2ni/e
 9/9e7zReqJL55jvMPYdKcvzOR6yPwziG00QowK7Krx2JzK6MgYFtDlSZtTX4fD1oIbb1IIpncgY
 5CQSOdyhu8ZJngg==
X-Received: by 2002:a05:690e:11c1:b0:65e:15fb:240e with SMTP id
 956f58d0204a3-66507acff23mr3499917d50.12.1782876795822; Tue, 30 Jun 2026
 20:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260616190147.1286316-1-visitorckw@gmail.com>
 <20260616190147.1286316-5-visitorckw@gmail.com>
In-Reply-To: <20260616190147.1286316-5-visitorckw@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Jul 2026 13:03:04 +0930
X-Gm-Features: AVVi8CfMLGGbnK6dxabPFN7dHif5QxgskR8rc-PxTIQqcttSTjh3JjXjwlJK8YQ
Message-ID: <CACPK8XdFhs7vy-e4peyKcAwk3wzcJFct5HTaAzB4nrbNeMnKtA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/riscv: Add Milk-V Duo board support
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: pbonzini@redhat.com, marcandre.lureau@redhat.com, alistair.francis@wdc.com,
 farosas@suse.de, lvivier@redhat.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com, 
 marscheng@google.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, 17 Jun 2026 at 04:31, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>
> Add support for the Milk-V Duo development board, which is powered by
> the Sophgo CV1800B SoC.
>
> The implementation includes:
> - Board-level machine initialization with 64mb of default ram.
> - Integration of the CV1800B SoC.
> - Support for loading external FDT, kernel, and initrd images.
> - Proper setup of the reset vector to match the CV1800B's boot flow.

Can you add something to docs/riscv too? A brief description of the
the board as you have here, how to boot it, where to find
firmware/images for it.

> --- /dev/null
> +++ b/hw/riscv/milkv_duo.c

> +static void milkv_duo_init(MachineState *machine)
> +{
> +    MilkVDuoState *s = MILK_V_DUO(machine);
> +    MemoryRegion *system_memory = get_system_memory();
> +    RISCVBootInfo boot_info;
> +    hwaddr firmware_load_addr, firmware_end_addr;
> +    hwaddr fdt_load_addr = 0;
> +    int fdt_size = 0;
> +    uint64_t kernel_entry = 0;
> +
> +    object_initialize_child(OBJECT(machine), "soc", &s->soc, TYPE_CV1800B_SOC);
> +    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
> +
> +    memory_region_add_subregion(system_memory,
> +                                cv1800b_memmap[CV1800B_DEV_DRAM].base,
> +                                machine->ram);
> +
> +    riscv_boot_info_init(&boot_info, &s->soc.cpus);
> +
> +    firmware_load_addr = cv1800b_memmap[CV1800B_DEV_DRAM].base;
> +    firmware_end_addr = firmware_load_addr;
> +    if (machine->firmware) {

This means the board will not run any firmware unless specified on the
command line. Was this the intent?

If your board can boot with the in-tree opensbi, the usual pattern is:

const char *firmware_name = riscv_default_firmware_name(&s->soc.cpus);
firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
                                                 &firmware_load_addr, NULL);

This handles checking if machine->firmware was set, falling back to
the default riscv64 opensbi, and handles `-bios none` and `-bios
default`.

> +        firmware_end_addr = riscv_find_and_load_firmware(machine, machine->firmware,
> +                                                         &firmware_load_addr, NULL);
> +    }
> +

> +    if (machine->dtb) {
> +        fdt_load_addr = riscv_compute_fdt_addr(cv1800b_memmap[CV1800B_DEV_DRAM].base,
> +                                               machine->ram_size, machine, &boot_info);
> +        rom_add_blob_fixed_as("fdt", machine->fdt, fdt_size, fdt_load_addr,
> +                              &address_space_memory);

This can be riscv_load_fdt().

> +
> +static const TypeInfo milkv_duo_machine_type_info = {
> +    .name = TYPE_MILK_V_DUO,
> +    .parent = TYPE_MACHINE,
> +    .instance_size = sizeof(MilkVDuoState),
> +    .class_init = milkv_duo_machine_class_init,
> +    .interfaces = riscv64_machine_interfaces,
> +};
> +
> +static void milkv_duo_machine_register_types(void)
> +{
> +    type_register_static(&milkv_duo_machine_type_info);
> +}
> +
> +type_init(milkv_duo_machine_register_types)

You can avoid some boiler plate by making milkv_duo_machine_type_info
an array and using DEFINE_TYPES()

