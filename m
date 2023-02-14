Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRu94-0007C4-On
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 07:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRu92-0007BQ-7u
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 07:10:49 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRu8z-0000EC-Mu
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 07:10:47 -0500
Received: by mail-oi1-x230.google.com with SMTP id bj22so12796013oib.11
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 04:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OwcshCZCtVUipFr2g0HItw8bSCYc4C1gvs4/2tMXtzM=;
 b=ipbBE7S/5OBZ9OBEl8Lom4mNrmc89X0mQUwb3RJSY3giREnKEliHM+mR791q5IuE3G
 q1waTEAsTQbZPrVgySANKi8EGyk4vZydCA808qKzYMouCdEs4lWxKk4O0wyzTpVgQmtT
 uGOSPB7mmUDP8VkyWwi7HGglg5yiDJ9m8yzZ8aZIHCDwuJRDkng6a6INU6A5yAMtIwcK
 5MOIg0XIAQ8vGQoVkz49n3lYn9r/dVpaiMKWq1uKH1gCUAYoLt8hq/Lh5vGnlpaQqn/2
 4oj+R89qXVedmK5drqY1EZCWu9hkO0CY1oQn84+tViQHNt5lnt2qiBUZOxct8av/g6G/
 5s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OwcshCZCtVUipFr2g0HItw8bSCYc4C1gvs4/2tMXtzM=;
 b=tlgNua+C+ZjFGtvUELzNSA4l6rny80LRwoz0sNNcLxWVWvBL57vqHRzsQWo9h8T1O/
 litU3CtDZnXuFIimomBsuEbh+alnhIjxXtv252tuqlrmcskmoIhrXIuPeKZqaAvp/emP
 vqUCw3useGiibKlDPBOjhU3PCCu3kb8tVszhLX3Hk8dWV7/d7DxTUASN/hJBTv0VisrT
 HVAwX3sqw2nl8evWokCKWri/lcgdudE2DdGUWkw9i3NCo4bR4t2eXSpkxMoNniIl8iis
 ujR8wS5ih8NkADSWWawagS6kyl5ULOxiZUDuiK8Jf9AkqFTCBcv0b1FzysmyD0gB0YjC
 BJHQ==
X-Gm-Message-State: AO0yUKWFTHFek93fS/7nqQqKIvmDLsw30iYwORb0ad7QehTQrBN+CYUL
 g6xnnt/ek28BEjOy2m5zka3MXw==
X-Google-Smtp-Source: AK7set/UY341z/sAykIEf1hplRCs6qJo7GddlgB/SscaOVNjcP2CQPQlVToCqaK7fN7X8xgC4vykqA==
X-Received: by 2002:a05:6808:82:b0:378:477c:3e0e with SMTP id
 s2-20020a056808008200b00378477c3e0emr907702oic.45.1676376642857; 
 Tue, 14 Feb 2023 04:10:42 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 e186-20020acab5c3000000b003646062e83bsm6033500oif.29.2023.02.14.04.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 04:10:42 -0800 (PST)
Message-ID: <b93a9f32-8d97-d8bb-2817-e9de70436b04@ventanamicro.com>
Date: Tue, 14 Feb 2023 09:10:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 02/14] target/riscv: Fix the relationship between Zhinxmin
 and Zhinx
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-3-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
X-List-Received-Date: Tue, 14 Feb 2023 12:10:49 -0000



On 2/14/23 05:38, Weiwei Li wrote:
> Just like zfh and zfhmin, Zhinxmin is part of Zhinx so Zhinxmin
> will be enabled when Zhinx is enabled
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index eb0cd12a6a..9a89bea2a3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -754,8 +754,11 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>       }
>   
>       /* Set the ISA extensions, checks should have happened above */
> -    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
> -        cpu->cfg.ext_zhinxmin) {
> +    if (cpu->cfg.ext_zhinx) {
> +        cpu->cfg.ext_zhinxmin = true;
> +    }
> +
> +    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) {
>           cpu->cfg.ext_zfinx = true;
>       }
>   

