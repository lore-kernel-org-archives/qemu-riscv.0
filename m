Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDMh9-0003f5-TX
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jul 2022 05:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDMh8-0003cb-8q
 for qemu-riscv@nongnu.org; Mon, 18 Jul 2022 05:05:38 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDMh6-0004iC-OU
 for qemu-riscv@nongnu.org; Mon, 18 Jul 2022 05:05:37 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ss3so19973439ejc.11
 for <qemu-riscv@nongnu.org>; Mon, 18 Jul 2022 02:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Swzz0Y17XGey78Ri47tMzkeQ9mKkN9mT2xxxwEL2XSI=;
 b=l3Wno/qwprgisOUCzSdzEzY/i2a01tBWwgF/XFwC1xllq8kj+n21fNtRPN7gyV3L1S
 SyBvdYBw3OOrNJ8OjJA94k9GivupcNPy3/wsve1zKT0ueiNiG5sd/yKcxrCX082tySok
 BaVpy5XDV5d1rnUFfMR6C97MqWNlazlKGRzkpHvVOb0UKOV3/GKa8wW5jqj38JP/tr7v
 KUr+cffd8pNgLIYabBvR6z/OwmsgnlzriAMgPAXVYDDfhEDrgztAoxq2BgBKOjAIx+Kk
 hTC+e87GcL4F5VmXXfQWjt1yGyVfMzOF3Qjt8XtcorST8Cb0mmrN6muEHRcQkX54IwLU
 93aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Swzz0Y17XGey78Ri47tMzkeQ9mKkN9mT2xxxwEL2XSI=;
 b=W5xeB4FWInyzGFnIIHJ4tnJm098nPtDIr7p3apzeXZQHaysSp1Oesf+gGDMWktCrz5
 wd+2BYJprFd05XgJ8rYmXhshukoz7GuQE1MZX47fH6iEyRypvv/saVPsPJAAWv+4Nh8y
 Jtn0pbEUqSNo/lwaiTSFsgkslCoPlQL/NjNV5rDbEWa7CuMZpPR/QW5dNlNjrSARnrYj
 j8dC4hLleSNHYQRnc189rH3NM4mOvlnbowHEbFRPuaxXXlTxboMORqEX2WuYhNPW7LiL
 zwgbugucVZNktpvjsym1xno257uGHEIkgMWbZEZ6rwxwpT+ZRnQrn6I/xZ8L5VQ2EOaN
 +GHw==
X-Gm-Message-State: AJIora+ohhrEyrNcmmAPWBCk4Xwhea6TGVxpR0rhiZVojiTKnO3QdQaP
 t94CxV06ZykBMjZYkgRS3gOAlg==
X-Google-Smtp-Source: AGRyM1sHhmfQH0ZqATChCbqCqCpekRWkFhCvK7t81A7s2oY8d+6sjm0Je6kG4H1ZvLaPw4s3Dos5nA==
X-Received: by 2002:a17:907:9606:b0:70a:e140:6329 with SMTP id
 gb6-20020a170907960600b0070ae1406329mr25039880ejc.471.1658135135227; 
 Mon, 18 Jul 2022 02:05:35 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 kx20-20020a170907775400b0072f42ca2934sm310509ejc.148.2022.07.18.02.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 02:05:34 -0700 (PDT)
Date: Mon, 18 Jul 2022 11:05:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2 2/6] target/riscv: H extension depends on I extension
Message-ID: <20220718090533.hu7bkia7abzmt543@kamzik>
References: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
 <20220712063236.23834-3-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712063236.23834-3-liweiwei@iscas.ac.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
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
X-List-Received-Date: Mon, 18 Jul 2022 09:05:38 -0000

On Tue, Jul 12, 2022 at 02:32:32PM +0800, Weiwei Li wrote:
> - add check for "H depends on an I base integer ISA with 32 x registers"

Please use a normal sentence without '-'. It'd be nice to write the
doc/version/section of the spec that inspires this check in the
commit message.

> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 36c1b26fb3..b8ce0959cb 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -732,6 +732,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>  
> +        if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
> +            error_setg(errp,
> +                       "H depends on an I base integer ISA with 32 x registers");
> +            return;
> +        }
> +
>          if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
>              error_setg(errp, "F extension requires Zicsr");
>              return;
> -- 
> 2.17.1
> 
>

Otherwise

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

