Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA81AC43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 02:42:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1we1wI-0001Aq-MW; Sun, 28 Jun 2026 22:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we1wA-0001AJ-8I
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 22:41:31 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1we1w8-0007Zd-MD
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 22:41:30 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-691c5776f95so4835515a12.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 19:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782700887; cv=none;
 d=google.com; s=arc-20260327;
 b=XxCpqu/KjvrMRrpSedIFg5a/9mIC5m6vOjGoWlbHA4bAQRsgFNIIpobB33d11CvDOd
 gc1YWqoVV/+jAQ1C11MAezohmeENDd2lmrVK1dQfBJSVaf6PKgo8wmjzjRqco+7sR1Eb
 ShllYYkjlaJhboqbQfzWz9nmwwEmnZl3zi0WePC8bPMosYferMgitlLv9auOcW7/66rK
 ED8Y3vWz/aLcJoV1W/zqYEngOaKFg0rcle++k5SL4b+JclM+wQyFe1ZIrHQavrW0kIJO
 trZZ+qMKFobUQGWIx/AaB6fw909IJTyzyl5GIou/V8wl09HNSgQVT7ZGrjHKrTRbC0Hw
 BOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=bBv1I/ZO1y/i1zHZqaZCewy9Qr2VDqFLv9ENiF1z5zQ=;
 fh=3syI/4bwaTkZhioZOxk2vDA+oFf4S1RJ0OvAODZKdQ0=;
 b=V+EqT+CEV/snTaBWnwJj4YXfN2qV4nNDu3AOygY8BOtUUXD719fkZokC/ndJMwSOCv
 9zzb8n432jWcwuCXZB2Uyx2GdgynL7xO41MBuQfqlVPsZj3hGsl+C8vHnyj/6xaWMuT4
 PuJwz76aS37B2ss+oHc/NVyHbr5tEWpg/1yxuR7sF15hcuwQrvI0cxOHv8Hv3MravI2y
 U5pigzlsY43ggEOQuG34Fv4ZISnMF3WYdQK2TM/p3Y24PoicfHBaZJIoLEi222wy0gqz
 CMa4kUY7FtG96iDNaPZjS3nz+WroYF+7wKo4WUge7a0xelvSdEnb3g5PZbTjAgITuQJ7
 iWbQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782700887; x=1783305687; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bBv1I/ZO1y/i1zHZqaZCewy9Qr2VDqFLv9ENiF1z5zQ=;
 b=OGv93KUPHe75jNVBqM9wGrU4vQQiexXH3ehUY6Yhlosh2pzzgPUROqGSE8RGe0WPQS
 oOXVoUUWZxSuZ7qwToR7sGfGe+l5DtN3WMQ/OvJ7QrEYOZOfLngRMFIBEFyLsrFcazGH
 4aSKMuD8HyMpImOGTpW1FeXsdTq8w1dbgOIx4Fvfo5tb0/zApmhSZ/vYl6Z5WwbiyA0b
 cxcpfJrCvCZtgTRcUZnoRP6+vSCcydqOsj2XjjvXL2KT54+0tFfohDGlismZ9llYnAM6
 JGFcNa6nViaqSO9k23iUhnjoFsKSiNWyB5yVbg5MX4njnHXPBrDPDMPCHL0eHMPIvPXr
 zBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782700887; x=1783305687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bBv1I/ZO1y/i1zHZqaZCewy9Qr2VDqFLv9ENiF1z5zQ=;
 b=Gef04AmpW/QFWiVKh3Pn0z218LndnbS/Z6gnUAmxyFfTmN0cFCd1h20McSFT09QFkG
 Ssq1+zb98oNGjlbfzWzmEtJYatKfGw3TZbrqCQJmco0dyIMSC+E/rbyCAuzFMgCvMDKk
 xQGOJiN3b+ZyWNH50Qj18Yz/jP4cp5sw5dhc7omhDtHbe06kgLnkBiAf8EjnAftq3VwJ
 qWeYo1NNqq+3CEcmwXvcbv8DdmSKg7sBh9ohg/twchlowgHcO1atSel3i+8uCrK0muB7
 jItiVF2SnkRI2gdd7dshC9ZzPbIXwY4JG3LAZNznYoPjFBfz4lYHYb/J09Cs0fQHu9zi
 ywmw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrzlkptkJ+a16mstqENnk3gDX6TWDhYaL9g84x7ZQUqpHzO/DYE9viCZkOVBIX3X2cvqtYOVk5mgCu9@nongnu.org
