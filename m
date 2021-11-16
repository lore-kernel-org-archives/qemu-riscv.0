Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mmovZ-00077D-SW
	for mharc-qemu-riscv@gnu.org; Mon, 15 Nov 2021 22:14:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmovX-00070g-Sb; Mon, 15 Nov 2021 22:14:31 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=42969
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mmovW-0001m0-Dl; Mon, 15 Nov 2021 22:14:31 -0500
Received: by mail-io1-xd2d.google.com with SMTP id x10so24172854ioj.9;
 Mon, 15 Nov 2021 19:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oMTg1wBY0JxL7n3oFgfpzFzne9Q2jgWYFfuzX54VuCM=;
 b=WfWfJkH0jUfKym2HG13nnKjGMGSdu/iqAN/ORvrqo0E7/C+xooAQ1kThJuPjZ0dLAm
 6bCxWp3E54ivdFSFHnN3d35mHzSXP+HaWZ4Up0QlOE0NxRtL3zK3GOmbopSe5827YVtn
 7c0V5dObpox9CSflDO5mHw5K+DvSAYMbXIK7lRsyvRPM1TOh9dUzTzeneHXSl+Ph666j
 xRou9HtXuwbLnnxVDAub6iSLzaQ0zLONTqk+8c2dr8mMBd6krEkFlI8kEgT1ThdCFx54
 7heHRYh/Xny0/sZv6dSAM/6S23mKMdLt5b/rCuLuZBrD68drWlZjo8DnnCFOu1wyVDqL
 4j2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oMTg1wBY0JxL7n3oFgfpzFzne9Q2jgWYFfuzX54VuCM=;
 b=1b/MJEpMHAKKg9drMEXp50cJ2wP3xg6lXSWDYBFtL3LTOhWRGI595KL0YucMfObY9m
 ihpvH9lmSCJNKwmLQOLBX2vFUaI9T+cHWITKPGezHhgDXUZ7NxFuKg+DmL79J1Zw3WeP
 cva52m9CDoYSm+NrCZBJ8gc1UkESbf1ClpK0dA9pqo1Ytui1pYExlzcQDoaMo+JdBUTV
 7rhBTtwjLy7DF2HD+nCnqnxBhpqztg18jGpemOnwE/5FcfAmsGwYTqAiNMO4wQ4i5GQB
 ruydZKiWJ5HLrhwLYMAAWskvpvBvYq2+bfUVpLCHEOXbAhdSicbleDgLABsTRW02iAVe
 OxLg==
X-Gm-Message-State: AOAM531VGyldVEDsU23TYt28hEciIe4zvqZ26+xTna92YETVL56mPOHc
 fTJIsnpHVfE32VY1WO167WHK9U+m8/y2DRd2PD8=
X-Google-Smtp-Source: ABdhPJxo3jU+J20VeHQnK1R+huU/gGFe/L0tNxaP/rTpMSSCFUIC8SsMIme8gR+PAJwpTOLG/qpaPtO7bzOONduxM4k=
X-Received: by 2002:a05:6602:1487:: with SMTP id
 a7mr2552547iow.57.1637032468950; 
 Mon, 15 Nov 2021 19:14:28 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-8-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-8-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Nov 2021 13:14:02 +1000
Message-ID: <CAKmqyKPrNtjb-tCEH5hoy+bjraB0P5Pp8MpW=Uq-MT2he8UCDw@mail.gmail.com>
Subject: Re: [PATCH v4 07/20] target/riscv: Adjust csr write mask with XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 16 Nov 2021 03:14:32 -0000

On Fri, Nov 12, 2021 at 1:58 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Write mask is representing the bits we care about.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>  target/riscv/op_helper.c                | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index e51dbc41c5..40c81421f2 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -486,7 +486,7 @@ static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
>          return do_csrw(ctx, a->csr, src);
>      }
>
> -    TCGv mask = tcg_constant_tl(-1);
> +    TCGv mask = tcg_constant_tl(get_xl(ctx) == MXL_RV32 ? UINT32_MAX : -1);
>      return do_csrrw(ctx, a->rd, a->csr, src, mask);
>  }
>
> @@ -537,7 +537,7 @@ static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
>          return do_csrw(ctx, a->csr, src);
>      }
>
> -    TCGv mask = tcg_constant_tl(-1);
> +    TCGv mask = tcg_constant_tl(get_xl(ctx) == MXL_RV32 ? UINT32_MAX : -1);
>      return do_csrrw(ctx, a->rd, a->csr, src, mask);
>  }
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 095d39671b..561e156bec 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -50,7 +50,8 @@ target_ulong helper_csrr(CPURISCVState *env, int csr)
>
>  void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
>  {
> -    RISCVException ret = riscv_csrrw(env, csr, NULL, src, -1);
> +    target_ulong mask = cpu_get_xl(env) == MXL_RV32 ? UINT32_MAX : -1;
> +    RISCVException ret = riscv_csrrw(env, csr, NULL, src, mask);
>
>      if (ret != RISCV_EXCP_NONE) {
>          riscv_raise_exception(env, ret, GETPC());
> --
> 2.25.1
>
>

