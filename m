Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maYPr-0004so-Hf
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 03:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maYPp-0004pv-Bo; Wed, 13 Oct 2021 03:11:05 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:33669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maYPm-0004e0-Va; Wed, 13 Oct 2021 03:11:04 -0400
Received: by mail-io1-xd2c.google.com with SMTP id n7so1752383iod.0;
 Wed, 13 Oct 2021 00:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PuD4x/quwdKwmCZMAPno27Mt5WkSyZcD2cupRATIQmA=;
 b=hUpeBm07ZhmU+R92qTIFSrBL14OeFHZ6uD4IZbV6GtgXTzhgOqStOEWSiPJEWuGj4t
 4zuWiSkqFTm3AGGU2NR38KTYSKWPxOtEcdS4Ai/3r1akHkT61Jp+XPc9Zl1qrzwNyPwA
 TnX/xusNsfu2j+x4p6dymMk+gwlKDmH0z9qb8RZ1yOpGX8JaH+u2u3i10cFfQzzpQZKA
 gzhXJSBzjJDyKX/O/RiXSwFRjlfOrTHayIFv4RaRpmQwTkqpQYJmnggmAwOE8fiqTWjc
 lItwI007UCAJqN+GP5GKmGAqMrKlXFHSwRjzOn5t6E5+kri8uC+0X+pm6KhlPDRrs3ON
 wktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PuD4x/quwdKwmCZMAPno27Mt5WkSyZcD2cupRATIQmA=;
 b=upF2L0ojohxLrIj6Q/6kz8pOFOxt1Tebkvl25cSG8+nnaVzu5e8aPSRORhDLJe+1cV
 Mgk6sg+sGjoe+hg2bzDeWmrylYMQOakKowOgwsq0QmqKfLWcGNopGixDJBJxrUkd4hP8
 xbgzN6nPGja6xhMpuvbQovw5cH529DU7Mmvf5aqMDhmYF4KfB26DH/8WXieJ3N5hzIfZ
 34mzQI9gS6/y5wGwtSBrS89A0QukXPpwxHHC+4WWZxZabnW7lSxYm/f7isi7HdY5FCFj
 j3LXNBlJAjWyFIZNHhY7IGWsaDWrGgRJpQecIrAvyPLWopX5hmXp2JNt4bjzDX95ho+X
 iJMQ==
X-Gm-Message-State: AOAM532lK/8/fRKx48u92ISj6j3NmqvkSnXTj4nXdpKY/gxtSFlALX0j
 /8pzhju5f2DrmRZUBBIVrIi1uFsNFV6a4D6A9WE=
X-Google-Smtp-Source: ABdhPJzyNaV6p60H1ka7FNoMSrAfpLbPjQqSVej3WyYM+u5LpMnq8d8d2K/hoKgv951cKI2obB3JFtyY4qhuLjUoOBw=
X-Received: by 2002:a05:6638:9a:: with SMTP id
 v26mr11895732jao.18.1634109061530; 
 Wed, 13 Oct 2021 00:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-5-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-5-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 17:10:35 +1000
Message-ID: <CAKmqyKNWBYpq8CbhtGyw9=1Gt_LujZZrtD7J_Ye2FyyVA6eqcw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/16] softmmu/qdev-monitor: add error handling in
 qdev_set_id
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2c.google.com
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
X-List-Received-Date: Wed, 13 Oct 2021 07:11:06 -0000

