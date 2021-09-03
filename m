Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mM7Gy-0006Eh-Ql
	for mharc-qemu-riscv@gnu.org; Fri, 03 Sep 2021 07:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mM7Gs-0006B6-5S; Fri, 03 Sep 2021 07:22:12 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:43591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mM7Gq-0000m6-FC; Fri, 03 Sep 2021 07:22:09 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id c6so9442021ybm.10;
 Fri, 03 Sep 2021 04:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bdc/aer7CnHAZL6SZ9ZTPxe+DW7b/QwSSaUzlUawc48=;
 b=dZ6rl9EAnFukbeQOriYeCMShMdD2Zj9hUjjupbjj64wMBEZrTYqjRqyFU0g5F2IZsp
 ZQf3I8u5tEhQMyvkhhWDIH+W3qGuY+659+3qaViWF0dsqAgaKkpnvWmjhLmJsfCTtAU1
 7VCefQcpfQ0cNjgjmdJ/TPbRBqirWFBXwZA0YgJk92djUE+eFHj90TJAJJaA0QWV6hmS
 i7ChR4MWogqYZHaLiIHry/AVNnzQLbY2IP0N+u7SEcUcyTXWar0uWRuAmIx8NimaLdu4
 yCvzvnLsGNoakqeFDcKn8i6lFJIlGwmwgCvF9wyZKPjz+okIxTquqrPHXxzBeIsKLwkP
 1HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bdc/aer7CnHAZL6SZ9ZTPxe+DW7b/QwSSaUzlUawc48=;
 b=lRYbPmkpj7nD6Tn01WkhN9nEW2A/QA+6OdKhGC3TdTdEb51uXaPM0TmI5sax/gEHUk
 jIBJtzl+zva9fP2mQ5tNr5/OzTeVtmWfZ9saGtVC1LNgFXrQNL/x1T6ADa5xRlGLcNfl
 IQPECOTAzj4xNF9S/zTPrPR/3C+6qVfAKf+Y6ZOqS1FoQ7JtgTmqLeZnRS7foS5lwmYm
 QnWer8zSx+UZRLAFVRCpXHLZ63OcE9CqcCAnbaibwI4JivSrRMnWZD5dWpeqsPH3bqHL
 RuR0s1yJUzXk1bYqD8O0m+CvHm90BpqVBt2U3w1eZlh8UQ94j8FiuYHZWuukL2i2gmCw
 XevQ==
X-Gm-Message-State: AOAM532etFbUyX/gwMkzwefZ9qPcg/FNkvIyHW2WQ8U/yEmMwlyD/big
 Y8XXO69lHFJu4xZXBOJ30C1TMqkNKMtAeVDzR/8=
X-Google-Smtp-Source: ABdhPJz5taiTiyTXUY0UjnKaFlDFFx+HGf7FbPg2OqV4J0Wo49SPZmj0VuZlBWaahqPKKGUfMsg2bCnl3aNlHY67hVc=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr3990284ybm.345.1630668126232; 
 Fri, 03 Sep 2021 04:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <bc35567c2e79645579ee66f34f86cf5120710a76.1630651786.git.alistair.francis@wdc.com>
 <6aef8a640e38e52b8790fc34a9b9b3b0f3a88a43.1630651786.git.alistair.francis@wdc.com>
In-Reply-To: <6aef8a640e38e52b8790fc34a9b9b3b0f3a88a43.1630651786.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 3 Sep 2021 19:21:55 +0800
Message-ID: <CAEUhbmUsYTmkERFvxa-TdM87P_TMr0rCuGq_ae7GSzN95s=4VA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] hw/riscv/sifive_u: Use the PLIC config helper
 function
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
X-List-Received-Date: Fri, 03 Sep 2021 11:22:14 -0000

On Fri, Sep 3, 2021 at 2:50 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/virt.h |  1 -
>  hw/riscv/sifive_u.c     | 36 +++++++++++++++++++++++-------------
>  2 files changed, 23 insertions(+), 14 deletions(-)
>
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 349fee1f89..e95fd15298 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -71,7 +71,6 @@ enum {
>      VIRTIO_NDEV = 0x35 /* Arbitrary maximum number of interrupts */
>  };
>
> -#define VIRT_PLIC_HART_CONFIG "MS"

This does not belong to this patch.

>  #define VIRT_PLIC_NUM_SOURCES 127
>  #define VIRT_PLIC_NUM_PRIORITIES 7
>  #define VIRT_PLIC_PRIORITY_BASE 0x04
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 6cc1a62b0f..9c51b4d052 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -738,6 +738,28 @@ static void sifive_u_machine_init_register_types(void)
>
>  type_init(sifive_u_machine_init_register_types)
>
> +/*
> + * Return the per-socket PLIC hart topology configuration string
> + * (caller must free with g_free())
> + */
> +static char *riscv_plic_hart_config_string(int hart_count)

I think we can create a common helper for all RISC-V machines to use.
The common helper generates the PLIC config string based on misa
feature bit RVS. If RVS is set then the corresponding hart string is
"MS", otherwise "M".

> +{
> +    g_autofree const char **vals = g_new(const char *, hart_count + 1);
> +    int i;
> +
> +    for (i = 0; i < hart_count; i++) {
> +        if (i == 0) {
> +            vals[i] = "M";
> +        } else {
> +            vals[i] = "MS";
> +        }
> +    }
> +    vals[i] = NULL;
> +
> +    /* g_strjoinv() obliges us to cast away const here */
> +    return g_strjoinv(",", (char **)vals);
> +}
> +
>  static void sifive_u_soc_instance_init(Object *obj)
>  {
>      SiFiveUSoCState *s = RISCV_U_SOC(obj);
> @@ -776,7 +798,6 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>      MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
>      char *plic_hart_config;
> -    size_t plic_hart_config_len;
>      int i;
>      NICInfo *nd = &nd_table[0];
>
> @@ -817,18 +838,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
>                                  l2lim_mem);
>
>      /* create PLIC hart topology configuration string */
> -    plic_hart_config_len = (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) *
> -                           ms->smp.cpus;
> -    plic_hart_config = g_malloc0(plic_hart_config_len);
> -    for (i = 0; i < ms->smp.cpus; i++) {
> -        if (i != 0) {
> -            strncat(plic_hart_config, "," SIFIVE_U_PLIC_HART_CONFIG,
> -                    plic_hart_config_len);
> -        } else {
> -            strncat(plic_hart_config, "M", plic_hart_config_len);
> -        }
> -        plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
> -    }
> +    plic_hart_config = riscv_plic_hart_config_string(ms->smp.cpus);
>
>      /* MMIO */
>      s->plic = sifive_plic_create(memmap[SIFIVE_U_DEV_PLIC].base,

Regards,
Bin

