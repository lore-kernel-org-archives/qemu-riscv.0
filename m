Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCzqJ-0004Kn-4i
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 02:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzqG-0004KS-PT
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:00:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzqF-0008Ez-Nm
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:00:12 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCzqF-0008BQ-Ij
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 02:00:11 -0400
Received: by mail-pg1-x541.google.com with SMTP id b22so279387pgb.6
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 23:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r3Ky8a5dy263MnktgHrrvhCn1dI0ZhJvJKHpKpk7T7Y=;
 b=ac15Xi2bAsPeCYg7SIr0VJ661jeKfwZzAstS9hlhc25fe5M7EtblL/v6Ca54H9t7vs
 BkMFkH7WPf11aEuON76T9UzmV0qm/JazVQLMoNASxbH1R6o38fj1F+DG3ArCvNaxtQn7
 eBNg2pGurW3gkmBz7fdKGMOlDgmNf1iI8yy6eH0R93KjvCVNYNjvvdKHaicgw7qjIzkq
 Y+7r9veLd9ZkDlGkdwn9YvHtrmeaog+0Gzg+qNRtY/QhEBIXbqmcNRGjR880kZFlUoEf
 YXEzjLg759VFOmUdAJFsThadiNHsUgP9xdRtb1NRZB3HRJUWU19QOfCT9qcPr8xSFwyx
 zM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r3Ky8a5dy263MnktgHrrvhCn1dI0ZhJvJKHpKpk7T7Y=;
 b=GKIahNetU07XsvbalVjzJlI8h9xYidSQT7zcLv6qcZqwTmA9rZO9t1CWnURvqu1RAU
 b3aQbbFapxQZawffCfU38QvmQrww2ncVIO/ThMsTw+vtTnhRDZP7QgjmwpnO56Y7ybR9
 m84W7FVtd7T8Ge0Sa3I5HWXGanL5ckrW2Qsmoe515ClqKg0vYo3+Jj7D8pQHq9Vxk/b3
 XRmSj9A0jhBI/dYGJNfRexq/Ug233SC6eitARdx2eKNMLJJGvAMLpx1xfvw/LiZkzI/h
 4nxAoZVAn9HD6wl4Ej2yW2MK6VGTpNIUNQHoiHMUSddkUhQ3F8tOTNe4GieAT5sGo+P2
 SKPQ==
X-Gm-Message-State: ANhLgQ1TITJumdHPzZbKvTMHFnLtEfgMlvTywBks2XPCOBkmO7amC4LP
 IPwQSRgXPSESuWJb7dfKDtagaN7IsCU=
X-Google-Smtp-Source: ADFU+vsk88VgSwBIq6mZnUBq15ywDaHLnQ2F9k/Tc5VqdOvf17xY3VG4dSzlCaWY5xXA7t+oaK+Ukg==
X-Received: by 2002:aa7:9906:: with SMTP id z6mr17986983pff.112.1584165610028; 
 Fri, 13 Mar 2020 23:00:10 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 ck11sm289233pjb.32.2020.03.13.23.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 23:00:09 -0700 (PDT)
Subject: Re: [PATCH v5 12/60] target/riscv: vector bitwise logical instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-13-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75bab538-ec0a-ff81-fe9e-a0e2d808dcc1@linaro.org>
Date: Fri, 13 Mar 2020 23:00:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-13-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Sat, 14 Mar 2020 06:00:13 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 25 ++++++++++++
>  target/riscv/insn32.decode              |  9 +++++
>  target/riscv/insn_trans/trans_rvv.inc.c | 11 ++++++
>  target/riscv/vector_helper.c            | 51 +++++++++++++++++++++++++
>  4 files changed, 96 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


