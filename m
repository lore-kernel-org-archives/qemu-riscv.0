Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGHr2-00068e-OK
	for mharc-qemu-riscv@gnu.org; Wed, 18 Aug 2021 05:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGHr0-00068D-T6; Wed, 18 Aug 2021 05:27:22 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:35454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGHqs-0001vN-Tq; Wed, 18 Aug 2021 05:27:22 -0400
Received: by mail-yb1-xb35.google.com with SMTP id z5so4046362ybj.2;
 Wed, 18 Aug 2021 02:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LI/AtadzficimxrlghGUIAXG2sM4gl9czjT/1FpDESE=;
 b=KAq+qoCAD3Xk2VExMA8dqiwU2XKbWKhoKvFB5/FMfL7JGfTj8EEFza95xp4acPE+7m
 d3oVnPn2I3qqqjJhIGnMHLvHxy1Vz0dyhg90XU6t6DcVpYmrGSl/mErTmjo8jDpzKN84
 wsOogmw8fBxSapR5tqoZgTvlvVPZ5CWVy4HaN+H6VTXGEulX1JkEqT28gq1qQKHoXg8d
 Xu50z+3gDtVrn4alASDBr29VJekfHHw7by7Xegato0cMwNhVtrgvvVNPgBahFz0p0ebJ
 74XH9rfGSpgNukHMIJ7sQyoqaCyHJk3C7WlXhkQkjYAwrBUhMj4DkJE+bYFguCKoSntF
 Vsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LI/AtadzficimxrlghGUIAXG2sM4gl9czjT/1FpDESE=;
 b=Jh1pz+f3dZZMRFWOE+iZ5vySoK/uuo5B4GuRNvPTjhQEszJlbps0ZG2+kF6+IQLpj+
 /PoWz9PkMse0CMSa2yrm2JTOBzMjVbMhlTUFu/7zrY8oeaKKZVdJL/5m+6ZVFnN71o4F
 ayKh7OzU2rY7pcUVlp/Ko2dF8/cHuBfKTOXespSLD8GnOo4GlP9ob/ckCrh95znOEfDT
 1/QC45PWCPTZ184pHsKWC/sf0JTdmuFL1jN0Sbc98JbplUlShSUEEARPwZTvI/vgV3sh
 MZdr0z1O1EAJ9fO1UtQFowKhwifiDVLMxevNn0ax//05qbKz+d80hHYZWwXjQyfNmg9z
 WRZQ==
X-Gm-Message-State: AOAM532nIh1Dv4mF/giIDH+0ESalZ5k5HmwZRC7eKXG/n7f8xWshCqdD
 kJgLCI6v0bUbGwopXzA/HhbsDyRWOAYl+pJ/1I8=
X-Google-Smtp-Source: ABdhPJx5QBLogo69q1HNNAUscX8A5msCZqxmqwWlE5DCYJd3377XMEjhVBolUx31B1tce84NUexL61HuIniihzB7Ne0=
X-Received: by 2002:a5b:304:: with SMTP id j4mr10009654ybp.314.1629278833336; 
 Wed, 18 Aug 2021 02:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-4-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-4-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 18 Aug 2021 17:27:02 +0800
Message-ID: <CAEUhbmV4kammRMDmhRiPmskGqhfPUb7s2AeiBZinUWqywZoUXQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/21] target/riscv: Add DisasContext to gen_get_gpr,
 gen_set_gpr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 18 Aug 2021 09:27:23 -0000

On Wed, Aug 18, 2021 at 5:21 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>

Can we put some commit message here to explain the reason behind this change?

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 58 ++++++++++++-------------
>  target/riscv/insn_trans/trans_rva.c.inc | 18 ++++----
>  target/riscv/insn_trans/trans_rvb.c.inc |  4 +-
>  target/riscv/insn_trans/trans_rvd.c.inc | 32 +++++++-------
>  target/riscv/insn_trans/trans_rvf.c.inc | 32 +++++++-------
>  target/riscv/insn_trans/trans_rvh.c.inc | 52 +++++++++++-----------
>  target/riscv/insn_trans/trans_rvi.c.inc | 44 +++++++++----------
>  target/riscv/insn_trans/trans_rvm.c.inc | 12 ++---
>  target/riscv/insn_trans/trans_rvv.c.inc | 36 +++++++--------
>  9 files changed, 144 insertions(+), 144 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

