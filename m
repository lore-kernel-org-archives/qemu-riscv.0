Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTOWq-0001AO-Mi
	for mharc-qemu-riscv@gnu.org; Thu, 23 Sep 2021 09:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTNKl-0006KK-R3
 for qemu-riscv@nongnu.org; Thu, 23 Sep 2021 07:56:11 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTNKj-0002xC-0b
 for qemu-riscv@nongnu.org; Thu, 23 Sep 2021 07:56:11 -0400
Received: by mail-pf1-x434.google.com with SMTP id 203so5458899pfy.13
 for <qemu-riscv@nongnu.org>; Thu, 23 Sep 2021 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=SY869irrxzfOoJkdWCuDuzh7ZngMT+9YxkjytmTDREU=;
 b=U7PowsmPYHknkV3fCw5NxMoC2azRQc+aWAttZ+UHqBZVvwM6dUlqw02Rm2h0zbAbI0
 xbGhtLJ9geYBLFjmTS/5oO5gArei8XSmN62/NNQFQA1+cUB9oZTURXW+AEEwQjYGwoGe
 hBw5BdJd2jktGxhnL3O8AKZdJ95pCO39/6x2yaNFPkm/oAj+jO6+sfeIxbSIkB6qsEtT
 mjDd6A1iOBomObypmypRTU8IV2hWlesozGv9gtU73ixhNgIUvTqibBGj62+H1g2CH6Yv
 O0Y0fl6s49RPCuLNCFEjmFme7dqAQUWsUdhWd8oioOQzNLIehSsGSIHAl7DSq+d4KCb4
 3L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=SY869irrxzfOoJkdWCuDuzh7ZngMT+9YxkjytmTDREU=;
 b=gfdZY9O38ynEtTxBVGoDdtRWJ4SGo9iR9vXB0R55HPpYEUUtcx/0TxQDZ68Lcr5CQ6
 +0VTPGd02BTBBbbInMp09Ej+96xO7NCCXKaBweWfSq7lqYTWJ85/LsjJdH2V4nL6Mu4w
 Mf3XS87Ea4XwBjrU2ilWl7hzZBEorE3K8Tx+QS/5nj8Yn5/o/QS1dSleA/0RLzxeMDeU
 5IH1oehXm22uu8/qWUU4/C9n6kv8q8KyTPY1N0nNBEgOfPIcbxnDxq8BnKTe7BuhcZ3D
 mppXlbroWkccGo0F7uQmfPnX+cX0ovcSgq1GU6USZK1UtNPl1qTjRwTHBN419yrL7Lvu
 /uVw==
X-Gm-Message-State: AOAM532XlOKRBWnP4JN/NkNxeUe1lV3Cp1r7pGc7ZRRfj3SUQIW56KyU
 Smwsvm0uABC1G5rNu7vhxbLsEg==
X-Google-Smtp-Source: ABdhPJxN+kA2mTsQR+l1zBPEpE/rXxHeA2wclNVyce3HUXRFs9M3E7zp1eZW9twTe7ZJhuUZvRsFxQ==
X-Received: by 2002:a62:1ec5:0:b0:446:40ec:73b2 with SMTP id
 e188-20020a621ec5000000b0044640ec73b2mr4086191pfe.5.1632398165735; 
 Thu, 23 Sep 2021 04:56:05 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.156.170])
 by smtp.googlemail.com with ESMTPSA id 201sm5097769pfw.37.2021.09.23.04.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 04:56:05 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 23 Sep 2021 17:25:54 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 qemu-riscv@nongnu.org, xen-devel@lists.xenproject.org, 
 mark.burton@greensocs.com, mirela.grujic@greensocs.com, edgari@xilinx.com, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH v2 10/16] qdev-monitor: allow adding any sysbus device
 before machine is ready
In-Reply-To: <alpine.DEB.2.22.394.2109231628280.630@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2109231723060.630@anisinha-lenovo>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-11-damien.hedde@greensocs.com>
 <alpine.DEB.2.22.394.2109231628280.630@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Sep 2021 09:12:43 -0400
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
X-List-Received-Date: Thu, 23 Sep 2021 11:56:12 -0000



On Thu, 23 Sep 2021, Ani Sinha wrote:

>
>
> On Wed, 22 Sep 2021, Damien Hedde wrote:
>
> > Skip the sysbus device type per-machine allow-list check before the
> > MACHINE_INIT_PHASE_READY phase.
> >
> > This patch permits adding any sysbus device (it still needs to be
> > user_creatable) when using the -preconfig experimental option.
> >
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> > ---
> >
> > This commit is RFC. Depending on the condition to allow a device
> > to be added, it may change.
> > ---
> >  softmmu/qdev-monitor.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> > index f1c9242855..73b991adda 100644
> > --- a/softmmu/qdev-monitor.c
> > +++ b/softmmu/qdev-monitor.c
> > @@ -269,8 +269,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
> >          return NULL;
> >      }
> >
> > -    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
> > -        /* sysbus devices need to be allowed by the machine */
> > +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE) &&
> > +        phase_check(MACHINE_INIT_PHASE_READY)) {
> > +        /*
> > +         * Sysbus devices need to be allowed by the machine.
> > +         * We only check that after the machine is ready in order to let
> > +         * us add any user_creatable sysbus device during machine creation.
> > +         */
> >          MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
> >          if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
> >              error_setg(errp, "'%s' is not an allowed pluggable sysbus device "
>
> Since now you are adding the state of the machine creation in the
> valiation condition, the failure error message becomes misleading.
> Better to do this I think :
>
> if (object class is TYPE_SYS_BUS_DEVICE)
> {
>   if (!phase_check(MACHINE_INIT_PHASE_READY))
>     {
>       // error out here saying the state of the machine creation is too
> early
>     }
>
>     // do the other check on dynamic sysbus
>
> }

The other thing to consider is whether we should put the machine phaze
check at a higher level, at qdev_device_add() perhaps. One might envison
that different device types may be allowed to be added at different
stages of machine creation. So this check needs be more generalized for
the future.



