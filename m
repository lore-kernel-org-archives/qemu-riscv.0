Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD19C282DE
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 12:40:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tqX04-0005DZ-7J; Fri, 07 Mar 2025 07:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tqWzt-00052H-Hv
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 07:40:17 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tqWzn-0002JS-3p
 for qemu-riscv@nongnu.org; Fri, 07 Mar 2025 07:40:09 -0500
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3f3da35555eso1003705b6e.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Mar 2025 04:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1741351202; x=1741956002; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wyVdeXu2D6TSunIj/hbFRqVIEaBOmx3AQY685BxEiaQ=;
 b=VRn0T3X4Bqo6URXAKiBEiMs5qICni1BXftBVZFHmiU4zu3jpJBmOgRL5SQJiItQkrN
 q7ItXl2P9ulObcXjWIkRbJGMd3FR/K9M+ZxhTa1xwHxzLt0+NGmYjWPKVmnTfjl/+guE
 U0QLNmhaMZle8K7zz+Uofy9d4TZGDrv82z3G5pKs2ICHDYp16Qrq3F4nVpdbK7Gc5Tqt
 SA3ofSZoQSoXxataWhNpASo3BZDbSLsVK5P0DXzjAYtmVjyipfT6yoxrO7Hwk5l3YzQ7
 cNUZQ4G+jtt4RusDveFKI2/V5Jfch+KWAxvTEK1Vf3ABeFbJMGVxjMBdI2Uv/ivPyiDs
 r1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741351202; x=1741956002;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wyVdeXu2D6TSunIj/hbFRqVIEaBOmx3AQY685BxEiaQ=;
 b=Kdr07l1KX4LZ7FWPY9HcVR8ssfyQzbWE3PNHKXb1bPgxANKZWLyyPyThmRvYTnDhaV
 3iyem2qa8KQzmHtBU58RVI3Lpqe0tWOs7UaBG9KsFfQ0kGnk4v8vacTsu0xP7C5BGAL6
 BdvYan7G7Wp/RCIwcu0tGJ+vJ9l3ultWcPaYUtpWUzOmT/+9CO5ojF1rOHN4UKjju6CF
 cZ+EvjmYt2LIt4CLeuzJQHErpLsPNkN52hiOHuwHJr7anoAELojOack58qFqGbHIpzc+
 YsKoJyGK0c6Q5EcWfc1IaCmA3RDwbdemSJPNFWY1aEEi5q6e7t7K4TFGDuQPo30OHpca
 LAyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaz2lNhLlASkNm27Y0DY3MQtlkgWiUX6+RzTip3merJDb3mqVeMU5RN1Tbm2S2tzsytwEWEQyAEdbU@nongnu.org
X-Gm-Message-State: AOJu0YzE0b80Us0a3oSFN9WdfeS4D3FevEtqfo1FRw7Yj4DHUJ+VjS3q
 IBdI5rhiUAJuSXhYrlYrV6PDMFYCEZjOAID7MB3XrgVbhVQHku0VvcJeI9vjnlQ=
X-Gm-Gg: ASbGncvuSC1fJVcIW6KEyy5iggZbrBUrayC7Vigpb5ykcV0dQPDNdm6/YNbaCvrqGjP
 n0LZB3s6PMzVGEGRT+Sv+5nLo75LEgZhD6lTbVQfecxNMb1anINuem+luly7+AXo2PbY4e2WDNN
 r46sWfTtS6q2BwRiBga5bjyY/tVkBR6xQi1PavwzHUZQSG8O+MuBya0leURubaj0w708DY1CPjc
 rAcB3H2f1ZOZK8XbkZySA8RRYP+4vrztl2n7Po1IJ3Mq70f4YUQ+LspzZtiqeJAOZsAJ0CXpVYb
 ciVTNp0x7V0Qceq/AX3U0fLLtW5bjiZQDU4PclUaxOECPYjNnJHQzP8ydCA=
X-Google-Smtp-Source: AGHT+IG9LttOnb88gGfkkomSDsTE533uca5EP61J7/ffgSQtS7BK9Efxx2ncM2YAfDj6GCseXI7U4A==
X-Received: by 2002:a05:6808:1819:b0:3f6:7192:6aaf with SMTP id
 5614622812f47-3f697b6635dmr1834719b6e.22.1741351202128; 
 Fri, 07 Mar 2025 04:40:02 -0800 (PST)
Received: from [192.168.68.110] ([177.170.118.40])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f68f0572bdsm650408b6e.46.2025.03.07.04.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 04:40:00 -0800 (PST)
Message-ID: <0464a115-fbfe-4038-9e2d-409ad133647e@ventanamicro.com>
Date: Fri, 7 Mar 2025 09:39:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] include/hw/pci: Attach BDF to Memory Attributes
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20250302091209.20063-1-jason.chien@sifive.com>
 <20250302091209.20063-2-jason.chien@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250302091209.20063-2-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 3/2/25 6:12 AM, Jason Chien wrote:
> This commit adds the BDF to the memory attributes for DMA operations.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---

This looks sensible but I'll feel more comfortable if Michael/Marcel also
takes a look. Thanks,


Daniel

>   include/hw/pci/pci_device.h | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
> index add208edfa..968f1ba3e9 100644
> --- a/include/hw/pci/pci_device.h
> +++ b/include/hw/pci/pci_device.h
> @@ -244,6 +244,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
>                                        void *buf, dma_addr_t len,
>                                        DMADirection dir, MemTxAttrs attrs)
>   {
> +    attrs.unspecified = 0;
> +    attrs.requester_id = pci_requester_id(dev);
>       return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
>                            dir, attrs);
>   }
> @@ -292,6 +294,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
>                                                  uint##_bits##_t *val, \
>                                                  MemTxAttrs attrs) \
>       { \
> +        attrs.unspecified = 0; \
> +        attrs.requester_id = pci_requester_id(dev); \
>           return ld##_l##_dma(pci_get_address_space(dev), addr, val, attrs); \
>       } \
>       static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
> @@ -299,6 +303,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
>                                                  uint##_bits##_t val, \
>                                                  MemTxAttrs attrs) \
>       { \
> +        attrs.unspecified = 0; \
> +        attrs.requester_id = pci_requester_id(dev); \
>           return st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
>       }
>   
> @@ -327,8 +333,8 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
>   static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
>                                   dma_addr_t *plen, DMADirection dir)
>   {
> -    return dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
> -                          MEMTXATTRS_UNSPECIFIED);
> +    MemTxAttrs attrs = {.requester_id = pci_requester_id(dev)};
> +    return dma_memory_map(pci_get_address_space(dev), addr, plen, dir, attrs);
>   }
>   
>   static inline void pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len,


