Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mfGNv-0001zE-SC
	for mharc-qemu-riscv@gnu.org; Tue, 26 Oct 2021 02:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfGNn-0001wo-9v; Tue, 26 Oct 2021 02:56:28 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:46911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mfGNg-0004FX-Ly; Tue, 26 Oct 2021 02:56:27 -0400
Received: by mail-io1-xd2f.google.com with SMTP id n10so9371129iod.13;
 Mon, 25 Oct 2021 23:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2cNzEHyvDKDxzjMf6KvtWidFLbcZLZmUy9HdFiQ8FQQ=;
 b=Z0nHik6RSZF5q5Kpa2k1F3RQGCE5ON8kSk5gYTjgiIg9dB4q21zVqAqKhpzYJ5F2xW
 bUba4kXXHyefKXkxgJw/LfqKvQ5/jShEymszzE896FU54XAr9oDrqOSk7Ftcnbjzb4bI
 XlaiU/X6If2lx3EZcmrcJI28qUsfd3xmawTLZeM8A3wgRwMmZj3ACy3Ph1b5q+CuQphY
 cs7R767KYF8qA2nqXjk87VrzgC4fPtX3aFlJDh3EBcJfxlSUBLQ8Dtjlw/UbzjKKvB1J
 XqBwlOBK3Vx979aZORtkrnMfIFPHyD9oesONZW/g8pgboP/7huDsH0t3dckwQNGzspfT
 huUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2cNzEHyvDKDxzjMf6KvtWidFLbcZLZmUy9HdFiQ8FQQ=;
 b=S11Wc7ru2tGR1+M4BMqnfspelV104ZSqtBS6cUETMyw5swddXUeuTnCiKBXGjGAkTi
 PcXkiSC+26dKskrNUgEMbAuigBgd4SkSHSbddR6Z1Rcutm0/w8AOrWFdSoPCJJqThg35
 pyfDR/YwoYVosmr3YVRvyJ9MDRtiX44QHINrAQe8O+m19hzaf1u5+A2GdnhDuNuRInSt
 69BwMUI0YgU7vIsgKxKHG5A2KQje39rnwGh8lNatfMSjmyIfQ/CjF4f6ncXs5vXdgNfG
 iu+7RGMd5IjOB78Md18kC3XU6V2dgFnlJ+NIFx+goTbYFzIa3TcLJD7Tl6nN5IiWYXiF
 YsLw==
X-Gm-Message-State: AOAM531JPllZ1vohwDyhtCtD6MOJyhcjKg5LjdDkH1wbiNx8GFIVoBVL
 E7sR2hySCo7qGPns8eKqofkbdywUppTjzSp8Qr8=
X-Google-Smtp-Source: ABdhPJxbpysHUHYoWlxbBTWZJ7EftaFhwyFd+aZYUarUtUO72qksRQazPCjMnO2Ap0Plr4sTEiQyj4lCrggu67zkxwo=
X-Received: by 2002:a05:6638:34a:: with SMTP id
 x10mr5101139jap.114.1635231378174; 
 Mon, 25 Oct 2021 23:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-85-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-85-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Oct 2021 16:55:51 +1000
Message-ID: <CAKmqyKN_FiW7NRWkv_qFV25VJzNvOcqZNMC+xVGp6V+A022qCw@mail.gmail.com>
Subject: Re: [PATCH v8 77/78] target/riscv: rvv-1.0: rename vmandnot.mm and
 vmornot.mm to vmandn.mm and vmorn.mm
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 26 Oct 2021 06:56:29 -0000

On Fri, Oct 15, 2021 at 6:57 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   | 4 ++--
>  target/riscv/insn32.decode              | 4 ++--
>  target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
>  target/riscv/vector_helper.c            | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 6e58343af35..c15497e4a15 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1016,11 +1016,11 @@ DEF_HELPER_6(vfwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
>
>  DEF_HELPER_6(vmand_mm, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vmnand_mm, void, ptr, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_6(vmandnot_mm, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmandn_mm, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vmxor_mm, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vmor_mm, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vmorn_mm, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
>
>  DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 1a4a2871464..8617307b29a 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -635,11 +635,11 @@ vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
>  vfwredsum_vs    1100-1 . ..... ..... 001 ..... 1010111 @r_vm
>  vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
>  vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
> -vmandnot_mm     011000 - ..... ..... 010 ..... 1010111 @r
> +vmandn_mm       011000 - ..... ..... 010 ..... 1010111 @r
>  vmxor_mm        011011 - ..... ..... 010 ..... 1010111 @r
>  vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
>  vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
> -vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
> +vmorn_mm        011100 - ..... ..... 010 ..... 1010111 @r
>  vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
>  vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
>  vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 6eebcffb29e..b78c13f0be7 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2861,11 +2861,11 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
>
>  GEN_MM_TRANS(vmand_mm)
>  GEN_MM_TRANS(vmnand_mm)
> -GEN_MM_TRANS(vmandnot_mm)
> +GEN_MM_TRANS(vmandn_mm)
>  GEN_MM_TRANS(vmxor_mm)
>  GEN_MM_TRANS(vmor_mm)
>  GEN_MM_TRANS(vmnor_mm)
> -GEN_MM_TRANS(vmornot_mm)
> +GEN_MM_TRANS(vmorn_mm)
>  GEN_MM_TRANS(vmxnor_mm)
>
>  /* Vector count population in mask vcpop */
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 276a2c1aab6..1afa4d454c2 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4470,11 +4470,11 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>
>  GEN_VEXT_MASK_VV(vmand_mm, DO_AND)
>  GEN_VEXT_MASK_VV(vmnand_mm, DO_NAND)
> -GEN_VEXT_MASK_VV(vmandnot_mm, DO_ANDNOT)
> +GEN_VEXT_MASK_VV(vmandn_mm, DO_ANDNOT)
>  GEN_VEXT_MASK_VV(vmxor_mm, DO_XOR)
>  GEN_VEXT_MASK_VV(vmor_mm, DO_OR)
>  GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
> -GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
> +GEN_VEXT_MASK_VV(vmorn_mm, DO_ORNOT)
>  GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
>
>  /* Vector count population in mask vcpop */
> --
> 2.25.1
>
>

