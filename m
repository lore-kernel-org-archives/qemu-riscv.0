Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E56E68958
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 07:34:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t6PhW-0000Sd-FV; Thu, 31 Oct 2024 03:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1t6PhU-0000SI-Sp
 for qemu-riscv@nongnu.org; Thu, 31 Oct 2024 03:34:36 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1t6PhS-0001dd-W8
 for qemu-riscv@nongnu.org; Thu, 31 Oct 2024 03:34:36 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c9150f9ed4so881497a12.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Oct 2024 00:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1730360073; x=1730964873; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UoQN4iT4gTzwWnl09f3NqTDnzxnJgkDIG72NX5WJiWw=;
 b=l51XBP83EHSUpN2eCHJp2hw5jb5l0JZf85bIdI53MyXEpPPLBgabnKUezHAh0hJmzP
 053ADZUw7yKK+lXe7OhWLQo5fdOQ4fzuqZyHWbQ6TyJF0du1crAPgO93AggrJewYZEm8
 xSIYE7+siMWNtGPnEgud8Vdu7HD9aZ2Gq8CzNwjPtQcGdnpZ1d5gZ6mBEmBYEKLIlz9i
 3z4oYWs1eom7W8oqSEUPPWTVVF3FrDU8feA8FX/B4pYaCVjwJ7U2JiVeyr/ixRGrZf7N
 Tml2u6WFj0YpK3tb67tIlz+4R9FpPiOsDlkY8uuuhqgqiA5nw+z4AC2EZ1ZFN2t+1gec
 g5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730360073; x=1730964873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UoQN4iT4gTzwWnl09f3NqTDnzxnJgkDIG72NX5WJiWw=;
 b=mx7HT1MUyHXTJcTbySMEl/DCVTYE9Iqfy6VT0vyCMaNqCb0uwikr5RZsVreiuo9qMA
 wir1G1G5e/J49XNuH6ky+EUnA6ZqhQbyuKZXXrYzLn79CXog2fal3ool3RY7dvjoB1kp
 9h+Q7E6j5dVugzWNnNwglXtPZh5KluVs5KHk3Wnv1Q0ZHCt8PajNqnC5Bd9Zh4mF+POe
 6YRazusrsEVfUSdVkS+y1fJnHnygTVitEZ70nAA439lMTIAXdYr7G5rMLSENiJCQsPus
 vAhrQG2YDiVcmYDsgWPx44A+7YkkPzW6SmPGEN8EDFmqVtlygaVRUOu9bBe26d5eAuiP
 A05g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0M+UfprK8wYRcu6Y4cMM3PSRgoHwrBnDm5jSXoBmLgDZbkWCUTXlmn1ZocSoIrb+qwTEKzYyUpKfm@nongnu.org
X-Gm-Message-State: AOJu0Yy4/4zsPrkEo4dRwvVp2J/NAPl2SolqrBZU7YV4TBszhomrjeC1
 Vxx6yzDLNgLW4cDE8aB5bboFpFUZj2478IIgjyeZV8JnJEaQMmZ3Kj08k/q8kwp1aEvORNtBPdw
 n5QdNTUWyl0diJ+9N6RvhO5ghomAxMx7lOXsuoA==
X-Google-Smtp-Source: AGHT+IE6q4N5QD01vq+Snq0t7SBLtNYV+YfSLW0RsDVoV8ysIRayguChgtPC1My0jxu738mVWCXdSx1F0Si349Ci8+0=
X-Received: by 2002:a17:907:3d90:b0:a9a:26dd:16bc with SMTP id
 a640c23a62f3a-a9de5c91003mr1953595966b.5.1730360072825; Thu, 31 Oct 2024
 00:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1727164986.git.zhouquan@iscas.ac.cn>
 <ada40759a79c0728652ace59579aa843cb7bf53f.1727164986.git.zhouquan@iscas.ac.cn>
 <20240924-4ed57d7311448f6bc23f7cdf@orel>
