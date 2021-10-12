Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maPxT-0003Ef-3s
	for mharc-qemu-riscv@gnu.org; Tue, 12 Oct 2021 18:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maPxQ-0003Cy-V8; Tue, 12 Oct 2021 18:09:12 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maPxP-0005ES-9V; Tue, 12 Oct 2021 18:09:12 -0400
Received: by mail-io1-xd29.google.com with SMTP id x1so560230iof.7;
 Tue, 12 Oct 2021 15:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A8tS+FAHb9od7Jib5DnZFG/AjAZmK7umWqwvEa27qRs=;
 b=KgJmrojIfIEoCIxkxm2pMhrD9TpGtoXxwR1poaKrLuSJGMMYye9D/Ag/6gIhZLwMqK
 QSnS0qgcs/nClxeGvvFml5xlJZ8fKFJL1NHDf3Ytb4dey7VvfMO3V+3TDrAUBSp3YdQc
 rbofhFzPIfc0Qz0/XArKCUn37t2da7sTf4b1aXdhk3Xlq1Smq1nbtV5bxTGwMxBpFHWR
 oxMJnuqDIt/p6TrixyF9DZbhiPPW2Ov7bocA62N1/KmbEjyRPTLmwBdRgvcBO1RRI3WP
 X6XzIJIch5MoxTaCLi6J+2br8EN+LXTHsgu1HgX+BYnNIx9o/KGFpZVEJppKSWLs08dk
 7pbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A8tS+FAHb9od7Jib5DnZFG/AjAZmK7umWqwvEa27qRs=;
 b=r8NR963KQb83MY71YITxOf4IRfMzj9Ctirpp1uqWvvcIV4IRlY5nDX/2tCXDWL35O+
 T19+vhT1KITI4BkWdrdJupM/B716dZl2dNYiS7Fy8Iuo32820rvsnLeR1vGGgjBLn3ov
 5ae8ovdG8xmd37k6MUzu5gLvykbFVm24edacOT9drFndaXRICh1jjWAMp7mUnNxuMwVR
 T/r/7a1m+Px/pS9i4MZJfEFSC2t9rghK23U0bCxv3AqpuqtLzvGKRo01XCtC7liZoDsE
 7Fw+uuKtm5y6lBsXT9/xyRqLytoOcjRTcU878Qw8pi2KZnKZ15n54fakoeqD3cVMZTB3
 4u0w==
X-Gm-Message-State: AOAM530DdzdNkE3N1qVdj9zU3TyVhf0KJtdkemOe9k72jiqBRxAW8DqG
 sFKRMb6YXZWPIZ8hLzkgn9PFGcm5R/PaFcnCwTg=
X-Google-Smtp-Source: ABdhPJyjn2JGj0C1wSr86O4QoFZL5yrk8p7xpOhtz4Neo2WsSYDHKD/N6rnNIFBr0q08yMYNVeb0MWkdpiH1X0GVpjo=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id
 m12mr7416731iow.91.1634076549426; 
 Tue, 12 Oct 2021 15:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-3-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-3-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 08:08:43 +1000
Message-ID: <CAKmqyKN5JadUSb=-a5jn3Uz1WKj8Sb23buC0Nooa4mY4g7O=ew@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/16] qapi: Implement query-machine-phase QMP
 command
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
X-List-Received-Date: Tue, 12 Oct 2021 22:09:13 -0000

