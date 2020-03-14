Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD2UL-0008GX-II
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2UF-0008F5-8K
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:49:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2UD-0002F1-CH
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:49:39 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46302)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD2UB-00024d-OU
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:49:36 -0400
Received: by mail-pl1-x641.google.com with SMTP id w12so5442410pll.13
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8zXx/792WLgRyPMk6TwxKI9vhi/pcFEZ88ADo3fFGso=;
 b=cmBx5DIFYSKzW4t3ERiX5I8wvLucLuiIYKBl5rKMMO4pHxblDnwrM0JC5FZXeC71YZ
 4uPvbAWLsbTsIDxlHeye/mVHn9pp3FhG3ZsM/drj0QUKRTU148DxMONDqeAE0QiHVJT4
 /XLMSUAArDde2KqHewbD0fRvMjjCvtWktKG39aC1B9p1uJDmhruL5Ls73a1dQKs2R65W
 vaFT6yNGqcjwvtUepEeNas//W+f2NODlS7ExIc0Z6+HFubqcgpZpoyBnLjR7hx1ay3VH
 VCNS78mK/i1XQ7f1x0ghhxTVEfRr50BRRmWWM3a3Z+kH68HZ/eEcasPZ16A0XNOjGB+y
 aI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8zXx/792WLgRyPMk6TwxKI9vhi/pcFEZ88ADo3fFGso=;
 b=kKCYhSe1MJCb3QQDPGCdjirxFYkXTZdEtoHgWiGSTySaLQd5n7Ep/SbiNwiF7v7WV8
 GxS4ofs5R/mE2ZWwT5WekKDR8ACBrh1wEImxGOHza8N9x6ScPRUQ6W27JVf25/T0M2zw
 ZS/Dje2wM7ORXE38cFizBsxLoL0wdCmEfyTGdJceQ1OPgnrOyI3loj/UFkuvVEZuh3ag
 FLqNkpCxSVq7BW3e+ky3b/ETlUZovESdQ/R4wdE8kO6AFEPB0eLwMxCXGES6k2VQMJe8
 bRr+wX2dt0OmAH87ydcdwsRbHO67m+cvdST9tVppGFVr1bJztZ1+RXVvQvoJ/6ADx1Hl
 PV8w==
X-Gm-Message-State: ANhLgQ0O0MkWiefJq/ro+5qvllyPxzXljzUCk/z7th5xZGp0yONFtuOX
 JQM5rh1XOESCM0j7tf0kS/BW837NbJY=
X-Google-Smtp-Source: ADFU+vuSN8+6qdyW+iMDPd1jLr//i7dBtAR9mYURRIrHKWMhvTWIZOZyfLGlkMjfG3sSuudTMK9/KA==
X-Received: by 2002:a17:90a:350d:: with SMTP id
 q13mr13581865pjb.171.1584175773335; 
 Sat, 14 Mar 2020 01:49:33 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 i2sm13632837pjs.21.2020.03.14.01.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:49:32 -0700 (PDT)
Subject: Re: [PATCH v5 33/60] target/riscv: vector single-width floating-point
 fused multiply-add instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-34-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fbaa033e-e1e6-e17c-8758-b7087834ed8b@linaro.org>
Date: Sat, 14 Mar 2020 01:49:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-34-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Sat, 14 Mar 2020 08:49:41 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  49 +++++
>  target/riscv/insn32.decode              |  16 ++
>  target/riscv/insn_trans/trans_rvv.inc.c |  18 ++
>  target/riscv/vector_helper.c            | 228 ++++++++++++++++++++++++
>  4 files changed, 311 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

