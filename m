Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104E5C7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 06:51:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8bNz-0001nW-Sq; Mon, 12 Jun 2023 02:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q8bNm-0001kG-OW
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 02:50:34 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yongxuan.wang@sifive.com>)
 id 1q8bNh-0005pg-Vr
 for qemu-riscv@nongnu.org; Mon, 12 Jun 2023 02:50:30 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-55b619e0ed1so1605680eaf.3
 for <qemu-riscv@nongnu.org>; Sun, 11 Jun 2023 23:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1686552624; x=1689144624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMSMqjawoxkhgO7DYF6GRqllwBgiWKlY4M8ZFJUg0Iw=;
 b=SR9SjMvBaEFqHGKegB118PXKPvS80ccoDupmw28OQcYP8H8XqOgpbXCP9T1rj5/28i
 Lzo8e0fGJWI3/e1RvCC310apAMzMimDag/qI5KSCqj3byxFmPOov97+Db5PmfmdilVk2
 sTZUcyDqdnTFrpSXIAwMdGO8hksQHyJwjcmYuFzXuhzbLn2WYSKo2EIMrSKGzsvvePAa
 QTqLsCcqx170RNJOuboJuM1ffVdGDA9OY9B4gtyAmf5h1dm02CMT11lZCHSRy5gNhXrT
 pcQFbyeLBi1AQ2yogqIdRlhelq92H12NouxuKVLTLETvFGjiTvHfJvTy6TBeqCoSM/wL
 8Q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686552624; x=1689144624;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aMSMqjawoxkhgO7DYF6GRqllwBgiWKlY4M8ZFJUg0Iw=;
 b=eQxNs7fvH9A+Ehe3bhylp7DV9DYOQadDHlO+0slfvb+BsIGgs3GgkOVTRAv/64/ZTS
 1OEU1WeqDl730cFI3+KlFWT4dLT/Y6XfSSFJcpnm33TXKGc+5cc9mRmK9QrC8s8bdhxm
 0AeR4NgAuOExmIiw3wLaSyfuBbs78EmQC952Zvfx/zIMIbu4HHuC+/A1+/ehPioI3pzW
 6kstrmLdcj4n5H6nbfCAlArvb+FYP99j6de8GMzVfJ5iZS7C5fy8/6Qg5PyyhZs6Cp0J
 9oFG09/EdWUXo2tG15PanakQZ5DGH3l237EMUAB0d5am7Y0QgcjfjFLdHolBKs6CRcvq
 CCWQ==
X-Gm-Message-State: AC+VfDweiRb4qYFNRyxXsW5p1oYF4xD132SZJRx7br/sejY99JOEMjkG
 6Js9mY/Ca/jYi5gIz2fhYdYuQCw3Nwp2JO4SjzhzeA==
X-Google-Smtp-Source: ACHHUZ5vVI76HqiGGUGSxgjkfC6EJyfQdkuWEuJSWnfYtaZKV/H/R+d4nV2b/keOBX/lmlBTt/bC+JNsbg7xlv1tmnI=
X-Received: by 2002:a4a:dc10:0:b0:558:b4cb:b18a with SMTP id
 p16-20020a4adc10000000b00558b4cbb18amr4846405oov.6.1686552624381; Sun, 11 Jun
 2023 23:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230526062509.31682-1-yongxuan.wang@sifive.com>
 <20230526062509.31682-3-yongxuan.wang@sifive.com>
 <ed0a1ceb-de35-4085-9e5f-e2bf73374ebc@ventanamicro.com>
In-Reply-To: <ed0a1ceb-de35-4085-9e5f-e2bf73374ebc@ventanamicro.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 12 Jun 2023 14:50:15 +0800
Message-ID: <CAMWQL2gc4GEmEtHdhu64wYT9Smx88k6gQyLYu=cx5fBrQ0X=JA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] target/riscv: support the AIA device emulation
 with KVM enabled
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com, 
 anup@brainfault.org, atishp@atishpatra.org, vincent.chen@sifive.com, 
 greentime.hu@sifive.com, frank.chang@sifive.com, jim.shu@sifive.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=yongxuan.wang@sifive.com; helo=mail-oo1-xc2b.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Daniel,

I think this checking can be removed too. Would you send a patch to
fix it? Or I can remove it in this patch.

Regards,
Yong-Xuan

