Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mTOWr-0001D1-H6
	for mharc-qemu-riscv@gnu.org; Thu, 23 Sep 2021 09:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTMKC-00083h-OX
 for qemu-riscv@nongnu.org; Thu, 23 Sep 2021 06:51:33 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mTMK5-0005ge-1j
 for qemu-riscv@nongnu.org; Thu, 23 Sep 2021 06:51:30 -0400
Received: by mail-pl1-x635.google.com with SMTP id j15so2320260plh.7
 for <qemu-riscv@nongnu.org>; Thu, 23 Sep 2021 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=4fJXlclBbnkVQPBywtqy0QsfK3GLzEGhebPQ86PZ4yM=;
 b=UwDv30mJvlcUbc5vsqv5ShtJ3oE0rdWz5cuSzKVT1VMx7oOAhptBwIZn+62mHKdIda
 CcTYo+EH+KpGcDyZdaNnrJToFa4sWqSUcsxSlx9OQMQwM6QNX2Bww7OSG0RQXXbD3De5
 /pWCE/0WJrdF+Yon0++dBCaOxfyz5xkXytI1DQ+bx6EBoEMTn9XJoS68bJ+H7GOwtgB8
 qoSCK6s0PZy1TP/XYoD8RYoHjlNP3fM2zc0dTANnUrIbLemr+exTR/fR3LouYTH11512
 q0A2gT3vXM5gNC++K3kAcqiW6ZU/MP54Ed6BdACd1DXgZye8fizrfC83ybMpvRifxhXA
 lPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=4fJXlclBbnkVQPBywtqy0QsfK3GLzEGhebPQ86PZ4yM=;
 b=7tVMFDZeJOCFc+gdLV7GJ8DmAWv65RjZaV6+LN3HvFQ/y4tuGuZ3q2CVB5a4tIJepC
 vxe4kw/d+KjqeYN7vYVXH6xBT5W/iPb2Y6dxBQJuzWkHgwTcKmopHS8tGobfLo94xgE5
 GOSPHM+/prv1loI3FXyNbCRnD4T8YKYk76O8auCZ3bsH3IjM+XcPtNw5CcW0Xf8E+B+X
 ZizeERwM89gBorzUWGnoGCXQb+kiBLDc9dP3aAlVPrHO0TQ8y/7ZGoPFJW5i4UKrN1uL
 IDGBP8DxRw8orPpVH+PQhFpJp2Qcc+11/ezt3e2vs084lRpi76rkfO2d+Zj7LygAg/+J
 vlBw==
X-Gm-Message-State: AOAM531D4EfMuVVfUTv0olGLh7ADR9dx9ar3Ppkhvx6JCQ9NYZIgY80c
 YVK4gprw3VrPqcgFA4L2BofyKg==
X-Google-Smtp-Source: ABdhPJzia+90/vmutfv9+OVhfiSOiEAHqZONBLVWc1gCXXoo34eh7DSYhO2/LLO7Y/O8VFiKodZgxw==
X-Received: by 2002:a17:90b:4d8f:: with SMTP id
 oj15mr4553491pjb.13.1632394282429; 
 Thu, 23 Sep 2021 03:51:22 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.156.170])
 by smtp.googlemail.com with ESMTPSA id e13sm5257765pfi.210.2021.09.23.03.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 03:51:21 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 23 Sep 2021 16:21:11 +0530 (IST)
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
Subject: Re: [RFC PATCH v2 07/16] hw/core/machine: add
 machine_class_is_dynamic_sysbus_dev_allowed
In-Reply-To: <20210922161405.140018-8-damien.hedde@greensocs.com>
Message-ID: <alpine.DEB.2.22.394.2109231559230.630@anisinha-lenovo>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
 <20210922161405.140018-8-damien.hedde@greensocs.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 23 Sep 2021 10:51:33 -0000



On Wed, 22 Sep 2021, Damien Hedde wrote:

> Right now the allowance check for adding a sysbus device using
> -device cli option (or device_add qmp command) is done well after
> the device has been created. It is done during the machine init done
> notifier: machine_init_notify() in hw/core/machine.c
>
> This new function will allow us to check if a sysbus device type is
> allowed to be dynamically created by the machine during the device
> creation time.
>
> Also make device_is_dynamic_sysbus() use the new function.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> In the context of our series, we need to be able to do the check at
> device creation time to allow doing it depending on the current
> MACHINE_INIT phase.
> ---
>  include/hw/boards.h | 17 +++++++++++++++++
>  hw/core/machine.c   | 15 ++++++++++++---
>  2 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 463a5514f9..934443c1cd 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -51,6 +51,23 @@ void machine_set_cpu_numa_node(MachineState *machine,
>   */
>  void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
>
> +/**
> + * machine_class_is_dynamic_sysbus_dev_allowed: Check if type is an allowed
> + * sysbus device type for the machine class.
> + * @mc: Machine class
> + * @type: type to check (should be a subtype of TYPE_SYS_BUS_DEVICE)
> + *
> + * Returns: true if @type is a type in the machine's list of
> + * dynamically pluggable sysbus devices; otherwise false.
> + *
> + * Check if the QOM type @type is in the list of allowed sysbus device
> + * types (see machine_class_allowed_dynamic_sysbus_dev()).
> + * Note that if @type is a subtype of a type which is in the list, it is
> + * allowed too.
> + */
> +bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
> +                                                 const char *type);
> +

How about renaming this to device_type_is_allowed_dynamic_sysbus() ?

>  /**
>   * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
>   * @mc: Machine class
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 9125c9aad0..1a18912dc8 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -545,18 +545,27 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
>
>  bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
>  {
> -    bool allowed = false;
> -    strList *wl;
>      Object *obj = OBJECT(dev);
>
>      if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
>          return false;
>      }
>
> +    return machine_class_is_dynamic_sysbus_dev_allowed(mc,
> +            object_get_typename(obj));
> +}
> +
> +bool machine_class_is_dynamic_sysbus_dev_allowed(MachineClass *mc,
> +                                                 const char *type)
> +{
> +    bool allowed = false;
> +    strList *wl;
> +    ObjectClass *klass = object_class_by_name(type);
> +
>      for (wl = mc->allowed_dynamic_sysbus_devices;
>           !allowed && wl;
>           wl = wl->next) {
> -        allowed |= !!object_dynamic_cast(obj, wl->value);
> +        allowed |= !!object_class_dynamic_cast(klass, wl->value);
>      }
>
>      return allowed;
> --
> 2.33.0
>
>

