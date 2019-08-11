Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hwrVQ-0004br-4J
	for mharc-qemu-riscv@gnu.org; Sun, 11 Aug 2019 13:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hwrVN-0004Wa-VX
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 13:19:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hwrVM-0001xh-2y
 for qemu-riscv@nongnu.org; Sun, 11 Aug 2019 13:19:41 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:42238)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hwrVK-0001sP-2x; Sun, 11 Aug 2019 13:19:38 -0400
Received: by mail-lj1-x243.google.com with SMTP id 15so4573091ljr.9;
 Sun, 11 Aug 2019 10:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G+N2YL8BwAixur1dtOz/BBrKukS7VJWTaSyTlWenmcs=;
 b=FcoIkSpPKics0MPSc3T4hNdO5xSQK1j9pST5Zlt81GdXTdl4l9Pt5JDhTLVfjEXYQ6
 Zd14kjhM/bOhylCq4XGGbh1htdLgyGrJ3XBQycoYZs3xjJiih4lHSg4j9ZwJcQQ+DxpO
 fzzwDGX4AYSb8Zw0B2jrqaEb97+5WFNAMqU2hvV2AzJQUGpPIgAbjb8yZnYjqKgeGTqG
 sFieiIh3H/BEb36DkpuBs4JNVQS17CJ4FfzQ9woOAtnJWH2rbipMDH9MLmCmPkCeW01F
 GU1J7jo7kwUhUWt06mo2fNqluXLa2plLX1ZSFzMmwJ8YcORPCWQP2wjz8OHlb3//W10m
 szvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G+N2YL8BwAixur1dtOz/BBrKukS7VJWTaSyTlWenmcs=;
 b=K/unQ9bIzOOfUdvuvMmuJOIT+MDaoixCuS1z/o2ug28EPT13uaiEAlL9HV895KHZPQ
 b5YXmtZlyjF1wV3NgOHetXgghVoC4lvBgOmxJjl+PHmVDxw4RrHjnwgF+PV4vNBTCJ4y
 fgu/hPTQCbHwzPYiGotC9AVcPU47VKC0TWe1mKdfjpuQ4bZ9zYY2EbhUCBU0PyxNhfql
 DtraR13mID266Kwa+qV/FXQmn6Uj/5djQNEL6rkxzG5d83XyjxCcsw0ZDnyVZJLXgFxR
 e7DVSrv+TVWWtdmGPtx7MBTVWTGyDRkxQtDz0w2Z9RTOp0OGHmmDHfjh+9UAMyvC1vij
 JwXQ==
X-Gm-Message-State: APjAAAUS6kND65OCTszuvrQ//fr9zwXjpMXb5up3ke+b24TNSO4bvuiI
 kEJZrquO6cSJD1GQAeoS1DCwTtDPm7QIdcNFD6I=
X-Google-Smtp-Source: APXvYqyJOvuZXiVmfMyhdal/sMhdm0hFr4XS1a0X7kEZ/HWoD4tsTtfrE5AnncrtyXa758ad79mJTo5kZsEH17DdCg8=
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr16660252ljj.146.1565543976825; 
 Sun, 11 Aug 2019 10:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <1565510821-3927-1-git-send-email-bmeng.cn@gmail.com>
 <1565510821-3927-23-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565510821-3927-23-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 11 Aug 2019 10:19:09 -0700
Message-ID: <CAKmqyKOGFWPbx=adfp2A2nNPUSMc0oOW0ohcAryo1DG7gLCbRQ@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 22/28] riscv: sifive_u:
 Generate an aliases node in the device tree
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
X-List-Received-Date: Sun, 11 Aug 2019 17:19:42 -0000

On Sun, Aug 11, 2019 at 1:13 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The Linux kernel SiFive UART driver expects an aliases node to be
> present in the device tree, from which the driver extracts the port
> number from "serial#" in the aliases node.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  hw/riscv/sifive_u.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7eb2b7e..0c1a89f 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -284,6 +284,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>      if (cmdline) {
>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>      }
> +    qemu_fdt_add_subnode(fdt, "/aliases");
> +    qemu_fdt_setprop_string(fdt, "/aliases", "serial0", nodename);
>      g_free(nodename);
>  }
>
> --
> 2.7.4
>
>

