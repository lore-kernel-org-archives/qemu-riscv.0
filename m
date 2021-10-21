Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdTpJ-00008I-TK
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 04:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdTpH-00005q-7g; Thu, 21 Oct 2021 04:53:27 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:33285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdTpF-0001EH-Fd; Thu, 21 Oct 2021 04:53:26 -0400
Received: by mail-qk1-x730.google.com with SMTP id h65so2105798qke.0;
 Thu, 21 Oct 2021 01:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oa9rcrvsXE8mlctoU7MNmbbQtQsMOtl1WLMOhI8hYNI=;
 b=aBvaK9voGwJXboKU8Km9Hl0q+EQvhND/dULJVsQTKmK8jvYSsjQ/DD5VmheZNzxIpw
 kFtG+iZVboxmjYhMtVCt6dtLm9JevscFYXW8+CroJgmw9OrzgyTI1E9h5K0W963l7/hO
 KjpV/q5alIxLjcqYINjkdhzxsLoCow+PvM7HTeJVBcm12phy95/f4Q1HyG/kJ1nycOI3
 l+UD7YogPx3x3E3+qx0pWcMMJ5MLiwq3lPxPtNFQDYSJqd0Ogx02b2vJWRUCyVGyazBp
 WojEslcQIVsOJK3kqVuKMTqHSDOCKfZx0/HM60u3uOkQaE8nr3RHVKKHEtuJ18WYHd+u
 gQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oa9rcrvsXE8mlctoU7MNmbbQtQsMOtl1WLMOhI8hYNI=;
 b=WKnMQCUD/inNdcTUvzIrSj+YD3ynIX6ELXJID31u+Y4UA3UUGf2KSssufNwdYdGk2D
 HUz6vLxf1yBOE89pFkMsLa6JCXPnynodBZcpGW4n/YxYeEHPn3ou2BkxKVE4gzFcq7v6
 45fJpjJB/8wRBU0F/XOUTmUgACAq739RDWQCM+pCHO3jtuuU6lOMOvhtcjVlOJ8guGqg
 47cXGTeIh6vjEPLNQIAY+z2UPapZCTGDxzylSEgROooK2/YPpMSWtPB6iL5N9vxruP69
 AW7BzFCSyjlts/pSok8/nbcBcrLM4QzUia85NAz03J/9AWxKhkUwsJo3yUeQ/ZRh5Tug
 h3UA==
X-Gm-Message-State: AOAM530VQWIeEWq0LizKqUdhLLmtrn7uUsvg84GxlhxKe2oJeLzZGdpO
 CgjoF03EKPqHqvplLfr8xH8rc3mZftMmEwz4FUk=
X-Google-Smtp-Source: ABdhPJySS3QD9EaFFuGqDLv8FK4d2Et91/IN8hX9PC926c6gMKN9i1/DoTz6RKHXNU6iYcfjqteaPvX8pD53gl9lR8E=
X-Received: by 2002:a25:346:: with SMTP id 67mr4326559ybd.345.1634806403755;
 Thu, 21 Oct 2021 01:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
 <e66367ce1b4ab64aab545916ad6818dac7b1f8ec.1634524691.git.alistair.francis@wdc.com>
In-Reply-To: <e66367ce1b4ab64aab545916ad6818dac7b1f8ec.1634524691.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Oct 2021 16:53:12 +0800
Message-ID: <CAEUhbmVBNxunFGbDiiuLvxSTDC2+ffRN4sU7OLhncrHH1JWSUw@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] hw/intc: sifive_plic: Cleanup remaining functions
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x730.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 08:53:29 -0000

On Mon, Oct 18, 2021 at 10:40 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>

