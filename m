Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47711C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 03:43:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8YSh-0004ZQ-02; Sun, 11 Jun 2023 23:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YSg-0004Z7-3i; Sun, 11 Jun 2023 23:43:22 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8YSe-0001gs-7P; Sun, 11 Jun 2023 23:43:21 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-45a0ee1c411so712141e0c.0; 
 Sun, 11 Jun 2023 20:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686541398; x=1689133398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=793oNf/wRpBJXUrRxyY2QOGQpgdz3NOVkeheFM4ff90=;
 b=Opg+v55DhNNLmYUaXPXhfPf+zYhRTEizdAStld/gS4vG7aRayLXDeAyg6BSlQHjuVE
 gMzq+pJ4A1/UWmDMJJ/6a8n4m9zQQXo1Qpfv1LOzBk8w4qrdJxa1iJl7K+ztDHbCo+6U
 uaudgHM3GbuEZDVqVfguOIq3+bFrV4FVxUDRhU3LYTz4PshKNDcttz9ERaWuKLxM+Wb2
 uB6EX2MqihL75roNv2pOr6ph23aZTrNL2wh0NELDlCYz+ajSJZBWaNBbazdxpl5PSeXN
 tpL0E0s9oG656azvRlT/2npIzGV8dj8lfrfLoimK2gfcVFMgtBwTKYMjLk05P1XSLqia
 u4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686541398; x=1689133398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=793oNf/wRpBJXUrRxyY2QOGQpgdz3NOVkeheFM4ff90=;
 b=H4hvcYVrWMMM+8kr+W8VJjLMhUwn3HY0UopOITNnzh5ekxbgPTY6F2jWTFEyZloVZI
 wMhUpz+lNroWL2MrsapxXlnaeeTTo+7jvpZAgB0bnAdO3LWViqNSPksQR3zimUI5v9fQ
 trPcJWG/XuB7vX6+KCyDdbg7X3Vg4HtGtAJufwubSlvONXxQYZyri9BR9DlCrUmE30q8
 /idPMNznRw5ia4vWbw7X9f6JPqptL/ljP+Ps1TlIV1K8qjqdyhhgaSeFQuJe3JxIlHjR
 FuSrgzMwzV5Ts+FXb8Ce5DxvVaQEsFbUhe0xxo8QBEPBSu4eNBXmlKhbtHBn0LzfQv+J
 uiHw==
X-Gm-Message-State: AC+VfDyzNHL0qL3wqUNjmjlfmsf86ivEBpLvspztmqLOJIuRJa8hWeGu
 DJhB6+BxbkNVmKCtNuet1u32DCLQF/0Y+7NLCIc=
X-Google-Smtp-Source: ACHHUZ5GwkWB4OSkloqZuYjKJbdHiJqCqKhz6nqVM/QJLPN+vfURSt6/+w8syNHgbcLgdaWRHZGSVYFaTzaDLt+bEX4=
X-Received: by 2002:a67:ba02:0:b0:438:e102:9c13 with SMTP id
 l2-20020a67ba02000000b00438e1029c13mr653854vsn.27.1686541398510; Sun, 11 Jun
 2023 20:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230606113812.519723-1-hchauhan@ventanamicro.com>
 <CAGKm2NJGGF-ROU_Js8-pv5xsCadN=vPOAD4EXWnMiveEbu931A@mail.gmail.com>
 <416cfdcc-a3bd-0143-8ecd-a5b6630a913e@ventanamicro.com>
In-Reply-To: <416cfdcc-a3bd-0143-8ecd-a5b6630a913e@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 13:42:52 +1000
Message-ID: <CAKmqyKN6yQugTDWj3ugt5MZ4EKKJjL=b5Sf6xJMQa-GEVoyn6A@mail.gmail.com>
Subject: Re: [PATCH] Add epmp to extensions list and rename it to smepmp
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: =?UTF-8?B?TG/Dr2MgTGVmb3J0?= <loic@rivosinc.com>, 
 Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Jun 7, 2023 at 6:56=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 6/6/23 16:46, Lo=C3=AFc Lefort wrote:
