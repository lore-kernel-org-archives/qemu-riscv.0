Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD2VU-0000c9-24
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60933)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2VR-0000Zg-Rw
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:50:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2VR-000828-0Q
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:50:53 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:34229)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD2VQ-0007zZ-Ro
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:50:52 -0400
Received: by mail-pl1-x642.google.com with SMTP id a23so5469700plm.1
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/UWXHZi4DXFBfffCfyPVocmAFNI4snXYbPo4qlWnlaE=;
 b=byDnkRiEh1OEfbLEeEOTVYhXxZ9lchh/blL8OXYhlzcX6eODcFELVoRWMkK3eOfkAs
 g+nOzoCqmy5HsELBfBZFkqjYPpmiJan3GICL07c8eVwM2a9nrv1oqs/C8nxyOgwcSVCz
 7IVNPKn53D8hPDDhI6EBz7jGzy64WrU18CJAaldt2LtZ6f1/3n5OTr9bsjBdB3HGnkqV
 MUbv2HtgFNh/mH70mO720eaSw6wTAkZr3x9qfOFLaraIZKcTiYTzprSGtm1KN3I2h81M
 2TOCSxnaNltCxBUahys9E5MSDXzt6Nu7B23ezUamiwHCR1ffMDyDfVR0MwgYokSG/CDT
 XmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/UWXHZi4DXFBfffCfyPVocmAFNI4snXYbPo4qlWnlaE=;
 b=ZxWLnbOPJrZpr8erDPkgMPgNC38zBuhxRCvCqijxJy7alKdsX0xFuIS3N+u83SWALQ
 e7vx21dZhONtyn+IuKxAZnKh8/p8mG3bhez8igIjzGPJBUha0Sydzz+Xgg1PACljyskS
 OVhP2HuB1G7KFlWZG+LKmSX4Oqy59Ky4zF84vOrXUI9AflIUQjDC7othPjvLG9pLR8rP
 f0MGD9U8ZgggR69PMoepaXbUPjqKOgRlVP8OLfijukY7A8R8v1zaRNWpcdO8M6vjPd3s
 wBOwOJ3f77Zj/NBsUJwzhiDFtaKDI29G1EkD7S4U4LObhDa0jn4xPAcJhhq4DKyA55Uv
 VSEA==
X-Gm-Message-State: ANhLgQ3rxNcUgNx6e5ldBAL2zQZZE//1D8ooxzOclF5w8hOn5dHpQyNf
 fkpUefxn5Kagop6I4vphCO7UydBRMX4=
X-Google-Smtp-Source: ADFU+vvXzdQK3jVEpzCnHOr6uqNGD7TzVl5uCPxpQ8gBeU/Lul7oxqZRSDrPqEv0LCYTwuxfUe7pNw==
X-Received: by 2002:a17:902:7586:: with SMTP id
 j6mr2635820pll.257.1584175851518; 
 Sat, 14 Mar 2020 01:50:51 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 h24sm19381216pfn.49.2020.03.14.01.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:50:50 -0700 (PDT)
Subject: Re: [PATCH v5 34/60] target/riscv: vector widening floating-point
 fused multiply-add instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-35-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a7ff25eb-b7ca-ce1a-5aad-1d2035f1fbb3@linaro.org>
Date: Sat, 14 Mar 2020 01:50:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-35-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Sat, 14 Mar 2020 08:50:54 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 17 +++++
>  target/riscv/insn32.decode              |  8 +++
>  target/riscv/insn_trans/trans_rvv.inc.c | 10 +++
>  target/riscv/vector_helper.c            | 84 +++++++++++++++++++++++++
>  4 files changed, 119 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

