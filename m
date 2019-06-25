Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfhcw-0002ds-8n
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 05:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hfhct-0002ZP-Oq
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 05:20:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hfhcs-0000bQ-Sg
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 05:20:31 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:34320)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hfhcq-0000St-HU; Tue, 25 Jun 2019 05:20:28 -0400
Received: by mail-ed1-x541.google.com with SMTP id s49so26150004edb.1;
 Tue, 25 Jun 2019 02:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mBnU8emzgSKaSu5jklqTb1oBzlbL+zoEDZxrzwhlNaE=;
 b=vR/F/KtoLa3wvDVLgw2z8FPDZeCc9Fc5bywf+02FP0tZUY3VrXQDtBxjCiXrbTs9Wr
 joyCHEKCqAivwx4/qcAFU/XNuwARaYioQpkLKoHDk4Bgfa5j5BTu75zEi36Xptg0BAdV
 oTo0xricH3cxX7Bpn5vcanzcNGcbPxoKCpB1muwA6KEO+1xcmr/QoOqnmbXEVsAfEHgD
 pzb6KdNzh5Vwlq+tr2F4MtsPW2w+Gr7QB08RGeXg8o91NxxUeKzNRQeHPhp8aYT5cRO1
 iUpaEWIGzhXQwR2mppbkvQs+bAUIzr1LNNRH1XGyJusqKfr+7byFoyOmcFVWbDqffHw9
 onGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mBnU8emzgSKaSu5jklqTb1oBzlbL+zoEDZxrzwhlNaE=;
 b=t5BUl9D2HnIISsgNZPIT6jxknlDBZO1M45CqfXko/GUwDurF+TUIdhwCCY58rD6pCt
 Fh+YbTpdwLrP2toWNIF9qTUK6UA9C7le7EbnA8f3VUOziuBixGU0XyBJ8RR+G1Hi7Uny
 esSyBF/KgpmVlI3NR0NlaBX80bJf17ou0myAitfz2gUN3T/rNcOT3J+3xLfPOFw5BEmY
 XC3C9TXHdSPfnzuMdJ1BwKHvRmkLAy4FON43mxH4FE3KgxuwMQpVL6pVvtMrRiYJuNI9
 jDBq/pKxnZAYtwj44SEr4szbRTCOCHxcIRIfHQGYfeaNy/5dxbKAeder9e0+msIi2rM0
 PdfA==
X-Gm-Message-State: APjAAAUNYh9uml2Prbr9pgwRcrluxXcjJkAGmCDxMkcoCT50bQYWRV70
 WH/oJrRbXLczYA1X76I0tz0dhJliGj+d3ZfCGJM=
X-Google-Smtp-Source: APXvYqz71ZYIsjUsygMx0mrym9NQvyz+/ISoeGQ1kaJtGfZP7i9QgCEWDGIW9IhbZJA5EDHbbB+Kj/f32x4XQtj6vhk=
X-Received: by 2002:a50:c28a:: with SMTP id
 o10mr100739365edf.182.1561454425573; 
 Tue, 25 Jun 2019 02:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561414240.git.alistair.francis@wdc.com>
 <03f453d45b8565472386fdb7403b6713ddbb8683.1561414240.git.alistair.francis@wdc.com>
In-Reply-To: <03f453d45b8565472386fdb7403b6713ddbb8683.1561414240.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 25 Jun 2019 17:20:14 +0800
Message-ID: <CAEUhbmVyDyx-YPdZPj2sj_Xfc1PDbRLO96nTWRQF4ax3+ofWLg@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 2/5] hw/riscv: Add support
 for loading a firmware
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
X-List-Received-Date: Tue, 25 Jun 2019 09:20:32 -0000

On Tue, Jun 25, 2019 at 6:19 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Add support for loading a firmware file for the virt machine and the
> SiFive U. This can be run with the following command:
>
>     qemu-system-riscv64 -machine virt -bios fw_jump.bin -kernel vmlinux
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c         | 26 ++++++++++++++++++++++++++
>  hw/riscv/sifive_u.c     |  4 ++++
>  hw/riscv/virt.c         |  4 ++++
>  include/hw/riscv/boot.h |  2 ++
>  4 files changed, 36 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

