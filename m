Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maQsV-0006Yc-CK
	for mharc-qemu-riscv@gnu.org; Tue, 12 Oct 2021 19:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maQsT-0006Xo-Qc; Tue, 12 Oct 2021 19:08:09 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:45884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maQsO-0004pL-Tb; Tue, 12 Oct 2021 19:08:09 -0400
Received: by mail-io1-xd35.google.com with SMTP id b10so658205iof.12;
 Tue, 12 Oct 2021 16:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D23sb8bFeCXI94xUkUzdKmg69G7zDAbwqduFczWfvKA=;
 b=Es3UE5dss4rZylCN7k44ApvHlCaGU4yXyfFXVgiwjK++fiVIj2AKyYlhX4iAoXUJOm
 CtSsoA4ibc2vMn9zCCRDTEOys3irqDNERLbvfsl8FtIskFvMfYPIxDmhYNrSBO6XV0hi
 FOvfleplF/JVnW1XO/X1GH23yuGwJN5Td7ReeJ5nhPGgxCrQwYOAJfV9mWo/s7aGoAHx
 hgwBiim7ZtjYHhe8Upjehw7vm9f6ONaDVoNk8y1ytrp2plFJEBsprIw21sUuNsYSYnwc
 B/NTXWA9gpi42gCU9Q//B3uCy6IkbzHo6gsWN7PflOKs4cmdY6C+GuFuof6yViEAJVIw
 0jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D23sb8bFeCXI94xUkUzdKmg69G7zDAbwqduFczWfvKA=;
 b=AteYja1sNkjo/JE0k2GQOzUWsa5EOShuu5dy4zDaeujrt6mGXpdjH7RQ40pBt/3hL9
 xzhWdgTZDLMybsewUxsGzeoGF49IpIeyPCXTYtwBlkP25TRo7HTRAWtEDr6evk9o/GP8
 unw2dzduyn9CfH+POgYoIAFC2eW+X2ENt2nmbUq70zGs4x2cmAarWF6ONxw00oyKNACt
 xDF0cij4q2LZjBNKZvK5hqQcMqg8TKdu5NNV3EYsmp5qpzCgaJnOB6+Ckj6hwhQfzmfS
 518NH4Jls0GXd5zExRodM7Sd0MvgSWVupfF6Vs7jgVQmMY9DzoOQOirp30o6Feq96Rgk
 YUvA==
X-Gm-Message-State: AOAM533Yi7blOq1GeWCNC5OMvbdHiDZtrWfCPL/HJTLNP7zcZKI1+gis
 48hO4rSWXl7nVIDQ4q5P1e50xVQ1n4iXbIOTMIM=
X-Google-Smtp-Source: ABdhPJxDPo9qtToO6ewaPjuNrBsi+QXGD1yiMTi37OJGplkSUxNlRnlVrO+pWqYJmSF5JUPbJAj3fBICmq3UUqxD/5U=
X-Received: by 2002:a05:6638:1483:: with SMTP id
 j3mr25110746jak.63.1634080083372; 
 Tue, 12 Oct 2021 16:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-10-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-10-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 09:07:37 +1000
Message-ID: <CAKmqyKNeUz7BTxhJTKnhTnEnONRJLJ8V-CaCZ3E5OA2G8eeP4A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/16] hw/core/machine: Remove the dynamic sysbus
 devices type check
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Tue, 12 Oct 2021 23:08:10 -0000

On Thu, Sep 23, 2021 at 2:23 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Now that we check sysbus device types during device creation, we
> can remove the check done in the machine init done notifier.
> This was the only thing done by this notifier, so we remove the
> whole sysbus_notifier structure of the MachineState.
>
> Note: This notifier was checking all /peripheral and /peripheral-anon
> sysbus devices. Now we only check those added by -device cli option or
> device_add qmp command when handling the command/option. So if there
> are some devices added in one of these containers manually (eg in
> machine C code), these will not be checked anymore.
> This use case does not seem to appear apart from
> hw/xen/xen-legacy-backend.c (it uses qdev_set_id() and in this case,
> not for a sysbus device, so it's ok).
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/boards.h |  1 -
>  hw/core/machine.c   | 27 ---------------------------
>  2 files changed, 28 deletions(-)
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 934443c1cd..ccbc40355a 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -311,7 +311,6 @@ typedef struct CpuTopology {
>  struct MachineState {
>      /*< private >*/
>      Object parent_obj;
> -    Notifier sysbus_notifier;
>
>      /*< public >*/
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 1a18912dc8..521438e90a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -571,18 +571,6 @@ bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
>      return allowed;
>  }
>
> -static void validate_sysbus_device(SysBusDevice *sbdev, void *opaque)
> -{
> -    MachineState *machine = opaque;
> -    MachineClass *mc = MACHINE_GET_CLASS(machine);
> -
> -    if (!device_is_dynamic_sysbus(mc, DEVICE(sbdev))) {
> -        error_report("Option '-device %s' cannot be handled by this machine",
> -                     object_class_get_name(object_get_class(OBJECT(sbdev))));
> -        exit(1);
> -    }
> -}
> -
>  static char *machine_get_memdev(Object *obj, Error **errp)
>  {
>      MachineState *ms = MACHINE(obj);
> @@ -598,17 +586,6 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
>      ms->ram_memdev_id = g_strdup(value);
>  }
>
> -static void machine_init_notify(Notifier *notifier, void *data)
> -{
> -    MachineState *machine = MACHINE(qdev_get_machine());
> -
> -    /*
> -     * Loop through all dynamically created sysbus devices and check if they are
> -     * all allowed.  If a device is not allowed, error out.
> -     */
> -    foreach_dynamic_sysbus_device(validate_sysbus_device, machine);
> -}
> -
>  HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
>  {
>      int i;
> @@ -1030,10 +1007,6 @@ static void machine_initfn(Object *obj)
>                                          "Table (HMAT)");
>      }
>
> -    /* Register notifier when init is done for sysbus sanity checks */
> -    ms->sysbus_notifier.notify = machine_init_notify;
> -    qemu_add_machine_init_done_notifier(&ms->sysbus_notifier);
> -
>      /* default to mc->default_cpus */
>      ms->smp.cpus = mc->default_cpus;
>      ms->smp.max_cpus = mc->default_cpus;
> --
> 2.33.0
>
>

