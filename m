Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNqrT-0001ga-7S
	for mharc-qemu-riscv@gnu.org; Wed, 08 Sep 2021 02:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNqrR-0001gN-Ow; Wed, 08 Sep 2021 02:15:05 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:38911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNqrQ-0004F9-7f; Wed, 08 Sep 2021 02:15:05 -0400
Received: by mail-yb1-xb33.google.com with SMTP id v10so2022975ybm.5;
 Tue, 07 Sep 2021 23:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wsQH+oVAoJfz081UhLOwBFkvr7MAfyLoR++rYFAzaSw=;
 b=jz5LtAIQfR33uNhsL6KoLDpU4ZRYi+tHN5WUOqkubVYIDI/NtsuAjc5cEWSEZi566v
 5QnhbCevvdCR7F4aCRfjRg1G01wXspRSdmuA3UPIFKVFVsRnQFsZnzm3nU5Vm5iE9SKw
 GT+C+lMrWfDyTMlRglEEgpdP1WY4wwOfzTBRFqEUtY4kDK0h2dN6s6X1sIAc/LzYgJbb
 EWP54Tth0uU/3umAy6SZ0UicCtqVmQPfyE5wuVi4QkdMUarRqp2H3lzXKqMaEN/Wa/dC
 Zzj526W9ifJEyirZF1DHbc4NiRfBCNWc6b6GNf90rMgyt9H5OatS5zduBD5kSvFS5NyS
 2IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wsQH+oVAoJfz081UhLOwBFkvr7MAfyLoR++rYFAzaSw=;
 b=N3ll/W8frBqFK3dyhblF/bf+e901mP/lGVGfgJpCDhtNqfk7ksIK2wbImKXm4+eDMR
 erP6P+2KW2M/zDbZyzlscBoEnGc8le727bbjmlEM7ng0tUpg2I02pQtBecgp0szyYIr7
 WiltyGpUbUj08o95Hy89yMR+J8ogEjxbmhT4sy3EDUWfTRzK75S+nzWuQFWc/8uWRW31
 NwjgcmrToyMglLgReLC74I2vzp78fiC8ZMjXC6xe9FzJOuKOErRhBVM+jKzqjYsG6TyN
 Bv5hSyh5lAYRQpMpfTdj2vLmPjg7xs/sfM3USKoYHU3N/Nq2pIg7e2ulZ1QfqRLqPpPe
 riaw==
X-Gm-Message-State: AOAM5338eo/bmDjqFJAgett93ngNDaw4Kf/TUviiPZXjYG3vBg8Z9KK3
 P9+IvnxIZKX37tABnhnJ2c2KURHBjMBagRdOHAs=
X-Google-Smtp-Source: ABdhPJxDZGrdjbOimsCiw7gwyzG//+JCM1WY5LNWSaqtGbIyZbISslktO/vv03/4mX4RdHrRLyafNxYdWE3wnmUf2s8=
X-Received: by 2002:a25:76c7:: with SMTP id r190mr2986707ybc.467.1631081702835; 
 Tue, 07 Sep 2021 23:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110603.338681-1-anup.patel@wdc.com>
 <20210831110603.338681-3-anup.patel@wdc.com>
In-Reply-To: <20210831110603.338681-3-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 14:14:52 +0800
Message-ID: <CAEUhbmWR-c-nwoDRYbvb__tHpVKDj2gQW5XVUAwEaDWbraYhJw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] hw/intc: Upgrade the SiFive CLINT implementation
 to RISC-V ACLINT
To: Anup Patel <anup.patel@wdc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 08 Sep 2021 06:15:06 -0000

On Tue, Aug 31, 2021 at 7:07 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The RISC-V ACLINT is more modular and backward compatible with
> original SiFive CLINT so instead of duplicating the original
> SiFive CLINT implementation we upgrade the current SiFive CLINT
> implementation to RISC-V ACLINT implementation.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/riscv_aclint.c         | 373 +++++++++++++++++++++++----------
>  hw/riscv/microchip_pfsoc.c     |   9 +-
>  hw/riscv/shakti_c.c            |  11 +-
>  hw/riscv/sifive_e.c            |  11 +-
>  hw/riscv/sifive_u.c            |   9 +-
>  hw/riscv/spike.c               |  14 +-
>  hw/riscv/virt.c                |  14 +-
>  include/hw/intc/riscv_aclint.h |  54 +++--
>  8 files changed, 339 insertions(+), 156 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

