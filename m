Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3Llj-0004gL-Qy
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 13:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1p3Llh-0004fK-Qu; Thu, 08 Dec 2022 13:37:13 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1p3Llf-0006f3-PC; Thu, 08 Dec 2022 13:37:13 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 q18-20020a056830441200b006704633f258so1408043otv.0; 
 Thu, 08 Dec 2022 10:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=pXPc2UIuoJWpuaUymY1xOJ9YUoNJZyEpL9Ef5O1HE0c=;
 b=Sw3rYciN4gEvpNy7IybAZ1bRChyVe8ehT3WkGKUsehvxAm8bMNMKpCrxqFaCN3vlmP
 Px/k5kHOzW0culXps4nIgnyUjcwpRFotKl35bV11XZg+eok+c96175NmWQyJ9PcDdLsl
 4EHTy6ByCiQuGQKy1lCiYyuiyvlkp8VCK/Sok8fPiRGM1TrFT9R+KRA4fqwYNoQkrnRb
 /sAGqeHoJI6CaSqi6jZnU8eb++kMFm+bffo05cHgy3V4bkBLb38bT0sZ23/B8VnxemF0
 lcFhUHe7kZUr6zcP0HN/XXyStaBoC0+F0zv5w8FdazMri38CAnIWaKKQgkDSX/GlCFK7
 qNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pXPc2UIuoJWpuaUymY1xOJ9YUoNJZyEpL9Ef5O1HE0c=;
 b=Ttdh3JvZtrUknIBolHgTMbGyHHAqDB2FJZNSoYoGhYypNoAjtk1kOmWjxS3cmKRSTp
 vmSzZNqrfkoHhrfOg3ZTbknZgXty6whm1zLwS+3eXKT8eqxxmBXfvBpaU2zyWWKRox7H
 UvZzpgKFrmL8JRd3R7KjSJ8N0wMuOfcUaWIeBHdctyEZ2VW3QWudLilFP8ncCwNuwsLy
 aVPMce5Y5oXCWnfZz2pV4/lIjQbh+N7LmTcaYVvA8OoMwdcCfu3tpgVXu9CNUlbUIcnl
 fNOYfSyamLZ5Gl0fohke7WhdF5ZuMZ/tWgobV4wVZItJqJvfgI+CrveIk8i/PGz/F1R0
 BEFw==
X-Gm-Message-State: ANoB5pnt34dDGgQX+dqbL1jRTLo2C4yu2AsEak1zALDTx89kyc6X96fD
 QpTX91cGPpgDvrojlTdzW8I=
X-Google-Smtp-Source: AA0mqf7SbTGcDCq60JqAJ+7IvP87V0A/7wQ/Y7nWey/t7jpTKL9ceCjC4XK583tu091YfumLJFBZtg==
X-Received: by 2002:a9d:75d8:0:b0:661:d4da:10d with SMTP id
 c24-20020a9d75d8000000b00661d4da010dmr46058060otl.266.1670524629413; 
 Thu, 08 Dec 2022 10:37:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w42-20020a05687033aa00b00144705fdd02sm8777481oae.43.2022.12.08.10.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 10:37:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 8 Dec 2022 10:37:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v2 3/3] hw/nvme: fix missing cq eventidx update
Message-ID: <20221208183707.GA3152153@roeck-us.net>
References: <20221208122642.80574-1-its@irrelevant.dk>
 <20221208122642.80574-4-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208122642.80574-4-its@irrelevant.dk>
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.229, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 08 Dec 2022 18:37:14 -0000

On Thu, Dec 08, 2022 at 01:26:42PM +0100, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Prior to reading the shadow doorbell cq head, we have to update the
> eventidx. Otherwise, we risk that the driver will skip an mmio doorbell
> write. This happens on riscv64, as reported by Guenter.
> 
> Adding the missing update to the cq eventidx fixes the issue.
> 
> Fixes: 3f7fe8de3d49 ("hw/nvme: Implement shadow doorbell buffer support")
> Cc: qemu-stable@nongnu.org
> Cc: qemu-riscv@nongnu.org
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  hw/nvme/ctrl.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index cfab21b3436e..f6cc766aba4a 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1334,6 +1334,14 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
>      }
>  }
>  
> +static void nvme_update_cq_eventidx(const NvmeCQueue *cq)
> +{
> +    trace_pci_nvme_update_cq_eventidx(cq->cqid, cq->head);
> +
> +    pci_dma_write(PCI_DEVICE(cq->ctrl), cq->ei_addr, &cq->head,
> +                  sizeof(cq->head));
> +}
> +
>  static void nvme_update_cq_head(NvmeCQueue *cq)
>  {
>      pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &cq->head,
> @@ -1355,6 +1363,7 @@ static void nvme_post_cqes(void *opaque)
>          hwaddr addr;
>  
>          if (n->dbbuf_enabled) {
> +            nvme_update_cq_eventidx(cq);
>              nvme_update_cq_head(cq);
>          }
>  