This one needs some commit messages as it consolidates two functions
into one which is not straight forward.

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/intc/sifive_plic.c | 109 +++++++++---------------------------------
>  1 file changed, 22 insertions(+), 87 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index d73503cea4..3f56223554 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -31,8 +31,6 @@
>  #include "migration/vmstate.h"
>  #include "hw/irq.h"
>
> -#define RISCV_DEBUG_PLIC 0
> -
>  static bool addr_between(uint32_t addr, uint32_t base, uint32_t num)
>  {
>      uint32_t end = base + num;
> @@ -57,47 +55,6 @@ static PLICMode char_to_mode(char c)
>      }
>  }
>
> -static char mode_to_char(PLICMode m)
> -{
> -    switch (m) {
> -    case PLICMode_U: return 'U';
> -    case PLICMode_S: return 'S';
> -    case PLICMode_H: return 'H';
> -    case PLICMode_M: return 'M';
> -    default: return '?';
> -    }
> -}
> -
> -static void sifive_plic_print_state(SiFivePLICState *plic)
> -{
> -    int i;
> -    int addrid;
> -
> -    /* pending */
> -    qemu_log("pending       : ");
> -    for (i = plic->bitfield_words - 1; i >= 0; i--) {
> -        qemu_log("%08x", plic->pending[i]);
> -    }
> -    qemu_log("\n");
> -
> -    /* pending */
> -    qemu_log("claimed       : ");
> -    for (i = plic->bitfield_words - 1; i >= 0; i--) {
> -        qemu_log("%08x", plic->claimed[i]);
> -    }
> -    qemu_log("\n");
> -
> -    for (addrid = 0; addrid < plic->num_addrs; addrid++) {
> -        qemu_log("hart%d-%c enable: ",
> -            plic->addr_config[addrid].hartid,
> -            mode_to_char(plic->addr_config[addrid].mode));
> -        for (i = plic->bitfield_words - 1; i >= 0; i--) {
> -            qemu_log("%08x", plic->enable[addrid * plic->bitfield_words + i]);
> -        }
> -        qemu_log("\n");
> -    }
> -}
> -
>  static uint32_t atomic_set_masked(uint32_t *a, uint32_t mask, uint32_t value)
>  {
>      uint32_t old, new, cmp = qatomic_read(a);
> @@ -121,26 +78,34 @@ static void sifive_plic_set_claimed(SiFivePLICState *plic, int irq, bool level)
>      atomic_set_masked(&plic->claimed[irq >> 5], 1 << (irq & 31), -!!level);
>  }
>
> -static int sifive_plic_irqs_pending(SiFivePLICState *plic, uint32_t addrid)
> +static uint32_t sifive_plic_claimed(SiFivePLICState *plic, uint32_t addrid)
>  {
> +    uint32_t max_irq = 0;
> +    uint32_t max_prio = plic->target_priority[addrid];
>      int i, j;
> +
>      for (i = 0; i < plic->bitfield_words; i++) {
>          uint32_t pending_enabled_not_claimed =
> -            (plic->pending[i] & ~plic->claimed[i]) &
> -            plic->enable[addrid * plic->bitfield_words + i];
> +                        (plic->pending[i] & ~plic->claimed[i]) &
> +                            plic->enable[addrid * plic->bitfield_words + i];
> +
>          if (!pending_enabled_not_claimed) {
>              continue;
>          }
> +
>          for (j = 0; j < 32; j++) {
>              int irq = (i << 5) + j;
>              uint32_t prio = plic->source_priority[irq];
>              int enabled = pending_enabled_not_claimed & (1 << j);
> -            if (enabled && prio > plic->target_priority[addrid]) {
> -                return 1;
> +
> +            if (enabled && prio > max_prio) {
> +                max_irq = irq;
> +                max_prio = prio;
>              }
>          }
>      }
> -    return 0;
> +
> +    return max_irq;
>  }
>
>  static void sifive_plic_update(SiFivePLICState *plic)
> @@ -151,7 +116,7 @@ static void sifive_plic_update(SiFivePLICState *plic)
>      for (addrid = 0; addrid < plic->num_addrs; addrid++) {
>          uint32_t hartid = plic->addr_config[addrid].hartid;
>          PLICMode mode = plic->addr_config[addrid].mode;
> -        int level = sifive_plic_irqs_pending(plic, addrid);
> +        bool level = !!sifive_plic_claimed(plic, addrid);
>
>          switch (mode) {
>          case PLICMode_M:
> @@ -164,41 +129,6 @@ static void sifive_plic_update(SiFivePLICState *plic)
>              break;
>          }
>      }
> -
> -    if (RISCV_DEBUG_PLIC) {
> -        sifive_plic_print_state(plic);
> -    }
> -}
> -
> -static uint32_t sifive_plic_claim(SiFivePLICState *plic, uint32_t addrid)
> -{
> -    int i, j;
> -    uint32_t max_irq = 0;
> -    uint32_t max_prio = plic->target_priority[addrid];
> -
> -    for (i = 0; i < plic->bitfield_words; i++) {
> -        uint32_t pending_enabled_not_claimed =
> -            (plic->pending[i] & ~plic->claimed[i]) &
> -            plic->enable[addrid * plic->bitfield_words + i];
> -        if (!pending_enabled_not_claimed) {
> -            continue;
> -        }
> -        for (j = 0; j < 32; j++) {
> -            int irq = (i << 5) + j;
> -            uint32_t prio = plic->source_priority[irq];
> -            int enabled = pending_enabled_not_claimed & (1 << j);
> -            if (enabled && prio > max_prio) {
> -                max_irq = irq;
> -                max_prio = prio;
> -            }
> -        }
> -    }
> -
> -    if (max_irq) {
> -        sifive_plic_set_pending(plic, max_irq, false);
> -        sifive_plic_set_claimed(plic, max_irq, true);
> -    }
> -    return max_irq;
>  }
>
>  static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
> @@ -229,10 +159,15 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
>          if (contextid == 0) {
>              return plic->target_priority[addrid];
>          } else if (contextid == 4) {
> -            uint32_t value = sifive_plic_claim(plic, addrid);
> +            uint32_t max_irq = sifive_plic_claimed(plic, addrid);
> +
> +            if (max_irq) {
> +                sifive_plic_set_pending(plic, max_irq, false);
> +                sifive_plic_set_claimed(plic, max_irq, true);
> +            }
>
>              sifive_plic_update(plic);
> -            return value;
> +            return max_irq;
>          }
>      }
>

Regards,
Bin

