Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E01CC8303C
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 20:00:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uZEUT-0003dP-2q; Tue, 08 Jul 2025 16:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCOs-0001zL-P0
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:46:39 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCNv-0003qY-6s
 for qemu-riscv@nongnu.org; Tue, 08 Jul 2025 13:46:38 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae3cd8fdd77so982916566b.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Jul 2025 10:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751996734; x=1752601534; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4XBodQSROD8wkglC7LQNsiAxFO/V5HnbCa2RbyfuTVw=;
 b=EKA9h/yokkK8mPnzJ+0mOoKqfXoAmuEScEBQXlIvdKozEmqsOvXvEYUGEiFyWMwTwL
 KeP/Gi3r5HDqoRoLM1FBgH9/WqqwwQjMdyBubiMB52P6BcN47/LIfX32H47TnVEqLMEl
 yqciYMldW7oYUYcokYF1Ydhug3kIw/ILwda8fKyMRHTb17yyXKcmCjTIdMiW4ubnarAD
 jCJgBd/KFglFuP4j6UuBAReJACISkAxWaZDS3rGFk6MlP9uRZEM0DYDIuCl8H/HW6fYC
 514qcJXduQkUE+SgeQPQODu2nlM6i6puUjAZNwf6F0lpXS/us+7L074FCQ9uEXfFf/2v
 ZaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751996734; x=1752601534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4XBodQSROD8wkglC7LQNsiAxFO/V5HnbCa2RbyfuTVw=;
 b=LIO/K70GFy0O9LYhTn2PH5OZ+E2MDN2VjKSvnmsvPH/ikigu/xnaNyCGcujyVayi26
 2oYJsx5q+KlUvh7jl7fZY1w6jPnIV35RY8uebMw419d3okaH+qZhQ8zelwABKNhLqOr7
 MaPuQX+El0wAUPWZw8PCAxD3ek9Qnm+noyRkvh/TGCz6GXw0BpsBXtzlHyPdlStOIZWE
 7AaU6Z6DvH6SwYa7x5AQ8aGvp4PrUcbHC4qdvWQ5w7rnpShWOFrOwMMMOickz3cS0LoH
 BZQEKvLuTyKncVtQNi45LgBf/+XYsUYc+DteXAVGEZx0FoE9p9Nzr93Rr3cMqb5/5qoB
 JvYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOtLfgnxB5GAQplTh/tIiN/6mAOL7wyloXRiz082niFLSJPhCzDUBBBBJ0gqKyaIfIOtpQ9FNPEdQZ@nongnu.org
X-Gm-Message-State: AOJu0YzGE2k7xGbo4Uhd4txT/8XQjBstrUFbhPxNhzp5F7Md1l0XvAUR
 VbkMHeyCaObKN6HGbkfE0cs/4v/4fNOp8eXbT5A6KUtlvlzGgHR9bdgMA29NMIGjTdTIn8pNzmW
 AsH5GugU=
X-Gm-Gg: ASbGncvYstrwsSxwxEDXz4D1LuYTNkRQSiMn8pEihALcR3iYqTArsCbXjl0lyLkRpji
 90zyjWgOdvJy8yWVSzqxn7jM/fHXAEsA3n8UBzAAJbz/Mmf2qNsxDz5L7QOI7s06cUrEjpUvHZL
 LXiczg+Kbl9i23kFaaDybdSLK5ttwN7AiYQQPuCAhRpWs0rYZ9USgI5mqoMp40EsYxauW6C7/gd
 9Cqo8bElH9fw314NMYAM1QT120Vwpfo41YsaLkf+SAdLr5c9j59maFNrJ/MZbT+HTblJjabFvbc
 EOC7WjxfhFF3KcFsOJmh6A0FIgeHTLdg1teXn6f2tnBo/P9aGSwE1B0sq1u7LPPbCic3MFHCB4x
 bxh536uihNdpmZRCoTypDP3Ko3KC3Dg==
X-Google-Smtp-Source: AGHT+IFYrA0gK6QeZ2HxMQl3p/ZUhSkytREMZ1X9mDDfs8B1Np5M4o/aiK8fRXsF3TIg/X2pS/+SjQ==
X-Received: by 2002:a05:6000:2b0e:b0:3b5:dfc2:f0ca with SMTP id
 ffacd0b85a97d-3b5dfc2f414mr843121f8f.40.1751969863893; 
 Tue, 08 Jul 2025 03:17:43 -0700 (PDT)
Received: from [192.168.69.242] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d0a5csm12387002f8f.29.2025.07.08.03.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 03:17:43 -0700 (PDT)
Message-ID: <64700490-e94b-405e-92cf-2ffc25537aea@linaro.org>
Date: Tue, 8 Jul 2025 12:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v6 09/14] hw/virtio: Build various files once
To: qemu-devel@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20250707172009.3884-1-philmd@linaro.org>
 <20250707172009.3884-10-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250707172009.3884-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

(Forgot to Cc Manos)

