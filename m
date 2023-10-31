Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6AAC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 15:43:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxqti-0007ZC-N0; Tue, 31 Oct 2023 11:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qxqtd-0007Wg-AK
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 11:43:13 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qxqtb-00048A-6p
 for qemu-riscv@nongnu.org; Tue, 31 Oct 2023 11:43:13 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-407c3adef8eso47674275e9.2
 for <qemu-riscv@nongnu.org>; Tue, 31 Oct 2023 08:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698766990; x=1699371790;
 darn=nongnu.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jD1SQvU+oUO4G8UkIikjK8SU39oU8JVk+TRoBXSEiK0=;
 b=c3jtWaOEGZ8MTesQv1eEZ0/o1MYDvuEcPxmR6Ex5SpbrZVrSq/lp6mzkq6k8Mk9PWa
 mf3xm4+yM2j/INKI9TAelnIkMxOacjjqLcF8+Na2wAKfyObeP3J2PQXEX2S05NvNureH
 HV9y3VOkOXUd/zzKcPn9rEvHIuyhBLJx4acFW+FRlWWdV8txtvwFVyqluz7QFGXQ+AtK
 pf8ReE0b9bn3DqyNq0TsLKtL+ThAOyJqtv37FPQCtzcatowsKpq1E1hjOMe4Js9MhuKw
 oLcRtf010c/cyTF7rCDKsyakEDUd11TpI91KMMEQlXeuotdtgPqJSTZ5ogOtW98HBxS6
 MCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698766990; x=1699371790;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jD1SQvU+oUO4G8UkIikjK8SU39oU8JVk+TRoBXSEiK0=;
 b=wdibqDj4ILJudrA2TzO1LbpVEeNMK6yvUngh/mDyzV8mzQyPBZsgZ+tLk/tS4O3wo7
 Zk0Jcg7/hpLy+17wuOep+C9d9+uxY9PyluGhv4tHREyeozmt1UeZaP+j0lF1ia4IdOop
 TmqQmD/Rq6pghIzRyWEMuXKrlI6bYwgrCBqkhhwKuVVuG70WbMmzp2oIzmC9dYk+p3JU
 SnNUeadUGhyWRye90hub2WifgYu4wyOiP2AGyYRO6b9umm0GKfQo4QGo6/B1XnLdqtOk
 6j2XPaX79DAFH7Y0k1jpktcpXAMsqgoW0/GRCQJ3zW0Ki09fM7TuvuXl/nQeV6yyiYXH
 Wdlw==
X-Gm-Message-State: AOJu0YxAWnnnsBIarfaIZLEzxLks/XX+QQnpVQ2bgDXuH3x/2jCPp6R5
 fYOw2YdJtA8QA8NFQznmQIz/uQ==
X-Google-Smtp-Source: AGHT+IEsLi2JjrZ7IerplO12cbknzxQq0FqdtyYkQuR4vc6RgvHNZvn6OIVktmvuTrHHmydVKxF1Mw==
X-Received: by 2002:a5d:47cf:0:b0:32f:7db1:22f0 with SMTP id
 o15-20020a5d47cf000000b0032f7db122f0mr7970199wrc.20.1698766989635; 
 Tue, 31 Oct 2023 08:43:09 -0700 (PDT)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a056000118800b0032db8cccd3asm1762956wrx.114.2023.10.31.08.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 08:43:09 -0700 (PDT)
Message-ID: <36a487d77bcf477f2d550318b6aefa0b1d331968.camel@rivosinc.com>
Subject: Re: [PATCH v4 4/6] target/riscv: Add "pmu-mask" property to replace
 "pmu-num"
From: Rob Bradford <rbradford@rivosinc.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com
Date: Tue, 31 Oct 2023 15:43:08 +0000
In-Reply-To: <CAKmqyKOEwa2soJNP9KkhoPxxJaEAsKFAnLQYtpo5+DgBi1XoLg@mail.gmail.com>
References: <20231018154434.17367-1-rbradford@rivosinc.com>
 <20231018154434.17367-5-rbradford@rivosinc.com>
 <CAKmqyKOEwa2soJNP9KkhoPxxJaEAsKFAnLQYtpo5+DgBi1XoLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.module_f38+16987+774193ea) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 2023-10-23 at 12:02 +1000, Alistair Francis wrote:
