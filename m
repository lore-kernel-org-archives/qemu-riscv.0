Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDNBu-0001kj-6q
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jul 2022 05:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDNBs-0001kQ-Bj
 for qemu-riscv@nongnu.org; Mon, 18 Jul 2022 05:37:24 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDNBo-00018M-JC
 for qemu-riscv@nongnu.org; Mon, 18 Jul 2022 05:37:23 -0400
Received: by mail-ej1-x636.google.com with SMTP id j22so20169179ejs.2
 for <qemu-riscv@nongnu.org>; Mon, 18 Jul 2022 02:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=L7lIeXp7jX3pP5csSk4fWfxUEfYeop9zBL7ORE97oag=;
 b=T0bEuNf9xd9XHq7iDEoUtzHXGkWT6B3XCiLJ5CS6tfO1ONMGc/tUrvdEPlfAEeDjVT
 whZtGv88hh8w8TQR7yXyTgsbLh+u0rRGoMDEzwGXyfy1ocG6aoFG/6S10+/pgVPf2iRD
 R2VXjBydd73Jg5+gIUbC2NdDJptW12Jp45KUSZrboDs78vtmsOKa3+eIv2PUFh60lYJh
 cQ6CqPC5nip45Tc3UZTtWO64i7itY6bh1T73a3Dnni23AfEZBsbhn4ADRVFAnB5NMpOm
 wkUaJeeCYnRzDXUki0JexSr3DgCjLBUn5/ILcHwefkD5DYmO2sitscCRppB1NnbDJ3ry
 4WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L7lIeXp7jX3pP5csSk4fWfxUEfYeop9zBL7ORE97oag=;
 b=KeYESgYmSAIllyQXzM+2EzR8PqI4EMQy3tmWiQWC/uPaoZILHKE69JJ98hiol9+ZIK
 cJa1hyebl6LltpDDu0WE2FjkBAtaoG1q2tUofaRRD5oqAT85snlcW5VZmhDHvYsAmFwK
 /pEgwV5p2DPeHKNqjHAPL3+uekm0EN0WAJewMZD4GdQbYZtfBromorCnll2l44Zcq9lM
 jCoH6rXlSvLtEWNHxayG9dGF/JpOO1KihldvjW9pqCtLipANBSUlD1yCvCBdgQa9SG02
 peFGupRiryRxjAWfgb1sfijNQn+rX1kQAZ7TSB98s7O18YuLBbgEcpvAtZ/biB5lkns7
 PYBg==
X-Gm-Message-State: AJIora//Os6E2h+xqXDHjyw0kGz6xJYDBPLxzDJWKsVQrzdU/epB14K6
 +cWDV+liDaJiGcHWbjtVhpsoyQ==
X-Google-Smtp-Source: AGRyM1slyUMigGsHrgl9EAUVH5uKQ9A7czlz4tPVtEwUhItUCzBpzB4Zx6lrIUav2gFerNyEqcysCQ==
X-Received: by 2002:a17:906:4313:b0:726:3b55:704b with SMTP id
 j19-20020a170906431300b007263b55704bmr24849380ejm.398.1658137038684; 
 Mon, 18 Jul 2022 02:37:18 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 sa8-20020a170906eda800b00726dbb16b8dsm5239038ejb.65.2022.07.18.02.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 02:37:18 -0700 (PDT)
Date: Mon, 18 Jul 2022 11:37:17 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2 6/6] target/riscv: simplify the check in hmode to
 resue the check in riscv_csrrw_check
Message-ID: <20220718093717.75s2hwfjh7gogrr3@kamzik>
References: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
 <20220712063236.23834-7-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712063236.23834-7-liweiwei@iscas.ac.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 18 Jul 2022 09:37:24 -0000


s/resue/reuse/ in $SUBJECT and capitalize 'simplify'

On Tue, Jul 12, 2022 at 02:32:36PM +0800, Weiwei Li wrote:
> Just add 1 to the effective privledge level when in HS mode, then reuse the check
> 'effective_priv < csr_priv' in riscv_csrrw_check to replace the privilege level
> related check in hmode. Then, hmode will only check whether H extension is supported.

Please wrap commit message lines around 74.

> 
> when accessing Hypervior CSRs:

When

>    1) if access from M privilege level, the check of 'effective_priv < csr_priv'
> passes, returns hmode(...) which will return RISCV_EXCP_ILLEGAL_INST when H
> extension is not supported and return RISCV_EXCP_NONE otherwise.
>    2) if access from HS privilege level, effective_priv will add 1, the check
> passes too, also returns hmode(...) too.
>    3) if access from VS/VU privilege level, the check fails, and returns
> RISCV_EXCP_VIRT_INSTRUCTION_FAULT
>    4) if access from U privilege level, the check fails, and returns
> RISCV_EXCP_ILLEGAL_INST
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/csr.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index deddeb100e..aa87698d1d 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -312,13 +312,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
>  static RISCVException hmode(CPURISCVState *env, int csrno)
>  {
>      if (riscv_has_ext(env, RVH)) {
> -        /* Hypervisor extension is supported */
> -        if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
> -            env->priv == PRV_M) {
> -            return RISCV_EXCP_NONE;
> -        } else {
> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> -        }
> +        return RISCV_EXCP_NONE;
>      }
>  
>      return RISCV_EXCP_ILLEGAL_INST;
> @@ -3280,13 +3274,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>  #if !defined(CONFIG_USER_ONLY)
>      int csr_priv, effective_priv = env->priv;
>  
> -    if (riscv_has_ext(env, RVH) && env->priv == PRV_S) {
> +    if (riscv_has_ext(env, RVH) && env->priv == PRV_S &&
> +        !riscv_cpu_virt_enabled(env)) {
>          /*
> -         * We are in either HS or VS mode.
> -         * Add 1 to the effective privledge level to allow us to access the
> -         * Hypervisor CSRs. The `hmode` predicate will determine if access
> -         * should be allowed(HS) or if a virtual instruction exception should be
> -         * raised(VS).
> +         * We are in HS mode. Add 1 to the effective privledge level to
> +         * allow us to access the Hypervisor CSRs.
>           */
>          effective_priv++;
>      }
> -- 
> 2.17.1
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

