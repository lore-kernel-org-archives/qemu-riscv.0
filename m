Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHHDq-00016r-Au
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 23:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHHDj-0000wm-Hv; Sun, 15 Jan 2023 23:35:43 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHHDi-0007XA-1G; Sun, 15 Jan 2023 23:35:43 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id l129so11967243vkh.6;
 Sun, 15 Jan 2023 20:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z2i207XY0wpyl4uN0PC9a2HsYtkx8YDQWX6ZUNhml+I=;
 b=cQf2X6hFpPZ/Lf3lji+pCkjtDZWJdDBYMX7G+SYJa3Es8zT3Hzbx+cXpBDZlfCDfy7
 PiH+EyJmi4jWYVmJ7Lzxfws0VQganHp34jKhYTZFQfI/yu9Gvv90yt0jtO3KWNmXn7qK
 J+75I9ThyGhbT6jKyUb5v1Da5qd0bR5b8OKceAB7JKL3idrk7qMQgSb1xvJjs8BfbjEF
 Kurx9vr+fBgWTYgkgcRH6TN/sC3HJkE1V2GGo1pGhXDuwjwa5YFrYczeoOLJ+mdVx7RL
 50TKjzqiyPanugxIl0YPWD+CH9+4P9W5+QnqwDl37PiCl+b+4sbQN135Ncs4PIsm/lGr
 W8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z2i207XY0wpyl4uN0PC9a2HsYtkx8YDQWX6ZUNhml+I=;
 b=bednxPcnEeNSihUUzxg1vtqWP5SmyMHQ5HSMECwuEOnt8NSpiuYodKBzdCwBshHM/U
 peqaYCk64p32HT9JySOu9hbsm2GYtfcqRq/7nYU0E1WRfjED9ZQJ+AlQzgDhzhR1rgkq
 ApM4BaXQ/zuIicQzzMjrSstbuY4iCoTfonScL1ZaaUGhzrzfLiaZTiUXzbYpQPGpdrVR
 9gteZWCCpMCnehRUfKFQUHsXcdcxK/8yUpVlJ3SHs/+4yoZebgvfXJf4m5IbrDTj1+CP
 h9r7AA6uHS+fCpdctqqLoHx7wTicz4M2U3nkE/NsW+dY+UIk4GW8xi56l9xygQd2CyZB
 ZWVA==
X-Gm-Message-State: AFqh2koxpYWMzY/QDupbYDPc++JHmjBtgpf1Ue7+ABHIn+aOdIK0bdri
 RzQDw74g/V62W1Or+9NEdSZS477Zhp7M2Y1txcY=
X-Google-Smtp-Source: AMrXdXskC5cDKi8qnbzagpSV6KLpmw7eIOoZVaASEvfFh99vIu1lqZHd5ZYgTZgZdtKnsTiHwwP+l5bTEFYD6vE9bKA=
X-Received: by 2002:a05:6122:2323:b0:3e1:7e08:a117 with SMTP id
 bq35-20020a056122232300b003e17e08a117mr23133vkb.34.1673843740643; Sun, 15 Jan
 2023 20:35:40 -0800 (PST)
MIME-Version: 1.0
References: <20221215224541.1423431-1-abrestic@rivosinc.com>
In-Reply-To: <20221215224541.1423431-1-abrestic@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 14:35:14 +1000
Message-ID: <CAKmqyKN7TuqwzOr3bs2f=7vWX0wA8Uy5j9j+vECwggD_WcA3RA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Fix up masking of vsip/vsie accesses
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 04:35:45 -0000

On Fri, Dec 16, 2022 at 8:46 AM Andrew Bresticker <abrestic@rivosinc.com> wrote:
>
> The current logic attempts to shift the VS-level bits into their correct
> position in mip while leaving the remaining bits in-tact. This is both
> pointless and likely incorrect since one would expect that any new, future
> VS-level interrupts will get their own position in mip rather than sharing
> with their (H)S-level equivalent. Fix this, and make the logic more
> readable, by just making off the VS-level bits and shifting them into
> position.
>
> This also fixes reads of vsip, which would only ever report vsip.VSSIP
> since the non-writable bits got masked off as well.
>
> Fixes: d028ac7512f1 ("arget/riscv: Implement AIA CSRs for 64 local interrupts on RV32")
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 35 +++++++++++------------------------
>  1 file changed, 11 insertions(+), 24 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 5c9a7ee287..984548bf87 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1975,22 +1975,15 @@ static RISCVException rmw_vsie64(CPURISCVState *env, int csrno,
>                                   uint64_t new_val, uint64_t wr_mask)
>  {
>      RISCVException ret;
> -    uint64_t rval, vsbits, mask = env->hideleg & VS_MODE_INTERRUPTS;
> +    uint64_t rval, mask = env->hideleg & VS_MODE_INTERRUPTS;
>
>      /* Bring VS-level bits to correct position */
> -    vsbits = new_val & (VS_MODE_INTERRUPTS >> 1);
> -    new_val &= ~(VS_MODE_INTERRUPTS >> 1);
> -    new_val |= vsbits << 1;
> -    vsbits = wr_mask & (VS_MODE_INTERRUPTS >> 1);
> -    wr_mask &= ~(VS_MODE_INTERRUPTS >> 1);
> -    wr_mask |= vsbits << 1;
> +    new_val = (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
> +    wr_mask = (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
>
>      ret = rmw_mie64(env, csrno, &rval, new_val, wr_mask & mask);
>      if (ret_val) {
> -        rval &= mask;
> -        vsbits = rval & VS_MODE_INTERRUPTS;
> -        rval &= ~VS_MODE_INTERRUPTS;
> -        *ret_val = rval | (vsbits >> 1);
> +        *ret_val = (rval & mask) >> 1;
>      }
>
>      return ret;
> @@ -2191,22 +2184,16 @@ static RISCVException rmw_vsip64(CPURISCVState *env, int csrno,
>                                   uint64_t new_val, uint64_t wr_mask)
>  {
>      RISCVException ret;
> -    uint64_t rval, vsbits, mask = env->hideleg & vsip_writable_mask;
> +    uint64_t rval, mask = env->hideleg & VS_MODE_INTERRUPTS;
>
>      /* Bring VS-level bits to correct position */
> -    vsbits = new_val & (VS_MODE_INTERRUPTS >> 1);
> -    new_val &= ~(VS_MODE_INTERRUPTS >> 1);
> -    new_val |= vsbits << 1;
> -    vsbits = wr_mask & (VS_MODE_INTERRUPTS >> 1);
> -    wr_mask &= ~(VS_MODE_INTERRUPTS >> 1);
> -    wr_mask |= vsbits << 1;
> -
> -    ret = rmw_mip64(env, csrno, &rval, new_val, wr_mask & mask);
> +    new_val = (new_val & (VS_MODE_INTERRUPTS >> 1)) << 1;
> +    wr_mask = (wr_mask & (VS_MODE_INTERRUPTS >> 1)) << 1;
> +
> +    ret = rmw_mip64(env, csrno, &rval, new_val,
> +                    wr_mask & mask & vsip_writable_mask);
>      if (ret_val) {
> -        rval &= mask;
> -        vsbits = rval & VS_MODE_INTERRUPTS;
> -        rval &= ~VS_MODE_INTERRUPTS;
> -        *ret_val = rval | (vsbits >> 1);
> +        *ret_val = (rval & mask) >> 1;
>      }
>
>      return ret;
> --
> 2.25.1
>
>