X-Gm-Message-State: AOJu0Yxz6domxM7nS86uk+2ZvFx8DfYdTK/OLl8PyT80I8diQTxPjTpc
 JpzCwX03CEeelyStk1PwpfI08ZULk86/aYKfUkLkg8Bdm0jrIFFhq4FcZkuVN3+Nfp1llZUXti8
 p4rKWdy6ZMLBfJIj12dhRSpM7mFbWL10=
X-Gm-Gg: AfdE7clcscX7dsKOVYPnmOTO4NbzGhe8Eu/IEkAqisuJj5ob0Gt/qEKgNGCJYQ0TFh4
 7LvaWEWAyGhfvnzu/LBC5W5sfainMDr410twqm8muv+5Bn1qv8HqwQ5d+iijDT87jXc/YGYB7rT
 2g+zZ8CQDzz0sc/ao+gejzDQ2lOn/ZNnDbCxeYPXB76SNJuPLHovG3bDZm4alLSBtmliP3rXHyq
 lt6ZuAVRQGQupy1d3zk1zaMORuuu4ZASnXTtHT2IJ+bkpxavn1F4YFA1U2Al29aRnTbrjArGtrZ
 018uVHtR+biWtdFJvadfXiX+nqE=
X-Received: by 2002:a05:6402:5207:b0:697:560b:f6b2 with SMTP id
 4fb4d7f45d1cf-69810a157dbmr5477045a12.4.1782700887069; Sun, 28 Jun 2026
 19:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260622065717.15386-1-wang.yechao255@zte.com.cn>
In-Reply-To: <20260622065717.15386-1-wang.yechao255@zte.com.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 12:41:00 +1000
X-Gm-Features: AVVi8Cd1PPCiwz-wImhBZ3i32lzdKbi7DkqxbDKf41eQ5lhqgTo2l7_tAYxToOs
Message-ID: <CAKmqyKMhqavLeDj7fy-JpY8WGKO0m_o+94UMPX2sBK5Ldsid4w@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv/kvm: add extensions after v7.1-rc4 update
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x533.google.com
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

On Mon, Jun 22, 2026 at 4:59=E2=80=AFPM Wang Yechao <wang.yechao255@zte.com=
.cn> wrote:
>
> Expose zilsd, zclsd and zalasr.
>
> Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changes in v2:
> - Rebase on https://github.com/alistair23/qemu/tree/riscv-to-apply.next
>
> ---
>  target/riscv/kvm/kvm-cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index f0de5c3071..707b992d55 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -304,10 +304,13 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
>      KVM_EXT_CFG("zihintntl", ext_zihintntl, KVM_RISCV_ISA_EXT_ZIHINTNTL)=
,
>      KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINT=
PAUSE),
>      KVM_EXT_CFG("zihpm", ext_zihpm, KVM_RISCV_ISA_EXT_ZIHPM),
> +    KVM_EXT_CFG("zilsd", ext_zilsd, KVM_RISCV_ISA_EXT_ZILSD),
>      KVM_EXT_CFG("zimop", ext_zimop, KVM_RISCV_ISA_EXT_ZIMOP),
>      KVM_EXT_CFG("zcmop", ext_zcmop, KVM_RISCV_ISA_EXT_ZCMOP),
> +    KVM_EXT_CFG("zclsd", ext_zclsd, KVM_RISCV_ISA_EXT_ZCLSD),
>      KVM_EXT_CFG("zabha", ext_zabha, KVM_RISCV_ISA_EXT_ZABHA),
>      KVM_EXT_CFG("zacas", ext_zacas, KVM_RISCV_ISA_EXT_ZACAS),
> +    KVM_EXT_CFG("zalasr", ext_zalasr, KVM_RISCV_ISA_EXT_ZALASR),
>      KVM_EXT_CFG("zawrs", ext_zawrs, KVM_RISCV_ISA_EXT_ZAWRS),
>      KVM_EXT_CFG("zfa", ext_zfa, KVM_RISCV_ISA_EXT_ZFA),
>      KVM_EXT_CFG("zfbfmin", ext_zfbfmin, KVM_RISCV_ISA_EXT_ZFBFMIN),
> --
> 2.43.5

