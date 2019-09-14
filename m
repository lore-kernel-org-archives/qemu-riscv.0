Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i9EjA-00068U-TD
	for mharc-qemu-riscv@gnu.org; Sat, 14 Sep 2019 16:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37867)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i9Ej6-00061b-V0
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:33:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i9Ej5-0008NP-Sf
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:33:00 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46004)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i9Ej5-0008NF-Np
 for qemu-riscv@nongnu.org; Sat, 14 Sep 2019 16:32:59 -0400
Received: by mail-pg1-f196.google.com with SMTP id 4so17047586pgm.12
 for <qemu-riscv@nongnu.org>; Sat, 14 Sep 2019 13:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4SGplVlvAeilU0vnEoPWo2vlTvRUOb+zpOK1n3ckaTU=;
 b=QK40ObUrtHPYfxulpeBAfBcgmZFEUVeJou9CZrvC/xm+KRYZOOVwHPGH7x1DnMQoJ8
 WXiG7adY112QuEAUek97tAgN5e/dyxyTokZY2tVs3r5u+P1NsULao/0tbLEtc32dcujQ
 v2kdcidYnBfCbggeIVSfHsFzFXtMFmbmHTwzQ8Y47br/UlHqyxxwBJpBPwAZht6W6Kdz
 ZjNoWGKD2iFdtVes8sMuQtfJerFNvX2yIGlwuay3jvdPN/eAsb7vceX9jENMmpJKDF+r
 HyHc56ZUtedK2XaqtmmskmiUVw6UZ2fQLS0O0+6HNo1bIU7Y0zhGlSDZJTCKPgGpk4fC
 KlHA==
X-Gm-Message-State: APjAAAViiVzjqPG7sxTu/Ksi3ZqJrkY4IYgHUhgqzHis0KgnUm7b26Tw
 5bNJPXNtmfDtHWmYZGnck9lnfA==
X-Google-Smtp-Source: APXvYqzaFiG0Q2zvZBtvLQwY1OANzKpl3xy5CYW/2EijJSfYOebkvpSVe/NbtL5gEVv/MJThMu/hYg==
X-Received: by 2002:a65:62cd:: with SMTP id m13mr48953385pgv.437.1568493178490; 
 Sat, 14 Sep 2019 13:32:58 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id ck13sm4975609pjb.29.2019.09.14.13.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 13:32:58 -0700 (PDT)
Date: Sat, 14 Sep 2019 13:32:58 -0700 (PDT)
X-Google-Original-Date: Sat, 14 Sep 2019 13:32:40 PDT (-0700)
In-Reply-To: <2b2e042b3c80d4f37cf150853a0a040581feb403.1566603412.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-bfe535ba-174e-466d-9ee4-0c8d98be850b@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.196
Subject: Re: [Qemu-riscv] [PATCH v1 15/28] riscv: plic: Always set sip.SEIP
 bit for HS
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
X-List-Received-Date: Sat, 14 Sep 2019 20:33:02 -0000

On Fri, 23 Aug 2019 16:38:29 PDT (-0700), Alistair Francis wrote:
> When the PLIC generates an interrupt ensure we always set it for the SIP
> CSR that corresponds to the HS (V=0) register.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_plic.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> index 98e4304b66..8309e96f64 100644
> --- a/hw/riscv/sifive_plic.c
> +++ b/hw/riscv/sifive_plic.c
> @@ -150,7 +150,17 @@ static void sifive_plic_update(SiFivePLICState *plic)
>              riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
>              break;
>          case PLICMode_S:
> -            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
> +            if (riscv_cpu_virt_enabled(env)) {
> +                if (level) {
> +                    atomic_or(&env->mip_novirt, MIP_SEIP);
> +                    g_assert(riscv_cpu_virt_enabled(env));
> +                } else {
> +                    atomic_and(&env->mip_novirt, ~MIP_SEIP);
> +                    g_assert(riscv_cpu_virt_enabled(env));
> +                }
> +            } else {
> +                riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
> +            }
>              break;
>          default:
>              break;

This is going to go when we change the interrupt delivery mechanism.

