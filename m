Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC513C54E5D
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 15:30:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rk45X-0001w0-Ux; Tue, 12 Mar 2024 11:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rk45S-0001pl-0Z
 for qemu-riscv@nongnu.org; Tue, 12 Mar 2024 11:30:43 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rk45P-0000OE-CA
 for qemu-riscv@nongnu.org; Tue, 12 Mar 2024 11:30:41 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-413428499a6so4950905e9.1
 for <qemu-riscv@nongnu.org>; Tue, 12 Mar 2024 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710257436; x=1710862236; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aU8LiiYk+Y94Fsgdw1YQYKNMa1KdAYeXAKIXETH7BLU=;
 b=HR0UzEV6aViZ9TyVcBAFxmjNOEqSXStFG4qSI4cvKMFzm/Fr1kKnnv3zDEYs7Ycb+B
 LDhpxwPhzz7mEqMuGoj/k9ghCawB12chZS0ZJ1bgXqZ6ncsYnTXPD6rzxWU3p8SW0fuJ
 QqjBhV+vFE4HYThrRaCETmNnZPIcgDy8eQV4oWvb7lOaR+9WN9jI001HXypSeS1fddvU
 i9ZZokMRJVFrY+oSKfDPrQ7AO5ABCuzheTVCQEU4veJj62PNQ3b7TyXTOTNeKPuGaZeS
 HV2ZxOmFEZpzZat9PY0SSaQU1jXQAk3l5i6Rn4mKynQ05CeA4CRyU6vJtkHk3V1cYuEs
 rB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710257436; x=1710862236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aU8LiiYk+Y94Fsgdw1YQYKNMa1KdAYeXAKIXETH7BLU=;
 b=G7f32NVjxVVSVUihLjJ/rNK3Hj2Vt/7WC/Cxx1Y0AlmXQloyYwRPRSNtJXeexUVOi/
 TKrhKHsIuLhbBkirldyfOhZR+S241osDEi0+5gsnAE9qmMYYZmpRLK1PJg5Wwdq9g34E
 kfCyTjA/2ZJtl81+1c0q6X0Sd1YvCzgNDya9x87JEX7cC8to9wU+ckQjw9vSSHhQrr8W
 B9dEJMLtE+ujZ9+LlJQfmVAXcjQLWemp+Yj7mxgg4WnHiF0vLsuOB2v2FBFKYV93ljKo
 p8Oo2AO3/Dbk0JwlBYgG10vapk5A5Vl/3qL/o+IQtbZEuyFbrvapGO1AX3MfD1dzT0R8
 zL9A==
X-Gm-Message-State: AOJu0Yw1l6P2jUZPbKxH9MUGznOAYvP9jDi9AhFjSTqjtEXHi8nIKfwe
 XwtIUMzbXQAQ2cEE6t99lbras3+TXQ9PCNESRnM0z13nJr6XPMg0E6LOv4Yxu9/9P/OAHhsaTRt
 L
X-Google-Smtp-Source: AGHT+IHthl+CHAZPQJVlnhaqNjpqmlBrwxXkvjJgXoUqn/Jspjamb0QFfbGYUT0P4SPk2g1FtoZAhg==
X-Received: by 2002:a05:600c:3148:b0:412:d854:e226 with SMTP id
 h8-20020a05600c314800b00412d854e226mr7615417wmo.2.1710257436537; 
 Tue, 12 Mar 2024 08:30:36 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 fl17-20020a05600c0b9100b0041338f660d8sm2168259wmb.25.2024.03.12.08.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 08:30:36 -0700 (PDT)
