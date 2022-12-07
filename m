Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2mBW-0006CB-3R
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 23:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2mBR-0006Bi-FX; Tue, 06 Dec 2022 23:37:25 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2mBP-0006J2-OK; Tue, 06 Dec 2022 23:37:25 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id c184so16200394vsc.3;
 Tue, 06 Dec 2022 20:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZDtXIs0EQco77cIvAxnupDSnH/4kZ25vj9ikCpe3wIk=;
 b=U6dMjVjyjk860VeYGdUBqcNwnIWYbsbZrJZC1jlOBv4M3PHwkQo3sb+rnNveO267aZ
 yZf/zhWs51bN9VgFQ6fwGeXnpGRidzAh4q6Vdcuu4xaGJRbcYBMY+OCzav4zBMEHmlqq
 VWAhDpAp2n6326vGMHa23Aq0913ZRuyz3SrdQWI70YZYc1VIZedbLTZLUlY5QE3JaPpU
 mC5GKp+K5d9SMeMkSzgw2Jd1rh+UN7vMErpMhxhaeetW8yfZTyM0g60almMHVTYhg+m3
 3zQo+bF7qqglELB0HsE9TLCQpmIj1GAgh5GWNe/ozA+BMzmfzzxBJk9TYC17JJ4KPqzb
 mLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZDtXIs0EQco77cIvAxnupDSnH/4kZ25vj9ikCpe3wIk=;
 b=DLcPVQW6xzCZnqMQFLIXWahwwug20z+dEO/wXbsiwQCRjiAgKJzGDcMvslLe1I495u
 kNUoVhi6H/UcT9MFgNEx2E3fPdBvPhklyeTov+6f8RFgpMapDFaTbu8XWXGtod8UW4YZ
 J3xxf/3PsmtoOL6Ynjf5sKYWA1GbLLqJcHOnrxQvpNXHHhoku+gxAOuMdyKpdAFdKZZ4
 C9WbNeiXWQO7YIMY0fH5iUKYg2JxBmrVzpqBuFeUNNxxFBa5Ejy85Qxtzzcf9PKAD+DP
 Egm4LfQ29ujzfWlxteyNOtQwUG4rCPeYQmyuwzsvLXxSpizJL4rnYuhla/xPpisYeSCU
 wTKw==
X-Gm-Message-State: ANoB5pkFGv4xbujUpY9nTjXOixmL86h7h3GyZsIDaZPDUvuDCXPajyXe
 1Q3A5mIzg+u8hepZgfLml0BTpM/rT4zjK/hP+yXb/RXnJ0w=
X-Google-Smtp-Source: AA0mqf5lSJjnyt3S7UVy7KQ0+fLp8xq8+grsreilT1+mapYEjsWBrZbNKz3ciw6vxtGxfqA5ipWrHf8OBNJbi0YbMUQ=
X-Received: by 2002:a05:6102:302b:b0:3b0:f936:788b with SMTP id
 v11-20020a056102302b00b003b0f936788bmr14073458vsa.54.1670387842314; Tue, 06
 Dec 2022 20:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-13-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-13-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 14:36:56 +1000
Message-ID: <CAKmqyKM7LQ7wPgyhz-6tZ=wXFvFzebxnUu41s_pN7pxM5HPxiA@mail.gmail.com>
Subject: Re: [PATCH 13/15] hw/intc: sifive_plic: Change "priority-base" to
 start from interrupt source 0
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Vijai Kumar K <vijai@behindbytes.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 04:37:27 -0000

