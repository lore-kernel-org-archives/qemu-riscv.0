Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hdSvu-0004gq-Jm
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jun 2019 01:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36505)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <anup@brainfault.org>) id 1hdSvs-0004gd-Rm
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 01:14:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1hdSvr-00063u-Vt
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 01:14:52 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42651)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1hdSvr-00063C-Je
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2019 01:14:51 -0400
Received: by mail-wr1-x441.google.com with SMTP id x17so1786421wrl.9
 for <qemu-riscv@nongnu.org>; Tue, 18 Jun 2019 22:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VbJYxAtvHmysQDILbBP8+ZL3Z+mNXu2CIculfcaMCJE=;
 b=uXRJ9eeK8AgCk1YYdEhddYRWEEs4M8LoFcMv+hhui2I2hzELj4wFBjtHIjneiDZU60
 9IuV3Xc//UtozzN1ZfEp1B39PkqR9geJ/CbNP46tL42sejaiAbgMn4Lc8tO02N3GPZmi
 dtqIUOo3jyvcljoFg6GpI65IOSbFHL4cIxClc9nAg2mz5MmMwYpBJdou23MxdQVkK5X6
 YO00J1OKWrt0yOExut8R/sXyWYtnbyibeaGOl10+Q5nb8hcHjSEMsQwSSJsZOQXzXn+S
 36PK4AKelwXiB2oJd76zVPe/cMiDSIGyXN3EHzky1wlID6RepuvFyVTY527MoxEENufm
 iVCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VbJYxAtvHmysQDILbBP8+ZL3Z+mNXu2CIculfcaMCJE=;
 b=fzQRPfoQ24YWqq6/E6VeVwV66bjinAsPr4Uw08oP9oqXNrQ5kOIDcl5zd7foXuwU4W
 nxKCnkcrykJ6TQOHDd+3gC5nO+giZsXBzg8rU2JwqL4O6+yNnQfzJnQwF4d6gLdPx5KU
 G4VUFIGcNivpOyqWp2dwWxG8IkbTn7qFmAKZaKaGGtX+Mtc+lDdFekem8m6FeIhtdRcb
 25hSfb2c+PqWtFGiaiOFUMxhk9z8VUzzLd0FvzFUpMHUrIYsBPSoqdppmWU7xlgDl94Q
 vD41GSC+QtytvSwlN3aunS6DHClI7R4X6CpEuRGWTe+pA84QPVW12wReWjz1JYwUCplQ
 lMgA==
X-Gm-Message-State: APjAAAXfY0edw+/6WAhb8azMF7TIk9pGbNoUymADtXFixH7DoerQIqNw
 mO2tliBSpKIU7Mp4YNbFMJ3LSVGSsFBZLd49LXYq8g==
X-Google-Smtp-Source: APXvYqy/A/d+8Bio1Pp+SyCfrrXokFHwnDMPzBlGtlN1vmhcWY2fx3ugzlxzop+9RcBBCfyxLFjz2XQ7ycFo+QJKvys=
X-Received: by 2002:a5d:5448:: with SMTP id w8mr51324461wrv.180.1560921289422; 
 Tue, 18 Jun 2019 22:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560904640.git.alistair.francis@wdc.com>
 <2fd2fa66cf561d8041f75351c28ed025828c56ff.1560904640.git.alistair.francis@wdc.com>
In-Reply-To: <2fd2fa66cf561d8041f75351c28ed025828c56ff.1560904640.git.alistair.francis@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 Jun 2019 10:44:37 +0530
Message-ID: <CAAhSdy12uKV14cdxvUniSLFw_iF5WNKjoLCanS3Bs=33w-c9xA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-riscv@nongnu.org,
 alistair23@gmail.com, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-riscv] [RFC v1 4/5] roms: Add OpenSBI version 0.3
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
X-List-Received-Date: Wed, 19 Jun 2019 05:14:53 -0000

On Wed, Jun 19, 2019 at 6:24 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Add OpenSBI version 0.3 as a git submodule and as a prebult binary.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .gitmodules                         |   3 +++
>  Makefile                            |   3 ++-
>  configure                           |   1 +
>  pc-bios/opensbi-riscv32-fw_jump.elf | Bin 0 -> 197988 bytes
>  pc-bios/opensbi-riscv64-fw_jump.elf | Bin 0 -> 200192 bytes
>  roms/Makefile                       |  17 +++++++++++++++++
>  roms/opensbi                        |   1 +
>  7 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 pc-bios/opensbi-riscv32-fw_jump.elf
>  create mode 100644 pc-bios/opensbi-riscv64-fw_jump.elf
>  create mode 160000 roms/opensbi
>

The OpenSBI firmwares are platform specific so we should have
machine directory under pc-bios/ directory

So for virt machine we will have:
pc-bios/riscv32/virt/fw_jump.elf
pc-bios/riscv64/virt/fw_jump.elf

Regards,
Anup

