Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAhXa-0003nw-Ko
	for mharc-qemu-riscv@gnu.org; Thu, 20 Jan 2022 19:12:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhXX-0003k1-KU; Thu, 20 Jan 2022 19:12:27 -0500
Received: from [2607:f8b0:4864:20::12c] (port=46892
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nAhXV-0000rV-Lf; Thu, 20 Jan 2022 19:12:27 -0500
Received: by mail-il1-x12c.google.com with SMTP id e8so6358932ilm.13;
 Thu, 20 Jan 2022 16:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mpduO1R1Y8dQT/WNOuJjlOGiiY92TPc9nuDLlPbkbjg=;
 b=joPWsgUfERGr0K1T6d5WXRdpGn5W8aQw4nmFKIlZMkpxH11fnT9rXRV3zSVvo5wPdq
 W21dC7DHXFumtXzd6H6M01+bBKwjVkDBBguEc9Sml9uSJ322I4ySAxcCIR1xSVGAnsDf
 I4yHZU7Lyqe9Dv+yEV/2tmvDUVEGox7b4bl5aKi8e6zCvUIa+5AaTqjPKXxePtxlDcxB
 mFHyeY4CTJ0dc3+hOQwmeeZopgpygqplTvdfpzfNd4FF6jFo0LbS9YG9rgHf1R9gEvq6
 2hNl3qK8xMFGOOvePDftuGxBz/KPfFLqtk7F4R3dtmEy/iXt46UtR1B5Huk/VwepZVji
 brqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mpduO1R1Y8dQT/WNOuJjlOGiiY92TPc9nuDLlPbkbjg=;
 b=6ly1c/ycDwrJUeoJ7Fre/aZKqmOXEBgE4f9xVkCtacH2Xz/GePBa5f1eP0svn89gbH
 LcpQpQGlMd2hQeBDMQ3W3CEWJPWqHjxLlql2xrz1iXmqVleSCSNhMSW9ODoEQ/TrCFja
 LKKwmJ0ppbcZ/oKJbtacZVNSoGWQUtX6PSFsJ5XAPWNCZcZ2UVGu6hq+RcacIp/Oi/0K
 p/YNwbdRFjEqM4uIxiESbWdhOnYHLfKtqvISMNZ9F1ETqFGvJirUcrUKIoI4cqLD027p
 dxfqudBg5kADF8b3lLo6fgcUsZQQZL07CKI8hXqPf1mgWNxiPNfwHJrojIeg4Kq6eH6B
 VyFA==
X-Gm-Message-State: AOAM532huXdsgsXqrJntuq6PlVhBvih6GWuNrzSjqO5omIvg/Bbvtf7J
 b9ceKgdWoZ0u24Ylx10AHcbODSNo4/Wr9N7kisk=
X-Google-Smtp-Source: ABdhPJwGOtkk70HrDeCkb7VdTnh0uDkA5JkYEEvaVWP+t7Zsg6SSZg7DB6LM5LT+0s4lav1I7KJBXTUVBs0Gpv7eJvo=
X-Received: by 2002:a05:6e02:6d1:: with SMTP id
 p17mr758967ils.74.1642723942250; 
 Thu, 20 Jan 2022 16:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
 <20220119113754.20323-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20220119113754.20323-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 21 Jan 2022 10:11:56 +1000
Message-ID: <CAKmqyKM-957fDBTAEX50dRxjeqs+xiyZ+ZNxiKi+MjK8nDACMw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 03/14] target/riscv: rvk: add support for zbkc
 extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, luruibo2000@163.com, 
 lustrew@foxmail.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Fri, 21 Jan 2022 00:12:27 -0000

On Wed, Jan 19, 2022 at 9:39 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>  - reuse partial instructions of zbc extension, update extension check for them
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              | 3 ++-
>  target/riscv/insn_trans/trans_rvb.c.inc | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index bf080cb489..9fd900f4bd 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -770,9 +770,10 @@ clzw       0110000 00000 ..... 001 ..... 0011011 @r2
>  ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
>  cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
>
> -# *** RV32 Zbc Standard Extension ***
> +# *** RV32 Zbc/Zbkc Standard Extension ***
>  clmul      0000101 .......... 001 ..... 0110011 @r
>  clmulh     0000101 .......... 011 ..... 0110011 @r
> +# *** RV32 extra Zbc Standard Extension ***
>  clmulr     0000101 .......... 010 ..... 0110011 @r
>
>  # *** RV32 Zbs Standard Extension ***
> diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
> index 7590c0538e..2a565b98c0 100644
> --- a/target/riscv/insn_trans/trans_rvb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvb.c.inc
> @@ -489,7 +489,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
>
>  static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
>  {
> -    REQUIRE_ZBC(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbc, zbkc);
>      return gen_arith(ctx, a, EXT_NONE, gen_helper_clmul, NULL);
>  }
>
> @@ -501,7 +501,7 @@ static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
>
>  static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
>  {
> -    REQUIRE_ZBC(ctx);
> +    REQUIRE_EITHER_EXT(ctx, zbc, zbkc);
>      return gen_arith(ctx, a, EXT_NONE, gen_clmulh, NULL);
>  }
>
> --
> 2.17.1
>
>

