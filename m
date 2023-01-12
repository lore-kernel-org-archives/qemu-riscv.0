Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFlY8-0006TX-KF
	for mharc-qemu-riscv@gnu.org; Wed, 11 Jan 2023 19:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFlY6-0006T3-Js; Wed, 11 Jan 2023 19:34:30 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFlY5-000159-0U; Wed, 11 Jan 2023 19:34:30 -0500
Received: by mail-vs1-xe36.google.com with SMTP id t10so6945747vsr.3;
 Wed, 11 Jan 2023 16:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d1tk4Tru+qMNsCf/c1roFprY9b168ARgsT1glGAgJrs=;
 b=JksjXBJop6szgYimaecIHf03yTPM9PbDTX8cI3pcNKPoift6RwQCeBm2vSzcTcpkAg
 tFHNP+j9gZx09UtpElc5Fr1G95LD37sSc9ZFi2o1iWkRkfbvaPtEAAaB2ikq+AQeZh65
 +k25I3c4+fO8AFW3UTJ1PeGPh9+4lDcFqOFopYH9LRdLsC9VRhIu686WYA1ShfI/1WUn
 S5o1Nni4nDT2s8nSBacmHkaw6TnqJUdoQUUXdJE8kjMKMwR4HLAOqII9Bdsx1dCa/U2A
 HkifuEjRh8SxrYZn1LurDBKonRtZcKz8it6CAp53n9GOUzSbeFRdsiUp2xFs1NW7OT4H
 AAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d1tk4Tru+qMNsCf/c1roFprY9b168ARgsT1glGAgJrs=;
 b=qp7XPXg21G5Zay8G0y2lckSmDJ82mk9BvHJLKwnrdb4YY45YUppSYQqNkcypwg1Xn6
 Kuq/uitUoZ7emLtUIOyIEJd24dbB5E6iUOTn/dl+wYoukpQcJtL58SSAnmrjqGcYzKOp
 gDDy7D86caaCrn8zB5L3IntsdHhcI+gK6P/745NESM6dmAoKLClIR/bboA4ZlyXAlgwf
 8QzYs5bKZWzM8yulckFHbI0UsPUwWv6Bt3lZnYaTHdMaR8g+Wou1EzJh6Nfg0DFLRvHj
 DehBoZV6plV27O7NbJcxIoiv8WIK/G5wG5ub5DkCSsX7GqbSEPe7GsqpX2PZMUCHcmxn
 iG+Q==
X-Gm-Message-State: AFqh2kotJH9XjiwnsWO/DWQx9U0wwpn0wjb4FaFDIj11We6VebeZHmwz
 /G6H2voexe4bVATqXYYW4K+T5rAg0dAKo7W7ijA=
X-Google-Smtp-Source: AMrXdXsuYO++2pCgVrv/MnV02FMWss2jZ2uVRTbNDFZJpwzS/sd4iAi0lNsX3VAag0pcajHPM6LZ2W7RvBhd3JmWdo4=
X-Received: by 2002:a05:6102:510e:b0:3b1:2b83:1861 with SMTP id
 bm14-20020a056102510e00b003b12b831861mr9865244vsb.10.1673483667615; Wed, 11
 Jan 2023 16:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-11-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 12 Jan 2023 10:34:01 +1000
Message-ID: <CAKmqyKPri7asvqZ8wN4Bd-wjH+gwwMJJhiUd+=QZFV4RhWnyUQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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
X-List-Received-Date: Thu, 12 Jan 2023 00:34:31 -0000

On Mon, Jan 2, 2023 at 9:55 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
> the same steps when '-kernel' is used:
>
> - execute load_kernel()
> - load init_rd()
> - write kernel_cmdline
>
> Let's fold everything inside riscv_load_kernel() to avoid code
> repetition. To not change the behavior of boards that aren't calling
> riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
> allow these boards to opt out from initrd loading.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 22 +++++++++++++++++++---
>  hw/riscv/microchip_pfsoc.c | 12 ++----------
>  hw/riscv/opentitan.c       |  2 +-
>  hw/riscv/sifive_e.c        |  3 ++-
>  hw/riscv/sifive_u.c        | 12 ++----------
>  hw/riscv/spike.c           | 11 +----------
>  hw/riscv/virt.c            | 12 ++----------
>  include/hw/riscv/boot.h    |  1 +
>  8 files changed, 30 insertions(+), 45 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2594276223..4888d5c1e0 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -175,10 +175,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>
>  target_ulong riscv_load_kernel(MachineState *machine,
>                                 target_ulong kernel_start_addr,
> +                               bool load_initrd,
>                                 symbol_fn_t sym_cb)
>  {
>      const char *kernel_filename = machine->kernel_filename;
>      uint64_t kernel_load_base, kernel_entry;
> +    void *fdt = machine->fdt;
>
>      g_assert(kernel_filename != NULL);
>
> @@ -192,21 +194,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
>      if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>                           NULL, &kernel_load_base, NULL, NULL, 0,
>                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> -        return kernel_load_base;
> +        kernel_entry = kernel_load_base;

This breaks 32-bit Xvisor loading. It seems that for the 32-bit guest
we get a value of 0xffffffff80000000.

Previously the top bits would be lost as we return a target_ulong from
this function, but with this change we pass the value
0xffffffff80000000 to riscv_load_initrd() which causes failures.

This diff fixes the failure for me

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 4888d5c1e0..f08ed44b97 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -194,7 +194,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
    if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
                         NULL, &kernel_load_base, NULL, NULL, 0,
                         EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
-        kernel_entry = kernel_load_base;
+        kernel_entry = (target_ulong) kernel_load_base;
        goto out;
    }


but I don't think that's the right fix. We should instead look at the
CPU XLEN and drop the high bits if required.

I'm going to drop this patch, do you mind looking into a proper fix?

Alistair

