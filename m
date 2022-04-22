Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhheG-0001pj-3w
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 20:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhheE-0001nI-08; Thu, 21 Apr 2022 20:59:46 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:39718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nhheC-00086X-7K; Thu, 21 Apr 2022 20:59:45 -0400
Received: by mail-il1-x134.google.com with SMTP id d4so4142171iln.6;
 Thu, 21 Apr 2022 17:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y+riBp7JjM1E2hU2/qcI/ceDeTPtrSLbYpFX5LvQlgI=;
 b=YcdWB7GTBjsoaUFCA+nCCPZOVpvlDI7o2D4r7+MjG2IcRcW25zSVeINboeZl2oMQNU
 EZttM2xWDGGXlNO+L90g1XMVpinKD7IOGL55QYwOFo89DBayZOXbitAC1cMia62LOC9y
 WqGF4fvwNNwa+jGQK2+SSQ9leMl+iGZleTwM/NmvVl4dhyKW/CwKdu9P+QQEwtVl/5Qu
 1VvJgOcyN2dBUBx4CgrBc+Lfc47WegE6hg4+5MWdP+14JbvG4/YPcMZcATj/2Iwe9rfZ
 ZKQqgAQbkywcIQhoYZ+hv7b8laI02bohiwJVb1gJXMc5tdc8Yfle4o9nZ/qZYxNPzwbh
 Hqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y+riBp7JjM1E2hU2/qcI/ceDeTPtrSLbYpFX5LvQlgI=;
 b=CFuiT/xGXQOn/ZPugjcr12ElfYucWShbYl/c6riclNYy4UkYRwxPzoj4//RjpHF9TY
 ZIrXH8vsX06MWkffmol/uMHB4HD5aSbwwVP/QqR/EU4rMOypyi+bcoaOYgtfYRRpHU+p
 CXUzZ23U1UtiaSuOT0dWUOd5YVW6cxMUAHunwwm3kX1bSw3XrFKzicMgntENAUGh5SS7
 RsMzI3Gjs/GZgtM7IOi0ry3it2G7TzxKFLxjPiZEw/Bh4Gv4gro3ll5IhX/yJYSp85pJ
 0zDJ0xLBJmMaNnRnPe3fvhzOqJCbS/iOxOLpk8sRE4HCXhp++lBsdCmxkeGZmuNU3kxY
 22bQ==
X-Gm-Message-State: AOAM531FcELVFSP+DzeTSfq1wfmwI60nqbIdx1qvfAxGod3t/Ol8nMGO
 y+wDguivFbzB98XQunz0rOWfzk5Kaxq80RCpCK0=
X-Google-Smtp-Source: ABdhPJyxlrUpxLgRq7WssmqaaQ5t5QhQh+BNvF8hAD23iJVq89+6+L/PfQe6IlukThP/7DprPt42rY9Wd2zWq105d0A=
X-Received: by 2002:a92:db0e:0:b0:2cc:2590:767b with SMTP id
 b14-20020a92db0e000000b002cc2590767bmr989829iln.260.1650589182781; Thu, 21
 Apr 2022 17:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220421055629.1177285-1-bmeng.cn@gmail.com>
In-Reply-To: <20220421055629.1177285-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Apr 2022 10:59:16 +1000
Message-ID: <CAKmqyKMrTe-Jgai8AO1mXmiW6iyQjD2G9myYGi8BRYgFBEdgUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/riscv: spike: Add '/chosen/stdout-path' in device
 tree unconditionally
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Fri, 22 Apr 2022 00:59:46 -0000

On Thu, Apr 21, 2022 at 3:57 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> At present the adding '/chosen/stdout-path' property in device tree
> is determined by whether a kernel command line is provided, which is
> wrong. It should be added unconditionally.
>
> Fixes: 8d8897accb1c ("hw/riscv: spike: Allow using binary firmware as bios")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/spike.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index d059a67f9b..1562b000bb 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -174,10 +174,11 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
>
>      riscv_socket_fdt_write_distance_matrix(mc, fdt);
>
> +    qemu_fdt_add_subnode(fdt, "/chosen");
> +    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
> +
>      if (cmdline) {
> -        qemu_fdt_add_subnode(fdt, "/chosen");
>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
> -        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
>      }
>  }
>
> --
> 2.25.1
>
>

