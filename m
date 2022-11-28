Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozkwv-0005MD-IU
	for mharc-qemu-riscv@gnu.org; Mon, 28 Nov 2022 15:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ozkwu-0005Lq-Ko
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 15:41:56 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ozkws-00054z-7M
 for qemu-riscv@nongnu.org; Mon, 28 Nov 2022 15:41:56 -0500
Received: by mail-pl1-x634.google.com with SMTP id y17so3461870plp.3
 for <qemu-riscv@nongnu.org>; Mon, 28 Nov 2022 12:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w5BY0l10pya9dvxGsC2CPjrdUMMwrIq28LZxOQ8EW1c=;
 b=hKuc2SV9iinR85vLQ+5Vgg9CK/+HYoUjvXRbUVdNDdcmrNLDZSahRgN9dwEzQg4WpO
 pLKuG33aEgo1ySBcjsExE49FhFHfnZQcUak/fvH4ytzfS6sV4wl4Xvi1VQ4PjVrlldpQ
 tJHyLr3yB7O5gxHW2xFNwGmHl0Fobaw4XefjkW7kL5rvsxtKIHDM7rQB8gU7mqfokPKo
 0+Bw4YKF4GMbBbkRYzGqn+w59mbI1P72WieKpRyAvcmGs4bjS5mZ7bOIgYhr3vcyTMRY
 /r6oiuoUOr4H2iYD+1X7B22xY8GRuqnxCGBq98k5fFi60C8F1mNmhjmumH0NnPwNlEHl
 06Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w5BY0l10pya9dvxGsC2CPjrdUMMwrIq28LZxOQ8EW1c=;
 b=NTD7Ylaq7PZmJuVSqWgIOTl+tK38JJ0nAKNOtAmiCbMjCNgPxAveiy6G4X4efq8x+B
 6fp7jRXqglmKiedYeQqNIiWlPpVzSAul/VTsR2wGS5bwT0CUG15adE2JKwkG+qnOXqXf
 T/Oz7aXcet8Mb9m72CyOptaSka3KHCjJKJ0pFpXeq2VJN78sjcqJl7l4OW2RKWiTDgLW
 uwbE9SC96wKYCK4VOQvb4W6O1Ahn/nESMB3qegbEqZOtZ+YEMPRyzNZ/W2CVZTME0p4y
 E26JELRWHw0nkz2uwGo6QZqJmVaAsnE5DtUu890PtelJzNFQvtFYu7+wzbAIceSkZ4bz
 68Qg==
X-Gm-Message-State: ANoB5pmjfpLiNcRsea0BK0RGQb6opgAG+4ClgkFY0VIDGiZUzt2/Gk0U
 ZV1ViYc0CKzavPgIqzYpe25SCEBRjWRP4zMpe9m0AQ==
X-Google-Smtp-Source: AA0mqf6gKckGtjA9NMbuve5nVzWRaUi5PGU7+PNNmAysR7oM8TCACATN3AYNiP9+CgM0qtnPiDps51FnazKszNFoqoE=
X-Received: by 2002:a17:902:b48f:b0:189:8b6:95f6 with SMTP id
 y15-20020a170902b48f00b0018908b695f6mr33982413plr.71.1669668112404; Mon, 28
 Nov 2022 12:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20220824221701.41932-1-atishp@rivosinc.com>
 <20220824221701.41932-5-atishp@rivosinc.com>
 <Y39urpX82uO85AAb@wendy>
 <CAHBxVyFhrkdhWpc4xB-_a4c5GnDu=d01-bk2zM2nCraeq_Xr_A@mail.gmail.com>
 <a3c7174d-6d33-5a34-0cd5-8ac340c052c3@microchip.com>
In-Reply-To: <a3c7174d-6d33-5a34-0cd5-8ac340c052c3@microchip.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 28 Nov 2022 12:41:41 -0800
Message-ID: <CAHBxVyGVigqBLLS9vqas+uq=Joyr2F6ir0zqtg+0y2GaTCyX-A@mail.gmail.com>
Subject: Re: [PATCH v14 4/5] hw/riscv: virt: Add PMU DT node to the device tree
To: Conor.Dooley@microchip.com
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com, 
 palmer@dabbelt.com, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Mon, 28 Nov 2022 20:41:56 -0000