On Thu, Sep 23, 2021 at 2:20 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> From: Mirela Grujic <mirela.grujic@greensocs.com>
>
> The command returns current machine initialization phase.
> From now on, the MachineInitPhase enum is generated from the
> QAPI schema.
>
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  qapi/machine.json          | 56 ++++++++++++++++++++++++++++++++++++++
>  include/hw/qdev-core.h     | 30 ++------------------
>  hw/core/machine-qmp-cmds.c |  9 ++++++
>  hw/core/qdev.c             |  5 ++++
>  4 files changed, 72 insertions(+), 28 deletions(-)
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 157712f006..969d37fb03 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1312,3 +1312,59 @@
>       '*cores': 'int',
>       '*threads': 'int',
>       '*maxcpus': 'int' } }
> +
> +##
> +# @MachineInitPhase:
> +#
> +# Enumeration of machine initialization phases.
> +#
> +# @no-machine: machine does not exist
> +#
> +# @machine-created: machine is created, but its accelerator is not
> +#
> +# @accel-created: accelerator is created, but the machine properties have not
> +#                 been validated and machine initialization is not done yet
> +#
> +# @initialized: machine is initialized, thus creating any embedded devices and
> +#               validating machine properties. Devices created at this time are
> +#               considered to be cold-plugged.
> +#
> +# @ready: QEMU is ready to start CPUs and devices created at this time are
> +#         considered to be hot-plugged. The monitor is not restricted to
> +#         "preconfig" commands.
> +#
> +# Since: 6.2
> +##
> +{ 'enum': 'MachineInitPhase',
> +  'data': [ 'no-machine', 'machine-created', 'accel-created', 'initialized',
> +            'ready' ] }
> +
> +##
> +# @MachineInitPhaseStatus:
> +#
> +# Information about machine initialization phase
> +#
> +# @phase: the machine initialization phase
> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'MachineInitPhaseStatus',
> +  'data': { 'phase': 'MachineInitPhase' } }
> +
> +##
> +# @query-machine-phase:
> +#
> +# Return machine initialization phase
> +#
> +# Since: 6.2
> +#
> +# Returns: MachineInitPhaseStatus
> +#
> +# Example:
> +#
> +# -> { "execute": "query-machine-phase" }
> +# <- { "return": { "phase": "initialized" } }
> +#
> +##
> +{ 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
> +             'allow-preconfig': true }
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 859fd913bb..800eda8f54 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -1,6 +1,7 @@
>  #ifndef QDEV_CORE_H
>  #define QDEV_CORE_H
>
> +#include "qapi/qapi-types-machine.h"
>  #include "qemu/queue.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/rcu.h"
> @@ -839,35 +840,8 @@ void device_listener_unregister(DeviceListener *listener);
>   */
>  bool qdev_should_hide_device(QemuOpts *opts);
>
> -typedef enum MachineInitPhase {
> -    /* current_machine is NULL.  */
> -    MACHINE_INIT_PHASE_NO_MACHINE,
> -
> -    /* current_machine is not NULL, but current_machine->accel is NULL.  */
> -    MACHINE_INIT_PHASE_MACHINE_CREATED,
> -
> -    /*
> -     * current_machine->accel is not NULL, but the machine properties have
> -     * not been validated and machine_class->init has not yet been called.
> -     */
> -    MACHINE_INIT_PHASE_ACCEL_CREATED,
> -
> -    /*
> -     * machine_class->init has been called, thus creating any embedded
> -     * devices and validating machine properties.  Devices created at
> -     * this time are considered to be cold-plugged.
> -     */
> -    MACHINE_INIT_PHASE_INITIALIZED,
> -
> -    /*
> -     * QEMU is ready to start CPUs and devices created at this time
> -     * are considered to be hot-plugged.  The monitor is not restricted
> -     * to "preconfig" commands.
> -     */
> -    MACHINE_INIT_PHASE_READY,
> -} MachineInitPhase;
> -
>  extern bool phase_check(MachineInitPhase phase);
>  extern void phase_advance(MachineInitPhase phase);
> +extern MachineInitPhase phase_get(void);
>
>  #endif
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 52168a3771..d3b9a04855 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -204,3 +204,12 @@ MemdevList *qmp_query_memdev(Error **errp)
>      object_child_foreach(obj, query_memdev, &list);
>      return list;
>  }
> +
> +MachineInitPhaseStatus *qmp_query_machine_phase(Error **errp)
> +{
> +    MachineInitPhaseStatus *status = g_malloc0(sizeof(*status));
> +
> +    status->phase = phase_get();
> +
> +    return status;
> +}
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index c5fc704f55..d83f1c029a 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -1150,6 +1150,11 @@ void phase_advance(MachineInitPhase phase)
>      machine_phase = phase;
>  }
>
> +MachineInitPhase phase_get(void)
> +{
> +    return machine_phase;
> +}
> +
>  static const TypeInfo device_type_info = {
>      .name = TYPE_DEVICE,
>      .parent = TYPE_OBJECT,
> --
> 2.33.0
>
>

