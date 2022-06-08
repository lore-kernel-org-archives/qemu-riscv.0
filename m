Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nypNV-0004el-Jq
	for mharc-qemu-riscv@gnu.org; Wed, 08 Jun 2022 02:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nypNT-0004eC-SF; Wed, 08 Jun 2022 02:41:15 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nypNS-0005Z8-5y; Wed, 08 Jun 2022 02:41:15 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id r1so6301296ybd.4;
 Tue, 07 Jun 2022 23:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p6UqpizbMJnCkLf1rENQfBvFUibWj7ooX7crD6BqjZ4=;
 b=oY+jdufyznvYTirik0w0Fytjzui9MFGo7yWbafd+ReHnlZJ1zAf8HwxUVKFFlXyp7u
 8mc6e5o8h8y8Zn7WuvVjeulD1A8uMF4vA5Dl/1fqbcwXbaIrqYKvr4RdK/drxMyY27E7
 qbRM3avINUptWPNkPfn8vm4weWO+h1yAPQp9ZJVRkS6mRAcgMcwXrj5Si3qYdKt+lfg0
 2IIBqYA4cDrsOcB0R1soM5TDxczyQsYqB7yi7q7kEUreEMsr/L1cKbCBrpPlJPLT8kHY
 UT4IZwCysdy+Xw1ooWdET59NzC92djNPHEOaq2hQbDNG5Qk6K64gJZ4Kdtu3TDbMUwEP
 giXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p6UqpizbMJnCkLf1rENQfBvFUibWj7ooX7crD6BqjZ4=;
 b=6MSyv0Wrix1CkqpbP9gGPM1uveMKBWEFZz3tzNEYVdzIgxW2shoacoSJkWskd6eSk7
 tVbiKgO0DD/4zdrDZ0NOXSQcyFh370gtV1zW1vsJtN1IuYT5O6qGO8zPTceZgQKlv15F
 P+SfRqkgCV9lNeywf8jDPUB0wqpmrk9Qf6gUUd9L8WVOWwVuhRaz7SkvKobjWoCIjAWF
 nZyw47qzZ40B6GwFBYC8GYX+Ra1JWtw7AVeTJ6VaMSFgLm2y9U7Gujlpzl8Fu7V3A50o
 9MZw+YIxhP5/omVjW3TUIa9K7Y4lHdNuOTWq5oO8ACE1PNT1yE2BSqbzKXtAMRrwW8/S
 Y9pw==
X-Gm-Message-State: AOAM532luptSghTJQ3mGvxTSXdbqYsiqqAMDQGmurKUjXGTeCQJ8/QDD
 z6fULIRQbprK9tLNPjZ1GVjM9wKoMrViGVbULpU=
X-Google-Smtp-Source: ABdhPJyV0eWtnEAlcn3QeGk6N6bCQW+RfF7oRmk1HdqG1zYnUW02DTSXF7pC57Z8nnA6DyoUj9gAXhiMDFPGj0F4+Mg=
X-Received: by 2002:a25:ba46:0:b0:64f:e0f5:11b3 with SMTP id
 z6-20020a25ba46000000b0064fe0f511b3mr33126404ybj.643.1654670472909; Tue, 07
 Jun 2022 23:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220608062015.317894-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Jun 2022 14:41:01 +0800
Message-ID: <CAEUhbmXukS+zH=pjiF9NQWBkYguGCDiDAjOOjeZteOzR6xWK=Q@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Reduce FDT address alignment constraints
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 Atish Patra <atishp@rivosinc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 08 Jun 2022 06:41:16 -0000

+Atish

On Wed, Jun 8, 2022 at 2:20 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> We previously stored the device tree at a 16MB alignment from the end of
> memory (or 3GB). This means we need at least 16MB of memory to be able
> to do this. We don't actually need the FDT to be 16MB aligned, so let's
> drop it down to 2MB so that we can support systems with less memory,
> while also allowing FDT size expansion.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/992
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 57a41df8e9..e476d8f491 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -226,11 +226,11 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>      /*
>       * We should put fdt as far as possible to avoid kernel/initrd overwriting
>       * its content. But it should be addressable by 32 bit system as well.
> -     * Thus, put it at an 16MB aligned address that less than fdt size from the
> +     * Thus, put it at an 2MB aligned address that less than fdt size from the
>       * end of dram or 3GB whichever is lesser.
>       */
>      temp = (dram_base < 3072 * MiB) ? MIN(dram_end, 3072 * MiB) : dram_end;
> -    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 16 * MiB);
> +    fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
>

@Atish Patra  may have some pointers about the 16MiB alignment requirement.

Regards,
Bin

