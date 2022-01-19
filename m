Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nA4tJ-0001Wv-6B
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 01:56:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nA4tH-0001Ve-Fo; Wed, 19 Jan 2022 01:56:19 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=33600
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nA4tG-0001xs-2I; Wed, 19 Jan 2022 01:56:19 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id l68so3930227ybl.0;
 Tue, 18 Jan 2022 22:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bpDx8+F25IGXcfTWD62LB2zicnuNRmE63fZAqJGZfTw=;
 b=iCoam4wb/GrEDfIbatwL2/ip1VIQyuQlQp7pHz81zADeZma3pl51XqF0vPKAnze4SW
 XbTo1mALT355r0jI36gRt0CE/r6p8NRi7ElOCRqOpxjHuMfWEgesHpYWECmiuWwtpQAA
 SkN0dFe9mzoMgwf5dcU8KhUKPLO8J7b9VWm5aEqdzPEiLeynd7I7vgoPzGUre3xVCX2E
 quRly7nZi52pZ9pMtUMhOF46WO2xFP4Vca3x9lQwnQtkm+MAWVeKy3MRphI6rCHgbS+A
 oDeHnw7usHbz18IEkXJIZx4qbQFUY7oajHw8dioxQG4w/mAOHA6mZeLVBEdb3RSvpQIH
 7Mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpDx8+F25IGXcfTWD62LB2zicnuNRmE63fZAqJGZfTw=;
 b=dZDuvuL325FjQJg4kOKNAeV4e8dGfs6N6ZWWATOBt2wWI20bSpag6x+YbAe2ha2kra
 0VA5HJkF9mg+fpoDUfzfj6tBfVnjJPx0XGok22HlhRrdUD7THi/SDbZOUsil/GtpwyhU
 Je7Rz9ahVXTlp+sKGt/cvZSIt8JB9NAPpNiTmozQj41zdtYl6ueRk9ycXpcHm8yPgGvp
 EZQaQjERfGw8Buh+Z2K5KjngCLWRkalTORdO7LJIQbxpPy7lmW27OJaSIDRWxWyd/AI2
 h73HibPc/Ksxpk9VQWraNh/SgUdUCS0GU0xrxStcip4w/roELC041yMZZ+7sC6M17f0H
 BT7w==
X-Gm-Message-State: AOAM530YLFACBKdFFM1IhlokIjAHoR6+mSnYD8wD5mZiaHnOy1vpoXRM
 7j11WQ0rQsxr13LFolRZaZ02BdCTYT1euGFoTXQ=
X-Google-Smtp-Source: ABdhPJxk+nvscw7vWm6z3Jn8GNwHf5SgPTZSGSLj/TEfUNoOFDEKL7Irg1jd9tkdr6ooLJosO6JoStrm7TaEuZYQHqQ=
X-Received: by 2002:a25:2507:: with SMTP id l7mr8304814ybl.526.1642575376599; 
 Tue, 18 Jan 2022 22:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20220118111736.454150-1-apatel@ventanamicro.com>
 <20220118111736.454150-4-apatel@ventanamicro.com>
In-Reply-To: <20220118111736.454150-4-apatel@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Jan 2022 14:56:04 +0800
Message-ID: <CAEUhbmX-juU-a0D4sgnxR=Z+uRU=tBt2bNYAOjmfoW_7DD9JKA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] roms/opensbi: Remove ELF images
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 06:56:20 -0000

On Tue, Jan 18, 2022 at 7:18 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Now that all RISC-V machines can use OpenSBI BIN images, we remove
> OpenSBI ELF images and also exclude these images from BIOS build.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  pc-bios/meson.build                            |   2 --
>  pc-bios/opensbi-riscv32-generic-fw_dynamic.elf | Bin 838904 -> 0 bytes
>  pc-bios/opensbi-riscv64-generic-fw_dynamic.elf | Bin 934696 -> 0 bytes
>  roms/Makefile                                  |   2 --
>  4 files changed, 4 deletions(-)
>  delete mode 100644 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
>  delete mode 100644 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
>

.gitlab-ci.d/opensbi.yml should also be updated to remove .elf build

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

