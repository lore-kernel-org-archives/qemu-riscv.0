Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lo2sY-00044U-NH
	for mharc-qemu-riscv@gnu.org; Tue, 01 Jun 2021 07:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lo2sV-0003zp-Tj; Tue, 01 Jun 2021 07:48:11 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:35678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lo2sL-0005D9-MU; Tue, 01 Jun 2021 07:48:11 -0400
Received: by mail-yb1-xb30.google.com with SMTP id i4so20710081ybe.2;
 Tue, 01 Jun 2021 04:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xVx4ubsJOEzcA4R20s3/Ypo6vOv95AYCRJcG2kb693E=;
 b=utMC9RycXLm4d6DkUCxxAU21N5kY1shiWlQ/UHepNU6H/EwZbYL5DatMzuS2D7S2p+
 zlVSDFOMsCMOYlPELW342nHkx2J+XjJG8I0idzmbtOV+cs1NAkjAKKq3DT/4l8Hwbubz
 kGp7oVNGZ3cWgjx9T0gVOxG6JaA1MFzy0mOjEHzCXRj3CeNrs/vseZ8OmqLrhOgB6m19
 GUTSvxFDE0py3WOYBtsFFOV3I3WirF3zc02T0Tiu8aJhN5PTcR+yWtOOplOziZ3+I5hw
 LMf6gRZEeCTeMEcuowPXMZyTN58jQePQC2vjmxK01vssNn1Cn872ZmGnIP5xGRRysHsD
 fqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xVx4ubsJOEzcA4R20s3/Ypo6vOv95AYCRJcG2kb693E=;
 b=BGftifmPcZFEApA0xHIIB/PSJSy0zqbJpvplx4jjA2kGzICcmMk8OnCD//W9/FTiI/
 LTcypvuAxJlyW0RiOaREanU7PWTXgEW2jv/CaKqok5Rw3baEQVf2/8LGJ/1cdeYztxH8
 w92yGTVcG2ektrDVwSXEaUW8VuFBjuz1JvaOHCj8rIhB0wi5Sbb8Ft9U7Ayc2T1p9iC8
 FLQeHvBrLtSVzG/M3NSdEdyPyEJ9sutvdE/WC/XqDiD+iYXVVBUUWwyDuKcqB6aR1AOo
 JMnzTgK5dKb0+/s8yCwRoGXWtsY6UmOO0lwkgXbUO70uehxnBV1CkSd/vgRR3RE1HZW1
 2GEw==
X-Gm-Message-State: AOAM530naBzOQ+yop2o/8uPHTmOWMzvnmbGRGk/hAZKtHVRbFUAqA8Uq
 PBisp1RdUolsCA5ECJ+XWW3LH9k1K9EnXVf/2hpvQfDr/AI=
X-Google-Smtp-Source: ABdhPJzPxmHOWqp+qDk59Fpgs+tXawZ462CJZuT+bYgZC+aTn02NeQbv3YqTBu7sEgx8Cy7fRQjZy3yxoS2/lh01/GM=
X-Received: by 2002:a25:be09:: with SMTP id h9mr40891519ybk.239.1622548080425; 
 Tue, 01 Jun 2021 04:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622435529.git.alistair.francis@wdc.com>
 <547296f990a03d5524ab65a9987083d69e4ebaea.1622435529.git.alistair.francis@wdc.com>
In-Reply-To: <547296f990a03d5524ab65a9987083d69e4ebaea.1622435529.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 1 Jun 2021 19:47:49 +0800
Message-ID: <CAEUhbmW9EVUsavcPHpW9MjEqF8nYHh8eYLdRgPP41EXjMDXp=Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] hw/char/ibex_uart: Make the register layout private
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Jun 2021 11:48:13 -0000

On Mon, May 31, 2021 at 12:33 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> We don't need to expose the register layout in the public header, so
> don't.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/char/ibex_uart.h | 37 -------------------------------------
>  hw/char/ibex_uart.c         | 37 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 37 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

