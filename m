Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p7eBy-0002XS-4g
	for mharc-qemu-riscv@gnu.org; Tue, 20 Dec 2022 10:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eBw-0002Sv-5T
 for qemu-riscv@nongnu.org; Tue, 20 Dec 2022 10:06:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eBu-0006dR-Jn
 for qemu-riscv@nongnu.org; Tue, 20 Dec 2022 10:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671548758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v3ldk6plhvP/ViIABz50rAc8FDFS41LGc3HDMVl68Ac=;
 b=h5YklHvgYdj2xwjsf5lf0Re4LF8f7Ehfz1a7+R6Bb3EpBsNfKXXLjeTMyzs/IeE/QrkLR5
 Cj0msN2W7OIgGr6kKWwbb9djcX7UzEfUQkSNZyNZyjP7C8RPw0F7qfpwkMXSJndoaokcwt
 nZX7FSwNyHiV/Gl75wNQsjtTpjMAxDU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-Ds_CjVnbNUqKbkqrt6Cdgg-1; Tue, 20 Dec 2022 10:05:57 -0500
X-MC-Unique: Ds_CjVnbNUqKbkqrt6Cdgg-1
Received: by mail-yb1-f200.google.com with SMTP id
 203-20020a2502d4000000b006f94ab02400so14395355ybc.2
 for <qemu-riscv@nongnu.org>; Tue, 20 Dec 2022 07:05:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3ldk6plhvP/ViIABz50rAc8FDFS41LGc3HDMVl68Ac=;
 b=wQ91Cfv82DBN8fcDbxWyB6RAw7BldR8Rm0BMwJg8FoIC5atdv24cj95B82HDlQ9ytA
 qMseUARDNk+b3QnfbSwsiTLDJ9kQF6FuCenC3ogJHL3vYjJYGaJ2pYxkcr510RdvvHxg
 gVON+DG4ln0BHyxVnf4H/+bAgpizKZiWft9mV5vqu+nrpTgTugJxBO77D8tOdPlv4FIV
 xAFkMGEmf6SGrIYlbrm0AgGrS0KNzhNKWf5JUeKKhr/DT0tdnQzbHbSRbycFWKCZNsoH
 /XPmKvmAP4kvCv+b5OI1oMkVof6xRcqmcEpmeZHosQhxK8mzLK/RA0k1JU57kwxHIEi+
 838w==
X-Gm-Message-State: ANoB5pmxLUKXwcuRP0XyGWYzkdKz1Qz1ILaOdiaIeUSe72i0WgjOK3bm
 H9iC/pupBW6ZDUXHzQsJewVaO+NOt3cUavQJCpowcuJyKYH7IqkBG8TNtJQeCphIiV1m/e8ohUN
 exS0vw3ID87r7DyA=
X-Received: by 2002:a05:7500:2d9a:b0:ea:78bf:c0de with SMTP id
 er26-20020a0575002d9a00b000ea78bfc0demr4152222gab.56.1671548740716; 
 Tue, 20 Dec 2022 07:05:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5r7yjmP5nGm6xSL2zTod+xaqKIPD99Q3PqEQXAgsNJ+FsKl+1sHeWi/zFWk7E7khYKzgGLUQ==
X-Received: by 2002:a05:7500:2d9a:b0:ea:78bf:c0de with SMTP id
 er26-20020a0575002d9a00b000ea78bfc0demr4152191gab.56.1671548740307; 
 Tue, 20 Dec 2022 07:05:40 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 q20-20020a05620a0d9400b006eeca296c00sm9108385qkl.104.2022.12.20.07.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 07:05:38 -0800 (PST)
Date: Tue, 20 Dec 2022 10:05:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu,
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
Message-ID: <20221220100515-mutt-send-email-mst@kernel.org>
References: <20221210133915.4104305-1-armbru@redhat.com>
 <20221210133915.4104305-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221210133915.4104305-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 20 Dec 2022 15:06:05 -0000

On Sat, Dec 10, 2022 at 02:39:14PM +0100, Markus Armbruster wrote:
> hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
> former doesn't actually need the latter, so drop that inclusion to
> break the loop.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


feel free to merge

> ---
>  include/hw/virtio/virtio.h | 1 -
>  hw/virtio/virtio.c         | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index a973811cbf..8b68b69e00 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -22,7 +22,6 @@
>  #include "standard-headers/linux/virtio_config.h"
>  #include "standard-headers/linux/virtio_ring.h"
>  #include "qom/object.h"
> -#include "hw/virtio/vhost.h"
>  
>  /*
>   * A guest should never accept this. It implies negotiation is broken
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index eb6347ab5d..faedf886da 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -26,6 +26,7 @@
>  #include "qemu/module.h"
>  #include "qom/object_interfaces.h"
>  #include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
>  #include "migration/qemu-file-types.h"
>  #include "qemu/atomic.h"
>  #include "hw/virtio/virtio-bus.h"
> -- 
> 2.37.3
> 
> 
> 


