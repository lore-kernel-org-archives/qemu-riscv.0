Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hi3OB-0000yp-2v
	for mharc-qemu-riscv@gnu.org; Mon, 01 Jul 2019 16:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3Nz-0000ts-Rd
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 16:58:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hi3Nv-0006qb-16
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 16:58:49 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:47009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hi3Nt-0006kL-S5
 for qemu-riscv@nongnu.org; Mon, 01 Jul 2019 16:58:46 -0400
Received: by mail-ot1-f66.google.com with SMTP id z23so14897249ote.13
 for <qemu-riscv@nongnu.org>; Mon, 01 Jul 2019 13:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Po+hiKTXl/WW1dV5JyskiYwMafDOR2b4UMvJ2DcVI6w=;
 b=DMH/Q39r2kVmR+yR6bIkb3m2K6AsAlftGzdRwC4X0Sqo+rRxhb//JORU1G70gPwXeS
 Bq+vPI3RxA5PeAxqCjlBJN92op1jcLvFi988TwoqS96uEz79O6IG/Xvk6StrvgtTgEMg
 dpIvOuu69N/p2QHyIeKc7qYohUQWhIAixAHQyBn7axkjhRzzRuXW3UXzyX0F+hGec+uv
 r8y1CVEO54GfEGNTSHJ2o8T96HOtDXlAvP2md5cRJ1fi8n9pSDpSTkMkP4zyTRagkBB8
 4URLY5qGMb+36LoCWUQCsUk2YZ/iRUrl2Nexq94/xl9wD9MRrbKS9e6amCLPIVjTI0cm
 v/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Po+hiKTXl/WW1dV5JyskiYwMafDOR2b4UMvJ2DcVI6w=;
 b=DAGTb2vT/xGa7zMaJ0SKjrtU5zBdEZ1Bs3101YXYX21/qgiTEXL9d1Es7p/h0s+xYH
 pxThb2Au0k7pu0nQ40FCKJGoMs+aICb/DesWz1gO8n3io1BY6Hkq4yyVzlzMpwVCWF4o
 9APcnO+2kr7ZCbUJz3lbcnXryPfoLKNaEcdyECJGRH8Gc9jQnUzD30OON3q72Nlsqkif
 /7Ekyxb/pWgJ+C6Z2d+SK3q07P5Z/MLst0usr0CEBTkcV91edXO1JFQLcrpWdjHOLvhG
 jeqm/2csVx09DU9byWnq6nGSJRfFc2w61Y8j4Zn5bvUWwyQ7/XGxZBm86cRySLHNHTCm
 rMUA==
X-Gm-Message-State: APjAAAXIDD3ZBUYt2txgzMAybGWYTxzOQQpWSBW5jwH7WazV44e5mRkX
 vQyTad62dEIl1O+M6LWDtLljiKK9NcdId4uB5AuJ1g==
X-Google-Smtp-Source: APXvYqxA15DfX9/7DbGg+LDBhBbxkNdJNSZN8gzwLSPFJ9qy4sJTdUIKX7wGQBOe9P0AjlbL4CqhCGeygbTPycs32bo=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr21350613otk.232.1562000091810; 
 Mon, 01 Jul 2019 09:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190627152011.18686-1-palmer@sifive.com>
 <20190627152011.18686-34-palmer@sifive.com>
In-Reply-To: <20190627152011.18686-34-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 17:54:40 +0100
Message-ID: <CAFEAcA8sscJQ2GCwL1gM+EcRtfHQb1v0BwORt6ncH54x51TCVg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.66
Subject: Re: [Qemu-riscv] [PULL 33/34] roms: Add OpenSBI version 0.3
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
X-List-Received-Date: Mon, 01 Jul 2019 20:58:59 -0000

On Thu, 27 Jun 2019 at 16:24, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Add OpenSBI version 0.3 as a git submodule and as a prebult binary.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  .gitmodules                                  |   3 ++
>  Makefile                                     |   5 +-
>  pc-bios/opensbi-riscv32-virt-fw_jump.bin     | Bin 0 -> 28848 bytes
>  pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin | Bin 0 -> 28904 bytes
>  pc-bios/opensbi-riscv64-virt-fw_jump.bin     | Bin 0 -> 28904 bytes
>  roms/Makefile                                |  48 ++++++++++++++-----
>  roms/opensbi                                 |   1 +
>  7 files changed, 44 insertions(+), 13 deletions(-)
>  create mode 100644 pc-bios/opensbi-riscv32-virt-fw_jump.bin
>  create mode 100644 pc-bios/opensbi-riscv64-sifive_u-fw_jump.bin
>  create mode 100644 pc-bios/opensbi-riscv64-virt-fw_jump.bin
>  create mode 160000 roms/opensbi
>
> diff --git a/.gitmodules b/.gitmodules
> index 2857eec76377..7a10e72e09cd 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -55,3 +55,6 @@
>  [submodule "slirp"]
>         path = slirp
>         url = https://git.qemu.org/git/libslirp.git
> +[submodule "roms/opensbi"]
> +       path = roms/opensbi
> +       url = https://github.com/riscv/opensbi.git

It would be nice to state the license for new blobs we're
adding to the source tree... In particular, I find the
readme at https://github.com/riscv/opensbi a bit confusing
because it says it's 2-BSD but also that some parts are Apache-2.0;
the latter is *not* GPL-2.0 compatible. That makes it not completely
obvious to me that we can ship this with QEMU.

Also, new git modules in .gitmodules should be qemu.org
URLs, not random external ones. (ie, we should set up
mirroring of any new external repo we start shipping
code and binaries for). We can set this up and fix up the
gitmodules file after the fact, but the ideal is to do
it in advance rather than afterwards.

thanks
-- PMM

