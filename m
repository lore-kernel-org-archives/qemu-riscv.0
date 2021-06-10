Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrNPF-0008Pw-03
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 12:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrNPD-0008Pa-Qq
 for qemu-riscv@nongnu.org; Thu, 10 Jun 2021 12:19:43 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrNPC-0005Ii-3U
 for qemu-riscv@nongnu.org; Thu, 10 Jun 2021 12:19:43 -0400
Received: by mail-pl1-x629.google.com with SMTP id e7so1289532plj.7
 for <qemu-riscv@nongnu.org>; Thu, 10 Jun 2021 09:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VC/T0KiKS5DZN9B9Ax69wcvjtew6dxXJWgZ1EagKsjE=;
 b=Il9tomG/pkn9DfxON4BsGD4GxpCkYGJt0GPfpdOowT4NTqQYeivT2pYM/B96JPvIB7
 GIza/LhJ6Ly0WsyU9o56kmIpo64CRZKlH8Beau593atdWVsvhYq4xV6xRc9VLD3orfJR
 6w8AFJPPA0HSRhVXsqMKKnP4JewXvg/87u1j8OEdI6r3gEX/HwuFKGT2NYq2gaSU4A+V
 IJEBgoA1wt3AWvM+TNYPehyW+UECKKigbwawY24G0Sbr1C0eRSKi1JzhbBrGRxo2U7RM
 uaMhbW/sxQzQ3Z1N5AJknMklmwPUyNJSad1Ug6AzVqvOdv4o2gQZaw0d+dQmXw8gHUdv
 cr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VC/T0KiKS5DZN9B9Ax69wcvjtew6dxXJWgZ1EagKsjE=;
 b=MIOzoGnkbf/t3RxN/FQZlLwyLxeuE4StTmrc0J9O2xIRJkdBrL1WeRxhuFMjoSA8Jv
 n6YTxKDUNhh3TR3/NynwvHL+oUJBzIU4KylvPTOU4cDy1igI8A9+b0P4EpHyMEVCaba5
 jeGHdwhXJ53sqYfe1kRiEfqVjcIkB+XFTHU2a2n4tXVCXJZJ2QLnhThGieQ7Z5JuzR/b
 8qew7Q1VT63i2PGr/k0KsE2oJqQVcCMYztxjeDHVa619Hb49i+ACjzA+y+bGnR6Tz2fQ
 kZ6iRjxVdzdP5gsdRD/AJjZkHpflOPo6Rvw8NN+bTiM+Be0WE4s8+SOgy/ktoy/g0VXD
 +pCQ==
X-Gm-Message-State: AOAM532GPmMBTjWC3FqYvT7vUWkldw7ZIsoAthO0ZmQ4kcrkZHKD7/NW
 3UD+9PRVrFtDv2b0BAwEjwyijQ==
X-Google-Smtp-Source: ABdhPJyr+o230NK16u6Pf2KIMdNuJg2C6QbbgiUSxvn04biwM08wnJoTs1ChPV5OKVQ4TiOr39FIKw==
X-Received: by 2002:a17:902:8f8f:b029:107:810b:9ee5 with SMTP id
 z15-20020a1709028f8fb0290107810b9ee5mr5514951plo.4.1623341980371; 
 Thu, 10 Jun 2021 09:19:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x3sm3311906pgx.8.2021.06.10.09.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 09:19:40 -0700 (PDT)
Subject: Re: [RFC PATCH v3 2/2] Adding preliminary custom/vendor CSR handling
 mechanism
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: dylan@andestech.com, alankao@andestech.com, wangjunqiang@iscas.ac.cn,
 bin.meng@windriver.com, alistair23@gmail.com
References: <20210610144424.8658-1-ruinland@andestech.com>
 <20210610144424.8658-3-ruinland@andestech.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9d350fb-16bd-6dc6-41de-0516c046a244@linaro.org>
Date: Thu, 10 Jun 2021 09:19:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610144424.8658-3-ruinland@andestech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jun 2021 16:19:44 -0000

On 6/10/21 7:44 AM, Ruinland Chuan-Tzu Tsai wrote:
> --- /dev/null
> +++ b/target/riscv/andes_cpu_bits.h
> @@ -0,0 +1,113 @@
> +/* ========= AndeStar V5 machine mode CSRs ========= */

> --- /dev/null
> +++ b/target/riscv/csr_andes.inc.c
> @@ -0,0 +1,153 @@
> +/* Andes Custom Registers */

> --- /dev/null
> +++ b/target/riscv/custom_cpu_bits.h
> @@ -0,0 +1,3 @@
> +//XXX Maybe we should introduce a configure option to toggle different vendor
> +// CSR bits definition ?
> +#include "andes_cpu_bits.h"

All new files must have copyright+license boilerplate.


r~

