Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oiNvK-0000AG-Vt
	for mharc-qemu-riscv@gnu.org; Tue, 11 Oct 2022 18:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiNvI-00006m-TO; Tue, 11 Oct 2022 18:40:28 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiNvG-0001RP-TC; Tue, 11 Oct 2022 18:40:28 -0400
Received: by mail-pl1-x62d.google.com with SMTP id h10so14581095plb.2;
 Tue, 11 Oct 2022 15:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K4rENLlk1pqovVAyYJPfZUVgTvC8JwSjkTBrrydmKnE=;
 b=qHzWu3r1Moo/XGjGg5711k4vNTjd8DbxjtSRwpTQymISetPNLX36eNaJtYKB14fzNl
 ncnZIAgXGgXvCrauV90aeKty+fiiisdMQa+vNjOLRCnbBXhH60vFEAXDFekT2NFvIg0w
 t5fzz/F1ex0wmyci0dQeoso/eOz4T4XkuIMPWioo8DZ+04C5dRBqZt1gb2LMDA8onJRU
 BZ4QoBMm6scF2c8XHxRw8Yy17D7vWR9OQm58fUpQM+Wats1iefy8nx/0/41/w7QdzTEU
 gpnS++uVFRLo5Xmy4wglF1slfxGyY1aG0IOJenddOzZsqgv/oyvSajzTkCkop9Y7LuOX
 KQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K4rENLlk1pqovVAyYJPfZUVgTvC8JwSjkTBrrydmKnE=;
 b=mTkTx5fI/T0PtNKLMsLD7HsvNp9tegKrF2hLMMjgIhrqHtbTk3o27YMRaj5IJLE3Vl
 5NLdtbj9aA3fnzApIRMxLu+Y68cQs0aBlvbNSyoibCxAy6/N+wjkAZVrkaCIfjIE8KmM
 nbc9/sPLB5FDD5Gi3TXJ7oSh9p5g71oUUXAgv4OakoFqkt2Fl/++nq3hkTbR2L0DE47n
 ARRPQT7l1VCku2y/iTUPreUuxJjm6viSHnz9JRgk18OpzSf5ce0uXTmXEQiPMzwroWX5
 DhO2yrGkHNQ4UiKZjt22Y+buJJzNf5OaRZiYMguqz3l7EKXl5iGQLFiSHxhOlYE76XJf
 vZfQ==
X-Gm-Message-State: ACrzQf13ZqH5LUgYfMcL6odkJ+gQY3Y1ezT37EKZBP/UvMCsMJZmBugV
 vFwfnCs0wEGawQ+UFF7ZA5eqVIwd3JWyVQgNAVE=
X-Google-Smtp-Source: AMsMyM7aIldt6dG18DMbEGhYFz1d3+0NkiE7UsSQSyH4Q6ePcuBgkVKt/SVsqxmen10i1eRG9N+IksJQn4mUMd+YfKw=
X-Received: by 2002:a17:903:32c4:b0:178:5206:b396 with SMTP id
 i4-20020a17090332c400b001785206b396mr26500372plr.99.1665528024654; Tue, 11
 Oct 2022 15:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221004092351.18209-1-sunilvl@ventanamicro.com>
In-Reply-To: <20221004092351.18209-1-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Oct 2022 08:39:57 +1000
Message-ID: <CAKmqyKPkaDnKDwpSLZHcCgQxTg8XEiijmtJVz3opPSLoqjNvJQ@mail.gmail.com>
Subject: Re: [PATCH V5 0/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflash
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62d.google.com
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
X-List-Received-Date: Tue, 11 Oct 2022 22:40:29 -0000

On Tue, Oct 4, 2022 at 7:25 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> This series adds the support to boot S-mode FW like EDK2 from the flash. The
> S-mode firmware should be kept in pflash unit 1.
>
> When -kernel (and -initrd) option is also provided along with the flash,
> the kernel (and initrd) will be loaded into fw_cfg table and opensbi will
> branch to the flash address which will be the entry point of the S-mode
> firmware. The S-mode FW then loads and launches the kernel.
>
> When only -pflash option is provided in the command line, the kernel
> will be located and loaded in the usual way by the S-mode firmware.
>
> These patches are available in below branch.
> https://github.com/vlsunil/qemu/tree/pflash_v2
>
> The first two patches in this series are refactor patches.
>
> These changes are tested with a WIP EDK2 port for virt machine. Below
> are the instructions to build and test this feature.
>
> 1) Get EDK2 sources from below branches.
> https://github.com/vlsunil/edk2/tree/virt_refactor_smode_v1
> https://github.com/vlsunil/edk2-platforms/tree/virt_refactor_smode_v1
>
> 2) Build EDK2 for RISC-V
>         export WORKSPACE=`pwd`
>         export GCC5_RISCV64_PREFIX=riscv64-linux-gnu-
>         export PACKAGES_PATH=$WORKSPACE/edk2:$WORKSPACE/edk2-platforms
>         export EDK_TOOLS_PATH=$WORKSPACE/edk2/BaseTools
>         source edk2/edksetup.sh
>         make -C edk2/BaseTools clean
>         make -C edk2/BaseTools
>         make -C edk2/BaseTools/Source/C
>         source edk2/edksetup.sh BaseTools
>         build -a RISCV64  -p Platform/Qemu/RiscVVirt/RiscVVirt.dsc -t GCC5
>
> 3)Make the EDK2 image size to match with what qemu flash expects
> truncate -s 32M Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd
>
> 4) Run
> a) Boot to EFI shell (no -kernel / -initrd option)
> qemu-system-riscv64  -nographic   -drive file=Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1  -machine virt -M 2G
>
> b) With -kernel, -initrd and -pflash
> qemu-system-riscv64  -nographic   -drive file=Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd,if=pflash,format=raw,unit=1  -machine virt -M 2G -kernel arch/riscv/boot/Image.gz -initrd rootfs.cpio
>
>
> Changes since V4:
>         1) Rebased on riscv-to-apply.next branch
>         2) Added RB tags
>         3) Gerd's feedback on removing the truncate requirement will be addressed as separate
>            patch in future.
>
> Changes since V3:
>         1) White space and comment edits
>         2) Added RB tag
>
> Changes since V2:
>         1) Moved the doc comment to .h file
>
> Changes since V1:
>         1) Modified code to support the use case when both -kernel and -pflash are configured.
>         2) Refactor patches added to help (1) above.
>         3) Cover letter added with test instructions.
>
> Sunil V L (3):
>   hw/arm,loongarch: Move load_image_to_fw_cfg() to common location
>   hw/riscv: virt: Move create_fw_cfg() prior to loading kernel
>   hw/riscv: virt: Enable booting S-mode firmware from pflash

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/arm/boot.c             | 49 ---------------------------------------
>  hw/loongarch/virt.c       | 33 --------------------------
>  hw/nvram/fw_cfg.c         | 32 +++++++++++++++++++++++++
>  hw/riscv/boot.c           | 29 +++++++++++++++++++++++
>  hw/riscv/virt.c           | 32 ++++++++++++++++++-------
>  include/hw/nvram/fw_cfg.h | 21 +++++++++++++++++
>  include/hw/riscv/boot.h   |  1 +
>  7 files changed, 107 insertions(+), 90 deletions(-)
>
> --
> 2.25.1
>
>

