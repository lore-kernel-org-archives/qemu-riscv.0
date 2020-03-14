Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD0kk-0007yi-3B
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 02:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37833)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD0kh-0007yT-V3
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:58:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD0kg-0007bF-Bq
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:58:31 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39288)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD0kg-0007Ye-4g
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:58:30 -0400
Received: by mail-pl1-x643.google.com with SMTP id j20so5362564pll.6
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 23:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FOYnePfOZroSwWiU9+9xYCdY+xwg+fq7VM+eaNOh5AA=;
 b=EkbQgNg/6r8r8BaexZgXkC81RTy0zDe8IXsCISR7f7hNrDBFGdvqQIi+gYVbfvMujl
 TMR+Ut2v8FgCSxTH9Y3aAF/944C306MsIxtJyjGUR02HzOcKqcnlemeaTiS4Oo3wIFdi
 2DBqkfNblI3yV/df6J19B2aB9fbX4ws6Ae1I+dzGcIuCKnDaRPZdL+/YA+jmeNWqUlR2
 Re1LSlzZQcflWDieY4U0B/cNjz+Hk+h4Gru+LJodr5Ai1d+I+Mdd+uBlrMkyuTQYdg4l
 o+eQm8QeI27mHBAnptZ+d14AZkA/U4YtjwGWdTLuzQcVmoXi+amDstV/35RRNZi4SqHM
 H+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FOYnePfOZroSwWiU9+9xYCdY+xwg+fq7VM+eaNOh5AA=;
 b=dqqMg8qNLIZDf2wEYA8+ve19aqaAZNtmx/cfjM+gFTZosaqCkVXKqdoiPEbYvdJGwy
 qUkHsJuodo98XslXWsHwYx07BRDMOwlv/Kjj4E2npkgCjswbrfX8yEsRZ8+VEfyhmBSc
 t5waQTroRSnwYmcrSvUQep91USMyuFxZxQmxRZzrZkLj5qSCONTYsiABWbyVXVj8mLcc
 gcK7BIGFyVJsr3+XBVx7PPXxqwSv/tnNMIfNFq70Oc/g8L8DB9mbpWXbtx6dEneha1vN
 W+FRUEq0wZZ7dVsUt8wuXJ7Uv4wFtQvSZSiRh2Tj4vbUB7AD0KaGwG9lVpivJJHEZc4t
 NVPw==
X-Gm-Message-State: ANhLgQ1LOc44vmGL1PmHAr1pAT4uDrZepNFummKRCNdj+Xs90hkIt07+
 /4fERDPTgpfQKpx/YOrkicvux3tgMLY=
X-Google-Smtp-Source: ADFU+vvfdx1ZoYGTP0G5g31PpOsLz1vvgIMorga05IgGZfBijxUUF8MI/ieEkjOtdgMAYvAU/VYibQ==
X-Received: by 2002:a17:90a:d3d5:: with SMTP id
 d21mr13825673pjw.27.1584169103556; 
 Fri, 13 Mar 2020 23:58:23 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 m26sm13134137pgc.77.2020.03.13.23.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 23:58:22 -0700 (PDT)
Subject: Re: [PATCH v5 18/60] target/riscv: vector integer divide instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-19-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ca87eef-19aa-eb01-c150-9ddbf5b02827@linaro.org>
Date: Fri, 13 Mar 2020 23:58:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-19-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Sat, 14 Mar 2020 06:58:33 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 33 +++++++++++
>  target/riscv/insn32.decode              |  8 +++
>  target/riscv/insn_trans/trans_rvv.inc.c | 10 ++++
>  target/riscv/vector_helper.c            | 74 +++++++++++++++++++++++++
>  4 files changed, 125 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


