Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iChtR-0001nc-9j
	for mharc-qemu-riscv@gnu.org; Tue, 24 Sep 2019 06:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33078)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iChtO-0001n7-Ob
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 06:17:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iChtM-0006nL-HO
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 06:17:58 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:43215)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iChtK-0006mg-Rs
 for qemu-riscv@nongnu.org; Tue, 24 Sep 2019 06:17:56 -0400
Received: by mail-oi1-x241.google.com with SMTP id t84so1119158oih.10
 for <qemu-riscv@nongnu.org>; Tue, 24 Sep 2019 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vMxtvy0rw2lyWXDK5oniU3gJXXXxaKgUBTxBrFjsHa4=;
 b=vhWA8wh5C+JmrRJAAKgUkQN7lUSxfOxyyINRHnxZuiNGqqaZEsyzwYNEeZIMAxuiCw
 aVLZ6fIjrxakBbc0QWDvbXSG0uilLlr7cZHrdmdscJSM/bpmMtjWz3re+ZbfXrZkAhvD
 ueZzqnilBMaHGysYziwS5jhEIOL1DTortcZ/qkw559Ds6f4dQ1AueeV3ubrysnymux4g
 X448BVnjOLfzA6RrRI5XyVmgQziCtrCwiw4gObHsxGlY+HBsgaFq5M9MSjHmRLtUyiOi
 xRG7bqCmYf0lR9TuO/jfjoy0GBiYaaO/hfaUEJtMhEFFJ2jCkNqeBSb3JbEk2YUh8axd
 uGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vMxtvy0rw2lyWXDK5oniU3gJXXXxaKgUBTxBrFjsHa4=;
 b=QvuJpH82ewFZQUYB6uYwMsCbvYHfuyvSOagvUGbKjf+zk2/AOKmCC4H3GetJ+KuKyz
 87Cgw/SCUSv7dzaMoV9mmPsgKzuhmC0NCpTxSZQsfEp1yhEYqLDD+ie3/r5bTE1CJbFA
 kUGS6oZGpU1YT4Qod4GgTQjBWI10Ubgrj68TuMmkoIiyOM0LlnZ58HUpEVYB1D4nMJP6
 khHF+O3FCHkIHu40fiN7UWXD/7chlsPkh2IdlADIYN3oxwiwGKGlRtlyDx6tHHbjdINK
 XCKFj3rovSg3apXcOmSt+TVUVsy1dEXY0r6cJnqMRdpl6G8wG96hmiPA+qNdsHcYZ3K4
 GGbg==
X-Gm-Message-State: APjAAAXIEXWe96f2oQ70RqKGOp/RrUcesLuBQuNd1m+9nr99kkYSuejw
 rmu90zuldYnUKdqTQfycvPr5DA/ReR49ilGPcnhrGQ==
X-Google-Smtp-Source: APXvYqy9d6peXmtJfnXkc98WUviS8PSVNb2emDbZdbo8/pvkKpMLvh9VbQ0lfr4hkg4ExRTYlPilhpdt46/xjppt3Ow=
X-Received: by 2002:aca:53d4:: with SMTP id h203mr1350159oib.146.1569320273846; 
 Tue, 24 Sep 2019 03:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190918145640.17349-1-palmer@sifive.com>
 <20190918145640.17349-12-palmer@sifive.com>
In-Reply-To: <20190918145640.17349-12-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Sep 2019 11:17:42 +0100
Message-ID: <CAFEAcA_6AuqCvbvHVS9Vdwd3AOrp16Fy7Xj29497-xGMw+aXkQ@mail.gmail.com>
Subject: Re: [PULL 11/48] riscv: Resolve full path of the given bios image
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-List-Received-Date: Tue, 24 Sep 2019 10:18:00 -0000

On Wed, 18 Sep 2019 at 16:35, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> From: Bin Meng <bmeng.cn@gmail.com>
>
> At present when "-bios image" is supplied, we just use the straight
> path without searching for the configured data directories. Like
> "-bios default", we add the same logic so that "-L" actually works.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  hw/riscv/boot.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 10f7991490..2e92fb0680 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -72,14 +72,14 @@ void riscv_find_and_load_firmware(MachineState *machine,
>          firmware_filename = riscv_find_firmware(default_machine_firmware);
>      } else {
>          firmware_filename = machine->firmware;
> +        if (strcmp(firmware_filename, "none")) {
> +            firmware_filename = riscv_find_firmware(firmware_filename);
> +        }
>      }
>
>      if (strcmp(firmware_filename, "none")) {
>          /* If not "none" load the firmware */
>          riscv_load_firmware(firmware_filename, firmware_load_addr);
> -    }
> -
> -    if (!strcmp(machine->firmware, "default")) {
>          g_free(firmware_filename);
>      }
>  }

Hi; Coverity (CID 1405786) thinks this introduces a possible
memory leak, because it's not sure that memory allocated
and returned by the call to riscv_find_firmware() is
guaranteed to be freed before the end of the function.
I think it might be a false positive, but I wasn't entirely
sure, so maybe this code could be rephrased to be clearer?
I think the root of the problem is that we have a local
variable 'firmware_filename' which might point to memory
allocated-and-to-be-freed, or might point to memory which
must not be freed (machine->firmware), and then you have
to check the flow of logic through the code quite carefully
to figure out whether the condition under which we choose
to call g_free() is exactly equivalent to the condition
where we set firmware_filename to point to allocated memory...

thanks
-- PMM

