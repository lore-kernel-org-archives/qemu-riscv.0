Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ohiyk-0006l3-91
	for mharc-qemu-riscv@gnu.org; Sun, 09 Oct 2022 22:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohiyi-0006ka-9j; Sun, 09 Oct 2022 22:57:16 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohiyg-0002Wc-L0; Sun, 09 Oct 2022 22:57:15 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 i7-20020a17090a65c700b0020ad9666a86so11961141pjs.0; 
 Sun, 09 Oct 2022 19:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vBojqzeB3GBJXyOJmO903B73puF82ggIHf8D9UgjdHs=;
 b=ooLfHyU2De3efvh9BzGNMo2IR0SQ/KPB9UDhPcylgjFTbrkUD/5H1aqcCjJ746n0Up
 Nl2jta5dUUA6b58RUDp/5KXqIWryTVlMnonhIcopmJF6maRIaTHam2MLMNbIRatqHV0l
 qnCRSJBFSZ4BQAVj7v3Kg01TqahgRa7asP5dgUGITIG3kAOj8E4ueB6df6hkM/FPKMsm
 lU9hX9OHATQWXi2uLZA1zwLdTz55x/ODW0fRmROB1KNIRvhxG7F7UwaplVDD88ERaGRA
 JvvHCmVpx9T039Rt0/hjjKXI+5jZXp9XItd8YS/TOSf76W48PkES4IGXuMFJ4vW3C2Qa
 LJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vBojqzeB3GBJXyOJmO903B73puF82ggIHf8D9UgjdHs=;
 b=ARpBHpyOKjhqqXeZGCla6IaB09XJ1PXhuUbK8iy06120uZhUqf9DFClOkMsCaAuzit
 1Q49o8UDWO4WB18lnYGjdy6e8J0YIOWkT99OnJDt6yZv9PHhzHtpkir8+8PMEdkcYpRp
 BKPgIl+TePJ62RoJem8lg3WciN7SeskezTYZGHQhsT7nNtwcgwcoFDx3FtzavCVUGKkm
 X6CCuWOITLqVBqQqPJ6hRZXu7l1czSGjDeWGZIMX4R37CNBHitGS1OEP7iaNpBqkUPXI
 omvmHaLON7LtHPLGeNJZX25ipPIK3Cy7+Kb5zIytWyS75G+InHJxAFT/bxTkEZBAb2Y3
 j8ag==
X-Gm-Message-State: ACrzQf1BxBGr2tZ3bOuX0jS/q4G+ZTTJDytt0Jrv7qytRdMDSMmIjyKN
 kF5g4hrhje9KAJZSZ8fUHl22UuF2v3FIif5+pdg=
X-Google-Smtp-Source: AMsMyM5gFftlYN8RwM/xcUDMYcxtjrb7tWvx7RNDVqlZN3EqQQYm14HVmVfWNXvPmixsH8R4kJWqtGsPP+FeYo1q32s=
X-Received: by 2002:a17:90b:3149:b0:202:e9e9:632f with SMTP id
 ip9-20020a17090b314900b00202e9e9632fmr29916139pjb.96.1665370632852; Sun, 09
 Oct 2022 19:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <20220929232339.372813-3-Jason@zx2c4.com>
In-Reply-To: <20220929232339.372813-3-Jason@zx2c4.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Oct 2022 12:56:46 +1000
Message-ID: <CAKmqyKMvWETo5jyVfq-PGBKK=_hqNSAEfo6fBrjyEngbodmpJA@mail.gmail.com>
Subject: Re: [PATCH 3/6] riscv: re-randomize rng-seed on reboot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Oct 2022 02:57:16 -0000

On Fri, Sep 30, 2022 at 9:24 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Since the FDT is in
> the ROM region at this point, we add a hook right after the ROM has been
> added, so that we have a pointer to that copy of the FDT.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 1ae7596873..aaecf21543 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -30,6 +30,7 @@
>  #include "sysemu/device_tree.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/reset.h"
>
>  #include <libfdt.h>
>
> @@ -241,6 +242,8 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>
>      rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
>                            &address_space_memory);
> +    qemu_register_reset(qemu_fdt_randomize_seeds,
> +                        rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
>
>      return fdt_addr;
>  }
> --
> 2.37.3
>
>

