Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71E3C369A2
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 15:29:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u4LkA-0007sk-2h; Mon, 14 Apr 2025 11:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1u4Lk2-0007rG-KC
 for qemu-riscv@nongnu.org; Mon, 14 Apr 2025 11:28:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1u4Ljz-0004n2-7o
 for qemu-riscv@nongnu.org; Mon, 14 Apr 2025 11:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744644533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fm9AsA4hAl0EPUVPZTlBFeK4p0y/hzKKTLJ4RjZWa8I=;
 b=bB+haLUn6r/2kV5ow1yxOcBL2oXPa5/sfI5ExMVCphbZkk6i9pGfKH/WXUnxECjEnoSTwn
 7Q14CPH0Xf0aB52rM/y5AXS9rBawZawpfQwsOvvHuFgs28HEASXFtFUfAh0cZK18/C0T8B
 kX8NuTMwg7Ef3nVm1bLHMr+HphYPYmY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-AhrQVn6tNRSs6-xxWViS5w-1; Mon, 14 Apr 2025 11:28:52 -0400
X-MC-Unique: AhrQVn6tNRSs6-xxWViS5w-1
X-Mimecast-MFC-AGG-ID: AhrQVn6tNRSs6-xxWViS5w_1744644531
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43ceb011ea5so26953095e9.2
 for <qemu-riscv@nongnu.org>; Mon, 14 Apr 2025 08:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744644531; x=1745249331;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fm9AsA4hAl0EPUVPZTlBFeK4p0y/hzKKTLJ4RjZWa8I=;
 b=OlgT9MwfGP/d01DVRNsSxmWODagxNdbvK4BDlo7TEeWecL6vXsgqcrTRDIjPcYeHDo
 Fuk2Nz4ZkG0uOKm/vtE4zzyVMJIkmqpdovIEIm1WEV9RDPx29usyROzylE/+NToi4Lis
 olnACKI9gU9D8tCKLi4eJgo6bNAU4ejDC6lqpihikWwWcJulEkwEvIS6fI8oD0o6U0JT
 s8Qw+EW5/mShK8BdEwY4LpDbMR24bJtH+ucq/hw7HXPoZv9KwpJ1xAzN9H0FAPYUIYQ4
 iUmxWN3c1i9HkmWYja/1RR8KQ1i9COrTxeZUSIOUTyhNp+hKa38UsUr+omxGtby/vt1D
 YUQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFVxzFe0b5lknndUGffY8oQCngwmUieCAL1DdERSa2QCoYEtatu2pICqMzUiUcfDSum0kEkQYm/XfB@nongnu.org
X-Gm-Message-State: AOJu0YxXel2FumNLZu6LG0kkOj1i75A6M/UCO6r2HIYytWXuIex+3ZDX
 SWpzEDcUcKY6KawKV21O0hcuO22rdsjUQn9eYrfKuvyO3frF18HeQQ0E/SlvKGvkBAK1iA2wxsO
 7aUA7Pe8W6bjGi66HINrJAOpyNaUdPdWs87SLWmCTKgPVhAuPQ9rZ
X-Gm-Gg: ASbGnct2gKZDBbFttosAcNfwd19vyYiaS878D2ZLBUdS7IkK8c6hhqwxn+pa4KlVV/9
 Wi1D4QJ7U3P+jkUZxD/gjUXUanUEx+ZcfG+/1JJjcW4sbu7p3XnyVtOd+oBjwDHngsujeXo5AH3
 MgLdHiXiX01SR34HDV75dusPcSNOTBGezqLetA9SxK/oqb+YRuj8gJZqwdGYgAB57aR35jztjbJ
 qGZ/xXkzOQqX61t8ozb5GETArTsqX4nm4ROZRFRF3oxNh4CwfRJC+m6Q9pZwudZXW9G5Et4dVRG
 h17gPw==
X-Received: by 2002:a05:600c:4e09:b0:43d:45a:8fca with SMTP id
 5b1f17b1804b1-43f3a9b035fmr137822995e9.30.1744644531011; 
 Mon, 14 Apr 2025 08:28:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuBkIMG8DQaEIUQuIHDtRmim+3lSFxIyJeVaHDRc8+YiQh6HHKef2N29r+ri1aAEVXP9nf7g==
X-Received: by 2002:a05:600c:4e09:b0:43d:45a:8fca with SMTP id
 5b1f17b1804b1-43f3a9b035fmr137822575e9.30.1744644530508; 
 Mon, 14 Apr 2025 08:28:50 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39ed15caa5asm6259636f8f.20.2025.04.14.08.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 08:28:49 -0700 (PDT)
Date: Mon, 14 Apr 2025 11:28:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Chien <jason.chien@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org
Subject: Re: [PATCH 1/3] include/hw/pci: Attach BDF to Memory Attributes
Message-ID: <20250414112346-mutt-send-email-mst@kernel.org>
References: <20250302091209.20063-1-jason.chien@sifive.com>
 <20250302091209.20063-2-jason.chien@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20250302091209.20063-2-jason.chien@sifive.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YO5ApyjhCjBOqYHMO_nbzt8X2C3X7vPHR1-Vf7EvxTw_1744644531
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, Mar 02, 2025 at 05:12:07PM +0800, Jason Chien wrote:
> This commit adds the BDF to the memory attributes for DMA operations.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> ---
>  include/hw/pci/pci_device.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
> index add208edfa..968f1ba3e9 100644
> --- a/include/hw/pci/pci_device.h
> +++ b/include/hw/pci/pci_device.h
> @@ -244,6 +244,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
>                                       void *buf, dma_addr_t len,
>                                       DMADirection dir, MemTxAttrs attrs)
>  {
> +    attrs.unspecified = 0;
> +    attrs.requester_id = pci_requester_id(dev);
>      return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
>                           dir, attrs);
>  }
> @@ -292,6 +294,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
>                                                 uint##_bits##_t *val, \
>                                                 MemTxAttrs attrs) \
>      { \
> +        attrs.unspecified = 0; \
> +        attrs.requester_id = pci_requester_id(dev); \
>          return ld##_l##_dma(pci_get_address_space(dev), addr, val, attrs); \
>      } \
>      static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
> @@ -299,6 +303,8 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
>                                                 uint##_bits##_t val, \
>                                                 MemTxAttrs attrs) \
>      { \
> +        attrs.unspecified = 0; \
> +        attrs.requester_id = pci_requester_id(dev); \
>          return st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
>      }
>  
> @@ -327,8 +333,8 @@ PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
>  static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
>                                  dma_addr_t *plen, DMADirection dir)
>  {
> -    return dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
> -                          MEMTXATTRS_UNSPECIFIED);
> +    MemTxAttrs attrs = {.requester_id = pci_requester_id(dev)};
> +    return dma_memory_map(pci_get_address_space(dev), addr, plen, dir, attrs);
>  }


Map is the only issue  - bdf can technically change between map and
unmap.
The use in hw/net/net_tx_pkt.c is fine as it's under BQL.
I don't know about the use in megasas though.
I think it is probably fine as it seems to deal with commands
and I think any driver would flush these if changing BDF.
Cc megasas maintainers just to make sure though.

Also, adding a code comment here can't hurt.


>  static inline void pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len,
> -- 
> 2.43.2


