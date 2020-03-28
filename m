Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jI2bk-0007ge-Mn
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 23:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60712)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jI2bf-0007g8-2C
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:58:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jI2bd-00058h-Ux
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:57:58 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36267)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jI2bd-00058J-PO
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 23:57:57 -0400
Received: by mail-pf1-x442.google.com with SMTP id i13so5538432pfe.3
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 20:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v63jdjHMa34GweLIYpGjS74osC4ZDLGriEaDp/Ur9aw=;
 b=CnOW+ofl9/VwkAMvx0mdOYgdfbWGjENgg770unos9KwR7xiofYjFVxvy+zmhTK22BU
 Ppc+iGBWfjukMRLCmO7WHiv1YMdkON2uD9Uy52D5SpDRnIq5q1ZhZyDY1B7u6w+PIYha
 OohLEllmqTqDBovt4BW+5vv+bxtXJGuILhDKqbWVgcUE0fQ7/aaIZDdwOB1uHz/ru1ih
 1auAM1ejMuOHcDi1lNVVGnDlrdGag9rS7n7nT07Czwp3OcyciC5a2evxU/hJ8Cm7+riK
 0kRNyYB+gNP2RYetbRg22fBIgyryzbffW+Dfo/wIlvgNMqEnYfytECiTlFAPy1vnozqL
 zfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v63jdjHMa34GweLIYpGjS74osC4ZDLGriEaDp/Ur9aw=;
 b=YQreW8uOpW1jDwfqxpgg5Y9VRuwLZ9AEesIyO7Inx6i78KUl+7Jxl7OeRDNcgJZad2
 1SbOSwDz1JI/TIqephDXCCQ9fk8d/zr5UqpNceDgZz31jzYBb9PFGYc8XNokDeHpQGj2
 PaKFutp5IspEwNwXwjzFLKk+PDsJtb2HAUsq7iujzFne6F2kOyA5SvxeENP5BJn4Sxh8
 CmnDrH8wqnIEooQFejv8N0iU/i9Hx9+2sXGcJUmRlCWi68O0sARU0DvGa6SIZwZv8L6P
 a5RL2TMMsAyAAexVCMUT+gEa0u/oIt0H6QfiR1p6NOd6/wSYWil+ucuUv84QdIbZ/10r
 F5ng==
X-Gm-Message-State: ANhLgQ0ULTv1c4oPScANvq3oMZd/FrjMfXjH0l3QfFk9RdpP0lNP6VVl
 fAgRk7gzBYA9jI/3Tc/sObaCPSAEFnY=
X-Google-Smtp-Source: ADFU+vuGz8r2wvgnnr1w4ACd1lo9wb56yR0hiM/uwAxUmiYJ6x13KaGaihtrJUmrqsebhXWqeeOAhQ==
X-Received: by 2002:aa7:9e42:: with SMTP id z2mr2493175pfq.109.1585367876286; 
 Fri, 27 Mar 2020 20:57:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id 144sm4938726pgd.29.2020.03.27.20.57.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 20:57:55 -0700 (PDT)
Subject: Re: [PATCH v6 59/61] target/riscv: vector register gather instruction
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-60-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2c3feba-9a54-79c6-cb2d-fbc7d7ca7dac@linaro.org>
Date: Fri, 27 Mar 2020 20:57:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-60-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Sat, 28 Mar 2020 03:58:00 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |   9 ++
>  target/riscv/insn32.decode              |   3 +
>  target/riscv/insn_trans/trans_rvv.inc.c | 127 ++++++++++++++++++++++++
>  target/riscv/vector_helper.c            |  64 ++++++++++++
>  4 files changed, 203 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


