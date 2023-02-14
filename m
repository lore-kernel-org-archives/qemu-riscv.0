Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRvIo-0001yg-8q
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 08:25:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvIb-0001oX-IE
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 08:24:45 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvIS-0006Bk-LB
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 08:24:41 -0500
Received: by mail-oi1-x22a.google.com with SMTP id c15so12965370oic.8
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 05:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BND3nIpiw3Ua4bW4QVu0vL/wRSdfdgJyZ0zNU0zGIs8=;
 b=k8c3/RVSd7R1d1XCG4RHtlZ4OY80CdDJ9UNgViFP2JTYtOHwKLn9fs000bm2zy//cI
 N3gEQ10kiYLi0w/Eq9iYSf7uASaVQxFtk065zSRvR7M7gqoafH9lPfSJYEHj9/qW6NRP
 nvFUAJSXeXV3X/TRy/TXAt3LG7/wJQjtPTJ9V+VaT2agI7XWFJ+6RMrjh2vRhT5oDfLY
 2ZSPmip4s/jJuWeV8QwioQ/JYWOWyaaxqJAmRi3pC3BVleewQ8uOiRxtPrq3QVcqAcD/
 8W++7ZswpfdFSKGdjYT+Q8sqqIDi2AxPuy+JJn95X60qU+yVZQ6swDdR2yOUEpcgELO9
 5PzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BND3nIpiw3Ua4bW4QVu0vL/wRSdfdgJyZ0zNU0zGIs8=;
 b=40xc4QvKijFCT7W19sm8h86Ky19T/Mnq8nhZJHOctPH3d6ewJ2c63A3BP81h3P68ze
 9pGqTlvqWmIckVHy/8ZAbyexJNO0i1W1aPI5DudSMCb6JqPGMdSQ3RGJkfsevVp+NoOr
 C5pqe/gtRxQG7PMTuszpOhAjfttktrxtGJGUlPfaIzjoN7u4Eaf0kNWdO4M9TegBbW6Q
 2yKsb5f6ut4x8dha7NWZ9efzPLcyGN5KOkAIl0Q/zFef4zqWtbnVulFu2gbn3UbfF439
 xnE0q8XXCeQqB1bo5i98KYZh15YjQO35060KtP795m75LAONuN6EXHa8TyJ3d11w8fx0
 w+Fg==
X-Gm-Message-State: AO0yUKU6jxoHlFjv6wC5wZ4SboqrQIt4qExXVI+8C2yPpJwOqKe1cFaF
 W06cHzqpB72fv5feWJAKV44yjQ==
X-Google-Smtp-Source: AK7set/FS4HIm3N4DY0TxcJYZS5qHFRXTa1EnsG3RVPxKGCQ0B9Y1Zoln9XMvyjdxYsxbBFa5pQ5+w==
X-Received: by 2002:a54:4117:0:b0:365:367:7c7a with SMTP id
 l23-20020a544117000000b0036503677c7amr1217030oic.11.1676381074630; 
 Tue, 14 Feb 2023 05:24:34 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a0568301d6600b0068bb3a9e2b9sm6281237oti.77.2023.02.14.05.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:24:34 -0800 (PST)
Message-ID: <a325cf41-95f5-604b-648a-bd4897451381@ventanamicro.com>
Date: Tue, 14 Feb 2023 10:24:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 07/14] target/riscv: Indent fixes in cpu.c
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-8-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
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
X-List-Received-Date: Tue, 14 Feb 2023 13:24:46 -0000



On 2/14/23 05:38, Weiwei Li wrote:
> Fix indent problems in vector related check
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 44 ++++++++++++++++++++++----------------------
>   1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8fe76707a0..73711d392d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -798,7 +798,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           }
>           if (cpu->cfg.ext_f) {
>               error_setg(errp,
> -                "Zfinx cannot be supported together with F extension");
> +                       "Zfinx cannot be supported together with F extension");
>               return;
>           }
>       }
> @@ -861,40 +861,40 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           ext |= RVV;
>           if (!is_power_of_2(cpu->cfg.vlen)) {
>               error_setg(errp,
> -                    "Vector extension VLEN must be power of 2");
> +                       "Vector extension VLEN must be power of 2");
>               return;
>           }
>           if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
>               error_setg(errp,
> -                    "Vector extension implementation only supports VLEN "
> -                    "in the range [128, %d]", RV_VLEN_MAX);
> +                       "Vector extension implementation only supports VLEN "
> +                       "in the range [128, %d]", RV_VLEN_MAX);
>               return;
>           }
>           if (!is_power_of_2(cpu->cfg.elen)) {
>               error_setg(errp,
> -                    "Vector extension ELEN must be power of 2");
> +                       "Vector extension ELEN must be power of 2");
>               return;
>           }
> -    if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
> -        error_setg(errp,
> -                "Vector extension implementation only supports ELEN "
> -                "in the range [8, 64]");
> -        return;
> -    }
> -    if (cpu->cfg.vext_spec) {
> -        if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
> -            vext_version = VEXT_VERSION_1_00_0;
> -        } else {
> +        if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
>               error_setg(errp,
> -                   "Unsupported vector spec version '%s'",
> -                   cpu->cfg.vext_spec);
> +                       "Vector extension implementation only supports ELEN "
> +                       "in the range [8, 64]");
>               return;
>           }
> -    } else {
> -        qemu_log("vector version is not specified, "
> -                 "use the default value v1.0\n");
> -    }
> -    set_vext_version(env, vext_version);
> +        if (cpu->cfg.vext_spec) {
> +            if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
> +                vext_version = VEXT_VERSION_1_00_0;
> +            } else {
> +                error_setg(errp,
> +                           "Unsupported vector spec version '%s'",
> +                           cpu->cfg.vext_spec);
> +                return;
> +            }
> +        } else {
> +            qemu_log("vector version is not specified, "
> +                     "use the default value v1.0\n");
> +        }
> +        set_vext_version(env, vext_version);
>       }
>       if (cpu->cfg.ext_j) {
>           ext |= RVJ;

