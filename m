Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jDGDz-0006vh-13
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 19:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDGDw-0006vT-Bn
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:29:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDGDv-0005bp-1c
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:29:44 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39823)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDGDu-0005ZS-OT
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 19:29:42 -0400
Received: by mail-pg1-x544.google.com with SMTP id b22so1282299pgb.6
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 16:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1ue1VaLXiYjFKi7SBMXHCsLK7kkEUvQ5QfrV2zIPD+A=;
 b=e0gJKQKQu5fYXD5hPiEq8kvBwfY1IpjsHw8aDZcSOXa+6KRkfbgAa/sxS+maCc8Dh7
 gInvIvxpeSSNlBqavPOI/7E1ZrHaPPMiK4EkLpxW6lvUa7G9uAR4jmGuE5D9l+aGZZZC
 /jTuDBlXPr+kgWXqFD2lqZyssmbVRjp2LS91iq7JkArQQHVJ3LtKk2x7S9Xc2TIDeozk
 ElPG8+TJoATYNX2xKJbPXslsI+pC/78BVYGyn9V51mWOZS1/mgUnUpUe6WTLMq0TgKEb
 KN35MbL7/AU4rvTfEfQBQf1lKYqLDopCgdx7qFhSgevdeoJqCk16lZXhjD7V9rEmfYKC
 Nb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1ue1VaLXiYjFKi7SBMXHCsLK7kkEUvQ5QfrV2zIPD+A=;
 b=VKe8qi6J2HNvh6Se+Ab5XYv6sNzViKG8Bj8H9iWY9YiSrxDu72YueUYNgJWQd/rWr5
 G86LBfX/k+F5iKkPYPXquKUXjaGE+pSgzf6op2Yg6YxP98F34e0IR9toWYMcuAiCobk/
 xWoRsuisPh2m+0rmptkvZOPDdAzIq13UeDbFsriS/RLE95LOAzmgo7uXM2sNOEjYtcZi
 go7DIbPcKivBRWa4GVDBvSunGG2jWrdPOg1I3bz5gNcl7QA2vRYSeh6WUQ768sCEe4pT
 6qwYF6i4uLcZKGSZflhhmtwlQ59l+qb/idhDIDJX/9fqJTm/VjT0J2+kDDhq79X+Nd7Z
 fJFw==
X-Gm-Message-State: ANhLgQ2qHPYcKMq2W5OYyTWir/xdyBJGVh3W7LzmezFgLdXiWNyFTC4k
 nhw2EZEoO1hy9KFb08eC7HFannfC0OY=
X-Google-Smtp-Source: ADFU+vsQynG+a5EPaQn57cdgr6M2rr1E3x31QjkHdA+NSxl1tiM+O+cgA99F5ufm/V1QRHPKUu5QbQ==
X-Received: by 2002:a62:fc07:: with SMTP id e7mr19527361pfh.299.1584228581303; 
 Sat, 14 Mar 2020 16:29:41 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z16sm2679322pfr.138.2020.03.14.16.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 16:29:40 -0700 (PDT)
Subject: Re: [PATCH v5 44/60] target/riscv: vector single-width integer
 reduction instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-45-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84c1bedd-faa1-5d91-4a7e-39b8da511bb6@linaro.org>
Date: Sat, 14 Mar 2020 16:29:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-45-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Sat, 14 Mar 2020 23:29:45 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   | 33 +++++++++++
>  target/riscv/insn32.decode              |  8 +++
>  target/riscv/insn_trans/trans_rvv.inc.c | 17 ++++++
>  target/riscv/vector_helper.c            | 76 +++++++++++++++++++++++++
>  4 files changed, 134 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

