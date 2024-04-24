Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA79BC07E8E
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 14:00:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rzdAB-0007wa-6P; Wed, 24 Apr 2024 09:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rzdA8-0007wN-0m
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 09:59:52 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rzdA5-00058a-Bv
 for qemu-riscv@nongnu.org; Wed, 24 Apr 2024 09:59:51 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a55bf737cecso343860066b.0
 for <qemu-riscv@nongnu.org>; Wed, 24 Apr 2024 06:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1713967187; x=1714571987; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+m29vi8m3i4+2iYoUOqA5arBaT0yQL5TGh2rM/Di/zs=;
 b=YFuON2igp94USAxyPPGvzsuXjCamozfRyRLAUVW3nRpD0I6MX7f3eRh+rHRXnHyEWs
 WzPK+sskGp9Kd69leyssTZg3y9ziBNmWYyqdOTqHNb1pdYx4lgK0bjtuGsiXoqoVq3AY
 ismgjpGX+Cr+qTNkpEuLGcbivfAEtVrjHLw/dW3bzfLcCEUDZUHOspcoMF3hrn1dkQR8
 ItR+wGOrWowdTUFliW+izmb07yKpvzHgc62lY8oUDRSniN/5HhhxPNdnqZHuOA78d1/f
 tpOCix9MJKXH3UWv912isMTzmM3z7l36eGr8OzpLgHUc8pKVteKH6J9GWoHm7qqPynb3
 J5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713967187; x=1714571987;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+m29vi8m3i4+2iYoUOqA5arBaT0yQL5TGh2rM/Di/zs=;
 b=k+HxbYFjrOLEMJRHhusJUjpVnaFQAAxEP+QerRSkb4ks214xLFcRWL687f7bmQQSq7
 4eewT4m55SzMSNosDRh5oAovWT4ktAPCymzFgTCUju29Np9uH/X3X/xnFBUjujAWi+4k
 iwmPPIYsLT4vJuto06rKTjh3AyoXI555GlxxGsPG8wCWcthfPyXjejBK+BiYrDym8M5p
 1dCPPPl3madFqoo9of8nZWTWZPPkJauZmmlvH31Ebn+aU9nHBQSyEETrD/q2mARF1eRI
 TUObhb5sH5en+H6UUy2IzT6COEyM+TS/eZMnQhU0mN02BpL6PEksk03gjGUMAM9sWpz5
 uV0w==
X-Gm-Message-State: AOJu0YxmzdT7dgAPeFotaDVIALDXZ2NIjWYxQl5PFkE2EX7vDo/No35w
 WdjZo4X5omFqJh7WoK7JjoyP28cvVJdmhpZB7SkShy0mlATi/uxcUqbWBmgoDCvTx5Z+fRrDSM9
 SQiw=
X-Google-Smtp-Source: AGHT+IEa5Gc9r0sJsI5ieifJ91eaH0rL0QcvKKrOFMvjp/qIL7HTY64of4pN3oTrtijRkdvuy1U7hg==
X-Received: by 2002:a17:906:5a91:b0:a55:90f0:bdf2 with SMTP id
 l17-20020a1709065a9100b00a5590f0bdf2mr1676378ejq.32.1713967187114; 
 Wed, 24 Apr 2024 06:59:47 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 hg7-20020a170906f34700b00a4e5a6b57a2sm8336552ejb.163.2024.04.24.06.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 06:59:46 -0700 (PDT)
Date: Wed, 24 Apr 2024 15:59:45 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: qemu-riscv@nongnu.org
Cc: christoph.muellner@vrull.eu, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v2] target/riscv: Raise exceptions on wrs.nto
Message-ID: <20240424-b70cfbbeca1a3870c53afbc2@orel>
References: <20240312152901.512001-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240312152901.512001-2-ajones@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Mar 12, 2024 at 04:29:02PM +0100, Andrew Jones wrote:
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
> Reviewed-by: Christoph M??llner <christoph.muellner@vrull.eu>

I came here to write a gentle ping and noticed this should be 'Müllner'.
I'm not sure what happened to the utf8.

I'll send a v3 with the tag fixed.

Thanks,
drew


> ---
> v2:
>  - Added #ifndef CONFIG_USER_ONLY around helper call
> 
>  target/riscv/helper.h                       |  1 +
>  target/riscv/insn_trans/trans_rvzawrs.c.inc | 29 ++++++++++++++-------
>  target/riscv/op_helper.c                    | 11 ++++++++
>  3 files changed, 32 insertions(+), 9 deletions(-)
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
>  DEF_HELPER_1(tlb_flush, void, env)
>  DEF_HELPER_1(tlb_flush_all, void, env)
>  /* Native Debug */
> diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> index 32efbff4d5a5..0eef03383889 100644
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
> @@ -40,12 +40,23 @@ static bool trans_wrs(DisasContext *ctx)
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
> +#ifndef CONFIG_USER_ONLY
> +    gen_helper_wrs_nto(tcg_env);
> +#endif
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

