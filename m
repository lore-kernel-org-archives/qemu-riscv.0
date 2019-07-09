Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hkmkV-0002Ds-QM
	for mharc-qemu-riscv@gnu.org; Tue, 09 Jul 2019 05:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49309)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hkmkR-00029f-P0
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2019 05:49:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hkmkM-0002R9-QB
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2019 05:49:19 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36890)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hkmkL-0002DB-FS
 for qemu-riscv@nongnu.org; Tue, 09 Jul 2019 05:49:13 -0400
Received: by mail-lf1-f66.google.com with SMTP id c9so11208596lfh.4
 for <qemu-riscv@nongnu.org>; Tue, 09 Jul 2019 02:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=88dB74LrdlmRR54RcqZMhu/hZ90dwrhWL2qyOHIbZ1Y=;
 b=hBJTKPumZrM8shbU3lnDXmv1k+cJFxP7Z29+viNyJv/mqiqIuaZOIoNSmzrVw79w2O
 RWvWJ4pIW0NJ1qEKg/fhgk/LLHgnE+ZS4B9RQykP6+lnZsRJUgrjiLFYQwVRmY6OBEsa
 hjlSaThSDrt+13wdBOMNR9D6+GG3W8xAmG4a/8MCrVr3LHEtdvNo4yRGAtO0EUZAEe8s
 ewrzz8Kn58c9a745p8nmoZO8DaE4cJHHjdU18U52TSpM6JbAqlySKhWZHG/ToxPblepU
 EUof30X8dCg6+tVqg84AvXUp7bJ47ubypeA80ie0orlVm2MaTzkuophabOmZ5I8+ZYTp
 rX/w==
X-Gm-Message-State: APjAAAVnzyF4aupCQ1p5+x19reMXXlOtEmeZbtIlsx9P4LzO8NhGSVtJ
 XIRBQZ9Hous9MN4GKMSE84xg0187GcR11vKr
X-Google-Smtp-Source: APXvYqxw8E2ikxdIIoACspJd1z1W9Jwn5yT7ytU/1eYuDeYBIR+sdNYlQViXRpZHH5BgQwYFQynvDA==
X-Received: by 2002:a19:f819:: with SMTP id a25mr9055459lff.183.1562665734588; 
 Tue, 09 Jul 2019 02:48:54 -0700 (PDT)
Received: from localhost ([134.17.27.127])
 by smtp.gmail.com with ESMTPSA id v22sm3239669lfe.49.2019.07.09.02.48.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 02:48:53 -0700 (PDT)
Date: Tue, 09 Jul 2019 02:48:53 -0700 (PDT)
X-Google-Original-Date: Tue, 09 Jul 2019 02:48:50 PDT (-0700)
In-Reply-To: <1560525351-590-1-git-send-email-bmeng.cn@gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-4825dce4-e510-41cd-b97c-0e599d6a2369@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.167.66
Subject: Re: [Qemu-riscv] [PATCH] riscv: sifive_test: Add reset functionality
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
X-List-Received-Date: Tue, 09 Jul 2019 09:49:21 -0000

On Fri, 14 Jun 2019 08:15:51 PDT (-0700), bmeng.cn@gmail.com wrote:
> This adds a reset opcode for sifive_test device to trigger a system
> reset for testing purpose.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>
>  hw/riscv/sifive_test.c         | 4 ++++
>  include/hw/riscv/sifive_test.h | 3 ++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
> index 24a04d7..cd86831 100644
> --- a/hw/riscv/sifive_test.c
> +++ b/hw/riscv/sifive_test.c
> @@ -21,6 +21,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
>  #include "qemu/module.h"
> +#include "sysemu/sysemu.h"
>  #include "target/riscv/cpu.h"
>  #include "hw/riscv/sifive_test.h"
>
> @@ -40,6 +41,9 @@ static void sifive_test_write(void *opaque, hwaddr addr,
>              exit(code);
>          case FINISHER_PASS:
>              exit(0);
> +        case FINISHER_RESET:
> +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +            return;
>          default:
>              break;
>          }
> diff --git a/include/hw/riscv/sifive_test.h b/include/hw/riscv/sifive_test.h
> index 71d4c9f..c186a31 100644
> --- a/include/hw/riscv/sifive_test.h
> +++ b/include/hw/riscv/sifive_test.h
> @@ -34,7 +34,8 @@ typedef struct SiFiveTestState {
>
>  enum {
>      FINISHER_FAIL = 0x3333,
> -    FINISHER_PASS = 0x5555
> +    FINISHER_PASS = 0x5555,
> +    FINISHER_RESET = 0x7777
>  };
>
>  DeviceState *sifive_test_create(hwaddr addr);

Poking around the hardware side, it looks like we're silently ignoring all
codes aside from 0x3333 and 0x5555.  As a result there's really no way to test
if this added reset is going to work, so this should be a "sifive,test1"
instead of a "sifive,test0".  It's backwards compatible, so the compat string
in the device trees should look something like

    compatible = "sifive,test1", "sifive,test0";

With that it should be fine, pending the change to our hardware to reserve this
as an error code within "sifive,test0" devices.

Do you mind also submitting a device tree binding to Linux that describes this
device?  That way we can all stay on the same page about what the pair of
interfaces do.

Thanks!

