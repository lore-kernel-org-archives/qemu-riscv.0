Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAO6J-00016s-Sy
	for mharc-qemu-riscv@gnu.org; Tue, 27 Dec 2022 23:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAO6D-00010e-7z; Tue, 27 Dec 2022 23:31:32 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAO6A-000098-Fx; Tue, 27 Dec 2022 23:31:27 -0500
Received: by mail-vs1-xe34.google.com with SMTP id m129so8741541vsc.11;
 Tue, 27 Dec 2022 20:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9KL7J593K41LzeWTqjmfysLuCtXaN9UMskkMZ2j73A=;
 b=EiyYtEls21653OwbwfgPNRF6JRrhUVt7o44LWEvG3Du4B1Rrpaeak+9luipaTs9+Cz
 qe9PMNc4oZrywY+4xbCVsC5kzgNg5kcJ5HDW2MVJykJOQEdcgwawlww/AXy2xXR/7o0v
 /9Pm5HfY/HTYy+yFhqxChaeWrv27/uVLPzM06eIYXDKbbnF6q0yB7eQIhF0m/v8HI8UU
 ToRuwcw+22mxdQGM9yz+YVVcq9QbawsQfZl+w5Ekb+llRSXSK+NtsJH2ivHbtDh0xDix
 gZBfGlXl4YY/r1KK1INSdRqTqFt2kaq6HhwfaG4SpPzrNDtaRrFiEE5IAtdvuXq84Z1v
 3q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y9KL7J593K41LzeWTqjmfysLuCtXaN9UMskkMZ2j73A=;
 b=UPaPtQAd8nsmNNN8XTz6jIW+zBNgYrFPEEXw6lev0OkIw7oKJCnCc3QzbhXWzYfniE
 6qN62JafYZQeJmNopVvkUS775u+N6bme12qM2zSzy3Hd00HBRGNyi/hHtWqPoe54JOii
 i/ulfT7SG3hvB7iNEPd5MYx/A2diRzzcFJCqY9nkFVFecizEU0eYgV2JYVy5Z9AT0+q9
 VmNGFhnag08wGGnehDnzWV3x9F9/jWoyJXs2z4P4xjdp6tEAOXTlbEiyoQMBOiWfGvFH
 uFKCtWcXAAriKkI6QSWqpDp5NkowLi3aNNyz0Uk0bFHLZxUnU1K6J+4EDWW+Gdv+2m0F
 2edQ==
X-Gm-Message-State: AFqh2krmeN/u8RBgDFzfutQgy+rXVxYatXU0VfBQtCe5kPMtkewg08q5
 8HyKDP+odRX6HUhZqD8DL7LFsl2bEt9tJgDDa6k=
X-Google-Smtp-Source: AMrXdXuaXKXnzdhQ6VgOZETLAhRplzcKeh8RBTJKdaa/AQOsoAvwWZW7xY7oWR2E0p1YFoSnednULigWwyCmkDsjKz4=
X-Received: by 2002:a67:dc10:0:b0:3b3:7675:d423 with SMTP id
 x16-20020a67dc10000000b003b37675d423mr2684495vsj.72.1672201884866; Tue, 27
 Dec 2022 20:31:24 -0800 (PST)
MIME-Version: 1.0
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-9-bmeng@tinylab.org>
In-Reply-To: <20221227064812.1903326-9-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 14:30:58 +1000
Message-ID: <CAKmqyKOqYdd7G6juPzNPfmePS4_3YUfN1nhR0zpSQmpvatwSrA@mail.gmail.com>
Subject: Re: [PATCH 08/12] hw/riscv: spike: Remove the out-of-date comments
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 04:31:33 -0000

On Tue, Dec 27, 2022 at 4:54 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> Spike machine now supports OpenSBI plain binary bios image, so the
> comments are no longer valid.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/spike.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 8606331f61..ab0a945f8b 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -256,11 +256,6 @@ static void spike_board_init(MachineState *machine)
>      memory_region_add_subregion(system_memory, memmap[SPIKE_MROM].base,
>                                  mask_rom);
>
> -    /*
> -     * Not like other RISC-V machines that use plain binary bios images,
> -     * keeping ELF files here was intentional because BIN files don't work
> -     * for the Spike machine as HTIF emulation depends on ELF parsing.
> -     */
>      if (riscv_is_32bit(&s->soc[0])) {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
>                                      RISCV32_BIOS_BIN, memmap[SPIKE_DRAM].base,
> --
> 2.34.1
>
>

