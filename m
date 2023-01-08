Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pEOLl-000606-E9
	for mharc-qemu-riscv@gnu.org; Sun, 08 Jan 2023 00:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOLi-0005z6-AR; Sun, 08 Jan 2023 00:36:02 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOLf-0003cw-Nf; Sun, 08 Jan 2023 00:36:00 -0500
Received: by mail-ej1-x631.google.com with SMTP id tz12so12513569ejc.9;
 Sat, 07 Jan 2023 21:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xZ6SKNWfaZZc73rws7zd+R9khWnHie2ztD0YJo19aM=;
 b=PbydBjvaPNjDouLoJY++EIqxe5K5hVeiwi58ozDvoLyMoaARAg/v8x+YVCGipGs7m+
 jvfGlP0E8VgVGl+EWnkDmHELtvGeDhh0i5TDIY+snrGlsk54ITxhE34VLneVwysPut1I
 YFc8dsHL3Pdm/nxNh+VK82eHbWDyKz59OzbCWG9353yiuzeVy3St2LyTlKghAztoDEoY
 X4iSdg082JQc/nOjvXF027SFZie09cIaBDKjIVxJBeG1v3HKlKlXSY62WNwCu2Q9xlDY
 cdibVwEZ3KvTDvBC/ydKbraiwXU+PCcxwPWbR5o4ZjfBStvMwePveoKjQms95LurxqU3
 pL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xZ6SKNWfaZZc73rws7zd+R9khWnHie2ztD0YJo19aM=;
 b=WD9cJ+xAH/keTGFW3tJaMmAVix4T3DniH3HCr9ZJo2Vn6FaNQKYCdUZ3NNqqV8X3x6
 0GPSBVaFmD8e37MaTQf5CHRrycymIvLfBk8/CG8q2j60J620ue1RgkGZ7KeI3us/Cp/4
 htuQaxqmpIDF66CkE9cDeoxcCiJapaNPxcGwSTu5zk3rO6D5tGeOEGz7zyn8KjOQcMdY
 03h9pppI8Ar0hBfCeGmp8XIRlo8ADNUs12axlaHb1r8YFVbM+6cdTPzhpW64yq+PZvnM
 9lCs8TbBwTzm8m/xXzs7SaWzKjfeWhw6Stpbij2a1/U0/Wrq/QWyR/ijaqnogr5yDoaj
 cTIw==
X-Gm-Message-State: AFqh2kqwn5Y/OZlrw06vbS35U5VFTcUcadr+DnTwL11/1hNBiXKG+xS5
 FWazS/tVWHRQvUx8Qc4e4y7Vc2M5YidBiVAZf1s=
X-Google-Smtp-Source: AMrXdXuN59YN8PLpBjvyhZGCySTz+QTPqhYQQM2eprKf2vxjz8/EkpWcEWGZCLRdCNDtSKi2jli9yUFwnXs5OKERMKQ=
X-Received: by 2002:a17:907:6d29:b0:84d:ed8:b9df with SMTP id
 sa41-20020a1709076d2900b0084d0ed8b9dfmr1154874ejc.26.1673156157041; Sat, 07
 Jan 2023 21:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-11-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-11-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 13:35:46 +0800
Message-ID: <CAEUhbmWPLgsa53KWSSbJK4hL==UdreOr0EVSkTuWHgvbnkENxA@mail.gmail.com>
Subject: Re: [PATCH 10/20] hw/arm: Open-code pflash_cfi01_register()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Song Gao <gaosong@loongson.cn>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, 
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Radoslaw Biernacki <rad@semihalf.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, 
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, 
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Sun, 08 Jan 2023 05:36:03 -0000

On Thu, Jan 5, 2023 at 6:43 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> pflash_cfi01_register() hides an implicit sysbus mapping of
> MMIO region #0. This is not practical in a heterogeneous world
> where multiple cores use different address spaces. In order to
> remove to remove pflash_cfi01_register() from the pflash API,

duplicated "to remove"

> open-code it as a qdev creation call followed by an explicit
> sysbus mapping.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/collie.c      | 15 +++++++++------
>  hw/arm/gumstix.c     | 19 +++++++++++++------
>  hw/arm/mainstone.c   | 13 ++++++++-----
>  hw/arm/omap_sx1.c    | 22 ++++++++++++++--------
>  hw/arm/versatilepb.c | 13 ++++++++-----
>  hw/arm/z2.c          | 10 +++++++---
>  6 files changed, 59 insertions(+), 33 deletions(-)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

