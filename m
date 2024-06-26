Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D34C2BBCA
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 01:45:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMHiR-0006g5-Bc; Tue, 25 Jun 2024 21:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sMHiA-0006eI-Cd
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 21:44:39 -0400
Received: from [2607:f8b0:4864:20::32a] (helo=mail-ot1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sMHha-0006J9-WC
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 21:44:34 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-700cd57a9fbso367813a34.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 18:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719366195; x=1719970995; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dZcH95/6aWpbDxh9dDlhrAjV7CtVT90I9hov7rHSLvk=;
 b=c9G0PVaBSUvCTjPndPWxWErEBeyt2q89rSazJtKhMRv+28sE6rLd3GuP3tF03XA1mA
 s9NIU5vaB35gfAR/9DWF11PznwE4HwvqRVfite0mQpR44LX3bAKSUYo96Ns66wwFkMK4
 ysfe04g/m2+9ijwDxt9hqFJ6X54prUBPMP/jxQF9+9Z5ohHa1KlszpBxCJ0gMxEYvUUl
 4sGHd1zll4fWb7yB15vFXuCFHPWcdAPiEeOn5IiHFX5a0c4qberstrl/8hy1TmjOLfgR
 H9LvZ0fh7kh8bccAEQ1HCRPa+DMqBlDg53R2UbEo3XcNp9zH+kpTMIhfJ5icBgbOqCEs
 QaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719366195; x=1719970995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dZcH95/6aWpbDxh9dDlhrAjV7CtVT90I9hov7rHSLvk=;
 b=iuq5tK/TsMqaU+zVkX8D5Odeu7V8dzyGVgRj2+6gkXEEuBIeQbncNCoFmDlbGOSUgZ
 OrQXftwferEC/KyWeYnh61mbEujIHcnM8q6gkgaUINmUEs1gxlCSPP429VRiietGF88M
 cnBAtOvXmiaSrvVQ5hS5yhNkgmMBaIGtbZhQDKoJRCD5vKLQ7fa539NEM1PcUKA+oBpU
 zmRaI7DxJ1EN1h6yoFkbZPMBmV5u6kdjcc14hxanHWROuhNLmVGtr5QZ+0zLFfieNNRC
 QwPU9kNDqylFFBpfGvaf9SJ7AmuhGc2wWf5IOWUi4tXTWwussekxyzMhRqAh8GiKTw0f
 P21Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZcRPuhFNYTy4N5f8ytWfmmgCQAkBtocMrlwHmk54ItmRZw0RklBahQQI0pQUNePvLIfhvMr1229YaO/+zJ72uZDicd+4=
X-Gm-Message-State: AOJu0YxhcH0POvFa5C1LfLbHS6FQmtyTSc2HkZHlKZlUB1/E62lY7sPC
 uotJCl8JxCxpydzA+XXJ7GK+1ylD9XPoUuQ6woQ3kFIvDX4h1FvWFkt9IOTwKFfWID2GmR+Reep
 dxhtWt+Wthjeqog/QluCk9M38PovETw==
X-Google-Smtp-Source: AGHT+IHiuJ6+oPZPZqOF+PHfHIPrbnadCcn4WpykISlLBad9HY4A5aOWSbRvOu0FDY3MG2ZRXVRpBAfaspPK6iDjyDE=
X-Received: by 2002:a67:eb02:0:b0:48f:44fe:734 with SMTP id
 ada2fe7eead31-48f52b9d88amr8772966137.27.1719362772260; Tue, 25 Jun 2024
 17:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240625114629.27793-1-frank.chang@sifive.com>
In-Reply-To: <20240625114629.27793-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Jun 2024 10:45:45 +1000
Message-ID: <CAKmqyKNuhtzzOU78phTKfq8qEMo53F1oPbu6iCYO-Nmmtr_XZg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Introduce extension implied rules
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32a
 (deferred)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPOOFED_FREEMAIL_NO_RDNS=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Tue, Jun 25, 2024 at 9:48=E2=80=AFPM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Currently, the implied extensions are enabled and checked in
> riscv_cpu_validate_set_extensions(). However, the order of enabling the
> implied extensions must follow a strict sequence, which is error-prone.
>
> This patchset introduce extension implied rule helpers to enable the
> implied extensions. This also eliminates the old-fashioned ordering
> requirement. For example, Zvksg implies Zvks, Zvks implies Zvksed, etc.,
> removing the need to check the implied rules of Zvksg before Zvks.
>
> The idea [1] and the implied rules [2] are referenced from LLVM.
>
> [1] https://github.com/llvm/llvm-project/blob/main/llvm/lib/TargetParser/=
RISCVISAInfo.cpp#L875
> [2] https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/=
RISCVFeatures.td
>
> Changelog:
>
> v3:
>   - Replace the enabled bitmask of type 'uint64_t' with a dynamic bitmask
>     to support more than 64 harts.
>   - Ensure that implied rules and hash tables are initialized/created onl=
y once.
>   - Rename variables to align nomenclature with existing variables:
>       - In RISCVCPUImpliedExtsRule structure:
>         - 'implied_misas' -> 'implied_misa_exts'
>         - 'implied_exts' -> 'implied_multi_exts'
>       - 'misa_implied_rules' -> 'misa_ext_implied_rules'
>       - 'ext_implied_rules' -> 'multi_ext_implied_rules'
>       - 'riscv_misa_implied_rules' -> 'riscv_misa_ext_implied_rules'
>       - 'riscv_ext_implied_rules -> 'riscv_multi_ext_implied_rules'
>
> v2:
>   - Remove enabled bitmask from user-mode QEMU as there's no good way
>     (e.g. mhartid) to distinguish the SMP cores in user-mode QEMU.
>   - Use qatomic API to access the enabled bitmask to prevent the
>     potential enabled bit from being cleared by another hart.
>
> Frank Chang (6):
>   target/riscv: Introduce extension implied rules definition
>   target/riscv: Introduce extension implied rule helpers
>   target/riscv: Add MISA extension implied rules
>   target/riscv: Add multi extension implied rules
>   target/riscv: Add Zc extension implied rule
>   target/riscv: Remove extension auto-update check statements

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c         | 396 +++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu.h         |  23 +++
>  target/riscv/tcg/tcg-cpu.c | 274 ++++++++++++++-----------
>  3 files changed, 574 insertions(+), 119 deletions(-)
>
> --
> 2.43.2
>
>

