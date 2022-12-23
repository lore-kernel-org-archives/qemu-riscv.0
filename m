Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8YmT-0000xh-1U
	for mharc-qemu-riscv@gnu.org; Thu, 22 Dec 2022 22:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p8YmR-0000xJ-U7; Thu, 22 Dec 2022 22:31:31 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1p8YmP-0008F8-CR; Thu, 22 Dec 2022 22:31:31 -0500
Received: by mail-lf1-x132.google.com with SMTP id f34so5458331lfv.10;
 Thu, 22 Dec 2022 19:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/E6/UokYpkkrQBRRyePReZjeOa8Wqmm98azdchBfnP0=;
 b=Cv5uxFZQ4Fq6PPEB/2I9k1Bh+4WxaDiP+03AgubOCSW1uwoK+Z6eLYcZOj3pJpk4mM
 aiBLqi7dVowE+he6GdkgkilVzblATFSaxBocnlgrAW9d/InKfUYSDndoJfoxLi76VqnC
 DpbhcjbwlhtLrAztOWCvvzOe2+0rFPxpHxnnVclbqrt5LFbNpGkE6bTZAmri40WnOxyN
 r3pZVLoLWiMR8f0P44K86YlO+AP0piX4yvohap3wxUUG7Y4MxjWZS+dkhHCh+vB+6UAq
 YUiPxOKrNyhsvVDcMH54mL8UTk6HPchCvjdxAN1F00EjFpKDzqn4dTsPrXh+pNZySedp
 fpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/E6/UokYpkkrQBRRyePReZjeOa8Wqmm98azdchBfnP0=;
 b=TWhwxkJZXaCSRpKkU537ngf+43Ofq3tkgqmPVKykrn7PHo1XA7SKbQRKRnxHbRBhBs
 rC+QKcitJyY+K+Jk7TWroMgubtMJuoToVfOt8Y3Krg9cVPQKoI6WIrO2GQMoDZ87K8Tb
 C0+vYY07fZB5dJYsl7FoFyuMk4Xqdvz095X5yJcN7qxJloWVLBoD5VnUkABCsQelJRUs
 Bnas1vZEzIrk3Od5o3V61oV4LsBJ21ogU3D1w0byYMTpMDZLsCmcRFQBOJVjzgHVYDK2
 QxhT31q4aXjDEdrlNiVfjd9QAQ977cctYR4QebBHEzzECJT+hoA5kOIZDdoJnwygElgU
 Gt5Q==
X-Gm-Message-State: AFqh2kpfxHp7DBv5S9ViTTrDFr/aTkwxaD4du4Kub1o7xVenX5epLhpY
 V2PIy58nQT7FwLnsZ3Akwyg=
X-Google-Smtp-Source: AMrXdXtnUPbvcyYVs62dSggSSzsRa6ztv9ucRG2ckFHtyVbk6d0P9SUVUfF9arafFbPbZ5KR219xFg==
X-Received: by 2002:a05:6512:3b2a:b0:4b5:5efb:7d26 with SMTP id
 f42-20020a0565123b2a00b004b55efb7d26mr3280813lfv.37.1671766285709; 
 Thu, 22 Dec 2022 19:31:25 -0800 (PST)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056512210e00b004a2c447598fsm324598lfr.159.2022.12.22.19.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 19:31:25 -0800 (PST)
Date: Fri, 23 Dec 2022 04:31:24 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu,
 Alistair.Francis@wdc.com, bin.meng@windriver.com,
 palmer@dabbelt.com, marcel.apfelbaum@gmail.com,
 yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 richard.henderson@linaro.org, deller@gmx.de, vikram.garhwal@amd.com,
 francisco.iglesias@amd.com, clg@kaod.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v2 1/4] include/hw/virtio: Break inclusion loop
Message-ID: <Y6UhDBkMSSoLm9G0@toto>
References: <20221222120813.727830-1-armbru@redhat.com>
 <20221222120813.727830-2-armbru@redhat.com>
 <CACGkMEs6R45JkYm294ms33yWJheD0oB6Zs3gvC1d7sv+-oHufA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEs6R45JkYm294ms33yWJheD0oB6Zs3gvC1d7sv+-oHufA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 23 Dec 2022 03:31:32 -0000

On Fri, Dec 23, 2022 at 10:58:06AM +0800, Jason Wang wrote:
> On Thu, Dec 22, 2022 at 8:08 PM Markus Armbruster <armbru@redhat.com> wrote:
> >
> > hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
> > former doesn't actually need the latter, so drop that inclusion to
> > break the loop.
> >
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>




> 
> Acked-by: Jason Wang <jasowang@redhat.com>
> 
> Thanks
> 
> > ---
> >  include/hw/virtio/virtio.h | 1 -
> >  hw/virtio/virtio-qmp.c     | 1 +
> >  hw/virtio/virtio.c         | 1 +
> >  3 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> > index 24561e933a..48ab2117b5 100644
> > --- a/include/hw/virtio/virtio.h
> > +++ b/include/hw/virtio/virtio.h
> > @@ -22,7 +22,6 @@
> >  #include "standard-headers/linux/virtio_config.h"
> >  #include "standard-headers/linux/virtio_ring.h"
> >  #include "qom/object.h"
> > -#include "hw/virtio/vhost.h"
> >
> >  /*
> >   * A guest should never accept this. It implies negotiation is broken
> > diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
> > index 8e7282658f..3d4497da99 100644
> > --- a/hw/virtio/virtio-qmp.c
> > +++ b/hw/virtio/virtio-qmp.c
> > @@ -11,6 +11,7 @@
> >
> >  #include "qemu/osdep.h"
> >  #include "hw/virtio/virtio.h"
> > +#include "hw/virtio/vhost.h"
> >  #include "virtio-qmp.h"
> >
> >  #include "standard-headers/linux/virtio_ids.h"
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index 289eb71045..0ec6ff9ae4 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -25,6 +25,7 @@
> >  #include "qom/object_interfaces.h"
> >  #include "hw/core/cpu.h"
> >  #include "hw/virtio/virtio.h"
> > +#include "hw/virtio/vhost.h"
> >  #include "migration/qemu-file-types.h"
> >  #include "qemu/atomic.h"
> >  #include "hw/virtio/virtio-bus.h"
> > --
> > 2.38.1
> >
> 

