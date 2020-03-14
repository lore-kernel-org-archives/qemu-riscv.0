Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD2LE-0003ne-BD
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56715)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2LB-0003lW-W0
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:40:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2L9-0001kk-7G
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:40:17 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40982)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD2L9-0001iK-2J
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:40:15 -0400
Received: by mail-pg1-x542.google.com with SMTP id b1so6434817pgm.8
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P4sNrvWNvCaBZj3mNu70ffhO7O7WmJm8Gb6cNvUeIWU=;
 b=ySnVuIXXq+eWUlRFP2RQAYCtnSWmkoCeKitu/kNh8qEKWO64FA57+QaxnrEpUENZsR
 IeIVvhNVddoGitWShK4uY5h1cRV6Ec6QxoTRjGJxLyQ/81vpBMZZuBPUoFVy2DPP/p3L
 UOXtel0+Z4BsOja34RMCg/YvT68jmeloeLtY9vKvLqRStBZpmpJxSl5I9naxzaqvCsJ6
 WNEW+N92W3+qQ3Mts8rBwS9nM5y8o8xpuoZFEZlFL+bFQeWU3MEKwjdrE2OliJc9pIhj
 2KSzqndC1z/cq9q7PfBfampomgkrWCqk5we42sg9ti6EWqjtlp0osK7SGS31WY8wggqo
 fdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P4sNrvWNvCaBZj3mNu70ffhO7O7WmJm8Gb6cNvUeIWU=;
 b=sIxhPI1Q2jNWdnB15G/jfll1NX7cvTnYXRXVsrw/ksd1ktYf/Pz4oSFI+zsAVorZ9O
 CinoyMACn26CaM1qE+IRRrxXVLxN+I7L+2gbtCi+jwDlHixBDn1y5KXKeQLrtr58xk5S
 6qEgnvjXrF1+pMQot9mnK+kOC/q+ri1ACxrS7sfTL0JXbHGEy6YS+5k6yNk4NgktOMBy
 t/haKZTJwxBvd2jArqwqBcoqMbzu8rfqHkij/gmE1cuWzHAWL9V3/qqRm4KqF5rlAJgm
 kkHXTDnBqqDx7f159kE+ENYfLZ+Rc+IKS2sRRt+C+NmpiM5biE70XsXo/8UXsp1HpAH8
 GQIQ==
X-Gm-Message-State: ANhLgQ3EGLIMKe+m78yE8zu/MxjT5o45ykEeqe6cWaL6yOnmY0YDii7+
 9KHwAu5dZHZyS8tS0tjEiHn1wn+AyZk=
X-Google-Smtp-Source: ADFU+vurUo6td4SfbfpAfR7jcSg3OIzmOVo4udCOehuNTSfUO54JPCFQeHWaiCm2NMts5uuGunBBHA==
X-Received: by 2002:a63:4e4e:: with SMTP id o14mr16868290pgl.228.1584175213708; 
 Sat, 14 Mar 2020 01:40:13 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 63sm20354289pfx.132.2020.03.14.01.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:40:13 -0700 (PDT)
Subject: Re: [PATCH v5 29/60] target/riscv: vector single-width floating-point
 add/subtract instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-30-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a8b13f2-6696-5e5c-d35f-e00962d7f0a8@linaro.org>
Date: Sat, 14 Mar 2020 01:40:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-30-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Sat, 14 Mar 2020 08:40:19 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  16 ++++
>  target/riscv/insn32.decode              |   5 ++
>  target/riscv/insn_trans/trans_rvv.inc.c | 107 ++++++++++++++++++++++++
>  target/riscv/vector_helper.c            |  89 ++++++++++++++++++++
>  4 files changed, 217 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

