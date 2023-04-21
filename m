Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppyyO-0007NB-LH
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 18:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyyO-0007Ml-03
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:11:20 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyyL-0001qB-7k
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:11:19 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso1381674f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 15:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682115075; x=1684707075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+54Bo7jCCAHW4aZ3qLnEV1hE6b/zaJjg8XM25Mmt6ko=;
 b=hHWlTyvQ1TVtktYCEtpreo8O0z8m+GFndI8VXI3yuJOI5IEjpUpfi+HPSY6d89rG5r
 riH6tl/XCvDsrMgtXyWTm/8maO/CW7O9b37bMENLmGivleXnsEQ/8QQ2Xja7JNPopqve
 aJ8qDW5sAKeKE6qqNf5qwPg0da1A5FgOH8xR8iyLEeUPSxbjcjOY9oDsX1v/BEz1PEFO
 CTYCi+cgvsBVg8LcfRdTqFjmlDEHDUF2N9qOVgUOOxzlG+MCrN6Qy7CvY+NXqzWpgOmf
 dTjbeTNpZ4/1y+QNbXPeMFh/7oHR/dwRZN8hqEJP42wZTj31P0wyNHskZp3DU47n3B0b
 eh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682115075; x=1684707075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+54Bo7jCCAHW4aZ3qLnEV1hE6b/zaJjg8XM25Mmt6ko=;
 b=ER+uPyh1dWeF68SnhZ+fhYpaROAD2izRVvOknL7rsZ/Q3+lHcdt15qv6h3YrAktTcb
 wbOsc+iv5ZJsJVOgMJr571Df0bIQCQ7oKq1S7b3g8Cx2b4PSebkIYinxv4frpcacUYt5
 xhUGHFMg8sMHc/OEAFdwRQBPTf+dN6L0Ff3AX2yUGNrLOsXfs+WKRC8CbVzoN8HAMMmy
 8ty72ETPysAc4OfeH6P0dsEFiwpfq2Uw93f2vjs38xogkRN3vf9j4vLzpwYIuhIW4TmS
 TL/9n0Q+YWACgZv9kw21DU31dNy1KDuyBFS+cKFPa8eAgHuBiOhI9m1YzSepf2HJH3y5
 q9dg==
X-Gm-Message-State: AAQBX9fg16gJmW39nAkFzCYe//1r7W8wn7rY9BOVgRrlxzBc9lZ6qEq6
 5GoCBYIALqAzA7Ak9w6LcQlvxQ==
X-Google-Smtp-Source: AKy350YsseborVKL7EkHcw6T8WoI3tk5aq1yVweVGWW/DRiwnk5zWR0/ycYMASyMIhVgsrf1e1jnOg==
X-Received: by 2002:adf:fe49:0:b0:2fa:631a:9f38 with SMTP id
 m9-20020adffe49000000b002fa631a9f38mr5063058wrs.2.1682115075267; 
 Fri, 21 Apr 2023 15:11:15 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 z14-20020a5d4d0e000000b002efb4f2d240sm5250076wrt.87.2023.04.21.15.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:11:14 -0700 (PDT)
Message-ID: <a92d2457-34eb-cec0-ac4c-4d0f2e633e7c@linaro.org>
Date: Sat, 22 Apr 2023 00:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/54] tcg: Replace if + tcg_abort with tcg_debug_assert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-List-Received-Date: Fri, 21 Apr 2023 22:11:20 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                 | 4 +---
>   tcg/i386/tcg-target.c.inc | 8 +++-----
>   2 files changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