> On Thu, Oct 19, 2023 at 1:45=E2=80=AFAM Rob Bradford <rbradford@rivosinc.=
com>
> wrote:
> >=20
> > Using a mask instead of the number of PMU devices supports the
> > accurate
> > emulation of platforms that have a discontinuous set of PMU
> > counters.
> >=20
> > The "pmu-num" property now generates a warning when used by the
> > user on
> > the command line. In order to avoid warning for the default value
> > when
> > the property is not explicitly by the user the property default
> > value
> > cannot be used so the default value must be set during the CPU
> > object
> > initialisation.
> >=20
> > If the "pmu-num" value is changed from the default then the mask
> > will be
> > generated from that to support the transition to "pmu-mask".
> >=20
> > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > ---
> > =C2=A0target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 31 ++++++++++++++++++++++++++++++-
> > =C2=A0target/riscv/cpu_cfg.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > =C2=A0target/riscv/machine.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0target/riscv/pmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 20 ++++++++++++++++----
> > =C2=A0target/riscv/tcg/tcg-cpu.c |=C2=A0 2 +-
> > =C2=A05 files changed, 50 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index ac4a6c7eec..1b734d1dde 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -1169,6 +1169,11 @@ static void riscv_cpu_post_init(Object *obj)
> >=20
> > =C2=A0static void riscv_cpu_init(Object *obj)
> > =C2=A0{
> > +=C2=A0=C2=A0=C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);
> > +
> > +=C2=A0=C2=A0=C2=A0 /* Using property default value would spam deprecat=
ion warning
> > */
> > +=C2=A0=C2=A0=C2=A0 cpu->cfg.pmu_num =3D 16;
> > +
> > =C2=A0#ifndef CONFIG_USER_ONLY
> > =C2=A0=C2=A0=C2=A0=C2=A0 qdev_init_gpio_in(DEVICE(obj), riscv_cpu_set_i=
rq,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IRQ_LOCAL_M=
AX + IRQ_LOCAL_GUEST_MAX);
> > @@ -1362,8 +1367,32 @@ const RISCVCPUMultiExtConfig
> > riscv_cpu_deprecated_exts[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_END_OF_LIST(),
> > =C2=A0};
> >=20
> > +static void prop_pmu_num_set(Object *obj, Visitor *v, const char
> > *name,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 void *opaque, Error **errp)
> > +{
> > +=C2=A0=C2=A0=C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);
> > +
> > +=C2=A0=C2=A0=C2=A0 visit_type_uint8(v, name, &cpu->cfg.pmu_num, errp);
> > +=C2=A0=C2=A0=C2=A0 warn_report("\"pmu-num\" property is deprecated; us=
e \"pmu-
> > mask\"");
> > +}
> > +
> > +static void prop_pmu_num_get(Object *obj, Visitor *v, const char
> > *name,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 void *opaque, Error **errp)
> > +{
> > +=C2=A0=C2=A0=C2=A0 RISCVCPU *cpu =3D RISCV_CPU(obj);
> > +
> > +=C2=A0=C2=A0=C2=A0 visit_type_uint8(v, name, &cpu->cfg.pmu_num, errp);
> > +}
> > +
> > +const PropertyInfo prop_pmu_num =3D {
> > +=C2=A0=C2=A0=C2=A0 .name =3D "pmu-num",
> > +=C2=A0=C2=A0=C2=A0 .get =3D prop_pmu_num_get,
> > +=C2=A0=C2=A0=C2=A0 .set =3D prop_pmu_num_set,
> > +};
> > +
> > =C2=A0Property riscv_cpu_options[] =3D {
> > -=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num,=
 16),
