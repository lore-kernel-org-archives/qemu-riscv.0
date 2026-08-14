Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE5BC5CFC1
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 07:41:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wumWh-0001Oq-2n; Fri, 14 Aug 2026 03:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wumWf-0001NG-Cd
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 03:40:25 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wumWd-00010P-Un
 for qemu-riscv@nongnu.org; Fri, 14 Aug 2026 03:40:25 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-82e475fe54eso23003597b3.1
 for <qemu-riscv@nongnu.org>; Fri, 14 Aug 2026 00:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786693223; cv=none;
 d=google.com; s=arc-20260327;
 b=LJVHyZUwZikGiddP697qgFO51U2GFXyU4X4i2/eHUABze1kQQA3HbOT4Ev9l/rvLhl
 /J9103YjBrlQ7IMiHhbOMUOF543UOuncObNoQ/CmiTKaSJE8+VKW+CXpBYDY03BfOZ06
 DuJl4E9wntqmbQPFZN5v9kIMa9yy8gZuiaG5Q3GsAuBSGe5tG+TcE5qYrgB4TiJe8rFt
 l9mS/rjbNdelo1f3gYkLXeMLyEXzrubdVNjTr6NVOosrfmWAqEnOhCYNyYBZ+gE97RGH
 fx0cuXe3yjYDTM33ESD4G80/FilW6RCRsFer3SESGk+knPuoiqN3aREPoon26ujMSMD8
 Kblg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=wf3t5Nxr0W46HeKJ3HAfpjaNb3rD6s3WM3jNXgJHBFc=;
 fh=19f0P3Cbfrxj8TnxcfMjtRg3NSgdw0K5LEdvOW358Xg=;
 b=oUy4Y9/0KZ0xG/LRQvHpNHjWM3b85DiQXPMOAeCW9yJfTrCWJtxXuoY2OInesuDB4T
 7HXEq0h/MUvk6GVXc/dgaIcfHDj515elmjEuO3l1gFifHxBQE1SKS6YT5OkByQWDDJ3d
 iWt8YkM24/JN2bO+W9xH1YLuPXQTYGBfCnXePHKLS6EM8TH61Lq+nIzYq+89EGg1LAB6
 N5pBbc5eq6CAtBLOTYzZckTXvWEDh3DMx/N3/bHxPYP8o1kgRcffDh6VOOlZE5TAyfGK
 hEdrh7ba8awk+QOXoYeym6M2EbxsMZ9bcG6qA6Xm9cBE6ebG6SqPumNuvglbmT5ZhgHH
 eRfg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786693223; x=1787298023; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wf3t5Nxr0W46HeKJ3HAfpjaNb3rD6s3WM3jNXgJHBFc=;
 b=LKx0rYT/kUkIWLSx5JIMJgHC1XWM0IqlxDLafayfAjCEfrHznxs5z+zErHyCNtoG68
 rcorIqu+NbO457xiKXHJzV25Fr28j4AZx3cZobg9l6b4iiV8QqsVmIbBv/twK7GRyp5F
 AocWR2jaQTyLLcaW5+p7W+N2gTQV1JdU3FFio95Kf8pBkOOJh3qj5yQ7IUmBfE4zm3CY
 A2cCwIUVXfC1BJkvp216spzxun8LMkqgMZuCC6uz73YZrQwobtQtvkCNh/xnN+k9D0C9
 toxGgGmvPhHifaYiExdK+h6wDWVKnWbgH4x+cb7w9gaT4hZoqWTJkRyhFt9vsqlyeo4v
 HS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786693223; x=1787298023;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wf3t5Nxr0W46HeKJ3HAfpjaNb3rD6s3WM3jNXgJHBFc=;
 b=NiCtivPxtMwHzOIJut6xLW3t5p4G+Pt5nuYfVbtMBuHNRsUmlFjYUGQr0ulXakaxZ6
 P+igey7SbumbwqmPNWJR8OHGs0/JioPzoogAruiIZUAdLQPxWQ023TBRSL7/8rZ1vo8I
 RyUV52uu5hRveUFc7d7M0KHO9mVjKokkl7IRGTbxaVGCLrgbNMZufbQ14Gih5rW+jwmy
 PUNMwz1uP/Vn9tAWLs5ybt3m2pTp+gAyTTDd2d6BSMlsoxumNWGWIMYZuN+AO6G7cd0K
 I6oyp2m6JUjjQiLFYt43Qqzss9R8EuZ7sH3AVO7QxDECaJJ5jca4SyyBiJey2Y8Wg0SS
 E4nA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rog1d0kBQePukUne7fjj6L5a0Xt44EwcGCy+K9/wCFvz6GDKBpqvJSXbNODG6l7w1hhTdUrzh0rLGNX@nongnu.org
