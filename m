Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAFACDB466
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 02:40:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbUZu-0004Q3-Q1; Sun, 21 Jun 2026 22:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbUZt-0004On-1d
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 22:40:01 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbUZm-0007Ac-B9
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 22:39:55 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-bec49f7e35eso541034566b.2
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 19:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782095992; cv=none;
 d=google.com; s=arc-20240605;
 b=aAiI5meQdSSVQD4kCwovPC4SQAZOkelv+9yXCmfKqAbU/25N+vCiaqJ8bKHSqr/QHp
 AhtGtzAtAMQWvZbypbNNkj0KRRc0kkTPanLfq5NRWtowdrUdgaikGM7miZ37B7jAB+1O
 xwBSDHimJEy3ozRJkbPvByS2uJXpVa7Fo2IYRVQh3/WgPwW+VdW5UuxJnJxandpznLQU
 MBTaT4tCiTs+VNse5j6o5A38raajtVtV+ww1eOLpc4ZZvmuH5dqw1CbrKhF06dcDl8ge
 tWAqxwpjsZj/oaBgqQHLMWdcIwFs1LCfuP13GteGPLlZ2jKvwKU8OkEHA+yitMPErnx0
 eLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=BfBCEKNx6wiLcALwkO2rf5NF+oLg7W772NfbvvJ+zKc=;
 fh=82pCs+uaf5Bbw29Nb0Zqq3Hl6G9vDHF5ywcQBAG9ra4=;
 b=D7VbWHFWS8fDT837oOakSP6OgAxpwZwKXIzk6juJcZvh0kLy4E0xeIl1LosGhA4M83
 JsOBGr39R48vEXhplQaGY/q8enSd2G2KJC36eeRZHvk13B7FbuMHzvnvf7vdxCbfL/bt
 fc6ck+0fbwt+7ijHgTeAkoJd9ZqClA2yVaizHdZM6vK9fyicz1Z998n68gLCE/kRXX+Y
 bcDyWBbcM3maSgR4vngtUlF72rhyNbWDgQt93heCksVKIfh/5QrsmkiiCq6uARG74OIQ
 g+DzdtwBF6rNuFY4xEui1wBV7wWsqypC8pJWk42IK1K9Mbv69XepsQG9BkJ7uN/KxMDu
 z8BA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782095992; x=1782700792; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfBCEKNx6wiLcALwkO2rf5NF+oLg7W772NfbvvJ+zKc=;
 b=X5Pw44VqRZkc3NDcfw/9NtdJEUMjgFNfIjur0kmUUS4Sh23TX1wZPViscpC8vkDvQb
 PIfM1Ft/NV7Vl5RypEX2zuzPLp/QNzKcUApfBl3C8Osg6U4WllJqyuNH9PhBg7AJSP1H
 xKTLCDNkJSp9V9FGmRjzi0vJOhpzxtaod+muByqeoCMDqYEXKS2OIJvmxEFBlPaHPdpP
 mzQqm97ep5s0LC34SGnf2hsnclkBmGNEzsGvQYgjosMunEjoUTCgIew5RzDIDXgEv6lV
 y/BxDLDG7jcvdmJdZWoWxyeQHiV/h+32TFP0Trv9EFButQ3yexSQzD5vM7Hyc5sHH9yG
 /BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782095992; x=1782700792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BfBCEKNx6wiLcALwkO2rf5NF+oLg7W772NfbvvJ+zKc=;
 b=r/1Ns5+uFtPTk84+cOd3qcXoTh0PrFKAbp1NH9FI98TaP40yIkD5PhxCNXTirDx0wa
 MmEDYzbMrBOrdMz1FqFv8VeWyKeP8392XXJJT3XvSymwGJ01J0IKeYOajnuvrH+LQOw1
 Hu7/duAwKadUtnN0Xx7I4PYqIwqQl/RVCoqr+ecDF/MIVshotUbfG3wx4NaVxYGOYhtR
 MkBMeKcUBaiSqekIcjsoLW3ps2Uo+x+90iC8UQEPSPGNRQupCPnAC0XG9sXO1eQ1wXoK
 kkuh7rDGF+M4JJ8bFjD9o8bFeU7aM6zUIb7WtpqNtGM9siaolyju7rrNSn/HPRMedtxW
 RW+g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Zi5eWiRjq/zW2FtI8fqUR6zZwQY0cqqSt9ZlqXzp0UPiV3vPyU0la3Eh05mXOKIasehgES4xIIsbc@nongnu.org
