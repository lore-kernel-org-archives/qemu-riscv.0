Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovauS-0007Wf-Gu
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 04:10:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovauQ-0007V3-2O
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 04:10:10 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovauO-0001px-Ai
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 04:10:09 -0500
Received: by mail-pl1-x636.google.com with SMTP id k7so1042732pll.6
 for <qemu-riscv@nongnu.org>; Thu, 17 Nov 2022 01:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=76xVWsykw3cpvuY5v5DngD6NoCppogf8t6KYZkfJ0nI=;
 b=hta9fu4L/Hh6noK1HfhOCFm5ph8CguNY8DoTrtpr4i+mprVF95JbdrrFCk9/pV4nBG
 spPgVnzkInrHwPQeB/ZDndf4elfSVgZY+ChjesrcVHFGrJiYLO7cluWXAtmxa26/7oXu
 1jKNd9y8EazhQQUH47CMPCLv9iddEDphioGoBz5IrL4yS1kfhG5uUDA1s77e5YR+r5hz
 ONv3Oj+2Y6nN7El35T5vD0lAPz07c5S6NSZCsO6HlLGYdNVFMzP/nfPbbFtpFA0bSssR
 R0tCSjf7C6eR+ixZV6h4VZu+XfHnEca411LuBoLwWLz9zlziuoiabLE9fV0RKi2Suxc0
 d2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=76xVWsykw3cpvuY5v5DngD6NoCppogf8t6KYZkfJ0nI=;
 b=a/LeGHeoB1JlOPqexwjCuVXSfr3zm14WYx31yMpw67WCY+la9ULgGqJ1ouohp02zyB
 TA9POjgvAv7s6r3GJvKFB45wi9Mimahjr5xtjE47JPElN52xnP0Bu0nWQiegsEbOxk46
 9z2G04OHcOhEohFP84yL5Qzc+aO4B+syc0Kj9UwDm9/7lQacVoOuG2V19sqF7El50xNA
 vlr1bi4NR0dOc4Lz9VOhheV41puPgKAMLsnRudf93b4LSSAuDA7kQ/gVXzAIJRQAQBds
 /Is7SXkU94OdO3Y3CSoxnXsLTCGL+80rThAobHe6Kx6/8c0P3FyMfH1rJ10PK+SFx2bh
 t19A==
X-Gm-Message-State: ANoB5pk4WtGQy/rNyv9TBZ1H4+yCDnZoB2B16GASGmRgQ/bvF7898tGM
 I2GHO1Qy5heV7Gf8CjpEMa8ZjQ==
X-Google-Smtp-Source: AA0mqf5guqj/j66NBin5JfIQ4bDvsqGkTvfuVwQ2p3xD4jstk1Zu32zTetdhzoJKnXavWYkUQr88iQ==
X-Received: by 2002:a17:90a:39c9:b0:218:499b:bee9 with SMTP id
 k9-20020a17090a39c900b00218499bbee9mr1895873pjf.171.1668676206404; 
 Thu, 17 Nov 2022 01:10:06 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:b354:386:82db:58e7?
 ([2602:47:d48a:1201:b354:386:82db:58e7])
 by smtp.gmail.com with ESMTPSA id
 z6-20020aa79906000000b0056b8af5d46esm525631pff.168.2022.11.17.01.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 01:10:05 -0800 (PST)
Message-ID: <47d0245c-5e61-85a5-0015-ea1e187b37f1@linaro.org>
Date: Thu, 17 Nov 2022 01:10:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 5/9] target/riscv: add support for Zcb extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-6-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221117070316.58447-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 17 Nov 2022 09:10:10 -0000

On 11/16/22 23:03, Weiwei Li wrote:
> Add encode and trans* functions support for Zcb instructions
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn16.decode                |  24 ++++++
>   target/riscv/insn_trans/trans_rvzce.c.inc | 100 ++++++++++++++++++++++
>   target/riscv/translate.c                  |   2 +
>   3 files changed, 126 insertions(+)
>   create mode 100644 target/riscv/insn_trans/trans_rvzce.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

