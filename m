Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmcHY-0007uc-Mh
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 08:44:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcHW-0007tq-Fb
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 08:44:23 -0500
Received: from [2a00:1450:4864:20::334] (port=51945
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcHQ-0005KZ-Pd
 for qemu-riscv@nongnu.org; Mon, 15 Nov 2021 08:44:18 -0500
Received: by mail-wm1-x334.google.com with SMTP id z200so14013063wmc.1
 for <qemu-riscv@nongnu.org>; Mon, 15 Nov 2021 05:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NJeT81Ln08sVnOvClQx7gZy/obIymPr4zWjhEVgsEjA=;
 b=qZRH7NGmp1PMciSQoyUMYVXlFymS4BExsXAseBK1B8gjNV7fhXTfSBMzGWpMUvhW33
 ObFcgmCeoLByoNeaNhtvBwJ254GuzHATVvjBBtZHYMjgrlIklX0TiqCeCvXo/HJQFgZT
 RtDmcu0GZJQ1korC7xr1allEf3AuqyaF7yAjb5tfS7wQzCCqwtHXotneub2OtKC/tSat
 slvDZ6PurEUAZqLTuziK0JygPkdx7tGK4Hmt/24//NdaHnG9FTWR0P2nFJajVIpgJ93a
 rYONTU+dCi82DRk3il1SExHOH6ouF2YbXBB8iGPL0DE8fg26aWUaN1VWZQejgimbBX0F
 LzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NJeT81Ln08sVnOvClQx7gZy/obIymPr4zWjhEVgsEjA=;
 b=vYBJRd/NQ6Do2BhyjHWlJRpVlCTV53DpHQaPSYq7DlJlsfgTKN+FirDKx6eSfS2yrm
 8LyOvRFtHvHljgt/oy9/pWi+O+t9+3+qeyLRs7IMyzA4CY/kjHY6Bn+3cooNz9jTweEl
 bc3NkKbDLVDgmHuir/q8UQSMWFxyCEqAtT5wNTJL33ri8aVX1hAoGIUbsQ9/EKk3u4tE
 mnjBTUgQllk0oMqe0q1O/F5yGhohzMXtauDtHE5Z2D2RiQdQ6cSSQSnLRyWZ0zsrgwjo
 GQ+0rxuqtTaXLe8XC2iRxvM5YwEGgrHGmoTncuuyUBobtQ0DSt0kPJ/0H5M9UdNteIU7
 s8Zg==
X-Gm-Message-State: AOAM533lnvUwd4k4svF0jv/g+1GxtS8piYmjrU9O9XI5BwBIUo5g5MXX
 6mBaZHXeToCm6UmJUS3WA01MnuFW3iHxhJy9oI9LdlI7Qjk=
X-Google-Smtp-Source: ABdhPJz4odgPhu4JFqUnTGqDJoTamgtr7UTskdt2Lr52NbabZ8CaJDn/HYHHfTJu77HHUwTODqDR4EJy5QAjLypMu2E=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr26357463wmq.32.1636983535036; 
 Mon, 15 Nov 2021 05:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-3-armbru@redhat.com>
In-Reply-To: <20211115125536.3341681-3-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 13:38:43 +0000
Message-ID: <CAFEAcA-dxXdsaKP5G7nhSROqwsRS9=r44G7rvNpEKbjgX8BbGQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] hw: Replace drive_get_next() by drive_get()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com, clg@kaod.org, 
 andrew@aj.id.au, joel@jms.id.au, b.galvani@gmail.com, jcd@tribudubois.net, 
 andrew.smirnov@gmail.com, sundeep.lkml@gmail.com, hskinnemoen@google.com, 
 kfting@nuvoton.com, nieklinnenbank@gmail.com, Andrew.Baumann@microsoft.com,
 f4bug@amsat.org, edgar.iglesias@gmail.com, alistair@alistair23.me, 
 bin.meng@windriver.com, palmer@dabbelt.com, atar4qemu@gmail.com, 
 mark.cave-ayland@ilande.co.uk, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 15 Nov 2021 13:44:23 -0000

On Mon, 15 Nov 2021 at 12:55, Markus Armbruster <armbru@redhat.com> wrote:
>
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> Explicit is better than implicit: use drive_get() directly.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/sysemu/blockdev.h           |  1 -
>  blockdev.c                          | 10 ----------
>  hw/arm/aspeed.c                     | 21 +++++++++++++--------
>  hw/arm/cubieboard.c                 |  2 +-
>  hw/arm/imx25_pdk.c                  |  2 +-
>  hw/arm/integratorcp.c               |  2 +-
>  hw/arm/mcimx6ul-evk.c               |  2 +-
>  hw/arm/mcimx7d-sabre.c              |  2 +-
>  hw/arm/msf2-som.c                   |  2 +-
>  hw/arm/npcm7xx_boards.c             |  6 +++---
>  hw/arm/orangepi.c                   |  2 +-
>  hw/arm/raspi.c                      |  2 +-
>  hw/arm/realview.c                   |  2 +-
>  hw/arm/sabrelite.c                  |  2 +-
>  hw/arm/versatilepb.c                |  4 ++--
>  hw/arm/vexpress.c                   |  6 +++---
>  hw/arm/xilinx_zynq.c                | 16 +++++++++-------
>  hw/arm/xlnx-versal-virt.c           |  3 ++-
>  hw/arm/xlnx-zcu102.c                |  6 +++---
>  hw/microblaze/petalogix_ml605_mmu.c |  2 +-
>  hw/misc/sifive_u_otp.c              |  2 +-
>  hw/riscv/microchip_pfsoc.c          |  2 +-
>  hw/sparc64/niagara.c                |  2 +-
>  23 files changed, 49 insertions(+), 52 deletions(-)

This would be easier to review if it didn't try to change all of
these board/SoC models at once. Each one of them is entirely
separate review work.

-- PMM

