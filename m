Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppyvp-0002w5-5h
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 18:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyvj-0002v9-8g
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:08:35 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyve-0000zG-GK
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:08:32 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f1763eea08so23301645e9.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 15:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682114908; x=1684706908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z+XQpv6RjHESwgJHmX6WCcNUotdPTD51pqluNuau6os=;
 b=quIDhl7Z2Yd7iqsGQ92jbAUL4HQmMWqnFlvawHBTg0ioIXiX4FoVkcMkhY1GOxgbJv
 3ZDDLPiYw+/0fPIVURRwP9KSFHXgIcLzVqAppLVVWIAbMte2XBGdP/FiPcXbbIYLnyQT
 jeJReRPkRCnOO+Aw5X5fPq6E4cy008GqjE4RdfH6AA+QvK9IXcR2NoHdaWDTULCOrT+d
 KmHGn5w773La3j1echNVskSHQchwQY3e40Fcmc9sVf2bChsbFIlWez0V1CBvkfMCAP0T
 iUKjHPN2H6eG1/ABoUnBphyuJ/nix60IJNly0IJUbUJ9FZL92yi7EOI4T1F5AHUjR4Si
 bWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114908; x=1684706908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z+XQpv6RjHESwgJHmX6WCcNUotdPTD51pqluNuau6os=;
 b=Y//ITtUzLfOpT+TWUEaa812WIA+oDMimEPOpYja2c360kB4uGRjsd0BmIZreTk5Zb7
 kz6O9+85FWYe98AsQ0Z/h8Bs/CQ0JRUus/Az7FHJydfs5nppAGc1otS9uDEu3DuifT9g
 ToIsWPU7IgTM13mZV6/w6isUK6f+9YgEhU3sZGA3fCB15FqLKvFSs+wcWrrn4pvVVuhc
 OH5bYRb2rvWMxni4hnosGIGriJoswuhs7STsrVCmjzmDEG5OpXV408IfsFepEdyAhu8N
 JCPc6jGtTcUStkgjcZP3tS1A5U7+LpJdgGKZY2AXhSRDfUJIceo/QzsPcceE0uHQsbL6
 G7jQ==
X-Gm-Message-State: AAQBX9cTBqtd0euEHg0F+QfuMD7SQOih08i5vbeqckncSqaiqc20EF7f
 /A1PKg753AkbY7Sf0Xh5Y3MkNg==
X-Google-Smtp-Source: AKy350Zzdo2RdoJj4ZunQy0VuEAbcMbmzNkXqfqWfkyqN5BqYGdP0vTVFV7QyzGTlBWNkL3AWhf+Ow==
X-Received: by 2002:a5d:4042:0:b0:2f4:6fe5:b07e with SMTP id
 w2-20020a5d4042000000b002f46fe5b07emr5202804wrp.40.1682114908572; 
 Fri, 21 Apr 2023 15:08:28 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4cc7000000b002fa5a73bf9bsm5226091wrt.89.2023.04.21.15.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:08:28 -0700 (PDT)
Message-ID: <96b80825-cc36-6893-9386-eaa71feb1538@linaro.org>
Date: Sat, 22 Apr 2023 00:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 02/54] tcg: Replace tcg_abort with g_assert_not_reached
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Fri, 21 Apr 2023 22:08:37 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg.h            |  6 ------
>   target/i386/tcg/translate.c  | 20 ++++++++++----------
>   target/s390x/tcg/translate.c |  4 ++--
>   tcg/optimize.c               | 10 ++++------
>   tcg/tcg.c                    |  8 ++++----
>   tcg/aarch64/tcg-target.c.inc |  4 ++--
>   tcg/arm/tcg-target.c.inc     |  2 +-
>   tcg/i386/tcg-target.c.inc    | 14 +++++++-------
>   tcg/mips/tcg-target.c.inc    | 14 +++++++-------
>   tcg/ppc/tcg-target.c.inc     |  8 ++++----
>   tcg/s390x/tcg-target.c.inc   |  8 ++++----
>   tcg/sparc64/tcg-target.c.inc |  2 +-
>   tcg/tci/tcg-target.c.inc     |  2 +-
>   13 files changed, 47 insertions(+), 55 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


