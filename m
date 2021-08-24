Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIQ4S-00039Y-OK
	for mharc-qemu-riscv@gnu.org; Tue, 24 Aug 2021 02:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mIQ4P-00036o-9E; Tue, 24 Aug 2021 02:38:02 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:39888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mIQ4N-0002Zm-8o; Tue, 24 Aug 2021 02:38:01 -0400
Received: by mail-yb1-xb31.google.com with SMTP id n126so25618311ybf.6;
 Mon, 23 Aug 2021 23:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ObVFOuAZqO9ZGm+HgSONHYjDI8zzKYHk3yOk/QKWwzk=;
 b=Otf0sUS+tj1Ivd5QF6YKI+bzXom31nWXuwfKbVxzRCwvxiXOPl6a2yJwXYwRAsk0ZR
 9Cu00BJj/EL71ktSZKKg9UX7uqd+VOl4NiueUqCCxDKGFpINui5KcHaG/jrJEFDV6xzX
 WWjEiz4hMykDtXZo6vOzroTikuiGjxotqf87cIezcj9HJYoWqxooRB82nLYXiCkhueBm
 Z2DJGDKhF75o6LxmCEGL1V4AGElokhG3LV83iu5AKLjqAfzh7f3K7qPlrSrV5VWs6Wg1
 CpSSC5urj0RByYMtr1vlXl/A7YEBU96ZW1e+CS88GGWbSR41PCSjDT3pk0FrK0EItkqW
 qbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ObVFOuAZqO9ZGm+HgSONHYjDI8zzKYHk3yOk/QKWwzk=;
 b=blEIOhqmvaIJNW19TvRhZT0FAoES//5D+iwjT+KyT1JQWqb2HaSGfT/DFmtxDRoToF
 FIyk17H7sxJ5kD+I0OmwNYG5VURXrDAxjL3lxWrxPKpvq7c+lQgosTBmRPbGZfMQW4uh
 Bh0k5mPTuQL/PeiMUgqgkK8t5nnV4gfvJ23HLlrGzEmn+hxIFJCx/AgkwI8a9av6cheX
 KUbSWc9SeXA/3mr3yW7xu9H06XHWmczcbsTeZwoOGNPJXLrLHZu1tNdz2QUX/eG5mt1F
 2rCxyKTZcXdED+ZLJcGSDAP/N4LYIwwQ5PBOEEGvDEHolAe5vpcKxf0AG4fDevFfbodq
 GmfQ==
X-Gm-Message-State: AOAM532voRLLKOJEgJz+exSJoN7DO1VhcqfxH7jPfn3T9Fcla9CYonGS
 DOAsDjwmLejfQiMs8oKhLTcccNC7mpsKsUxr7q4=
X-Google-Smtp-Source: ABdhPJyD1wPDTLVW1hE6P/xHRck9sqNPso4x58c67HqD6rxeESag1LKPL2UladS5JDIsyk3ypdDxTwAUVuNQsAzcqyk=
X-Received: by 2002:a25:ac87:: with SMTP id x7mr8504983ybi.332.1629787077370; 
 Mon, 23 Aug 2021 23:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210823195529.560295-1-richard.henderson@linaro.org>
 <20210823195529.560295-17-richard.henderson@linaro.org>
In-Reply-To: <20210823195529.560295-17-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 24 Aug 2021 14:37:46 +0800
Message-ID: <CAEUhbmVQZpZ_=rb+KO6NFqAz7SbAT-1LTRKSY9EKyF3seTi9_g@mail.gmail.com>
Subject: Re: [PATCH v5 16/24] target/riscv: Fix rmw_sip, rmw_vsip, rmw_hsip vs
 write-only operation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
X-List-Received-Date: Tue, 24 Aug 2021 06:38:02 -0000

On Tue, Aug 24, 2021 at 4:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We distinguish write-only by passing ret_value as NULL.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/csr.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

