Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pPudP-00018c-8S
	for mharc-qemu-riscv@gnu.org; Wed, 08 Feb 2023 19:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPudN-00018L-Bf; Wed, 08 Feb 2023 19:17:53 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pPudL-0001jO-H3; Wed, 08 Feb 2023 19:17:52 -0500
Received: by mail-vs1-xe34.google.com with SMTP id x8so455284vso.2;
 Wed, 08 Feb 2023 16:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Smn1Xnblguf/oi4/pk7XQeGtrWjPbGtdslUr0J2AFcE=;
 b=e04IltaJxoJ2vo4J5P5RurhHo52xISzoWYt/7KmmOl66h4jkJLgftLWI6FlKgVhQw6
 BafQ4CgeFTglKeazrMJh9BLLR7LInjIuDbrlYIt4Q+qCqxiN6JNDFi6/5wZboWkgWC0G
 DG5ghdLENoVDss7KOzOq+P1NbjFBxg6CvReJtKAOulLPNpxPXMjZ//sFwhytXePGPfl3
 3Mz63YnxBYe8RzaN3hA+p1mwBZd3FE4nZRHtgnRkrdpdnxG76Nf+QOv/umYCR4bV/AVA
 bko69rF/jWVbfTh2zcGtK5885f1PXKzhEJc/EVt6pLh0a6l+s9+9nn4Vai7LiyNMrYMX
 g4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Smn1Xnblguf/oi4/pk7XQeGtrWjPbGtdslUr0J2AFcE=;
 b=BTQzpCQWHSh/Iwrh1QPwAkggVdvA4XgHxXCMETHjiuaelNsZFShdy7f4tcdOlab0wp
 x9C04JRKN99xx/NdkX0g47MctOuNTZszbrVikzdgEOqyEJ+gKMQ2JJtf8tMjR81gFb+/
 zEzTFYusZWb7UZdJISMk6ESl9z5qXGGppAxAoF/LOZ9rIrKRDaxvuoFXP49ewAuDpNg4
 a3rHg/I6a55lTuCrQNfPedY3ECeaYmQqh/8z6xLgFSe2LTARrfx8G/zzMV72YQjs0WOo
 YNkIgoaos0YnIrtCLhmRxuIuuNjFICHdBIaWqZeXJ+73robL4yj2JKQE/AH+ZFRwsq3B
 SGkg==
X-Gm-Message-State: AO0yUKXZClB7PnvFzvHBljgqJzY+Jw4vNTikK2Bhw72JBpdAv2LCkAhe
 NUahKowywTtMB8f+CHGLlVKsHY+2RnBXEckVsf8=
X-Google-Smtp-Source: AK7set8lgh3pWridEWtQPyxGiUs92vd22kjsaHkdHUHjzUtlMfrBjOSK6k+5vNmw68807cNqCG9XBv8dNkBlwr0/JlI=
X-Received: by 2002:a67:a208:0:b0:3ee:4ef8:45d3 with SMTP id
 l8-20020a67a208000000b003ee4ef845d3mr1920428vse.64.1675901869588; Wed, 08 Feb
 2023 16:17:49 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-2-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-2-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 Feb 2023 10:17:23 +1000
Message-ID: <CAKmqyKNZrYOtLqhTSbABpP2ktJYUj1Jgf2czoOwJoQYDCP1itg@mail.gmail.com>
Subject: Re: [PATCH 01/10] hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Thu, 09 Feb 2023 00:17:53 -0000

On Thu, Feb 2, 2023 at 2:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> ACPI needs OEM_ID and OEM_TABLE_ID for the machine. Add these fields
> in the RISCVVirtState structure and initialize with default values.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c         | 4 ++++
>  include/hw/riscv/virt.h | 2 ++
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index a061151a6f..7ad9fda20c 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -49,6 +49,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/display/ramfb.h"
> +#include "hw/acpi/aml-build.h"
>
>  /*
>   * The virt machine physical address space used by some of the devices
> @@ -1512,6 +1513,9 @@ static void virt_machine_init(MachineState *machine)
>      }
>      virt_flash_map(s, system_memory);
>
> +    s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
> +    s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
> +
>      /* create device tree */
>      create_fdt(s, memmap);
>
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index b3d26135c0..6c7885bf89 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -56,6 +56,8 @@ struct RISCVVirtState {
>      bool have_aclint;
>      RISCVVirtAIAType aia_type;
>      int aia_guests;
> +    char *oem_id;
> +    char *oem_table_id;
>  };
>
>  enum {
> --
> 2.38.0
>
>

