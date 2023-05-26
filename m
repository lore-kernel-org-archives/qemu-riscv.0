Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6909EC77B7A
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 May 2023 01:20:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q2M7j-0004U6-Bg; Thu, 25 May 2023 21:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2M7h-0004QF-Oz; Thu, 25 May 2023 21:20:05 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q2M7f-0003ha-KV; Thu, 25 May 2023 21:20:05 -0400
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7868d32ace2so169343241.3; 
 Thu, 25 May 2023 18:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685064002; x=1687656002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/IV3UwqeGXxjzzeMQaAI3Phdy3+TKvyRl/BiiMT72lM=;
 b=Mknzvb6lXH2kto9yuHcXFt48Qkt4rczXukaxZE7JzrBVoBPZYu9shNvjvz3kZorJqE
 0U3SNgVDlEXnwkRDREp4uFTvc6zjo2tXjwwa29Var8+9ku6Y4liGssZFtdou8mgobPLp
 ttGoVjgnCckcM/twWAhZ2UhLoG3JlyTsk9B9PD1aIcUxfL95kV6SX8kGmriQ+jDbuvqb
 cyJ6LL9FMmcf5DWOHZqJ34SvJJGbSxfGh/uVj5QD/QWkUCctejUzxTromJTCMkIfpwB/
 G3dp9c9VALkws/WaVHqmzEIQKcKU9y43hwFY2pNBuxQNvACqimYKDpBwzsLaE88MbnFu
 x3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685064002; x=1687656002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/IV3UwqeGXxjzzeMQaAI3Phdy3+TKvyRl/BiiMT72lM=;
 b=RvX1MJonnvWplJ/OeZb/jTOpNduLU7aWGXCiFuL40nISZJvsPKMPGQD4z/MOwaJ+cF
 EkkG9J/Ym2JaU6R4tcXQVSEafUT+oFcmA3preGJ2H74sxzTPwv8boP2wzoH0QKg56KVM
 gMxcENX0lYsZtAWfUIebAq7BaVHu5oK62RyzUbt8fauwzz0oC1aor6dyMvkSFR22Z7sB
 ZVk+xbW1YO70sqOf/xFlO9ZeuLvFRmcSaJyF7PIyxeXiNa7zugPeG+2VqQFv+vkDMykJ
 RkDI4pEjpElbuwXLjquQoCKKusdU4wzpoKB+ETev0r6g22KJLmNuOhZhWHUMcuCpkYFA
 BcYA==
X-Gm-Message-State: AC+VfDyK839ILTjOGDNyw/Wk91qYIM9hFqZ4cqvTAs6uAZpghzhJG8zn
 4K+fDY8YjI7zz15HdrZdrj8+fkc+pw1FmTK6+u4=
X-Google-Smtp-Source: ACHHUZ7gCLva0IsmUsYFyvhOB/kIUnMZbvbGcmaRr0Paa2mBNMm3gjNh+C9PF+m++iH3QJV1QgmjKKqajjfl0ZQPYJg=
X-Received: by 2002:a67:fb0c:0:b0:436:c4a:bcc4 with SMTP id
 d12-20020a67fb0c000000b004360c4abcc4mr56580vsr.21.1685064001860; Thu, 25 May
 2023 18:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230523093539.203909-1-liweiwei@iscas.ac.cn>
 <20230523093539.203909-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20230523093539.203909-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 May 2023 11:19:35 +1000
Message-ID: <CAKmqyKPeaA7=QryAP120yCe_xGdgRD_-CzodU1Zq=sgC3OEXYA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] target/riscv: Split RISCVCPUConfig declarations
 from cpu.h into cpu_cfg.h
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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

