Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGboo-0003Lj-Vh
	for mharc-qemu-riscv@gnu.org; Wed, 27 Jul 2022 03:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGbon-0003I3-EY
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 03:50:57 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGbok-0004Sp-J0
 for qemu-riscv@nongnu.org; Wed, 27 Jul 2022 03:50:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w7so15452421ply.12
 for <qemu-riscv@nongnu.org>; Wed, 27 Jul 2022 00:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JM/m/a2s+gyQCCbIfhMgrqdxFDbrO0GQzKteRM1YhBM=;
 b=6wRQhAyPl0DKKe9BUZ2YyWRGXQjd1WZoU99XR93hQkbHqU8X4GPki5rEUIZF796USo
 Fnh7J3bET44LiqMvdGAGrdVJsKQ0cGddQin6zTBfKC+lwi4lCiXjGgp21f6L267KNC3Z
 UXwu+ItyPoRWA3w80XNHhfUCUWAL3yUX4knQBuz3Ta5XJ7n1VvkrPFW2Cmj/ua8KBIyH
 DBgmBLHqvEOu011Bjw2awkRccLoV12eyaQMH13H8rSSO6eJTPZ7SRkAJCPuKVFVefCl4
 RD//Zi15vhaeatQnEPbhiiectxSeKG/tDgPYHXKmVuGGVdxkpVgU4pEw+ozSVcUJek21
 wPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JM/m/a2s+gyQCCbIfhMgrqdxFDbrO0GQzKteRM1YhBM=;
 b=gkxPQqgkH7kMiS9NRzSW7P8qcLVLVkLpO2NirjZAKpnXCe2UxGJiZLxjyGX0QcrYjS
 avK+8s5ki70oesJL81TrF913MaUtIk+TdH7qIsQ1zwLw0cythN9p7STeoXlST1lv28g7
 APinty4fBx05YMRA0zqlfrhGx7gIvge7lnEoDAB6swXjMnJWQUm/mBKelkRC1kFFA6fK
 1mNHESe/takm5c4z6Xd8hisbtePEDZQxDdPQEHnHhlUUdsc6rEhP2LdryR4koikJbcNW
 UvqH8N54RtF8+jtS3L796R9kjgRn5z66e1EDFTUnKmN4SChsGegyR+2VejLS/BZr72SA
 qgFA==
X-Gm-Message-State: AJIora9u7FP0ZR8DF8HWt2jgzAzzJa5lvD2ECh/i+yN1gEqDhjwNEdHF
 ocI6ZEg9ZJe9q+Q+OE7m6+rU4cYNx+tPUmh6/PQyUA==
X-Google-Smtp-Source: AGRyM1tJbADdks7ka/9+ZhUMmeLj2inX8QkBlQuwVVzzXcWv2W7aJVQAMNJHLFWdDkn6A5OORM5958VtSzxNgGc5iDk=
X-Received: by 2002:a17:902:b58e:b0:16c:489e:7a0b with SMTP id
 a14-20020a170902b58e00b0016c489e7a0bmr20708598pls.145.1658908253010; Wed, 27
 Jul 2022 00:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220727064913.1041427-1-atishp@rivosinc.com>
 <20220727064913.1041427-5-atishp@rivosinc.com>
 <20220727072726.GA29900@sunil-laptop>
In-Reply-To: <20220727072726.GA29900@sunil-laptop>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 27 Jul 2022 00:50:42 -0700
Message-ID: <CAHBxVyGuum9QukwS=VhvVaBter9mb_6Wzp21A251oGF+gvq7Nw@mail.gmail.com>
Subject: Re: [PATCH v11 4/6] hw/riscv: virt: Add PMU DT node to the device tree
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000022cf7a05e4c4ada3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Jul 2022 07:50:57 -0000

--00000000000022cf7a05e4c4ada3
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 27, 2022 at 12:27 AM Sunil V L <sunilvl@ventanamicro.com> wrote:

