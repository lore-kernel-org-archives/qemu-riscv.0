Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hoeT3-0002CG-TW
	for mharc-qemu-riscv@gnu.org; Fri, 19 Jul 2019 21:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hoeT1-00029Q-OM
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 21:47:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hoeT0-0006hk-RS
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 21:47:19 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42888)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hoeT0-0006hF-Mq
 for qemu-riscv@nongnu.org; Fri, 19 Jul 2019 21:47:18 -0400
Received: by mail-pg1-f193.google.com with SMTP id t132so15176283pgb.9
 for <qemu-riscv@nongnu.org>; Fri, 19 Jul 2019 18:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=zZtBa+arMTE0TEHA3GMV/hzGd+rV+9tr0IORX7xpj6Y=;
 b=XkInY7yi+5gsn+YKTyIccKOpo6UxE2nztkvuZUwi+Wq5lK37eHC39t9jceYd0MDeqC
 xdi5gtz7UvZTPF26bCqh/BCc4F6EmC7elHMaNpfSvpsLWInVXYiC1uL9PqrUps+vD+ia
 CRVCYn0+epojhzMGlzSBiXxNUXsqL1ndLKp3+HXwLMob6UOyTIA7qOQtiZAOuSOo/vLQ
 IRZRvGKl66fsgRrhTPoTEHuxXWEaOdlCnEKrLSCuy5zY+J9on4WPxXzvoQUHFdF1WHqy
 wNkZdpPC0jntaN7HU7GeSNoW9K5RYLWpMaJxoIrWLHd0yCU44d7LNgCHwfuwjfrQD99f
 f7hA==
X-Gm-Message-State: APjAAAWhoLPhGxOmkUrwxODtLEYjSiIsNN6qJK3TsD5kuj5TPL1B0GUh
 fUHkFSK/i6KFhNuTVDV41dLeQUmK
X-Google-Smtp-Source: APXvYqzAwQmKXdNFMjFYVfg1AthKc9SBqmD2nW+Xv8KxLEeNNQlRnEfxexVNv3GAIpFnzobou/tdFQ==
X-Received: by 2002:a63:360d:: with SMTP id d13mr57223466pga.80.1563587237040; 
 Fri, 19 Jul 2019 18:47:17 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id j128sm18094726pfg.28.2019.07.19.18.47.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 19 Jul 2019 18:47:16 -0700 (PDT)
Date: Fri, 19 Jul 2019 18:47:16 -0700 (PDT)
X-Google-Original-Date: Fri, 19 Jul 2019 18:46:59 PDT (-0700)
In-Reply-To: <1560525351-590-1-git-send-email-bmeng.cn@gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-7207f9be-4aaa-4b0f-9832-ee6682eb5749@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
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
X-List-Received-Date: Sat, 20 Jul 2019 01:47:21 -0000

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

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Sorry this took a while, but it's in the hardware now.  I'll merge this, but
I'm considering it a new feature so it'll be held off a bit.

Thanks!

