Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCVe8-00078P-0A
	for mharc-qemu-riscv@gnu.org; Sat, 07 Aug 2021 19:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mCVe6-000789-Cf; Sat, 07 Aug 2021 19:22:26 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:37416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mCVe4-0004tX-Ob; Sat, 07 Aug 2021 19:22:26 -0400
Received: by mail-io1-xd33.google.com with SMTP id l20so18123298iom.4;
 Sat, 07 Aug 2021 16:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2t0yqrXB25FTaGR92fNup9m/GC9jY9E7d0B+aRpzuT8=;
 b=JHTkXzVzATEt2qFY17Q5b/6P2a7P5O1m1Gx9jiD6JCNct4O30JGbp90g5M2v8Io+41
 t6qfBNw6SFzV4OQFVK3c1+v76IU0WxaocZv7wlJ4qJ/FxmesTFYVl6pohpzbM+DTvbDx
 JJqgO+lG5qfM51r2SdMGO1gqyBh00RPiig4/vxSqYJ1FUue/2p2hd9eBcYuB7QjAEFoa
 w0/4/pK9HBb5Pqb/F3QMa0P9J3KsaVD0Oe7kOlcgOwfCyV1mpDYhNvQXFTu18dFGoV90
 SBIXOL5Jb1y/MSGOZejVSrE1cEDFlVWotSvrmL+H/oWQDGjiD2WIIS9dsAjwuzScOu/z
 XMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2t0yqrXB25FTaGR92fNup9m/GC9jY9E7d0B+aRpzuT8=;
 b=HdHvXErXShR9X8jcIu4MkMpy2+SA+9Z3RhAWJ3QPGWoAzmY4rxzdfrVNdu0HG5WmAP
 hKbnd1zY9SNPkcVEnzbfTcqRXDU3OW4cJZYLQjow5AJNdmvbmu9s5I251zbER9PcvrkG
 gi2DuFzqq0Uh2vGkfK+HZHsqX8kQmK5C+YQbyevblhuTRjQ/Ep7pPyb6IyuqOfF4MDoE
 zY/WFMOCmiV1PeYQitcKMLzeCAibBLKRCUtGNm8tVD1+IvRM/xD8B+MZlIRU1RRmf8c5
 lm4XaZg5bqcL4TbE+Hik67SFoWwbV32p8WZZPYebC10rY7XfnldJXeNgG83W14wZyA3p
 ohEA==
X-Gm-Message-State: AOAM5324R3T4+SUXGblp84B7NCmV2wS3vpfBUDqRVMY3EAB3mQ7MjM7o
 wNrJckISZ9hbRXH7ZxfmjNIx3U2BRFt9Ow5V9Ew=
X-Google-Smtp-Source: ABdhPJw4WpIOTp7nE8OCW7vDHAgEAERZ/pCaX+DFC9UG5cGW/Ca5z0soMpSWdxRVLHjlWHBhPYydNhDgPwEMV5Y0ESU=
X-Received: by 2002:a5d:8e19:: with SMTP id e25mr470065iod.175.1628378542209; 
 Sat, 07 Aug 2021 16:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210807141025.31808-1-bmeng.cn@gmail.com>
In-Reply-To: <20210807141025.31808-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 8 Aug 2021 09:21:54 +1000
Message-ID: <CAKmqyKNXUrmH_54N=nV=ee6XrnrsBmok076fmrsT7d1S=zGxBw@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Correct a comment in riscv_csrrw()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Sat, 07 Aug 2021 23:22:26 -0000

On Sun, Aug 8, 2021 at 12:10 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> When privilege check fails, RISCV_EXCP_ILLEGAL_INST is returned,
> not -1 (RISCV_EXCP_NONE).
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9a4ed18ac5..e747fbe0e9 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1423,7 +1423,7 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>      target_ulong old_value;
>      RISCVCPU *cpu = env_archcpu(env);
>
> -    /* check privileges and return -1 if check fails */
> +    /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
>  #if !defined(CONFIG_USER_ONLY)
>      int effective_priv = env->priv;
>      int read_only = get_field(csrno, 0xC00) == 3;
> --
> 2.25.1
>
>

