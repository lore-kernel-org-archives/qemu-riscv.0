Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jzxDW-0007CY-Sd
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jul 2020 03:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jzxDV-0007AX-2M; Mon, 27 Jul 2020 03:06:33 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:38752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jzxDT-0000cK-LE; Mon, 27 Jul 2020 03:06:32 -0400
Received: by mail-yb1-xb44.google.com with SMTP id d133so6280194ybh.5;
 Mon, 27 Jul 2020 00:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WAewN1GCAzf++HFHhrHgjyZJBmqdBdGofpdkQHHyMzQ=;
 b=D9yJJfqMJ5xzxj04pHaGCj0VRapMCArNkGjU+BXPjSB6KG0n+mujeLf82fYdjDZJrt
 ooyHwGAfrFCvqodPoG7lUVjx8ficLYjIHSqQI4RscUMAaHaxZed9nqquiedUTBwJ1xVK
 7QQei2Xy9Uz3Mqi0Fsguuxs0imSvodelj43sA8PgQxcQveuxCalGU3tsTShz4xMRSnLO
 5+kHybwKvQmaN99sPhBviA7s8sTM5cpFlMvvpldNkg6PVLZv6UaTVkNlleTvvZCn3gDt
 CaKiU7dDcKZpkmXYyfx+pmfq7NDZEY8tQ9VOsilapVokfmgr8jBBkLPuoTjzmeAqrAJE
 z0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WAewN1GCAzf++HFHhrHgjyZJBmqdBdGofpdkQHHyMzQ=;
 b=AMH0PwTUOR1GX9/akQlCY0HGwgdzC90MVPrApnYTAdT5mdFrPgSK2FAaSm7EbcNCa1
 wHG1x3pL3gC8hgdeNfGTeke7xH4WNdVXl4/iXG63V29jAwRWcq9WhhWrsNYxs9GNwFIL
 /dCT0I2am4LkX3Qr1iFVoUXCOwgUaSuidbb7rf7V7UQMCLD5nESmSQKeUrFy9z0VJ5xA
 i9wCDcTEJYnKYzDFtMw3GRilo8o/0RZelLMobijiHYDh1U27ym6KTOvPZP3bE3UM4ZLI
 Ct76U6djYvxalZsnhqYeA95nNeGvKwvi1WpjqZPOhPpNzz9JWUmu0UXcp6rK/1Fqcz7b
 Q9WQ==
X-Gm-Message-State: AOAM5301YrVkcS5oHpTvV8uwI7INA+qatVuReSWjWr1ktnUeoWId5H61
 lFkNUlpFsuyvHfh00t+vQk11QdldnC1xGxTu13I=
X-Google-Smtp-Source: ABdhPJwPBYGam02wQeiIXAko4Dnin1YFO0WNflNhOo0/F4JugAUaItImAu8u7vPAPboU1m3fkttO/9QwDrwWgo2sSwY=
X-Received: by 2002:a25:f20d:: with SMTP id i13mr4458211ybe.152.1595833589610; 
 Mon, 27 Jul 2020 00:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595689201.git.zong.li@sifive.com>
 <a1ddde7963423df8e62e98fcf3dc75ae092186b2.1595689201.git.zong.li@sifive.com>
In-Reply-To: <a1ddde7963423df8e62e98fcf3dc75ae092186b2.1595689201.git.zong.li@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 27 Jul 2020 15:06:18 +0800
Message-ID: <CAEUhbmWqMOh8zgLZqvTi0DM00RGaQEvMXF6qz=hvM2+DdTi2XA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] target/riscv/pmp.c: Fix the index offset on RV64
To: Zong Li <zong.li@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b44;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 27 Jul 2020 07:06:33 -0000

On Sat, Jul 25, 2020 at 11:03 PM Zong Li <zong.li@sifive.com> wrote:
>
> On RV64, the reg_index is 2 (pmpcfg2 CSR) after the seventh pmp
> entry, it is not 1 (pmpcfg1 CSR) like RV32. In the original
> implementation, the second parameter of pmp_write_cfg is
> "reg_index * sizeof(target_ulong)", and we get the the result
> which is started from 16 if reg_index is 2, but we expect that
> it should be started from 8. Separate the implementation for
> RV32 and RV64 respectively.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  target/riscv/pmp.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

