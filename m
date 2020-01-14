Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irBsP-0005Xh-4o
	for mharc-qemu-riscv@gnu.org; Mon, 13 Jan 2020 21:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1irBsN-0005XU-2M
 for qemu-riscv@nongnu.org; Mon, 13 Jan 2020 21:24:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1irBsL-0006fU-Uw
 for qemu-riscv@nongnu.org; Mon, 13 Jan 2020 21:24:15 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35334)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1irBsL-0006ew-Nl
 for qemu-riscv@nongnu.org; Mon, 13 Jan 2020 21:24:13 -0500
Received: by mail-pl1-x642.google.com with SMTP id g6so4606671plt.2
 for <qemu-riscv@nongnu.org>; Mon, 13 Jan 2020 18:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z31S/nb6htj+5TUlFmOwqu5Soel9KqYiiMbI+lCx7bM=;
 b=GS+Y0yXG43sCPaIoXiekmUyMtzXjqqESp6kUvIllIqr+RvYNtDB/8c+ubdU4GPYK7J
 MvQL/xEzjRX/S1q/xldpK7x6sQMfd8E9O6MBrpUg+Ofl823ISEGu3jK2c17+VveQIDde
 bRtBM8G+ed/IdHSs0bpVGREYyJ5AGN4XFAT8msLnGzoqN3/Ay50s7RniZwUpAMtxgWjN
 WZdDn2HsDLKdvvxSkJzAcrNahM8rHL8DLkr8fvr9Tl2Nm1+m0vd9VVSDUD/MBwuSik8w
 lOrS65ETMQmTilc+aLITre69SSnsGTF7TLgQKKO2aogi1o+jY6pugT7bCZG62Db6P7du
 GUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z31S/nb6htj+5TUlFmOwqu5Soel9KqYiiMbI+lCx7bM=;
 b=leUVowplQT3LBgyr8Xq5O+i8ff8c+ESG5ZAEpSPmH7Mbh7JepH3MiN5lh7WMTWaxTa
 9GbZPv86vpS7eAxEPMC0GzAM089sB+NThj6//+dCfJJiX2ZhfYA4Uuzq2S0DCiIzv0pT
 i6dRx0YR6XOrbsK9S5UBK7AGunC6lIInm+wtoyJWzzOjFGaX7Mvey3cShHR6sXzy/TeG
 wCuJKKhJvC4sQvEW0AR279E1Lta88QfeVE6LD8GV4dyxjYJjBcR6HW9UWcWI3F9q2AYG
 ev0uQ6elETGEfCkk4eJJH4GLRhqROzkS1aL13afzglMI02yhDvws4CYqMsdTLtYEYTPY
 4zxg==
X-Gm-Message-State: APjAAAXrFR4l96+TEjLm3dUu06jtB9dZAMyxng7263LSkF4rbO2cKHR5
 yRU/daOXlyop5tFctrUEWkqu3g==
X-Google-Smtp-Source: APXvYqzlkjpG5hngRWPehXwbVxwLJCl0lV7lPzMe09BUZz2hGts2sDOu9/cpDo2hdsNGZSD4fwCmcg==
X-Received: by 2002:a17:90a:17e3:: with SMTP id
 q90mr25479314pja.139.1578968652767; 
 Mon, 13 Jan 2020 18:24:12 -0800 (PST)
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id z26sm14648245pgu.80.2020.01.13.18.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 18:24:12 -0800 (PST)
Subject: Re: [PATCH 3/3] remove redundant check for fpu csr read and write
 interface
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@dabbelt.com, chihmin.chao@sifive.com, jimw@sifive.com,
 bmeng.cn@gmail.com
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
References: <20200110081220.891-1-zhiwei_liu@c-sky.com>
 <20200110081220.891-3-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fff313b8-766e-f7e9-4044-837261d38def@linaro.org>
Date: Mon, 13 Jan 2020 16:24:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110081220.891-3-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Tue, 14 Jan 2020 02:24:16 -0000

On 1/9/20 10:12 PM, LIU Zhiwei wrote:
> The read or write interface must be called after the predicate fs return 0.
> And the predicate will check (!env->debugger && !riscv_cpu_fp_enabled(env)),
> S0 no need to check again.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/csr.c | 24 ------------------------
>  1 file changed, 24 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