On 7/7/25 19:20, Philippe Mathieu-Daudé wrote:
> Now than various VirtIO files don't use target specific
> API anymore, we can move them to the system_ss[] source
> set to build them once.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/virtio/virtio-config-io.c |  1 -
>   hw/block/meson.build         |  6 ++++--
>   hw/virtio/meson.build        | 20 +++++++++++---------
>   3 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/virtio/virtio-config-io.c b/hw/virtio/virtio-config-io.c
> index ad78e0b9bc5..f58d90b6e31 100644
> --- a/hw/virtio/virtio-config-io.c
> +++ b/hw/virtio/virtio-config-io.c
> @@ -11,7 +11,6 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/virtio/virtio.h"
> -#include "cpu.h"
>   
>   uint32_t virtio_config_readb(VirtIODevice *vdev, uint32_t addr)
>   {
> diff --git a/hw/block/meson.build b/hw/block/meson.build
> index 655704471a5..43ed296cf47 100644
> --- a/hw/block/meson.build
> +++ b/hw/block/meson.build
> @@ -13,7 +13,9 @@ system_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80_sfdp.c'))
>   system_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
>   system_ss.add(when: 'CONFIG_XEN_BUS', if_true: files('xen-block.c'))
>   
> -specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
> -specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c', 'virtio-blk-common.c'))
> +specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
> +system_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk-common.c'))
> +specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
> +system_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('virtio-blk-common.c'))
>   
>   subdir('dataplane')
> diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
> index 164f6fd995a..3ea7b3cec83 100644
> --- a/hw/virtio/meson.build
> +++ b/hw/virtio/meson.build
> @@ -1,6 +1,7 @@
>   system_virtio_ss = ss.source_set()
>   system_virtio_ss.add(files('virtio-bus.c'))
>   system_virtio_ss.add(files('iothread-vq-mapping.c'))
> +system_virtio_ss.add(files('virtio-config-io.c'))
>   system_virtio_ss.add(when: 'CONFIG_VIRTIO_PCI', if_true: files('virtio-pci.c'))
>   system_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'))
>   system_virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto.c'))
> @@ -10,11 +11,11 @@ system_virtio_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev.c')
>   
>   specific_virtio_ss = ss.source_set()
>   specific_virtio_ss.add(files('virtio.c'))
> -specific_virtio_ss.add(files('virtio-config-io.c', 'virtio-qmp.c'))
> +specific_virtio_ss.add(files('virtio-qmp.c'))
>   
>   if have_vhost
>     system_virtio_ss.add(files('vhost.c'))
> -  specific_virtio_ss.add(files('vhost-backend.c', 'vhost-iova-tree.c'))
> +  system_virtio_ss.add(files('vhost-backend.c', 'vhost-iova-tree.c'))
>     if have_vhost_user
>       # fixme - this really should be generic
>       specific_virtio_ss.add(files('vhost-user.c'))
> @@ -43,22 +44,22 @@ if have_vhost
>     endif
>     if have_vhost_vdpa
>       system_virtio_ss.add(files('vhost-vdpa.c'))
> -    specific_virtio_ss.add(files('vhost-shadow-virtqueue.c'))
> +    system_virtio_ss.add(files('vhost-shadow-virtqueue.c'))
>     endif
>   else
>     system_virtio_ss.add(files('vhost-stub.c'))
>   endif
> +system_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c'))
> +system_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
>   
>   specific_virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-balloon.c'))
>   specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs.c'))
>   specific_virtio_ss.add(when: 'CONFIG_VIRTIO_PMEM', if_true: files('virtio-pmem.c'))
>   specific_virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock.c'))
> -specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.c'))
> -specific_virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
> -specific_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: [files('virtio-nsm.c', 'cbor-helpers.c'), libcbor])
>   specific_virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
> -specific_virtio_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('vhost-user-scmi.c'))
> -specific_virtio_ss.add(when: ['CONFIG_VIRTIO_PCI', 'CONFIG_VHOST_USER_SCMI'], if_true: files('vhost-user-scmi-pci.c'))
> +system_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: files('virtio-nsm.c'))
> +system_virtio_ss.add(when: 'CONFIG_VIRTIO_NSM', if_true: [files('cbor-helpers.c'), libcbor])
> +system_virtio_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('vhost-user-scmi.c'))
>   
>   virtio_pci_ss = ss.source_set()
>   virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
> @@ -67,6 +68,7 @@ virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk-
>   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCSI', if_true: files('vhost-user-scsi-pci.c'))
>   virtio_pci_ss.add(when: 'CONFIG_VHOST_SCSI', if_true: files('vhost-scsi-pci.c'))
>   virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-pci.c'))
> +virtio_pci_ss.add(when: 'CONFIG_VHOST_USER_SCMI', if_true: files('vhost-user-scmi-pci.c'))
>   
>   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-crypto-pci.c'))
>   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('virtio-input-host-pci.c'))
> @@ -85,7 +87,7 @@ virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem-pci.c'))
>   virtio_pci_ss.add(when: 'CONFIG_VHOST_VDPA_DEV', if_true: files('vdpa-dev-pci.c'))
>   virtio_pci_ss.add(when: 'CONFIG_VIRTIO_MD', if_true: files('virtio-md-pci.c'))
>   
> -specific_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
> +system_virtio_ss.add_all(when: 'CONFIG_VIRTIO_PCI', if_true: virtio_pci_ss)
>   
>   system_ss.add_all(when: 'CONFIG_VIRTIO', if_true: system_virtio_ss)
>   system_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))


