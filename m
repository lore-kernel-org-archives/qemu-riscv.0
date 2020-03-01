Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8Edi-0002jr-Qo
	for mharc-qemu-riscv@gnu.org; Sat, 29 Feb 2020 21:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1j8Edg-0002jL-5H
 for qemu-riscv@nongnu.org; Sat, 29 Feb 2020 21:47:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1j8Edf-0004zz-8p
 for qemu-riscv@nongnu.org; Sat, 29 Feb 2020 21:47:32 -0500
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:34197)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1j8Edd-0004x8-Fn; Sat, 29 Feb 2020 21:47:29 -0500
Received: by mail-yw1-xc41.google.com with SMTP id o186so3275978ywc.1;
 Sat, 29 Feb 2020 18:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=8Zk6LwQkCbTAFDgmH20wZ95BD5HxONYhLA94/WbCjM8=;
 b=YVX6FvKepm/Wyeosu5K+zuPCeX79G3t+IFrCyv/FRkNU6GA+wD+xUTQetH38g/WXMv
 orTFocxMJdvK0qLIBwtLnmEetLHHa11RjIU3lx3PLEwbZH68gHaf30S6PLpYjfFYPqG1
 idBJSaAX7nMtN8iQQIjyJCIjAcq8SPvyVF+X8JzhCxVzHRPD7cw5HCSZTvcM1WRXQ59G
 KjLooEO1dCbhEORumVqKemwmVod4bdYH2SUmmegeHVguqvmIkNgV3P+70RSY+DX/EhCz
 q2AkKZk+PeJ5i7vkAZjoP610jaLLfgbHY2yx5AzB3U6po9xCBmo61vWA935iuTet8Y6f
 /7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=8Zk6LwQkCbTAFDgmH20wZ95BD5HxONYhLA94/WbCjM8=;
 b=tzsGB9qg2nxnXhowZy8uiPSUHgzpST/CGwnigUOpsdxPmRKZlzhYhIESuzJqR7RIgX
 egOE57iTmmWKuVDQifik869wuuOt184QufLhN+WDVw1SvDrOuTxIUulkNgpeldru64/9
 Yb6ZZoppTHT00+L32H8TK93ZVckBOu1QZ09QBx3RYxN42nmUpmISkjPd5DElpeXW3BUz
 x3YdLpfCp7paWb1u/UX5zs64t6fzM6rTY33fMU+haZxrBBtLv1OYBM9YWRzPxjtWtFY1
 0JUfLisl891nSjihD3yEnJP3+KvY5G8G+5qggI/xBj3MkOOQoN6YZO4gLqoklvBBYhDt
 bfDA==
X-Gm-Message-State: APjAAAUkEBiPheP3q5BpQ970UWDY6LW9O4ZFrIl78XcHw3FBtUxR29HP
 zs2Q8xC75C1cF50UwmBdrkPwJmaicU9xrzniG3Y=
X-Google-Smtp-Source: APXvYqyFRbY1N71eVk2i7Ji2mmy17JeWjQVaePJwHgQiLQ17DxKtL+nJrYZW5t5SnlqvuEu1HgbGgUxuUyTNz67+s2I=
X-Received: by 2002:a25:38c2:: with SMTP id
 f185mr10455420yba.490.1583030848577; 
 Sat, 29 Feb 2020 18:47:28 -0800 (PST)
MIME-Version: 1.0
References: <1582551584-20093-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1582551584-20093-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 1 Mar 2020 10:47:18 +0800
Message-ID: <CAEUhbmVHVcvSJrhAQ3+5KnO8biBNR69AS-x8oRzVA7PKdPRWWg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: Upgrade OpenSBI to v0.6 and add 32-bit
 sifive_u bios image
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
X-List-Received-Date: Sun, 01 Mar 2020 02:47:33 -0000

Hi Palmer,

On Mon, Feb 24, 2020 at 9:40 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
>
> This series advances the roms/opensbi submodule to the v0.6 release,
> and builds and captures platform firmware binaries from that release.
>
> A 32-bit sifive_u bios image has also been added, so that we can have
> 32-bit test coverage for SiFive specific drivers that cannot be done
> with the 'virt' machine.
>
> Two GitLab CI jobs are added to build the OpenSBI firmware binaries.
>
> Changes in v2:
> - new patch: Upgrade opensbi from v0.5 to v0.6
> - Update the 32-bit sifive_u bios image to OpenSBI v0.6
> - new patch: Add GitLab jobs to build OpenSBI firmware binaries
>

Would you please take this series for the next PR?

Regards,
Bin

