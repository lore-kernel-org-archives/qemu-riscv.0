Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWDii-0007bt-0w
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 05:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDiQ-0007SM-IN; Thu, 08 Sep 2022 05:20:54 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDiO-00011S-SV; Thu, 08 Sep 2022 05:20:54 -0400
Received: by mail-pf1-x429.google.com with SMTP id c198so7438061pfc.13;
 Thu, 08 Sep 2022 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4c6DoOOyV37wU23qcPSVaAYu8mdYtez+DKjSHLL0Rug=;
 b=IbfNqhfTIzFg7F7AWfvAQEh+znAiC+GcIjjaWEy04KHpDtqMeIMsjggxWIpzSsTw4k
 3AJN3g4kJnd6fC3sTaTkCEHxDhaA5BagxL7xRaxzBYUpSUecGGxaHgWNZqmbaw1HAlct
 s3d4KFx7Jw7vSfq6uK8xtpcfrXjD8HzAYm8AauWMoeLdJzXoET6UuALs3zOBwzjpssk7
 +/+z0h2VvbcMt1ACSn1+4JcfZRw3UKvKvP/OoqV4B/4n2+hFZ/fD49LXwETSxKuF8a/2
 YSQSuqn+z+MVHFJsy/3N0rWYyqay6rfrl+igNemuNKiIjpLXzegJDt7n0pD01p2/6XcD
 kO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4c6DoOOyV37wU23qcPSVaAYu8mdYtez+DKjSHLL0Rug=;
 b=WeCkHCYUhKh+LIS0iC7VA727iG+hA1B8QmH72ZrlSiS5U8kYpOVyLwAKr9FWeA1jyW
 YpwbOaOR14qbzISXFjqNPvihU0IN9PPplvwJyiE8Qs7qsWKUo7blMhJ+m40xWqA0zs4E
 yA0zgTFz/FrDcKnB3jf/7SvO76T3vjAzFpGWj7puf4h/XREQbH1cZUESqCJ7AoX7g/nb
 zMxSmuXEXqBqDz1VobUEN5b9evfufFBKKqYqaisaaippH9adXbhpC5SWgH3sYT7S4wpD
 mCc04Z1I1wjpOZtgv7E8+VgB8d2EdmHemKeTmZZIYriU9vPGmYKM42UWbiis6eZE9jcb
 YtAw==
X-Gm-Message-State: ACgBeo3Fj+vLBVLYO9gFkvDMsRGDd1bLB9cGA7cmXIXDZnmq05VC2lJq
 eK4SsORBa8Z39NGO9nlsnBlMbTbAeY8ZHnixFyK8VoVCEDLrOGRF
X-Google-Smtp-Source: AA6agR5MyBrgsfLmlpjgtST+HwKcBy+SYusF6igRSEkTSXUtoelCTOAxt5IzntkIzvWF9hs3ZKTTL1z+bhJY4+fCVuo=
X-Received: by 2002:a05:6a00:2402:b0:52c:81cf:8df8 with SMTP id
 z2-20020a056a00240200b0052c81cf8df8mr8272461pfh.60.1662628850440; Thu, 08 Sep
 2022 02:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906090219.412517-3-sunilvl@ventanamicro.com>
In-Reply-To: <20220906090219.412517-3-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 11:20:23 +0200
Message-ID: <CAKmqyKNws0a4o-aO9OzDa9DJRF9PCBP_pHWgvJgUPdxWTF=hSg@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] hw/riscv: virt: Move create_fw_cfg() prior to
 loading kernel
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x429.google.com
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
X-List-Received-Date: Thu, 08 Sep 2022 09:20:55 -0000

On Tue, Sep 6, 2022 at 11:44 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> To enable both -kernel and -pflash options, the fw_cfg needs to be
> created prior to loading the kernel.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index ff8c0df5cd..b6bbf03f61 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1251,6 +1251,13 @@ static void virt_machine_done(Notifier *notifier, void *data)
>                                      RISCV64_BIOS_BIN, start_addr, NULL);
>      }
>
> +    /*
> +     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> +     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> +     */
> +    s->fw_cfg = create_fw_cfg(machine);
> +    rom_set_fw(s->fw_cfg);
> +
>      if (machine->kernel_filename) {
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_addr);
> @@ -1284,13 +1291,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          start_addr = virt_memmap[VIRT_FLASH].base;
>      }
>
> -    /*
> -     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> -     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> -     */
> -    s->fw_cfg = create_fw_cfg(machine);
> -    rom_set_fw(s->fw_cfg);
> -
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
>                                     machine->ram_size, machine->fdt);
> --
> 2.25.1
>
>

