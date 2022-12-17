Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6LD3-0005QT-43
	for mharc-qemu-riscv@gnu.org; Fri, 16 Dec 2022 19:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LD1-0005JK-33
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:37:47 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6LCy-0005AL-VI
 for qemu-riscv@nongnu.org; Fri, 16 Dec 2022 19:37:46 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d7so3857663pll.9
 for <qemu-riscv@nongnu.org>; Fri, 16 Dec 2022 16:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8qaT6KScyYUFxPW2x1O09D1JhOCxCcrOAIL97yRT+AQ=;
 b=jtOH5Zzc1K8kqRA/rAvhCkbmNZIGIBKaAi/BU44pvtXWd50zzWIDBL5iwUK7D6jHRV
 Bm1M0ZnvdkBl3+vIuInnsTK8j6a1Xuz7RgOttBxJjhwsSHigf91dpYICqlk+oBMiZQTB
 5XdlVit2r7r8gtUZE4VewO7Ut7eg6yL2UWCqovBSpeoxfzfyKu11bj1EoOsvsGumJaHK
 RX8bBInFop8zFgzwzG0fmN2JkEqTXmis+8e9b2MzWIDTSwhMuR+CgihadlJsZsnqtbqM
 zQwFTq8cB8pTMNv3kZf22qvqDa4l4SHi/Rd/wJ1KdCxsGCwuXbs9GweQv836ZUBL3tQb
 za6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8qaT6KScyYUFxPW2x1O09D1JhOCxCcrOAIL97yRT+AQ=;
 b=QOvrM6BcVLZcn/yvY4W2URU3KA4sLUU3BGX89E07lW7Qvzdf6gzYghW1wODmuj0WvS
 aVYlhAUODINRRQthlsNn7ESNOIzROyFNWvAvLNBuueQ8qwbT5dgr/vEEwQz9NPr3+GU3
 nclGEHskZNpDhkeVAY0meohAEfMuxay/OGkYDZ8rdm6zyox7dUof1giXmkVOj6JEhec0
 sj3IcP3Q0KTn+DpAfYi1+gXP12FgUDwBNtEWKN6/ejWJJdiLdukk+fpsbvMLlelSjE0o
 13n1i5hqR5sw30QkncTNFZfyHWYOHLDOBPqhe0vWjCQzG98QdKjQx+xbWe8+jvcPqvpk
 uL2Q==
X-Gm-Message-State: ANoB5pkYOjt1LQVCr96jV1k0LCJCM/u1M3AQicQ3kqwR8BkS0T6v644X
 4d6IBR/QAsEB1Kms/XSswdbLPg==
X-Google-Smtp-Source: AA0mqf4J8784D3LYn8iqxN/MUmuWkC0wQdpGQJj5E5yX2dix+VPIiv0SZ+E7Pf6T4Gj8hr1GfRPNgQ==
X-Received: by 2002:a05:6a21:9982:b0:af:6cc0:5b3d with SMTP id
 ve2-20020a056a21998200b000af6cc05b3dmr18889036pzb.7.1671237463450; 
 Fri, 16 Dec 2022 16:37:43 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a170902ca9400b001708c4ebbaesm2176807pld.309.2022.12.16.16.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:37:42 -0800 (PST)
Message-ID: <ae13260e-2fb8-612d-3e6e-c37fb40ac1c5@linaro.org>
Date: Fri, 16 Dec 2022 16:37:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 06/10] target/ppc/helper: Include missing "cpu.h" header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 17 Dec 2022 00:37:48 -0000

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> 'dh_ctype_*' are defined as 'ppc_avr_t/ppc_vsr_t/ppc_acc_t',
> themselves declared in "cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/ppc/helper.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 8dd22a35e4..a02db8d893 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -1,3 +1,5 @@
> +#include "cpu.h"

No, see patch 1.


r~

