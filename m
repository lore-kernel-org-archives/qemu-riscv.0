Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD00b-0007oC-Vb
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 02:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD00Y-0007mg-UU
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:10:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD00X-0005wC-VG
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:10:50 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:35633)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD00X-0005ty-QY
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:10:49 -0400
Received: by mail-pj1-x1043.google.com with SMTP id mq3so5493014pjb.0
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 23:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LBoJKx8A8qtZQp7JbE01RexiLGiQ8B+fMtyuFPwUvCo=;
 b=uyEeMcgYvlDhF/8klO8mUJ7cJvzzQTgyMW/m661ROaj7I5QSa3GZAfp2H1NZchvDbl
 azHyRqYXHc9rO6c6b6foTFrta+7QD/FztQl7AIyowBv8m8ZK9OmAmgbllVtHctkRQLmX
 kGW4IbCUBzF4th2GAjlQmdT9HDdld8y0Eo4rc7LB7DbsPemUuWtfK4ONdq8xydyydX2z
 nwSDV8dLcHb1PVkvrv0b5uqxR7+xl0SwvmTBhqtWjWO9Hdw88ibGoeFV+SZxpojSSsQW
 cDChT5AcbUyhTdm3NhSpsHI2FBOCvjaG8GlirdCA6bUXI75tnELvnLpDa7/m7SxGzZLD
 JWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LBoJKx8A8qtZQp7JbE01RexiLGiQ8B+fMtyuFPwUvCo=;
 b=MOfZ0Dol4Q7iT/Xsa4U4HQ66Lv/k23e2WM4yIxDc1aQRaGCzbPdFxWhIwd5ZT4TYhW
 /gCp4gSOzwh1uT7rQqVBD5PlxKSBKpRDByljyDomG88pfupS+aau+X0HzfjChn0riA0Q
 lsWZO7znYrSxglu3QVhXnt2ZcrtLkzGag+ZRTKCY8VseHPhQ26gsseCQM9Qli3p1YddC
 Q/jCxtq0hvFXxcbz8VzFu3ndgDcQCnJV5gqwpH9vqOaGDfhhdt365cJ1OY7wrBpevPJP
 5JOQjKUorDFcwlY0dxD0ObGSsQVA7ttR28eHvxmKEzHp2pBbJbrx/q12fWSKLTbvvWtn
 qetw==
X-Gm-Message-State: ANhLgQ3CcteuyCIyaH/N+SLA2T+8OOx/UUgOKRHUTRcQ3UZwjfYzvb6F
 +xLcv+rhVnoTwSJdA8pP0rqUGN0eArI=
X-Google-Smtp-Source: ADFU+vsJZcTvdxDTdHjxQNnez/Cc48Yeh5GeJW5SoPjzdwigLWPoeXS6SeRVHRJsyCqhzDO/FoE4+g==
X-Received: by 2002:a17:902:864a:: with SMTP id
 y10mr17171249plt.2.1584166248535; 
 Fri, 13 Mar 2020 23:10:48 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 r22sm13184477pjo.3.2020.03.13.23.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 23:10:47 -0700 (PDT)
Subject: Re: [PATCH v5 14/60] target/riscv: vector narrowing integer right
 shift instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-15-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55ea569f-3e60-7943-5975-af8baac6e38a@linaro.org>
Date: Fri, 13 Mar 2020 23:10:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-15-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
X-List-Received-Date: Sat, 14 Mar 2020 06:10:52 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 13 ++++
>  target/riscv/insn32.decode              |  6 ++
>  target/riscv/insn_trans/trans_rvv.inc.c | 91 +++++++++++++++++++++++++
>  target/riscv/vector_helper.c            | 14 ++++
>  4 files changed, 124 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

