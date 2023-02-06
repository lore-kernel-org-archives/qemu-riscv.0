Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOy26-0007dB-9F
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 04:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOy24-0007co-6v; Mon, 06 Feb 2023 04:43:29 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOy22-00036f-Gk; Mon, 06 Feb 2023 04:43:27 -0500
Received: by mail-ed1-x531.google.com with SMTP id r3so1272158edq.13;
 Mon, 06 Feb 2023 01:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=67d9zFG35eHOCtzFLecCP+mO7UjXbgKaJPqOH5JRbck=;
 b=J7SCmKL39QzeGI++TGoqPCdVyBnavknPjl4odyKBiJC7kaoJ3TZOaR1zGul9Kaz3tt
 s2UdOxVLjOSHvXZ5Xumeh4MtPzurmAUI6sfuLoDTfsJs6Nluyppk5t5vjsWtjX3fLVRS
 eTXkcjBYg2S5Pgp9G0xbJYAaIKswuYM5X+Q4O5ip3Lf+an9NAAoxesEz6nhTlI1NI5Lw
 nkPcQ2sy9/pbH/GJ1XVYENShsCpFegRr3Vl9SCdiIIXcr5pBN/o2Z0/wT5CByye6up8/
 UEJTzbb2xVVp1bi2GMZCRNjaRQkd5ll5ZlwOsJxZZY4JSwrkkKI+rJ5gpi7wSny9EN8r
 hX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=67d9zFG35eHOCtzFLecCP+mO7UjXbgKaJPqOH5JRbck=;
 b=hHmTy00XMUXeim80xjctOiS5K87K+B+M6Sif6JFh/H1X6eTOacxLl/Q3aRZ4sBUU5R
 /t/n/CuW93nvOmN1oJKrO185E4a2HMWp4yRRr4VJL6p02pIy/fskxezoqH4G4S0wdWQw
 KpketluIJjchAWTmznI7+ekHo/7lPZ6ygXpndGnewUMi32t18sKKZV0Nwk766F2AJ1R8
 EAJtGoinhOFgrliGxw/WW3abrEZnvLb9+A7g0zFBmrW835LI8V9P7xB1OCWP2NXLGOku
 jb28CVaowof9GdIaRy6TOU7DUkQy1x5NGoTqv+FsLbm0p7+BlQkSF5l/6tzWsZ0rImEP
 QUig==
X-Gm-Message-State: AO0yUKXC/MkiBwLR+ww3HySiq3AfjpUIVUQCY6D8xXkJyNOJOOxxsK3u
 pUpkAAn93oP0IgPy0IacHq+juJNycW4uNnJoJNc=
X-Google-Smtp-Source: AK7set9McZ9Ax27VrqHo8dME9BriZAwS4F2JULPyMCy9pGGUhKJ5EaM5/eTbJ5MnCebDW8CtAQweLW6JmClsTqASwZM=
X-Received: by 2002:a50:d5c9:0:b0:4a2:121d:1d3d with SMTP id
 g9-20020a50d5c9000000b004a2121d1d3dmr5796098edj.82.1675676604471; Mon, 06 Feb
 2023 01:43:24 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-3-sunilvl@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Feb 2023 17:43:13 +0800
Message-ID: <CAEUhbmXYjVTDo6ZYQaO+R50_E+zCnns=CN9oCT-TMwwJ8eH=+w@mail.gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 06 Feb 2023 09:43:29 -0000

On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> ACPI is optional. So, add a switch to toggle.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt.c         | 38 ++++++++++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h |  2 ++
>  2 files changed, 40 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 7ad9fda20c..84962962ff 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -50,6 +50,7 @@
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
>  #include "hw/acpi/aml-build.h"
> +#include "qapi/qapi-visit-common.h"
>
>  /*
>   * The virt machine physical address space used by some of the devices
> @@ -1525,6 +1526,10 @@ static void virt_machine_init(MachineState *machine)
>
>  static void virt_machine_instance_init(Object *obj)
>  {
> +    MachineState *ms = MACHINE(obj);

Drop this

> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
> +
> +    s->acpi = ON_OFF_AUTO_OFF;

Is this needed? I believe the purpose of an auto/on/off property is to
have an "auto" value, which is ON_OFF_AUTO_AUTO.

>  }
>
>  static char *virt_get_aia_guests(Object *obj, Error **errp)
> @@ -1601,6 +1606,34 @@ static void virt_set_aclint(Object *obj, bool value, Error **errp)
>      s->have_aclint = value;
>  }
>
> +bool virt_is_acpi_enabled(RISCVVirtState *s)
> +{
> +    if (s->acpi == ON_OFF_AUTO_OFF) {
> +        return false;
> +    }
> +    return true;
> +}
> +
> +static void virt_get_acpi(Object *obj, Visitor *v, const char *name,
> +                          void *opaque, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);

ditto

> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
> +
> +    OnOffAuto acpi = s->acpi;
> +
> +    visit_type_OnOffAuto(v, name, &acpi, errp);
> +}
> +
> +static void virt_set_acpi(Object *obj, Visitor *v, const char *name,
> +                          void *opaque, Error **errp)
> +{
> +    MachineState *ms = MACHINE(obj);

ditto

> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(ms);
> +
> +    visit_type_OnOffAuto(v, name, &s->acpi, errp);
> +}
> +
>  static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>                                                          DeviceState *dev)
>  {
> @@ -1672,6 +1705,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
>                   "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
>      object_class_property_set_description(oc, "aia-guests", str);
> +    object_class_property_add(oc, "acpi", "OnOffAuto",
> +                              virt_get_acpi, virt_set_acpi,
> +                              NULL, NULL);

I am not sure about "OnOffAuto" vs. "bool" type. It seems the only
difference is that with "OnOffAuto" type we may silently change the
interpretation of "auto" value across different QEMU versions?

> +    object_class_property_set_description(oc, "acpi",
> +                                          "Enable ACPI");
>  }
>
>  static const TypeInfo virt_machine_typeinfo = {
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index 6c7885bf89..62efebaa32 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -58,6 +58,7 @@ struct RISCVVirtState {
>      int aia_guests;
>      char *oem_id;
>      char *oem_table_id;
> +    OnOffAuto acpi;
>  };
>
>  enum {
> @@ -123,4 +124,5 @@ enum {
>  #define FDT_APLIC_INT_MAP_WIDTH (FDT_PCI_ADDR_CELLS + FDT_PCI_INT_CELLS + \
>                                   1 + FDT_APLIC_INT_CELLS)
>
> +bool virt_is_acpi_enabled(RISCVVirtState *s);
>  #endif
> --

Regards,
Bin

