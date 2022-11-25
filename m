Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oyQnM-0007Aw-BE
	for mharc-qemu-riscv@gnu.org; Thu, 24 Nov 2022 23:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyQnK-0007Ac-8c; Thu, 24 Nov 2022 23:58:34 -0500
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oyQnH-0007FU-VB; Thu, 24 Nov 2022 23:58:33 -0500
Received: by mail-vk1-xa31.google.com with SMTP id j24so1639894vkk.0;
 Thu, 24 Nov 2022 20:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rB22FmDIBmP9Ss+4cHsmIg92uZGIl1oJQ48Y7QaMXHU=;
 b=Z8LBMjVybU1JofJ587WstdXYN03oPiBUT5e6c5gxgq7nMDwOgDBOyfsCX7lh5m7jef
 g9OAbj66XzzKDXqRJzS3vh6VQwP39fXXKcbjkUgomZAVkoRjBcEKtzrq459x5/UHEi+A
 LXLeagE1jnb4IbE/jumTuDRN8rnt/jv3M5VMlm/YZt1PpING4AaQ+yyPNY5pHHs3CNNA
 Zne3YCEkNYw1wWZQNqK8jRXcWpz2f4zCspWnuONS+16x+BoX0PM+hHFiaxzabs9q9DHX
 CZ8y9OyulSAJwf7fteOIDnVX3DJL2NNveR2CayUjW/sQoWkUv1Ko/M4WMhFGn5ZLeTqQ
 x5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rB22FmDIBmP9Ss+4cHsmIg92uZGIl1oJQ48Y7QaMXHU=;
 b=g0Hhya97fIAzoz2JgYvZoLv997M8xwhCGKPfw12kdWTzgKvY92Uzg/y5AoJH/LQ990
 4gpAe6AdbxKXCmSpARypbHAiguj98UxsaOQsXrDRK270chp0cE3l3HNV6tW2fBQ5/3q1
 bmUuHoikbb9hvZR+qQ9pApB/A4j6slU1tPgCFyef2PHSyWGCdyOccU2SNxoV86zhe8f+
 Zg66Cu1mza5R0ZmzmlebsV+NnkAWR7dSjAS0k91WnAVR7jRX1rS81UDwA2NhjO6H3m4v
 iNjEif8DD+fk04q/BtCdMIzSa6eW/q3emvpC2uGZBVEK0wLf/TtSxc5nPXAylgUm9SSJ
 zSeQ==
X-Gm-Message-State: ANoB5pkPINtTvgECgK9qOXabXne0nCFlZywSOUGYmxm3cQV1a9PE1dQl
 gE4w9y+NYleAEEWrhGpeiybv0s4g4MQVIwGfV0E=
X-Google-Smtp-Source: AA0mqf63KtvWjocjFr/z9zWEJH0GbuKTQPK2k9seJ0DJDVTTZZouwTdyDIX4AXt9VnKrG4mzKwLChMxDvCWEjY6Dvpg=
X-Received: by 2002:a1f:e3c6:0:b0:3b8:ba98:bd43 with SMTP id
 a189-20020a1fe3c6000000b003b8ba98bd43mr12875685vkh.34.1669352310426; Thu, 24
 Nov 2022 20:58:30 -0800 (PST)
MIME-Version: 1.0
References: <20221123090635.6574-1-jim.shu@sifive.com>
In-Reply-To: <20221123090635.6574-1-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 25 Nov 2022 14:58:04 +1000
Message-ID: <CAKmqyKMax11bwRkXmR=R5MaxUWBbopXUO-a9BJF3rzbOEwuRtA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: support cache-related PMU events in virtual
 mode
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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
X-List-Received-Date: Fri, 25 Nov 2022 04:58:34 -0000

On Wed, Nov 23, 2022 at 7:07 PM Jim Shu <jim.shu@sifive.com> wrote:
>
> let tlb_fill() function also increments PMU counter when it is from
> two-stage translation, so QEMU could also monitor these PMU events when
> CPU runs in VS/VU mode (like running guest OS).
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 278d163803..a52a9b14d7 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1248,6 +1248,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>          }
>      }
>
> +    pmu_tlb_fill_incr_ctr(cpu, access_type);
>      if (riscv_cpu_virt_enabled(env) ||
>          ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
>           access_type != MMU_INST_FETCH)) {
> @@ -1311,7 +1312,6 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>              }
>          }
>      } else {
> -        pmu_tlb_fill_incr_ctr(cpu, access_type);
>          /* Single stage lookup */
>          ret = get_physical_address(env, &pa, &prot, address, NULL,
>                                     access_type, mmu_idx, true, false, false);
> --
> 2.17.1
>
>

