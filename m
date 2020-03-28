Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHzDY-0005VC-SZ
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 20:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38103)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHzDW-0005Ur-Kc
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 20:20:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHzDV-0003Ct-BF
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 20:20:50 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33411)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHzDV-00033a-5M
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 20:20:49 -0400
Received: by mail-pf1-x442.google.com with SMTP id j1so5331373pfe.0
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 17:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kMnXvxoIDB6jHvcS3CzFeAgUuNu+ToAuP9j4ypZV71c=;
 b=NMSFGcTmDLLi9AqiTuYH3K1iF2JbDzQxCA2M1HET0Z9KEwPdVCHkjfwk84KZBbGoXz
 s9cdJxujHJbNtnrgpVzOj8FE+HO/JKtriQTUNoUAN+qLFdhyxtpgXIpUqEYLB1j/Tomr
 ECfKI7hawvPmbhoTRP8ggNonroO3ynhUT4pToIKtoW51+hicP2onMG5M0QgP1pnWPhGD
 NXR1de3/lLDMrZvmhYQwWa+hq45tYPdAQ5B6qk86MfQg/bRzMKgjGzvhCMa17EnBnxUr
 Ncc6z5Et7WoLQfVrjJ2uHKTuWkPk2NEOCmYqO7cS+3+UVGk2c4yXCSpc1XXRU7hn3gaa
 rHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kMnXvxoIDB6jHvcS3CzFeAgUuNu+ToAuP9j4ypZV71c=;
 b=PwIUKXtESVem/3sBsKd4iWyUDmDQs+QdAvrwaIa765KRBHayMJ7t5Iva4VXTmIVhUs
 rxr4176lS8E5P9IwbizhM3Jja+dUtURrbk5eYr2oiWf0q5vjeR3c+ootllAPoenaeYEj
 7+OXGoUHZ6Il8997sTkP1LHu0RC/9geTQDAQQ1C0L9xnHntdKLK6NbZ8uDwAztA85+vM
 0+kqLFbZWwY11LqHHGvexMvTOnxkYLWSeE45KQrLJRqKRKxIQRFzJ5ByW4KzUJeg6bJU
 4oMsmFzUaM7O08JPAWTJIpCkqnjC67dnb5B1OjFebntmGCAV7z/GanoybTYM/i7cvcCU
 uFKA==
X-Gm-Message-State: ANhLgQ34TuQqLQvOwfDEOCkdiS47dnXzGLy5ySmAEAaWJJo38xCsx/TR
 JA3mJuS1jxI526Pplj3YGmoN9l67LS4=
X-Google-Smtp-Source: ADFU+vuRKN2A4Uv2+NkyoiojZEa7JKcAEufvZI7L1zwrmw9iAPrIui5evCwCldYuikIs+8JQy0xklQ==
X-Received: by 2002:a63:82c6:: with SMTP id w189mr1835473pgd.357.1585354847206; 
 Fri, 27 Mar 2020 17:20:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id x70sm4611391pgd.37.2020.03.27.17.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 17:20:46 -0700 (PDT)
Subject: Re: [PATCH v6 24/61] target/riscv: vector single-width saturating add
 and subtract
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-25-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3460b0f5-ab47-238e-181d-a74f3d135005@linaro.org>
Date: Fri, 27 Mar 2020 17:20:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-25-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Sat, 28 Mar 2020 00:20:51 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  33 ++
>  target/riscv/insn32.decode              |  10 +
>  target/riscv/insn_trans/trans_rvv.inc.c |  16 +
>  target/riscv/vector_helper.c            | 389 ++++++++++++++++++++++++
>  4 files changed, 448 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


