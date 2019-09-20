Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBNwc-00076r-CF
	for mharc-qemu-riscv@gnu.org; Fri, 20 Sep 2019 14:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53329)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iBNwZ-000741-6v
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 14:47:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iBNwY-0003Vk-5P
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 14:47:47 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:35155)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iBNwV-0003NJ-3q; Fri, 20 Sep 2019 14:47:43 -0400
Received: by mail-lf1-x142.google.com with SMTP id w6so5749294lfl.2;
 Fri, 20 Sep 2019 11:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rnFGOHnHSmx+gH8pWbprb1CW/SxRheV3caXJkoIiCzY=;
 b=YS2evtAUM6y2aGPOPa1089EIes7ZyrD6K225uJ18Tmelojl7Nc46cCBuD+1Wky4te4
 vrwJOtQ+9sm1wXyc2RbE7z2dQyzDGK2nKRfE/er+omkNPuZAbe6mjBO6kDJaxDdPxgYN
 cCq6tXGM6pGPRfqbv+5Dc9yTngG7WvC/pzc/W/jptcKkWwjlQeOPPbnm/RkM2vgkuvAE
 JRB5LQmBkjRS2L9PlZlHZLXqF3hkdWW4g5yin3lv9lYtDcUiTYpdp0FwbSuwWyHSB2Sl
 5TKnYKDrc+WBjopCeg+C9/qujXZpAs560/FhRVD8gBBTlxfqEGoc9lBbyDYXNRLu+Unr
 UuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rnFGOHnHSmx+gH8pWbprb1CW/SxRheV3caXJkoIiCzY=;
 b=TR63kUahnpaSlyla9Adf5H7AOvuU/k5FRYFeFcTjIuMDzuFfOdV33MGSERw2uxooKM
 kI0nj+FydCKOuUSJG3n86XBr3pnhgkIBBuKpTc+lmVkClqDogzigxWKQYncNNKyEHidc
 eSXQ82+KbWkYhwP03Zsgr9HJG7e4ncvTXKCPpntt3TlA8Ws80kjD4atj03yo/ydbedKa
 aIe9XKCf32ijp4rPomYCbLOtiuPOV+4yuQGgHNHitnhz5653OV36aremXqcjSKh23OoL
 lk1h6P5wnFR/3DJdpmGICgvsB3FH2WxBpqYIzkUYegGpXeqF2yt8HcCHQSLEDJt3MkFH
 GwQw==
X-Gm-Message-State: APjAAAWNwgSDL1rRpV91OX0ZnzGAoiNWD07fVu5/BnB/AcAFLuY3K60O
 WYQKzh1AEHa70mSslThA41KirVb/X3aL8IM/0kw=
X-Google-Smtp-Source: APXvYqwrvTxVmlB3g+zYmarQJmvXonLkXwX95FW/DkO5q5gAnHeC/I0tpWjQx0euwbwLaiJgTyFJDEGWi1bNnFPu110=
X-Received: by 2002:ac2:484a:: with SMTP id 10mr3388328lfy.135.1569005260940; 
 Fri, 20 Sep 2019 11:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <1568990834-9371-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1568990834-9371-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Sep 2019 11:43:05 -0700
Message-ID: <CAKmqyKMFUs_KsR7JJbnWF=inCfd1o6ebCa4s++JkPJK71r=+kg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Skip checking CSR privilege level in debugger mode
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
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
X-List-Received-Date: Fri, 20 Sep 2019 18:47:48 -0000

On Fri, Sep 20, 2019 at 7:48 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> If we are in debugger mode, skip the CSR privilege level checking
> so that we can read/write all CSRs. Otherwise we get:
>
> (gdb) p/x $mtvec
> Could not fetch register "mtvec"; remote failure reply 'E14'
>
> when the hart is currently in S-mode.
>
> Reported-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/csr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f767ad2..974c9c2 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -801,7 +801,10 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>  #if !defined(CONFIG_USER_ONLY)
>      int csr_priv = get_field(csrno, 0x300);
>      int read_only = get_field(csrno, 0xC00) == 3;
> -    if ((write_mask && read_only) || (env->priv < csr_priv)) {
> +    if ((!env->debugger) && (env->priv < csr_priv)) {
> +        return -1;
> +    }
> +    if (write_mask && read_only) {
>          return -1;
>      }
>  #endif
> --
> 2.7.4
>
>

