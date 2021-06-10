Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrThz-0005rh-BO
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 19:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrThx-0005lK-Fa; Thu, 10 Jun 2021 19:03:29 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:40758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lrThv-0008Kd-LA; Thu, 10 Jun 2021 19:03:29 -0400
Received: by mail-io1-xd29.google.com with SMTP id l64so7216470ioa.7;
 Thu, 10 Jun 2021 16:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7fiQBKF8vcbZLcvbsZw7vJbv7FiK3SdFa0OJfkE/zsw=;
 b=QDxHjpiVgPe0t3clUIOI4xlr/aJig7jI3qEAP6etJ1Yd78mr184GuvPGZSP3TKRTm3
 NyEZxAkMqRErW2Z/auNidc/i1ewnKFzN/xjAYD78zfC8pZHRZ2OPRmB1vE0TR1sKvtA8
 SZiJrZOHkCaklUAtL+/Z5/3dUA2JdAYpEV4s787aO2f0gVS6A1rN95p7je2yrWyf3eRU
 TIYIWYybvC1clAT3SLt1mYH4Ga73+S9OokslUgPGXGgegadm9f+rw6/dFIhO86o0v7t7
 JnT4x3rk/aG1wct5MmU6VxoceLvdurkZmBfJ3dxDIsNlmCBvGGLBo0KE3AsMTNf8Fmq0
 XLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7fiQBKF8vcbZLcvbsZw7vJbv7FiK3SdFa0OJfkE/zsw=;
 b=ZvolPz12eH7xzrrSQE4gbI37HNGPxFz7WF/DBVY5Zoykc+GjQZRq8wOPDgrcoQtsbI
 Hn0urHIb8BCVVERBLK8LmONmJ6qVQv2ARlSEFVx9OnstAsHFDHNfqwynJfaoNA/oRqWy
 x5Ini7Rgssi5da+ZmNgu8sYOvvowLNWVKJ2bs9xz8YTIN2bTwEKGQ12bJHTiJe6r3iny
 /yaejN1+flJDz7Yltbj92BSN03VlsgICxXRLclNPcuCh07cCLQ73e8Udj0KzDxxYJkRZ
 HEDkT3sS7rPvaJM8qEhaWd8+X3pxVuktiMUhiW/VTc6ri/C2s375RlqD7azpiYz2akie
 GBeA==
X-Gm-Message-State: AOAM5314M3Xw31bToJ3nHlTHGA9Llj2t5g0yCmjZiVDug5Ui4UP6kEu+
 rq5hTJ2f4jP6UDgWCb5sEU6D//3oyvFwFFjRab4Kwh0Mn3B69A==
X-Google-Smtp-Source: ABdhPJwAU3yoq2XNRe8p8KIyNo2jHbAb4MI8W5fjXToEAldkXPDdSpYlm48pvwhaUJoSPIj3N7K54nDO3QLPmmWq5hM=
X-Received: by 2002:a5e:8349:: with SMTP id y9mr680552iom.105.1623366206217;
 Thu, 10 Jun 2021 16:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <c00176c7518c2a7b4de3eec320b6a683ab56f705.1622435221.git.alistair.francis@wdc.com>
In-Reply-To: <c00176c7518c2a7b4de3eec320b6a683ab56f705.1622435221.git.alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Jun 2021 09:02:59 +1000
Message-ID: <CAKmqyKMRR-ZTZNnA1QgvuOExrpbhMw=2q_vBXW53ceHz5Aga1w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/riscv: Use target_ulong for the
 DisasContext misa
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Thu, 10 Jun 2021 23:03:30 -0000

On Mon, May 31, 2021 at 2:27 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The is_32bit() check in translate.c expects a 64-bit guest to have a
> 64-bit misa value otherwise the macro check won't work. This patches
> fixes that and fixes a Coverity issue at the same time.
>
> Fixes: CID 1453107
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index e945352bca..a35a58df92 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -47,7 +47,7 @@ typedef struct DisasContext {
>      bool virt_enabled;
>      uint32_t opcode;
>      uint32_t mstatus_fs;
> -    uint32_t misa;
> +    target_ulong misa;
>      uint32_t mem_idx;
>      /* Remember the rounding mode encoded in the previous fp instruction,
>         which we have already installed into env->fp_status.  Or -1 for
> --
> 2.31.1
>

