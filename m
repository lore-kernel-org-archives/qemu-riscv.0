Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0196FCDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 12:39:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qquxr-0004eE-HY; Thu, 12 Oct 2023 08:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qquxq-0004dj-4n
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 08:38:54 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rbradford@rivosinc.com>)
 id 1qquxn-0006hZ-Hb
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 08:38:53 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4075c58ac39so9490235e9.3
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 05:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697114329; x=1697719129;
 darn=nongnu.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mihdO2DYtoRQbtAiJr6K1krAzTPFq9eOagqB5sbFy6s=;
 b=GX9ApkwiAr73QiwLNYhX8MneaFwj4Cs6LPX9uAJkl6qd3q7HNfZLwYHUuiYNVcf1Qa
 UNH/c+tPz6vtJtROSPNLoODFD6IqXQViaPhA7ngGDefN6IDcdckBfWNqFx+jjrzXTf/N
 HeKukUYvMeIJ75z+pwXZGHPpbInlxjdj9BAsMJQe8zk1flg9KMa+yudkjDdA8P9APG2M
 NQdyFMdcN13ZZ5R26s6mXfgBDSe0wTnsZ6V7ykHO8ep8x0JmOe3NZ7sitegnxU3B5WpS
 DosDdvWKiOup+6L8WtFpAlVac/sRzfCE6QycqRMxW/qbNWQ1DOAMjSY/3F0vzHTuknl2
 Dvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697114329; x=1697719129;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mihdO2DYtoRQbtAiJr6K1krAzTPFq9eOagqB5sbFy6s=;
 b=qvzPhmsMwsrfJs+tALoM6o9EUI3XbZNAX62kbHVNOdU0mf51wpKIhihYQaYvIgpzzN
 uPaMeNDXOSrqSABCGjsPvYelMBpYe8ArPE5CO0P3Jljc2KgsHx4kIEqCzsDeQwnV9h3T
 CxC54kDyGjNPK0kuhGtb8ys2KtdMqbYsgYk96r5ZQWvfbiuTKWbWFy39ESohT0Pw3UID
 uJC0XBO5cjTKI3qUsUf5xNj38HHh02nZBwoheeX4xq0GG27pTRAeOgnrWyJbdV4nMVT1
 gmoyk1DDEru7NEBw1aXU0XopRw6F0c5vtc/La8cDxPpVGGR0/C6fQ7c2pIm9vFmaAziP
 BZPQ==
X-Gm-Message-State: AOJu0Ywk2bDKjh77CQX5ZFVZLgirrk2Q6GnW+xot3JaExx9Hf0p4lT80
 IBdLMMHVgODqX/KECzwUL0CU6w==
X-Google-Smtp-Source: AGHT+IHHGpO4RQUA/+Me8OGQjqoAIDpF3didv57oFH5ortK1RgdpUgDbX+wPLmLmeq4BaCk4HGskcQ==
X-Received: by 2002:a05:600c:230d:b0:407:5b54:bb13 with SMTP id
 13-20020a05600c230d00b004075b54bb13mr5652342wmo.37.1697114329449; 
 Thu, 12 Oct 2023 05:38:49 -0700 (PDT)
Received: from [192.168.1.9] (214.11.169.217.in-addr.arpa. [217.169.11.214])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a7bcd98000000b004064741f855sm19462762wmj.47.2023.10.12.05.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 05:38:49 -0700 (PDT)
Message-ID: <95425ae7f47334754aa7b706ba8362c2349d2f48.camel@rivosinc.com>
Subject: Re: [PATCH v2 5/6] target/riscv: Add "pmu-mask" property to replace
 "pmu-num"
From: Rob Bradford <rbradford@rivosinc.com>
To: LIU Zhiwei <baxiantai@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Date: Thu, 12 Oct 2023 13:38:48 +0100
In-Reply-To: <e68ea00e-3f7a-4590-beae-6946d9fde671@gmail.com>
References: <20231011145032.81509-1-rbradford@rivosinc.com>
 <20231011145032.81509-6-rbradford@rivosinc.com>
 <e68ea00e-3f7a-4590-beae-6946d9fde671@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.module_f38+16987+774193ea) 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=rbradford@rivosinc.com; helo=mail-wm1-x329.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, 2023-10-12 at 17:05 +0800, LIU Zhiwei wrote:
> =C2=A0
>=20
> =C2=A0
> =C2=A0
> On 2023/10/11 22:45, Rob Bradford wrote:
> =C2=A0
> =C2=A0
> > =C2=A0
> > Using a mask instead of the number of PMU devices supports the
> > accurate
> > emulation of platforms that have a discontinuous set of PMU
> > counters.
> >=20
> > Generate a warning if the old property changed from the default but
> > still go ahead and use it to generate the mask if the user has
> > changed
> > it from the default
> >=20
> > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > ---
> > =C2=A0target/riscv/cpu.c     |  5 +++--
> > =C2=A0target/riscv/cpu_cfg.h |  3 ++-
> > =C2=A0target/riscv/machine.c |  2 +-
> > =C2=A0target/riscv/pmu.c     | 14 ++++++++++----
> > =C2=A04 files changed, 16 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index c9d8fc12fe..4d2987e568 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -1487,7 +1487,7 @@ static void riscv_cpu_realize_tcg(DeviceState
> > *dev, Error **errp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0riscv_timer_init(=
cpu);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0
> > -    if (cpu->cfg.pmu_num) {
> > +    if (cpu->cfg.pmu_mask) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0riscv_pmu_init(cp=
u, &local_err);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (local_err !=
=3D NULL) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0error_propagate(errp, local_err);
> > @@ -1812,7 +1812,8 @@ static void
> > riscv_cpu_add_misa_properties(Object *cpu_obj)
> > =C2=A0
> > =C2=A0static Property riscv_cpu_extensions[] =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Defaults for standard extensions */
> > -    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> > +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16), /*
> > Deprecated */
> > +    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask,
> > MAKE_32BIT_MASK(3, 16)),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cf=
g.ext_sscofpmf,
> > false),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cf=
g.ext_ifencei, true),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.e=
xt_icsr, true),
> > diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> > index 0e6a0f245c..d273487040 100644
> > --- a/target/riscv/cpu_cfg.h
> > +++ b/target/riscv/cpu_cfg.h
> > @@ -123,7 +123,8 @@ struct RISCVCPUConfig {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool ext_xtheadsync;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool ext_XVentanaCondOps;
> > =C2=A0
> > -    uint8_t pmu_num;
> > +    uint8_t pmu_num; /* Deprecated */
> > +    uint32_t pmu_mask;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *priv_spec;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *user_spec;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0char *bext_spec;
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index c7c862cdd3..9f6e3f7a6d 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -313,7 +313,7 @@ static bool pmu_needed(void *opaque)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0RISCVCPU *cpu =3D opaque;
> > =C2=A0
> > -    return cpu->cfg.pmu_num;
> > +    return (cpu->cfg.pmu_mask > 0);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static const VMStateDescription vmstate_pmu_ctr_state =3D {
> > diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> > index 360c76f63e..f2d35b4d3b 100644
> > --- a/target/riscv/pmu.c
> > +++ b/target/riscv/pmu.c
> > @@ -18,6 +18,7 @@
> > =C2=A0
> > =C2=A0#include "qemu/osdep.h"
> > =C2=A0#include "qemu/log.h"
> > +#include "qemu/error-report.h"
> > =C2=A0#include "cpu.h"
> > =C2=A0#include "pmu.h"
> > =C2=A0#include "sysemu/cpu-timers.h"
> > @@ -182,7 +183,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum
> > riscv_pmu_event_idx event_idx)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPURISCVState *env =3D &cpu->env;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpointer value;
> > =C2=A0
> > -    if (!cpu->cfg.pmu_num) {
> > +    if (!cpu->cfg.pmu_mask) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D g_hash_table_lookup(cpu->pmu_ev=
ent_ctr_map,
> > @@ -432,7 +433,7 @@ void riscv_pmu_init(RISCVCPU *cpu, Error
> > **errp)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t pmu_num =3D cpu->cfg.pmu_num;
> > =C2=A0
> > -    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
> > +    if (ctpop32(cpu->cfg.pmu_mask) > (RV_MAX_MHPMCOUNTERS - 3)) {
> > =C2=A0
> =C2=A0
> =C2=A0
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_setg(errp, =
"Number of counters exceeds maximum
> > available");
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > @@ -443,6 +444,11 @@ void riscv_pmu_init(RISCVCPU *cpu, Error
> > **errp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > =C2=A0
> > -    /* Create a bitmask of available programmable counters */
> > -    cpu->pmu_avail_ctrs =3D MAKE_32BIT_MASK(3, pmu_num);
> > +    /* Check if user set it by comparing against default */
> > +    if (pmu_num !=3D 16) {
> > +        warn_report("\"pmu-num\" property is deprecated; use
> > \"pmu-mask\"");
> > +        cpu->cfg.pmu_mask =3D MAKE_32BIT_MASK(3, pmu_num);
> > +    }
> > +
> > +    cpu->pmu_avail_ctrs =3D cpu->cfg.pmu_mask;
> > =C2=A0
> =C2=A0
> How to process the pmu_mask[0:2] no-zero bits? They should not
> included into pmu_avail_ctrs.
> =C2=A0

Good point, thanks Zhiwei. I think rather than masking those bits it is
better to add a check and error out if those bits are set.

Cheers,

Rob

> Zhiwei
> =C2=A0
> =C2=A0
> > =C2=A0
> > =C2=A0}
> > =C2=A0
> =C2=A0