> Hi Atish,
>
> On Tue, Jul 26, 2022 at 11:49:11PM -0700, Atish Patra wrote:
> > Qemu virt machine can support few cache events and cycle/instret
> counters.
> > It also supports counter overflow for these events.
> >
> > Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
> > capabilities. There are some dummy nodes added for testing as well.
> >
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  hw/riscv/virt.c    | 28 +++++++++++++++++++++++
> >  target/riscv/cpu.c |  1 +
> >  target/riscv/pmu.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++
> >  target/riscv/pmu.h |  1 +
> >  4 files changed, 87 insertions(+)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index bc424dd2f523..0f3fdb4908b8 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -29,6 +29,7 @@
> >  #include "hw/char/serial.h"
> >  #include "target/riscv/cpu.h"
> >  #include "hw/core/sysbus-fdt.h"
> > +#include "target/riscv/pmu.h"
> >  #include "hw/riscv/riscv_hart.h"
> >  #include "hw/riscv/virt.h"
> >  #include "hw/riscv/boot.h"
> > @@ -714,6 +715,32 @@ static void create_fdt_socket_aplic(RISCVVirtState
> *s,
> >      aplic_phandles[socket] = aplic_s_phandle;
> >  }
> >
> > +static void create_fdt_socket_pmu(RISCVVirtState *s,
> > +                                  int socket, uint32_t *phandle,
> > +                                  uint32_t *intc_phandles)
> > +{
> > +    int cpu;
> > +    char *pmu_name;
> > +    uint32_t *pmu_cells;
> > +    MachineState *mc = MACHINE(s);
> > +    RISCVCPU hart = s->soc[socket].harts[0];
> > +
> > +    pmu_cells = g_new0(uint32_t, s->soc[socket].num_harts * 2);
> > +
> > +    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> > +        pmu_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> > +        pmu_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_PMU_OVF);
> > +    }
> > +
> > +    pmu_name = g_strdup_printf("/soc/pmu");
> > +    qemu_fdt_add_subnode(mc->fdt, pmu_name);
>
> Does this work for you when there are more than 1 sockets? Shouldn't
> this be unique name for each socket?
>
>
Ahh. Sorry. I had fixed that when you last commented. But forgot to include
that fix. Will revise it.


