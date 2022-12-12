Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4k7w-0007rc-DT
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 09:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1p4h3j-0000yX-R1
 for qemu-riscv@nongnu.org; Mon, 12 Dec 2022 06:33:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1p4h3i-0000QQ-7k
 for qemu-riscv@nongnu.org; Mon, 12 Dec 2022 06:33:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670844800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uQ7SSTzAKZAEPuOo+VRMk0f7LfqYIwBRz+115mwrcDw=;
 b=KQtDH3XoxnBL3FpEUL6f4C9Gufw6UH0IPLhjjG2BPcsi5ikT8uuXSuPWcemxB4our2Gs+L
 8cVtqVStly00RFTfOU4Gn8C8A19J3P8lnQfUF18IUqA6GgloTOyXdrYQhGiuaHcwxuT9JD
 5cA9u41PmK3Bn9PIcDJOUDaMKOPos6E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-569-u8IGkIt0NQ-JU55nF3oRjA-1; Mon, 12 Dec 2022 06:33:19 -0500
X-MC-Unique: u8IGkIt0NQ-JU55nF3oRjA-1
Received: by mail-wm1-f70.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so1924844wmg.0
 for <qemu-riscv@nongnu.org>; Mon, 12 Dec 2022 03:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uQ7SSTzAKZAEPuOo+VRMk0f7LfqYIwBRz+115mwrcDw=;
 b=RHLUV/br0NKz04PTcHCCE4eKn/6oq/VAEC616A3zgbE/7QBm8pmdd8QL3/DkRG2JKW
 b549U1vDuD8sPqFTGHV+Kvaa4kxWoOhnZcG3eswfS39P9hUuPA4lp0SIdksxIE6IS+iq
 Dx+Xypg4KBvBTZyVkiqjUhcg+NDTN4SE2C04vq4YvyspkT0O6FgNksx4tdLzsq4dKeyj
 ejyyK2Xf9uU44BlIjD12wWF5odRRmpNIT7g1B0r8FBMRdnhg0TrGwrxAIWy4XhLHeXS2
 fN9E5BcEC81I/VGzcE52+flOEFBnPryHS+22fStf+tV1ab+EMG5wA4XxqFYUJmkOjAfk
 snmQ==
X-Gm-Message-State: ANoB5pn38Yce/jnVi2TyQxEdmRIGeyqtuREGmiQxPakNQeaz5yp1ctho
 C7EMws1TnPf83WojLp/HTgCYecSagzWCiluFSmrB3k5ARbVO0KdWqZBRQe2aIMOytxeF0kCuajy
 7Qt52gSTvICl9s+4=
X-Received: by 2002:a05:600c:3d11:b0:3cf:4d3e:c237 with SMTP id
 bh17-20020a05600c3d1100b003cf4d3ec237mr12442643wmb.27.1670844798099; 
 Mon, 12 Dec 2022 03:33:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf60XQo4PczgukP5ShMqC/vWYYxGolbJZThuHOcUTMCabxYbqN6mNlZurcTWbCqKgqdtlKkFfg==
X-Received: by 2002:a05:600c:3d11:b0:3cf:4d3e:c237 with SMTP id
 bh17-20020a05600c3d1100b003cf4d3ec237mr12442597wmb.27.1670844797748; 
 Mon, 12 Dec 2022 03:33:17 -0800 (PST)
Received: from sgarzare-redhat (host-87-11-6-51.retail.telecomitalia.it.
 [87.11.6.51]) by smtp.gmail.com with ESMTPSA id
 be12-20020a05600c1e8c00b003cf6c2f9513sm9121594wmb.2.2022.12.12.03.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 03:33:17 -0800 (PST)
Date: Mon, 12 Dec 2022 12:33:13 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, laurent@vivier.eu,
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn,
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de,
 jasowang@redhat.com, vikram.garhwal@amd.com,
 francisco.iglesias@amd.com, clg@kaod.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de
Subject: Re: [PATCH 1/2] include/hw/virtio: Break inclusion loop
Message-ID: <20221212113313.ex6owi6ricvcnm5c@sgarzare-redhat>
References: <20221210133915.4104305-1-armbru@redhat.com>
 <20221210133915.4104305-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221210133915.4104305-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 12 Dec 2022 09:49:55 -0500
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
X-List-Received-Date: Mon, 12 Dec 2022 11:33:24 -0000

On Sat, Dec 10, 2022 at 02:39:14PM +0100, Markus Armbruster wrote:
>hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
>former doesn't actually need the latter, so drop that inclusion to
>break the loop.
>
>Signed-off-by: Markus Armbruster <armbru@redhat.com>
>---
> include/hw/virtio/virtio.h | 1 -
> hw/virtio/virtio.c         | 1 +
> 2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>index a973811cbf..8b68b69e00 100644
>--- a/include/hw/virtio/virtio.h
>+++ b/include/hw/virtio/virtio.h
>@@ -22,7 +22,6 @@
> #include "standard-headers/linux/virtio_config.h"
> #include "standard-headers/linux/virtio_ring.h"
> #include "qom/object.h"
>-#include "hw/virtio/vhost.h"
>
> /*
>  * A guest should never accept this. It implies negotiation is broken
>diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>index eb6347ab5d..faedf886da 100644
>--- a/hw/virtio/virtio.c
>+++ b/hw/virtio/virtio.c
>@@ -26,6 +26,7 @@
> #include "qemu/module.h"
> #include "qom/object_interfaces.h"
> #include "hw/virtio/virtio.h"
>+#include "hw/virtio/vhost.h"
> #include "migration/qemu-file-types.h"
> #include "qemu/atomic.h"
> #include "hw/virtio/virtio-bus.h"
>-- 
>2.37.3
>
>


