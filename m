Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTOWr-0001CI-9D
	for mharc-qemu-riscv@gnu.org; Thu, 23 Sep 2021 09:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTMWW-00047e-Es
 for qemu-riscv@nongnu.org; Thu, 23 Sep 2021 07:04:16 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTMWU-00089s-JB
 for qemu-riscv@nongnu.org; Thu, 23 Sep 2021 07:04:16 -0400
Received: by mail-pl1-x636.google.com with SMTP id t11so3744057plq.11
 for <qemu-riscv@nongnu.org>; Thu, 23 Sep 2021 04:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=1RxHU6ohg85S859gdTN8SmlrMapEypB3sVeaylhNzKc=;
 b=xp676m60NgY6Pdk+CpLb9v69Dv7cEYtiwmfwoFGZ7BHxLWSfF5ZC3a2ws4uSjGuOPf
 4TZzaTD+knuMaYTye3KpEj338NPh5Ff76gGjAjREmiiyTFOoTaBAbUb8MkDxQH90wkYg
 xlFeVbThhDtvCrKK+wJ+Dy+E2elCJ6oW1f75VWa0LVveVn6aP92rVU4ar8U4sIi1N2a/
 ymrDK13CEBTLq5G7O4r16iQe5Wgb97+pgZpswQaZjm2PZb6URvfdknz0qcX2ENrqjP8T
 amsF0+DqaiUPp74kE1Nku+dzo/fKWirhwT9B3cjbaPY7tNoqTusSwBX+bu8idJDfmvWd
 sJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=1RxHU6ohg85S859gdTN8SmlrMapEypB3sVeaylhNzKc=;
 b=bLcMrJ9/Y7BwUffNY/I5eVL66qsaUbYMp6TEwUybWroJ+m4Im6BZjUPP0jaSGdF6TZ
 LOYhDmLUPnZQkjpVgiIEqIhhjMZN2uc9rvSklfUj41Md/ECl/Bxzp2K9I6FUn/gHHry8
 FED9CNh9IXWqiK6RjAqPuXAZFWw0A+2wmZAV8yMa4qjgPkS+SaHeQeTDDOWl1rkJ0ahR
 gLOf6cMM2CzvKeK1j2yjcSsC7MhPDFgotqNtEl1lgg6QdA5dDQSou1kNccvXYvyMJ8qh
 BFkl6HwdIkCygpWooldJUncaDOqkX0bFlMFtVGf7/7zweHvs5BB3j/DHDukScwGhhmND
 sW/Q==
X-Gm-Message-State: AOAM533Bzr+dv/KWIcKrPAxQe7hAbdf+o0RetUP2D4yIK//MX/foQjKK
 ldz8V+FlvdcmZCEjfMNWfTn6rw==
X-Google-Smtp-Source: ABdhPJxBS6AGfLPmzLRaQHRFmVjDVoRSyb6vHulAN4aGINKZzpCa+OGlRLA+YQyj5ZUQtE0f9I/NeA==
X-Received: by 2002:a17:90b:4a4c:: with SMTP id
 lb12mr16930916pjb.55.1632395052788; 
 Thu, 23 Sep 2021 04:04:12 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.156.170])
 by smtp.googlemail.com with ESMTPSA id 126sm6890764pgi.86.2021.09.23.04.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 04:04:12 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 23 Sep 2021 16:34:01 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Damien Hedde <damien.hedde@greensocs.com>
cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <ani@anisinha.ca>, Gerd Hoffmann <kraxel@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, 
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
In-Reply-To: <20210922161405.140018-11-damien.hedde@greensocs.com>
Message-ID: <alpine.DEB.2.22.394.2109231628280.630@anisinha-lenovo>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-11-damien.hedde@greensocs.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 23 Sep 2021 11:04:16 -0000



On Wed, 22 Sep 2021, Damien Hedde wrote:

> Skip the sysbus device type per-machine allow-list check before the
> MACHINE_INIT_PHASE_READY phase.
>
> This patch permits adding any sysbus device (it still needs to be
> user_creatable) when using the -preconfig experimental option.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> This commit is RFC. Depending on the condition to allow a device
> to be added, it may change.
> ---
>  softmmu/qdev-monitor.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index f1c9242855..73b991adda 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -269,8 +269,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>          return NULL;
>      }
>
> -    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
> -        /* sysbus devices need to be allowed by the machine */
> +    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE) &&
> +        phase_check(MACHINE_INIT_PHASE_READY)) {
> +        /*
> +         * Sysbus devices need to be allowed by the machine.
> +         * We only check that after the machine is ready in order to let
> +         * us add any user_creatable sysbus device during machine creation.
> +         */
>          MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
>          if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
>              error_setg(errp, "'%s' is not an allowed pluggable sysbus device "

Since now you are adding the state of the machine creation in the
valiation condition, the failure error message becomes misleading.
Better to do this I think :

if (object class is TYPE_SYS_BUS_DEVICE)
{
  if (!phase_check(MACHINE_INIT_PHASE_READY))
    {
      // error out here saying the state of the machine creation is too
early
    }

    // do the other check on dynamic sysbus

}