> Thanks
> Sunil
>
> > +    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible",
> "riscv,pmu");
> > +    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
> > +
> > +    g_free(pmu_name);
> > +    g_free(pmu_cells);
> > +}
> > +
> >  static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry
> *memmap,
> >                                 bool is_32_bit, uint32_t *phandle,
> >                                 uint32_t *irq_mmio_phandle,
> > @@ -759,6 +786,7 @@ static void create_fdt_sockets(RISCVVirtState *s,
> const MemMapEntry *memmap,
> >                      &intc_phandles[phandle_pos]);
> >              }
> >          }
> > +        create_fdt_socket_pmu(s, socket, phandle, intc_phandles);
> >      }
> >
> >      if (s->aia_type == VIRT_AIA_TYPE_APLIC_IMSIC) {
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index c1d62b81a725..5c8417a56e5b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -1114,6 +1114,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu,
> char **isa_str, int max_str_len)
> >          ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> >          ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> >          ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> > +        ISA_EDATA_ENTRY(sscofpmf, ext_sscofpmf),
> >          ISA_EDATA_ENTRY(svinval, ext_svinval),
> >          ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> >          ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > index 34096941c0ce..59feb3c243dd 100644
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
> > +/**
> > + * To keep it simple, any event can be mapped to any programmable
> counters in
> > + * QEMU. The generic cycle & instruction count events can also be
> monitored
> > + * using programmable counters. In that case, mcycle & minstret must
> continue
> > + * to provide the correct value as well. Heterogeneous PMU per hart is
> not
> > + * supported yet. Thus, number of counters are same across all harts.
> > + */
> > +void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char
> *pmu_name)
> > +{
> > +    uint32_t fdt_event_ctr_map[20] = {};
> > +    uint32_t cmask;
> > +
> > +    /* All the programmable counters can map to any event */
> > +    cmask = MAKE_32BIT_MASK(3, num_ctrs);
> > +
> > +   /**
> > +    * The event encoding is specified in the SBI specification
> > +    * Event idx is a 20bits wide number encoded as follows:
> > +    * event_idx[19:16] = type
> > +    * event_idx[15:0] = code
> > +    * The code field in cache events are encoded as follows:
> > +    * event_idx.code[15:3] = cache_id
> > +    * event_idx.code[2:1] = op_id
> > +    * event_idx.code[0:0] = result_id
> > +    */
> > +
> > +   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
> > +   fdt_event_ctr_map[0] = cpu_to_be32(0x00000001);
> > +   fdt_event_ctr_map[1] = cpu_to_be32(0x00000001);
> > +   fdt_event_ctr_map[2] = cpu_to_be32(cmask | 1 << 0);
> > +
> > +   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
> > +   fdt_event_ctr_map[3] = cpu_to_be32(0x00000002);
> > +   fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
> > +   fdt_event_ctr_map[5] = cpu_to_be32(cmask | 1 << 2);
> > +
> > +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
> > +   fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
> > +   fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
> > +   fdt_event_ctr_map[8] = cpu_to_be32(cmask);
> > +
> > +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01)
> */
> > +   fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
> > +   fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
> > +   fdt_event_ctr_map[11] = cpu_to_be32(cmask);
> > +
> > +   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
> > +   fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
> > +   fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
> > +   fdt_event_ctr_map[14] = cpu_to_be32(cmask);
> > +
> > +   /* This a OpenSBI specific DT property documented in OpenSBI docs */
> > +   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
> > +                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
> > +}
> > +
> >  static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
> >  {
> >      if (ctr_idx < 3 || ctr_idx >= RV_MAX_MHPMCOUNTERS ||
> > diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> > index 036653627f78..3004ce37b636 100644
> > --- a/target/riscv/pmu.h
> > +++ b/target/riscv/pmu.h
> > @@ -31,5 +31,6 @@ int riscv_pmu_init(RISCVCPU *cpu, int num_counters);
> >  int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> >                                 uint32_t ctr_idx);
> >  int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx
> event_idx);
> > +void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char
> *pmu_name);
> >  int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
> >                            uint32_t ctr_idx);
> > --
> > 2.25.1
> >
> >
>