On Fri, Dec 2, 2022 at 12:10 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> At present the SiFive PLIC model "priority-base" expects interrupt
> priority register base starting from source 1 instead source 0,
> that's why on most platforms "priority-base" is set to 0x04 except
> 'opentitan' machine. 'opentitan' should have set "priority-base"
> to 0x04 too.
>
> Note the irq number calculation in sifive_plic_{read,write} is
> correct as the codes make up for the irq number by adding 1.
>
> Let's simply update "priority-base" to start from interrupt source
> 0 and add a comment to make it crystal clear.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/riscv/microchip_pfsoc.h | 2 +-
>  include/hw/riscv/shakti_c.h        | 2 +-
>  include/hw/riscv/sifive_e.h        | 2 +-
>  include/hw/riscv/sifive_u.h        | 2 +-
>  include/hw/riscv/virt.h            | 2 +-
>  hw/intc/sifive_plic.c              | 5 +++--
>  6 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
> index 9720bac2d5..c10d87a601 100644
> --- a/include/hw/riscv/microchip_pfsoc.h
> +++ b/include/hw/riscv/microchip_pfsoc.h
> @@ -152,7 +152,7 @@ enum {
>
>  #define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        187
>  #define MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES     7
> -#define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x04
> +#define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x00
>  #define MICROCHIP_PFSOC_PLIC_PENDING_BASE       0x1000
>  #define MICROCHIP_PFSOC_PLIC_ENABLE_BASE        0x2000
>  #define MICROCHIP_PFSOC_PLIC_ENABLE_STRIDE      0x80
> diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
> index daf0aae13f..539fe1156d 100644
> --- a/include/hw/riscv/shakti_c.h
> +++ b/include/hw/riscv/shakti_c.h
> @@ -65,7 +65,7 @@ enum {
>  #define SHAKTI_C_PLIC_NUM_SOURCES 28
>  /* Excluding Priority 0 */
>  #define SHAKTI_C_PLIC_NUM_PRIORITIES 2
> -#define SHAKTI_C_PLIC_PRIORITY_BASE 0x04
> +#define SHAKTI_C_PLIC_PRIORITY_BASE 0x00
>  #define SHAKTI_C_PLIC_PENDING_BASE 0x1000
>  #define SHAKTI_C_PLIC_ENABLE_BASE 0x2000
>  #define SHAKTI_C_PLIC_ENABLE_STRIDE 0x80
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 9e58247fd8..b824a79e2d 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -89,7 +89,7 @@ enum {
>   */
>  #define SIFIVE_E_PLIC_NUM_SOURCES 53
>  #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
> -#define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
> +#define SIFIVE_E_PLIC_PRIORITY_BASE 0x00
>  #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
>  #define SIFIVE_E_PLIC_ENABLE_BASE 0x2000
>  #define SIFIVE_E_PLIC_ENABLE_STRIDE 0x80
> diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
> index 8f63a183c4..e680d61ece 100644
> --- a/include/hw/riscv/sifive_u.h
> +++ b/include/hw/riscv/sifive_u.h
> @@ -158,7 +158,7 @@ enum {
>
>  #define SIFIVE_U_PLIC_NUM_SOURCES 54
>  #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
> -#define SIFIVE_U_PLIC_PRIORITY_BASE 0x04
> +#define SIFIVE_U_PLIC_PRIORITY_BASE 0x00
>  #define SIFIVE_U_PLIC_PENDING_BASE 0x1000
>  #define SIFIVE_U_PLIC_ENABLE_BASE 0x2000
>  #define SIFIVE_U_PLIC_ENABLE_STRIDE 0x80
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 7c23aea4a0..37819c168c 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -99,7 +99,7 @@ enum {
>  #define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
>  #define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - 1U)
>
> -#define VIRT_PLIC_PRIORITY_BASE 0x04
> +#define VIRT_PLIC_PRIORITY_BASE 0x00
>  #define VIRT_PLIC_PENDING_BASE 0x1000
>  #define VIRT_PLIC_ENABLE_BASE 0x2000
>  #define VIRT_PLIC_ENABLE_STRIDE 0x80
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 2bd292410d..7a6a358c57 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -140,7 +140,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
>      SiFivePLICState *plic = opaque;
>
>      if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
> -        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> +        uint32_t irq = (addr - plic->priority_base) >> 2;
>
>          return plic->source_priority[irq];
>      } else if (addr_between(addr, plic->pending_base, plic->num_sources >> 3)) {
> @@ -187,7 +187,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
>      SiFivePLICState *plic = opaque;
>
>      if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
> -        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
> +        uint32_t irq = (addr - plic->priority_base) >> 2;
>
>          if (((plic->num_priorities + 1) & plic->num_priorities) == 0) {
>              /*
> @@ -428,6 +428,7 @@ static Property sifive_plic_properties[] = {
>      /* number of interrupt sources including interrupt source 0 */
>      DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 1),
>      DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities, 0),
> +    /* interrupt priority register base starting from source 0 */
>      DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, 0),
>      DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0),
>      DEFINE_PROP_UINT32("enable-base", SiFivePLICState, enable_base, 0),
> --
> 2.34.1
>
>

