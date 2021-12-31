Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n3OD0-0003OP-6a
	for mharc-qemu-riscv@gnu.org; Fri, 31 Dec 2021 15:09:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3OCy-0003Km-Im
 for qemu-riscv@nongnu.org; Fri, 31 Dec 2021 15:09:00 -0500
Received: from [2607:f8b0:4864:20::435] (port=37378
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3OCw-0001wN-QJ
 for qemu-riscv@nongnu.org; Fri, 31 Dec 2021 15:09:00 -0500
Received: by mail-pf1-x435.google.com with SMTP id 8so24403163pfo.4
 for <qemu-riscv@nongnu.org>; Fri, 31 Dec 2021 12:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pDARFuuOH3dZPSTOMQVEtIEqj5GtBB/z/yvYY99bTGQ=;
 b=wYck7mKqyWqXR9FKfUTvavMg2ExVq6Jbxv4vX9IRPA8PO728TSqccy1hYaYLdiy6Ig
 uA5RMhbL9Gr8jvWuE7ej+1C5h+mnGc8PQLG+wEc28D0uL1zURILYf4tOv5P2ve/OJryr
 memimjqQslHZgLvSBkQR1fLkMsp5SKpzAPHsRAgpXAK8YiC1+rBvjlwON1C7+tG/QDuS
 y8WvPWEjINTkLZ1TJsg0Hrd/s03Uyn0zRDzfrhjx7rcsJO4YZ+gom4Kuox+Tro4XaKHO
 qFnVCtFghcbNwhKpOkaxqz+GDggWmgoGs/7qobZtaL0h/doqkZKa8AnUoDmpaWmvXtRC
 l6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pDARFuuOH3dZPSTOMQVEtIEqj5GtBB/z/yvYY99bTGQ=;
 b=ZPyOk24AqniLrcTD5lbSU79FWeAmZ794Xsb26uMWbP2j9CuKCLQx4DWQ5ag03OPh8u
 8hqT4VAen8Dy8jlT6H0kpLWoyUusQVIkGWlar7Lqrl9xEnKQWP0G+vV7cVJM8qXol9NF
 26xsV83C0DVZzZ2XaiwMqcVLujUKgO79A0ntmu+d+GqCDxaWw7qhtO8AWJ49VZaw2ZgV
 /seOWIgXuYXJkFd0qgjK9Cm0xoyWSnpM1+BaqGKk8aE4Kao5DRZZwQf0ORgjcfpsxehx
 CaCGWENPmJB9uNwQxwtpzLDhN+E99RNNvr5T2tI0gpcrgpqZ0FuI/PqNoyZ29oOzGVLF
 FoJQ==
X-Gm-Message-State: AOAM531Y6JXzh0hPaLcoC7fMtIpipbI5QZHCgvGbcZBwOyTHltLf7UJp
 z1oTf38Il8YdxoXHGkOMrW2W4g==
X-Google-Smtp-Source: ABdhPJw+YdicPhydjMsqQyaqyWEbf6y5Nl8INqJnxuyosT8TOGo/yrZYyBmk7wgkURm89RT3hzdFIQ==
X-Received: by 2002:a63:864a:: with SMTP id x71mr32240288pgd.297.1640981337317; 
 Fri, 31 Dec 2021 12:08:57 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:9312:6940:7d21:4efb?
 ([2601:1c0:6101:be80:9312:6940:7d21:4efb])
 by smtp.gmail.com with ESMTPSA id j190sm25884713pge.70.2021.12.31.12.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 12:08:57 -0800 (PST)
Subject: Re: [PATCH v2 5/6] target/riscv: add support for zhinx/zhinxmin
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e66ab20-9d1c-d637-3516-51b0eb025d41@linaro.org>
Date: Fri, 31 Dec 2021 12:08:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231032337.15579-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 31 Dec 2021 20:09:00 -0000

On 12/30/21 7:23 PM, Weiwei Li wrote:
> From: liweiwei<liweiwei@iscas.ac.cn>
> 
>    - update extension check REQUIRE_ZHINX_OR_ZFH and REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN
>    - update half float point register read/write
>    - disable nanbox_h check
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/fpu_helper.c                 |  89 +++---
>   target/riscv/helper.h                     |   2 +-
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 332 +++++++++++++++-------
>   target/riscv/internals.h                  |  16 +-
>   4 files changed, 296 insertions(+), 143 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