Date: Tue, 12 Mar 2024 16:30:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: christoph.muellner@vrull.eu, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH] target/riscv: Raise exceptions on wrs.nto
Message-ID: <20240312-b36cbb1d7258b86295bf7d43@orel>
References: <20240308081219.8061-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308081219.8061-2-ajones@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Mar 08, 2024 at 09:12:20AM +0100, Andrew Jones wrote:
> Implementing wrs.nto to always just return is consistent with the
> specification, as the instruction is permitted to terminate the
> stall for any reason, but it's not useful for virtualization, where
> we'd like the guest to trap to the hypervisor in order to allow
> scheduling of the lock holding VCPU. Change to always immediately
> raise exceptions when the appropriate conditions are present,
> otherwise continue to just return. Note, immediately raising
> exceptions is also consistent with the specification since the
> time limit that should expire prior to the exception is
> implementation-specific.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  target/riscv/helper.h                       |  1 +
>  target/riscv/insn_trans/trans_rvzawrs.c.inc | 27 ++++++++++++++-------
>  target/riscv/op_helper.c                    | 11 +++++++++
>  3 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 8a635238514d..451261ce5a4f 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -132,6 +132,7 @@ DEF_HELPER_6(csrrw_i128, tl, env, int, tl, tl, tl, tl)
>  DEF_HELPER_1(sret, tl, env)
>  DEF_HELPER_1(mret, tl, env)
>  DEF_HELPER_1(wfi, void, env)
> +DEF_HELPER_1(wrs_nto, void, env)

This is inside an #ifndef CONFIG_USER_ONLY, so I should have wrapped
the call to it with an #ifndef CONFIG_USER_ONLY as well. I just sent
a v2 doing that.

Thanks,
drew

>  DEF_HELPER_1(tlb_flush, void, env)
>  DEF_HELPER_1(tlb_flush_all, void, env)
>  /* Native Debug */
> diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> index 32efbff4d5a5..5dfc3a943fde 100644
> --- a/target/riscv/insn_trans/trans_rvzawrs.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> @@ -16,7 +16,7 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -static bool trans_wrs(DisasContext *ctx)
> +static bool trans_wrs_sto(DisasContext *ctx, arg_wrs_sto *a)
>  {
>      if (!ctx->cfg_ptr->ext_zawrs) {
>          return false;
> @@ -40,12 +40,21 @@ static bool trans_wrs(DisasContext *ctx)
>      return true;
>  }
>  
> -#define GEN_TRANS_WRS(insn)                                     \
> -static bool trans_ ## insn(DisasContext *ctx, arg_ ## insn *a)  \
> -{                                                               \
> -    (void)a;                                                    \
> -    return trans_wrs(ctx);                                      \
> -}
> +static bool trans_wrs_nto(DisasContext *ctx, arg_wrs_nto *a)
> +{
> +    if (!ctx->cfg_ptr->ext_zawrs) {
> +        return false;
> +    }
>  
> -GEN_TRANS_WRS(wrs_nto)
> -GEN_TRANS_WRS(wrs_sto)
> +    /*
> +     * Depending on the mode of execution, mstatus.TW and hstatus.VTW, wrs.nto
> +     * should raise an exception when the implementation-specific bounded time
> +     * limit has expired. Our time limit is zero, so we either return
> +     * immediately, as does our implementation of wrs.sto, or raise an
> +     * exception, as handled by the wrs.nto helper.
> +     */
> +    gen_helper_wrs_nto(tcg_env);
> +
> +    /* We only get here when helper_wrs_nto() doesn't raise an exception. */
> +    return trans_wrs_sto(ctx, NULL);
> +}
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index f414aaebdbab..2baf5bc3ca19 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -380,6 +380,17 @@ void helper_wfi(CPURISCVState *env)
>      }
>  }
>  
> +void helper_wrs_nto(CPURISCVState *env)
> +{
> +    if (env->virt_enabled && (env->priv == PRV_S || env->priv == PRV_U) &&
> +        get_field(env->hstatus, HSTATUS_VTW) &&
> +        !get_field(env->mstatus, MSTATUS_TW)) {
> +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
> +    } else if (env->priv != PRV_M && get_field(env->mstatus, MSTATUS_TW)) {
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +    }
> +}
> +
>  void helper_tlb_flush(CPURISCVState *env)
>  {
>      CPUState *cs = env_cpu(env);
> -- 
> 2.44.0
> 

