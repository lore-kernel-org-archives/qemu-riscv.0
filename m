Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7PrC-0002RS-M8
	for mharc-qemu-riscv@gnu.org; Thu, 27 Feb 2020 15:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58443)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7Pr9-0002RE-SU
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 15:34:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7Pr8-0005r9-N6
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 15:34:03 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38078)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7Pr8-0005qp-II
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 15:34:02 -0500
Received: by mail-pf1-x443.google.com with SMTP id x185so429641pfc.5
 for <qemu-riscv@nongnu.org>; Thu, 27 Feb 2020 12:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tONjEr0Ng/oBil5mm71kEehmGk+VL1dTAYgOngSId1A=;
 b=k1Bf/eggu6PcGe24Ve+hS5wghJhcrvfESqSb/Gp1uSQaRe1d90k3cBBeNeEVYVJRt0
 1go68fpG2K2ZzzeX7NBMR48YdEVHK3GWRUPVrlnF5FdppOLLHEgeCkuAftxuOILe5tXy
 cU3hvbLTsfTtRpf66LaNYJIJhEYDUVvXOqLezhYvNhNjlW2rq4cF+1M+zZV+pF8HHTwh
 MHurwpoeVkzC740qahZFk9R3pfVxP5ywkxdEpMImrllL9XPpjbozTzD4e1yZtt77nyfl
 w5cmadQq5c9hsBSJxfOaVnRxM9wAgT6lCtBaGu2wy+ASwJ8HYDK9ZMtrzFWQH1vYBhjx
 +Fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tONjEr0Ng/oBil5mm71kEehmGk+VL1dTAYgOngSId1A=;
 b=tEYodEhX43/jNOHi7CpzyB6lx1v5d8Tv5LeOFfKEVkt0nw2gVwE5iUSTdwcwnKa6+g
 2qRn+NkFuK8C3T1tWMHPeySxWJGMVxwlIVFIkEFFcfZdgTKeis67m6ZUAvFC0YzqWkZe
 JYSCvIzvuDDzSQP3tMWD5xEIo/LodQWoInyVGT8Kpfle1aMNNnE2jtsg2RzMzkr2zftd
 e4hAHuZPR1NvlIgUg/wxx3Pm0z//N/5l9Z6ZFli6kJd8pdVyzG/NaJ8IWUlFdwrhL1LI
 FqcbQ/jRcTYIOsyDewRhmKmUueTdw427LXK+m6MD0y0qLvhqeIA23T6NYGP6/zAjKraZ
 8FFA==
X-Gm-Message-State: APjAAAXB462kafNSgGetym6hLPeupGD6J0gi5uQeSWRII39Ym6VZhXG/
 e5aDjY2sAIUb3EL1wYVuG3KEk3+m5pY=
X-Google-Smtp-Source: APXvYqyggQU25Z75YGwMw+VfW7xK/GL/DrCzcxfRTQRd9jswRjS23eZjHJCwKyVkRsgrpMa0cM/MaA==
X-Received: by 2002:a62:6842:: with SMTP id d63mr761892pfc.113.1582835641238; 
 Thu, 27 Feb 2020 12:34:01 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 h29sm4054854pfk.57.2020.02.27.12.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 12:34:00 -0800 (PST)
Subject: Re: [PATCH v5 2/4] target/riscv: implementation-defined constant
 parameters
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200221094531.61894-1-zhiwei_liu@c-sky.com>
 <20200221094531.61894-3-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <76e0dffd-103a-c3cf-7f7f-25c7a54965f1@linaro.org>
Date: Thu, 27 Feb 2020 12:33:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221094531.61894-3-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Thu, 27 Feb 2020 20:34:04 -0000

On 2/21/20 1:45 AM, LIU Zhiwei wrote:
> vlen is the vector register length in bits.
> elen is the max element size in bits.
> vext_spec is the vector specification version, default value is v0.7.1.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.c | 7 +++++++
>  target/riscv/cpu.h | 5 +++++
>  2 files changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

