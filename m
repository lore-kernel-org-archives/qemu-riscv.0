Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iKILu-0001xz-Fi
	for mharc-qemu-riscv@gnu.org; Tue, 15 Oct 2019 04:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59269)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iKILr-0001wJ-RK
 for qemu-riscv@nongnu.org; Tue, 15 Oct 2019 04:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iKILq-0005e1-Vo
 for qemu-riscv@nongnu.org; Tue, 15 Oct 2019 04:38:43 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:41970)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iKILn-0005ZM-NF; Tue, 15 Oct 2019 04:38:39 -0400
Received: by mail-yb1-xb43.google.com with SMTP id 206so6301747ybc.8;
 Tue, 15 Oct 2019 01:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ry4JHBjbHFxt12FOcTkQZiN+903n59CRN91yPPfkTw4=;
 b=TbKJIkoiufOd3ZQ0/7xlpaYFkSReAqk3DI2fJC6S1cND1maAPgwpGQlfZN3vdtT4pw
 ODjZuGP1KGzXm+H+bLfB0+Meq8rRKec5QMty1oDBePiniiP5HT0H5dmvqC3LiE051wmx
 weeWdRW57ZvYgajiPz2ZPxnOYwOefAtIqWMOpV75B42nCHHWNx82kE0pGr9ngeKB+HXK
 SERCx2E23tP3ikhG2vhc+nuLsHmcOaO64IfnvrHT6PPs8em3zgnpAWrBFi/HPXSLvGiu
 9v1mhNq7z37ATepdyd30a8XHegCzDwWu8LuQKpUvoBq/U45iTD3s0uksr7GL2lUcG2dl
 SbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ry4JHBjbHFxt12FOcTkQZiN+903n59CRN91yPPfkTw4=;
 b=oBqsVzqZivYPwY4CfoWwTV2Gy9pQRbAtkE477sW/2I/oGeYiCNMFpsD9zXQjP5D0fU
 pI2R7XQbf6eiJjSmpt2b1C39OjrTHKrRgjQ+S8N9cvKqf1rw0gH8CKksQV0s3xEIFOd2
 hMCIHUNjTjmZ/IflnoxpIhMUqIdfBTQwq+HCXFDDvVWX+ayCDu6DzLnFZQuMEQwo26Fs
 zD0dCxZMFfT9qSATht12oFedAGbxFS7X7EfQ7tJNXQzTHXQCUt4boDYnt8hB+dgc+7L8
 DDhRMlHjh3IX7zcAmmhNi62XKEtc2d2NrtP7xskx3ilNXoAu4exuizbj76eHk773/dxH
 FJBg==
X-Gm-Message-State: APjAAAVXEA9ueyg79WGU8zIZfq2dKvSdZIlheI3D1EiSsEb+z/YGwnsZ
 VbfVirllDMX8WmCJvGETCX+zeywEEQQGrVEDjzU=
X-Google-Smtp-Source: APXvYqwOlTp2Bvnxdz2WlBTRO/JDuR+qXNQoW2ZX+SsNE/+gI1Yr+yYCjExugNdfpmyWEI1kr/qz0WrqT82RM/YSvPU=
X-Received: by 2002:a25:d015:: with SMTP id h21mr23729233ybg.11.1571128718921; 
 Tue, 15 Oct 2019 01:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20191014154529.287048-1-jonathan@fintelia.io>
 <20191014154529.287048-3-jonathan@fintelia.io>
In-Reply-To: <20191014154529.287048-3-jonathan@fintelia.io>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Oct 2019 16:38:27 +0800
Message-ID: <CAEUhbmXn-j42AK_wq1WJ-hWMt9XgBFGRNayGa80M2=jVC1F+-g@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] target/riscv: Expose "priv" register for GDB for
 reads
To: Jonathan Behrens <jonathan@fintelia.io>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
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
X-List-Received-Date: Tue, 15 Oct 2019 08:38:44 -0000

On Mon, Oct 14, 2019 at 11:53 PM Jonathan Behrens <jonathan@fintelia.io> wrote:
>
> This patch enables a debugger to read the current privilege level via a virtual
> "priv" register. When compiled with CONFIG_USER_ONLY the register is still
> visible but always reports the value zero.
>
> Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
> ---
>  configure                       |  4 ++--
>  gdb-xml/riscv-32bit-virtual.xml | 11 +++++++++++
>  gdb-xml/riscv-64bit-virtual.xml | 11 +++++++++++
>  target/riscv/gdbstub.c          | 23 +++++++++++++++++++++++
>  4 files changed, 47 insertions(+), 2 deletions(-)
>  create mode 100644 gdb-xml/riscv-32bit-virtual.xml
>  create mode 100644 gdb-xml/riscv-64bit-virtual.xml
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

