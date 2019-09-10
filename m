Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7hRC-0000Md-HQ
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 10:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54753)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7hR8-0000Ic-U5
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7hR7-0006NM-Tf
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46164)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7hR7-0006Mw-Nw
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 10:48:05 -0400
Received: by mail-wr1-f65.google.com with SMTP id d17so8091738wrq.13
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2019 07:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9r/tsin+WnzvHfmEc7iVPUi/buDct7somnXFCcxsN4M=;
 b=QN2TA1cL2wDLvJfNZv+PTItOJ/Jx7c9fuj/JlXrAo4f89OE1olo8g7cUeJiM0sHndt
 2e5nZkixEwyoN82edH+7oBKCG/n9387gIGBq4bGT3DIephfDJ+QyimT+rHaMIl+YhLkw
 HMcg29dNTQ/9l77n0lGkGLqPeuPO1lPpfA+Fc7Di08H4UXPgOKF+uynTambo8GEx03dm
 x5FJd/JjiaDy0lgCuMNoUleh9qM8UyNJ6YY8cOQ9xFcFJ+TeW2QkKemkF3gNO+FtO02B
 QafvLRPzLE+0vXb3URB7j4kQTjbrp1fZJYrvYCeHcEy8Tn4j/l8rXtbgyOYUinOo73V3
 Wpkg==
X-Gm-Message-State: APjAAAW8zkujdCKrrwdPzxKW/88xMPWarV30tVfjicAHb4TcCcqrZVZ5
 /vdyppngC87bgp6ZgdYgZx2xKg==
X-Google-Smtp-Source: APXvYqx+MMVn21LPEsYVh4ZdCTqfuyQUbh76195ywvIFJ5C3yTWkYyr5hoeGjchAictUvs1bD59zqA==
X-Received: by 2002:a5d:4ac5:: with SMTP id y5mr21240676wrs.179.1568126884538; 
 Tue, 10 Sep 2019 07:48:04 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id a144sm5175207wme.13.2019.09.10.07.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 07:48:04 -0700 (PDT)
Date: Tue, 10 Sep 2019 07:48:04 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Sep 2019 07:40:13 PDT (-0700)
In-Reply-To: <a090bc437bf412c279b1254d05eae5c2d67225db.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-afa69c9b-17b7-4043-b204-512c92cf618a@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-riscv] [PATCH v1 04/28] target/riscv: Fix CSR perm
 checking for HS mode
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
X-List-Received-Date: Tue, 10 Sep 2019 14:48:08 -0000

On Fri, 23 Aug 2019 16:38:00 PDT (-0700), Alistair Francis wrote:
> Update the CSR permission checking to work correctly when we are in
> HS-mode.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index f767ad24be..471f23a1d0 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -799,9 +799,15 @@ int riscv_csrrw(CPURISCVState *env, int csrno, target_ulong *ret_value,
>
>      /* check privileges and return -1 if check fails */
>  #if !defined(CONFIG_USER_ONLY)
> -    int csr_priv = get_field(csrno, 0x300);
> +    int csr_priv = env->priv;

This isn't really "csr_priv" (ie, the priv needed to access the CSR) any more, 
it's really the effective priv of the machine.  Leaving the variable with the 
same name makes this hard to read, but I think it is correct.

>      int read_only = get_field(csrno, 0xC00) == 3;
> -    if ((write_mask && read_only) || (env->priv < csr_priv)) {
> +
> +    if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
> +        /* Plus 1 as we are in HS mode */

The comment is useless, it doesn't say why we increment it.  Also, I don't 
think this is correct: doesn't it allow U mode to access S CSRs when H is 
present and V is disabled?

Something like

    riscv_effective_priv(CPURISCVState *env)
    {
        if (riscv_has_ext(env, RVH) && env->priv == PRIV_S && !riscv_cpu_virt_enabled(env)) {
            return PRIV_HS;
        }
    
        return env->priv;
    }

would probably be used in a handful of places, and would be a drop in for
env->priv here.

> +        csr_priv++;
> +    }
> +
> +    if ((write_mask && read_only) || (csr_priv < get_field(csrno, 0x300))) {
>          return -1;
>      }
>  #endif

