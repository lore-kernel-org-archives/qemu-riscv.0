Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMFxa-0008A9-UY
	for mharc-qemu-riscv@gnu.org; Tue, 16 Mar 2021 16:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMFxY-00086m-Tv; Tue, 16 Mar 2021 16:06:32 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:38605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMFxU-0004Z3-7j; Tue, 16 Mar 2021 16:06:32 -0400
Received: by mail-qk1-x732.google.com with SMTP id f124so36619323qkj.5;
 Tue, 16 Mar 2021 13:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zcdV0BDWR1pXE4tYuxnA4D0qWVnqbAIPMuNpjJZfzy4=;
 b=X0V9EPMVKlinl0fav1LmHgjg6YBiiMru3bmjpdV6vjdHi+VJqhbrMGnmbLsEsSsKjp
 8NePC0d5vvftVybEGpjCXBKUcfJdWKU7z2O1Eo0/mhybdQ22NZDZhZ4HAYcQic4AGt2c
 W57eVs8wwYwqbzplzuYs92S9XLFfL3e3BjQZpZcfsA1C84wHNAHhrJXIo2f4uXlT06PS
 IzSgpuW1W684BOC0D/gNm2MfEFYx4AxUfWSgV1mbFkrMXxu79ZVbxRJWdM1B3PCaxXdY
 EOkGUpdDoYTL/hG7p5V4A/XIFG8VSPR7dOwCoFU0LajiE/Ox0SgY4Qx7/JFOa3nfUZDf
 +NmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zcdV0BDWR1pXE4tYuxnA4D0qWVnqbAIPMuNpjJZfzy4=;
 b=t2zFzkQP1G7rPCV7BAy6jG6DIzPEJCRiSsnw2BsXEenTuxtovPwtvnWUd7Q9m8ubDU
 SsUbXqcNCJ4qXX1CsZNvXI8NbpGl4whCvqDv4maC5v3okOcXHRMV9CwDYdU66qljzNz5
 rpxGKzjOThS0+4bARfqe6XPp+/jZL3IanrXtDSOyyQVNpvVfcQ47d+YzYXFqWxLPRaLo
 9+hv6MAerPpG1FzMeXd8/AUJOAUqVfQs7FlN9ElY3U+6FNjE4X+lFKRjyQ8ssmPRzlvQ
 u4xDAbM3L1oetfCuMKt0rvLNoB3ujje6acf0yYkGPiJiK3dU0UulNKX2D2gJYetDbC1Z
 7JIw==
X-Gm-Message-State: AOAM530R48q6dsBvUyg13bFqeSVtasZGlaLE89TvgMlLURdvh06NQYx7
 EWhYjNYq8aBuCWfX87lt0r8RNC/IyBcnhVzTRYIHSzl16YA=
X-Google-Smtp-Source: ABdhPJyNLlR5xkVE7Ecna4s/22nm8Ccw7haa0oSKZ1LB6bXyvtG06ozd3tAB2kxIXNQroBRaFrTiZCIfS4v0zGxjRcs=
X-Received: by 2002:a05:620a:2a02:: with SMTP id
 o2mr823499qkp.492.1615925186852; 
 Tue, 16 Mar 2021 13:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210311094902.1377593-1-georg.kotheimer@kernkonzept.com>
In-Reply-To: <20210311094902.1377593-1-georg.kotheimer@kernkonzept.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Mar 2021 16:04:48 -0400
Message-ID: <CAKmqyKOVitQ3SEY4CkfW7OExfjwOaavDgt1KYT+d3u8wnEuh4Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Make VSTIP and VSEIP read-only in hip
To: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x732.google.com
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
X-List-Received-Date: Tue, 16 Mar 2021 20:06:33 -0000

On Thu, Mar 11, 2021 at 4:49 AM Georg Kotheimer
<georg.kotheimer@kernkonzept.com> wrote:
>
> Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fd2e6363f3..00a3ab72af 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -420,7 +420,8 @@ static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
>      SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
>  static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
> -static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
> +static const target_ulong hip_writable_mask = MIP_VSSIP;
> +static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
>  static const target_ulong vsip_writable_mask = MIP_VSSIP;
>
>  static const char valid_vm_1_10_32[16] = {
> @@ -962,9 +963,9 @@ static int rmw_hvip(CPURISCVState *env, int csrno, target_ulong *ret_value,
>                     target_ulong new_value, target_ulong write_mask)
>  {
>      int ret = rmw_mip(env, 0, ret_value, new_value,
> -                      write_mask & hip_writable_mask);
> +                      write_mask & hvip_writable_mask);
>
> -    *ret_value &= hip_writable_mask;
> +    *ret_value &= hvip_writable_mask;
>
>      return ret;
>  }
> --
> 2.30.1
>
>

