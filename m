Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8ZLQ-0007Ya-Mi
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 23:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8YGX-000102-Ku
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 21:58:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8YGU-0000T0-M2
 for qemu-riscv@nongnu.org; Thu, 22 Dec 2022 21:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671764310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37T1Ua6f16ASCKshtuVi6SLKoblBpsm65cEzKCjvKw4=;
 b=R19AHmH10KhGfsIePmujJxhwFaZ9w56n/QVvs440enwhycTWiCNPcSIeJ3BYUvNBs+MIZi
 lIpLs0ambr1rlC21/i+uB8+BxUUmJGRLw5HpHtq0LEU/MUEx/PTXayau2sem+lFBe1xyHz
 lWouCe/+whfoSBnKYpb+TrbroY+JIOE=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-J8UxmyrqOoeDn9uXV28Rpg-1; Thu, 22 Dec 2022 21:58:19 -0500
X-MC-Unique: J8UxmyrqOoeDn9uXV28Rpg-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1443ed029f2so1853127fac.4
 for <qemu-riscv@nongnu.org>; Thu, 22 Dec 2022 18:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=37T1Ua6f16ASCKshtuVi6SLKoblBpsm65cEzKCjvKw4=;
 b=yHpj3C3rlvt3HwA6Xtunk214wFNA/Qpa48YSyVOq4fkhfAyhBZLlK3kbHNhJvfr1kD
 rWcIhINOh6ijOgJNC9Dvv4/i0hiNU6bZyyz5kKt0KXsgJt7YLW9oJTt1QRN0mbM4cpTr
 rs62Sq1lt/qlSYKyKi8rnjK/oSEKlKpGaC2Ned/9J8J7VTQk1P11Nt2Bs8KENUTpcgBV
 1EZcsGw/rSSTdWqd1ybN3SKoKEaBmbZO392MjAgMmkrjU43RqkIsmtg7I1GjdAq0dAqe
 XClbh+NtrNnwbIZULKR3IZFR2u41K5NZP2BoNbfh9LdYBVqHFvvpcmpj7kCzoZiA5mb4
 40Iw==
X-Gm-Message-State: AFqh2kqAj/D9zsSrmPe5ju2bsgkiIj2x/FLHFshlgR5dAbgiZNDz/cKL
 rorqubg3oq96zHhaxFkRLNzHT1M7XdqjGhZWT4mEC2Ukb4BC5y7UjDoEWV5DseEhgZC52VA1qDb
 QTH/P7rBf1nRFMdwMLhj0HypZQYcmbQM=
X-Received: by 2002:a4a:d287:0:b0:49f:449a:5f6c with SMTP id
 h7-20020a4ad287000000b0049f449a5f6cmr356527oos.93.1671764298478; 
 Thu, 22 Dec 2022 18:58:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvTjkB7mYQM07EvAF5MRKOIQWtwBGZ19FtayGPZmgDJk0/6CRSzSKyc37LHhEClds6F5GkmqsEyjPAnQyjZ8yI=
X-Received: by 2002:a4a:d287:0:b0:49f:449a:5f6c with SMTP id
 h7-20020a4ad287000000b0049f449a5f6cmr356504oos.93.1671764298212; Thu, 22 Dec
 2022 18:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20221222120813.727830-1-armbru@redhat.com>
 <20221222120813.727830-2-armbru@redhat.com>
In-Reply-To: <20221222120813.727830-2-armbru@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 23 Dec 2022 10:58:06 +0800
Message-ID: <CACGkMEs6R45JkYm294ms33yWJheD0oB6Zs3gvC1d7sv+-oHufA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] include/hw/virtio: Break inclusion loop
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com, 
 ani@anisinha.ca, peter.maydell@linaro.org, laurent@vivier.eu, 
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com, bin.meng@windriver.com, 
 palmer@dabbelt.com, marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn, 
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de, 
 vikram.garhwal@amd.com, francisco.iglesias@amd.com, clg@kaod.org, 
 kraxel@redhat.com, marcandre.lureau@redhat.com, riku.voipio@iki.fi, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, 
 crwulff@gmail.com, marex@denx.de, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Dec 2022 23:07:40 -0500
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
X-List-Received-Date: Fri, 23 Dec 2022 02:58:35 -0000

On Thu, Dec 22, 2022 at 8:08 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
> former doesn't actually need the latter, so drop that inclusion to
> break the loop.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  include/hw/virtio/virtio.h | 1 -
>  hw/virtio/virtio-qmp.c     | 1 +
>  hw/virtio/virtio.c         | 1 +
>  3 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 24561e933a..48ab2117b5 100644
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
> diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
> index 8e7282658f..3d4497da99 100644
> --- a/hw/virtio/virtio-qmp.c
> +++ b/hw/virtio/virtio-qmp.c
> @@ -11,6 +11,7 @@
>
>  #include "qemu/osdep.h"
>  #include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
>  #include "virtio-qmp.h"
>
>  #include "standard-headers/linux/virtio_ids.h"
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 289eb71045..0ec6ff9ae4 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -25,6 +25,7 @@
>  #include "qom/object_interfaces.h"
>  #include "hw/core/cpu.h"
>  #include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
>  #include "migration/qemu-file-types.h"
>  #include "qemu/atomic.h"
>  #include "hw/virtio/virtio-bus.h"
> --
> 2.38.1
>


