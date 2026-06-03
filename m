Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5BECD6E57
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 00:42:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUZgl-00007g-AO; Tue, 02 Jun 2026 20:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUZgh-00006n-QJ
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 20:42:29 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUZgf-0003Up-9b
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 20:42:27 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-bdb3fd39045so1804932066b.3
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 17:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780447344; cv=none;
 d=google.com; s=arc-20240605;
 b=jl71wkjrqVR+zPfUi206CaIQ/kupiE8FMRKbyKXUvJQ/luoHDt8weNiiwG9PT7wHt+
 pYKeL+DFpXmTKv3SxEXrPNvHI0hL2ZM+7x6LLm8K+IQoaQXtUE2QVgA5Sy9KmYmbUU0B
 1QYtVuO+wiFgxockjT+WYHD83o3qqff7ajeGEROnspHwUJt0K/kdLH98q7b44FODtXjV
 YuQ4vk/r9AFZgx0UBw4T+o7xy7nqMpK18ygVsAZ8DsHtMDJUoB7LIFk6qGKPEnaamRS3
 tyOIMzeR6R9fA2hAUE7Rx+aw0h7faRS0MyKjA2ZAI9Q+ERed0C5M5O54ZUu9U6vTSvyF
 turg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dYLOQEEK9SlB+I4AbXytkiWykJ8Oikpc/Uw3zoytCc0=;
 fh=C+UqRN1LNmUCjl7YjY2JsLMNf0toKly+CeBRlqh5CTY=;
 b=S7KGIokFkSDMeZXlZwPoC5xg9tk06TiHlbxYCJDCxChCbXl+FWaIixU2wCP5bfAkJH
 XJcm5b7mSq20Wa1DvilASlQWFGymEuV76JKEJYcZxfba53Lg1N/Vc8Qgu5lw2qpxHn9T
 KDhH/7OHYm4CspeRsvhuH4egTnvu/ML+lKBgUL8UoUctmlLHSt40+0idrxK0Jwnvf14n
 wSA8foD2ezF0m3xNpxt6OTtA7z8lOnQrKHvG6NPMVnHvCBXoPVukhFrh6gpkolLSsEPe
 UurzdJdU4pq4NVlASj5pf8PJC/Dmh1zkLC9idpdbRS7mR1IiEE1Kgh1CoN7Y4Sy0Okya
 nQZA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780447344; x=1781052144; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dYLOQEEK9SlB+I4AbXytkiWykJ8Oikpc/Uw3zoytCc0=;
 b=rVhVGqkkvT2Pp5bVKoovgIvYdUVVIdLR/WuIKvPJ6zqjQum/6U8JoU7dd1S6UCrOrF
 bQT7joP2sHm4V+pn6JKD3eYezU2YGHp+zqS10i3UtyFCv+ZMrUIfh129HlaFjDwQOn7k
 N4Gq95xBYmrUJirDo5Dmnub+v2nplbp/9SV2NL8DMvXEBGEFky4N4nlS3YFOmTArmtlt
 wryKjd3r/pVXdGNNjoVh2e7AZ82xY+AWsu17AOiUgpffspgk4w9bgl4cLJBGRd1CPNxy
 GZ7XI4G0G00L7qybPfa5wLI6dAhFsBiQvaK+ZAPO17YSSH7b19R/+zh47Mioi15MrFZx
 VUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780447344; x=1781052144;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dYLOQEEK9SlB+I4AbXytkiWykJ8Oikpc/Uw3zoytCc0=;
 b=ZGC+HUptU/bjC0QG5pYusmuEooHCNTBvJ/mucKUtL71RZoCmMLG8QwkzvFKnmMoMJN
 OHyl2R1cPj8gnMvtWSnzgSb8SETThgc3QzlBb9ISKLe0Oj5pn+onYekzK6Wj61rgtKW9
 sAHLM8+N/HmVclUiAaN9029oHYYOBvYWdi+tzXjikHcBBkc7uRr6G9BDsQY3R9yauzn0
 SCuZl5BQKJ9mQN2HeXbHzIqNTu+t3X0EzCyYJoYiXmHS33wUTM0vN13W6HAU07P67LLd
 X6HgkLeRS04YfNT+gsb4Ncwlbl4WPbtaCjk+FMpZ3eAqJMphdpAQMOdXSU+KbRlaP5AC
 KgxQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8DSi6GLdtA6kgAO+haj4qCqoKXRMFQ0qhCuFO2kJ84BOKCAs+AjhSjJZLfb7HZV0LqjuiOpFG9blUS@nongnu.org
X-Gm-Message-State: AOJu0YwoGNL6A2msTJ/f5b3yboDoSHtBQ4PvxAS0KUNO6IPb3LQhcjiz
 TQGL2gn7o4DWtCmjEdov/HEFJRBY/y547Dp7kfiiUYffNeLhoCW+jJzmagoEwx6yrOKgXb5HQHK
 OJfa8Jaqe5nrVsTFBS53rbC0VtSpq7xA=
X-Gm-Gg: Acq92OGgzlG426d0xNv4/yS3wzyzG5+eaymwlA5mGzAqHAo7ODUGlo7Cxrh85w9B9oA
 m5zBmFGfxQJvLh/rI8iFmbnmyvbV+ejLNulO3xvwsIFvPvKhtKILTVY0jNUeWrz5qS3/64Kewft
 SNYkWajwm/KGXjY4XmnzX5o8Kj16Zjn4mqbou0WM+Ie55gX9MGFkLyn5rEE7REUVij2qPTG4Gky
 k5hDoCa61dCGhNH4WTmz8fwxRxpi+auYm+m++cevJbtT/aKN4ptfwUZT+PUYiaxHlaStg5q6/sA
 NW1DIRlFkKQkvJ2UUJRGj6/NE+dDgq3IpEky3iZ3NTK3jIPq
X-Received: by 2002:a17:907:9446:b0:beb:bf23:ac78 with SMTP id
 a640c23a62f3a-bf0af9fb89cmr31746566b.44.1780447343457; Tue, 02 Jun 2026
 17:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260528054213.678458-1-frank.chang@sifive.com>
In-Reply-To: <20260528054213.678458-1-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jun 2026 10:41:57 +1000
X-Gm-Features: AVHnY4IKvVCf21hG50UGzHAoPKdheIhX8Zz2EDvxf6t3FZm66T_I7UOOBF9DhIM
Message-ID: <CAKmqyKPywAKDrKKnVsNKvPpzCz09+La5Ec6zFawN2qwmAf9foQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] target/riscv: Add the implied rules for G and B
 extensions
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
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

On Thu, May 28, 2026 at 3:43=E2=80=AFPM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Add the implied rules for G and B extensions to enable the implied
> extensions.
>
> Changelog:
>   v4: Add 'target/riscv' to cover-letter subject prefix.
>
>   v3: Keep riscv_cpu_validate_g() and riscv_cpu_validate_b() but remove
>       the auto-enables as the implied extensions can be enabled by the
>       implied rules.
>
>   v2: Remove riscv_cpu_validate_g() and riscv_cpu_validate_b() as the
>       implied extensions can be enabled by the implied rules.
>
> Frank Chang (1):
>   target/riscv: Add standard B extension implied rule
>
> Jim Shu (1):
>   target/riscv: Add the implied rule for G extension

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c         | 26 ++++++++++++++++++++++++-
>  target/riscv/tcg/tcg-cpu.c | 39 +++++++-------------------------------
>  2 files changed, 32 insertions(+), 33 deletions(-)
>
> --
> 2.43.0
>
>

