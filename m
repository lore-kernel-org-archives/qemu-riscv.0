Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXN7M-0007rS-39
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 09:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN77-0007iX-5i
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 09:07:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN75-0005sq-4n
 for qemu-riscv@nongnu.org; Wed, 01 Mar 2023 09:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677679642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTYW1e7hircUTAoDaT8QZeHGZrDCroXvmwr6zWljRP4=;
 b=GFVIzVZ3Y0XwEr5blsqApdlDVg1DotHtJiQ3BstgpN7Al/4nQu8PPdylkDHehr1JBy7/2O
 450Nk9apJ/UayvGyuvZuBeCEuD5z8FiVrS7XdPam926sXU5iA2O36dhan9Vo6ek3IgVz+Q
 yJvp70CgB5AQRrVwaL4NJm3z6RMh0CE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-W4Oa9BsqOOm_aNwqpOnyAQ-1; Wed, 01 Mar 2023 09:07:17 -0500
X-MC-Unique: W4Oa9BsqOOm_aNwqpOnyAQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 n6-20020a5d51c6000000b002ca3c48ba46so2356440wrv.4
 for <qemu-riscv@nongnu.org>; Wed, 01 Mar 2023 06:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677679635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2eU6CUJmsaj+DRHhWhs2AoNFyx1lPX7SG8r6IebtsJY=;
 b=gvqSg8o7QGqTcUPTQkpM7UjKyzHD02wCgYYjfHgZRItoMTqgb+kQO4Q1GHBGgPXHHl
 ad2qhNhyjwOfXy5aXTNQitedraCHjvo/Q3TG3KqxjrqpKV8UhiQEd9IklGMnxbgf6Etn
 q1OZ3R9GDiN+BFo6ozuImxP+m8RW+dCWY4scGkYbnLfyB0BZor6/1xi0/QLB9Xz60B0S
 1LlSg1O0GZvV+qHhdxlAPHOLDDMURSN1WFDDg0uMglkmR9M08kLYfMqF6Pm99p3zPyIZ
 G+oDCfSmW6NYGst4Jqqw71/cdRyD7tfHn51Td+sryv2hEwVe8XLxBTpgrudiYWfQXA/q
 +fJg==
X-Gm-Message-State: AO0yUKV05jaKwgZAS9jS2/fQU0n1zWbvydDwvm17PqO+5uybJnCy43h6
 dllX8zIkmBpKJ2psl+XUjFGL0bYfYn3HU8YkGNWzeRUGdNAUjurrKVM6R1W5ynpwxSoH8lAFlkc
 6xA3IT4ePLTtuOo4=
X-Received: by 2002:a5d:5092:0:b0:2c9:97f8:2604 with SMTP id
 a18-20020a5d5092000000b002c997f82604mr4466675wrt.14.1677679635143; 
 Wed, 01 Mar 2023 06:07:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/7QWgYk6B6Zh/n6bpl7/tc/4aGqmoeXwzO1Sistf6H6RrO7H6ypRehSAEaAwiLgA1/TEzR5A==
X-Received: by 2002:a5d:5092:0:b0:2c9:97f8:2604 with SMTP id
 a18-20020a5d5092000000b002c997f82604mr4466652wrt.14.1677679634801; 
 Wed, 01 Mar 2023 06:07:14 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 a2-20020adfdd02000000b002c3f03d8851sm13000492wrm.16.2023.03.01.06.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:07:14 -0800 (PST)
Date: Wed, 1 Mar 2023 15:07:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Aurelien
 Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 03/19] hw/acpi: Set QDev properties using QDev API
Message-ID: <20230301150713.48d4ef36@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230203180914.49112-4-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
 <20230203180914.49112-4-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Mar 2023 14:07:33 -0000

On Fri,  3 Feb 2023 19:08:58 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/acpi/cpu_hotplug.c | 7 +++----
>  hw/acpi/ich9.c        | 4 ++--
>  hw/acpi/piix4.c       | 4 ++--
>  3 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index b8c9081738..5bc5f435f4 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -10,6 +10,7 @@
>   * See the COPYING file in the top-level directory.
>   */
>  #include "qemu/osdep.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/acpi/cpu_hotplug.h"
>  #include "qapi/error.h"
>  #include "hw/core/cpu.h"
> @@ -41,8 +42,7 @@ static void cpu_status_write(void *opaque, hwaddr addr,=
 uint64_t data,
>       */
>      if (addr =3D=3D 0 && data =3D=3D 0) {
>          AcpiCpuHotplug *gpe =3D opaque;
> -        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legac=
y",
> -                                 false, &error_abort);
> +        qdev_prop_set_bit(gpe->parent, "cpu-hotplug-legacy", false);
>      }
>  }
> =20
> @@ -66,8 +66,7 @@ static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gp=
e, CPUState *cpu)
> =20
>      cpu_id =3D k->get_arch_id(cpu);
>      if ((cpu_id / 8) >=3D ACPI_GPE_PROC_LEN) {
> -        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legac=
y",
> -                                 false, &error_abort);
> +        qdev_prop_set_bit(gpe->parent, "cpu-hotplug-legacy", false);
>          return;
>      }
> =20
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 6c9a737479..9759119b32 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -30,6 +30,7 @@
>  #include "hw/pci/pci.h"
>  #include "migration/vmstate.h"
>  #include "qemu/timer.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/core/cpu.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> @@ -197,8 +198,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
>  static int vmstate_cpuhp_pre_load(void *opaque)
>  {
>      ICH9LPCPMRegs *s =3D opaque;
> -    Object *obj =3D OBJECT(s->gpe.parent);
> -    object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_ab=
ort);
> +    qdev_prop_set_bit(s->gpe.parent, "cpu-hotplug-legacy", false);
>      return 0;
>  }
> =20
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 3a61d89f92..9a86d506de 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -206,8 +206,8 @@ static bool vmstate_test_use_cpuhp(void *opaque)
> =20
>  static int vmstate_cpuhp_pre_load(void *opaque)
>  {
> -    Object *obj =3D OBJECT(opaque);
> -    object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_ab=
ort);
> +    PIIX4PMState *s =3D opaque;

In other series you were aiming for type safety converting Object to Device=
State
and here you do opposite of that

> +    qdev_prop_set_bit(DEVICE(s), "cpu-hotplug-legacy", false);
if you have to, just use DEVICE(opaque) here and drop above pointer casting=
.

>      return 0;
>  }
> =20


