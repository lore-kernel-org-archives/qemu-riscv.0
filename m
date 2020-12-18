Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kqA5K-0001Y6-EW
	for mharc-qemu-riscv@gnu.org; Fri, 18 Dec 2020 02:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kqA5H-0001Xt-SK; Fri, 18 Dec 2020 02:21:52 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:32820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kqA5C-00036e-RA; Fri, 18 Dec 2020 02:21:51 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id o144so1128166ybc.0;
 Thu, 17 Dec 2020 23:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ePx/f5ijsXSNYi/yaAhhAaRicDOzwiso33tjgwrZUuw=;
 b=sUzWxZ0FLhhzLL4CXfxe5FkM78Y7zF0VOE430b9MyQiu9JZCzjArQLM3cyKMRWKrbr
 vl4taiqa+xqxzoI/b6G9RRDRcgwyPIP/afKTD0wz/Qh7C5WFxBBMxv1H5Up61+G8/bOq
 bXH8Dm5dLipC4KPx3abLdrN84fh9GpuoqTayeuWpLrVgvybOY2EDGgfyeYRLixCEsdj5
 diym62jMPlQ+vZurJmFGhaeLOG2gJrPe1zq/G7qmx7F9aqxaGdfoPYIUXCxTEdxB80H6
 lKhoIKS5IgRjtKG1z70xt3UBhT5WNsivcvM7NYBv2GRuG+b3VUfB88vwXMhTI7yanaXj
 HiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ePx/f5ijsXSNYi/yaAhhAaRicDOzwiso33tjgwrZUuw=;
 b=kvWFEypKzdPnD/oPVelKegawZMvlUBCBrvKIdPEGS2KsfR2moLzMowuPce32vdrQwW
 yftCbiUBplJUUAnU1sklXWE+GKTdjSIV9l1dT9tpMu40weyHxNlye+TTA3N3Njl2i4dy
 PgwRgcFNtzU5jskvA+qleWbXE2cKvh3D/LEA+ugkbNK3lE/zG4d/Zq1kl/+Vx4aIHYfi
 Lkd4QspSGc3nJO5CVmKtsbrhBVagNguJ3y1Hm/Q2F1VTc+o5FvYjA39cxbAs9R2i6hZZ
 S4zxjNfFWv2Uyk2e+pXCXhP+4yQp5v5rlLlRxaHLs/Bqbu2YYkPwktgJDPen6v7FJpD5
 LMcA==
X-Gm-Message-State: AOAM533nnw0SMvBXIYiac6BnMAZR4QnaaIISpX54C69txaNRpYYHjxOD
 hYv9QOPbYZFiSIMUMEJLKxXj9BDxx/FyqEbcjYg=
X-Google-Smtp-Source: ABdhPJy4QciiUh9UP639PYLj35b8EyJYSZp+ZB8j6A3NdLku3jaupSfUOCboxxlFOPgiS9vdfpVrxe4286BPx9HnsOY=
X-Received: by 2002:a25:4d7:: with SMTP id 206mr4545735ybe.306.1608276103192; 
 Thu, 17 Dec 2020 23:21:43 -0800 (PST)
MIME-Version: 1.0
References: <20201217214826.2094617-1-atish.patra@wdc.com>
In-Reply-To: <20201217214826.2094617-1-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 18 Dec 2020 15:21:31 +0800
Message-ID: <CAEUhbmUqJdpuqvZ6V3s9eeW=EUVXrnjbF5GRmygwaZhMGG-6sA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
To: Atish Patra <atish.patra@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Dec 2020 07:21:52 -0000

Hi Atish,

On Fri, Dec 18, 2020 at 5:48 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, we place the DTB at 2MB from 4GB or end of DRAM which ever is
> lesser. However, Linux kernel can address only 1GB of memory for RV32.
> Thus, it can not map anything beyond 3GB (assuming 2GB is the starting address).
> As a result, it can not process DT and panic if opensbi dynamic firmware
> is used.
>
> Fix this by placing the DTB at 2MB from 3GB or end of DRAM whichever is lower.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  hw/riscv/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

With this patch, 32-bit sifive_u still does not boot kernel with the
following patch applied on 5.10:
https://patchwork.kernel.org/project/linux-riscv/patch/20201217074855.1948743-1-atish.patra@wdc.com/

Command I used:
$ qemu-system-riscv32 -nographic -M sifive_u -m 1G -smp 5 -kernel
arch/riscv/boot/Image

32-bit virt cannot boot the same kernel image with memory set to 2G either:
$ qemu-system-riscv32 -nographic -M virt -m 2G -smp 4 -kernel
arch/riscv/boot/Image

Regards,
Bin

