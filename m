Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKQoS-0007km-L0
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 16:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKQoQ-0007kO-SX
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 16:26:38 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKQoP-0007kz-I2
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 16:26:38 -0500
Received: by mail-pj1-x102c.google.com with SMTP id o13so16470039pjg.2
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 13:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GbNkp/pKuIBiZ4ypNW3WoRMK+2cUL/berwP7DHIUh6A=;
 b=MmLGIskhTuCYr/i8CiOxoy5gzEdwB7lBTd5179asJDsSB0bY4CiM5gqruaKhVjoBOb
 m2GdGbqvNz30dkp99GBVA6jV6oi03S74rmXWn7mmXxYCX55HH3pNP+uPk8kLStNub6wi
 BSTq3RSNQhHh5Oz2antGH1Rm2MdZf38R5YUxqbADLdU15IAghTfjFHNIfeecNWjgkUpp
 n/m5YwArEp2rMxI7PrBPM5gphMDxi1Ttc4xuCd5BuPo5GcwJddzhQdO8ON0BUvGUFfnu
 I/vzbbCZ7ZIj6B978xNut+dxfqdvyt0G1PRJpoULIIOgz3w4JuQO30O6dIcgnbQGD8pX
 D2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GbNkp/pKuIBiZ4ypNW3WoRMK+2cUL/berwP7DHIUh6A=;
 b=JyJVOgK9/Kynk9nyexszbFxRK8S/WEuf8NSAXjEwF2GDoEtFIFDMIxxHuzeD49mdeP
 m1/pK7n1IJwDxDzPGgE/SAxtE/kZOxlrXttIcaoOHbV+Jitq733o9BszIaHePVjR35Xr
 uMs0QGqn+QBtdIbzSq/BBwOEJSvUF/o5H/6442H2IKdKjCu4zxCADIscSu7acqZX8bBj
 LnzUhbkHvYR/2mZHUWVSTK2VDAJAzcyRCDasyEKJWtNrxYdfph1cK7lgze9mV5TlsI2y
 rMd6QSrPZMDkw6ggSW+fRkNMAeNG7dEsLQJZqDWxeciMqLLoTv5/Qx+Z0Sg/BzKgw00I
 B+WQ==
X-Gm-Message-State: AO0yUKXI1hke3w325DM6ZWcE6Tv3uHhi5irW2lyCbC2eglLzDhWj3ZOC
 wPjz4s/Ij8GISyD2SQQPREmKpA==
X-Google-Smtp-Source: AK7set8zbCKoWKuCKSr270Flhoty93/6CQfOrX4peU1JScmZL0v45+wRjWATQ1r2JIuO/XRRs4A2yQ==
X-Received: by 2002:a17:902:db08:b0:196:11b1:1024 with SMTP id
 m8-20020a170902db0800b0019611b11024mr4999997plx.7.1674595595775; 
 Tue, 24 Jan 2023 13:26:35 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 jl16-20020a170903135000b001869ba04c83sm2114872plb.245.2023.01.24.13.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 13:26:35 -0800 (PST)
Message-ID: <64af1437-b910-e5b3-c462-0ef0c416ba39@linaro.org>
Date: Tue, 24 Jan 2023 11:26:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 12/14] RISC-V: Add initial support for T-Head C906
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-13-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230124195945.181842-13-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Tue, 24 Jan 2023 21:26:39 -0000

On 1/24/23 09:59, Christoph Muellner wrote:
> +++ b/target/riscv/cpu.h
> @@ -27,6 +27,7 @@
>   #include "qom/object.h"
>   #include "qemu/int128.h"
>   #include "cpu_bits.h"
> +#include "cpu_vendorid.h"

I don't see that this ID is required for all users of riscv/cpu.h.
This include should be limited to cpu.c.


r~

