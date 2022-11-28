Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozkYm-00087k-F1
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 15:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ozkYl-00086b-1t
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 15:16:59 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ozkYh-0000fN-7M
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 15:16:58 -0500
Received: by mail-pg1-x52a.google.com with SMTP id w37so5816388pga.5
 for <qemu-riscv@nongnu.org>; Mon, 28 Nov 2022 12:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZHA0nNzUWeJr4n+F5kZ2FgmIlbVbUeqlnGABeul0SI=;
 b=IijJUjRIFdwQekCkquO4+3bthCfg2TkmF0tb+vVSJvfRba29inT6M6iXKnWsIhAYUB
 nGQDjyHFCVEzPKLAnUL+rgCmpSipQ0rch6RsqNg+pMryxEvgy4BigE3hfayHX7YK9OUB
 7w0+Jt5plyza4/7vk59GwnbU6ESQj9ME+b0EfFhK8qux7DmQBs18QKIcOnAPn5C/Bdp2
 IJhc+2tlfgvpBREmlXSlafHQWE/z2SCmVL27xQg01lBjlC3Mu9tarTScd74/WXfvuYMM
 qsAiypgQU7SjRGJfX5Vr/hbTeq1tg8y7vsXhfdRpXkF94mARTbEJ/H+NW/QxcxlAT1p5
 Dtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZHA0nNzUWeJr4n+F5kZ2FgmIlbVbUeqlnGABeul0SI=;
 b=NJMoQAskSJP5r9t3jSbdecmnhUphCm6/KLhRN1dJNdFd65Z6GmBT5BQUYFNvqslTv+
 YxqL6ttx0Gh1mxqJiESUjVzgPyJReSap1h8zoaQAoqALwGASu3Z9HkqRpYFQVqtQuRqL
 xKmZj6hThqjihHTHf6MsrMzN56ySJzdw+FmQh44MbOLB41LWaCwfbMUJmeEZI/yWg9Jk
 iw1wWwOP1yfZxgGWVPT8Fw9OGG/K9A4B2Y4o1XoyKUWtm5Q89khvBIOlPKENnl+c6EaJ
 Rd49PN/7Us78Td611TlbwHEeGMKphWY/LIscY95U66Ebv2yOqy+aBnwbqQaKEM6WNA12
 JBKw==
X-Gm-Message-State: ANoB5plmVA08BmKQ5KsckBnVCviumfPGKi3dUoXiqFS37AkHnbOxtMvs
 CROEvAQNNZ+V4C+oBF4wM+4YhCQhnXUQFKKGDcmsDA==
X-Google-Smtp-Source: AA0mqf5etGTxJ1SSX4DPf0txPdHcxxcGdmkBB1Xs/i2QuWYmHeVVxKZrQSgQpHyHzOw8c8qUwJ87ykSZUVUX6QMF7kM=
X-Received: by 2002:a65:4688:0:b0:477:7aee:a464 with SMTP id
 h8-20020a654688000000b004777aeea464mr32854012pgr.595.1669666612258; Mon, 28
 Nov 2022 12:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <20220824221701.41932-5-atishp@rivosinc.com>
 <Y39urpX82uO85AAb@wendy>
In-Reply-To: <Y39urpX82uO85AAb@wendy>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 28 Nov 2022 12:16:41 -0800
Message-ID: <CAHBxVyFhrkdhWpc4xB-_a4c5GnDu=d01-bk2zM2nCraeq_Xr_A@mail.gmail.com>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
To: Conor Dooley <conor.dooley@microchip.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 28 Nov 2022 20:16:59 -0000

On Thu, Nov 24, 2022 at 5:17 AM Conor Dooley <conor.dooley@microchip.com> w=
rote:
>
> On Wed, Aug 24, 2022 at 03:17:00PM -0700, Atish Patra wrote:
> > Qemu virt machine can support few cache events and cycle/instret counte=
rs.
> > It also supports counter overflow for these events.
> >
> > Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
> > capabilities. There are some dummy nodes added for testing as well.
>
> Hey Atish!
>
> I was fiddling with dumping the virt machine dtb again today to check
> some dt-binding changes I was making for the isa string would play
> nicely with the virt machine & I noticed that this patch has introduced
> a new validation failure:
>
> ./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=3Dqemu.dtb
>
> dt-validate -p ../linux/Documentation/devicetree/bindings/processed-schem=
a.json qemu.dtb
> /home/conor/stuff/qemu/qemu.dtb: soc: pmu: {'riscv,event-to-mhpmcounters'=
: [[1, 1, 524281, 2, 2, 524284, 65561, 65561, 524280, 65563, 65563, 524280,=
 65569, 65569, 524280, 0, 0, 0, 0, 0]], 'compatible': ['riscv,pmu']} should=
 not be valid under {'type': 'object'}
>         From schema: /home/conor/.local/lib/python3.10/site-packages/dtsc=
hema/schemas/simple-bus.yaml
>
> I assume this is the aforementioned "dummy" node & you have no intention
> of creating a binding for this?
>

It is a dummy node from Linux kernel perspective. OpenSbi use this
node to figure out the hpmcounter mappings.

