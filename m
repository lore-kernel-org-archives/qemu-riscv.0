Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWuVe-0004R9-FR
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 02:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pWuVc-0004Qn-Cq
 for qemu-riscv@nongnu.org; Tue, 28 Feb 2023 02:34:48 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pWuVa-0006i6-Jx
 for qemu-riscv@nongnu.org; Tue, 28 Feb 2023 02:34:48 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so12766049pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 27 Feb 2023 23:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B2nPtVMoqQQeUurZLSBplL9QxFM/YOG7P8uSFLXSFhc=;
 b=RvfB+r/c1wjzj5utZuWxc82/lmnz5uYQCYBtH0Qe0awIsLZiUCoWDx/k7D8TgekQwl
 QuogIQoGznJgI3TBoIQxS21fId+Vp4EghWLZ7+P/GkoWGb2kmefPbvQIX5RF1xNpyBdf
 eV3lz6UgzyR5PXLmqMmtKFUBtEds1Toeysu2B4gt9DjT/k8J/LsZSPkq2/aiyuwkb5cO
 3xUTDzhU0wAA4kcBRWTFszH6yF4cbimL+dAB/f7WZXgrOdjeOaK+LHLI4J+gNp4NVuIR
 Gx83rWMkWvYdQwzvAX8Bh4Ti2ipadPeMhI4Kc4bcZ4bfXx2nBQsycVzpzes1qTN9IclB
 aD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2nPtVMoqQQeUurZLSBplL9QxFM/YOG7P8uSFLXSFhc=;
 b=4IteSp3twlENYIOr2DqXyBpdt+iCOB4YCX6yNQEKKzfW1itRBrl9uEqKmMjhj6dNYa
 K2uewf1/32fbBnko5T6cTH/GCePL0+h0XFFtoql+II+kzvFq51Bz37LHgmN1clCIclzE
 k0sH3f2EEKTSU7+9kY9cXplkWy9uQCGm6baFPSvhTQTSs+hey/gDp/0+Ej5eQv0ELgTx
 2olJVCGeTaWqZu9Vjgw60jnTm7vs9QIFptsP8fFmU48TMM7Oz8/l42EKmMMh9sbAznUs
 iHWHpbQKB2Im4lo9EntxThyuyMbS+AwFqniskk9T/QjGMabYbqZFmN9wz0RCH0Y5QPQu
 gtjw==
X-Gm-Message-State: AO0yUKUOAfZTn76yrKGJdxzq9lu+UQM+9a0rSk2KE0d+UfmVPAVuIi5p
 UqgDsoGpfVzP3mVHWuXZpklNyw==
X-Google-Smtp-Source: AK7set/hdKRU97a3tM2BSAJIy1V+ot+PoObHyLUF2Z5O3qyk0UmDdeYbfT2KZCLUOviTcqWq5YgaUw==
X-Received: by 2002:a17:903:284d:b0:19c:d420:9bc9 with SMTP id
 kq13-20020a170903284d00b0019cd4209bc9mr1698595plb.8.1677569684344; 
 Mon, 27 Feb 2023 23:34:44 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 ij15-20020a170902ab4f00b0019602274208sm5781902plb.186.2023.02.27.23.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 23:34:44 -0800 (PST)
