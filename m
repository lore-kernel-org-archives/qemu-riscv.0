Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81522CDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 03:39:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qulmW-0001tV-Cr; Sun, 22 Oct 2023 23:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qulmT-0001ss-4A; Sun, 22 Oct 2023 23:39:05 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qulmR-0005hM-62; Sun, 22 Oct 2023 23:39:04 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-49ab0641e77so1234525e0c.0; 
 Sun, 22 Oct 2023 20:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698032341; x=1698637141; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tF1MgKOCFK14ezvXAqnC5iepsOjXwv5RD8H609Y53JM=;
 b=ULQlcSzXy9sAXnKaKkIryE35+3ZxytV9Wy4IiKju//3tNghsiRtQ5sWlXCTt1eii2l
 PplzHE7HO7w8/2Sl0sweyuoHHSy93m8634Pon6n6/QCxdJlFZ6FSXQwNoDUpYXG0ChgX
 qNumVYOn8NmK1/nDqNrR+hRG7QHIuuGA/7vp9jXTuQCtq/kyuGbXfxOUkC/q/kE5ot6D
 YdD44oWvymnZS52xFHk5O8GBrYYq5BhOIUI0T5T0xjp1k3UwG8XRgTlCv0qq8WLls2L6
 RaFlcjUV+Xm8qpVeXhu1hHNHijOgzFjNUqgta+vrpo5Ed0kdANVVxd4NR4MKci4lTXPt
 o2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698032341; x=1698637141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tF1MgKOCFK14ezvXAqnC5iepsOjXwv5RD8H609Y53JM=;
 b=TcKn3Q2cZi2UFx023YsADqHzbT+1m5njkYkavViLDkhIX1mfm4MmnWQIOHOtWakxdH
 oyv5i7mzC4LXMCh1H1eJbsnguLajrk17ck7CSDLspbzsdvFDxf4kxfaVruRnO8z/GbKZ
 pzUvhNCIWBU4lrCnGr3mKCe1LoIzvNqc39ln+50YOK12+gln6/yc357WOAiMhbl6Co30
 oqW6Gj4vfVh4/yagoUWfzjQdiCNoaH+5gPYqxXPyvv7D1tzucAVcpOALv3nWGmfiKOar
 kZXoCtiKqENb4egynfTLDDsVrH2n6IpRZFAh3zZIlb7iJr2N3Vn4r8PvP7KMn8D6tK79
 Wfng==
X-Gm-Message-State: AOJu0YwqNEbKjN5kqzyQ/N2Brpxa69scPRXn/XmLFiEH4N0tRE0fk5US
 kPGNllSLABjtrLMT9ryxoZPGcQN9kGl59Fy9wqk=
X-Google-Smtp-Source: AGHT+IH671VPJHeSKljhNE1rTb3KfdayIY2x2TBWyjGB5Hg/GwWbBG7cIgsWl3PsB+zIYHLCtZdGR0VWBIyR81TsBeM=
X-Received: by 2002:a67:ca01:0:b0:457:c46b:8fba with SMTP id
 z1-20020a67ca01000000b00457c46b8fbamr7437149vsk.5.1698032341511; Sun, 22 Oct
 2023 20:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231017221226.136764-1-dbarboza@ventanamicro.com>
 <20231017221226.136764-5-dbarboza@ventanamicro.com>
In-Reply-To: <20231017221226.136764-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 13:38:34 +1000
Message-ID: <CAKmqyKPMzGC7G6hjSG_-nmHQsL0R9ztYtOrUc+_kXZXAHxAnVQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] target/riscv/cpu.c: add zihpm extension flag
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Wed, Oct 18, 2023 at 8:14=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> zihpm is the Hardware Performance Counters extension described in
> chapter 12 of the unprivileged spec. It describes support for 29
> unprivileged performance counters, hpmcounter3-hpmcounter31.
>
> As with zicntr, QEMU already implements zihpm before it was even an
> extension. zihpm is also part of the RVA22 profile, so add it to QEMU
> to complement the future profile implementation.
>
> Default it to 'true' for all existing CPUs since it was always present
> in the code.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c     | 3 +++
>  target/riscv/cpu_cfg.h | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f478245254..c64cd726f4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -84,6 +84,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_zifencei),
>      ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
> +    ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_zihpm),
>      ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
>      ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>      ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
> @@ -1185,6 +1186,7 @@ static void riscv_cpu_init(Object *obj)
>       * users disable them.
>       */
>      RISCV_CPU(obj)->cfg.ext_zicntr =3D true;
> +    RISCV_CPU(obj)->cfg.ext_zihpm =3D true;
>  }
>
>  typedef struct misa_ext_info {
> @@ -1274,6 +1276,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[]=
 =3D {
>      MULTI_EXT_CFG_BOOL("svpbmt", ext_svpbmt, false),
>
>      MULTI_EXT_CFG_BOOL("zicntr", ext_zicntr, true),
> +    MULTI_EXT_CFG_BOOL("zihpm", ext_zihpm, true),

Same here. Just make this change after or with the logic to disable
the extension

Alistair

>
>      MULTI_EXT_CFG_BOOL("zba", ext_zba, true),
>      MULTI_EXT_CFG_BOOL("zbb", ext_zbb, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 3c91b63609..173bd7d910 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -69,6 +69,7 @@ struct RISCVCPUConfig {
>      bool ext_zicond;
>      bool ext_zihintntl;
>      bool ext_zihintpause;
> +    bool ext_zihpm;
>      bool ext_smstateen;
>      bool ext_sstc;
>      bool ext_svadu;
> --
> 2.41.0
>
>

