Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhucj-000768-Vf
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 10:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhucf-00073B-D0
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 10:18:45 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:42832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhucb-0000F0-Of
 for qemu-riscv@nongnu.org; Tue, 02 Nov 2021 10:18:44 -0400
Received: by mail-qt1-x830.google.com with SMTP id v22so1331307qtk.9
 for <qemu-riscv@nongnu.org>; Tue, 02 Nov 2021 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kd2SPiXASBwKXl86rw6IF5tG3+g34jyaFFEDoAq8G6k=;
 b=s3n76GHLGAMxMka4QLwNPASd13Jlt1IDI3rr5aoG8CdvitiyfXgd+wWVNo8MBNxq0Z
 uAcKpKpMfgVYsZYx3IgixMh/Up9tRVJjNIAJJVb48lr5ZRT2BtfxNUMYP2RS4fx8rqbP
 qwOEGTjVivWx9Bes8vRpEZpYkfEopmEHjqqMRFOnYRfeqRPCOkyUtiETftjieNivci56
 /7xtJzZeIhLEbD3Wb+44PJRdikfkXSLBBU81sIURu0PMnkQTYm9PhHFwqmp/XfLbJUeh
 3HzyyhYXgKk1TBF2hDxCYnac6AxDvHfR/H/yVA+VpB161wZ0klP0GKAJA1soYF5mCfCp
 9eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kd2SPiXASBwKXl86rw6IF5tG3+g34jyaFFEDoAq8G6k=;
 b=pYUmrvnKLkTaDJuKxLzetF5Mjxg/BwbNjAXclttoM92ybIBUCNd/iedJC7yxW/O/Be
 6vgnanK8WFsSxwEOE2Je29NmQ2x3qM582uRfm6PYiTA077xiBiG5u1zEzQGa/hvD0WFh
 OlHceKzHV27QED3o2Sd+rXq4aPCyUAQ6iJjobYSFkKh/9nZcAWbWuPy0uBp453KjyfeB
 BqAWvq1ZU8zqTbM9EIuoJUwjNuwBkJPoKvC8tB49vfb1ttA5PJ1aO+Z9j51AI6H5L0Z0
 AmhDV0S3CPXZnHeIGXgAsHb6LPFHcMLiGg/xez84jhS/0CTI1637FrrHudSqeSn53wD7
 xAlg==
X-Gm-Message-State: AOAM533vekvl3KTW/zuXVX8xnj0CJTA4glStlD8D0fsI3K0X+my+nuTW
 6hOxjLG93AChs5UwENegZyU69w==
X-Google-Smtp-Source: ABdhPJwTeEdoYD+8Tq7Abhq4so8MVDrc8G+V0HqLRONUjuhqNCiYJ3f9VsLAdTlGWgdLUGYfSfzTBA==
X-Received: by 2002:ac8:7d4f:: with SMTP id h15mr17139440qtb.336.1635862720685; 
 Tue, 02 Nov 2021 07:18:40 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id h14sm8293710qth.23.2021.11.02.07.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 07:18:40 -0700 (PDT)
Subject: Re: [RFC 1/6] target/riscv: rvk: add flag support for Zbk[bcx]
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
 <20211102031128.17296-2-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97624133-30f2-fdc4-4f3c-0cc843f0768c@linaro.org>
Date: Tue, 2 Nov 2021 10:18:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102031128.17296-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Tue, 02 Nov 2021 14:18:46 -0000

On 11/1/21 11:11 PM, liweiwei wrote:
> +++ b/target/riscv/cpu.c
> @@ -472,15 +472,15 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>               error_setg(errp,
>                          "I and E extensions are incompatible");
>                          return;
> -       }
> +        }
>   
>           if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
>               error_setg(errp,
>                          "Either I or E extension must be set");
>                          return;
> -       }
> +        }
>   
> -       if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
> +        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i & cpu->cfg.ext_m &
>                                  cpu->cfg.ext_a & cpu->cfg.ext_f &
>                                  cpu->cfg.ext_d)) {
>               warn_report("Setting G will also set IMAFD");

This re-indentation should not be happening.


> +    DEFINE_PROP_BOOL("x-zbkb", RISCVCPU, cfg.ext_zbkb, false),
> +    DEFINE_PROP_BOOL("x-zbkc", RISCVCPU, cfg.ext_zbkc, false),
> +    DEFINE_PROP_BOOL("x-zbkx", RISCVCPU, cfg.ext_zbkx, false),

The properties cannot be exposed until the end.

>          bool ext_zbb;
>          bool ext_zbc;
>          bool ext_zbs;
> +        bool ext_zbkb;
> +        bool ext_zbkc;
> +        bool ext_zbkx;

Better to keep them alphabetical: zbk* < zbs.


r~

