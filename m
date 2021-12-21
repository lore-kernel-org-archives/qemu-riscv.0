Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzZrt-0000dI-QT
	for mharc-qemu-riscv@gnu.org; Tue, 21 Dec 2021 02:47:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzZrt-0000al-2G; Tue, 21 Dec 2021 02:47:29 -0500
Received: from [2607:f8b0:4864:20::b30] (port=39462
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzZre-0006W3-Bd; Tue, 21 Dec 2021 02:47:18 -0500
Received: by mail-yb1-xb30.google.com with SMTP id v203so36285502ybe.6;
 Mon, 20 Dec 2021 23:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a6lhsYk9FURX6ra+9khZ9b9ftiRbLjGrLV0z3lWWIrY=;
 b=Sg4wgT8IgogNRnO/d8JUkbZLM10zH4ivl3CiXvLIP/vfItR80UJDJakwMGxNX63br/
 Sbqu8pZCsjVlJTa8GEBeCxnqb3l+rqOHUVZKYydjm2osFAYWMGd5frDhUe1S7XPOtAqV
 wQJlvbZ5CBfUzDcQ2jFMdRTYLd35wYX6LiHq/wIUIYfbF9izqjZ/YG2TAdMnAxIMNG79
 d7ZtInOghYUUq/B+F4UVnzMm+un5N/CX+kYetbLwDx8agoQojnIKy/aKUwW7aQGTzLq4
 rr/esFCa86fcL8M8dJ+Rt36OxUyF+VO33yaJ2YrIHPxE3kKPE3oLUQcjTFhd/Di24QmL
 zAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a6lhsYk9FURX6ra+9khZ9b9ftiRbLjGrLV0z3lWWIrY=;
 b=SzXcwm0d4QBkMV9Mii6gPguvyczPHXZI5B496ybMpUz8B6pMgGHI0s1PkPbyEZ0Ud6
 lhO1gNlto384+W9ocWJ+cSxR0+C8JW5JTT4KLR096dLFDA27BAiYaZtWVXxs3Zyl1pN0
 1LWGUFnqGRNT1AuSjWHubbxzzRUsSSYm4s//FmhRaG5TADkyoY+hwzYsJsV1fH453V8d
 3JHTCGDB4KwT1pK6rWPS/O8EPGYOmTU6C7QyDbpaHCOvdqU/yzxd+bFAbz7VQHyhcken
 ei7LZZb9RzGRb+bcg4UG5g2Nsvu6SbJ2a4LRjZ2ekKZQ9c2BLr2MqS00nQgfvUsyFTEt
 FpuQ==
X-Gm-Message-State: AOAM531S5MD3GzQBjgQMrhvZQH8E/+9kKtIb7Eh6/SEpeoaYwtO/Fedd
 xH04TdopVIImSf3/siE5m0LSSgd6GUiKsR8QJIc=
X-Google-Smtp-Source: ABdhPJzd4SI9nYL7EihtRDM26tZ2288Q6IW6xOsCN1oujRejYX2k5/cf+beCKgQJICn2y1i8tm2kMPfxejUKE4Y0X80=
X-Received: by 2002:a25:3787:: with SMTP id e129mr2990789yba.91.1640072823081; 
 Mon, 20 Dec 2021 23:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
 <20211220064916.107241-4-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211220064916.107241-4-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 21 Dec 2021 15:46:52 +0800
Message-ID: <CAEUhbmWzoHyHxYnnWqfX7hADu0Yp5VYC195b_2VCggaZVfeb8w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] target/riscv: Implement the stval/mtval illegal
 instruction
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 21 Dec 2021 07:47:29 -0000

On Mon, Dec 20, 2021 at 2:49 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The stval and mtval registers can optionally contain the faulting
> instruction on an illegal instruction exception. This patch adds support
> for setting the stval and mtval registers.
>
> The RISC-V spec states that "The stval register can optionally also be
> used to return the faulting instruction bits on an illegal instruction
> exception...". In this case we are always writing the value on an
> illegal instruction.
>
> This doesn't match all CPUs (some CPUs won't write the data), but in
> QEMU let's just populate the value on illegal instructions. This won't
> break any guest software, but will provide more information to guests.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        | 2 ++
>  target/riscv/cpu_helper.c | 3 +++
>  target/riscv/translate.c  | 3 +++
>  3 files changed, 8 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0760c0af93..3a163b57ed 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -127,6 +127,8 @@ struct CPURISCVState {
>      target_ulong frm;
>
>      target_ulong badaddr;
> +    uint32_t bins;

nits: does "badins" sound a better name? I took some time to figure
out what "bins" means :)

> +
>      target_ulong guest_phys_fault_addr;
>
>      target_ulong priv_ver;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9e1f5ee177..f76ba834e6 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1007,6 +1007,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>              write_gva = true;
>              tval = env->badaddr;
>              break;
> +        case RISCV_EXCP_ILLEGAL_INST:
> +            tval = env->bins;
> +            break;
>          default:
>              break;
>          }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 24251bc8cc..921ca06bf9 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -167,6 +167,9 @@ static void generate_exception_mtval(DisasContext *ctx, int excp)
>
>  static void gen_exception_illegal(DisasContext *ctx)
>  {
> +    tcg_gen_st_i32(tcg_constant_i32(ctx->opcode), cpu_env,
> +                   offsetof(CPURISCVState, bins));
> +
>      generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
>  }
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

