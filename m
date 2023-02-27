Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWfdK-0000H8-9F
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 10:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pWfdI-0000Gi-EG
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 10:41:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pWfd9-0002nN-Uo
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 10:41:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677512488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbwzvKv2zG+mrCQxPtTTMvgM+pkTWTz0xo61SbVi9i8=;
 b=Nv8YB7xW6IgeK/Fdy5ML0uIbjR9oaZOyn1KAgji2lE60Dx/gD4GLetWCB99+cUmNiTqXpq
 /k2qa6ORg66LslOrpDEBXvX4+IUh8LQ5ZNHgHyv6DoBbAHZ4gHoRMBsljHy4MRjCA1bfv0
 ZmxWvr5732C5h8BSCvoZHxHO8II5aFM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-ohbgOubBNJO3GnRqtTtVqA-1; Mon, 27 Feb 2023 10:41:27 -0500
X-MC-Unique: ohbgOubBNJO3GnRqtTtVqA-1
Received: by mail-qt1-f198.google.com with SMTP id
 k13-20020ac8074d000000b003bfd04a3cbcso1774749qth.16
 for <qemu-riscv@nongnu.org>; Mon, 27 Feb 2023 07:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fbwzvKv2zG+mrCQxPtTTMvgM+pkTWTz0xo61SbVi9i8=;
 b=7wgA2H6giEqNrNxAsdrdkgfyii/68T2mosPfGTInm6CHeFtgNt9BAV4hzPc32AIJVw
 Aj2aPz9biPiQPYWM5RHjA6zBzpqa6ouHZflyCAUI4VmlSesJM2JmbPYODAKnIDSk06GB
 yy2b5kdaVXzr8uU+Jt84yDIM44Sj2tLc4MiRc9jXzQokYhgMRT1vHom88N2W/l9oNkm0
 JgBS7ZT/ctVKRay89aWM/Pev6Lkd/4kiBWQNkrGhIrQDnEG1FvPbN5TRcRTqFM36b6Th
 Od9gaunTRruP6hQfdNOqxpHyGx/Ve5SMUZ/xKF8fYf9jZReL/M++9g76zLLHtH1r6Oxu
 gm/A==
X-Gm-Message-State: AO0yUKUM/dEaORSqbrjaGo8470xQbr0ZmQXg4gJ7YwJxTvFHlVt1OrJ9
 fXEDI0EwjGR5xS4ODvcS67gCjXOG/5wo6AarVMZbCQBYLv/LfCDZjbRjyb4OBGtdWHnuEuZAN35
 +OIjUQCukwTSNvzQ=
X-Received: by 2002:a05:622a:1a94:b0:3bf:ca3d:673c with SMTP id
 s20-20020a05622a1a9400b003bfca3d673cmr13240582qtc.2.1677512487142; 
 Mon, 27 Feb 2023 07:41:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9Lf0gjlCBaRtChf6G5hRHzXO2pQB4lYHVWR8IL/L7BA39Ri/WdlYzT6W5sEDeEzunfNJDjXQ==
X-Received: by 2002:a05:622a:1a94:b0:3bf:ca3d:673c with SMTP id
 s20-20020a05622a1a9400b003bfca3d673cmr13240539qtc.2.1677512486714; 
 Mon, 27 Feb 2023 07:41:26 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 s184-20020a372cc1000000b0073bb00eb0besm5095139qkh.22.2023.02.27.07.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 07:41:25 -0800 (PST)
Date: Mon, 27 Feb 2023 16:41:21 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, Andrew Jones
 <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Atish
 Kumar Patra <atishp@rivosinc.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V4 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Message-ID: <20230227164121.73d1ecc0@imammedo.users.ipa.redhat.com>
In-Reply-To: <Y/jJMnHaspaic2M3@sunil-laptop>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
 <20230224083701.2657063-6-sunilvl@ventanamicro.com>
 <20230224135343.24a5a95b@imammedo.users.ipa.redhat.com>
 <Y/jJMnHaspaic2M3@sunil-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 15:41:44 -0000