On Mon, Nov 28, 2022 at 12:38 PM <Conor.Dooley@microchip.com> wrote:
>
> On 28/11/2022 20:16, Atish Kumar Patra wrote:
> > On Thu, Nov 24, 2022 at 5:17 AM Conor Dooley <conor.dooley@microchip.co=
m> wrote:
> >>
> >> On Wed, Aug 24, 2022 at 03:17:00PM -0700, Atish Patra wrote:
> >>> Qemu virt machine can support few cache events and cycle/instret coun=
ters.
> >>> It also supports counter overflow for these events.
> >>>
> >>> Add a DT node so that OpenSBI/Linux kernel is aware of the virt machi=
ne
> >>> capabilities. There are some dummy nodes added for testing as well.
> >>
> >> Hey Atish!
> >>
> >> I was fiddling with dumping the virt machine dtb again today to check
> >> some dt-binding changes I was making for the isa string would play
> >> nicely with the virt machine & I noticed that this patch has introduce=
d
> >> a new validation failure:
> >>
> >> ./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=3Dqemu.dt=
b
> >>
> >> dt-validate -p ../linux/Documentation/devicetree/bindings/processed-sc=
hema.json qemu.dtb
> >> /home/conor/stuff/qemu/qemu.dtb: soc: pmu: {'riscv,event-to-mhpmcounte=
rs': [[1, 1, 524281, 2, 2, 524284, 65561, 65561, 524280, 65563, 65563, 5242=
80, 65569, 65569, 524280, 0, 0, 0, 0, 0]], 'compatible': ['riscv,pmu']} sho=
uld not be valid under {'type': 'object'}
> >>         From schema: /home/conor/.local/lib/python3.10/site-packages/d=
tschema/schemas/simple-bus.yaml
> >>
> >> I assume this is the aforementioned "dummy" node & you have no intenti=
on
> >> of creating a binding for this?
> >>
> >
> > It is a dummy node from Linux kernel perspective. OpenSbi use this
> > node to figure out the hpmcounter mappings.
>
> Aye, but should it not have a binding anyway, since they're not
> meant to be linux specific?
>
It is documented in OpenSBI.
https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.=
md

Are you suggesting that any non-Linux specific DT nodes should be part
of Linux DT binding as well ?