--00000000000022cf7a05e4c4ada3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 12:27 AM Suni=
l V L &lt;<a href=3D"mailto:sunilvl@ventanamicro.com">sunilvl@ventanamicro.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi Atish,<br>
<br>
On Tue, Jul 26, 2022 at 11:49:11PM -0700, Atish Patra wrote:<br>
&gt; Qemu virt machine can support few cache events and cycle/instret count=
ers.<br>
&gt; It also supports counter overflow for these events.<br>
&gt; <br>
&gt; Add a DT node so that OpenSBI/Linux kernel is aware of the virt machin=
e<br>
&gt; capabilities. There are some dummy nodes added for testing as well.<br=
>
&gt; <br>
&gt; Acked-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atish.patra@wdc.com" =
target=3D"_blank">atish.patra@wdc.com</a>&gt;<br>
&gt; Signed-off-by: Atish Patra &lt;<a href=3D"mailto:atishp@rivosinc.com" =
target=3D"_blank">atishp@rivosinc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/riscv/virt.c=C2=A0 =C2=A0 | 28 +++++++++++++++++++++++<br>
&gt;=C2=A0 target/riscv/cpu.c |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/pmu.c | 57 ++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 target/riscv/pmu.h |=C2=A0 1 +<br>
&gt;=C2=A0 4 files changed, 87 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c<br>
&gt; index bc424dd2f523..0f3fdb4908b8 100644<br>
&gt; --- a/hw/riscv/virt.c<br>
&gt; +++ b/hw/riscv/virt.c<br>
&gt; @@ -29,6 +29,7 @@<br>
&gt;=C2=A0 #include &quot;hw/char/serial.h&quot;<br>
&gt;=C2=A0 #include &quot;target/riscv/cpu.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/core/sysbus-fdt.h&quot;<br>
&gt; +#include &quot;target/riscv/pmu.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/riscv/riscv_hart.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/riscv/virt.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/riscv/boot.h&quot;<br>
&gt; @@ -714,6 +715,32 @@ static void create_fdt_socket_aplic(RISCVVirtStat=
e *s,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 aplic_phandles[socket] =3D aplic_s_phandle;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void create_fdt_socket_pmu(RISCVVirtState *s,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int socket, uint32_t *pha=
ndle,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *intc_phandles)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int cpu;<br>
&gt; +=C2=A0 =C2=A0 char *pmu_name;<br>
&gt; +=C2=A0 =C2=A0 uint32_t *pmu_cells;<br>
&gt; +=C2=A0 =C2=A0 MachineState *mc =3D MACHINE(s);<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU hart =3D s-&gt;soc[socket].harts[0];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pmu_cells =3D g_new0(uint32_t, s-&gt;soc[socket].num_ha=
rts * 2);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (cpu =3D 0; cpu &lt; s-&gt;soc[socket].num_harts; c=
pu++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_cells[cpu * 2 + 0] =3D cpu_to_be32(in=
tc_phandles[cpu]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmu_cells[cpu * 2 + 1] =3D cpu_to_be32(IR=
Q_PMU_OVF);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pmu_name =3D g_strdup_printf(&quot;/soc/pmu&quot;);<br>
&gt; +=C2=A0 =C2=A0 qemu_fdt_add_subnode(mc-&gt;fdt, pmu_name);<br>
<br>
Does this work for you when there are more than 1 sockets? Shouldn&#39;t<br=
>
this be unique name for each socket?<br>
<br></blockquote><div><br></div><div>Ahh. Sorry. I had fixed that when you =
last commented. But forgot to include that fix. Will revise it.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks<br>
Sunil<br>
<br>
&gt; +=C2=A0 =C2=A0 qemu_fdt_setprop_string(mc-&gt;fdt, pmu_name, &quot;com=
patible&quot;, &quot;riscv,pmu&quot;);<br>
&gt; +=C2=A0 =C2=A0 riscv_pmu_generate_fdt_node(mc-&gt;fdt, hart.cfg.pmu_nu=
m, pmu_name);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_free(pmu_name);<br>
&gt; +=C2=A0 =C2=A0 g_free(pmu_cells);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void create_fdt_sockets(RISCVVirtState *s, const MemMapEn=
try *memmap,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_32_bit, uint32_t *p=
handle,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *irq_mmio_phandle,=
<br>
&gt; @@ -759,6 +786,7 @@ static void create_fdt_sockets(RISCVVirtState *s, =
const MemMapEntry *memmap,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;intc_phandles[phandle_pos]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_fdt_socket_pmu(s, socket, phandle,=
 intc_phandles);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (s-&gt;aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSI=
C) {<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index c1d62b81a725..5c8417a56e5b 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -1114,6 +1114,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, =
char **isa_str, int max_str_len)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zve64f, ext_zve64f),=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinx, ext_zhinx),<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(zhinxmin, ext_zhinxm=
in),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(sscofpmf, ext_sscofpmf),<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svinval, ext_svinval=
),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svnapot, ext_svnapot=
),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),=
<br>
&gt; diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c<br>
&gt; index 34096941c0ce..59feb3c243dd 100644<br>
&gt; --- a/target/riscv/pmu.c<br>
&gt; +++ b/target/riscv/pmu.c<br>
&gt; @@ -20,11 +20,68 @@<br>
&gt;=C2=A0 #include &quot;cpu.h&quot;<br>
&gt;=C2=A0 #include &quot;pmu.h&quot;<br>
&gt;=C2=A0 #include &quot;sysemu/cpu-timers.h&quot;<br>
&gt; +#include &quot;sysemu/device_tree.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */<br>
&gt;=C2=A0 #define MAKE_32BIT_MASK(shift, length) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((uint32_t)(~0UL) &gt;&gt; (32 - (l=
ength))) &lt;&lt; (shift))<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * To keep it simple, any event can be mapped to any programmable cou=
nters in<br>
&gt; + * QEMU. The generic cycle &amp; instruction count events can also be=
 monitored<br>
