Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEMWu-0000tw-0A
	for mharc-qemu-riscv@gnu.org; Wed, 10 Apr 2019 19:21:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hEMWs-0000sk-Mk
	for qemu-riscv@nongnu.org; Wed, 10 Apr 2019 19:21:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hEMWr-0007t1-R2
	for qemu-riscv@nongnu.org; Wed, 10 Apr 2019 19:21:18 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:35360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hEMWm-0007mE-NA; Wed, 10 Apr 2019 19:21:13 -0400
Received: by mail-lj1-x241.google.com with SMTP id t4so3693255ljc.2;
	Wed, 10 Apr 2019 16:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lJoXfOnx1+s02e6SfainK1cZ8EaORQ2JYPV9t1OAhcI=;
	b=MJjUozcy9umqxZg/1mF3u6X0HMiT6TOGo9bjzEKRw58rNvvxxY8F3Ijb+xnXL/0FLK
	KmOGvZkOqNm7Jrbyqdogd7UMv1Cq9E8In4LQcwk2R6frMgY4T7LINBI1AUvu9UTrxHFu
	vpj7f3gDNtCOYse+Fx1qwFQpFMr6R8wfzSTO4vLESVRfNYrxQqALUTNldeG/++45tZ1i
	82PR/HLfZQ/GVfZyeDhYBMZePoDP7lJkmufEG6aQYkjzHcI8F1PKx+zJlOXjoV6XJ3ps
	Srw9Fxsy8G/Rschb2nOs9BNR0gjuxCNmZS7xf080L86ScCpsjYgO21Z2oCC6NQI8LYrU
	KrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lJoXfOnx1+s02e6SfainK1cZ8EaORQ2JYPV9t1OAhcI=;
	b=gd1ASAcbUdqVNxp2MaCYX9XP96iFHZPSG4xGTbroVM4zDdLtKrz/BYKKLiuRvjPeo5
	aHK4OZ1CPQQDJDWFvi94fldfcH+1pKBk6ZO0xFOohGnGdadfh6+X1CIImKFaMfwVGxWg
	cIanaxJ0iVMh9pWqswLzl8+vIDVAuVSZpJfS/vb/uYszm64uFaN+sdGntj+QeKYE0wJs
	qwejJAObIdjt5meDV6jJg0jzKEucSwkBxjqVU3ah9PgFw+CnY5QSI7NA9IUoTZWV6rjP
	Gba35wtZHOhO47fibge6IFOVJz67nrvyxbXEF7l1RMfNlzTV/oEN+aVSzNFEW+sRpA1r
	7BhA==
X-Gm-Message-State: APjAAAWrY7NWRWpy7H+dvF/K19MLSfqMyIGJ91Fo6lRvy0ehJQS4rEUW
	WnDSoOvlV9LxtMdOwfEU/H9LZXGEWLqmI2VJ1LM=
X-Google-Smtp-Source: APXvYqxi/ZS1O88wmn/8y6xtWv//iFCQfXu/QUl/qLdKX9XYY5rT2DJtdC7Y5vt7f7z7dlSsXJDukLh6uxuau267Hu4=
X-Received: by 2002:a2e:2a03:: with SMTP id q3mr24480631ljq.56.1554938469518; 
	Wed, 10 Apr 2019 16:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <CANnJOVHbCGcgnHT3qVbHGFh_Ba0=FqABSoM2SG9ddf-fawwaYg@mail.gmail.com>
In-Reply-To: <CANnJOVHbCGcgnHT3qVbHGFh_Ba0=FqABSoM2SG9ddf-fawwaYg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 10 Apr 2019 16:19:36 -0700
Message-ID: <CAKmqyKNfm2jL+qDmnoXfur7CM2XGLOV2Vu6jNY5kNkxRcYFZpA@mail.gmail.com>
To: Jonathan Behrens <fintelia@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] target/riscv: Remove unused
 include of riscv_htif.h for virt board
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2019 23:21:19 -0000

On Wed, Apr 10, 2019 at 9:30 AM Jonathan Behrens <fintelia@gmail.com> wrote:
>
> Unless I'm missing something, the virt board doesn't support HTIF and
> should not be including this header.

Thanks for the patch!

You aren't missing anything, it can be removed.

>
> Jonathan

Can you send a v2 without the uncertainty in the commit message? Can
you also remove your name from the message? For such a small patch the
commit title by itself will be enough.

>
> Signed-off-by: Jonathan Behrens <fintelia@gmail.com>

With an updated commit message:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index fc4c6b306e..3526463034 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -29,7 +29,6 @@
>  #include "hw/sysbus.h"
>  #include "hw/char/serial.h"
>  #include "target/riscv/cpu.h"
> -#include "hw/riscv/riscv_htif.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_plic.h"
>  #include "hw/riscv/sifive_clint.h"
> --
> 2.20.1

