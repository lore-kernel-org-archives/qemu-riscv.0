Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHHGv-0002lS-5E
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 23:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHHGt-0002l8-MM; Sun, 15 Jan 2023 23:38:59 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pHHGs-0007x9-9o; Sun, 15 Jan 2023 23:38:59 -0500
Received: by mail-vs1-xe35.google.com with SMTP id i188so27900252vsi.8;
 Sun, 15 Jan 2023 20:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kaJP50WLDM/+Y1wH7KAIyvuVMvvgFr40i0fAsYjc5z0=;
 b=Wl/foCzB10Tf5scj5zbhD4dLij7SsH1zcPAL3+lkMpjrjp96GDUVSUAFmfaNV91xdt
 gXAVh8x8qhJVUvafcLj+wx6ghADl6tDH2KreSI5UdqGyATE8rob5cqzyvgFNPzHCbQZR
 uVC4uUJLOrM9VOsjJZ0xoVj2w/xZN6P4UwOBBG/jzOr6EKh/KdVrzSlxl2COjSICwg6o
 HibqTQWGkl+BG7fuHLCzKL8pHta/LA4fOc7dqAJfGTyuWDGViU2p+LDVuIVSSfqFQD/t
 T1wyWyhscF3lK9nTY1ewiiBJjTqmt4+KkcbyA4P3/Vol247Q2vOg7CVhr/7NL9tyldOW
 PQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kaJP50WLDM/+Y1wH7KAIyvuVMvvgFr40i0fAsYjc5z0=;
 b=b4C6zTpFJQcp6dThFUDji1WouB38YbaqhUA8F+jtzxJz4OCgYrAFfemEeU8aYBIPl1
 WjgzAHgjYZZ5JW+8kR59O9fCWi40487sQ8K3XSwwNtE385+VLeMnqBz4H3u3ejExjD2g
 aRaCf8BIrvqyAjfh5QT2HciB7ZxMoZrLmg71zZHqueq6Zu9NiB0AyecOFN4dIXwwmTTR
 PYaOKM9hbQAVkneyWMwEppR6u++GihWLycqKHIJZfjU/FY/WhwG576mO6tnKuFBZiuHH
 SRFez2dh7N4eSUQjZtQJ+Xb3Pj4Zh4H/TYJwccUgHE1rF+auxZYGNBwoE7qTkpatW6i0
 rNMA==
X-Gm-Message-State: AFqh2kojiJVK92LNqToLpFb2leUcz5kWvYbK2T+uOCbpgfFHkeXlUOuA
 pOw0zUo65OuVZR+Tz/L5Pq4zWDR0Zb8lFT0nm3U=
X-Google-Smtp-Source: AMrXdXtBR3NB9DE9nFJegC4knfTX/2Z/0r6qNkqucRp0SL8Gfkak5Vaacv4wCDihVycB3FLcaeTfw/J1ewAF9Ohh+oE=
X-Received: by 2002:a05:6102:c4a:b0:3ce:f2da:96a with SMTP id
 y10-20020a0561020c4a00b003cef2da096amr4710899vss.64.1673843936541; Sun, 15
 Jan 2023 20:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20221215224541.1423431-1-abrestic@rivosinc.com>
 <20221215224541.1423431-2-abrestic@rivosinc.com>
In-Reply-To: <20221215224541.1423431-2-abrestic@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jan 2023 14:38:30 +1000
Message-ID: <CAKmqyKNrvEqinvK4D-Axewum1M3msfP9BDc5J3YyP64E9u0A9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Trap on writes to stimecmp from VS when
 hvictl.VTI=1
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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
X-List-Received-Date: Mon, 16 Jan 2023 04:39:00 -0000

On Fri, Dec 16, 2022 at 8:46 AM Andrew Bresticker <abrestic@rivosinc.com> wrote:
>
> Per the AIA specification, writes to stimecmp from VS level should
> trap when hvictl.VTI is set since the write may cause vsip.STIP to
> become unset.
>
> Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp support")
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 984548bf87..7d9035e7bb 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -935,6 +935,9 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>      RISCVCPU *cpu = env_archcpu(env);
>
>      if (riscv_cpu_virt_enabled(env)) {
> +        if (env->hvictl & HVICTL_VTI) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          return write_vstimecmp(env, csrno, val);
>      }
>
> @@ -955,6 +958,9 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>      RISCVCPU *cpu = env_archcpu(env);
>
>      if (riscv_cpu_virt_enabled(env)) {
> +        if (env->hvictl & HVICTL_VTI) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
>          return write_vstimecmph(env, csrno, val);
>      }
>
> --
> 2.25.1
>
>