&gt; + * using programmable counters. In that case, mcycle &amp; minstret m=
ust continue<br>
&gt; + * to provide the correct value as well. Heterogeneous PMU per hart i=
s not<br>
&gt; + * supported yet. Thus, number of counters are same across all harts.=
<br>
&gt; + */<br>
&gt; +void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_n=
ame)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint32_t fdt_event_ctr_map[20] =3D {};<br>
&gt; +=C2=A0 =C2=A0 uint32_t cmask;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* All the programmable counters can map to any event *=
/<br>
&gt; +=C2=A0 =C2=A0 cmask =3D MAKE_32BIT_MASK(3, num_ctrs);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/**<br>
&gt; +=C2=A0 =C2=A0 * The event encoding is specified in the SBI specificat=
ion<br>
&gt; +=C2=A0 =C2=A0 * Event idx is a 20bits wide number encoded as follows:=
<br>
&gt; +=C2=A0 =C2=A0 * event_idx[19:16] =3D type<br>
&gt; +=C2=A0 =C2=A0 * event_idx[15:0] =3D code<br>
&gt; +=C2=A0 =C2=A0 * The code field in cache events are encoded as follows=
:<br>
&gt; +=C2=A0 =C2=A0 * event_idx.code[15:3] =3D cache_id<br>
&gt; +=C2=A0 =C2=A0 * event_idx.code[2:1] =3D op_id<br>
&gt; +=C2=A0 =C2=A0 * event_idx.code[0:0] =3D result_id<br>
&gt; +=C2=A0 =C2=A0 */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[0] =3D cpu_to_be32(0x00000001);<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[1] =3D cpu_to_be32(0x00000001);<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[2] =3D cpu_to_be32(cmask | 1 &lt;&lt; =
0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[3] =3D cpu_to_be32(0x00000002);<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[4] =3D cpu_to_be32(0x00000002);<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[5] =3D cpu_to_be32(cmask | 1 &lt;&lt; =
2);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 =
type(0x01) */<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[6] =3D cpu_to_be32(0x00010019);<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[7] =3D cpu_to_be32(0x00010019);<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[8] =3D cpu_to_be32(cmask);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00=
 type(0x01) */<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[9] =3D cpu_to_be32(0x0001001B);<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[10] =3D cpu_to_be32(0x0001001B);<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[11] =3D cpu_to_be32(cmask);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 =
type(0x01) */<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[12] =3D cpu_to_be32(0x00010021);<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[13] =3D cpu_to_be32(0x00010021);<br>
&gt; +=C2=A0 =C2=A0fdt_event_ctr_map[14] =3D cpu_to_be32(cmask);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* This a OpenSBI specific DT property documented in Ope=
nSBI docs */<br>
&gt; +=C2=A0 =C2=A0qemu_fdt_setprop(fdt, pmu_name, &quot;riscv,event-to-mhp=
mcounters&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 fdt_event_ctr_map, sizeof(fdt_event_ctr_map));<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_=
idx)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ctr_idx &lt; 3 || ctr_idx &gt;=3D RV_MAX_MHPMC=
OUNTERS ||<br>
&gt; diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h<br>
&gt; index 036653627f78..3004ce37b636 100644<br>
&gt; --- a/target/riscv/pmu.h<br>
&gt; +++ b/target/riscv/pmu.h<br>
&gt; @@ -31,5 +31,6 @@ int riscv_pmu_init(RISCVCPU *cpu, int num_counters);=
<br>
&gt;=C2=A0 int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t valu=
e,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ctr_idx);<br>
&gt;=C2=A0 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx e=
vent_idx);<br>
&gt; +void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *p=
mu_name);<br>
&gt;=C2=A0 int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t ctr_idx);<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--00000000000022cf7a05e4c4ada3--

