Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVX2e-0002ow-AY
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 07:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pVX2c-0002nq-GO
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 07:19:10 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pVX2a-0005i7-Qo
 for qemu-riscv@nongnu.org; Fri, 24 Feb 2023 07:19:10 -0500
Received: by mail-wr1-x430.google.com with SMTP id r7so13554417wrz.6
 for <qemu-riscv@nongnu.org>; Fri, 24 Feb 2023 04:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EmLIkt0pmvZLBb5MswRldm9Wu2tsPjcnQv05JqaQ4/M=;
 b=FOZtzqWvmb/ChQoTqtrAXd4Hz8F1zv7wKqr4iJYucMYBgVqZYnDHieKCF/8WyMfdOJ
 +TLuPrGQGVexU4kP+fVtral15o5qAoqpl6SxKvkGen+dQP+s1bE0bc1I+zpxzqMvTpRO
 1BgIBXAYShE27oh99UepNZT3JHtJkDzFy9nC0eOb8THNeG37P/2cQr/VhRMICxtllCg7
 oHUXpje+bLelk05k8hOALVDIb8R7eTUF8IfmJ3pnH+epty/3qRNS6dgkjTEstF7kbokR
 xK46/xfADfVyxO4XYE/QiEtmbXHbaKWytSuGr8hikUttuDnKR+/aD308Ny5mazDb5IGf
 1oXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EmLIkt0pmvZLBb5MswRldm9Wu2tsPjcnQv05JqaQ4/M=;
 b=U2sKsNqtKhdFBYxYmSa/dK9/gqvU4qrjVeKaQihin+f7oJll2LEci4S2frJD9z7aK8
 iwSAOKovW3xTgkJN2iNTtT/2QNIlLbaVNZ5VGIonY7FHwUQMjp7QWUWBh7Ur4Uptq2+E
 8wK5UQpHc7Gpdo5DYhTRzaSIoRdLvP+FwMkJ2DYJ7+ut6K/O2Ngsp5mTloZ5N/aAZ4Dz
 UNXVjVgEBq+34uF3j60Z5mF2MsXltn3S47k8LrDd+A24RpzwIVCL62L7fFcRykgr19xp
 C6BuIAXspbc2EHo4HZRTn30kO4mzFyuJmtvKK4z3x9ehV4rfYCdvchb7meG4NdVyDq3N
 8Phg==
X-Gm-Message-State: AO0yUKWVTTzJ0qdN+WTWa3EWtVKx60hsb/goKcueyu3aIycpCsmXCDux
 0+XzoEP2KRPX0URVn7HIXBA8Kg==
X-Google-Smtp-Source: AK7set+yisxlwi0RsL75WgvEv2pWnSYetqjbW2G4BR9J3EKJq6limBJB9RhRxT15L8f4zIfJjwOpPA==
X-Received: by 2002:adf:ea83:0:b0:2c5:6180:516e with SMTP id
 s3-20020adfea83000000b002c56180516emr11695244wrm.39.1677241146369; 
 Fri, 24 Feb 2023 04:19:06 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b002c59e001631sm12668772wrs.77.2023.02.24.04.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 04:19:05 -0800 (PST)
Date: Fri, 24 Feb 2023 13:19:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 2/6] target/riscv: Fix the relationship of PBMTE/STCE
 fields between menvcfg and henvcfg
Message-ID: <20230224121905.mciqkge4qji6xczb@orel>
References: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
 <20230224040852.37109-3-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224040852.37109-3-liweiwei@iscas.ac.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 24 Feb 2023 12:19:10 -0000

On Fri, Feb 24, 2023 at 12:08:48PM +0800, Weiwei Li wrote:
> henvcfg.PBMTE/STCE are read-only zero if menvcfg.PBMTE/STCE are zero.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/csr.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index feae23cab0..02cb2c2bb7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1956,7 +1956,11 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>          return ret;
>      }
>  
> -    *val = env->henvcfg;
> +    /*
> +     * henvcfg.pbmte is read_only 0 when menvcfg.pbmte = 0
> +     * henvcfg.stce is read_only 0 when menvcfg.stce = 0
> +     */
> +    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) | env->menvcfg);
>      return RISCV_EXCP_NONE;
>  }
>  
> @@ -1972,7 +1976,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>      }
>  
>      if (riscv_cpu_mxl(env) == MXL_RV64) {
> -        mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> +        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);

nit:

  While HENVCFG_PBMTE == MENVCFG_PBMTE, I'd prefer we use
  MENVCFG_* with menvcfg and HENVCFG_* with henvcfg.

>      }
>  
>      env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
> @@ -1990,14 +1994,15 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>          return ret;
>      }
>  
> -    *val = env->henvcfg >> 32;
> +    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) |
> +                            env->menvcfg)) >> 32;
>      return RISCV_EXCP_NONE;
>  }
>  
>  static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>                                    target_ulong val)
>  {
> -    uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
> +    uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
>      uint64_t valh = (uint64_t)val << 32;
>      RISCVException ret;
>  
> -- 
> 2.25.1
> 
> 

Thanks,
drew

