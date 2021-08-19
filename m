Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGbJ5-00028m-FI
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 02:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGbJ3-000286-Mr; Thu, 19 Aug 2021 02:13:37 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:45576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGbJ2-0001Vy-EN; Thu, 19 Aug 2021 02:13:37 -0400
Received: by mail-yb1-xb34.google.com with SMTP id l144so10136069ybl.12;
 Wed, 18 Aug 2021 23:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eql4uW8SZF3NhiJwnvbmYpDB3bBxgZxhDLwIv4v6BZE=;
 b=E0+02O76GmW/8Vq79WNi6t+E6q/TO1O9rrwVHIkQQOAD6Sdy/nQD/1bOkBdBbhV8jr
 tADp5XHjncaPtUjrLdANreAcLvNE56g5asVLvA8cOKEqX2u7xWFWWgsPWef/+LJCpgJM
 ft3X07rW5zV7pVz4BiL9R/s3jjvIHC49t0M491N+nrrh+jpk/zydxPEIoIEaJVzZIMVr
 xL0ZaQPNMkhoLpl2OJpG+P/E5LmRqhzhb6ZU20/6ayPM5pua7jDXYYnULdRmOhUxebMD
 yYhhNRV67QXXfYYUrUNKVrTrybG2S+nFq56Cw5CzH2BTQdiYZsriuIy47RVz1cgLVoqt
 9W/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eql4uW8SZF3NhiJwnvbmYpDB3bBxgZxhDLwIv4v6BZE=;
 b=YqZglsN6bHDGA3zSBLiK+4YU1QoLOuf1EN2+2pGv9KOXoCBcD69CS6jJ3jb9/QDTLE
 EnImkG6dOeQgGOl9HDvqdUkoSYieavSIAAsm8bh5YXdM7NyA3+Ksn5VRzOrBeGJG4MI4
 5EwsT2Y8BVERcayJ4xmdwcLy9+kj7WrO8ra9Ba3lFTCQ6HesIQVdS6qufXVX9wrDMrzd
 wFWpgw8pzhzDVeaQAKZVtG8BqbQ1x1OjFUfupS6g+zdqqTNdkXyCfVMlysaxPDyp0aUT
 WRGtViI7YkPcmPo60t7ln/n6tUR2wBKCyYRtWwmKbEF+pJ5OY3ahjM3DnAb/utiHSy4h
 n+aw==
X-Gm-Message-State: AOAM532jP28YzetC1XYaJ+hMATnnaQfnTxMi4EEYmRV2fZK/lm4Bf4ce
 uc7pcixEzH4kXdpjU/CAIoeKjdURj7blmepRCvs=
X-Google-Smtp-Source: ABdhPJwFu6Fby2/1ElT+Ku4eXiqLRTat6bVZq2b1kKLcYuteS016yHR3uPSlnaN0GSXVVBknwgMh8YSrOmBZ8GdQAxc=
X-Received: by 2002:a5b:304:: with SMTP id j4mr16167473ybp.314.1629353615312; 
 Wed, 18 Aug 2021 23:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-12-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-12-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 14:13:24 +0800
Message-ID: <CAEUhbmWtJh1HGa0OM0GQrKtkbY3BW0XqqUtY76Eun1TvRj9DRA@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] target/riscv: Use DisasExtend in shift operations
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 06:13:38 -0000

On Wed, Aug 18, 2021 at 5:26 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These operations are greatly simplified by ctx->w, which allows
> us to fold gen_shiftw into gen_shift.  Split gen_shifti into
> gen_shift_imm_{fn,tl} like we do for gen_arith_imm_{fn,tl}.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 110 +++++++++-----------
>  target/riscv/insn_trans/trans_rvb.c.inc | 129 +++++++++++-------------
>  target/riscv/insn_trans/trans_rvi.c.inc |  88 ++++------------
>  3 files changed, 125 insertions(+), 202 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

