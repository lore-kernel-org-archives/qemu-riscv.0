Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maQ7i-0007bB-Fk
	for mharc-qemu-riscv@gnu.org; Tue, 12 Oct 2021 18:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maQ7g-0007a5-P4; Tue, 12 Oct 2021 18:19:48 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:37432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maQ7d-00087Z-VR; Tue, 12 Oct 2021 18:19:48 -0400
Received: by mail-io1-xd36.google.com with SMTP id m20so601541iol.4;
 Tue, 12 Oct 2021 15:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NB4zMWjVCozDyRqrRazsv7gECHlthWA9j/5E69e+2pE=;
 b=O3E8Na1Lu/kg9q1317gF82pOCZSAMuuoHn9gufZyGxGSmsbzzQuMOVwF55Mu1iLW6V
 PCF0bB5+i5baqpeBi4h/xhHYwcXBogMplyx2nUX6DUEsErcrra5z1EPRUgOElfsH0lg1
 I/BwklgzMNPayXfCFl9iwhqVifSnxzvdpvzXqwQ4HCx7BjgzeqJxBhXOEohGI1rwykZn
 lXUiMVocjsfQYqnLJkmu3QYInXK597Co5vY7nIGVpvZYghsGhXTZ1jdQ+cXWePtVTJ0Q
 NYIARl/MQFTZ5C41TQ8TdOW5Yx6HYV1q29+D6fM3fBxt5E8SYSDrI2cfXDSrUcWLSG0P
 rjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NB4zMWjVCozDyRqrRazsv7gECHlthWA9j/5E69e+2pE=;
 b=Pz5gfSeIdFWeO/j0XEBuMLKVXx5vQDSCewVdcuQW5U97OHxRjf5ZTUjdZTCXKHZ4kC
 9V+R21XGVaMjSB6k/Qhuv8PMZO5Ls5Ryrf5YYZ3n9CidBWNj7h8Dx9LfRIOdkBE8dYsB
 JW4pzdXSUPyT2+A86I0AYlrzdC6SBn9n8n+iZm1K6uJkyfndj8v/+N8IHObNO53hMbOD
 BDnfHX7ea7zVDO0apfVQccdsso0/kWIx/8L5bBw7XT9e7IE4uXlAaa0TTVxoEaLC4aIk
 8jIxxoluZUAOieI/HluO/5s5xTHZZ4tp/GeAXgzoQScouU36Ft+4XoXUHnFhCeCK5YpF
 oGzA==
X-Gm-Message-State: AOAM533E4fTV9pU7LkTri6b/8gvd/FrBQQzE5wzMM6QOmdEDdlPRYgzY
 I4rUhRtraZE8MmFsacXFHuGnhCrJd+p9MIWYAHs=
X-Google-Smtp-Source: ABdhPJyUAmYSRqyUMQkR2DPCTv/LEqWVUb7bWjDgrZMQ35aO1plLf4xcvTA3zyySB7lWt4luca1J9q2NsICNzsModDE=
X-Received: by 2002:a6b:8d4a:: with SMTP id p71mr25921383iod.16.1634077184387; 
 Tue, 12 Oct 2021 15:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-4-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-4-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 08:19:18 +1000
Message-ID: <CAKmqyKP-Na8=6cyL8kLNwkr8Hcb2cDgVYYqDrqO_g=tcqkO96A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/16] qapi: Implement x-machine-init QMP command
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
X-List-Received-Date: Tue, 12 Oct 2021 22:19:49 -0000

On Thu, Sep 23, 2021 at 2:17 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> From: Mirela Grujic <mirela.grujic@greensocs.com>
>
> The x-machine-init QMP command is available only if the -preconfig option
> is used and the current machine initialization phase is accel-created.
>
> The command triggers QEMU to enter machine initialized phase and wait
> for the QMP configuration. In future commits, we will add the possiblity
> to create devices at this point.
>
> To exit the initialized phase use the x-exit-preconfig QMP command.
>
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  qapi/machine.json | 23 +++++++++++++++++++++++
>  softmmu/vl.c      | 19 +++++++++++++++----
>  2 files changed, 38 insertions(+), 4 deletions(-)
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 969d37fb03..56330c0e8e 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1368,3 +1368,26 @@
>  ##
>  { 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
>               'allow-preconfig': true }
> +
> +##
> +# @x-machine-init:
> +#
> +# Enter machine initialized phase
> +#
> +# Since: 6.2
> +#
> +# Returns: If successful, nothing
> +#
> +# Notes: This command will trigger QEMU to execute initialization steps
> +#        that are required to enter the machine initialized phase. The command
> +#        is available only if the -preconfig command line option was passed and
> +#        if the machine is currently in the accel-created phase. To exit the
> +#        machine initialized phase use the x-exit-preconfig command.
> +#
> +# Example:
> +#
> +# -> { "execute": "x-machine-init" }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'x-machine-init', 'allow-preconfig': true }
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index d2552ba8ac..84c5132ad7 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -123,6 +123,7 @@
>  #include "qapi/qapi-visit-qom.h"
>  #include "qapi/qapi-commands-ui.h"
>  #include "qapi/qmp/qdict.h"
> +#include "qapi/qapi-commands-machine.h"
>  #include "qapi/qmp/qerror.h"
>  #include "sysemu/iothread.h"
>  #include "qemu/guest-random.h"
> @@ -2610,10 +2611,16 @@ static void qemu_init_displays(void)
>      }
>  }
>
> -static void qemu_init_board(void)
> +void qmp_x_machine_init(Error **errp)
>  {
>      MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
>
> +    if (phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
> +        error_setg(errp, "The command is permitted only before "
> +                         "the machine is initialized");
> +        return;
> +    }
> +
>      if (machine_class->default_ram_id && current_machine->ram_size &&
>          numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
>          create_default_memdev(current_machine, mem_path);
> @@ -2692,12 +2699,16 @@ static void qemu_machine_creation_done(void)
>
>  void qmp_x_exit_preconfig(Error **errp)
>  {
> -    if (phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
> -        error_setg(errp, "The command is permitted only before machine initialization");
> +    if (phase_check(MACHINE_INIT_PHASE_READY)) {
> +        error_setg(errp, "The command is permitted only before "
> +                         "the machine is ready");
>          return;
>      }
>
> -    qemu_init_board();
> +    if (!phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
> +        qmp_x_machine_init(errp);
> +    }
> +
>      qemu_create_cli_devices();
>      qemu_machine_creation_done();
>
> --
> 2.33.0
>
>

