Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9g0Y-00088z-E9
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 23:22:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9g0W-00088k-Rp; Mon, 17 Jan 2022 23:22:08 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=43619
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9g0V-0003oU-3X; Mon, 17 Jan 2022 23:22:08 -0500
Received: by mail-io1-xd2a.google.com with SMTP id v1so23953744ioj.10;
 Mon, 17 Jan 2022 20:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z4odkUgP9dmSTRPh5McUpCcDnRzBo4Ia1rSoysv9f74=;
 b=l5V35KxZE8KSqjzClY8Zfhoc/IDJcVi+ThQXQ1540Q7I52TVvx8gSwXW83nTGB7u/0
 CO0t/r5/T9m2ZwOBazx3McipWWbVcEWYKoEJv/GbhthiJSYXrSnO4gUoqjmyny9KZj93
 iPKoB5Y78skKq+O/hbwwU1qT1zfegcgIVKXuI3Ikpw7DGDSkdJfI8L90uUm5iBdV3uSS
 48HqsiXyx/9J+aUSQa0CQrcUpVE4RGJbi1ZoMi8y9kWrNSnvjxCU0v5eY8fA97BlyOjS
 RPaf/zdch652mc67y7zcdmzmXyjLwcZ1zVmych/MmI2CgDxaxl9ZCeSapHJd523gCxGI
 NVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z4odkUgP9dmSTRPh5McUpCcDnRzBo4Ia1rSoysv9f74=;
 b=PetbpY3BnCD8fayHwjx0VPj9K+2LBC05byiAc0H7MyCnmn7HXkzdbuwP+7YrhGkMH/
 Qrwys1xVDQ+Olp3JalgeeFID110RhCA3X3Gk+VehWKqWJ8M1/2ssx/w4X07+YITK1IRg
 k1qU76e8wKIeKeYbFg5XS+nGOVQhvnioNpLWpp393+CIQsSFN23SyiU9cTm5BOzpl1Se
 Emd9lRW6TYqq57JJMo/EeftNFXzn/sHyATS6E5hgJGDqBWxY2cettxPaC8erbQzFLi7d
 /lYzojGVk+2F3pdEkBBWGnTgdSmIoWq+zi4KRWbWbVu2bw9e5pSbBT+6t7tbAGQxR4wC
 +OuQ==
X-Gm-Message-State: AOAM530Ock9lmfFWUsu99fw/wJ1j+8klEGELQ3QUfcP9VqMvnrilHpYi
 iOdcpJowEu6xgPrdHxrWn4ci76SuLXGWKT/xngg=
X-Google-Smtp-Source: ABdhPJytFcxwBMZKlNmeKNekSBL3ungkDircdhDIi0a9cRKbIKBB4F4vSV3KBoiDKeVICrIVtsGa/tjbe7fARCtfsGE=
X-Received: by 2002:a02:a403:: with SMTP id c3mr11431567jal.318.1642479722684; 
 Mon, 17 Jan 2022 20:22:02 -0800 (PST)
MIME-Version: 1.0
References: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
 <20220111035124.9468-5-liweiwei@iscas.ac.cn>
In-Reply-To: <20220111035124.9468-5-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 14:21:36 +1000
Message-ID: <CAKmqyKMAohGZQ0q2XuO8i=PYcNwveYy6GPajHGFNrxXZmR-wsA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] target/riscv: rvk: add implementation of
 instructions for Zk*
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com, 
 luruibo2000@163.com, lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 04:22:09 -0000

