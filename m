Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDGVy-0001r4-UY
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 19:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDGVx-0001qo-4H
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:48:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDGVw-0004l8-4I
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:48:20 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41136)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDGVv-0004jp-T3
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:48:20 -0400
Received: by mail-pf1-x444.google.com with SMTP id z65so7562598pfz.8
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 16:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0bhJ+T1R7B4Okb7PxIdIqUuwnWvw9/yCUolBWmPYlg0=;
 b=zgZ6GwCDfiBfgkS1qfkdsnOJqQdJd8wLzspaNbNpdHkrPPcvTUdVrUq6FGfd5ZQ5VE
 BZSSHRBQiLtDbNvSeeE72VEOs4yWo6owQSfvqDX+gMMcE84dSM4GB1OFzwT0ofACT4CI
 DSibdf9rpZe2Kb2iA//iMTx8NPJ5GKRGraDyrVQqoIWpq5Giw2Fj+dWx0IYRNfrBbU4y
 ScBwUobJRiaxyzIlIq1mUyASbjqSY9EnVQ6+96jhZhYz1Kh7v//zFsLoQ96EkvBY0wTd
 VJUKVQoRxZgEU292XMZU4PXuUUNU3d9zUkEZ2riNFeZfqGiOy1YyWDna2nKhyOfKtO6k
 PdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0bhJ+T1R7B4Okb7PxIdIqUuwnWvw9/yCUolBWmPYlg0=;
 b=SdtNye5xYfm7tOhWtsl844ST5ZolV404QgZy/oZK4MAnl+uTUzBlM8rjzDyUQz2RBP
 a1rzWadZ0sUnfgvQ/cyPWRGrrYh4yheYsi0SxLBERzKxTo5cQgSQiyZxJiV3m1bXNG9Z
 YGa12ZoboQstEa34AeY4qioXhjd3IbReHeuC3xXHsIcdZGj3WP6xk3iuQtey4u4CFEpC
 ybobsjbhON8yYIadezM+tmU3pMegze7E+p2mW+zh6wkJ1Aev0sJ1URN4+anTaY5g3kCj
 ujB8/yzwWXbOEVY8FanXqOWOdl+DrReZjGmXaHMAgCmShQ3LFy+k1+WxAQIsjgtCQxwU
 Jcxg==
X-Gm-Message-State: ANhLgQ38h5S5DbbicRz7/XCW9IfePVSlBc5F8ZfQU8xwhkA++qT6Nd4S
 cFAcm86q4vbCVDdRWE13c8S97SMvwWA=
X-Google-Smtp-Source: ADFU+vupd68odTcVE93f/5NzUyjLTRRKFFf9QNwY/tZDnemCmB0fB6cx7G/ENimJbfqAMquPLN9D/Q==
X-Received: by 2002:a62:3854:: with SMTP id f81mr21301548pfa.81.1584229698524; 
 Sat, 14 Mar 2020 16:48:18 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 19sm40712236pfn.30.2020.03.14.16.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 16:48:17 -0700 (PDT)
Subject: Re: [PATCH v5 46/60] target/riscv: vector single-width floating-point
 reduction instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-47-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4bb9d254-7b07-c195-761b-de9319165eb1@linaro.org>
Date: Sat, 14 Mar 2020 16:48:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-47-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Sat, 14 Mar 2020 23:48:22 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 10 +++++++
>  target/riscv/insn32.decode              |  4 +++
>  target/riscv/insn_trans/trans_rvv.inc.c |  5 ++++
>  target/riscv/vector_helper.c            | 39 +++++++++++++++++++++++++
>  4 files changed, 58 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


