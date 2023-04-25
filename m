Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOXI-00025l-Ph
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOXF-00024l-RO
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:41:10 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOXC-0007C6-LS
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:41:09 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so42775415e9.3
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451665; x=1685043665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xanJqR1ST0PgxE1tCfwv6M2DRF/CKI97TFDu2y4rmfM=;
 b=WxjQjwUZHu0H5TMIeAH+QZN8my2K/KJ6zUfSaFH9ewB3Ddb6kNyJ/UXwtHh8LKVufz
 LuQABdHw1GxzQxJLvxpFhXd7+M1A4vDAMWOeW6csmoxbTxzG05X37qBoPxbPYJdQzld0
 FJpUXd6zIZf+rpaQ7lz2Um/NhOOAxrKO3cKbDpOE8ZwWP844cgZE62almH3slpgiZFXV
 VgljRksZ4/UWb8FYJh2Nl90XF35NqTma/Yx6PpEmAb7s9AWwkB9j0IAO/PxphG7j83YC
 KPKiluZlZEnlyEfRKqDmlJby9cmEzTWsS4lwCQK7OIVoTRAzVw+9fITjGl5KCt02q/RT
 2VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451665; x=1685043665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xanJqR1ST0PgxE1tCfwv6M2DRF/CKI97TFDu2y4rmfM=;
 b=DUcv0jS8JBP2oj4ePbAnxDm63K2iGy0yGRgp+BiDuXT4rHMp43VJZiUvlENIMM25sX
 NmnYr38l1CQWdVOM0RNq2D17hv73pzLApYJ5qeQvx+vrqUX8DsnangxXzt3Edm9hIEP5
 i+8iQpqcBcMlLADjFI93UBE0pcYK/QfCIH8wg8K2PXB6vFsRGy8g0xUAxlWocDtueNOx
 JJhQrMxjhOuwBOq8Lyyii/zJ5xzuTedVMvbwUTegFeXRPwOtXV4ww+WGXV1dLd4EqlVl
 e8Q0GiMsCQWLt9jqcJlxDM/0GtnOkPKJY5MMNPB1nn0WP87robzk9nOcp+opu6isUpuE
 nZWA==
X-Gm-Message-State: AAQBX9fAK9HQJi0AWk8tmOJQHO6RREdn2w0hI9gUnZcyinltkyj2BRV/
 2GuFrR0q9cT/GJU9Kt4fa0W2ew==
X-Google-Smtp-Source: AKy350ZvthfWZ6qoVtyguvwa+g58834V1nEVNJfgWSlCQ9WJHaUB8bZc0gI21ATb48oJI2V1ayELOg==
X-Received: by 2002:a5d:428e:0:b0:2f9:b08a:a3af with SMTP id
 k14-20020a5d428e000000b002f9b08aa3afmr11021689wrq.49.1682451665224; 
 Tue, 25 Apr 2023 12:41:05 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 s13-20020adfeb0d000000b002fb6a79dea0sm13961731wrn.7.2023.04.25.12.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:41:04 -0700 (PDT)
Message-ID: <b663fa7b-6877-97bf-d624-2196dc5aba55@linaro.org>
Date: Tue, 25 Apr 2023 20:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 02/57] tcg/mips: Conditionalize tcg_out_exts_i32_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
X-List-Received-Date: Tue, 25 Apr 2023 19:41:10 -0000

On 24/4/23 07:40, Richard Henderson wrote:
> Since TCG_TYPE_I32 values are kept sign-extended in registers, we need not
> extend if the register matches.  This is already relied upon by comparisons.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


