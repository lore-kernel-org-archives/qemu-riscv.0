Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4h7Q-0003LM-5P
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 06:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4h7O-0003Kc-OU
 for qemu-riscv@nongnu.org; Mon, 12 Dec 2022 06:37:10 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4h7M-0001fK-V7
 for qemu-riscv@nongnu.org; Mon, 12 Dec 2022 06:37:10 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so4903782wmh.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Dec 2022 03:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rm9sULq0pNBHmAfhegHG28G83H30tyMJ9tZVST/m8Xw=;
 b=XpcseYCOPsd79fRmwtgrd75Nx6l4jSFm7zq/w+jymWCR9uVNM/nW6Mb+vN1wxoN9r7
 qM4V3VtbBKfUUjNGnbDMzFxqb8dzkPqHG+2dq5OMrRs+mGcExPqhA/qwQHW5ddJMB7pJ
 CsyQlyikfclvCWdVUHXNNuvFk8zXt2iWFKlWEni7+XsGPPM4moRxkeRiQXLHKldOUYIi
 yqOjlJLZ9L/c6hXxXq1arZ81FFZplfc07/LQNwEKVqfH68MmFRqew2d55NQvRa5yzo5a
 sznbAY6WtLiRZ0efszUAh6TqPUQGBN4nR/TU3Re+JgZePeEJamP4a0d6NSsSgftY+KZD
 qK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rm9sULq0pNBHmAfhegHG28G83H30tyMJ9tZVST/m8Xw=;
 b=o4IB+BPjq9rY0duQ2O09rsGMySBoCPSHKTpVCe5rg7TI6lRCqQtsnFvW4diYKcCPXp
 USx8+3h72+qv/gnidy7XpAOnPPnj/ygMtKOhgcs53z76fDxl1voJ4mVONrLFBJ3EvLs+
 VZqOJr0ROPvBtQT4gGlv2qapGxH6nnpF0zGfwUs0OZzxCDfGPhwwhYE6BbVM4w6ydeOg
 7WHabhonhyxQ8YIjoq1MicZCOuDEVKZ2I20oW/gr4SguiUGxH/Bz9mzX5dIsOxgGnTVU
 gg93p86l3Oq/Bkm3GrgQ8cwGUJl2siRvHiN7ykfPqBdTC+am5IjHJwwwQYocFB1Nac5X
 Hb9Q==
X-Gm-Message-State: ANoB5plBX8+nClq33zMHIz5DksCvpsImn5N/T4CNB7ieROAvW94KK3cQ
 Y1nP3+vaRnrBzZmaSkFEd29T7A==
X-Google-Smtp-Source: AA0mqf5zRHoSntVgnY57EZ9BhchQ2OpS0ZfhC/yMdI6q04YyC29sOTmJZhAyRMmSTuBLWbUPeKXr2Q==
X-Received: by 2002:a05:600c:358f:b0:3d0:2815:77a1 with SMTP id
 p15-20020a05600c358f00b003d0281577a1mr12392138wmq.21.1670845027252; 
 Mon, 12 Dec 2022 03:37:07 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c468700b003d04e4ed873sm9789307wmo.22.2022.12.12.03.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 03:37:06 -0800 (PST)
Message-ID: <93658dff-fcba-590e-ba53-e5fdb3d841c1@linaro.org>
Date: Mon, 12 Dec 2022 12:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 4/4] hw/nvme: fix missing cq eventidx update
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Guenter Roeck <linux@roeck-us.net>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-stable@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221212113215.33135-1-its@irrelevant.dk>
 <20221212113215.33135-5-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221212113215.33135-5-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 12 Dec 2022 11:37:11 -0000

On 12/12/22 12:32, Klaus Jensen wrote:
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
> ---
>   hw/nvme/ctrl.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 8af70f0216f0..3df29ea68b2f 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1334,10 +1334,22 @@ static inline void nvme_blk_write(BlockBackend *blk, int64_t offset,
>       }
>   }


>   static void nvme_update_cq_head(NvmeCQueue *cq)
>   {
> -    pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &cq->head,
> -                 sizeof(cq->head));
> +    uint32_t v;
> +
> +    pci_dma_read(PCI_DEVICE(cq->ctrl), cq->db_addr, &v, sizeof(v));
> +
> +    cq->head = le32_to_cpu(v);
>   

Isn't this be part of the previous patch?

>       trace_pci_nvme_update_cq_head(cq->cqid, cq->head);
>   }


