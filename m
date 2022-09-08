Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWCDs-0000y5-C5
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 03:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWCDq-0000xc-S8
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 03:45:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWCDp-00037t-8y
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 03:45:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b17so11223606wrq.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Sep 2022 00:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=4zzKIZ/+RqOdZA78fKp4w6y0CFuWcdUNpdJy1AhCoF0=;
 b=PffCH5xmQG18nbbveiKb9csIpnesERHOmqSZR4ITprbSv+l4DXxB1soi2tlsyKmnXb
 9JxPPbgsRPFvJcqPILf+1OUuI/cpIhqmZxpcJ6W14ScMU4URB10QcO+b8lg/RR/RcNt3
 9L0nReL+WrUIF+JhquFNiJ9lVtx5CYRkZTl1zzgdkjQ0hcvKRp+nWoQ7p8DZaDfL3lyV
 kxDXSdjMa81ghl8rv3BHVCYmr78RdtN0Jy70KMJU1KvtGndTQ2+U1Qz9eIb2jK891x52
 Y5FSoR/Lzcxe1tq+n5y+lV5CCUZz3SXSPBW3n7jMPWXu9iywT7t1+IFGazk3AHOCefjz
 bSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4zzKIZ/+RqOdZA78fKp4w6y0CFuWcdUNpdJy1AhCoF0=;
 b=yMzAs7rDlESOYaaDzysbHWTnbvBebI4tCZqOeLV3YdGFRRxQUuoWuwtLpKV6AnNMb7
 XzrcAW887Z0EVBR87r26Vqll7QPzt4uIRM2YUIbyPzH4P/LNtz4XIP+5mqNrnFE3FDr4
 a8Gi8qBoo5ihyUmjCKTEH7xide0720RPdhswFr5uaTm75/NGdbwomEngjiHx8/6LxgRF
 kXikEsG4mvtcEQFQ2STWaQU5bq9/OeOeYAgAhnsx5cdC+J6oKx4+Qp1tQ2RPK7wKLu2G
 Ykr6ipCjA5XWr3EpXTJDaf+KUy469r20yeVqu2ium0QXR20staW6bBwbtyjYiQdpA1Fb
 DQ8A==
X-Gm-Message-State: ACgBeo3saW9Z9ma2IJYPsv6YixbfTxxuLYrI0GJfzRoUjQz6CDBK3y5O
 fjaZuuaio8SUJP0ihzD1HIX2nA==
X-Google-Smtp-Source: AA6agR49ZSujlBV3Ig1Xxgh5mlmtgxBREGpKrhy/R6Tt12OuipL6N0XQKIRLbp3KazY0qCa8jP55hA==
X-Received: by 2002:a05:6000:1881:b0:222:c899:cac6 with SMTP id
 a1-20020a056000188100b00222c899cac6mr4008613wri.283.1662623111061; 
 Thu, 08 Sep 2022 00:45:11 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 a18-20020adffb92000000b002237fd66585sm18686348wrr.92.2022.09.08.00.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 00:45:10 -0700 (PDT)
Message-ID: <13c9f7be-d8b8-37aa-ee99-79056e11e30c@linaro.org>
Date: Thu, 8 Sep 2022 08:45:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/11] RISC-V: Adding T-Head FMemIdx extension
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
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-11-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220906122243.1243354-11-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 08 Sep 2022 07:45:15 -0000

On 9/6/22 13:22, Christoph Muellner wrote:
> @@ -732,6 +733,7 @@ static int ex_rvc_shifti(DisasContext *ctx, int imm)
>   #include "decode-xtheadbs.c.inc"
>   #include "decode-xtheadcmo.c.inc"
>   #include "decode-xtheadcondmov.c.inc"
> +#include "decode-xtheadfmemidx.c.inc"
>   #include "decode-xtheadmac.c.inc"
>   #include "decode-xtheadmemidx.c.inc"
>   #include "decode-xtheadmempair.c.inc"
> @@ -1061,6 +1063,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>           { has_xtheadbs_p, decode_xtheadbs },
>           { has_xtheadcmo_p, decode_xtheadcmo },
>           { has_xtheadcondmov_p, decode_xtheadcondmov },
> +        { has_xtheadfmemidx_p, decode_xtheadfmemidx },
>           { has_xtheadmac_p, decode_xtheadmac },
>           { has_xtheadmemidx_p, decode_xtheadmemidx },
>           { has_xtheadmempair_p, decode_xtheadmempair },

I think you should have a single decoder for all of the xthread extensions, and each 
translate function should test for the individual extension.  You know up-front that these 
extensions do not conflict.


r~