On Fri, 24 Feb 2023 19:56:58 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> Hi Igor,
> 
> On Fri, Feb 24, 2023 at 01:53:43PM +0100, Igor Mammedov wrote:
> > On Fri, 24 Feb 2023 14:06:58 +0530
> > Sunil V L <sunilvl@ventanamicro.com> wrote:
> >   
> > > Add Multiple APIC Description Table (MADT) with the
> > > RINTC structure for each cpu.
> > > 
> > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  hw/riscv/virt-acpi-build.c | 44 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 44 insertions(+)
> > > 
> > > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> > > index 3a5e2e6d53..8b85b34c55 100644
> > > --- a/hw/riscv/virt-acpi-build.c
> > > +++ b/hw/riscv/virt-acpi-build.c
> > > @@ -32,6 +32,7 @@
> > >  #include "sysemu/reset.h"
> > >  #include "migration/vmstate.h"
> > >  #include "hw/riscv/virt.h"
> > > +#include "hw/riscv/numa.h"
> > >  
> > >  #define ACPI_BUILD_TABLE_SIZE             0x20000
> > >  
> > > @@ -132,6 +133,46 @@ static void build_dsdt(GArray *table_data,
> > >      free_aml_allocator();
> > >  }
> > >  
> > > +/* MADT */  
> > 
> > see build_srat() how this comment must look like
> >  
> Currently, even though ECRs are approved, the ACPI spec is not released
> for these MADT structures. I can add the spec version for the generic
> MADT but not for the RINTC. Same issue with a new table RHCT.
> What is the recommendation in such case?

ther must be some draft variant of spec or a ticket where it was approved
or a reference impl. somewhere.

> 
> > > +static void build_madt(GArray *table_data,
> > > +                       BIOSLinker *linker,
> > > +                       RISCVVirtState *s)
> > > +{
> > > +    MachineState *ms = MACHINE(s);
> > > +    int socket;
> > > +    uint16_t base_hartid = 0;
> > > +    uint32_t cpu_id = 0;
> > > +
> > > +    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
> > > +                        .oem_table_id = s->oem_table_id };
> > > +
> > > +    acpi_table_begin(&table, table_data);
> > > +    /* Local Interrupt Controller Address */
> > > +    build_append_int_noprefix(table_data, 0, 4);
> > > +    build_append_int_noprefix(table_data, 0, 4);   /* MADT Flags */
> > > +
> > > +    /* RISC-V Local INTC structures per HART */
> > > +    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
> > > +        base_hartid = riscv_socket_first_hartid(ms, socket);
> > > +
> > > +        for (int i = 0; i < s->soc[socket].num_harts; i++) {
> > > +            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
> > > +            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
> > > +            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
> > > +            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
> > > +            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
> > > +            build_append_int_noprefix(table_data,
> > > +                                      (base_hartid + i), 8);   /* Hart ID  */
> > > +
> > > +            /* ACPI Processor UID  */
> > > +            build_append_int_noprefix(table_data, cpu_id, 4);  
> > 
> > cpu_id here seems to be unrelated to one in DSDT.
> > Could you explain how socket/hartid and cpu_id are related to each other?
> >   
> cpu_id should match the _UID. I needed two loops here to get the
> base_hartid of the socket. hart_id is the unique ID for each hart
> similar to MPIDR / APIC ID. I understand your point. Let me make DSDT
> also created using two loops so that both match.

Why not reuse possible CPUs to describe topology there and then
use ids from it to build ACPI tables instead of inventing your own
cpu topo all over the place?

PS: look for possible_cpus and how it's used (virt-arm already uses it
although partially). And I'd like to avoid adding new ad-hoc ways
to describe CPU topology is current possible_cpu ca do the job.

> Thank you very much for your review!
> Sunil
> 


