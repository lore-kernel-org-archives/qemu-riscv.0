Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyclT-0003fN-AQ
	for mharc-qemu-riscv@gnu.org; Fri, 16 Aug 2019 09:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41761)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclQ-0003b9-Hk
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 09:59:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hyclO-0003kf-Kc
 for qemu-riscv@nongnu.org; Fri, 16 Aug 2019 09:59:32 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:34716)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hyclK-0003fw-FS; Fri, 16 Aug 2019 09:59:26 -0400
Received: by mail-ed1-x543.google.com with SMTP id s49so5232121edb.1;
 Fri, 16 Aug 2019 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ftc5Pkkjs9SZE8+IqHqOw8kpXRYVsPDy2BShF94kCi8=;
 b=FbcpcxnAssT0GHamTs+G2e48zTbEMQ8fjL4+ZGQYDrOsieE3nQg3IXmq3lBp7p2+y6
 w+ftHTxbhuLFHM/DD3QDC7SVErYZUXqRP52plVoCcl6TQY+ydG5e3y3fO3wlstBSLHnd
 jZf++scNgnrD2FbiKRTSRnbYSWIfqCOFO3/z+0C++9opW/nXaS+G8P5spu5BAESClfEb
 w/LnUCJ4j6m2WhtYZ13C90Y3PxGMnEB28yi3Y/HKMJBM7ZUtSanGJVBMDWC7GkvzNUxI
 UZMgSeRw2i7kfMPy5g0GcWM+RKDCjcyKtXCmbfGP4l75gdj2ti88d0JXR5weErDDrU60
 zJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ftc5Pkkjs9SZE8+IqHqOw8kpXRYVsPDy2BShF94kCi8=;
 b=Xlu2fpSOWZEFrH0dmuVFWk7LOiuOUyCXTkqCJcIBfH7IUTWhS/dypzguiWQ/gPHMu2
 QiTqXHx8afoAVwUmvyNuwb85tMBLOwzsc5SE4pe5hlBS3xUd1FBjrEukSPjF7rY8GqPg
 0ggfNRyY66/JmQWvEctcqrv19fQDzFkzzACqk1GBlcmcCQX5SBk1McNYnfwJo7XNXZ3G
 ehFlSr92DkFFN4reN3zWvJT0Mse42kuoRstI71OWZmD42lhv3LSki5TbkMqZj1jeY+Vw
 KG4fqclRfFaI2EnmPuFexai8oUH7py5VUCEXKrEXQDt/CDgW/KeXSMToZGE/lcYlJLhH
 ff+A==
X-Gm-Message-State: APjAAAV64IsyimA0f+xwJsgGXbWPyZST+q+iscDdBo7MAqyDeU1v3paz
 LHwb8szpd5KlKjzWytuyOAU+2D4kEWEKlMcmdII=
X-Google-Smtp-Source: APXvYqxicENMCp/mqmIrvnPB4FLJ5gGh2XadRi81m1tGmSMG/aDX765FRqK06jqVryWv5Eo+Q3x/Y2wgyd2f+JD1p8k=
X-Received: by 2002:a50:fb82:: with SMTP id e2mr10857656edq.15.1565963963559; 
 Fri, 16 Aug 2019 06:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565904855.git.alistair.francis@wdc.com>
 <dd11f1aa023aea048d2af7f2f7822895b05d238c.1565904855.git.alistair.francis@wdc.com>
In-Reply-To: <dd11f1aa023aea048d2af7f2f7822895b05d238c.1565904855.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Aug 2019 21:59:11 +0800
Message-ID: <CAEUhbmWr-4z0BwHOE6NyM+eVz3A9gb9+ymALuJqZQxFWvsEo0w@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 3/7] target/riscv: Create
 function to test if FP is enabled
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
X-List-Received-Date: Fri, 16 Aug 2019 13:59:33 -0000

On Fri, Aug 16, 2019 at 5:42 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Let's create a function that tests if floating point support is
> enabled. We can then protect all floating point operations based on if
> they are enabled.
>
> This patch so far doesn't change anything, it's just preparing for the
> Hypervisor support for floating point operations.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>
> Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>
> ---
>  target/riscv/cpu.h        |  6 +++++-
>  target/riscv/cpu_helper.c | 10 ++++++++++
>  target/riscv/csr.c        | 20 +++++++++++---------
>  3 files changed, 26 insertions(+), 10 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

