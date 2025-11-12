Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74669CCFA18
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 00:37:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vIyra-0006Kj-I9; Tue, 11 Nov 2025 19:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vIyrV-0006JY-Lu
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 19:37:26 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vIyrT-0003AQ-RD
 for qemu-riscv@nongnu.org; Tue, 11 Nov 2025 19:37:25 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b72db05e50fso54447966b.0
 for <qemu-riscv@nongnu.org>; Tue, 11 Nov 2025 16:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762907841; x=1763512641; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=suvugzczrCxFJUjcdNp2A2QB7aIzdPrpCEpkrukVpTw=;
 b=AZDQ5eatwPz6NR03JiR6Ohd4PKugB7AaC5bos46rBBHTS1eylslIN4bnzZnzJXS3XD
 /M7jT9Ct0chsJtbTTklJqj3YRHp8OVmyeWlWoi3h/u6i619kqlDxOKe2cj7F+In2zIpy
 pslevQAM83UO15/rLsIitzuB8OVuAVafd+s2a5QWfO2vWnQ4tZI1vBRJTf/JVJrYiO+u
 hDUUCjUTNaJQBUbE+i1ElFQUQq8cZgbspTfsqowxRuO82RIM1fMt92QSyTctQ/VYnFXb
 eb7/Sr+bwoMMRrkIorzqNj1i/jT0v/n0o67nOXV9OU7eDX4crdwEoIW846x47pczcQkU
 LCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762907841; x=1763512641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=suvugzczrCxFJUjcdNp2A2QB7aIzdPrpCEpkrukVpTw=;
 b=F3gQxbrlN573PNb99ku/e5Y1PvsptUtOVX+BJgZKRV+k+DYp7t0s/6s0EahTi+vR20
 C+KYl/gIBrFpSwqW30qZtUB8gAhL5QXURoLQ9xDKLhy1eC99Yf7MAyzksz41h4bX3xjO
 JQm2CqHD23wM5KuMc4RpU2rF2Qp5zN4Ve14B4iIj2NSUscNaR9Pt1zVJZuz+cZ4SVnj4
 Tf8EG81uED4fvSqgBg/7XfnH+EEmNWA/vkDYDJkGhatsXmhwpVkffdDpKhTKY/7V4M2V
 XBoW+Q5BzXZNOE5QMDYKjJFq4IzYCfffO8xQzlQGplhhSBzj4jtGdaMx6IUbyVmWdX7T
 WAUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuocVIAMj4ko2hmrmUnFmi5AtPJDl79NQ5wvgGVpQwBFoTWQU6QQ6KTJcV/yEZDjcKGaGYTiC0UnRc@nongnu.org
X-Gm-Message-State: AOJu0YykReI+45f3WuN3ROYLN4yqQHEaqgdsNHlvLfH434Eop+3aI89F
 ZHzKE1zE0wKZsA2JmUtKHy5w0kKQ6QGGABcY7HGehxfJ+YCo1dMrU4mH5ATYpD03pe9YV5m75+0
 GF3EPCTfGGNdpAk7K1LdjR00n9U7TaZE=
X-Gm-Gg: ASbGncvgz/oh8sa+ygSbTR9yfFAdORLiYDNDCGOgG4QuFYNG805AnckGlDTRLs80y7b
 z8kbvh0G/eT8ggUzWY2EkNgmpLc2RdAmIo5O8XvZ/8/rogBXBU5UmS8UoAlrk6UrnkD0QxfzS0b
 CDQS/ifYFbW0XY3IT6sA3g5bHWgtBgHuaYMtnn3nRBc9vLisjDN9EtMMdDNjgvo2Xz6q7r9xWCo
 QB+dFPRkAQ4+fMmduJ3+GoHYTBCvUkcVin8BAUIZJYBujCW5AGpAU+RtmtpwanzEOaKrwYk1FMt
 jRF7ubesskpO5QY=
X-Google-Smtp-Source: AGHT+IGktKgWaFc/uClqXOAva7tWGvLsI2/1p/H9GZWFSVtgseO2dCeJ555THIwsiWW8xbYS8cE9+XJsZEIZEUGMgY8=
X-Received: by 2002:a17:907:d23:b0:b73:22a9:8989 with SMTP id
 a640c23a62f3a-b7331aac300mr100308666b.34.1762907841215; Tue, 11 Nov 2025
 16:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20251103033713.904455-1-alistair.francis@wdc.com>
In-Reply-To: <20251103033713.904455-1-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Nov 2025 10:36:54 +1000
X-Gm-Features: AWmQ_bnxh-ijAoRYOPelzgZaXUZRwYYbdT7RHKk2EM5yTO0u4xeWyOzZfsWwGb4
Message-ID: <CAKmqyKP5_wLNK=jgbyx2utZZR9YyGO=TxSd68ECRRKD=yu28kQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] single-binary: Make riscv cpu.h target partially
 independent
To: qemu-devel@nongnu.org, anjo@rev.ng, philmd@linaro.org, palmer@dabbelt.com, 
 dbarboza@ventanamicro.com, atishp@rivosinc.com
Cc: liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62f.google.com
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

On Mon, Nov 3, 2025 at 1:37=E2=80=AFPM <alistair23@gmail.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> This is the first 8 patches (one of which has been removed) from Anton's
> series [1], plus an extra cleanup patch at the end.
>
> This addresses the comments I had about Anton's changes to
> riscv_pmu_ctr_get_fixed_counters_val().
>
> Besides my new patch and removing a patch the actual changes are
> limited, so I have kept all of the Reviewed-by tags.
>
> 1: https://patchew.org/QEMU/20251027181831.27016-1-anjo@rev.ng/
>
> Alistair Francis (1):
>   target/riscv: Remove upper_half from
>     riscv_pmu_ctr_get_fixed_counters_val
>
> Anton Johansson (7):
>   target/riscv: Fix size of trivial CPUArchState fields
>   target/riscv: Fix size of mhartid
>   target/riscv: Bugfix make bit 62 read-only 0 for sireg* cfg CSR read
>   target/riscv: Combine mhpmevent and mhpmeventh
>   target/riscv: Combine mcyclecfg and mcyclecfgh
>   target/riscv: Combine minstretcfg and minstretcfgh
>   target/riscv: Combine mhpmcounter and mhpmcounterh

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.h         | 106 +++++++++---------
>  target/riscv/cpu_helper.c  |   2 +-
>  target/riscv/csr.c         | 221 ++++++++++++++++---------------------
>  target/riscv/machine.c     |  99 ++++++++---------
>  target/riscv/pmu.c         | 150 ++++++-------------------
>  target/riscv/tcg/tcg-cpu.c |   2 +-
>  6 files changed, 227 insertions(+), 353 deletions(-)
>
> --
> 2.51.1
>

