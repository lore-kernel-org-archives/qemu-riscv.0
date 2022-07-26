Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oGSSb-0001g0-H9
	for mharc-qemu-riscv@gnu.org; Tue, 26 Jul 2022 17:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oGSSZ-0001fb-CP
 for qemu-riscv@nongnu.org; Tue, 26 Jul 2022 17:51:23 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:45902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1oGSSX-00015L-6v
 for qemu-riscv@nongnu.org; Tue, 26 Jul 2022 17:51:23 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-31bf3656517so156595057b3.12
 for <qemu-riscv@nongnu.org>; Tue, 26 Jul 2022 14:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YydpgrxDW5FnuWQpSXFhFRvKWyeb+vea0xnBM5Q2B9k=;
 b=oedFiu8fkFrH0o9wCxLFFZ6fcLQuAUNRfPzvZtdxJsOkexCLv+ggZWAsgYlWw1r/Ms
 nzXuOaO7H8gUsJgncXxOvSC73sn1BGn7PnlrAb0Ghm16IiEkWLJo4K4xjbUM/mL+bjDH
 8CrOSxLiGDj1iV/PzlYnKj9dB0Vd7C9EulTOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YydpgrxDW5FnuWQpSXFhFRvKWyeb+vea0xnBM5Q2B9k=;
 b=WSakbHoFczXFKLviQm1upBpx58vmO3Ht70sCZc+4U6uSezXOs+Q2RGlFTjz2qZ1GGe
 EdSrEJWnPGQWcYS1D+I26c/yk5A+sdyYGIyKKJ/ptQCBqSVKrhdeLitZRKe0/1NeTvmQ
 2pBc93ZpQrMBgLXOlq1+EMsIQC/v73wSbA1bPutWXDLsiPge7CRBMGAhj3/nlTENLxri
 XV6S6sEGfI7q2PaMkfJYhZ3rNQE+UbcjU4ZFbDizPqTA+3kCDvWWkXVPHft1yWJYsBcT
 UR2vEVun9t1wnuuzOT9WOv/pf4svXz3SJKB9MzZgUOS3etcxk1jDNtwskotv2nNLjcY8
 GuUw==
X-Gm-Message-State: AJIora/1NhgVIHf0/oUQf08MvdEFAP9ShzbIMNSsTy9unsr0O95mP3gc
 1VuBVf3nanLWuTnPYqHgIMu5iai2Ni9GAGjaEa31
X-Google-Smtp-Source: AGRyM1tpgv4ZXF7lapS4/JdDieY93f+5T0eCPugN6KEcT7VED3oZPGclbzsAe22eUg0K0VVJft54DQbrrI0OCN0hqL4=
X-Received: by 2002:a0d:d753:0:b0:31f:4e9f:a9ff with SMTP id
 z80-20020a0dd753000000b0031f4e9fa9ffmr3825554ywd.194.1658872278973; Tue, 26
 Jul 2022 14:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-12-atishp@rivosinc.com>
 <4485024.MHq7AAxBmi@diego>
In-Reply-To: <4485024.MHq7AAxBmi@diego>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 26 Jul 2022 14:51:08 -0700
Message-ID: <CAOnJCUJ=3X-nNhfRW8LDiLRLnKrb2WyCT=pVYevDttwGcyauuw@mail.gmail.com>
Subject: Re: [PATCH v10 11/12] hw/riscv: virt: Add PMU DT node to the device
 tree
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=atishp@atishpatra.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 26 Jul 2022 21:51:23 -0000

On Thu, Jul 14, 2022 at 3:27 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi Atish,
>
> Am Dienstag, 21. Juni 2022, 01:16:01 CEST schrieb Atish Patra:
> > Qemu virt machine can support few cache events and cycle/instret counte=
rs.
> > It also supports counter overflow for these events.
> >
> > Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
> > capabilities. There are some dummy nodes added for testing as well.
> >
> > Acked-by: Alistair Francis <alistair.francis@wdc.com>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
>
> > +static void create_fdt_socket_pmu(RISCVVirtState *s,
> > +                                  int socket, uint32_t *phandle,
> > +                                  uint32_t *intc_phandles)
> > +{
> > +    int cpu;
> > +    char *pmu_name;
> > +    uint32_t *pmu_cells;
> > +    MachineState *mc =3D MACHINE(s);
> > +    RISCVCPU hart =3D s->soc[socket].harts[0];
> > +
> > +    pmu_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 2);
> > +
> > +    for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
> > +        pmu_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> > +        pmu_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_PMU_OVF);
> > +    }
> > +
> > +    pmu_name =3D g_strdup_printf("/soc/pmu");
> > +    qemu_fdt_add_subnode(mc->fdt, pmu_name);
> > +    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pm=
u");
>
> Where is the binding document for this?
>
> As the comment below states the "riscv,event-to-mhpmcounters" property
> is opensbi-specific and gets removed in the opensbi stage, but that still
> leaves the pmu node in it and from the version I found, Rob wasn't overly
> happy with the compatible [0]. Did this get addressed?
>

This is OpenSBI specific binding.
https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.=
md

Linux kernel doesn't use binding anymore. The earlier version patches
relied on the DT binding.
However, based on the feedback it was removed.

OpenSBI should delete the node and the interrupt-extended property
deletion is necessary at this point.

>
> Thanks
> Heiko
>
>
> [0] https://lore.kernel.org/all/YXhPqfpXh1VZN07T@robh.at.kernel.org/
>
>
>
> > +    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
> > +
> > +    g_free(pmu_name);
> > +    g_free(pmu_cells);
> > +}
> > +
> >  static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *m=
emmap,
> >                                 bool is_32_bit, uint32_t *phandle,
> >                                 uint32_t *irq_mmio_phandle,
> > @@ -759,6 +786,7 @@ static void create_fdt_sockets(RISCVVirtState *s, c=
onst MemMapEntry *memmap,
> >                      &intc_phandles[phandle_pos]);
> >              }
> >          }
> > +        create_fdt_socket_pmu(s, socket, phandle, intc_phandles);
> >      }
> >
> >      if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 7d9e2aca12a9..69bbd9fff4e1 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -1110,6 +1110,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, c=
har **isa_str, int max_str_len)
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
> > +   /**
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
> >
>
>
>
>
>


--=20
Regards,
Atish

