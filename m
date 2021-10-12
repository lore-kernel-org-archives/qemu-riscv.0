Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maQDO-00046g-Qx
	for mharc-qemu-riscv@gnu.org; Tue, 12 Oct 2021 18:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maQDI-00045Y-UH; Tue, 12 Oct 2021 18:25:37 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:35707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maQDD-0004lb-Sv; Tue, 12 Oct 2021 18:25:34 -0400
Received: by mail-io1-xd34.google.com with SMTP id h196so620997iof.2;
 Tue, 12 Oct 2021 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XmXWcURKTPZbu8+vMykz0wo7aGuZpEedRj7aUcQW/64=;
 b=jXP0Q6BYUaRM1g/D3kGRJaogyDNoXsMFf191OtG8ORGfqlH0QuWlkt3HNBo9PJfjF4
 q2ALCcfrBgKjp5dmcOASInobV+9gI7eBewus6GQw3nWBj5c5zdAczLbIF9ag2oRnY3k3
 RlycwIS2PzEhnccX5VbLXkAHUOYdM3dNG2A8HiuqAZvd5DF+0cKddahq4bvJmfro3a/W
 ppTNvUpJ4NQ9CFScQXQZYKdytzv9whHQwpayRU2mny766/62FwzY+XmJ1E49HBjU64m2
 AiEhm+27VgvQ2twDTfkqlPacg+dTyANr6ImfQGjoEIINDrbsXKJPJs9Qjj3pB+KyBmf/
 V3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XmXWcURKTPZbu8+vMykz0wo7aGuZpEedRj7aUcQW/64=;
 b=oYFJFe5QpMhu2wt6RXHS3xku4jdTx1qDZ6M6TvhJKlfXJCbC3iX8OMTbVOKyyg7zQL
 0u/VirK6keO2THRRpR4cNwqBiQIrMtLaajJfn1RBCyup8OVQFC9/12P57yjYic85uUG5
 hB+HGU5Udsd8jL6GSBgLvt68M1SVrIi2o0ki1NzwoseDLYgXMY7QwfQTOQ3vBKf0mOJx
 okkhLS76f0IkZutOS0p2eXhwFbfdLoZ8w4hiYGtspvglgwR0eQIQv6jwTi1YwLFLaKVp
 RnCTfD72buoIxdiZLhnxPq2w5ypdwtVrAmNu3fNzq8aJLbzck7Pz7VqIrWQUb5Z2TAeB
 yLYw==
X-Gm-Message-State: AOAM530HIGaSzdyDmvEdmWaBQ5BW+haeuBqSjR1PCbe3tVFDjdEGO92C
 rXjtWgR6WSorHEfbekYlLR4T1taU3YpxXgBIAG8=
X-Google-Smtp-Source: ABdhPJwY/7LCnJc4zrqz9k9AXZF5iV8jUexLQGaXC27y6KYjx+BhCMwCI+QO/p2VwL5gS3+DRS/txPkgBlsx8+654+g=
X-Received: by 2002:a05:6638:1483:: with SMTP id
 j3mr24996253jak.63.1634077528483; 
 Tue, 12 Oct 2021 15:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-7-damien.hedde@greensocs.com>
In-Reply-To: <20210922161405.140018-7-damien.hedde@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 08:25:02 +1000
Message-ID: <CAKmqyKNuOppuy2i=dF7SD0pZ0u_Us5J0CRGe8CJ-Zay-KMFBRA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/16] qapi: Allow device_add to execute in machine
 initialized phase
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Tue, 12 Oct 2021 22:25:39 -0000

On Thu, Sep 23, 2021 at 2:26 AM Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> From: Mirela Grujic <mirela.grujic@greensocs.com>
>
> To configure a machine using QMP we need the device_add command to
> execute at machine initialized phase.
>
> Note: for device_add command in qdev.json adding the 'allow-init-config'
> option has no effect because the command appears to bypass QAPI (see
> TODO at qapi/qdev.json:61). The option is added there solely to document
> the intent.
> For the same reason, the flags have to be explicitly set in
> monitor_init_qmp_commands() when the device_add command is registered.
>
> Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> The commit is fine, but we may add intermediate commits before this one
> in order to add or change the condition for a device type to be accepted
> in the 'initialized' state (see the cover-letter of the series).
> ---
>  qapi/qdev.json         | 3 ++-
>  monitor/misc.c         | 2 +-
>  softmmu/qdev-monitor.c | 6 ++++++
>  3 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index b83178220b..ad669ae175 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -67,7 +67,8 @@
>  ##
>  { 'command': 'device_add',
>    'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
> -  'gen': false } # so we can get the additional arguments
> +  'gen': false, # so we can get the additional arguments
> +  'allow-preconfig': true }
>
>  ##
>  # @device_del:
> diff --git a/monitor/misc.c b/monitor/misc.c
> index ffe7966870..2c476de316 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -231,7 +231,7 @@ static void monitor_init_qmp_commands(void)
>      qmp_init_marshal(&qmp_commands);
>
>      qmp_register_command(&qmp_commands, "device_add", qmp_device_add,
> -                         QCO_NO_OPTIONS);
> +                         QCO_ALLOW_PRECONFIG);
>
>      QTAILQ_INIT(&qmp_cap_negotiation_commands);
>      qmp_register_command(&qmp_cap_negotiation_commands, "qmp_capabilities",
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 834f2b56b5..47ccd90be8 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -824,6 +824,12 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
>      QemuOpts *opts;
>      DeviceState *dev;
>
> +    if (!phase_check(MACHINE_INIT_PHASE_INITIALIZED)) {
> +        error_setg(errp, "The command is permitted only after "
> +                         "the machine is initialized");
> +        return;
> +    }
> +
>      opts = qemu_opts_from_qdict(qemu_find_opts("device"), qdict, errp);
>      if (!opts) {
>          return;
> --
> 2.33.0
>
>

