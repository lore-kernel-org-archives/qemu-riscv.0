Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHybG-0003cr-36
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 19:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60425)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHybD-0003cY-3d
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 19:41:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHybB-00017M-TL
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 19:41:14 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:47101)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHybB-00016r-FP
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 19:41:13 -0400
Received: by mail-pg1-x543.google.com with SMTP id k191so5334742pgc.13
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 16:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qeG8tHPoyBQGtuBGURzuRjGYY2ia9ii7TOQ/sAHBbTM=;
 b=urKI1jAq+l83+vWomL9VN1UlPZAmIvg6bAWOFMDGwhsKXswBnjyIogeKX8VxgtRPww
 wuWAgh1uz/xY5ye/cFvykfecDh3iR1QiYyAoXVHYF1e8IWuUasBn7zVbabJe7OBbs91u
 2nN0WrYMYz2KFATZjYRVlBvH/8oIwMt+h4EhlK7Dg4WAb/6vxWQQoDdy3Fz8YiWU3SI/
 GR6N2b4k9z4Dn10IOOrzVc+nL1J982OOm70w0zgNQedYv7xuwTW5Pt2ZVxju/cLMMIdD
 MmlRBQUyexbezpjg6sv9S+k/x9ylK7ZvRBZiKlGSvIsw3IAIvlezEmbS2T2QYh460cQB
 Amaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qeG8tHPoyBQGtuBGURzuRjGYY2ia9ii7TOQ/sAHBbTM=;
 b=FRyoZETWHzK9L3Nh4oqsj2Vd96q3H5NVfLbUStWwvWjF1/G3gy/AUnlYmUTWgWIkVh
 /VZhywcxw3mOCeScgLMbWDNRwo/XOMcPiSiZzyoXmdlDfAi1dSl+rOc4v6gsG+krQJfn
 l2faUqHYt+kjircN9pjH5OZiom5uFI4BktqIrkjZdtynEVzzlzvPSPzpHWaVuOsnsyEv
 ujAwsFmkNsBPS8qdRTxBiVLrlaCc7KQYEQ00vlLSOxOGyPCJylg6BhaCy8YZnnNcZqqS
 33i0A7QZgVk7i+r9mQaTIvoaPqot07axlX5QpwnQi/yAfqhzeDaalFQIrnYpszUS+MyW
 Z5qA==
X-Gm-Message-State: ANhLgQ0mwF8ujOWp6KVCatwNI6xGyDMLMLjo5zZqSgbhGnergU8RF8/6
 9KMNWCY8opiaietFTHf9gSpl/mSl47g=
X-Google-Smtp-Source: ADFU+vuHbYpcAfh36gAuZ5ByiiHY7rwDzIVoSRpE4dmgiuzpGEl9Xo4PHOg9MFZSBnQvSoTClMi5Mw==
X-Received: by 2002:a63:a361:: with SMTP id v33mr1756798pgn.324.1585352472053; 
 Fri, 27 Mar 2020 16:41:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id h4sm4709852pgk.72.2020.03.27.16.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 16:41:10 -0700 (PDT)
Subject: Re: [PATCH v6 05/61] target/riscv: add an internals.h header
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-6-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <07377f49-ff91-a6ed-3021-a20bb77ecb7a@linaro.org>
Date: Fri, 27 Mar 2020 16:41:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-6-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-List-Received-Date: Fri, 27 Mar 2020 23:41:16 -0000

On 3/17/20 8:05 AM, LIU Zhiwei wrote:
> The internals.h keeps things that are not relevant to the actual architecture,
> only to the implementation, separate.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/internals.h | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 target/riscv/internals.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

