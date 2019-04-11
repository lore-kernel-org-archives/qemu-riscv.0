Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEdiS-0006RH-FC
	for mharc-qemu-riscv@gnu.org; Thu, 11 Apr 2019 13:42:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hEdiQ-0006Pe-DW
	for qemu-riscv@nongnu.org; Thu, 11 Apr 2019 13:42:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hEdiP-00052E-GD
	for qemu-riscv@nongnu.org; Thu, 11 Apr 2019 13:42:22 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:44654)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hEdiN-00050w-Bu; Thu, 11 Apr 2019 13:42:19 -0400
Received: by mail-lj1-x241.google.com with SMTP id h16so6291681ljg.11;
	Thu, 11 Apr 2019 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jIiUlaOr09GT6DH0wDyqFP+V6QkvuLkR+MdMEBfecDw=;
	b=ue+irlzVCi1UcStS67djF4oOvsfiUXWOihv/6IxjZ8SEAf9p5fPmIYAbT4csUEDH3x
	Wh7fVOHFMndGxN+YhNqIwB70nAA1KhDwsCQokxT8Qp8TCu3SbZR2n2efhDmpjMYVghJ5
	I5ehac7s6w9pTSftiiXyMAFT4to6pU4ypDoo/VqUEMAo7fSEVt6FP0c23wFdNtlduOq4
	fIaHetuhBgU6OG52a58Ob0sHE6OqzVIsHX16bFAqY3Z0TZXttBWe6cjN/dqHmmzLhxFe
	HGJDjJ5sZRI1gxmOTZO9cWvHrdCR02AnWqMXQieXHffFvfWYEk9lCnEpPal0CPPpi+o3
	pizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jIiUlaOr09GT6DH0wDyqFP+V6QkvuLkR+MdMEBfecDw=;
	b=I179vo3Gq2zLkjcGZKc5oB27c6/TZESk7B5Sj3X+0pLuPlXAFjXI9LxhitfjS2J/20
	BJwldAyQmkA2/Zi6bFUR2ylfdcYwKSpcxdMYmaanBVWePm1PHRZY8RMps1bXdF7vr7YC
	m4TJyd9fILiF76/nnviv/p20hxZy8dyrRWztc5RzgHc1XybVW6RnR4J67L6ZiHKxV0Bq
	Iw7LY3tewyKwLaDZuV77ef8S2coZCY7DKWF9AkGz+vZEn2lf+RLDfTA6toWe/IfCfK2p
	RvJido+9WgZyHoLbFmkyrtAo403whizkaSqa8nnFtIHGxfRvdGRUXlTevrK4cJ6EuSSZ
	Xc0A==
X-Gm-Message-State: APjAAAVIL/QbTtY+exoZC8BRqHnL8IDQEFC1wi8yZolPJqgCHD4IJDce
	rgY+qzOj1WzosAUinuAqw2/XjsM/+NCfe377tao=
X-Google-Smtp-Source: APXvYqzndEK/OR+m99FpiC3sXYHV3S94hHQVl49EsP1mvBDLWZFDePeSdQ7spnrkLMsg1E+5JuSih544FIYkHNIRY9c=
X-Received: by 2002:a2e:2a03:: with SMTP id q3mr27213305ljq.56.1555004537951; 
	Thu, 11 Apr 2019 10:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <CANnJOVF2gE3b-C5zSb85SGoP+9cD9xOQQ5Z4tmsGouagR3xo0Q@mail.gmail.com>
In-Reply-To: <CANnJOVF2gE3b-C5zSb85SGoP+9cD9xOQQ5Z4tmsGouagR3xo0Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 11 Apr 2019 10:40:43 -0700
Message-ID: <CAKmqyKO_hggjML2-0d3QCoEM=ByfSKuP-jdRqnhpVHrGmVVVxA@mail.gmail.com>
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
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2] target/riscv: Remove
 unused include of riscv_htif.h for virt board riscv
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
X-List-Received-Date: Thu, 11 Apr 2019 17:42:23 -0000

On Thu, Apr 11, 2019 at 8:10 AM Jonathan Behrens <fintelia@gmail.com> wrote:
>
> Signed-off-by: Jonathan Behrens <fintelia@gmail.com>

Awesome! Thanks for the patch.

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

