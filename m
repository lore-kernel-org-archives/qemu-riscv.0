Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E450ECAC5BB
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 01:44:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v32w2-0001GA-Ci; Sun, 28 Sep 2025 21:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v32vz-0001FP-Uu
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 21:44:12 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v32vi-0007KI-OW
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 21:44:11 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so695139866b.1
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 18:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759110225; x=1759715025; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oC2CFS1PAHIvuqzX5fQskVTJaszXMlhixWQ7HJegC2s=;
 b=HTyc3SyiFO8GIGvW+3l/9HSeuwa7Ti0XZODyz1Ke5QsQAGcKZ0kWBhgQD4+bxa5KBO
 rAc/k+OzPxTPbLNbUacqbF0hC2rrAUuAXFZhxn+81nGCkGk0SK3sTAYaogJi9myLdvz8
 33QdCeilnv1CLTQdnW5HpNlmU5DUgql00YB1eO9OZljYb5xgVnJvmd9vykawJ7KyHyav
 xlCUDOxEQDWtQ6hYBtkg0LP9P6nfysEWu8DP42XB8c3Vc9tz491EUpjkJjxJBBOPXQ8T
 BwcL6vLyT4zoVnrDq/6lMISdsxI+YRs15Vy1G8Qv40HptEulcsNet6YKi5uderBGg+aa
 3DQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759110225; x=1759715025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oC2CFS1PAHIvuqzX5fQskVTJaszXMlhixWQ7HJegC2s=;
 b=bnzl1Mt1ZMV9oXaQRKIRGOdJea2qdosAQAN8BBnF9PD8JTSyUab4souO7IIit5jrF5
 wY74BvfuaH6bIRV/P8WQdynIDlJQomzKpYroi6w59lfUBV5IkMITgsy+cUbFn/AIESFg
 D4s1oV0/egomgh3RMPck0eeqvHCCwVynxp7EPs6pLW+cYlCuWE6HkExI5rOCIgSnh8ig
 Sfykx6w4tSFcivkomMUu1NpzZBaXbuGiEiP+4uHMXtShp+7VKrms9kMwhLR3a0toKA1d
 GL/ATbYO/deLA8xhzW1oDDW4EIPUERd9L9lQ3hF3tdfxuVYAYmXH/xEuvTrVQ2NnseID
 UR7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRJUQzYnnGO0jorhgy0HUZhXUyK6aizCbn37W8QyAQY5qMWc1C7ZdxD9WmGyKY88KbO9xzovNYDlLC@nongnu.org
X-Gm-Message-State: AOJu0YzyFoKfAIfFz8GEWJCe2ZmTob+2+hd1lEBuvAWXSYEpzyqDK2Jf
 bTFqYQ0Oytr0I9HxBECoIXpsbS4mooQELe7W58C/ewzH/OLcrbzaxfh3jVcTAcRkcvX2MkGTSnA
 vguFNFFVCgemUhPiWz7UHbMnbiUPQuLo=
X-Gm-Gg: ASbGncuEHowwvlt1BaoKQgY7hzD3YTSVijNF6wfCGpdWK8cwixPoWeuY7zvZLcXIbzo
 d2T84PKREVcGh3booD6YLY2fVljukMxlMqXJNoEwlNSord9ZSRcRZVf8tWHZONSWvBEIprpr98S
 ZQoBKFL9l1g2Bpvo2NseECp8Lki3dSqKVbl8PF/BCTjYep/8p07/Mf4bLwx7wB30y11t7enuLu3
 bpG2175xRE0bD0N/hfxG8hoADHXZfE4oXhUBJ5e+rX2Z0qE
X-Google-Smtp-Source: AGHT+IHD3ZoMWNv4S67RDyhhv3bKehBgEmxMmx7xh3cmCGY7KwNmsH+9khpmHvrP2dvSD6x/hOj+h9IosPsN29/qKhc=
X-Received: by 2002:a17:907:d106:b0:b04:5a74:b675 with SMTP id
 a640c23a62f3a-b34b79c7b7amr1475707066b.9.1759110224955; Sun, 28 Sep 2025
 18:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250915070811.3422578-1-xb@ultrarisc.com>
In-Reply-To: <20250915070811.3422578-1-xb@ultrarisc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 11:43:18 +1000
X-Gm-Features: AS18NWD6xed5-YEjLXuhR9X8f75I1vdI2Aut5H7EzxQmrzpRqvD9mMGJx__RUv0
Message-ID: <CAKmqyKOnJcFbZCCfssQYpBS5VwPZJ3_28TxLvkMWD8nukFD6uw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v9_0=2F2=5D_target=2Friscv=EF=BC=9AFix_riscv64_kvm_mi?=
 =?UTF-8?Q?gration?=
To: Xie Bo <xb@ultrarisc.com>
Cc: qemu-devel@nongnu.org, ajones@ventanamicro.com, qemu-riscv@nongnu.org, 
 pbonzini@redhat.com, anup@brainfault.org, alistair.francis@wdc.com, 
 rkrcmar@ventanamicro.com, palmer@dabbelt.com, xiamy@ultrarisc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Sep 15, 2025 at 5:08=E2=80=AFPM Xie Bo <xb@ultrarisc.com> wrote:
>
> This is v9 of the series. Compared to v8, the patches are now based on
> the 'riscv-to-apply.next' branch from Alistair's repository:
>
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next
>
> Changes since v8:
> - Rebased the series onto [alistair/riscv-to-apply.next]
> - Removed the previous 'Reviewed-by' tags due to the rebase
>   * The changes are purely mechanical; no code logic was altered *
> - Added 'Cc: qemu-stable@nongnu.org'
>
> Xie Bo (2):
>   Set KVM initial privilege mode and mp_state
>   Fix VM resume after QEMU+KVM migration

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c           | 17 +++++++++-
>  target/riscv/cpu.h           |  2 ++
>  target/riscv/kvm/kvm-cpu.c   | 60 ++++++++++++++++++++++++++++--------
>  target/riscv/kvm/kvm_riscv.h |  3 +-
>  target/riscv/machine.c       |  5 +--
>  5 files changed, 70 insertions(+), 17 deletions(-)
>
> --
> 2.43.0
>

