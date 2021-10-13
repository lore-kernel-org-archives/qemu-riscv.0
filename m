Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maYVB-0000XJ-JR
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 03:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maYV7-0000W9-Pa; Wed, 13 Oct 2021 03:16:34 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:44938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maYV4-0003Mn-O8; Wed, 13 Oct 2021 03:16:33 -0400
Received: by mail-il1-x12d.google.com with SMTP id j8so1580018ila.11;
 Wed, 13 Oct 2021 00:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i3FI/4yg1UnUkR3eFfub07xRQFw994Re88ZbTuriDcs=;
 b=fnt6SAzQGyiPybQHEXVCM0uU97YZxcWzVopCBhCvr6XBbj2XR1Oi+WhDZSG1se8yr+
 04SpaO2W584eqSOk/6gpNgP0V+QKjmK7x0xh/jHlpvCJxi3QtM+CxH+eHM9+roXm6Yrf
 aR5fwEtuzHgwqaaywBAOafqgEg1HJbx316sbDaYt/cjwl4rqOzmZbJgkZ6eY8dFExCBt
 aCsEBowYbx5bbrtC4d1WmWmvmG9RJM/LY1F4xEUoWNsW0cWVxxpzB/7ki93VpFn8c1Qa
 j4Erspl8b7ZCU4qnGaoQvUqL9RecGA7d9SPvnJc4iEqUmqscFGsuk8CStKc5M6pxxHKa
 TRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i3FI/4yg1UnUkR3eFfub07xRQFw994Re88ZbTuriDcs=;
 b=NQEn8a6lTdRbEXQQSMrHdNLruo/5s+cyfhzDzb/6OWPp0ubEXQuXwlFtk8Wt1tg4dE
 WHxLLRkR+RU3aSAR6w63vPHbu3ewZWEHkgc3INoYNw6H3ngICGQeSuspdKiO//r8mihU
 qNNp0B1i9TULqSfN4qDXjRFe/Y//MEUibswbtd806N2lL0cqB6I9/XOc+Y+iUHhWD/NO
 xg3x6N7onlqXWpQUub47tikrjmLCVbAnKzx/N+FMkhkira3K9BJe8R7aVkO5Cl5vF2zC
 zjnlgrr6//yH9zV2ExYlEvlOI7IhMkGkyk2miYGrat8bEhR/tIodoq+ZGssEexUMgR9S
 DY5w==
X-Gm-Message-State: AOAM5302KDI8WdvPR9pNdSd9izVq/JfMLYvZMTN8V9gpkc65Z2Iv7dek
 eFmcAOypvcO/7Y5xnzJgldekTkBg92oKtdIpCR0=
X-Google-Smtp-Source: ABdhPJyzWNsJ7ScpHzJDMDmxpcmfJLbKNdWIIAodbqImc6KC0VK+oNgkRydrV8wTWOXm1+nOaURd7afR1ivOvcLqGT8=
X-Received: by 2002:a92:1a43:: with SMTP id z3mr27913757ill.46.1634109389213; 
 Wed, 13 Oct 2021 00:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-13-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-13-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 17:16:03 +1000
Message-ID: <CAKmqyKPWDL52kC23TgtpdEST_kvVjNWn3-j2YFORN457_cEwnw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 12/16] add x-sysbus-mmio-map qmp command
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Wed, 13 Oct 2021 07:16:37 -0000

On Thu, Sep 23, 2021 at 2:26 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> This command allows to map an mmio region of sysbus device onto
> the system memory. Its behavior mimics the sysbus_mmio_map()
> function apart from the automatic unmap (the C function unmaps
> the region if it is already mapped).
> For the qmp function we consider it is an error to try to map
> an already mapped function. If unmapping is required, it is
> probably better to add a sysbus-mmip-unmap function.
>
> This command is still experimental (hence the x prefix), as it
> is related to the sysbus device creation through qmp commands.
>
> In future, we expect to have to handle the overlap/priority
> parameter but also multiple mapping of one mmio. For some
> devices, one mmio is mapped several times at different addresses on
> the bus (which is not supported by sysbus_mmio_map() function and
> requires the use of memory region aliases).

I think as is this is a good start. This is a useful feature!

>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

> ---
>
> Note: this qmp command is required to be able to build a machine from
> scratch as there is no qmp-way of doing a memory mapping today.
>
> We've added the command into qapi/qdev.json section. It does not seem to
> have any really adequate section yet. Any idea ? should we create for
> example a new one: qapi/sysbus.json or qapi/memory.json ?

I would say leave it in qdev. We don't really want many more sysbus
commands, so qapi/sysbus.json doesn't need it's own file.

Alistair

> ---
>  qapi/qdev.json   | 21 +++++++++++++++++++++
>  hw/core/sysbus.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index ad669ae175..dfc1104197 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -125,3 +125,24 @@
>  ##
>  { 'event': 'DEVICE_DELETED',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @x-sysbus-mmio-map:
> +#
> +# Map a sysbus device mmio onto the main system bus.
> +#
> +# @device: the device's QOM path
> +#
> +# @mmio: The mmio number to be mapped (defaults to 0).
> +#
> +# @addr: The base address for the mapping.
> +#
> +# Since: 6.2
> +#
> +# Returns: Nothing on success
> +#
> +##
> +
> +{ 'command': 'x-sysbus-mmio-map',
> +  'data': {'device': 'str', '*mmio': 'uint8', 'addr': 'uint64'},
> +  'allow-preconfig' : true }
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index aaae8e23cc..b0891f37b6 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -23,6 +23,7 @@
>  #include "hw/sysbus.h"
>  #include "monitor/monitor.h"
>  #include "exec/address-spaces.h"
> +#include "qapi/qapi-commands-qdev.h"
>
>  static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
>  static char *sysbus_get_fw_dev_path(DeviceState *dev);
> @@ -154,6 +155,46 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
>      }
>  }
>
> +void qmp_x_sysbus_mmio_map(const char *device, bool has_mmio, uint8_t mmio,
> +                           uint64_t addr, Error **errp)
> +{
> +    Object *obj = object_resolve_path_type(device, TYPE_SYS_BUS_DEVICE, NULL);
> +    SysBusDevice *dev;
> +
> +    if (phase_get() != MACHINE_INIT_PHASE_INITIALIZED) {
> +        error_setg(errp, "The command is permitted only when "
> +                         "the machine is in initialized phase");
> +        return;
> +    }
> +
> +    if (obj == NULL) {
> +        error_setg(errp, "Device '%s' not found", device);
> +        return;
> +    }
> +
> +    dev = SYS_BUS_DEVICE(obj);
> +    if (!has_mmio) {
> +        mmio = 0;
> +    }
> +    if (mmio >= dev->num_mmio) {
> +        error_setg(errp, "MMIO index '%u' is out of range", mmio);
> +        return;
> +    }
> +
> +    if (dev->mmio[mmio].addr != (hwaddr)-1) {
> +        error_setg(errp, "MMIO index '%u' is already mapped", mmio);
> +        return;
> +    }
> +
> +    if (!memory_region_try_add_subregion(get_system_memory(), addr,
> +                                         dev->mmio[mmio].memory, 0,
> +                                         errp)) {
> +        return;
> +    }
> +
> +    dev->mmio[mmio].addr = addr;
> +}
> +
>  void sysbus_mmio_unmap(SysBusDevice *dev, int n)
>  {
>      assert(n >= 0 && n < dev->num_mmio);
> --
> 2.33.0
>
>