X-Gm-Message-State: AOJu0YxHJfsJNQNmz256Xzsivr3ePacuAhD48Aph9dE/Xg6zAfCICzoL
 j1NrMc/DGcqK6BnCxc0sb9ZSkxSsfVSVky1kBiEhzB/FcJWoR2DBInZEgmDILf/PgX1L+PK40Y7
 6ghqSqmedf50b1jCh6I0WGtP1aN+++8w=
X-Gm-Gg: AfdE7ckspOdFq+6NIuE+LUtcKeLd+lQvVPCHCuS2z5aEStaH2MESRBFXBZsC17M4YlJ
 GC5gTXTqkSWqVy6Pvr3cfcaM9060Jx3ObunhoqzInGUBFsG9PDrGmwBVb1nrbiD3mPWFMFPCQqZ
 4QJWiKJ8fr42WJcAqAIoPpI23n+vysuXxQ6bY0nXbgvK4AvptsW6LjiiD1bk8i4GKUmkwI225w5
 rd4Ho9Wt8oGPBXeW2qgqiJCHEbEcxnzOboxCJQtxI9iltzwiMM4fop/+dcIX36mBvv4oqIvqnVd
 f5HhVimhC6GY+537bpdapBDvieY=
X-Received: by 2002:a17:907:3e18:b0:c0e:e136:5dc9 with SMTP id
 a640c23a62f3a-c0ee145c108mr68722966b.37.1782095992306; Sun, 21 Jun 2026
 19:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260611162223.2361941-1-daniel.barboza@oss.qualcomm.com>
 <20260611162223.2361941-2-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260611162223.2361941-2-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 12:39:25 +1000
X-Gm-Features: AVVi8Ccy8TPAP1bOVGvSPAkHXWbio7X2Ttuuc6fQ9wqPh-E7ghyRlJT7Vc0zn9c
Message-ID: <CAKmqyKM_KdpFevyDT_T_xppAcaEU7qzyzdK3SZnFrr1JhSyqeQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv/cpu.c: add 'svbare' satp-mode
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Jun 12, 2026 at 2:23=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Seems like we forgot to add a flag to set satp-mode=3Dbare.  What we're
> doing instead is to set the CPU default satp-mode to 'off' to set it to
> bare ... assuming we know the default satp-mode.  Otherwise one needs to
> do -cpu X,sv39=3Doff,sv48=3Doff,sv57=3Doff,sv64=3Doff to get a bare-mode =
CPU.
>
> Add a flag to make this process easier.  The name choice is based on the
> fact that I didn't find many references to 'mbare' in RISC-V docs, but
> 'svbare' is a flag name that toolchain uses to set satp-mode=3Dbare.
> Might as well use the same name to help with cross project compat.
>
> After this patch:
>
> $ ./build/qemu-system-riscv64 -M virt,dumpdtb=3Dfdt.dtb -cpu rv64
> $ dtc -I dtb -O dts fdt.dtb  | grep mmu-type
>                         mmu-type =3D "riscv,sv57";
> $ ./build/qemu-system-riscv64 -M virt,dumpdtb=3Dfdt.dtb -cpu rv64,svbare=
=3Don
> $ dtc -I dtb -O dts fdt.dtb  | grep mmu-type
>                         mmu-type =3D "riscv,none";
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c1b10cc7ef..d968daa404 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -421,7 +421,7 @@ int riscv_cpu_max_xlen(RISCVCPUClass *mcc)
>  #ifndef CONFIG_USER_ONLY
>  static uint8_t satp_mode_from_str(const char *satp_mode_str)
>  {
> -    if (!strncmp(satp_mode_str, "mbare", 5)) {
> +    if (!strncmp(satp_mode_str, "svbare", 6)) {
>          return VM_1_10_MBARE;
>      }
>
> @@ -1053,6 +1053,9 @@ void riscv_add_satp_mode_properties(Object *obj)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(obj);
>
> +    object_property_add(obj, "svbare", "bool", cpu_riscv_get_satp,
> +                        cpu_riscv_set_satp, NULL, &cpu->satp_modes);
> +
>      if (cpu->env.misa_mxl =3D=3D MXL_RV32) {
>          object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
>                              cpu_riscv_set_satp, NULL, &cpu->satp_modes);
> --
> 2.43.0
>
>

