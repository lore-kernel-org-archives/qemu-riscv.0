Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i9Egq-000483-1r
	for mharc-qemu-riscv@gnu.org; Sat, 14 Sep 2019 16:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i9Egl-00047f-9D
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:30:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i9Egj-0007YJ-7g
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:30:34 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45150)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i9Egi-0007Xm-Nh
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:30:33 -0400
Received: by mail-pf1-f195.google.com with SMTP id y72so20048680pfb.12
 for <qemu-riscv@nongnu.org>; Sat, 14 Sep 2019 13:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mqiWSiqpiz+fx9h9hJXy2Y/55JL0xCh6wLI+OaJeoQo=;
 b=KheCyTHozAEjXDhSOg3KbyLvdcNKlkFTA62B/7L4DB1QBYMJbElZsY0Yg4eMsFRihC
 n82Z9WVUOQMRTc3r+Jcs4ArxxjrrfBAtg9bxsTJAGidtiQ7lSEWbFLgtKcgb1TAN6gGw
 zAZgn5p7390zKrWa1N73L08aZr3g/hMkrlttIRWr+qpjUKsy09JMoY5t7Y/MwLdiRwNp
 sh8vmQZvubFJUfAUDFnDppwnt3tdJdkNaRlYsRdu69I8mCMXmljyv3oJ7pWWeYLUc6HY
 SJypaJ6fAEjmzQXWbKB4wgWcH3TD1W8JxrlCd+/U0TJyfooKMTRoHkoWg8XGscKkuFad
 IIpQ==
X-Gm-Message-State: APjAAAUYEngUxaVG4ApolY7gJVCQrBQ+kpiVK/+4K3fWmvMzV1S00P6q
 NYZRooVRLDmi8v3ozQRgfuLllA==
X-Google-Smtp-Source: APXvYqxyE+x3X6N3jwmI26/u7j+WT+j0XTpEeJ7hOQiCAjGHJWHkZqy6rOfbTjy4ts0EbifXx6sAMw==
X-Received: by 2002:a17:90a:9105:: with SMTP id
 k5mr12778287pjo.9.1568493031001; 
 Sat, 14 Sep 2019 13:30:31 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id m9sm45564682pgr.24.2019.09.14.13.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 13:30:29 -0700 (PDT)
Date: Sat, 14 Sep 2019 13:30:29 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2019 13:23:56 PDT (-0700)
In-Reply-To: <f28c9a322755ce12e1102c4e79c5f290f0cab628.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-c97fe499-03a6-4b10-ade1-085e4c77c2f0@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.195
Subject: Re: [Qemu-riscv] [PATCH v1 12/28] target/riscv: Add support for
 virtual interrupt setting
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
X-List-Received-Date: Sat, 14 Sep 2019 20:30:37 -0000

On Fri, 23 Aug 2019 16:38:21 PDT (-0700), Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_helper.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 41d4368128..afb3e8579e 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -38,12 +38,27 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
>  {
>      target_ulong mstatus_mie = get_field(*env->mstatus, MSTATUS_MIE);
>      target_ulong mstatus_sie = get_field(*env->mstatus, MSTATUS_SIE);
> -    target_ulong pending = atomic_read(env->mip) & *env->mie;
> -    target_ulong mie = env->priv < PRV_M || (env->priv == PRV_M && mstatus_mie);
> -    target_ulong sie = env->priv < PRV_S || (env->priv == PRV_S && mstatus_sie);
> +    target_ulong vsstatus_sie = get_field(env->mstatus_novirt, MSTATUS_SIE);
> +
> +    target_ulong pending = atomic_read(&env->mip) & *env->mie;
> +    target_ulong hspending = atomic_read(&env->mip_novirt) & env->mie_novirt;
> +
> +    target_ulong mie  = env->priv < PRV_M || (env->priv == PRV_M && mstatus_mie);
> +    target_ulong sie  = env->priv < PRV_S || (env->priv == PRV_S && mstatus_sie);
> +    target_ulong vsie = env->priv < PRV_S || (env->priv == PRV_S && vsstatus_sie);
> +
>      target_ulong irqs = (pending & ~env->mideleg & -mie) |
>                          (pending &  env->mideleg & -sie);
>
> +    if (riscv_cpu_virt_enabled(env)) {
> +        target_ulong pending_hs_irq = hspending & -vsie;
> +
> +        if (pending_hs_irq) {
> +            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
> +            return ctz64(pending_hs_irq);
> +        }
> +    }
> +
>      if (irqs) {
>          return ctz64(irqs); /* since non-zero */
>      } else {

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

