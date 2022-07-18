Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDMe3-0000mS-6H
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jul 2022 05:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDMe2-0000m6-83
 for qemu-riscv@nongnu.org; Mon, 18 Jul 2022 05:02:26 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oDMe0-000457-Iq
 for qemu-riscv@nongnu.org; Mon, 18 Jul 2022 05:02:25 -0400
Received: by mail-ed1-x52c.google.com with SMTP id x91so14354256ede.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Jul 2022 02:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oWH3kyYw49MXiSLDE/rGZk4lYjifVso4KgHIOKixjdA=;
 b=Y3iwGLjWSUlkO3PE8IpQM47qVO0JSxD82Tqp16QQzziWfy8ZkOQP4jpUn8DpdpHQMv
 6K00xJYFkRduPzQqrgYndm/+VNLxXrG+DSGaGfh5cM1VJ6PWpkXow9a230dI6MifHU8R
 cnIMerIXdoEXCEuOTAZiam+Igh4kYClE63LvCEyQWnNIoxCP1hWFpTIuqVwd9ou0oCoD
 C3B1La0bCCVwoVYUdzPCNYVDwihdMijVQXTD9NJNtzfnow+eGQtvyU3QPm4eamo44Fi4
 O6pk5YKwW5cNLzjIQi1Jvsn4uLuGnv4pSLhVKCX8lR2t2Tzl5QFrydfDkpSAEn5iqIdi
 xO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oWH3kyYw49MXiSLDE/rGZk4lYjifVso4KgHIOKixjdA=;
 b=g324GZdwgnRzVh0Hk6Sr9lyWC6seL8dYVB77wMc+DtrEHdSRV5gMIxNgra93QTvhrn
 4hd4b0oNdcyzjPzh+TVAenGFQti89uCKwLC8Wbvl0iUqA23PJzPKeNkIh2vNaTa0s4yy
 QhdweBQc0vaMdS7xPOOcLbEvokuZnvntIxYt1cGctmx0tNXrAh8DnqgbZpfXtgoSQAfo
 c9mhz8LX4KNSnrSCBeMkytERbpRqgXnuvIu15FuxABSc/IhnAbjusnqFAJsO5s8dYrDs
 qck9c+2PW8gSp4Kr+6KHTcSuA6RioXAmnUcUOizkAYOdsPmVQjFikd/rc9IV9lWKcFxJ
 BaqA==
X-Gm-Message-State: AJIora9xzBI4FkIFs0PoqiZvvsZjvfRrCqw/QANSRzs152xyIEJ+bxKl
 ipFC9h9C0UXg2HAmbSaAF8lzgQ==
X-Google-Smtp-Source: AGRyM1tgPXyuL9tGknDMS5hOWMLVIIeLc7CxGiLnyDl7QAvoJElL6LI9nZKZhemVZupj3xNL2Rxn+Q==
X-Received: by 2002:a05:6402:190b:b0:43a:c95d:ec93 with SMTP id
 e11-20020a056402190b00b0043ac95dec93mr34967494edz.44.1658134942558; 
 Mon, 18 Jul 2022 02:02:22 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 kw4-20020a170907770400b0072f46469d93sm68015ejc.165.2022.07.18.02.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 02:02:22 -0700 (PDT)
Date: Mon, 18 Jul 2022 11:02:21 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2 1/6] target/riscv: add check for supported privilege
 modes conbinations
Message-ID: <20220718090221.aqeiudcugpdqaef6@kamzik>
References: <20220712063236.23834-1-liweiwei@iscas.ac.cn>
 <20220712063236.23834-2-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712063236.23834-2-liweiwei@iscas.ac.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52c.google.com
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
X-List-Received-Date: Mon, 18 Jul 2022 09:02:26 -0000

On Tue, Jul 12, 2022 at 02:32:31PM +0800, Weiwei Li wrote:
> - There are 3 suggested privilege modes conbinations listed in the spec:

No need for '-' here.

s/modes/mode/
s/conbinations/combinations/

(Same typos in $SUBJECT, also please capitalize 'add' in $SUBJECT.)

When referencing the spec it's nice to point out the doc/version/section.

> 1) M, 2) M, U 3) M, S, U
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db2b8e4d30..36c1b26fb3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -726,6 +726,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>  
> +        if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
> +            error_setg(errp,
> +                       "Setting S extension without U extension is illegal");
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

Besides the commit message issues

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

