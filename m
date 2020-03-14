Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD0sb-0001qu-Df
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 03:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD0sY-0001or-3Y
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:06:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD0sT-00064X-11
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:06:37 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD0sS-000636-Q8
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 03:06:32 -0400
Received: by mail-pl1-x643.google.com with SMTP id j20so5370452pll.6
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 00:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BzuCF4Yxzja95U69C7q76xUL4I543r4Qz/8+UWv4WPI=;
 b=H+ibzfaQsvu7V+sFLOxaZ6ddSqh9HKtzyJXKDwXMfuMsNkyZKzIF9ew64f+aYOTCIP
 20AAuwCttIHySF7b6vFuOpMTOIkz8TcVgB9kMqjNloji2j43pBEsVNGdV+mYOQT4ZRNU
 lMqlRBGOEJzd4ZHLZGCSyHipfmEXTLpy3Qy2ygi3J0m3pUy6bzHD0YvLbBibfF9sdVqX
 aFXlqhs2RnObCoD+QvKyU9LW9WuznTFsue80re5E9xmVrEvUIjMjZop7bd+4yER7pSil
 Pjp0XrIonDaEwPlWmJErK5gdL2hytw3eaEzdaD5RKp4CIBcS5t+n/aTdKB17T+6BWe6J
 UU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BzuCF4Yxzja95U69C7q76xUL4I543r4Qz/8+UWv4WPI=;
 b=gKRNpkfUDrh5vitRLvTcqa5Lfq8J7CHsC7KMAlJr4wSsfC1HbmPps1iTzi9V3/DjAj
 GxJcp5uKNzZA9q9+s3rcIa3n4k0/4q8aia3COzWT1wWaDZbEPv4CDBsLWF+9QgLMcxR2
 e7TQgoahoCLyOf6CXeL2PgyNMzinoz1y005+J1CI/EJMBFQPHmMgvyvWYvbxABV8xzQc
 t6WxbySZV2PEzii4As6ITaBsa4QgHEFOKAa+Wjo0XTqBf262QObRbznGfadsyjZ51dsg
 yZH7PI1JdYikrilh/GPKSYPyREApESsDweF/IhA1ZS0x6kUPGTiyPLrvCk0WFL7+2IXu
 gubw==
X-Gm-Message-State: ANhLgQ26yIpShTuMe4fGmsIpgvN8S5mjhPwpAYAYPtPNmjWXgI/nscQm
 KnyNZv7BWfX2OtiZHUK/bQecVrL4e8A=
X-Google-Smtp-Source: ADFU+vvZ6+PITyG0rsXfSfDBgy/GIULg1TD5HxcfoX1NvzqL4WNUQSBziLBNbIr1wcTOB33kUo+Mqw==
X-Received: by 2002:a17:90a:3acc:: with SMTP id
 b70mr12833632pjc.179.1584169590126; 
 Sat, 14 Mar 2020 00:06:30 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 i11sm9379502pfd.202.2020.03.14.00.06.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 00:06:29 -0700 (PDT)
Subject: Re: [PATCH v5 19/60] target/riscv: vector widening integer multiply
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-20-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93f59ade-8022-ebfd-cc0e-7540b97acae8@linaro.org>
Date: Sat, 14 Mar 2020 00:06:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-20-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-List-Received-Date: Sat, 14 Mar 2020 07:06:39 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 19 +++++++++
>  target/riscv/insn32.decode              |  6 +++
>  target/riscv/insn_trans/trans_rvv.inc.c |  8 ++++
>  target/riscv/vector_helper.c            | 51 +++++++++++++++++++++++++
>  4 files changed, 84 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

