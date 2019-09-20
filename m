Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBO08-0001h7-9Y
	for mharc-qemu-riscv@gnu.org; Fri, 20 Sep 2019 14:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iBO04-0001dA-ML
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 14:51:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iBO02-0005Qa-NP
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 14:51:24 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:43112)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iBNzw-0005NF-Rn; Fri, 20 Sep 2019 14:51:18 -0400
Received: by mail-lf1-x143.google.com with SMTP id u3so5728404lfl.10;
 Fri, 20 Sep 2019 11:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/r1z3XdozrSg5hiEdNJT8S+6KbDkz/+rhir16zqnjxc=;
 b=GwLQyrjc4A+E+3Bc1eLxC1I1i8dwbZSRCdX/jJ2eNBjhtJ9u4QNJ/zNcgbWqyVSTpc
 VbmrW6/7+MzCwbmCMoK7rqPgwAYHUc1vpRFYVR7xgDVU0ugOjQbltPytyDHVdHxZAwwd
 juNSixuB/QZaaojLG6lpOOPpOFxZLe/cKs/52oPf4QUE3ySP3t/FNbSUS9EwBVn7yx1N
 tk0IYd7XHjTvt3QX6jstUEAbqqXPqOcn5nOwRWfQJOBLuaBVYOpzLtSIb2jmBVwQnuCS
 rStI9Qx/0Oaq8N3qIUA2+Am5YCPmQuOc+mWYP2Vo5BZJs+xuxWQdc82HRlrFncYK5BUT
 siAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/r1z3XdozrSg5hiEdNJT8S+6KbDkz/+rhir16zqnjxc=;
 b=g0K9kKBUaQQubWpylnMlyO4PLfaONpf4/pmcoUqbVS+ZTJX0FDM7Gv2uD4mDbKI7wX
 GKTBQplTi9SMuFO9/zxgoznCr/QxGyzrUIOtpH1/egs0l8fe1sOqJF4Tu6cPUTjXbPFx
 pOrdP2yiSpg0hFxqLEK6qVw+CP+Y5W5Cpsl6YeT68ReN4QE6rfgaOjEN7tlaa8P85HXn
 Ka+DEy87PLMRsV4DaRlg46kKwVsWP+qeseYARO5HpQ7N6hoNHyhqU6+MENBYJYIl2jru
 kggKEi5VDhgYoW7V46tWt8/Dn5Yl8ymj0a0UhvnjgBjwfvOCTTJmTq6bb4sjVCIaXMpq
 Y+wg==
X-Gm-Message-State: APjAAAUyYnz5dqfKtEUYPPndndBvFPvfpje3vMpB1K5Cj/14ERG1ciMS
 o38IPsq4pqw/dGwS+us6mItWN085uS3x3d6GLBM=
X-Google-Smtp-Source: APXvYqxUGyiFKRPn/dPvuVurZwX+bltpfjaWpomfjfN8ALXfi8JtybY9KdBWbskTfGZ0EWQ0ie172QpBPhrYe5WAF84=
X-Received: by 2002:ac2:5e9e:: with SMTP id b30mr9599479lfq.5.1569005473978;
 Fri, 20 Sep 2019 11:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <1568971142-27979-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1568971142-27979-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Sep 2019 11:46:38 -0700
Message-ID: <CAKmqyKMa-kG7zrjFJ7aZd1Ey=7sCRHj2wEkukFz4GkT5gR0fKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: sifive_u: Drop "clock-frequency" property of
 cpu nodes
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
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
X-List-Received-Date: Fri, 20 Sep 2019 18:51:26 -0000

On Fri, Sep 20, 2019 at 2:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> The "clock-frequency" property of cpu nodes isn't required. Drop it.
>
> This is to keep in sync with Linux kernel commit below:
> https://patchwork.kernel.org/patch/11133031/
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c         | 2 --
>  include/hw/riscv/sifive_u.h | 1 -
>  2 files changed, 3 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 9f8e84b..02dd761 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -151,8 +151,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
>          char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
>          char *isa;
>          qemu_fdt_add_subnode(fdt, nodename);
> -        qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
> -                              SIFIVE_U_CLOCK_FREQ);
>          /* cpu 0 is the management hart that does not have mmu */
>          if (cpu != 0) {
>              qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index e4df298..4850805 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -75,7 +75,6 @@ enum {
>  };
>
>  enum {
> -    SIFIVE_U_CLOCK_FREQ = 1000000000,
>      SIFIVE_U_HFCLK_FREQ = 33333333,
>      SIFIVE_U_RTCCLK_FREQ = 1000000
>  };
> --
> 2.7.4
>
>

