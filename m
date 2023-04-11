Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pm33h-0008EQ-EZ
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 21:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm33f-0008E3-QO; Mon, 10 Apr 2023 21:44:31 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pm33c-0002ac-P0; Mon, 10 Apr 2023 21:44:31 -0400
Received: by mail-ua1-x934.google.com with SMTP id a38so3913147uax.12;
 Mon, 10 Apr 2023 18:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681177467; x=1683769467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=syP9nGp5blI+89WkbaX3k3BxM6rU9dg3U/tqJGC30xA=;
 b=R2+z0me3yURBPZNm3eqFxO/sDR4FB99UjAnpKa06hFmOcxVrqS6yelibRw3AgZTjdt
 qF9tLp3XDm/7BfT/toKsUcTS7Vkbt51z2MPgO7CTbsyVNN4ODzZwRwqKM0vekvUVmzpL
 +7gqNE98slVhh8+WzIMM0nPXAjhfdN541DVjsyVOhjNhiBKJo1NyxnyIZjhYPPq79HY5
 q5yd9nLsOh9RF9QZ1gfiF/FEik2EkaeTH/mx5e8XjIj0LtzK1zARADd5jWzVghbKmbh1
 /BO64mFQtVJONm7lHxP+ehd0pvagKXApVyIE5bkzdN9C/Y78fqgYOFcfg/DlKlKsO2yU
 f0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681177467; x=1683769467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=syP9nGp5blI+89WkbaX3k3BxM6rU9dg3U/tqJGC30xA=;
 b=mWqSUgjcs1sb7YOjGez9JyCGYPVWXJ82Mar3R/6Z0gufBfbRY/q9P1MDJu9XMC3ibD
 oSVImvT0C8WH+hD4HdRFRevvR6q0x9YKm2zAfY+KK4T+jJFmB7YOmiYiGqQpmNANPovX
 MrtfdWj4UPEV3l5oZmUWYgM+ru0WuCoFe/dB6k2vpe3GLXA/u8nGrq5LnVQiBazcpRuw
 nAqnVGoZN9XaNeHDL7YST21qBgf6QPLm3Zg6mLx0MVYsPwCif+Kjv/8LJF3Mj4F7ux8a
 f/3eRsKuKd/6tXW4ZhiupPzj+NzHJd8vNE4cuOLlYO17ZdUysaTz5IL925IEG9bfy+23
 LT4A==
X-Gm-Message-State: AAQBX9d2PLVxMDpQVDlxzKesAn9ITbdW9kZiLhfOgr6MYR9/ZdPnb75o
 Ir8tsb+9m0WezqPKYnp783r+09OMWHSfcfJx/rA=
X-Google-Smtp-Source: AKy350b1mt8jGgL+FpDZteSSr+nWtxGJ30ClUEzZcTMFVvxNA6z1V4qIq2U8ZojsNmXqJcnAIQnHbFBGstV0/ZiPreA=
X-Received: by 2002:ab0:4a1e:0:b0:68a:a9d:13f5 with SMTP id
 q30-20020ab04a1e000000b0068a0a9d13f5mr7266670uae.1.1681177466743; Mon, 10 Apr
 2023 18:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230406180351.570807-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230406180351.570807-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Apr 2023 11:44:00 +1000
Message-ID: <CAKmqyKNFwvBTyhhJ2_jGUaZ=z1YcxQu=Z7+nJeKHmb-bkDFRQg@mail.gmail.com>
Subject: Re: [PATCH v4 00/20] remove MISA ext_N flags from cpu->cfg
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x934.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 01:44:32 -0000

On Fri, Apr 7, 2023 at 4:06=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This new version was rebased on top of Alistair's riscv-to-apply.next @
> 9c60ca583cb ("hw/riscv: Add signature dump function ...").
>
> No other changes made.
>
> Changes from v3:
> - rebased with riscv-to-apply.next @ 9c60ca583cb
> - v3 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06911=
.html
>
> Daniel Henrique Barboza (20):
>   target/riscv: sync env->misa_ext* with cpu->cfg in realize()
>   target/riscv: remove MISA properties from isa_edata_arr[]
>   target/riscv/cpu.c: remove 'multi_letter' from isa_ext_data
>   target/riscv: introduce riscv_cpu_add_misa_properties()
>   target/riscv: remove cpu->cfg.ext_a
>   target/riscv: remove cpu->cfg.ext_c
>   target/riscv: remove cpu->cfg.ext_d
>   target/riscv: remove cpu->cfg.ext_f
>   target/riscv: remove cpu->cfg.ext_i
>   target/riscv: remove cpu->cfg.ext_e
>   target/riscv: remove cpu->cfg.ext_m
>   target/riscv: remove cpu->cfg.ext_s
>   target/riscv: remove cpu->cfg.ext_u
>   target/riscv: remove cpu->cfg.ext_h
>   target/riscv: remove cpu->cfg.ext_j
>   target/riscv: remove cpu->cfg.ext_v
>   target/riscv: remove riscv_cpu_sync_misa_cfg()
>   target/riscv: remove cfg.ext_g setup from rv64_thead_c906_cpu_init()
>   target/riscv: add RVG and remove cpu->cfg.ext_g
>   target/riscv/cpu.c: redesign register_cpu_props()

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu.c                        | 412 +++++++++++-----------
>  target/riscv/cpu.h                        |  19 +-
>  target/riscv/insn_trans/trans_rvzce.c.inc |   2 +-
>  3 files changed, 216 insertions(+), 217 deletions(-)
>
> --
> 2.39.2
>
>