> > +=C2=A0=C2=A0=C2=A0 DEFINE_PROP("pmu-num", RISCVCPU, cfg.pmu_num, prop_=
pmu_num,
> > uint8_t), /* Deprecated */
> > +=C2=A0=C2=A0=C2=A0 DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_ma=
sk,
> > MAKE_64BIT_MASK(3, 16)),
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, tru=
e),
> > =C2=A0=C2=A0=C2=A0=C2=A0 DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, tru=
e),
> > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > index 0e6a0f245c..d273487040 100644
> > --- a/target/riscv/cpu_cfg.h
> > +++ b/target/riscv/cpu_cfg.h
> > @@ -123,7 +123,8 @@ struct RISCVCPUConfig {
> > =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_xtheadsync;
> > =C2=A0=C2=A0=C2=A0=C2=A0 bool ext_XVentanaCondOps;
> >=20
> > -=C2=A0=C2=A0=C2=A0 uint8_t pmu_num;
> > +=C2=A0=C2=A0=C2=A0 uint8_t pmu_num; /* Deprecated */
> > +=C2=A0=C2=A0=C2=A0 uint32_t pmu_mask;
> > =C2=A0=C2=A0=C2=A0=C2=A0 char *priv_spec;
> > =C2=A0=C2=A0=C2=A0=C2=A0 char *user_spec;
> > =C2=A0=C2=A0=C2=A0=C2=A0 char *bext_spec;
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index c7c862cdd3..9f6e3f7a6d 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -313,7 +313,7 @@ static bool pmu_needed(void *opaque)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 RISCVCPU *cpu =3D opaque;
> >=20
> > -=C2=A0=C2=A0=C2=A0 return cpu->cfg.pmu_num;
> > +=C2=A0=C2=A0=C2=A0 return (cpu->cfg.pmu_mask > 0);
> > =C2=A0}
> >=20
> > =C2=A0static const VMStateDescription vmstate_pmu_ctr_state =3D {
> > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > index 7ddf4977b1..5e89354bb9 100644
> > --- a/target/riscv/pmu.c
> > +++ b/target/riscv/pmu.c
> > @@ -18,6 +18,7 @@
> >=20
> > =C2=A0#include "qemu/osdep.h"
> > =C2=A0#include "qemu/log.h"
> > +#include "qemu/error-report.h"
> > =C2=A0#include "cpu.h"
> > =C2=A0#include "pmu.h"
> > =C2=A0#include "sysemu/cpu-timers.h"
> > @@ -184,7 +185,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum
> > riscv_pmu_event_idx event_idx)
> > =C2=A0=C2=A0=C2=A0=C2=A0 CPURISCVState *env =3D &cpu->env;
> > =C2=A0=C2=A0=C2=A0=C2=A0 gpointer value;
> >=20
> > -=C2=A0=C2=A0=C2=A0 if (!cpu->cfg.pmu_num) {
> > +=C2=A0=C2=A0=C2=A0 if (!cpu->cfg.pmu_mask) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0 value =3D g_hash_table_lookup(cpu->pmu_event_c=
tr_map,
> > @@ -434,7 +435,13 @@ void riscv_pmu_init(RISCVCPU *cpu, Error
> > **errp)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 uint8_t pmu_num =3D cpu->cfg.pmu_num;
> >=20
> > -=C2=A0=C2=A0=C2=A0 if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> > +=C2=A0=C2=A0=C2=A0 if (cpu->cfg.pmu_mask & (COUNTEREN_CY | COUNTEREN_T=
M |
> > COUNTEREN_IR)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "\"pmu-mas=
k\" contains invalid bits (0-2)
> > set");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if (ctpop32(cpu->cfg.pmu_mask) > (RV_MAX_MHPMCOUNTE=
RS - 3) ||
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (pmu_num > RV_MAX_MHPMCOUNT=
ERS - 3)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_setg(errp, "Numb=
er of counters exceeds maximum
> > available");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > @@ -445,6 +452,11 @@ void riscv_pmu_init(RISCVCPU *cpu, Error
> > **errp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > -=C2=A0=C2=A0=C2=A0 /* Create a bitmask of available programmable count=
ers */
> > -=C2=A0=C2=A0=C2=A0 cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num)=
;
> > +=C2=A0=C2=A0=C2=A0 if (pmu_num =3D=3D 0) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu->cfg.pmu_mask =3D 0;
> > +=C2=A0=C2=A0=C2=A0 } else if (pmu_num !=3D 16) {
>=20
> I think it's clearer if this is just an else instead of if not 16
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu->cfg.pmu_mask =3D MAKE_=
32BIT_MASK(3, pmu_num);
> > +=C2=A0=C2=A0=C2=A0 }
>=20

Hi Alistair,

> Also doesn't think mean that the pmu-num prop will override the
> pmu-mask prop? We probably want to do it the other way around.

For transition it is necessary to override the "pmu-mask" value if the
user specifies "pmu-num" on the command line as the "pmu-mask" has a
default value set.

> Does setting pmu_mask directly in prop_pmu_num_set() work? Then we
> can
> drop pmu_num completely.
>=20

This was a great suggestion and simplified the code somewhat - i've
done this in the latest version sent to the list.

Cheers,

Rob

> Alistair
>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 cpu->pmu_avail_ctrs =3D cpu->cfg.pmu_mask;
> > =C2=A0}
> > diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-
> > cpu.c
> > index ed3eb991c0..53c52389b9 100644
> > --- a/target/riscv/tcg/tcg-cpu.c
> > +++ b/target/riscv/tcg/tcg-cpu.c
> > @@ -613,7 +613,7 @@ static bool tcg_cpu_realize(CPUState *cs, Error
> > **errp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv_timer_init(cpu);
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> >=20
> > -=C2=A0=C2=A0=C2=A0 if (cpu->cfg.pmu_num) {
> > +=C2=A0=C2=A0=C2=A0 if (cpu->cfg.pmu_mask) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 riscv_pmu_init(cpu, &l=
ocal_err);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (local_err !=3D NUL=
L) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 error_propagate(errp, local_err);
> > --
> > 2.41.0
> >=20
> >=20