On Thu, Sep 23, 2021 at 2:29 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> qdev_set_id() is mostly used when the user adds a device (using
> -device cli option or device_add qmp command). This commit adds
> an error parameter to handle the case where the given id is
> already taken.
>
> Also document the function and add a return value in order to
> be able to capture success/failure: the function now returns the
> id in case of success, or NULL in case of failure.
>
> The commit modifies the 2 calling places (qdev-monitor and
> xen-legacy-backend) to add the error object parameter.
>
> Note that the id is, right now, guaranteed to be unique because
> all ids came from the "device" QemuOptsList where the id is used
> as key. This addition is a preparation for a future commit which
> will relax the uniqueness.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/monitor/qdev.h      | 25 +++++++++++++++++++++++-
>  hw/xen/xen-legacy-backend.c |  3 ++-
>  softmmu/qdev-monitor.c      | 38 +++++++++++++++++++++++++++----------
>  3 files changed, 54 insertions(+), 12 deletions(-)
>
> diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
> index eaa947d73a..23c31f5296 100644
> --- a/include/monitor/qdev.h
> +++ b/include/monitor/qdev.h
> @@ -9,6 +9,29 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
>
>  int qdev_device_help(QemuOpts *opts);
>  DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
> -void qdev_set_id(DeviceState *dev, const char *id);
> +
> +/**
> + * qdev_set_id: parent the device and set its id if provided.
> + * @dev: device to handle
> + * @id: id to be given to the device, or NULL.
> + *
> + * Returns: the id of the device in case of success; otherwise NULL.
> + *
> + * @dev must be unrealized, unparented and must not have an id.
> + *
> + * If @id is non-NULL, this function tries to setup @dev qom path as
> + * "/peripheral/id". If @id is already taken, it fails. If it succeeds,
> + * the id field of @dev is set to @id (@dev now owns the given @id
> + * parameter).
> + *
> + * If @id is NULL, this function generates a unique name and setups @dev
> + * qom path as "/peripheral-anon/name". This name is not set as the id
> + * of @dev.
> + *
> + * Upon success, it returns the id/name (generated or provided). The
> + * returned string is owned by the corresponding child property and must
> + * not be freed by the caller.
> + */
> +const char *qdev_set_id(DeviceState *dev, const char *id, Error **errp);
>
>  #endif
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index dd8ae1452d..f541cfa0e9 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -276,7 +276,8 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
>      xendev = g_malloc0(ops->size);
>      object_initialize(&xendev->qdev, ops->size, TYPE_XENBACKEND);
>      OBJECT(xendev)->free = g_free;
> -    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev));
> +    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev),
> +                &error_fatal);
>      qdev_realize(DEVICE(xendev), xen_sysbus, &error_fatal);
>      object_unref(OBJECT(xendev));
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 25275984bd..0007698ff3 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -578,22 +578,34 @@ static BusState *qbus_find(const char *path, Error **errp)
>      return bus;
>  }
>
> -void qdev_set_id(DeviceState *dev, const char *id)
> +const char *qdev_set_id(DeviceState *dev, const char *id, Error **errp)
>  {
> +    ObjectProperty *prop;
> +
> +    assert(!dev->id && !dev->realized);
> +
> +    /*
> +     * object_property_[try_]add_child() below will assert the device
> +     * has no parent
> +     */
>      if (id) {
> -        dev->id = id;
> -    }
> -
> -    if (dev->id) {
> -        object_property_add_child(qdev_get_peripheral(), dev->id,
> -                                  OBJECT(dev));
> +        prop = object_property_try_add_child(qdev_get_peripheral(), id,
> +                                             OBJECT(dev), NULL);
> +        if (prop) {
> +            dev->id = id;
> +        } else {
> +            error_setg(errp, "Duplicate device ID '%s'", id);
> +            return NULL;
> +        }
>      } else {
>          static int anon_count;
>          gchar *name = g_strdup_printf("device[%d]", anon_count++);
> -        object_property_add_child(qdev_get_peripheral_anon(), name,
> -                                  OBJECT(dev));
> +        prop = object_property_add_child(qdev_get_peripheral_anon(), name,
> +                                         OBJECT(dev));
>          g_free(name);
>      }
> +
> +    return prop->name;
>  }
>
>  DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
> @@ -677,7 +689,13 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
>          }
>      }
>
> -    qdev_set_id(dev, qemu_opts_id(opts));
> +    /*
> +     * set dev's parent and register its id.
> +     * If it fails it means the id is already taken.
> +     */
> +    if (!qdev_set_id(dev, qemu_opts_id(opts), errp)) {
> +        goto err_del_dev;
> +    }
>
>      /* set properties */
>      if (qemu_opt_foreach(opts, set_property, dev, errp)) {
> --
> 2.33.0
>
>

