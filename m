Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOEIG-0003vP-LI
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 04:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oOEI1-0003s3-LC
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 04:20:45 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oOEHx-0001c1-Se
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 04:20:36 -0400
Received: by mail-ej1-x631.google.com with SMTP id w19so23240331ejc.7
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 01:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=+kKt8V8bMab3XLUr/76uPUSlOUpzzELbVi46hKmH6A4=;
 b=PTCHyBEsL4ZXOfG5/lLZHIqIa6lDdoqxkoCpSbcjP0r84XX2K44YtldMplZTKrEZSG
 ZjxBVD1qFNlkHAzsqDgKNtuOTDNLLOOYNdUColnpAX/uHFozGZ6nusXw3Jt4SThf+sHH
 QKZTh1X2vHtb7JNcZFsLOCH4Pyc2ighKKIiVofNz7jgbraM7zgF/k0SE3mXfr6FccGa9
 bO0Xl+LsmY50kiS8CHXqTYtzWEzZaGSzu33SzR/YDU6tf9Ui/cRqw98yTmVGVi7xSUNH
 AUCB2Jxw66oBmDwbybguUzGyR0ltYJHn1pcO4xIbjJf/ktERNreMOj+aV8mpDGzy7RZv
 gPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=+kKt8V8bMab3XLUr/76uPUSlOUpzzELbVi46hKmH6A4=;
 b=cnI/hgXhvkNrWJ2Di/a0bWpTYlpcsFfXUr0bTgqcvyoZWympYmnq6nTe50n5GGRaRV
 OeiUbkrFaq/FxpB05GGBdSKqQ+/k/RO+lHYIVvHQEFNDyur3FXCEdaBMqgXH+goscQn8
 40c7j0BVhLJbttBWqw3eSibjESVSYFw44PS+dWMN+ZkEj7/WV6NtdXMXjC51P/KmSU6M
 dcWT4fcuPB1lMbNPHA7bnE4NEf6yLaj35u4jzmutI98zssodI+44FJHYrZQz0+eWn7qw
 yOM36x3RPqJ5KcMUWbMdfZaX5B4oQZKW6xgwTG0fsrNVw94+mo0bBW4kQXD5NXzPB0i/
 7hZA==
X-Gm-Message-State: ACgBeo2+w3Py8TdjpKZ+DsJsLB3bMzjugmcA1/o+tNcbKBH/l/V+r3bL
 64pQGo075TYSVHYQGfw0nNNSOw==
X-Google-Smtp-Source: AA6agR7ayLyBUURZ0WeAw2gQC5GpZoDzSG+3yOVtKnLf1sxPd9ykhpFEMXugPMCPQ6ToUb/RMszaoQ==
X-Received: by 2002:a17:907:2e02:b0:732:7679:cae2 with SMTP id
 ig2-20020a1709072e0200b007327679cae2mr15762672ejc.179.1660724429395; 
 Wed, 17 Aug 2022 01:20:29 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a170906844800b0072af102e65csm6468762ejy.152.2022.08.17.01.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 01:20:28 -0700 (PDT)
Date: Wed, 17 Aug 2022 10:20:27 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2] target/riscv: fix csr check for cycle{h}, instret{h}, 
 time{h}, hpmcounter3-31{h}
Message-ID: <20220817082027.6dquoa76dhafvxch@kamzik>
References: <20220817073635.29609-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817073635.29609-1-liweiwei@iscas.ac.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Wed, 17 Aug 2022 08:20:51 -0000

On Wed, Aug 17, 2022 at 03:36:35PM +0800, Weiwei Li wrote:
> - modify check for mcounteren to work in all less-privilege mode
> - modify check for scounteren to work only when S mode is enabled
> - distinguish the exception type raised by check for scounteren between U
> and VU mode
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
> v2:
>  - Rebase on patches v13 for "Improve PMU support"
> 
>  target/riscv/csr.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>  
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2dcd4e5b2d..a6bf2ff964 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -98,17 +98,22 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
>  
>  skip_ext_pmu_check:
>  
> -    if (((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) ||
> -        ((env->priv == PRV_U) && (!get_field(env->scounteren, ctr_mask)))) {
> +    if ((env->priv < PRV_M) && (!get_field(env->mcounteren, ctr_mask))) {

I'd drop the unnecessary ()'s on both sides of the &&

>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  
>      if (riscv_cpu_virt_enabled(env)) {
> -        if (!get_field(env->hcounteren, ctr_mask) &&
> -            get_field(env->mcounteren, ctr_mask)) {
> +        if (!get_field(env->hcounteren, ctr_mask) ||
> +            ((env->priv == PRV_U) && !get_field(env->scounteren, ctr_mask))) {

() around env->priv == PRV_U can be dropped too

>              return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>          }
>      }
> +
> +    if (riscv_has_ext(env, RVS) && (env->priv == PRV_U) &&

And here. Hmm, it seems a lot of env->priv checks in this file have
unnecessary ()'s. Oh well, I like lisp.

Thanks,
drew

> +        !get_field(env->scounteren, ctr_mask)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
>  #endif
>      return RISCV_EXCP_NONE;
>  }
> -- 
> 2.17.1
> 
> 

