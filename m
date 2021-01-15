Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0Wyd-0006Fr-7u
	for mharc-qemu-riscv@gnu.org; Fri, 15 Jan 2021 16:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0Wya-0006ER-6f; Fri, 15 Jan 2021 16:49:49 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:44519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0WyX-0002ea-9N; Fri, 15 Jan 2021 16:49:47 -0500
Received: by mail-io1-xd35.google.com with SMTP id z5so20958570iob.11;
 Fri, 15 Jan 2021 13:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zX62yCo2Ms91pcSV4fD+a/II1iEc8aqCUccrOM3kVQQ=;
 b=Zqb5DRXwlEOqWbCjGAlOszm+qBWn7l/Eu59VHcH4T9yM6YaX98oIcjjUBje/Q8ESe5
 MJlTgoHfwMvLwCBH05vI75wMWG5U5gEIpl8IVBUgSdBHOgjDxi8JSvPElq9tMqqoAm4q
 /nPdemIPgY/V2S9bnvIPRnMN+p53n1J/u31AH6982D2cgMhTDNZlSNQaqdwtIKkf6TgA
 RPtOkN2f565an1ySLQ19DA+X5LEtV7Qhy0+LuDHLm+xeWZ4i4y1oub7mvZTLzrcoUEpH
 tG6AnM7FzvDwvy7ze3lIc626bzUAlHNOGOQZliYdLCz5MSxrykaXNgfg3bKslHjxzp29
 bSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zX62yCo2Ms91pcSV4fD+a/II1iEc8aqCUccrOM3kVQQ=;
 b=LJBuoh6a67wHFjXkdWjH7sM2ocHWJpk5HObzPS89V8dshow+vd39zFkZHQJi/r3NbZ
 1Kutph/BGFLlZGg1uE/C7A/ag1G0/Eruz2ON7MiR+pn+/dtnGzEl1gpaInzzsXBf7dq2
 ikcsNBWSFDTGQrimK6zjIm4gxSurxoTEkZSZxgqhIZRdTx0kc4b4uw2sZ70ywJeLMnfg
 YcMPuyXXegTJyAqmERqXHLZZ3Pog5yOqwesP5BGRdkb5MWwxMChvKYfnsbDuUYbPzniR
 1LstIZj7LsRn/KrIa6XnWO8wMTvBHpS01yyXoofo2ekGueRy39oIdRqDUdREejic7h1b
 UNEA==
X-Gm-Message-State: AOAM531rCHxA7V6pFK5PlyqOCWYQ3nMVcrPAbvw94JIKaYiwrfilB1Hc
 4hJj/wjyt66ix1pP0cqZTXQuyGShKckQOWGrq0w=
X-Google-Smtp-Source: ABdhPJxYVWfwMXath3hlj5jAvKe16yJWOQqgSBWCVSHB+7WAeZd5W9ZMOnfGzKaRX5RRS8tN7fQeeO47GtH/VK+fhFc=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr12793180ild.267.1610747383925; 
 Fri, 15 Jan 2021 13:49:43 -0800 (PST)
MIME-Version: 1.0
References: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
 <1610427124-49887-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1610427124-49887-2-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 13:49:17 -0800
Message-ID: <CAKmqyKM24487iky0-ESmbakpPT28fAGhERCUO7935ub0ZRJ-KA@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/riscv: Make csr_ops[CSR_TABLE_SIZE] external
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Jim Wilson <jimw@sifive.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Fri, 15 Jan 2021 21:49:49 -0000

On Mon, Jan 11, 2021 at 8:53 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> In preparation to generate the CSR register list for GDB stub
> dynamically, change csr_ops[] to non-static so that it can be
> referenced externally.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/cpu.h |  8 ++++++++
>  target/riscv/csr.c | 10 +---------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 2649949..6f9e1cc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -482,6 +482,14 @@ typedef struct {
>      riscv_csr_op_fn op;
>  } riscv_csr_operations;
>
> +/* CSR function table constants */
> +enum {
> +    CSR_TABLE_SIZE = 0x1000
> +};
> +
> +/* CSR function table */
> +extern riscv_csr_operations csr_ops[];
> +
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
>  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 10ab82e..507e8ee 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -23,14 +23,6 @@
>  #include "qemu/main-loop.h"
>  #include "exec/exec-all.h"
>
> -/* CSR function table */
> -static riscv_csr_operations csr_ops[];
> -
> -/* CSR function table constants */
> -enum {
> -    CSR_TABLE_SIZE = 0x1000
> -};
> -
>  /* CSR function table public API */
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
>  {
> @@ -1378,7 +1370,7 @@ int riscv_csrrw_debug(CPURISCVState *env, int csrno, target_ulong *ret_value,
>  }
>
>  /* Control and Status Register function table */
> -static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
> +riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      /* User Floating-Point CSRs */
>      [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags      },
>      [CSR_FRM] =                 { fs,   read_frm,         write_frm         },
> --
> 2.7.4
>
>

