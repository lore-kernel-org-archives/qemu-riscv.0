Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppyr6-00012R-RM
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 18:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyr5-00011p-H0
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:03:47 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyr3-00005B-Qt
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:03:47 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f176a16c03so14850695e9.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 15:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682114624; x=1684706624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MqdHGJnraiAb12CY7TpGU8LSjCrhPYjbFG/Cw8yt20Y=;
 b=RYNe4BmKX6cbKNFdZ/7EwJ8VdcpppsFbBSLz4AQKA+HIR6VCPznua3LrMvtQrHkfU5
 3gMn3JFsOgCsED4jsm6nudqTTlEz5o+/f0/DbJG1jQ2X434PO/kgppxGsGBHnXeD8UOn
 icfPOwJdJn+jLbRXot6YyK16mllB707WxBXxSt5z9SkEmVId7/yBBSf4jGsJQqLla9Nv
 eXwdbxFCiwYFZF1WVw/4SQlNCBZsmJ5U6IIueDWKMANAtVCoHI7d/75frRLhY23cnZ79
 q8ehGktrY1VSyJ9Q2NElqNgdc6qduVz3zhxgz+KevevVZTV7sMttN6cfv06zziBXRrj6
 XVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114624; x=1684706624;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MqdHGJnraiAb12CY7TpGU8LSjCrhPYjbFG/Cw8yt20Y=;
 b=Ei3mL5XF/5rPuBIuESTztmY//BG3cgfFP7DzzQJ+oYHrjWGmxL15sOyRzGEeKXn//e
 v+n9LwPsSdOQDMW01MFj0hB2IAEwJGFS93K2qki5HOsnMo7L8ngXfLD86iyTgW7hCr+z
 XWEub/VupPXmUd+A+Av7X4o0klGNWtmXgPGMKBKtpcVOZ64M1eq1WupRTI9CocYdQD8p
 75lKt8iaQtwHGUEe9VnzOYKWm407afqU9Uf/TBUOIFrlty0tWQJI02v5nMP0Lc+yBm6h
 X79iEQ3drOp1FlTBhbj4LNitEdjDRU438g6qViu3h5tbLYpgAmrwJ6gpjawyGbXBfFDt
 JFVw==
X-Gm-Message-State: AAQBX9dgcw5jRJIr4GydF5FX9N5rzI5oyWrRUZJe+ZuqXjuaQcHgdwz3
 c+kbKqexuk/0BJ31D3QMGbr+YFLAV9APS+ZELSU=
X-Google-Smtp-Source: AKy350bQzlm4u6juF40AnP/bi9SOdzljdlikAKfmA1HWSfbaKIRYKoyRDxxjRsrWwrmT/weMGIivPg==
X-Received: by 2002:a7b:cbd9:0:b0:3f1:94fe:65e2 with SMTP id
 n25-20020a7bcbd9000000b003f194fe65e2mr2161093wmi.33.1682114623909; 
 Fri, 21 Apr 2023 15:03:43 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c4f1200b003f07ef4e3e0sm12442322wmq.0.2023.04.21.15.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:03:43 -0700 (PDT)
Message-ID: <69a9c5f4-c1bd-d0ca-ce14-7b21ec7c35d1@linaro.org>
Date: Sat, 22 Apr 2023 00:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 06/42] tcg: Split out tcg_out_ext16u
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Fri, 21 Apr 2023 22:03:47 -0000

On 8/4/23 04:42, Richard Henderson wrote:
> We will need a backend interface for performing 16-bit zero-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  5 +++++
>   tcg/aarch64/tcg-target.c.inc     | 13 ++++++++-----
>   tcg/arm/tcg-target.c.inc         | 17 ++++++++++-------
>   tcg/i386/tcg-target.c.inc        |  8 +++-----
>   tcg/loongarch64/tcg-target.c.inc |  7 ++-----
>   tcg/mips/tcg-target.c.inc        |  5 +++++
>   tcg/ppc/tcg-target.c.inc         |  4 +++-
>   tcg/riscv/tcg-target.c.inc       |  7 ++-----
>   tcg/s390x/tcg-target.c.inc       | 17 ++++++-----------
>   tcg/sparc64/tcg-target.c.inc     | 11 +++++++++--
>   tcg/tci/tcg-target.c.inc         | 14 +++++++++++++-
>   11 files changed, 66 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


