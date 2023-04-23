Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqex3-00007H-MU
	for mharc-qemu-riscv@gnu.org; Sun, 23 Apr 2023 15:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqewj-0008QI-QU
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 15:00:25 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqewi-0004IU-8N
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 15:00:25 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso23463265e9.3
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 12:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276421; x=1684868421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0iP1JdfXPd/1ZMdU27w18Bzl14WlTg0wkF7XKFDM2Fo=;
 b=a/9YRO5KKep3+Bjp2Mw17VatwYLUt88twxJNUzRy4OnylB5muPQy2FK6k1sHLfNFIb
 ZpEWoN4TmbqOuWG+uPHImFTsnssO8Nq0ckbRI1lIxREK7fH+ESViznZGkeIE3ZPuEm9v
 yn2EaTV1pXrZySu0N6Fcg2lruJIOQUqINfY1oBRIky7mbpQxxbz9z/CR64hFAJPF+zls
 Nnd3zjA1rK1xffETi4bJC8fAxSdYxjx096NXWF9jzwlxbTAEIQd1BmrNLvY3yT4bs2jE
 fB29a/54oFG4ti41LaEdUq+p0Wg0iJhSSRglIvULWVhZLoHZ7HbmoenKVZZg2ZfYGRku
 EmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276421; x=1684868421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0iP1JdfXPd/1ZMdU27w18Bzl14WlTg0wkF7XKFDM2Fo=;
 b=VaRekhqMccjqtioufNtHHY+TifuvvwnGRSyllOxp0CzjbY5UTeOaEWfOpl06diMPRb
 dBbCCWUSumBwviWMnh9fJA6H4+uhMgDVu0g4AoMqAu3Gk29h9ziYRbCHWN1HpL7RqZDW
 L0oJ5vzvLSYmOzNjy89Lzd9pRW/7MifyS84jiTCLJST6WL9aJYNKAE/IDHc3rt900gL6
 MNwE4dHtv9sz6W9pldDTc8SZc2yxAI+m65MP5PPjMc6Acm+bLflWAgmUKSA1Oh10Vpyj
 eMs5R7VNXXQOHUpOS7ZoGM72db8WlNJmq+94hKtq1LMnJAqG5svLb6fXkaql8HRPZrcP
 jcMw==
X-Gm-Message-State: AAQBX9ckyRPQxabN+1DD0byew7NRgC5GQbTNOI8OT9yMN42YJ8N/5IQa
 njz/5IsUNv88rJtQZHwuBbDOLg==
X-Google-Smtp-Source: AKy350YJZBvyHyKGJX7A3MA4GvC30Z9W+/Ys3xvp+SzrGINXklbFIhvE58roKc3P+lvMTVKKJw5luA==
X-Received: by 2002:a1c:f601:0:b0:3eb:42fa:39d5 with SMTP id
 w1-20020a1cf601000000b003eb42fa39d5mr5808785wmc.29.1682276421544; 
 Sun, 23 Apr 2023 12:00:21 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c3b9100b003ee9c8cc631sm13712162wms.23.2023.04.23.12.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:21 -0700 (PDT)
Message-ID: <348ab511-4c1b-6ba5-30e2-c9a90e74bb54@linaro.org>
Date: Sun, 23 Apr 2023 20:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 27/54] tcg/riscv: Require TCG_TARGET_REG_BITS == 64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 23 Apr 2023 19:00:26 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> The port currently does not support "oversize" guests, which
> means riscv32 can only target 32-bit guests.  We will soon be
> building TCG once for all guests.  This implies that we can
> only support riscv64.
> 
> Since all Linux distributions target riscv64 not riscv32,
> this is not much of a restriction and simplifies the code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/riscv/tcg-target-con-set.h |   6 -
>   tcg/riscv/tcg-target.h         |  22 ++--
>   tcg/riscv/tcg-target.c.inc     | 206 ++++++++++-----------------------
>   3 files changed, 72 insertions(+), 162 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


