Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppzYf-0007ic-1L
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 18:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzYc-0007hI-4X
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:48:46 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzYY-0002Zr-91
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:48:44 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so24129455e9.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 15:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682117321; x=1684709321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xllKdc616qtY9+IAX7UEbQTG2zDbOiMc6Fuh3bTnLBM=;
 b=r0DB3J3N4MibownfG8sScOh3nVc4b+HGTEu5i5934CCBkgWwtOu3RB+NzShQKkcZje
 eNPMta6vuBvHBOQyuImKc8B7JgHWSVK0MbAUgCXPpzP6fOsr4xmb0aEXE3Yd0q18isQU
 9IyeWBqHOewqZttJ6jZh+nzY4xh59JtWNn1ilj8vzkveZX1SIN4kZucKcTMJ1E7lKzGf
 aF3UB7Hcu6PHH16Yq+KrTCKx7IXXBDrLDINF/8PNJ8QsEZZQOkLybxtzYKWL11YH0nP4
 n/i3udZa+xvYWmHtJXDD96YVUw7t2KBhpkBSj7Q4NgC65JR+7JebNe/2htugbivMFyQj
 9Crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682117321; x=1684709321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xllKdc616qtY9+IAX7UEbQTG2zDbOiMc6Fuh3bTnLBM=;
 b=Qxu1HAwStWX8+yjU0fsDlcLf3OCiLhl95g26yn84TYU41zssA3pOU79aCzQkjXQSNY
 XkFgB/epTZjpbmBTQUPZNipdRrT/9rlbtJ3T7DNX1Zytm5+a9FQ6XldydSjbd7WXT0Ue
 PToUYwFTjFPoY7iDqc1YIEaXHjIkMXQcWwMnmFDYH5kk3svCo3lYBjX54+i+yLJfTxMb
 4CGKo2svu+1IH1g8iMHaiVwpH2guYBu3f5bW46ProtSId4Ws3tTA0Bv6TdZSJpAPGp5o
 ZlcbMCvxtC3qoTQE42cupMXuJPMnAokMea6bDkXBxJQ3KobGOBF68nj8nknBEY9Zay2F
 3CQQ==
X-Gm-Message-State: AAQBX9cjHxK5T/QcBcVupmjFClFx5QMa9deoRcIAAPk6jXxvwTfoKBuo
 z/+jtB7YmFKQArE2hvWu9AGEfA==
X-Google-Smtp-Source: AKy350aPa8hxAY0pC15Vsm5koq0J8k02Zv+ykg/IrAcV9SY7jVeB27z+vdKH5ARFz0Ekq9+Urag4qg==
X-Received: by 2002:a05:600c:35c8:b0:3f1:96a8:3560 with SMTP id
 r8-20020a05600c35c800b003f196a83560mr1167706wmq.10.1682117320976; 
 Fri, 21 Apr 2023 15:48:40 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b002c54c9bd71fsm5305862wrw.93.2023.04.21.15.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:48:40 -0700 (PDT)
Message-ID: <8d199023-fb40-655b-2c5d-0fc3e345a580@linaro.org>
Date: Sat, 22 Apr 2023 00:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 15/54] tcg: Split out tcg_out_extrl_i64_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Apr 2023 22:48:47 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for type truncation.  For those backends
> that did not enable TCG_TARGET_HAS_extrl_i64_i32, use tcg_out_mov.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  4 ++++
>   tcg/aarch64/tcg-target.c.inc     |  6 ++++++
>   tcg/arm/tcg-target.c.inc         |  5 +++++
>   tcg/i386/tcg-target.c.inc        |  9 ++++++---
>   tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
>   tcg/mips/tcg-target.c.inc        |  9 ++++++---
>   tcg/ppc/tcg-target.c.inc         |  7 +++++++
>   tcg/riscv/tcg-target.c.inc       | 10 ++++++----
>   tcg/s390x/tcg-target.c.inc       |  6 ++++++
>   tcg/sparc64/tcg-target.c.inc     |  9 ++++++---
>   tcg/tci/tcg-target.c.inc         |  7 +++++++
>   11 files changed, 65 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


