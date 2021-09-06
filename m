Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNJqJ-0002iG-8X
	for mharc-qemu-riscv@gnu.org; Mon, 06 Sep 2021 14:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNJqH-0002fY-1v
 for qemu-riscv@nongnu.org; Mon, 06 Sep 2021 14:59:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNJqE-0005j2-Tb
 for qemu-riscv@nongnu.org; Mon, 06 Sep 2021 14:59:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d6so10445211wrc.11
 for <qemu-riscv@nongnu.org>; Mon, 06 Sep 2021 11:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oV5O628BPjsJTFWFeBY4KevzFoWDc/oro27KTbZmmrA=;
 b=DVDjyZfYdBlek6ZCh+GgkLQhWxraROUesoSSDQDTFwqY9rd3pits7/VVtLLzADyOuu
 LOmCZUnV3XRqFpFxYrAkGKMZUHADdvoZ3cQe76AWL7DQUlm1D3SaHCCm/+1rDLxlbq/M
 qW4sYaA7rPkX6+FaX5Tdk14BmmpaEk/O7+84M3rhyrcAQJt60zA2QcNipZI5mlRS7UGa
 zl6SM+S276MVZrYUKSrrWn5JmpkP1oioWEnYwL9AC0Z32R1H4IQM9urHA03fDXI26bPk
 lGonOQ74v+HpCVL4VVfCROxns5wBNkLyhXd1d21ObgAMGk9V8Omj3eBHvZb38z8OzAIN
 +fZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oV5O628BPjsJTFWFeBY4KevzFoWDc/oro27KTbZmmrA=;
 b=leqFxEJ3cefrGfZwVTu3xQAlSGL9gCUy7FKl+/A6MPaAVUO4wHEjta/LxyyEQv1P/2
 /TfIidcLBfvBtRNgfqScvFz7d52CWsZlzeKt+zmpNPZ0tZ5HnOPzowVaKsZ8upjKxYTn
 y3XSK639YXMLAiIIqAHzZK1+Agk3cGjlRs74nJdYLTQ9nKmarZXUdZnl232ri3H3otnN
 Q9Ps9r/gpqbKrXsbc+nk6qq1A9698Flk5R/dt3tJnBMWGz93AeWrW5TEc8sqnMPu3VK7
 TzHUJonY+2zxpzgPXpOw+C1OHG76VWjyPgTA42nCDCrBqH0w0RfOuPy7Eiua/M+erTzy
 QgHg==
X-Gm-Message-State: AOAM532YDmIkjC6iZESK5eVOTwdAMHHDfeVtBxBBHq3Nkbw7VYdNEG7Z
 c+sBVrXGucc36+K9rnt8+IJ+EA==
X-Google-Smtp-Source: ABdhPJwzlPPsTWW4oNBCZAdOi9Mm7OY85KvF9dGej6sOL6CXONrdIhHUYxfqqDXUbXpGODP1el7YPQ==
X-Received: by 2002:adf:d231:: with SMTP id k17mr14978439wrh.389.1630954776689; 
 Mon, 06 Sep 2021 11:59:36 -0700 (PDT)
Received: from [192.168.1.165] ([139.47.33.227])
 by smtp.gmail.com with ESMTPSA id o2sm9188052wrh.13.2021.09.06.11.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 11:59:36 -0700 (PDT)
Subject: Re: [RFC PATCH 0/2] riscv: Adding custom CSR related Kconfig options
To: Alistair Francis <alistair23@gmail.com>,
 Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Cc: guoren@linux.alibaba.com, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "Alan Quey-Liang Kao(((((((((()" <alankao@andestech.com>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Dylan Jhong <dylan@andestech.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 ycliang@andestech.com
References: <20210826151332.32753-1-ruinland@andestech.com>
 <CAKmqyKPY=Q61x7gf_0S1-B66VMpZCFx1r5ENJG0J5FNX6NLz0w@mail.gmail.com>
 <YTW6ADQMBcs5csXv@ruinland-x1c>
 <CAKmqyKPu9MK0KRycXzcnb=pH_OjB1mCKzw8uhb2vSZAwxraAfg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f9e011a-449a-b2bb-0207-2ac65538891c@linaro.org>
Date: Mon, 6 Sep 2021 20:59:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPu9MK0KRycXzcnb=pH_OjB1mCKzw8uhb2vSZAwxraAfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 06 Sep 2021 18:59:41 -0000

On 9/6/21 9:05 AM, Alistair Francis wrote:
> I honestly don't see a scenario where that happens. The maintenance
> overhead and confusion of changing the CPUs at build time is too high.

Yes indeed.  One qemu image should support all cpu variations at once.

> I also don't think we should need that for CSR accesses. Custom
> instructions are a whole different can of worms.

Custom instruction sets are manageable.

In general, we use separate decodetree instances, and select on them at a high level of 
translation.  We have examples of this in both target/arm/ and target/mips/ dealing with 
different ISAs.

Prod me when you get to that point.


r~