In-Reply-To: <20240924-4ed57d7311448f6bc23f7cdf@orel>
From: Jim Shu <jim.shu@sifive.com>
Date: Thu, 31 Oct 2024 15:34:21 +0800
Message-ID: <CALw707qjrRm9RMWCb+CdEeoU5XxDp4rci_ueM4dRNihCn0H3SQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv/kvm: Update kvm exts to Linux v6.11
To: Andrew Jones <ajones@ventanamicro.com>
Cc: zhouquan@iscas.ac.cn, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, bmeng@tinylab.org, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com, dbarboza@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Reviewed-by: Jim Shu <jim.shu@sifive.com>

On Tue, Sep 24, 2024 at 9:24=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Tue, Sep 24, 2024 at 04:30:01PM GMT, zhouquan@iscas.ac.cn wrote:
> > From: Quan Zhou <zhouquan@iscas.ac.cn>
> >
> > Add support for a few Zc* extensions, Zimop, Zcmop and Zawrs.
> >
> > Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> > ---
> >  target/riscv/kvm/kvm-cpu.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> > index f6e3156b8d..428aaee552 100644
> > --- a/target/riscv/kvm/kvm-cpu.c
> > +++ b/target/riscv/kvm/kvm-cpu.c
> > @@ -281,7 +281,10 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
> >      KVM_EXT_CFG("zihintntl", ext_zihintntl, KVM_RISCV_ISA_EXT_ZIHINTNT=
L),
> >      KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHI=
NTPAUSE),
> >      KVM_EXT_CFG("zihpm", ext_zihpm, KVM_RISCV_ISA_EXT_ZIHPM),
> > +    KVM_EXT_CFG("zimop", ext_zimop, KVM_RISCV_ISA_EXT_ZIMOP),
> > +    KVM_EXT_CFG("zcmop", ext_zcmop, KVM_RISCV_ISA_EXT_ZCMOP),
> >      KVM_EXT_CFG("zacas", ext_zacas, KVM_RISCV_ISA_EXT_ZACAS),
> > +    KVM_EXT_CFG("zawrs", ext_zawrs, KVM_RISCV_ISA_EXT_ZAWRS),
> >      KVM_EXT_CFG("zfa", ext_zfa, KVM_RISCV_ISA_EXT_ZFA),
> >      KVM_EXT_CFG("zfh", ext_zfh, KVM_RISCV_ISA_EXT_ZFH),
> >      KVM_EXT_CFG("zfhmin", ext_zfhmin, KVM_RISCV_ISA_EXT_ZFHMIN),
> > @@ -292,6 +295,10 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
> >      KVM_EXT_CFG("zbkc", ext_zbkc, KVM_RISCV_ISA_EXT_ZBKC),
> >      KVM_EXT_CFG("zbkx", ext_zbkx, KVM_RISCV_ISA_EXT_ZBKX),
> >      KVM_EXT_CFG("zbs", ext_zbs, KVM_RISCV_ISA_EXT_ZBS),
> > +    KVM_EXT_CFG("zca", ext_zca, KVM_RISCV_ISA_EXT_ZCA),
> > +    KVM_EXT_CFG("zcb", ext_zcb, KVM_RISCV_ISA_EXT_ZCB),
> > +    KVM_EXT_CFG("zcd", ext_zcd, KVM_RISCV_ISA_EXT_ZCD),
> > +    KVM_EXT_CFG("zcf", ext_zcf, KVM_RISCV_ISA_EXT_ZCF),
> >      KVM_EXT_CFG("zknd", ext_zknd, KVM_RISCV_ISA_EXT_ZKND),
> >      KVM_EXT_CFG("zkne", ext_zkne, KVM_RISCV_ISA_EXT_ZKNE),
> >      KVM_EXT_CFG("zknh", ext_zknh, KVM_RISCV_ISA_EXT_ZKNH),
> > --
> > 2.34.1
> >
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>

