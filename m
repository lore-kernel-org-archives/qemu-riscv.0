Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox161-000517-5Q
	for mharc-qemu-riscv@gnu.org; Mon, 21 Nov 2022 02:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ox160-00050T-8l; Mon, 21 Nov 2022 02:20:00 -0500
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ox15y-0007D0-OL; Mon, 21 Nov 2022 02:20:00 -0500
Received: by mail-ua1-x929.google.com with SMTP id h11so683587uar.4;
 Sun, 20 Nov 2022 23:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8d+pWw2j4EB1Vf39qXDAYwIuTnVYV45JZkZZ5KG1gw8=;
 b=CvE0Te013Oz57soyjwToWyKhbo2xILEBeqcQyW2BAr9LStOKPe2ahPq6WJKOFuqQsZ
 UGEHV2Ct7c51Zs05A1wcDgkVaM5Evzl/KAn0ELlveqBEuw73m03mpUiFu7Avw4+3t+dJ
 3izI741Vepe3lo3/Tg4Ri8XNJJJ8Dj9OpkASHLPtwRhGuK/CfPqUYF9Ps0tRj+zKPLbQ
 SOnXya8FHycP+UVMGHCDSfcA3QGmSpXVWo72AOhh+E9OBvP1lZ0sXcxRmClz45Fot/38
 IF3s1jYOthUn+2/B+IXv3HPE0lrn+r8LYJp0k4pCXuQnC7Tljo1ggXVc7hMarTyqL2Hv
 hUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8d+pWw2j4EB1Vf39qXDAYwIuTnVYV45JZkZZ5KG1gw8=;
 b=q7oxqAGwQ6SV6iDGz0YcHKByQ5R96Ejt2IqxN7o4oBiAwCov/wCs3b85bg9T3Nn7d3
 N/PN2DiC504lmsS/mnKJtlHniY4wY38laZ4oli35VKUfkNDlp2M8OwVfu/soRZdCm+zu
 1AcKfW79PvOwUvLbLjKZTIoiSBr1G7yW0xgXHxatjkOldd6gBSJQxkzPrHAPL6DlXaQo
 AR2uLXCqNO1h3+fWlnj1Zdv+G4y0DezGUBdxu2OFdyT7zL2AulamklbZT5QducPsW8Q0
 bFCkUDWLpI6W/jj334Iuw5Rpyyjc/ba0MU4ukHk8+BDAdgOHvCLHoWKyVAeo2X/GAv3y
 zNWg==
X-Gm-Message-State: ANoB5pls/nhmAOa39Vg9oDYWsgG6ChQQJVHPDHCARE6GH3HTmnD3LsgW
 U1KXQx8EJNDHuwrrP9rcG5T4gE2TvpF7qCdAZ0U=
X-Google-Smtp-Source: AA0mqf4DfQlktcTfpkvwUaOsigCKDu3P3q/p0tpSOsgnxS6KVjLlwRVQUyC1cAKek9d3SVp2k0ZSxGnhxIAfwWHUaMo=
X-Received: by 2002:ab0:650d:0:b0:40d:468:3e79 with SMTP id
 w13-20020ab0650d000000b0040d04683e79mr9292756uam.11.1669015197271; Sun, 20
 Nov 2022 23:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20221118123728.49319-1-liweiwei@iscas.ac.cn>
 <20221118123728.49319-4-liweiwei@iscas.ac.cn>
In-Reply-To: <20221118123728.49319-4-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 21 Nov 2022 17:19:30 +1000
Message-ID: <CAKmqyKMrEgE=BycjfdvQM84nMz3kaoWO-PnjaEKWfzXr+U9C4w@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] target/riscv: add support for Zcf extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: richard.henderson@linaro.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
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
X-List-Received-Date: Mon, 21 Nov 2022 07:20:00 -0000

On Fri, Nov 18, 2022 at 10:44 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> Separate c_flw/c_fsw from flw/fsw to add check for Zcf extension
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn16.decode              |  8 ++++----
>  target/riscv/insn_trans/trans_rvf.c.inc | 18 ++++++++++++++++++
>  2 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/insn16.decode b/target/riscv/insn16.decode
> index ccfe59f294..f3ea650325 100644
> --- a/target/riscv/insn16.decode
> +++ b/target/riscv/insn16.decode
> @@ -109,11 +109,11 @@ sw                110  ... ... .. ... 00 @cs_w
>  # *** RV32C and RV64C specific Standard Extension (Quadrant 0) ***
>  {
>    ld              011  ... ... .. ... 00 @cl_d
> -  flw             011  ... ... .. ... 00 @cl_w
> +  c_flw           011  ... ... .. ... 00 @cl_w
>  }
>  {
>    sd              111  ... ... .. ... 00 @cs_d
> -  fsw             111  ... ... .. ... 00 @cs_w
> +  c_fsw           111  ... ... .. ... 00 @cs_w
>  }
>
>  # *** RV32/64C Standard Extension (Quadrant 1) ***
> @@ -174,9 +174,9 @@ sw                110 .  .....  ..... 10 @c_swsp
>  {
>    c64_illegal     011 -  00000  ----- 10 # c.ldsp, RES rd=0
>    ld              011 .  .....  ..... 10 @c_ldsp
> -  flw             011 .  .....  ..... 10 @c_lwsp
> +  c_flw           011 .  .....  ..... 10 @c_lwsp
>  }
>  {
>    sd              111 .  .....  ..... 10 @c_sdsp
> -  fsw             111 .  .....  ..... 10 @c_swsp
> +  c_fsw           111 .  .....  ..... 10 @c_swsp
>  }
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index 93657680c6..426518957b 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -24,6 +24,12 @@
>              return false; \
>  } while (0)
>
> +#define REQUIRE_ZCF(ctx) do {                  \
> +    if (!ctx->cfg_ptr->ext_zcf) {              \
> +        return false;                          \
> +    }                                          \
> +} while (0)
> +
>  #ifndef CONFIG_USER_ONLY
>  static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
>  {
> @@ -96,6 +102,18 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>      return true;
>  }
>
> +static bool trans_c_flw(DisasContext *ctx, arg_flw *a)
> +{
> +    REQUIRE_ZCF(ctx);
> +    return trans_flw(ctx, a);
> +}
> +
> +static bool trans_c_fsw(DisasContext *ctx, arg_fsw *a)
> +{
> +    REQUIRE_ZCF(ctx);
> +    return trans_fsw(ctx, a);
> +}
> +
>  static bool trans_fmadd_s(DisasContext *ctx, arg_fmadd_s *a)
>  {
>      REQUIRE_FPU;
> --
> 2.25.1
>
>