Date: Tue, 28 Feb 2023 13:04:36 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: Re: [PATCH V4 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Message-ID: <Y/2ujHMFrhnfJUiJ@sunil-laptop>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
 <20230224083701.2657063-6-sunilvl@ventanamicro.com>
 <20230224135343.24a5a95b@imammedo.users.ipa.redhat.com>
 <Y/jJMnHaspaic2M3@sunil-laptop>
 <20230227164121.73d1ecc0@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227164121.73d1ecc0@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 28 Feb 2023 07:34:48 -0000

On Mon, Feb 27, 2023 at 04:41:21PM +0100, Igor Mammedov wrote:
> On Fri, 24 Feb 2023 19:56:58 +0530
> Sunil V L <sunilvl@ventanamicro.com> wrote:
> 
> > Hi Igor,
> > 
> > On Fri, Feb 24, 2023 at 01:53:43PM +0100, Igor Mammedov wrote:
> > > On Fri, 24 Feb 2023 14:06:58 +0530
> > > Sunil V L <sunilvl@ventanamicro.com> wrote:
> > >   
> > > > Add Multiple APIC Description Table (MADT) with the
> > > > RINTC structure for each cpu.
> > > > 
> > > > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > > > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > > ---
> > > >  hw/riscv/virt-acpi-build.c | 44 ++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 44 insertions(+)
> > > > 
> > > > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> > > > index 3a5e2e6d53..8b85b34c55 100644
> > > > --- a/hw/riscv/virt-acpi-build.c
> > > > +++ b/hw/riscv/virt-acpi-build.c
> > > > @@ -32,6 +32,7 @@
> > > >  #include "sysemu/reset.h"
> > > >  #include "migration/vmstate.h"
> > > >  #include "hw/riscv/virt.h"
> > > > +#include "hw/riscv/numa.h"
> > > >  
> > > >  #define ACPI_BUILD_TABLE_SIZE             0x20000
> > > >  
> > > > @@ -132,6 +133,46 @@ static void build_dsdt(GArray *table_data,
> > > >      free_aml_allocator();
> > > >  }
> > > >  
> > > > +/* MADT */  
> > > 
> > > see build_srat() how this comment must look like
> > >  
> > Currently, even though ECRs are approved, the ACPI spec is not released
> > for these MADT structures. I can add the spec version for the generic
> > MADT but not for the RINTC. Same issue with a new table RHCT.
> > What is the recommendation in such case?
> 
> ther must be some draft variant of spec or a ticket where it was approved
> or a reference impl. somewhere.
> 
Sure, I can add the ticket ID. Thanks!

> > 
> > > > +static void build_madt(GArray *table_data,
> > > > +                       BIOSLinker *linker,
> > > > +                       RISCVVirtState *s)
> > > > +{
> > > > +    MachineState *ms = MACHINE(s);
> > > > +    int socket;
> > > > +    uint16_t base_hartid = 0;
> > > > +    uint32_t cpu_id = 0;
> > > > +
> > > > +    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
> > > > +                        .oem_table_id = s->oem_table_id };
> > > > +
> > > > +    acpi_table_begin(&table, table_data);
> > > > +    /* Local Interrupt Controller Address */
> > > > +    build_append_int_noprefix(table_data, 0, 4);
> > > > +    build_append_int_noprefix(table_data, 0, 4);   /* MADT Flags */
> > > > +
> > > > +    /* RISC-V Local INTC structures per HART */
> > > > +    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
> > > > +        base_hartid = riscv_socket_first_hartid(ms, socket);
> > > > +
> > > > +        for (int i = 0; i < s->soc[socket].num_harts; i++) {
> > > > +            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
> > > > +            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
> > > > +            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
> > > > +            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
> > > > +            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
> > > > +            build_append_int_noprefix(table_data,
> > > > +                                      (base_hartid + i), 8);   /* Hart ID  */
> > > > +
> > > > +            /* ACPI Processor UID  */
> > > > +            build_append_int_noprefix(table_data, cpu_id, 4);  
> > > 
> > > cpu_id here seems to be unrelated to one in DSDT.
> > > Could you explain how socket/hartid and cpu_id are related to each other?
> > >   
> > cpu_id should match the _UID. I needed two loops here to get the
> > base_hartid of the socket. hart_id is the unique ID for each hart
> > similar to MPIDR / APIC ID. I understand your point. Let me make DSDT
> > also created using two loops so that both match.
> 
> Why not reuse possible CPUs to describe topology there and then
> use ids from it to build ACPI tables instead of inventing your own
> cpu topo all over the place?
> 
> PS: look for possible_cpus and how it's used (virt-arm already uses it
> although partially). And I'd like to avoid adding new ad-hoc ways
> to describe CPU topology is current possible_cpu ca do the job.

Okay, sure. Let me take a look at possible_cpus and use in cpu topology.
Thanks!

