Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD2XK-0002sn-5b
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33192)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2XH-0002rw-Uj
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:52:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2XH-0003Be-0b
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:52:47 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:34699)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD2XG-00039q-RX
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:52:46 -0400
Received: by mail-pj1-x1042.google.com with SMTP id 39so4484555pjo.1
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1RrH7SDMq9KXt1P4EbvBElN6M4GMgD5LFTmQs1S8rGo=;
 b=mzymaQ5WbZAtr+pHWIzQz9BiRtC9quTdow97fRSebMBbtixkYRq8wpY5IzHJH6Ei2F
 DByxDfUjpCAg51IxkPoZq0VT8u9SQ+Hg+a16ZXUmIUJDu63XVsfK4c+7IAsw1MSvadyK
 awJma5yudAT/PHNJUnrmphbKEXK1gBUWUpOt4ZFvtJUqDEgi11FF3gcKGeQn/Z+buCmY
 YMl4HwLXW6PeR4qf5FWVRerj2IUIP0hWmm2MyWx9far/0hcW5xmBT09klPsohNwNLEb/
 n3yQFSB7PRnhAaC+TdE4E76IX9bV8Xbyn8v4gCR5f1dC8Eb1M/5vWJ282dpobSXthE3d
 G1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1RrH7SDMq9KXt1P4EbvBElN6M4GMgD5LFTmQs1S8rGo=;
 b=Toh3BjbdsT4rgyfMaXgopgj2GiWI/TwopUH/yFz/QD0GYo66/fWRFUazBFrSazSCPv
 XrwoDVNnrR97vrsPxo7d8x0+Njc6YWWVTjr80GX8VJwdzKlS2sD5sxKRPH6z3WekpmJ8
 c14cf6/pEi5G1C0tqSARTd8gZZ0ai+b0mWjGqRDgLS74r66aodbmrihe3/uM3llaIp7v
 YsaZ5DzbBaRSH6rXznx0NdnGSVfEYQBC8uJcdGmyWBHBOj7JDhb1eC9Dm+vn2bCL9Qw2
 ZHNctKAu8IUXhAFOyOKMMVOIgNPMSIrRGVelpyVoZi9tMW6adgZ/2T12e6dlTu4NBYqR
 WCDg==
X-Gm-Message-State: ANhLgQ1b4Qd4evy0G1ZOsnGgjEtrTOAmDGNP7NPAlzbD8o9jsiF0TGHy
 u0JjeMTqnyAqUUQTGyrnLjvatTXLS0E=
X-Google-Smtp-Source: ADFU+vuFZc0nCzUxRz0qPxEds3oPgBtAgLUp1kmRqldYih5cyASia8mklBHVqAg/RDFfiMDibqMLww==
X-Received: by 2002:a17:90b:3793:: with SMTP id
 mz19mr14569777pjb.194.1584175965642; 
 Sat, 14 Mar 2020 01:52:45 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 e3sm27632352pgm.15.2020.03.14.01.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:52:44 -0700 (PDT)
Subject: Re: [PATCH v5 36/60] target/riscv: vector floating-point min/max
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-37-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03092865-9bbb-a7d6-31dc-b9df24f4688c@linaro.org>
Date: Sat, 14 Mar 2020 01:52:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-37-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Sat, 14 Mar 2020 08:52:49 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +RVVCALL(OPFVV2, vfmax_vv_h, OP_UUU_H, H2, H2, H2, float16_max)
> +RVVCALL(OPFVV2, vfmax_vv_w, OP_UUU_W, H4, H4, H4, float32_max)
> +RVVCALL(OPFVV2, vfmax_vv_d, OP_UUU_D, H8, H8, H8, float64_max)
> +GEN_VEXT_VV_ENV(vfmax_vv_h, 2, 2, clearh)
> +GEN_VEXT_VV_ENV(vfmax_vv_w, 4, 4, clearl)
> +GEN_VEXT_VV_ENV(vfmax_vv_d, 8, 8, clearq)
> +RVVCALL(OPFVF2, vfmax_vf_h, OP_UUU_H, H2, H2, float16_max)
> +RVVCALL(OPFVF2, vfmax_vf_w, OP_UUU_W, H4, H4, float32_max)
> +RVVCALL(OPFVF2, vfmax_vf_d, OP_UUU_D, H8, H8, float64_max)

maxnum.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