> >>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> >>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >>> ---
> >>>  hw/riscv/virt.c    | 16 +++++++++++++
> >>>  target/riscv/pmu.c | 57 ++++++++++++++++++++++++++++++++++++++++++++=
++
> >>>  target/riscv/pmu.h |  1 +
> >>>  3 files changed, 74 insertions(+)
> >>>
> >>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> >>> index ff8c0df5cd47..befa9d2c26ac 100644
> >>> --- a/hw/riscv/virt.c
> >>> +++ b/hw/riscv/virt.c
> >>> @@ -30,6 +30,7 @@
> >>>  #include "hw/char/serial.h"
> >>>  #include "target/riscv/cpu.h"
> >>>  #include "hw/core/sysbus-fdt.h"
> >>> +#include "target/riscv/pmu.h"
> >>>  #include "hw/riscv/riscv_hart.h"
> >>>  #include "hw/riscv/virt.h"
> >>>  #include "hw/riscv/boot.h"
> >>> @@ -708,6 +709,20 @@ static void create_fdt_socket_aplic(RISCVVirtSta=
te *s,
> >>>      aplic_phandles[socket] =3D aplic_s_phandle;
> >>>  }
> >>>
> >>> +static void create_fdt_pmu(RISCVVirtState *s)
> >>> +{
> >>> +    char *pmu_name;
> >>> +    MachineState *mc =3D MACHINE(s);
> >>> +    RISCVCPU hart =3D s->soc[0].harts[0];
> >>> +
> >>> +    pmu_name =3D g_strdup_printf("/soc/pmu");
> >>> +    qemu_fdt_add_subnode(mc->fdt, pmu_name);
> >>> +    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,=
pmu");
> >>> +    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name)=
;
> >>> +
> >>> +    g_free(pmu_name);
> >>> +}
> >>> +
> >>>  static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry =
*memmap,
> >>>                                 bool is_32_bit, uint32_t *phandle,
> >>>                                 uint32_t *irq_mmio_phandle,
> >>> @@ -1036,6 +1051,7 @@ static void create_fdt(RISCVVirtState *s, const=
 MemMapEntry *memmap,
> >>>
> >>>      create_fdt_flash(s, memmap);
> >>>      create_fdt_fw_cfg(s, memmap);
> >>> +    create_fdt_pmu(s);
> >>>
> >>>  update_bootargs:
> >>>      if (cmdline && *cmdline) {
> >>> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> >>> index a5f504e53c88..b8e56d2b7b8e 100644
> >>> --- a/target/riscv/pmu.c
> >>> +++ b/target/riscv/pmu.c
> >>> @@ -20,11 +20,68 @@
> >>>  #include "cpu.h"
> >>>  #include "pmu.h"
> >>>  #include "sysemu/cpu-timers.h"
> >>> +#include "sysemu/device_tree.h"
> >>>
> >>>  #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
> >>>  #define MAKE_32BIT_MASK(shift, length) \
> >>>          (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
> >>>
> >>> +/*
> >>> + * To keep it simple, any event can be mapped to any programmable co=
unters in
> >>> + * QEMU. The generic cycle & instruction count events can also be mo=
nitored
> >>> + * using programmable counters. In that case, mcycle & minstret must=
 continue
> >>> + * to provide the correct value as well. Heterogeneous PMU per hart =
is not
> >>> + * supported yet. Thus, number of counters are same across all harts=
.
> >>> + */
> >>> +void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_=
name)
> >>> +{
> >>> +    uint32_t fdt_event_ctr_map[20] =3D {};
> >>> +    uint32_t cmask;
> >>> +
> >>> +    /* All the programmable counters can map to any event */
> >>> +    cmask =3D MAKE_32BIT_MASK(3, num_ctrs);
> >>> +
> >>> +   /*
> >>> +    * The event encoding is specified in the SBI specification
> >>> +    * Event idx is a 20bits wide number encoded as follows:
> >>> +    * event_idx[19:16] =3D type
> >>> +    * event_idx[15:0] =3D code
> >>> +    * The code field in cache events are encoded as follows:
> >>> +    * event_idx.code[15:3] =3D cache_id
> >>> +    * event_idx.code[2:1] =3D op_id
> >>> +    * event_idx.code[0:0] =3D result_id
> >>> +    */
> >>> +
> >>> +   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
> >>> +   fdt_event_ctr_map[0] =3D cpu_to_be32(0x00000001);
> >>> +   fdt_event_ctr_map[1] =3D cpu_to_be32(0x00000001);
> >>> +   fdt_event_ctr_map[2] =3D cpu_to_be32(cmask | 1 << 0);
> >>> +
> >>> +   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
> >>> +   fdt_event_ctr_map[3] =3D cpu_to_be32(0x00000002);
> >>> +   fdt_event_ctr_map[4] =3D cpu_to_be32(0x00000002);
> >>> +   fdt_event_ctr_map[5] =3D cpu_to_be32(cmask | 1 << 2);
> >>> +
> >>> +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01=
) */
> >>> +   fdt_event_ctr_map[6] =3D cpu_to_be32(0x00010019);
> >>> +   fdt_event_ctr_map[7] =3D cpu_to_be32(0x00010019);
> >>> +   fdt_event_ctr_map[8] =3D cpu_to_be32(cmask);
> >>> +
> >>> +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x0=
1) */
> >>> +   fdt_event_ctr_map[9] =3D cpu_to_be32(0x0001001B);
> >>> +   fdt_event_ctr_map[10] =3D cpu_to_be32(0x0001001B);
> >>> +   fdt_event_ctr_map[11] =3D cpu_to_be32(cmask);
> >>> +
> >>> +   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01=
) */
> >>> +   fdt_event_ctr_map[12] =3D cpu_to_be32(0x00010021);
> >>> +   fdt_event_ctr_map[13] =3D cpu_to_be32(0x00010021);
> >>> +   fdt_event_ctr_map[14] =3D cpu_to_be32(cmask);
> >>> +
> >>> +   /* This a OpenSBI specific DT property documented in OpenSBI docs=
 */
> >>> +   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
> >>> +                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
> >>> +}
> >>> +
> >>>  static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
> >>>  {
> >>>      if (ctr_idx < 3 || ctr_idx >=3D RV_MAX_MHPMCOUNTERS ||
> >>> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> >>> index 036653627f78..3004ce37b636 100644
> >>> --- a/target/riscv/pmu.h
> >>> +++ b/target/riscv/pmu.h
> >>> @@ -31,5 +31,6 @@ int riscv_pmu_init(RISCVCPU *cpu, int num_counters)=
;
> >>>  int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
> >>>                                 uint32_t ctr_idx);
> >>>  int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event=
_idx);
> >>> +void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *=
pmu_name);
> >>>  int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
> >>>                            uint32_t ctr_idx);
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>>
> >

