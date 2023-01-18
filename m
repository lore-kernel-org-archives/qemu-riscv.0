Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIHMO-0002gN-J8
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 17:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIHMI-0002fl-8Y; Wed, 18 Jan 2023 17:56:46 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIHMF-0004ki-N1; Wed, 18 Jan 2023 17:56:41 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id i185so363029vsc.6;
 Wed, 18 Jan 2023 14:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ijmLQFdsiMoKeVKdQsH4FLczLJZSaoIAYsR6yAzZMZI=;
 b=BsxmiDJKQAmiDSlvzLOUyglCSld2XMKTcfWK3yFY6GTp6bgD7YdqF5bnvf2SSHHVfu
 untFJButmfeX9jNbtEtgkER38gy7btMNyshDCLVFpsWRQFmbJYxNjTL32MpRxZCFX/eQ
 KJKbvLa5aSmNnKqoLrBPgRsu5/YgcC+g0OI2rLDfduAfHv9CGvDRB9n8cnbS2WM9KUvn
 0jJ+IDTVduAg8heSMrsBPB3Ckhn6FbWo9AG2iLPImqoaXMR4dmFc1J5fHvEqdLnVCYAb
 4cxrxs2uZvZjIeBtWGuCeg0hyC4NhvkPWpY/W3Rt16MDD1AKxSAjQABHsHZoU9nYDgQb
 U1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ijmLQFdsiMoKeVKdQsH4FLczLJZSaoIAYsR6yAzZMZI=;
 b=ap7Yttw36KwgWU69QptVNPlj4TFT5nn+ofg3S+P/gvl6K3pzuiEL36plQgQdlpLmQ8
 HqgaA8t45UYtBAofy/SHsnsW6okXBgxJXmOU/Y+Lsbuhh9kDbDparo///hslrqHqkEu6
 TpJJE6vsVW56tQJBGtkabA/easY6eVrHiSznBjiRueLhtveZUUHoERwPpad17D4w7Ab3
 ssRWnOBhTine7nEqWzqnjgeMi1u5RF2BV1CXELIKk0XAwIAaqA4swN6yzOoSx/MUM09F
 2at/wAP1+yNqEh6GTMr9E8iqht6VUwTdA3rYU+GF33XaWeNqqlErMhC8Y4C12TBinieU
 aWdw==
X-Gm-Message-State: AFqh2koKW1btCdA3OGOnPm4hoatbwSroB4E+bER+dYQZSEgjro5l4bom
 vNHoTP8+jaqO6URl64IviqwqMos9pNVYmevnQE4IEqbX8Rs=
X-Google-Smtp-Source: AMrXdXvQ3F0WUKur+pIcoyCTfrg6J5cEcFw1mps9+lpRBsFd4xBnCxsWigC2UtuRobDi1QLnQe9i5r0uM6f5AcBMG/k=
X-Received: by 2002:a67:eb10:0:b0:3c9:8cc2:dd04 with SMTP id
 a16-20020a67eb10000000b003c98cc2dd04mr1294398vso.73.1674082598081; Wed, 18
 Jan 2023 14:56:38 -0800 (PST)
MIME-Version: 1.0
References: <20230117132751.229738-1-dbarboza@ventanamicro.com>
 <20230117132751.229738-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230117132751.229738-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 08:56:12 +1000
Message-ID: <CAKmqyKPQjuK-uSU6iWODnBqQakL6kA9fK_ja9nvmUF7RU1sT9Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/riscv/virt.c: move create_fw_cfg() back to
 virt_machine_init()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng.cn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
X-List-Received-Date: Wed, 18 Jan 2023 22:56:46 -0000

On Tue, Jan 17, 2023 at 11:28 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Commit 1c20d3ff6004 ("hw/riscv: virt: Add a machine done notifier")
> moved the initialization of fw_cfg to the virt_machine_done() callback.
>
> Problem is that the validation of fw_cfg by devices such as ramfb is
> done before the machine done notifier is called. Moving create_fw_cfg()
> to machine_done() results in QEMU failing to boot when using a ramfb
> device:
>
> ./qemu-system-riscv64 -machine virt -device ramfb -serial stdio
> qemu-system-riscv64: -device ramfb: ramfb device requires fw_cfg with DMA
>
> The fix is simple: move create_fw_cfg() config back to
> virt_machine_init(). This happens to be the same way the ARM 'virt'
> machine deals with fw_cfg (see machvirt_init() and virt_machine_done()
> in hw/arm/virt.c), so we're keeping consistency with how other machines
> handle this device.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1343
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks for the fix!

Alistair

> ---
>  hw/riscv/virt.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index e6d4f06e8d..4a11b4b010 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1254,13 +1254,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
>      firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
>                                                       start_addr, NULL);
>
> -    /*
> -     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> -     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> -     */
> -    s->fw_cfg = create_fw_cfg(machine);
> -    rom_set_fw(s->fw_cfg);
> -
>      if (drive_get(IF_PFLASH, 0, 1)) {
>          /*
>           * S-mode FW like EDK2 will be kept in second plash (unit 1).
> @@ -1468,6 +1461,13 @@ static void virt_machine_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
>                                  mask_rom);
>
> +    /*
> +     * Init fw_cfg. Must be done before riscv_load_fdt, otherwise the
> +     * device tree cannot be altered and we get FDT_ERR_NOSPACE.
> +     */
> +    s->fw_cfg = create_fw_cfg(machine);
> +    rom_set_fw(s->fw_cfg);
> +
>      /* SiFive Test MMIO device */
>      sifive_test_create(memmap[VIRT_TEST].base);
>
> --
> 2.39.0
>
>