On Tue, May 23, 2023 at 7:38=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> Split RISCVCPUConfig declarations to prepare for passing it to disas.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h     | 114 +---------------------------------
>  target/riscv/cpu_cfg.h | 136 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 137 insertions(+), 113 deletions(-)
>  create mode 100644 target/riscv/cpu_cfg.h
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index de7e43126a..dc1229b69c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -27,6 +27,7 @@
>  #include "qom/object.h"
>  #include "qemu/int128.h"
>  #include "cpu_bits.h"
> +#include "cpu_cfg.h"
>  #include "qapi/qapi-types-common.h"
>  #include "cpu-qom.h"
>
> @@ -368,119 +369,6 @@ struct CPUArchState {
>      uint64_t kvm_timer_frequency;
>  };
>
> -/*
> - * map is a 16-bit bitmap: the most significant set bit in map is the ma=
ximum
> - * satp mode that is supported. It may be chosen by the user and must re=
spect
> - * what qemu implements (valid_1_10_32/64) and what the hw is capable of
> - * (supported bitmap below).
> - *
> - * init is a 16-bit bitmap used to make sure the user selected a correct
> - * configuration as per the specification.
> - *
> - * supported is a 16-bit bitmap used to reflect the hw capabilities.
> - */
> -typedef struct {
> -    uint16_t map, init, supported;
> -} RISCVSATPMap;
> -
> -struct RISCVCPUConfig {
> -    bool ext_zba;
> -    bool ext_zbb;
> -    bool ext_zbc;
> -    bool ext_zbkb;
> -    bool ext_zbkc;
> -    bool ext_zbkx;
> -    bool ext_zbs;
> -    bool ext_zca;
> -    bool ext_zcb;
> -    bool ext_zcd;
> -    bool ext_zce;
> -    bool ext_zcf;
> -    bool ext_zcmp;
> -    bool ext_zcmt;
> -    bool ext_zk;
> -    bool ext_zkn;
> -    bool ext_zknd;
> -    bool ext_zkne;
> -    bool ext_zknh;
> -    bool ext_zkr;
> -    bool ext_zks;
> -    bool ext_zksed;
> -    bool ext_zksh;
> -    bool ext_zkt;
> -    bool ext_ifencei;
> -    bool ext_icsr;
> -    bool ext_icbom;
> -    bool ext_icboz;
> -    bool ext_zicond;
> -    bool ext_zihintpause;
> -    bool ext_smstateen;
> -    bool ext_sstc;
> -    bool ext_svadu;
> -    bool ext_svinval;
> -    bool ext_svnapot;
> -    bool ext_svpbmt;
> -    bool ext_zdinx;
> -    bool ext_zawrs;
> -    bool ext_zfh;
> -    bool ext_zfhmin;
> -    bool ext_zfinx;
> -    bool ext_zhinx;
> -    bool ext_zhinxmin;
> -    bool ext_zve32f;
> -    bool ext_zve64f;
> -    bool ext_zve64d;
> -    bool ext_zmmul;
> -    bool ext_zvfh;
> -    bool ext_zvfhmin;
> -    bool ext_smaia;
> -    bool ext_ssaia;
> -    bool ext_sscofpmf;
> -    bool rvv_ta_all_1s;
> -    bool rvv_ma_all_1s;
> -
> -    uint32_t mvendorid;
> -    uint64_t marchid;
> -    uint64_t mimpid;
> -
> -    /* Vendor-specific custom extensions */
> -    bool ext_xtheadba;
> -    bool ext_xtheadbb;
> -    bool ext_xtheadbs;
> -    bool ext_xtheadcmo;
> -    bool ext_xtheadcondmov;
> -    bool ext_xtheadfmemidx;
> -    bool ext_xtheadfmv;
> -    bool ext_xtheadmac;
> -    bool ext_xtheadmemidx;
> -    bool ext_xtheadmempair;
> -    bool ext_xtheadsync;
> -    bool ext_XVentanaCondOps;
> -
> -    uint8_t pmu_num;
> -    char *priv_spec;
> -    char *user_spec;
> -    char *bext_spec;
> -    char *vext_spec;
> -    uint16_t vlen;
> -    uint16_t elen;
> -    uint16_t cbom_blocksize;
> -    uint16_t cboz_blocksize;
> -    bool mmu;
> -    bool pmp;
> -    bool epmp;
> -    bool debug;
> -    bool misa_w;
> -
> -    bool short_isa_string;
> -
> -#ifndef CONFIG_USER_ONLY
> -    RISCVSATPMap satp_mode;
> -#endif
> -};
> -
> -typedef struct RISCVCPUConfig RISCVCPUConfig;
> -
>  /*
>   * RISCVCPU:
>   * @env: #CPURISCVState
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> new file mode 100644
> index 0000000000..c4a627d335
> --- /dev/null
> +++ b/target/riscv/cpu_cfg.h
> @@ -0,0 +1,136 @@
> +/*
> + * QEMU RISC-V CPU CFG
> + *
> + * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> + * Copyright (c) 2017-2018 SiFive, Inc.
> + * Copyright (c) 2021-2023 PLCT Lab
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License alo=
ng with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef RISCV_CPU_CFG_H
> +#define RISCV_CPU_CFG_H
> +
> +/*
> + * map is a 16-bit bitmap: the most significant set bit in map is the ma=
ximum
> + * satp mode that is supported. It may be chosen by the user and must re=
spect
> + * what qemu implements (valid_1_10_32/64) and what the hw is capable of
> + * (supported bitmap below).
> + *
> + * init is a 16-bit bitmap used to make sure the user selected a correct
> + * configuration as per the specification.
> + *
> + * supported is a 16-bit bitmap used to reflect the hw capabilities.
> + */
> +typedef struct {
> +    uint16_t map, init, supported;
> +} RISCVSATPMap;
> +
> +struct RISCVCPUConfig {
> +    bool ext_zba;
> +    bool ext_zbb;
> +    bool ext_zbc;
> +    bool ext_zbkb;
> +    bool ext_zbkc;
> +    bool ext_zbkx;
> +    bool ext_zbs;
> +    bool ext_zca;
> +    bool ext_zcb;
> +    bool ext_zcd;
> +    bool ext_zce;
> +    bool ext_zcf;
> +    bool ext_zcmp;
> +    bool ext_zcmt;
> +    bool ext_zk;
> +    bool ext_zkn;
> +    bool ext_zknd;
> +    bool ext_zkne;
> +    bool ext_zknh;
> +    bool ext_zkr;
> +    bool ext_zks;
> +    bool ext_zksed;
> +    bool ext_zksh;
> +    bool ext_zkt;
> +    bool ext_ifencei;
> +    bool ext_icsr;
> +    bool ext_icbom;
> +    bool ext_icboz;
> +    bool ext_zicond;
> +    bool ext_zihintpause;
> +    bool ext_smstateen;
> +    bool ext_sstc;
> +    bool ext_svadu;
> +    bool ext_svinval;
> +    bool ext_svnapot;
> +    bool ext_svpbmt;
> +    bool ext_zdinx;
> +    bool ext_zawrs;
> +    bool ext_zfh;
> +    bool ext_zfhmin;
> +    bool ext_zfinx;
> +    bool ext_zhinx;
> +    bool ext_zhinxmin;
> +    bool ext_zve32f;
> +    bool ext_zve64f;
> +    bool ext_zve64d;
> +    bool ext_zmmul;
> +    bool ext_zvfh;
> +    bool ext_zvfhmin;
> +    bool ext_smaia;
> +    bool ext_ssaia;
> +    bool ext_sscofpmf;
> +    bool rvv_ta_all_1s;
> +    bool rvv_ma_all_1s;
> +
> +    uint32_t mvendorid;
> +    uint64_t marchid;
> +    uint64_t mimpid;
> +
> +    /* Vendor-specific custom extensions */
> +    bool ext_xtheadba;
> +    bool ext_xtheadbb;
> +    bool ext_xtheadbs;
> +    bool ext_xtheadcmo;
> +    bool ext_xtheadcondmov;
> +    bool ext_xtheadfmemidx;
> +    bool ext_xtheadfmv;
> +    bool ext_xtheadmac;
> +    bool ext_xtheadmemidx;
> +    bool ext_xtheadmempair;
> +    bool ext_xtheadsync;
> +    bool ext_XVentanaCondOps;
> +
> +    uint8_t pmu_num;
> +    char *priv_spec;
> +    char *user_spec;
> +    char *bext_spec;
> +    char *vext_spec;
> +    uint16_t vlen;
> +    uint16_t elen;
> +    uint16_t cbom_blocksize;
> +    uint16_t cboz_blocksize;
> +    bool mmu;
> +    bool pmp;
> +    bool epmp;
> +    bool debug;
> +    bool misa_w;
> +
> +    bool short_isa_string;
> +
> +#ifndef CONFIG_USER_ONLY
> +    RISCVSATPMap satp_mode;
> +#endif
> +};
> +
> +typedef struct RISCVCPUConfig RISCVCPUConfig;
> +#endif
> --
> 2.25.1
>
>

