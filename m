Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF06C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 00:10:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF1Cm-00017F-T2; Sun, 17 Dec 2023 19:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1Cl-00015g-Fp; Sun, 17 Dec 2023 19:09:55 -0500
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF1Cj-0003rr-RD; Sun, 17 Dec 2023 19:09:55 -0500
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-7ca9c5921ceso673052241.1; 
 Sun, 17 Dec 2023 16:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702858192; x=1703462992; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I79oP+kXZSmFq3WOKNiCM/ttcvZYYLuZYvELtmi6dDQ=;
 b=Wec592rOW6ovECARLoviY1olYRtsTUGBEudILhLaSMCZXc1MtPKuWFxO2PvTsfkaZw
 IFG362zP3vxWuatRFVS9NFBm3t9I3rQS7ocybITIEyGvAEq7V/vVuqp6gsMTBBQ1jn3L
 4zlZbRnzLWmiS6ZvWy5eIgEeege0l0+PL0BB720eKVg4fq7X94dQiDD3w12/7q3JPhjK
 PPRDRChEnrcKpFdquU5KpvSIkLmjDsZYJsM52rPzDZVBkDM4Wp9x3Cxs5KGhRsXKSGwE
 hEeSegueEEv5Ko0MQU4zaxe4yB8j5LHLT5ex6YufXDB7M8R8ryokRAlNTfXeY5pniO7Y
 2MLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702858192; x=1703462992;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I79oP+kXZSmFq3WOKNiCM/ttcvZYYLuZYvELtmi6dDQ=;
 b=eD78z0X4uDQLQcc72qToMZTWT9J2UU+P5IFhokNNiintDZ/IkcM+vRkj4L9qy7mPnZ
 jJphrSVApD40f/0kOaRJG/ahqzy4RZ5E/lIqKrLmsltAnUIr/vM+uXUe9e4yJO67PoN4
 G639LRHKlQByExRWFAjdI9PxvYqHEqaIzWKZpBKzDveuDjCSbCHp4NkMn7wP1CjimTzE
 5SQ7mYxgZBLtIv77ATygAqh9xz9AU/LBx2uC0e9nJ2ae8rj/rsRt8uKUVdrk3hylrjSf
 4g4i35Dlj7xvP+SMuaPeZt6gd7Kz7CDmPHgvjd26IsRjfZI2ngGJ4DvN68TLD3lAYmQa
 18vA==
X-Gm-Message-State: AOJu0Yz8D1V8IEQrVeI+k4OnaYEjC4ah0ZxZ+H3TM3ZdAqRMRgfsgjg+
 GvkTJY2Gj5GmqS0W4qXBTomDdajAq5WQbQr3Pg0=
X-Google-Smtp-Source: AGHT+IG64y9LD++SBpCuPqZws5YuoPPLP8Gogm1SLOHCp0LmoHpP2OZjEgTWpoCTsB0y7FkiieZco/9LYEfYGdVBysU=
X-Received: by 2002:a05:6102:54a4:b0:464:6018:abc5 with SMTP id
 bk36-20020a05610254a400b004646018abc5mr13634716vsb.5.1702858189333; Sun, 17
 Dec 2023 16:09:49 -0800 (PST)
MIME-Version: 1.0
References: <20231208183835.2411523-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231208183835.2411523-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 10:09:22 +1000
Message-ID: <CAKmqyKPZL9TqKda_d+W-oBuQFdyoSJASz+7FqNa8dkeT_YfNow@mail.gmail.com>
Subject: Re: [PATCH for-9.0 0/5] target/riscv/kvm: fix KVM reg id sizes
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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

On Sat, Dec 9, 2023 at 4:40=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> While working in a follow-up for the Vector KVM regs, where we would
> read 'vlenb' and then all other vregs [1], Drew noticed that we're using
> kvm_riscv_reg_id() in registers that are u32 and u64.
>
> The helper is returning ulong regs for all cases, meaning that we return
> the wrong size for u32 regs when running 6 in 64 bits (case of FP_F
> regs) and u64 regs when running in 32 bits (case of FP_D and timer
> regs).
>
> It's best to do a quick bug fix round in the KVM reg IDs before adding
> more IDs, so here we are.
>
> This is marked as 9.0 because the fixes aren't critical enough to
> postpone 8.2. Michael, patches 1, 2 and 3 are good candidates for
> 8.2-stable.
>
> Alistair, in case these are accepted I'll re-send "[PATCH for-9.0 0/4]
> target/riscv: add RVV CSRs" based on these fixes to avoid conflicts in
> the tree.
>
>
> [1] this is dependent on kernel side changes that are being discussed
> here: https://lore.kernel.org/kvm/20231205174509.2238870-1-dbarboza@venta=
namicro.com/
> ("[PATCH v3 0/3] RISC-V, KVM: add 'vlenb' and vector CSRs to get-reg-list=
")
>
>
> Daniel Henrique Barboza (5):
>   target/riscv/kvm: change KVM_REG_RISCV_FP_F to u32
>   target/riscv/kvm: change KVM_REG_RISCV_FP_D to u64
>   target/riscv/kvm: change timer regs size to u64
>   target/riscv/kvm: add RISCV_CONFIG_REG()
>   target/riscv/kvm: rename riscv_reg_id() to riscv_reg_id_ulong()

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/kvm/kvm-cpu.c | 109 ++++++++++++++++++++-----------------
>  1 file changed, 59 insertions(+), 50 deletions(-)
>
> --
> 2.41.0
>
>