On Tue, Jun 6, 2023 at 2:45=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 5/26/23 03:25, Yong-Xuan Wang wrote:
> > Remove M mode AIA devices when using KVM acceleration
> >
> > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > Reviewed-by: Jim Shu <jim.shu@sifive.com>
> > ---
> >   hw/riscv/virt.c | 199 +++++++++++++++++++++++++----------------------=
-
> >   1 file changed, 105 insertions(+), 94 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 4e3efbee16..18b94888ab 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -531,52 +531,54 @@ static void create_fdt_imsic(RISCVVirtState *s, c=
onst MemMapEntry *memmap,
> >       imsic_cells =3D g_new0(uint32_t, ms->smp.cpus * 2);
> >       imsic_regs =3D g_new0(uint32_t, socket_count * 4);
> >
> > -    /* M-level IMSIC node */
> > -    for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
> > -        imsic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> > -        imsic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_EXT);
> > -    }
> > -    imsic_max_hart_per_socket =3D 0;
> > -    for (socket =3D 0; socket < socket_count; socket++) {
> > -        imsic_addr =3D memmap[VIRT_IMSIC_M].base +
> > -                     socket * VIRT_IMSIC_GROUP_MAX_SIZE;
> > -        imsic_size =3D IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
> > -        imsic_regs[socket * 4 + 0] =3D 0;
> > -        imsic_regs[socket * 4 + 1] =3D cpu_to_be32(imsic_addr);
> > -        imsic_regs[socket * 4 + 2] =3D 0;
> > -        imsic_regs[socket * 4 + 3] =3D cpu_to_be32(imsic_size);
> > -        if (imsic_max_hart_per_socket < s->soc[socket].num_harts) {
> > -            imsic_max_hart_per_socket =3D s->soc[socket].num_harts;
> > +    if (!kvm_enabled()) {
> > +        /* M-level IMSIC node */
> > +        for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
> > +            imsic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu=
]);
> > +            imsic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_EXT);
> >           }
> > -    }
> > -    imsic_name =3D g_strdup_printf("/soc/imsics@%lx",
> > -        (unsigned long)memmap[VIRT_IMSIC_M].base);
> > -    qemu_fdt_add_subnode(ms->fdt, imsic_name);
> > -    qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
> > -        "riscv,imsics");
> > -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
> > -        FDT_IMSIC_INT_CELLS);
> > -    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
> > -        NULL, 0);
> > -    qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
> > -        NULL, 0);
> > -    qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
> > -        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
> > -    qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
> > -        socket_count * sizeof(uint32_t) * 4);
> > -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
> > -        VIRT_IRQCHIP_NUM_MSIS);
> > -    if (socket_count > 1) {
> > -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-index-b=
its",
> > -            imsic_num_bits(imsic_max_hart_per_socket));
> > -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-=
bits",
> > -            imsic_num_bits(socket_count));
> > -        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-index-=
shift",
> > -            IMSIC_MMIO_GROUP_MIN_SHIFT);
> > -    }
> > -    qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_m_phand=
le);
> > +        imsic_max_hart_per_socket =3D 0;
> > +        for (socket =3D 0; socket < socket_count; socket++) {
> > +            imsic_addr =3D memmap[VIRT_IMSIC_M].base +
> > +                         socket * VIRT_IMSIC_GROUP_MAX_SIZE;
> > +            imsic_size =3D IMSIC_HART_SIZE(0) * s->soc[socket].num_har=
ts;
> > +            imsic_regs[socket * 4 + 0] =3D 0;
> > +            imsic_regs[socket * 4 + 1] =3D cpu_to_be32(imsic_addr);
> > +            imsic_regs[socket * 4 + 2] =3D 0;
> > +            imsic_regs[socket * 4 + 3] =3D cpu_to_be32(imsic_size);
> > +            if (imsic_max_hart_per_socket < s->soc[socket].num_harts) =
{
> > +                imsic_max_hart_per_socket =3D s->soc[socket].num_harts=
;
> > +            }
> > +        }
> > +        imsic_name =3D g_strdup_printf("/soc/imsics@%lx",
> > +            (unsigned long)memmap[VIRT_IMSIC_M].base);
> > +        qemu_fdt_add_subnode(ms->fdt, imsic_name);
> > +        qemu_fdt_setprop_string(ms->fdt, imsic_name, "compatible",
> > +            "riscv,imsics");
> > +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "#interrupt-cells",
> > +            FDT_IMSIC_INT_CELLS);
> > +        qemu_fdt_setprop(ms->fdt, imsic_name, "interrupt-controller",
> > +            NULL, 0);
> > +        qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
> > +            NULL, 0);
> > +        qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
> > +            imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
> > +        qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
> > +            socket_count * sizeof(uint32_t) * 4);
> > +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
> > +            VIRT_IRQCHIP_NUM_MSIS);
> > +        if (socket_count > 1) {
> > +            qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,hart-ind=
ex-bits",
> > +                imsic_num_bits(imsic_max_hart_per_socket));
> > +            qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,group-in=
dex-bits",
> > +                imsic_num_bits(socket_count));
> > +            qemu_fdt_setprop_cell(ms->fdt, imsic_name,
> > +                "riscv,group-index-shift", IMSIC_MMIO_GROUP_MIN_SHIFT)=
;
> > +        }
> > +        qemu_fdt_setprop_cell(ms->fdt, imsic_name, "phandle", *msi_m_p=
handle);
> >
> > -    g_free(imsic_name);
> > +        g_free(imsic_name);
> > +    }
> >
> >       /* S-level IMSIC node */
> >       for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
> > @@ -653,37 +655,40 @@ static void create_fdt_socket_aplic(RISCVVirtStat=
e *s,
> >       aplic_s_phandle =3D (*phandle)++;
> >       aplic_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 2);
> >
> > -    /* M-level APLIC node */
> > -    for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
> > -        aplic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> > -        aplic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_EXT);
> > -    }
> > -    aplic_addr =3D memmap[VIRT_APLIC_M].base +
> > -                 (memmap[VIRT_APLIC_M].size * socket);
> > -    aplic_name =3D g_strdup_printf("/soc/aplic@%lx", aplic_addr);
> > -    qemu_fdt_add_subnode(ms->fdt, aplic_name);
> > -    qemu_fdt_setprop_string(ms->fdt, aplic_name, "compatible", "riscv,=
aplic");
> > -    qemu_fdt_setprop_cell(ms->fdt, aplic_name,
> > -        "#interrupt-cells", FDT_APLIC_INT_CELLS);
> > -    qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", NULL=
, 0);
> > -    if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC) {
> > -        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended",
> > -            aplic_cells, s->soc[socket].num_harts * sizeof(uint32_t) *=
 2);
