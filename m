Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqexE-0000Iz-H8
	for mharc-qemu-riscv@gnu.org; Sun, 23 Apr 2023 15:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex4-00007o-0L
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 15:00:46 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex0-0004SD-PY
 for qemu-riscv@nongnu.org; Sun, 23 Apr 2023 15:00:45 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f7c281a015so2115121f8f.1
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 12:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276441; x=1684868441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LJILDGNLjVRjQd1j+SBea1d2py7wMKcHW5Ya8Mh6Ox8=;
 b=rLZgaxGykztrHKtDb7lxDfcuWftTA+vlJ1wwyEOcY8snoLWGiBVaGuu+XvOpJEKT7p
 mWBjmF7Vla75VMoQ2Fmir5TCzqx15iL5aYaIXyVY7QPTwBtsJ1wYRNPvmFWPBfm36OHP
 SI5Vj3TVysg/QFjhHcexyj1ppnJnAw9POiZqtqTzDp2Vh5512NdSJNf7Fiijx+kl8huV
 OhfNf8zP0zPnb7a1g2iSuCTL04BtrXn+BrzLB0i2EdllnHXx2UB9rWdJXwTlnDaEmbHZ
 QDpbYyqEpEt+vQfYttuvgVkmRYPRvzSoTiav3Wy4CnDtEAN9S2ikH06P0dG78bNVN526
 gn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276441; x=1684868441;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LJILDGNLjVRjQd1j+SBea1d2py7wMKcHW5Ya8Mh6Ox8=;
 b=YY9Vhmh6/vYBn6OvJu43rwSrCmlVvneBTxeMMB8UPdAQ3DDwTLcaaG+iw7MT3reIY9
 6z7eH8+EK+o08+hPpbUeGA3RcVK4E8cq+EbjP02LcVs1hSoAWkgm9YhEDzyvAW3VWO0E
 QdPot/3N80Nl2NAQssZHKeOtdzVNt0mhyC0Vc0JrJ78IKL6fxJMa5a5HGccssohM1lC6
 Pgbldd1FGryBEYGApMSERH4VZxXKjLBxorhYfd6dK/ZBB2Qwak0Dlws0oGzMd/RxeILy
 Hqk8F65LvkbzOS3lGPSx/IHSsaipN4jv0c+2QSA2xMO8BIIvVtzNY/FFy6478mthLvSm
 0AOg==
X-Gm-Message-State: AAQBX9fXIkAb9iXCgHLadWZhfRlFC8mOnX1DSPhbrtLmN6FZjQS+TRYr
 LgiB4rTPypeRNrPvM0k8Z0X19g==
X-Google-Smtp-Source: AKy350Y+pgC+MoUzx5t36Cl9CQbHbTcRTY/YKJPH+6dEkwEAf/dg53rP1qV5+9A3+b9iyECoxcUlAw==
X-Received: by 2002:adf:ec8b:0:b0:2fb:a3e:7cba with SMTP id
 z11-20020adfec8b000000b002fb0a3e7cbamr7338549wrn.53.1682276441288; 
 Sun, 23 Apr 2023 12:00:41 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9198543wrz.25.2023.04.23.12.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:40 -0700 (PDT)
Message-ID: <18186e8b-2a7a-950b-8358-94063263210c@linaro.org>
Date: Sun, 23 Apr 2023 20:50:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 32/54] tcg: Replace REG_P with arg_loc_reg_p
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Sun, 23 Apr 2023 19:00:46 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> An inline function is safer than a macro, and REG_P
> was rather too generic.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-internal.h |  4 ----
>   tcg/tcg.c          | 16 +++++++++++++---
>   2 files changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


