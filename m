Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9x2q-0004bE-Dq
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 17:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9x2m-0004Y6-Pq; Tue, 18 Jan 2022 17:33:38 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=38410
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9x2k-00049h-TZ; Tue, 18 Jan 2022 17:33:36 -0500
Received: by mail-io1-xd2e.google.com with SMTP id w7so502718ioj.5;
 Tue, 18 Jan 2022 14:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=REL2GoLMLYHd0jRnG0gZRdmfVPpmNcAKrbnHGMkVH1s=;
 b=B7ndPJjMPcYRftbTrS5B8jXKqG13BiESksM2vX8/QCiUPLLT/RFSdsoR0YzTMTpIn3
 zz54kHS1Jm+TnE/4aauiDJYPsjO6vu5M2tJumvNFfBjjcN7ZqZTgwR/IbAHWa9RrEDoc
 qnakcsf00gsNHyLRmgPLjRPJQ0+68RgNHOxRLhRKICFLDl+UOI6xklAcWIo5lmBIRDA2
 IZgUK1fs9yjoqdQzmguatUusaUd4vxCle/rl9jNwIzqqtP20jDWLE+cqdM0dkO4dXzIG
 U9H3CgcHvvrqqEcTnlzfhXc+f1hMKgvRthUYupkz4NZaWF980qurBsoTN1pR50H++eq4
 wjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=REL2GoLMLYHd0jRnG0gZRdmfVPpmNcAKrbnHGMkVH1s=;
 b=3IMIMo71uubBpVOQ6wDe+Rn4cG2WbJqdnKp0Gl7G7mSLvVarLpUYuLQJyGeIObBmaz
 j7HLxt9bkL6P17lr9yh71DN4Ze6eWecjaZXZM63/ZRteUiwkY24osi6oZ2bzhf6OksSI
 yN+IEiWlqk0PpAnTmxGTS66WP4sBGIrbB38UrhGyLqAmUPguWnWpxHY1waSCv1z7C8oN
 H/bY+HwMWzfohBM16qu6wSwV0Ch21UXLVxQqB6En5OW+GzetpzBXmNg0e4RHSYfUOuXB
 gYI7+Q1AIfqV/Lk0bgCvjm3+ao7hevBIp6MEZUbusWmRk865XmFMQ6zMeGCuLRfpvS+4
 Vq4w==
X-Gm-Message-State: AOAM532uagtXcXVv4E/3pbl9mB+0+WBZz3A7ZuWst7JLief2CjbxlcOw
 2P99ZOMszZXGmpHQBl9cJYo0eUVSdjKOH6HVNi0=
X-Google-Smtp-Source: ABdhPJwxt5gDnTfSEgdfuCyfNP5l7Rq/53Y2yylzlRPqIxWk3NJbYNCBu3WBfkO95bZa9uCi7idN+GYJ2678e3o7zGA=
X-Received: by 2002:a05:6602:140c:: with SMTP id
 t12mr13682662iov.187.1642545213501; 
 Tue, 18 Jan 2022 14:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20220118111736.454150-1-apatel@ventanamicro.com>
 <20220118111736.454150-4-apatel@ventanamicro.com>
In-Reply-To: <20220118111736.454150-4-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 08:33:07 +1000
Message-ID: <CAKmqyKNUC10OxaZvWiBokdg5Yw8KajbM96V+4OtiqSiUmFvdew@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] roms/opensbi: Remove ELF images
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 18 Jan 2022 22:33:38 -0000

On Tue, Jan 18, 2022 at 9:22 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Now that all RISC-V machines can use OpenSBI BIN images, we remove
> OpenSBI ELF images and also exclude these images from BIOS build.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

In future it's best to not send a large binary blob:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#avoid-posting-large-binary-blob

Alistair

> ---
>  pc-bios/meson.build                            |   2 --
>  pc-bios/opensbi-riscv32-generic-fw_dynamic.elf | Bin 838904 -> 0 bytes
>  pc-bios/opensbi-riscv64-generic-fw_dynamic.elf | Bin 934696 -> 0 bytes
>  roms/Makefile                                  |   2 --
>  4 files changed, 4 deletions(-)
>  delete mode 100644 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
>  delete mode 100644 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
>
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 1812a4084f..4ac7a5509b 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -80,8 +80,6 @@ blobs = files(
>    'hppa-firmware.img',
>    'opensbi-riscv32-generic-fw_dynamic.bin',
>    'opensbi-riscv64-generic-fw_dynamic.bin',
> -  'opensbi-riscv32-generic-fw_dynamic.elf',
> -  'opensbi-riscv64-generic-fw_dynamic.elf',
>    'npcm7xx_bootrom.bin',
>  )
>

