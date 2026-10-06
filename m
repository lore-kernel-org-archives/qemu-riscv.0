Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1BECA5FFF
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 04:48:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEJZ7-0006OD-2P; Wed, 07 Oct 2026 00:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1xEG5c-0000MB-HO
 for qemu-riscv@nongnu.org; Tue, 06 Oct 2026 21:05:23 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1xEG5R-0001uy-U8
 for qemu-riscv@nongnu.org; Tue, 06 Oct 2026 21:04:58 -0400
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-917a64f28d0so17228636d6.0
 for <qemu-riscv@nongnu.org>; Tue, 06 Oct 2026 18:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1791334818; x=1791939618; darn=nongnu.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=uS5ot8pqG3I+KzBdOp/XACvi4DmSZfhk1PKuxhtf74k=;
 b=hbP9v2tMpHHznEi/JNQ367WTa/QW60GSR22re1s5H2l3uNByfaVpu/ON1SjsaxGnxi
 sAoYG+vBFCBkPNRZLXXRoqgsEToM1szGnrb4qLFuaUW5bsFpp+OYRraVG88KyhYunpgK
 qjVC4BjibAL/49d5sEc+n94vPwyww3TBCpbAJ1MSepeCi7kxkgS82RVsl8AZ8hl4eNFf
 +rsrx6YwhzZAnvQcnZNhmzzPqYveaqBtFkRG2SPfXIzyJubXOTP0ZUAukYkXynYxbre5
 ENjtev4uvy2lM4XH7B8bAA0TGd1JzMdBVIx+nnZHRfYgjKEG0kWEuwO6Jmo2YJER3aqN
 atxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791334818; x=1791939618;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uS5ot8pqG3I+KzBdOp/XACvi4DmSZfhk1PKuxhtf74k=;
 b=SNIWhnbH0mverO5Xw+O/MwTJF1pMAUwKBCvJIMCvbbwpWgSX5OxFjeRopGufs6TuB2
 XC9D9eQJ5G/xqGj8bwIOvej7ypevFbsn4liVSG49Xii7ifj7FFWkwTBpXCMbUebflZO4
 +IfwyzftWhSvfs2WKvjahcluUcVFhMdPvUR7eVmnwRTAzjz8603echJMNtF+9ENMh7ct
 Dv8GVl3DA0eo5VBqWCjbPvpWT/bGvGh1vTNGKCCKZdH5hAfJLZNOquF43l0aDkhYYWtD
 icHfmphpytDlNJG9uR5hqMf0wVbPpwFp0xEHIYyJHG9vsZ2iwIQL0KfIDwWUsisnQz9r
 XHFg==
X-Forwarded-Encrypted: i=1;
 AKwUvByg8+/wH3DxsuVnKhtIETtk54brdjI3stXX8OdmeqKPbJhVJ3OMhl7+V7bZdN8A8Ty012EkR8QE/0ae@nongnu.org
X-Gm-Message-State: AFuF++mIAAhU8tK4SCEmuHGYQpl5LkrY+AqxZFVclqcc/p9bday9jF8T
 xrcWOU7SJBrUX3HlXdpEdmbEmYolYqMGCJ0fJzs8cm8NfS1ZO85GVQyuggY+aALro/Pc85VMkUU
 DmW7G1zFuTA==
X-Gm-Gg: AYBFou2ubWYvHkF4Il4tU0P7KOgFmKbi/VMVIJz1MIFMmpYSN1bqQc4AupVGVqVGVbN
 Q9YfwPg5wSrbmzMhxn4OxSEipyjShbMFnY5yzLUphcCe6wvpw+ZeGYAc/VGft+8zflrcVrM4nRa
 qauu7n0ae90KpxAM9190OmtgPMnMzLOIJoex7qLh+WbOvCCEOv+JQ5XlGhDg4I4ckhpjloOjwLf
 BnrR4QjnQworPBaHDU7jykR9ycOE8+K0JEY8bTSGDLZmHsQwOp1BMN8XyiD7wEEEoPc3OwkI1Ni
 B8MdfO1SiZDTXZnh70O8Zs9RDwwsNgCVhqh5ozypsnGomccn5+gLRt4oxY6qJeEmyk5Uhz5c7jW
 6JfKyS58tnoCyA8Km/zN2yHCdj2lRNzvnqT8P7ZcPWgWEAqTkLXsNiEXtdBYzWNxSTgRMStjh1b
 sz2/HuIt/3WYyH/dzcJW4dleTF96yKzi2RfR7g+1vjKHkXEoDig1X8XKlKXHgXmRypp1Eke8Y5Z
 nNzqKjU0WRQwMHaEoYhu9u7yti2
X-Received: by 2002:a05:6a21:ed01:b0:3dd:a9a9:3966 with SMTP id
 adf61e73a8af0-3e11aa53f5fmr1013124637.42.1791255217244; 
 Mon, 05 Oct 2026 19:53:37 -0700 (PDT)
Received: from smtpclient.apple ([139.177.225.226])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cce6d2402ccsm1704760a12.6.2026.10.05.19.53.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Oct 2026 19:53:36 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH 4/4] hw/riscv/virt: Limit interrupt identities to what KVM
 AIA supports
From: Qingwei Hu <qingwei.hu@bytedance.com>
In-Reply-To: <20260928-spacemit-k3-v1-4-8c57d0596b87@butz.st>
Date: Tue, 6 Oct 2026 10:53:14 +0800
Cc: qemu-devel@nongnu.org, Sunil V L <sunilvl@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB465835-0ECC-4A80-A410-FBC0C945140F@bytedance.com>
References: <20260928-spacemit-k3-v1-0-8c57d0596b87@butz.st>
 <20260928-spacemit-k3-v1-4-8c57d0596b87@butz.st>