X-Gm-Message-State: AOJu0YyUsLOqHIs41jewxHjLq0PmYKj68SnHSYBFptnU9Xo26D4AT5J8
 +bwtm7xMfJs4WPfBaKluX0jMEio8pJ1wAR65L72pkyGU2cz+0JfZX8w26bB9X+krdn+Q0EPYokI
 n9kdDww+4JzzmYrM9u32FJvpw48sdUTs=
X-Gm-Gg: AR+sD12fpT4tiGrl/pUka7KtwasJfFdXGt2jox0H+W7I4DHv2zdYypgEtTCrHUK7FzK
 Kl5eEtZKyK660H5bFo/1Ge/dzYgsPT0nVNvkMrTv8KbdCYPz9yP/tGmoaZzUlm/uurqcQSzi9l3
 jM4GVeKOFYuXd9WJZyFz8NIYvCOC+aVDmqRlVEwZPqyGY3aClLIIXdr8Q4Wx71uQ73QcTy1xTha
 gqhWoKpR4ofx4IIkgFd6Pd70CxzCVP6l8/24uubRBzbHbMtnuVFkneTELUcOi/mUWlWQ482ZDNy
 CWUfnuVW496MWFsyulYt3+8/X+nNN100TC7yzU2EPm8RI/Wyfh+K9aI=
X-Received: by 2002:a05:690c:64c1:b0:81e:5d2e:7a2d with SMTP id
 00721157ae682-8370d7e6391mr20033067b3.1.1786693222730; Fri, 14 Aug 2026
 00:40:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260813133643.20380-1-rao232328@gmail.com>
 <20260813133643.20380-4-rao232328@gmail.com>
In-Reply-To: <20260813133643.20380-4-rao232328@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 Aug 2026 15:40:11 +0800
X-Gm-Features: AUfX_mwAeBc1JotGnGXlm8v2JTmJ_L6KEDhLK_N_vJQhs_WeVecDJES3ciQ8lDk
Message-ID: <CAEUhbmWtJRdeBAE4FHXLQm4Ow=tKYhnyGrQotsgXmbKHWTBVyA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] tests/qtest: add k230 dwapb timer test
To: raoyi <rao232328@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, liwei1518@gmail.com, daniel.barboza@oss.qualcomm.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com, 
 philmd@oss.qualcomm.com, pbonzini@redhat.com, lvivier@redhat.com, 
 farosas@suse.de, caojunze424@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Aug 13, 2026 at 9:37=E2=80=AFPM raoyi <rao232328@gmail.com> wrote:
>
> Add qtest coverage for K230 DW APB timer including
> free-running, periodic, interrupt mask, disable
> behavior, current value, dynamic reload, and
> multi-channel scenarios.

nits: please make sure the commit message width is about 70 characters per =
line.

>
> Add timer test file to MAINTAINERS.
>
> Signed-off-by: raoyi <rao232328@gmail.com>
> ---
>  MAINTAINERS                         |   1 +
>  tests/qtest/k230-dwapb-timer-test.c | 274 ++++++++++++++++++++++++++++
>  tests/qtest/meson.build             |   4 +-
>  3 files changed, 278 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/k230-dwapb-timer-test.c
>

Other than that,

Reviewed-by: Bin Meng <bin.meng@processmission.com>