> > On Tue, Jun 6, 2023 at 1:39=E2=80=AFPM Himanshu Chauhan
> > <hchauhan@ventanamicro.com> wrote:
> >>
> >> Smepmp is a ratified extension which qemu refers to as epmp.
> >> Rename epmp to smepmp and add it to extension list so that
> >> it is added to the isa string.
> >>
> >> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> >> ---
> >>   target/riscv/cpu.c     |  9 +++++----
> >>   target/riscv/cpu_cfg.h |  2 +-
> >>   target/riscv/csr.c     |  6 +++---
> >>   target/riscv/pmp.c     | 12 ++++++------
> >>   4 files changed, 15 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 881bddf393..cf3d1c3207 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -127,6 +127,7 @@ static const struct isa_ext_data isa_edata_arr[] =
=3D {
> >>       ISA_EXT_DATA_ENTRY(svinval, PRIV_VERSION_1_12_0, ext_svinval),
> >>       ISA_EXT_DATA_ENTRY(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
> >>       ISA_EXT_DATA_ENTRY(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
> >> +    ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
> >>       ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
> >>       ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
> >>       ISA_EXT_DATA_ENTRY(xtheadbs, PRIV_VERSION_1_11_0, ext_xtheadbs),
> >> @@ -547,7 +548,7 @@ static void rv32_ibex_cpu_init(Object *obj)
> >>   #ifndef CONFIG_USER_ONLY
> >>       set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
> >>   #endif
> >> -    cpu->cfg.epmp =3D true;
> >> +    cpu->cfg.ext_smepmp =3D true;
> >>
> > Should also update Ibex CPU to priv level 1.12 otherwise Smepmp will
> > be disabled since it is now declared PRIV_VERSION_1_12_0 in
> > isa_edata_arr.
>
> (--- added Alistair in CC since he added the Ibex CPU back in 2020 ---)
>
> Good point. Commit ed6eebaaafd states that the Ibex CPU has ePMP support
> and this patch would break it.
>
> I suggest changing the priv_version in a separated patch to facilitate fu=
ture
> rebases/bisects.

Agreed!

Thanks for the patch as well, I have been meaning to get around to fix this

Alistair

>
>
> Thanks,
>
>
> Daniel
>
>
> >
> >>       /* inherited from parent obj via riscv_cpu_init() */
> >>       cpu->cfg.ext_ifencei =3D true;
> >> @@ -1336,12 +1337,12 @@ static void riscv_cpu_realize(DeviceState *dev=
, Error **errp)
> >>           return;
> >>       }
> >>
> >> -    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
> >> +    if (cpu->cfg.ext_smepmp && !cpu->cfg.pmp) {
> >>           /*
> >>            * Enhanced PMP should only be available
> >>            * on harts with PMP support
> >>            */
> >> -        error_setg(errp, "Invalid configuration: EPMP requires PMP su=
pport");
> >> +        error_setg(errp, "Invalid configuration: SMEPMP requires PMP =
support");
> >>           return;
> >>       }
> > Nitpick: the spec uses "Smepmp", not "SMEPMP".
> >
> >>
> >> @@ -1676,7 +1677,7 @@ static Property riscv_cpu_extensions[] =3D {
> >>       DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
> >>
> >>       /* ePMP 0.9.3 */
> >> -    DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> >> +    DEFINE_PROP_BOOL("smepmp", RISCVCPU, cfg.ext_smepmp, false),
> >>       DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> >>       DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
> >>
> > You missed the comment update but maybe just move the definition next
> > to pmp and drop the comment since it's now ratified?
> >
> >> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> >> index c4a627d335..d79b022e35 100644
> >> --- a/target/riscv/cpu_cfg.h
> >> +++ b/target/riscv/cpu_cfg.h
> >> @@ -87,6 +87,7 @@ struct RISCVCPUConfig {
> >>       bool ext_zvfh;
> >>       bool ext_zvfhmin;
> >>       bool ext_smaia;
> >> +    bool ext_smepmp;
> >>       bool ext_ssaia;
> >>       bool ext_sscofpmf;
> >>       bool rvv_ta_all_1s;
> >> @@ -121,7 +122,6 @@ struct RISCVCPUConfig {
> >>       uint16_t cboz_blocksize;
> >>       bool mmu;
> >>       bool pmp;
> >> -    bool epmp;
> >>       bool debug;
> >>       bool misa_w;
> >>
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index 58499b5afc..d9bc591348 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -523,9 +523,9 @@ static RISCVException pmp(CPURISCVState *env, int =
csrno)
> >>       return RISCV_EXCP_ILLEGAL_INST;
> >>   }
> >>
> >> -static RISCVException epmp(CPURISCVState *env, int csrno)
> >> +static RISCVException smepmp(CPURISCVState *env, int csrno)
> >>   {
> >> -    if (riscv_cpu_cfg(env)->epmp) {
> >> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
> >>           return RISCV_EXCP_NONE;
> >>       }
> >>
> >> @@ -4356,7 +4356,7 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >>       [CSR_VSIPH]       =3D { "vsiph",       aia_hmode32, NULL, NULL, =
rmw_vsiph },
> >>
> >>       /* Physical Memory Protection */
> >> -    [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_msec=
cfg,
> >> +    [CSR_MSECCFG]    =3D { "mseccfg", smepmp, read_mseccfg, write_mse=
ccfg,
> >>                            .min_priv_ver =3D PRIV_VERSION_1_11_0      =
     },
> >>       [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmp=
cfg  },
> >>       [CSR_PMPCFG1]    =3D { "pmpcfg1",   pmp, read_pmpcfg,  write_pmp=
cfg  },
> >> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> >> index 418738afd8..18246e1737 100644
> >> --- a/target/riscv/pmp.c
> >> +++ b/target/riscv/pmp.c
> >> @@ -87,7 +87,7 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32=
_t pmp_index, uint8_t val)
> >>       if (pmp_index < MAX_RISCV_PMPS) {
> >>           bool locked =3D true;
> >>
> >> -        if (riscv_cpu_cfg(env)->epmp) {
> >> +        if (riscv_cpu_cfg(env)->ext_smepmp) {
> >>               /* mseccfg.RLB is set */
> >>               if (MSECCFG_RLB_ISSET(env)) {
> >>                   locked =3D false;
> >> @@ -337,9 +337,9 @@ bool pmp_hart_has_privs(CPURISCVState *env, target=
_ulong addr,
> >>
> >>           /*
> >>            * Convert the PMP permissions to match the truth table in t=
he
> >> -         * ePMP spec.
> >> +         * SMEPMP spec.
> >>            */
> > Smepmp
> >
> >> -        const uint8_t epmp_operation =3D
> >> +        const uint8_t smepmp_operation =3D
> >>               ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
> >>               ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
> >>               (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
> >> @@ -364,7 +364,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target=
_ulong addr,
> >>                    * If mseccfg.MML Bit set, do the enhanced pmp priv =
check
> >>                    */
> >>                   if (mode =3D=3D PRV_M) {
> >> -                    switch (epmp_operation) {
> >> +                    switch (smepmp_operation) {
> >>                       case 0:
> >>                       case 1:
> >>                       case 4:
> >> @@ -395,7 +395,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target=
_ulong addr,
> >>                           g_assert_not_reached();
> >>                       }
> >>                   } else {
> >> -                    switch (epmp_operation) {
> >> +                    switch (smepmp_operation) {
> >>                       case 0:
> >>                       case 8:
> >>                       case 9:
> >> @@ -576,7 +576,7 @@ void mseccfg_csr_write(CPURISCVState *env, target_=
ulong val)
> >>           }
> >>       }
> >>
> >> -    if (riscv_cpu_cfg(env)->epmp) {
> >> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
> >>           /* Sticky bits */
> >>           val |=3D (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
> >>           if ((val ^ env->mseccfg) & (MSECCFG_MMWP | MSECCFG_MML)) {
> >> --
> >> 2.34.1
> >>
> >>
> >
>

