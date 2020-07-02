Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jr2mW-0005ZJ-Hk
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jul 2020 13:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr2mU-0005XP-9R
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2020 13:13:50 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jr2mQ-0001vR-Q5
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2020 13:13:49 -0400
Received: by mail-pl1-x644.google.com with SMTP id j4so11559771plk.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2020 10:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=07nJVMkiG7AtfkY5LtU7B6xMAKxLM2cvT3Tmdjs4RXM=;
 b=RJJjcHBYvCzvsQDc2YI4iY8QIMd6CEP3rn1W/fXUIGHcRmVVHSYXW8w1lQ8uoAl/4I
 L99Qo4/DQYoerRiuk6K27NX96R1/o2lgI7gwrsha3s52hQA4B/xoZLc+qrg3ZDlrlHOn
 kPBkn/GQdGbtHML8fkS1oOXTNZ57KjOO8ahWt1oDWVl02B/ysDIDbyIBfgvyoEjGqvUV
 3OOTEXtxlwbH4S6Ru3WCzmamCmUyn8+G9IT4UW03wHEQDXqqX7GiWbo0jZO+x4nHrz82
 InH4Re6MpmWhlfn27tuONdx1t74SnVGAzgiGrayLwIKcz3uMDGuuQ1VH9tXXFIODFaJ0
 Y55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=07nJVMkiG7AtfkY5LtU7B6xMAKxLM2cvT3Tmdjs4RXM=;
 b=nAKzH2J55uVG7JQQslosRYFKuWMrEE0ztcEwFLdgTIBVDKVSZuVESGOAlFE6Ik29fN
 NKhIn3iVpqmlzzoYUILGuveul4bcqhmMh+AH8Z7YfzKniYCTq9zTYpHwGizHjIbG6rxV
 rmLLlAMZc+INQDweTdnH/HZJWI+o2/X9VIIdTT78SmObx58qLebbTJQ82JD+Gpw6yJg+
 eRJZmD+GXxdDHqjpO89m5sTTBwKy8wYWx/I4bq1Bls2TZpZikM+rY+eeayFG8mAQhQTQ
 PgPXRXEXe9F9CWotMn+6XfG9yiHth7cXUmvplN8OgBFdBb5UfivGHDHEJiBNREC9ztm4
 qZPA==
X-Gm-Message-State: AOAM532Sb/thy0IBGg0zoDrq+KyLQM7+fl1b5hFERm9OLXSY2pgnvQEI
 HyblhywhDXC6LY+4Hf7jKpTvJQ==
X-Google-Smtp-Source: ABdhPJzmMZrhv4LAOKmBF9xqMwGkfJArhZOZk+1dHDVbMcY/tV2I5mNn/VVi9tFtz9FTgDIxiLT36A==
X-Received: by 2002:a17:90b:4c0b:: with SMTP id
 na11mr33788479pjb.176.1593710025493; 
 Thu, 02 Jul 2020 10:13:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id t137sm9745346pgc.32.2020.07.02.10.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 10:13:44 -0700 (PDT)
Subject: Re: [PATCH 4/6] target/riscv: check before allocating TCG temps
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, ianjiang.ict@gmail.com
References: <20200626205917.4545-1-zhiwei_liu@c-sky.com>
 <20200626205917.4545-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f28923c9-937e-37fb-1402-86736177aa52@linaro.org>
Date: Thu, 2 Jul 2020 10:13:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200626205917.4545-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jul 2020 17:13:50 -0000

On 6/26/20 1:59 PM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/insn_trans/trans_rvd.inc.c | 8 ++++----
>  target/riscv/insn_trans/trans_rvf.inc.c | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