> > -    } else {
> > -        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
> > -            msi_m_phandle);
> > +    if (!kvm_enabled()) {
> > +        /* M-level APLIC node */
> > +        for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
> > +            aplic_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu=
]);
> > +            aplic_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_M_EXT);
> > +        }
> > +        aplic_addr =3D memmap[VIRT_APLIC_M].base +
> > +                     (memmap[VIRT_APLIC_M].size * socket);
> > +        aplic_name =3D g_strdup_printf("/soc/aplic@%lx", aplic_addr);
> > +        qemu_fdt_add_subnode(ms->fdt, aplic_name);
> > +        qemu_fdt_setprop_string(ms->fdt, aplic_name,
> > +            "compatible", "riscv,aplic");
> > +        qemu_fdt_setprop_cell(ms->fdt, aplic_name,
> > +            "#interrupt-cells", FDT_APLIC_INT_CELLS);
> > +        qemu_fdt_setprop(ms->fdt, aplic_name, "interrupt-controller", =
NULL, 0);
> > +        if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC) {
> > +            qemu_fdt_setprop(ms->fdt, aplic_name, "interrupts-extended=
",
> > +                aplic_cells, s->soc[socket].num_harts * sizeof(uint32_=
t) * 2);
> > +        } else {
> > +            qemu_fdt_setprop_cell(ms->fdt, aplic_name, "msi-parent",
> > +                msi_m_phandle);
> > +        }
> > +        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
> > +            0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
> > +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources"=
,
> > +            VIRT_IRQCHIP_NUM_SOURCES);
> > +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
> > +            aplic_s_phandle);
> > +        qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
> > +            aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
> > +        riscv_socket_fdt_write_id(ms, aplic_name, socket);
> > +        qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_=
phandle);
> > +        g_free(aplic_name);
> >       }
> > -    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "reg",
> > -        0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_M].size);
> > -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,num-sources",
> > -        VIRT_IRQCHIP_NUM_SOURCES);
> > -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "riscv,children",
> > -        aplic_s_phandle);
> > -    qemu_fdt_setprop_cells(ms->fdt, aplic_name, "riscv,delegate",
> > -        aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
> > -    riscv_socket_fdt_write_id(ms, aplic_name, socket);
> > -    qemu_fdt_setprop_cell(ms->fdt, aplic_name, "phandle", aplic_m_phan=
dle);
> > -    g_free(aplic_name);
> >
> >       /* S-level APLIC node */
> >       for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
> > @@ -1162,16 +1167,20 @@ static DeviceState *virt_create_aia(RISCVVirtAI=
AType aia_type, int aia_guests,
> >       int i;
> >       hwaddr addr;
> >       uint32_t guest_bits;
> > -    DeviceState *aplic_m;
> > +    DeviceState *aplic_s =3D NULL;
> > +    DeviceState *aplic_m =3D NULL;
> >       bool msimode =3D (aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSIC) ? tr=
ue : false;
> >
> >       if (msimode) {
> > -        /* Per-socket M-level IMSICs */
> > -        addr =3D memmap[VIRT_IMSIC_M].base + socket * VIRT_IMSIC_GROUP=
_MAX_SIZE;
> > -        for (i =3D 0; i < hart_count; i++) {
> > -            riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
> > -                               base_hartid + i, true, 1,
> > -                               VIRT_IRQCHIP_NUM_MSIS);
> > +        if (!kvm_enabled()) {
> > +            /* Per-socket M-level IMSICs */
> > +            addr =3D memmap[VIRT_IMSIC_M].base +
> > +                   socket * VIRT_IMSIC_GROUP_MAX_SIZE;
> > +            for (i =3D 0; i < hart_count; i++) {
> > +                riscv_imsic_create(addr + i * IMSIC_HART_SIZE(0),
> > +                        base_hartid + i, true, 1,
> > +                        VIRT_IRQCHIP_NUM_MSIS);
> > +            }
> >           }
> >
> >           /* Per-socket S-level IMSICs */
> > @@ -1184,19 +1193,21 @@ static DeviceState *virt_create_aia(RISCVVirtAI=
AType aia_type, int aia_guests,
> >           }
> >       }
> >
> > -    /* Per-socket M-level APLIC */
> > -    aplic_m =3D riscv_aplic_create(
> > -        memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC_M].size=
,
> > -        memmap[VIRT_APLIC_M].size,
> > -        (msimode) ? 0 : base_hartid,
> > -        (msimode) ? 0 : hart_count,
> > -        VIRT_IRQCHIP_NUM_SOURCES,
> > -        VIRT_IRQCHIP_NUM_PRIO_BITS,
> > -        msimode, true, NULL);
> > -
> > -    if (aplic_m) {
> > +    if (!kvm_enabled()) {
> > +        /* Per-socket M-level APLIC */
> > +        aplic_m =3D riscv_aplic_create(
> > +                memmap[VIRT_APLIC_M].base + socket * memmap[VIRT_APLIC=
_M].size,
> > +                memmap[VIRT_APLIC_M].size,
> > +                (msimode) ? 0 : base_hartid,
> > +                (msimode) ? 0 : hart_count,
> > +                VIRT_IRQCHIP_NUM_SOURCES,
> > +                VIRT_IRQCHIP_NUM_PRIO_BITS,
> > +                msimode, true, NULL);
> > +    }
> > +
> > +    if (aplic_m || kvm_enabled()) {
>
> I am struggling to understand why we're checking for "aplic_m" here given=
 that
> riscv_aplic_create() will either returning something not NULL or error ou=
t via
> &error_fatal.
>
> This behavior predates this patch though.
>
>
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>
> >           /* Per-socket S-level APLIC */
> > -        riscv_aplic_create(
> > +        aplic_s =3D riscv_aplic_create(
> >               memmap[VIRT_APLIC_S].base + socket * memmap[VIRT_APLIC_S]=
.size,
> >               memmap[VIRT_APLIC_S].size,
> >               (msimode) ? 0 : base_hartid,
> > @@ -1206,7 +1217,7 @@ static DeviceState *virt_create_aia(RISCVVirtAIAT=
ype aia_type, int aia_guests,
> >               msimode, false, aplic_m);
> >       }
> >
> > -    return aplic_m;
> > +    return kvm_enabled() ? aplic_s : aplic_m;
> >   }
> >
> >   static void create_platform_bus(RISCVVirtState *s, DeviceState *irqch=
ip)