On Tue, Jan 11, 2022 at 2:01 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/crypto_helper.c            | 446 ++++++++++++++++++++++
>  target/riscv/helper.h                   |  37 ++
>  target/riscv/insn32.decode              |  42 +++
>  target/riscv/insn_trans/trans_rvk.c.inc | 467 ++++++++++++++++++++++++
>  target/riscv/meson.build                |   3 +-
>  target/riscv/translate.c                |   1 +
>  6 files changed, 995 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/crypto_helper.c
>  create mode 100644 target/riscv/insn_trans/trans_rvk.c.inc
>
> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
> new file mode 100644
> index 0000000000..344eea4287
> --- /dev/null
> +++ b/target/riscv/crypto_helper.c
> @@ -0,0 +1,446 @@
> +/*
> + * RISC-V Crypto Emulation Helpers for QEMU.
> + *
> + * Copyright (c) 2021 Ruibo Lu, luruibo2000@163.com
> + * Copyright (c) 2021 Zewen Ye, lustrew@foxmail.com
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +#include "exec/helper-proto.h"
> +#include "crypto/aes.h"
> +#include "crypto/sm4.h"
> +
> +#define AES_XTIME(a) \
> +    ((a << 1) ^ ((a & 0x80) ? 0x1b : 0))
> +
> +#define AES_GFMUL(a, b) (( \
> +    (((b) & 0x1) ?                              (a)   : 0) ^ \
> +    (((b) & 0x2) ?                     AES_XTIME(a)   : 0) ^ \
> +    (((b) & 0x4) ?           AES_XTIME(AES_XTIME(a))  : 0) ^ \
> +    (((b) & 0x8) ? AES_XTIME(AES_XTIME(AES_XTIME(a))) : 0)) & 0xFF)
> +
> +#define BY(X, I) ((X >> (8 * I)) & 0xFF)
> +
> +#define AES_SHIFROWS_LO(RS1, RS2) ( \
> +    (((RS1 >> 24) & 0xFF) << 56) | \
> +    (((RS2 >> 48) & 0xFF) << 48) | \
> +    (((RS2 >>  8) & 0xFF) << 40) | \
> +    (((RS1 >> 32) & 0xFF) << 32) | \
> +    (((RS2 >> 56) & 0xFF) << 24) | \
> +    (((RS2 >> 16) & 0xFF) << 16) | \
> +    (((RS1 >> 40) & 0xFF) <<  8) | \
> +    (((RS1 >>  0) & 0xFF) <<  0))
> +
> +#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
> +    (((RS2 >> 24) & 0xFF) << 56) | \
> +    (((RS2 >> 48) & 0xFF) << 48) | \
> +    (((RS1 >>  8) & 0xFF) << 40) | \
> +    (((RS1 >> 32) & 0xFF) << 32) | \
> +    (((RS1 >> 56) & 0xFF) << 24) | \
> +    (((RS2 >> 16) & 0xFF) << 16) | \
> +    (((RS2 >> 40) & 0xFF) <<  8) | \
> +    (((RS1 >>  0) & 0xFF) <<  0))
> +
> +#define AES_MIXBYTE(COL, B0, B1, B2, B3) ( \
> +              BY(COL, B3)     ^ \
> +              BY(COL, B2)     ^ \
> +    AES_GFMUL(BY(COL, B1), 3) ^ \
> +    AES_GFMUL(BY(COL, B0), 2)   \
> +)
> +
> +#define AES_MIXCOLUMN(COL) ( \
> +    AES_MIXBYTE(COL, 3, 0, 1, 2) << 24 | \
> +    AES_MIXBYTE(COL, 2, 3, 0, 1) << 16 | \
> +    AES_MIXBYTE(COL, 1, 2, 3, 0) <<  8 | \
> +    AES_MIXBYTE(COL, 0, 1, 2, 3) <<  0   \
> +)
> +
> +#define AES_INVMIXBYTE(COL, B0, B1, B2, B3) ( \
> +    AES_GFMUL(BY(COL, B3), 0x9) ^ \
> +    AES_GFMUL(BY(COL, B2), 0xd) ^ \
> +    AES_GFMUL(BY(COL, B1), 0xb) ^ \
> +    AES_GFMUL(BY(COL, B0), 0xe)   \
> +)
> +
> +#define AES_INVMIXCOLUMN(COL) ( \
> +    AES_INVMIXBYTE(COL, 3, 0, 1, 2) << 24 | \
> +    AES_INVMIXBYTE(COL, 2, 3, 0, 1) << 16 | \
> +    AES_INVMIXBYTE(COL, 1, 2, 3, 0) <<  8 | \
> +    AES_INVMIXBYTE(COL, 0, 1, 2, 3) <<  0   \
> +)
> +
> +static inline uint32_t aes_mixcolumn_byte(uint8_t x, bool fwd)
> +{
> +    uint32_t u;
> +    if (fwd) {
> +        u = (AES_GFMUL(x, 3) << 24) |
> +                          (x << 16) |
> +                          (x <<  8) |
> +            (AES_GFMUL(x, 2) <<  0);
> +    } else {
> +        u = (AES_GFMUL(x, 0xb) << 24) |
> +            (AES_GFMUL(x, 0xd) << 16) |
> +            (AES_GFMUL(x, 0x9) <<  8) |
> +            (AES_GFMUL(x, 0xe) <<  0);
> +    }
> +    return u;
> +}
> +
> +#define XLEN (8 * sizeof(target_ulong))

I don't think this is used, but please don't hard coded xlen's.
Everything should be dynamic based on the CPU xlen.

It would also be great if you could split this patch up more. There is
a lot being added here.

Alistair

