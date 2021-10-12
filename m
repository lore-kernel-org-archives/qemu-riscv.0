Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maQTw-0003jR-5x
	for mharc-qemu-riscv@gnu.org; Tue, 12 Oct 2021 18:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maQTs-0003eC-1P; Tue, 12 Oct 2021 18:42:44 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maQTl-0006wI-T4; Tue, 12 Oct 2021 18:42:41 -0400
Received: by mail-io1-xd36.google.com with SMTP id x1so630862iof.7;
 Tue, 12 Oct 2021 15:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRtEZaYJhOVpcGkgSpDYO/ypCHhDFLv2oKEs05gHoQc=;
 b=RCmgtzTgUEy+a7cJIc45CsMuD1If47Q9oDktbDKJqDqob74BYDXx4KVSyodWOMNDc7
 yYX4tIpeHcPvsUuder/+zgIGQPiv2kz+6nVZRYdAYI+f+tX5biFbDHu11M4vk5LqXiwt
 npKmeFTFlZzupoR+HSPmF8KIzAwGCSxYxGZld2ils+snabL5hh1YTfxQUc5eUyQwkrGi
 uFX5DHtCcqD299HLuhwDdyakhUgCziha8wj7edCopTlkkuIwh1iR+Up+Umwh4tlh8Yeu
 I70rd0fJ9IDd9riwFOIWtuAsQH4N04junuNk5mByMDAEskva2JRiVDTYEdVavubU1thB
 Ph9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRtEZaYJhOVpcGkgSpDYO/ypCHhDFLv2oKEs05gHoQc=;
 b=18j4IIXZjV045piIf9eAyMzIMilwEwBaKeE2l0wKO8tXp4wOk6fYgcexQl/ZbQ+H1f
 bNl3SI1eu9rgCi3IjPl3Sajtumqpc8749Jy0+pykOA5ldTDILyx2a7Pm9H0157+Y/Nne
 tLTlT0PSzpwOOTGuXNhG7zB0TeF34Rfr1F55FvXWoo0Uq4zDyAaOi0oBwPZeEZ4Fz8Sj
 kF6ix/KGRCSPe9Ca+x4BSm3ZNvSSp8C8eImUwaH3qXFfRTLQZq0VPP/EUVmpYucdc2ky
 xW2lORVIMqpBQBg6uOS4Ap38muDwwHdts+c23YUlpgT62nbnt7dP7JbuUNFxuCVg8/DY
 H3nA==
X-Gm-Message-State: AOAM532hNORRbMFDgxNAQFxuV6Q5OaBCoQFQ/o+Tcv+1n/fUw/M+UXwd
 bpJcCfS36KsbQJRKc+LNhZ+K8/ltBwvuR5zebKs=
X-Google-Smtp-Source: ABdhPJyHZZiQyHCZV1hTTNLscSJMvVXjFaVEx8O6Ga1hxEzvHQyK8S4Y9MOxSN1G9r8u/cHpghuMkGCzgDoK3US2XHQ=
X-Received: by 2002:a05:6638:1483:: with SMTP id
 j3mr25041031jak.63.1634078553331; 
 Tue, 12 Oct 2021 15:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-9-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-9-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 08:42:07 +1000
Message-ID: <CAKmqyKMZFFNLLfBRUAe6Dg7U6BDX9zKJyWue_zQsSLrBbH56OA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/16] qdev-monitor: Check sysbus device type
 before creating it
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, 
 mirela.grujic@greensocs.com, Alistair Francis <Alistair.Francis@wdc.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>, 
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>, 
 Anthony Perard <anthony.perard@citrix.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Mark Burton <mark.burton@greensocs.com>, Edgar Iglesias <edgari@xilinx.com>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 12 Oct 2021 22:42:45 -0000

On Thu, Sep 23, 2021 at 2:53 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Add an early check to test if the requested sysbus device type
> is allowed by the current machine before creating the device. This
> impacts both -device cli option and device_add qmp command.
>
> Before this patch, the check was done well after the device has
> been created (in a machine init done notifier). We can now report
> the error right away.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  softmmu/qdev-monitor.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 47ccd90be8..f1c9242855 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -40,6 +40,7 @@
>  #include "qemu/cutils.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/clock.h"
> +#include "hw/boards.h"
>
>  /*
>   * Aliases were a bad idea from the start.  Let's keep them
> @@ -268,6 +269,16 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>          return NULL;
>      }
>
> +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
> +        /* sysbus devices need to be allowed by the machine */
> +        MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
> +        if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
> +            error_setg(errp, "'%s' is not an allowed pluggable sysbus device "
> +                             " type for the machine", *driver);
> +            return NULL;
> +        }
> +    }
> +
>      return dc;
>  }
>
> --
> 2.33.0
>
>

