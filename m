Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmh1C-0001Z3-SF
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 16:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmh1A-0001Xa-P4
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 16:24:36 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmh18-0006bJ-Pe
 for qemu-riscv@nongnu.org; Wed, 12 Apr 2023 16:24:36 -0400
Received: by mail-oi1-x234.google.com with SMTP id bm45so2919471oib.4
 for <qemu-riscv@nongnu.org>; Wed, 12 Apr 2023 13:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681331073;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XBAVPTUqyPo06+CY0uUh4FBLPCYociblB7tJO7HBKg8=;
 b=pIFIroGXM41CmyMz/+XYF9fmflhR6K2+EnRNBD7EVQUXUSV38LOym5JG81rLHBxDkX
 0U6oP2/QeioXKAss44VqUIWAcd3ZiKrQXByF3l1eUxc9Iee1kDVDxc/j3o9KYEZLNEHu
 5HYppwQxQuFmgYBg9WzDe5OJ2kZbtPIQwy7/bJCA6w9KAq/59JNsCpmAFUBKZSw1W/uN
 PAYLAJquLxWv80N4dWhaCk/fpbXBFbaJrnc0uPAlHy6p/HPGLs7GLUOEHVjkMGuZAxBu
 fX7g0AKRQcZ8/4UpMdH/QxmSGEDWgxRUjANg488+4cs0ZLzYAx0tEHlWXnAezOnxfnSf
 XFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681331073;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XBAVPTUqyPo06+CY0uUh4FBLPCYociblB7tJO7HBKg8=;
 b=BSGk+Uc8I3fwmR9gxDPDpO3st0rEPFSSZpT7xdMcn3ZHMAvfSL6ahHIGRi/c+aUNJG
 Q1OKxxHgFbBSiOviEHaJqFMbyd7c7+Nk7qYR6fbTmE/UP6GNsfv4jCNmX+gzz9M4Vi3n
 kOitG/aLefEpr06KddAgFm2qOnJnNJ3QupVwYFWAjoXoTsXMSlWZYKLC2roZFEDgCGrX
 EsKerc5GfApotR6kAE5XTJqvSRN4QB3S8iO23nJvyMVMZ+hg//knAqE/yZEmx9SZnHF9
 s2OQaUeziIchUWaCUIU5WKECz511YNNd5KnLyxsW0sbMa2skDQX+IYwnFBhpT/RaCZfU
 xHEw==
X-Gm-Message-State: AAQBX9fDfGwoVWVhICOKElr7McADJsTCgBGnLUx9dxIzpm86GZcXYOFq
 D7cOpqgVWJs5Wi3L1E+jhtRWZw==
X-Google-Smtp-Source: AKy350aCG13yc/bE7OWxNBD4+X31lYaPaIV01FRNh2VgZrEgEWggQDR20rlPjOO+VW9pwmtRW2bUOw==
X-Received: by 2002:a05:6808:19a9:b0:378:528:d83b with SMTP id
 bj41-20020a05680819a900b003780528d83bmr10215556oib.55.1681331073558; 
 Wed, 12 Apr 2023 13:24:33 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a056808124d00b00387160bcd46sm6962909oiv.46.2023.04.12.13.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 13:24:33 -0700 (PDT)
Message-ID: <fda80093-00f1-8bf7-dca0-9d680e729dc1@ventanamicro.com>
Date: Wed, 12 Apr 2023 17:24:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC 5/5] target/riscv: Expose properties for BF16 extensions
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230412023320.50706-1-liweiwei@iscas.ac.cn>
 <20230412023320.50706-6-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230412023320.50706-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
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
X-List-Received-Date: Wed, 12 Apr 2023 20:24:37 -0000



On 4/11/23 23:33, Weiwei Li wrote:
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c19bbb41fb..0265fae46f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -83,6 +83,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
>       ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
>       ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
> +    ISA_EXT_DATA_ENTRY(zfbfmin, true, PRIV_VERSION_1_12_0, ext_zfbfmin),
>       ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
>       ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
>       ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
> @@ -107,6 +108,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_12_0, ext_zve32f),
>       ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
>       ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_12_0, ext_zve64d),
> +    ISA_EXT_DATA_ENTRY(zvfbfmin, true, PRIV_VERSION_1_12_0, ext_zvfbfmin),
> +    ISA_EXT_DATA_ENTRY(zvfbfwma, true, PRIV_VERSION_1_12_0, ext_zvfbfwma),
>       ISA_EXT_DATA_ENTRY(zvfh, true, PRIV_VERSION_1_12_0, ext_zvfh),
>       ISA_EXT_DATA_ENTRY(zvfhmin, true, PRIV_VERSION_1_12_0, ext_zvfhmin),
>       ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
> @@ -1469,6 +1472,10 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
>       DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
>   
> +    DEFINE_PROP_BOOL("x-zfbfmin", RISCVCPU, cfg.ext_zfbfmin, false),
> +    DEFINE_PROP_BOOL("x-zvfbfmin", RISCVCPU, cfg.ext_zvfbfmin, false),
> +    DEFINE_PROP_BOOL("x-zvfbfwma", RISCVCPU, cfg.ext_zvfbfwma, false),
> +
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