To: Stefan Butz <mail@butz.st>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=qingwei.hu@bytedance.com; helo=mail-qv1-xf35.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Stefan,

> On Sep 28, 2026, at 14:06, Stefan Butz via <qemu-riscv@nongnu.org> =
wrote:
>=20
> The number of interrupt identities supported by the host's KVM AIA
> is limited. On Spacemit K3 and Tenstorrent Atlantis to 63.
> virt machine alwayas aks for 255 identities, so it fails if on those
> platforms.
>=20
> Read and apply host limit from KVM AIA device and apply.
>=20
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4599
>=20
> Signed-off-by: Stefan Butz <mail@butz.st>
> ---
> hw/riscv/virt.c              | 12 +++++++++++-
> target/riscv/kvm/kvm-cpu.c   | 16 ++++++++++++++++
> target/riscv/kvm/kvm-stub.c  |  5 +++++
> target/riscv/kvm/kvm_riscv.h |  1 +
> 4 files changed, 33 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 28fa31d538..2af85ec5c3 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -78,6 +78,16 @@ static bool =
virt_use_emulated_aplic(RISCVVirtAIAType aia_type)
>     return riscv_use_emulated_aplic(msimode);
> }
>=20
> +static void virt_kvm_aia_create(RISCVVirtState *s)
> +{
> +    kvm_riscv_aia_create();
> +
> +    s->num_msis =3D MIN(s->num_msis, kvm_riscv_aia_get_num_ids());

The host may support more than 255 guest interrupt identities, but
this MIN() keeps num_msis capped at the default value of 255.
Is this intentional to preserve the existing default? Would it make
sense to allow users to configure a higher value when the host
supports it?

> +    if (!virt_use_emulated_aplic(s->aia_type)) {
> +        s->num_sources =3D MIN(s->num_sources, s->num_msis);

The value of num_sources has been modified here, while the value of
aplic_props.irqchip_num_sources set in create_fdt_sockets still uses
the default hard-coded value.

> +    }
> +}
> +
> static bool virt_aclint_allowed(void)
> {
>     return tcg_enabled() || qtest_enabled();
> @@ -734,7 +744,7 @@ static void virt_machine_init(MachineState =
*machine)
>     }
>=20
>     if (kvm_enabled() && virt_use_kvm_aia_aplic_imsic(s->aia_type)) {
> -        kvm_riscv_aia_create();
> +        virt_kvm_aia_create(s);
>     }
>=20
>     /* Initialize sockets */
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 1098581e7a..0409af3255 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1870,6 +1870,22 @@ void kvm_riscv_aia_create(void)
>     }
> }
>=20
> +uint64_t kvm_riscv_aia_get_num_ids(void)
> +{
> +    uint64_t num_ids;
> +    int ret;
> +
> +    ret =3D kvm_device_access(aia_fd, KVM_DEV_RISCV_AIA_GRP_CONFIG,
> +                            KVM_DEV_RISCV_AIA_CONFIG_IDS,
> +                            &num_ids, false, NULL);

The KVM CONFIG_IDS GET attribute writes a u32, so num_ids should
be uint32_t. With the current uint64_t variable, the upper 32 bits
remain uninitialized and may affect the MIN() result.

The return type, declaration, and non-KVM stub should also be
updated accordingly.

> +    if (ret < 0) {
> +        error_report("KVM AIA: failed to get number of msi");
> +        exit(1);
> +    }
> +
> +    return num_ids;
> +}
> +
> void kvm_riscv_aia_init(MachineState *machine, uint64_t group_shift,
>                         uint64_t aia_irq_num, uint64_t aia_msi_num,
>                         uint64_t aplic_base, uint64_t imsic_base,
> diff --git a/target/riscv/kvm/kvm-stub.c b/target/riscv/kvm/kvm-stub.c
> index 672f635b08..f5f5418b3c 100644
> --- a/target/riscv/kvm/kvm-stub.c
> +++ b/target/riscv/kvm/kvm-stub.c
> @@ -14,6 +14,11 @@ void kvm_riscv_aia_create(void)
>     g_assert_not_reached();
> }
>=20
> +uint64_t kvm_riscv_aia_get_num_ids(void)
> +{
> +    g_assert_not_reached();
> +}
> +
> void kvm_riscv_aia_init(MachineState *machine, uint64_t group_shift,
>                         uint64_t aia_irq_num, uint64_t aia_msi_num,
>                         uint64_t aplic_base, uint64_t imsic_base,
> diff --git a/target/riscv/kvm/kvm_riscv.h =
b/target/riscv/kvm/kvm_riscv.h
> index 532e42b0df..d8ae73fa1e 100644
> --- a/target/riscv/kvm/kvm_riscv.h
> +++ b/target/riscv/kvm/kvm_riscv.h
> @@ -24,6 +24,7 @@
> void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
> void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
> void kvm_riscv_aia_create(void);
> +uint64_t kvm_riscv_aia_get_num_ids(void);
> void kvm_riscv_aia_init(MachineState *machine, uint64_t group_shift,
>                         uint64_t aia_irq_num, uint64_t aia_msi_num,
>                         uint64_t aplic_base, uint64_t imsic_base,
>=20
> --=20
> Git-157)
>=20

Best regards,
Qingwei Hu


