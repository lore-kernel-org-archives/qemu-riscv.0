Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1inW0n-0006DH-Jh
	for mharc-qemu-riscv@gnu.org; Fri, 03 Jan 2020 18:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1inW0l-0006Ce-EV
 for qemu-riscv@nongnu.org; Fri, 03 Jan 2020 18:05:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1inW0k-0002Mk-0Z
 for qemu-riscv@nongnu.org; Fri, 03 Jan 2020 18:05:43 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44095)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1inW0j-0002J5-PS
 for qemu-riscv@nongnu.org; Fri, 03 Jan 2020 18:05:41 -0500
Received: by mail-pg1-x544.google.com with SMTP id x7so24021676pgl.11
 for <qemu-riscv@nongnu.org>; Fri, 03 Jan 2020 15:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I3cfvt4gXU3UwGUGbZS5OIwd8hrozxLi+qSzb+8T/t8=;
 b=uIsic2SlR5QB/R81WGE6HV08dcAyA4ZdB+rvevEqK7TZZQUEprm9Sn9uKGcw84KvkO
 A8oifRqdhmJT6eKjcZdhX2m/yA6/B8mwpKohwroNEY7P60VRwtqykzwSIislfNh0KPL3
 pHsEZhGKTZQsJOOCvHb3UrG/AdeLhb4TctfarscK2uZlBlMjoXFo4l386/d85U2w/o07
 /vb4jFnGDILjRHfiVJyUT3JX6OWCZwwa8rQJKmxdaqd1VBN8slZv04zyY0S6B4gA+kLw
 CiqqPJCAFdyxCdgO96wbIccC6pc7NFZ9uIBbcW0ZcAV5HEbymWH4BM24ZhuBIqERkU1f
 7Rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I3cfvt4gXU3UwGUGbZS5OIwd8hrozxLi+qSzb+8T/t8=;
 b=KOWtIIm23LXSoiOkdqSk5sj08ziJ9hswHKfcGvBqq7aFybIXy3UGJFg4ownLmgiq5i
 uXlxA+2Y+kZ7XI8ftX/+UUAXzBelgb9A6v6L3fby0EQ+xvTlFh+nfpY9EyuBkHJ70Zk/
 i70NHdgPCttZ55lVdpk+XWu3sn9eyif3LCTPPp7bmydMLKJtcaJi0Lci0Hfxr89qBhyZ
 HX1X4naEy1N9oosfF9JhHDVfAgksrkLSDbuV9mPDB/QqtZqAnRDsjGNX/15I9ldW28sf
 NymN9TqzqYoaj0/3uZCT/DE8DP/YcEOHLEuy33VDbghe1PvJhPClQHJ4qlp8uKX0nrRN
 T1/Q==
X-Gm-Message-State: APjAAAVmXBogOvcEcivx6ARQsyR0FlrvtpPaZMdySE69luDEFfQeWKQ9
 biiyYxi3gC3YCp0pqx0Y0Hkrk9q07mzy1w==
X-Google-Smtp-Source: APXvYqzf8FkxTwe6nCDc0Xeo3ob8oC/ve2NZVkfCIVuxY2EXGmH1d7jDAAWotIglN98s+MYBR1kbmg==
X-Received: by 2002:a62:a515:: with SMTP id v21mr98123405pfm.128.1578092740523; 
 Fri, 03 Jan 2020 15:05:40 -0800 (PST)
Received: from [10.103.5.8] (59-100-211-22.bri.static-ipl.aapt.com.au.
 [59.100.211.22])
 by smtp.gmail.com with ESMTPSA id c26sm64615241pfj.101.2020.01.03.15.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 15:05:39 -0800 (PST)
Subject: Re: [PATCH v3 1/4] RISC-V: add vector extension field in CPURISCVState
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
 <20200103033347.20909-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8138b4b-51ef-15f7-c128-f78a46005afa@linaro.org>
Date: Sat, 4 Jan 2020 10:05:32 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200103033347.20909-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Fri, 03 Jan 2020 23:05:44 -0000

On 1/3/20 2:33 PM, LIU Zhiwei wrote:
> The 32 vector registers will be viewed as a continuous memory block.
> It avoids the convension between element index and (regno,offset).
> Thus elements can be directly accessed by offset from the first vector
> base address.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0adb307f32..af66674461 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -93,9 +93,23 @@ typedef struct CPURISCVState CPURISCVState;
>  
>  #include "pmp.h"
>  
> +#define RV_VLEN_MAX 4096
> +
>  struct CPURISCVState {
>      target_ulong gpr[32];
>      uint64_t fpr[32]; /* assume both F and D extensions */
> +
> +    /* vector coprocessor state.  */
> +    struct {
> +         uint64_t vreg[32 * RV_VLEN_MAX / 64];

Missing alignment.

> +         target_ulong vxrm;
> +         target_ulong vxsat;
> +         target_ulong vl;
> +         target_ulong vstart;
> +         target_ulong vtype;
> +    } vext;
> +
> +    bool         foflag;

Remove this.  As discussed before, you don't need it.  Faulting behaviour
should be handled with the proper interfaces.


r~

