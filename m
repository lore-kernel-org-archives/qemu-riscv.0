Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIIiY-0007w0-W4
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 19:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIIiX-0007vh-9H; Wed, 18 Jan 2023 19:23:45 -0500
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIIiV-0000MX-5s; Wed, 18 Jan 2023 19:23:44 -0500
Received: by mail-ua1-x92b.google.com with SMTP id b18so114817uan.11;
 Wed, 18 Jan 2023 16:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HXdUVU3KNzqbrwxdUbStrYGaHHOZeSpZYIbj0MSwj+A=;
 b=gA75PhX+A+mEnwe9mhxDAcPZN1tL9sBkyVoZkR37n3RQYF+1TML+A+IM4d1xY8DvbA
 wSkVFi0G47tAWB7m04wLqr/N5j4mRzG6RNf2BrMcAup+sQlqHN8kWerIs2gffLKArnxM
 92eCIkAcb44tG+ymNejFewspdGWmZwzNWTv0amDUc9KEopReOaz/meWCOKxEJgCKUCty
 v+m2nbcHR8i/YvEEXP7SRIsRwNYtFQ/+Jmm+hzIjobmrLxywcXgZQ/UCKIehk3ipYNjZ
 0x9bPPnGJO+XnrmH7iEKhBqUgNxS2yihu+zbk/vXoscZ1nsXV2o3dn3XRSH5ohnodfOa
 UpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HXdUVU3KNzqbrwxdUbStrYGaHHOZeSpZYIbj0MSwj+A=;
 b=tCUekSnM0QmBu/d1K0mB8x1U/83vqds0Urf0oJW9JwlTHgPtHUSrlZiD/20thKiGzt
 tfYPIq91VXlpTjGJvNgpOdeofLMJApPV2hkJd0jtPie+i2uuk4TAWOfeB23tbdr4Yxei
 sP3sPjoK+9on50cxeCJnPBfElZ2JoQlVEH1NBknnYKZv1009XWv6uBN4R3xgAa+LEGSR
 tosTeq6iRSsLFC5zOY5CY2PsRIRV5Q+Gfh/LjkvKOHvx3fHa8cQczcIFuirRsa6L2PU/
 nfH/nwS2/BI0iv889CtMn1usIfHhDAWr21MewVUVU9nZBVhtI7D1H8s/lWX+Z4e2qpm2
 rstQ==
X-Gm-Message-State: AFqh2kp/0K1qz/jAIczHGd4YWTmGJxwi46M704ZD+LbHl5UEyFnBPor8
 ey0Gr1vj691ulIxuy5hZFBnuMfbnlznMFni8We0=
X-Google-Smtp-Source: AMrXdXt7upsKWeG6AfDENOilcqgc1XV3XJ1P9u+/nWUpOeQxajzCRT/CSy6MBQer6GNrDdrpV5gcP0D130ESeC4Bl3Y=
X-Received: by 2002:ab0:3b8d:0:b0:419:2865:3ae7 with SMTP id
 p13-20020ab03b8d000000b0041928653ae7mr1066784uaw.70.1674087819745; Wed, 18
 Jan 2023 16:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20230117132751.229738-1-dbarboza@ventanamicro.com>
 <20230117132751.229738-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230117132751.229738-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Jan 2023 10:23:13 +1000
Message-ID: <CAKmqyKOQPge==r7OB4FL6H-bY8Je9XK1xxqYb-e=EtPTa-XNQw@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/riscv/virt.c: move create_fw_cfg() back to
 virt_machine_init()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng.cn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 00:23:45 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

