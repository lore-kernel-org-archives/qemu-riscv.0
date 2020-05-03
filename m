Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jV6S9-0008QX-M9
	for mharc-qemu-riscv@gnu.org; Sun, 03 May 2020 00:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1jV6S8-0008Oq-LZ
 for qemu-riscv@nongnu.org; Sun, 03 May 2020 00:42:08 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1jV6S6-0000Da-2u
 for qemu-riscv@nongnu.org; Sun, 03 May 2020 00:42:08 -0400
Received: by mail-wm1-x342.google.com with SMTP id y24so4924192wma.4
 for <qemu-riscv@nongnu.org>; Sat, 02 May 2020 21:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vF8VFq5Qsbt5WQdDilLmnB4xmsmF+yCtyKsS/XLhhkU=;
 b=T50JLXcxGwNnDsKbtrfHZeqKE9qtWPTj/ZvaUsGiLsYp00jqQ8VKfd1PT+LfdseQKa
 rEXtg0U18gOlKUhlYZVhG4VnWWp56n40/EsZldfWqdBSbKe0++v0l3RpKLpUAZo0HT4P
 eah7eRYIFjJJV7pPORJYyNZKX9f4kA/Zj5l17dXNNEjMcNy/x0vt4fpb0Yjkx3vCITCM
 /U3GlXxhT0/o0j3erF+A/tq/8dkXIWbJS6jv1B1gIsanYFcAE1oL6IQe0d6jwxnVCmNj
 5f7lsEDxcMNE2cNmGNyWoOGMi9dJWCr6fxqYaFFQM+yNhm8B5Nrn7kvBae4vXT+r2j1x
 HaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vF8VFq5Qsbt5WQdDilLmnB4xmsmF+yCtyKsS/XLhhkU=;
 b=R/SHuvggg7fzomjqtfOilIkcAYhIlcF2xsTNQcF/TMOnBq4zSRp8Ew5387ygXUJS3F
 umNBXXX4Sulf/c7lPL1KaISnkeaQ+0odKPnzs7f7ejmnAYdsJo/v/dxiEtHEwW5x31+S
 Gv0S9UawUN3CAe/75finDpabdRH4EpyuV5O8ea7TrmJbmCXDY0fuVrxmNvjAKTQ+8RYV
 k44xQkwy+h7SbU+OSyIUNQ5DDgTkUyCdUqyyBjFekRwCuLsP/j9lXEceiZjvbdXwDn2Z
 GTMBeAJOhmm9wIbLkKbDmU29EMCjczbtYp5PVDGxw7XbbeamT4cIu+3aRworQCAtR1NS
 AYJw==
X-Gm-Message-State: AGi0PuYDej1NsxrlrGgcjUC12JIWewVOhEtathE2wszcuFXm+XQopp3K
 MVeLvBP9xXfNfHotO0StGCd/z0xAJHTE+p/fVH1FCQ==
X-Google-Smtp-Source: APiQypL7aDOQPD6rYKPBuM+O/gupsel4rX1e8pOKNCAo3NLGbju02VgLLqkuZ25x9rNhEwjlm/wQI42se+rngzzXsrA=
X-Received: by 2002:a1c:4144:: with SMTP id o65mr8044675wma.78.1588480924523; 
 Sat, 02 May 2020 21:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <1588348254-7241-1-git-send-email-bmeng.cn@gmail.com>
 <1588348254-7241-5-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1588348254-7241-5-git-send-email-bmeng.cn@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 3 May 2020 10:11:53 +0530
Message-ID: <CAAhSdy3hfktuhOg36=8dOM06VLURefcf1gVxw_bKrWzmAwpGnA@mail.gmail.com>
Subject: Re: [PATCH 4/5] riscv/spike: Change the default bios to use generic
 platform image
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::342;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 03 May 2020 04:42:08 -0000

On Fri, May 1, 2020 at 9:25 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> To keep sync with other RISC-V machines, change the default bios
> to use generic platform image.
>
> While we are here, add some comments to mention that keeping ELF
> files here was intentional.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/riscv/spike.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index d0c4843..6f26fcf 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -45,10 +45,15 @@
>
>  #include <libfdt.h>
>
> +/*
> + * Not like other RISC-V machines that use plain binary bios images,
> + * keeping ELF files here was intentional because BIN files don't work
> + * for the Spike machine as HTIF emulation depends on ELF parsing.
> + */
>  #if defined(TARGET_RISCV32)
> -# define BIOS_FILENAME "opensbi-riscv32-spike-fw_jump.elf"
> +# define BIOS_FILENAME "opensbi-riscv32-generic-fw_jump.elf"
>  #else
> -# define BIOS_FILENAME "opensbi-riscv64-spike-fw_jump.elf"
> +# define BIOS_FILENAME "opensbi-riscv64-generic-fw_jump.elf"
>  #endif
>
>  static const struct MemmapEntry {
> --
> 2.7.4
>
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

