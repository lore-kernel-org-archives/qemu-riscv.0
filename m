Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCvKx-00005H-6Q
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 21:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvKv-000056-70
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:11:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvKt-0006nj-RX
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:11:32 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39795)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCvKt-0006lR-Jr
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:11:31 -0400
Received: by mail-pf1-x443.google.com with SMTP id w65so6320426pfb.6
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 18:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V3+UwTRRFEzlzOlu/JhuAuuDfrVepuA+1dd2Y56MS/s=;
 b=RSUh99jDcl1uPlp3aVTGBVrfe/HDdzwC6tWdvgOTTK+DC3imNbtcaq+Or6DcdGWKSx
 6quZLLx6axi3ulHzh5/WxL0wTDMVc7CuthVtx1+82TFMB9gFXoVFz1lfneT95VghzACJ
 GSfspZhGnNbYEiGg01tcgZMGCYP7rSxO0Q5HTJpcaOW+XTlq1h/wPy7Y7RGhd029Vn8a
 pNYuQs2iFlPCpvVGHYDYLw4qpxnIVIcbDmkyHerJlVbYh289uEytdfZJlw/CCd36Tqh0
 WB6VrRtUXcCmNcaQqDHeH4+pdJHSgK/KVoR6f55WfsW4t0aekGKZNWjr60/DyUSM+srR
 89TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V3+UwTRRFEzlzOlu/JhuAuuDfrVepuA+1dd2Y56MS/s=;
 b=prrpYDZ+0D8Tl8vH+U3FHtcsakm+9fi2QQTuS5s0UyQ2eY5EXmtYMsmOS+oB1Mdxo5
 lXX2zHRu/RGGTaDYywC0bin7Ms+fQQuWzz/ESBBlDhcHdr1Jmk/p9jzhMbs1uA7n7Rjn
 fzc9NhMOmYlvL810+vCbWk9fibWjjEIg6dki3nZR/8zGI3AZg+pWapNPQ5CshiO75b6K
 imTzHyqg+g4aeTgWdl7NcP4DerHq23TVlthBQLraX14aFzNBfRQABaCQlUztFuete+zb
 fNs3dPCStS/3sk6gGtJ1eV1h9JLynXe6DBR7u0E6OQzBQ3bTFI9S6FutObu8PQ1pWCgG
 8MRg==
X-Gm-Message-State: ANhLgQ3jmLeqdN997YDD8uCUcKmLJ/9qhHUeQyy0DVXTGRPbSkP3HNwy
 Og5XbBB8H7eFYSth21MYGY+ipIkuTJc=
X-Google-Smtp-Source: ADFU+vsCMynMtqW88pNTdwBLef+1fHHAhZ6KO0jyDnD9V43mvfFlNhl7yn3VE0SnbPLcQDwCTMiNEQ==
X-Received: by 2002:aa7:8618:: with SMTP id p24mr17060892pfn.3.1584148289691; 
 Fri, 13 Mar 2020 18:11:29 -0700 (PDT)
Received: from [192.168.1.11] ([97.126.123.70])
 by smtp.gmail.com with ESMTPSA id v123sm32198551pfb.85.2020.03.13.18.11.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 18:11:28 -0700 (PDT)
Subject: Re: [PATCH v5 03/60] target/riscv: support vector extension csr
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97ba9d00-324c-cca4-4e0c-459a83550132@linaro.org>
Date: Fri, 13 Mar 2020 18:11:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
X-List-Received-Date: Sat, 14 Mar 2020 01:11:34 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> The v0.7.1 specification does not define vector status within mstatus.
> A future revision will define the privileged portion of the vector status.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu_bits.h | 15 +++++++++
>  target/riscv/csr.c      | 75 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 89 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