> Thanks,
> Conor.
>
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  hw/riscv/virt.c    | 16 +++++++++++++
> >  target/riscv/pmu.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
> >  target/riscv/pmu.h |  1 +
> >  3 files changed, 74 insertions(+)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index ff8c0df5cd47..befa9d2c26ac 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -30,6 +30,7 @@
> >  #include "hw/char/serial.h"
> >  #include "target/riscv/cpu.h"
> >  #include "hw/core/sysbus-fdt.h"
> > +#include "target/riscv/pmu.h"
> >  #include "hw/riscv/riscv_hart.h"
> >  #include "hw/riscv/virt.h"
> >  #include "hw/riscv/boot.h"
> > @@ -708,6 +709,20 @@ static void create_fdt_socket_aplic(RISCVVirtState=
 *s,
> >      aplic_phandles[socket] =3D aplic_s_phandle;
> >  }
> >
> > +static void create_fdt_pmu(RISCVVirtState *s)
> > +{
> > +    char *pmu_name;
> > +    MachineState *mc =3D MACHINE(s);
> > +    RISCVCPU hart =3D s->soc[0].harts[0];
> > +
> > +    pmu_name =3D g_strdup_printf("/soc/pmu");
> > +    qemu_fdt_add_subnode(mc->fdt, pmu_name);
> > +    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pm=
u");
> > +    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
> > +
> > +    g_free(pmu_name);
> > +}
> > +
> >  static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *m=
emmap,
> >                                 bool is_32_bit, uint32_t *phandle,
> >                                 uint32_t *irq_mmio_phandle,
> > @@ -1036,6 +1051,7 @@ static void create_fdt(RISCVVirtState *s, const M=
emMapEntry *memmap,
> >
> >      create_fdt_flash(s, memmap);
> >      create_fdt_fw_cfg(s, memmap);
> > +    create_fdt_pmu(s);
> >
> >  update_bootargs:
> >      if (cmdline && *cmdline) {
> > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > index a5f504e53c88..b8e56d2b7b8e 100644
> > --- a/target/riscv/pmu.c
> > +++ b/target/riscv/pmu.c
> > @@ -20,11 +20,68 @@
> >  #include "cpu.h"
> >  #include "pmu.h"
> >  #include "sysemu/cpu-timers.h"
> > +#include "sysemu/device_tree.h"
> >
> >  #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
> >  #define MAKE_32BIT_MASK(shift, length) \
> >          (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
> >
> > +/*
> > + * To keep it simple, any event can be mapped to any programmable coun=
ters in
> > + * QEMU. The generic cycle & instruction count events can also be moni=
tored
> > + * using programmable counters. In that case, mcycle & minstret must c=
ontinue
> > + * to provide the correct value as well. Heterogeneous PMU per hart is=
 not
> > + * supported yet. Thus, number of counters are same across all harts.
> > + */
> > +void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_na=
me)
> > +{
> > +    uint32_t fdt_event_ctr_map[20] =3D {};
> > +    uint32_t cmask;
> > +
> > +    /* All the programmable counters can map to any event */
> > +    cmask =3D MAKE_32BIT_MASK(3, num_ctrs);
> > +
> > +   /*
> > +    * The event encoding is specified in the SBI specification
> > +    * Event idx is a 20bits wide number encoded as follows:
> > +    * event_idx[19:16] =3D type
> > +    * event_idx[15:0] =3D code
> > +    * The code field in cache events are encoded as follows:
> > +    * event_idx.code[15:3] =3D cache_id
> > +    * event_idx.code[2:1] =3D op_id
> > +    * event_idx.code[0:0] =3D result_id
> > +    */
> > +
> > +   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
> > +   fdt_event_ctr_map[0] =3D cpu_to_be32(0x00000001);
> > +   fdt_event_ctr_map[1] =3D cpu_to_be32(0x00000001);
> > +   fdt_event_ctr_map[2] =3D cpu_to_be32(cmask | 1 << 0);
> > +
> > +   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
> > +   fdt_event_ctr_map[3] =3D cpu_to_be32(0x00000002);
> > +   fdt_event_ctr_map[4] =3D cpu_to_be32(0x00000002);
> > +   fdt_event_ctr_map[5] =3D cpu_to_be32(cmask | 1 << 2);
> > +
> > +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) =
*/
> > +   fdt_event_ctr_map[6] =3D cpu_to_be32(0x00010019);
> > +   fdt_event_ctr_map[7] =3D cpu_to_be32(0x00010019);
> > +   fdt_event_ctr_map[8] =3D cpu_to_be32(cmask);
> > +
> > +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01)=
 */
> > +   fdt_event_ctr_map[9] =3D cpu_to_be32(0x0001001B);
> > +   fdt_event_ctr_map[10] =3D cpu_to_be32(0x0001001B);
> > +   fdt_event_ctr_map[11] =3D cpu_to_be32(cmask);
> > +
> > +   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) =
*/
> > +   fdt_event_ctr_map[12] =3D cpu_to_be32(0x00010021);
> > +   fdt_event_ctr_map[13] =3D cpu_to_be32(0x00010021);
> > +   fdt_event_ctr_map[14] =3D cpu_to_be32(cmask);
> > +
> > +   /* This a OpenSBI specific DT property documented in OpenSBI docs *=
/
> > +   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
> > +                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
> > +}
> > +
> >  static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
> >  {
> >      if (ctr_idx < 3 || ctr_idx >=3D RV_MAX_MHPMCOUNTERS ||
> > diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> > index 036653627f78..3004ce37b636 100644
> > --- a/target/riscv/pmu.h
> > +++ b/target/riscv/pmu.h
> > @@ -31,5 +31,6 @@ int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
> >  int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> >                                 uint32_t ctr_idx);
> >  int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_i=
dx);
> > +void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *pm=
u_name);
> >  int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
> >                            uint32_t ctr_idx);
> > --
> > 2.25.1
> >
> >
> >

