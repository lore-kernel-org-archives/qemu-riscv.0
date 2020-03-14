Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCzPk-0000Hf-F7
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 01:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzPi-0000HI-Pa
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 01:32:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCzPh-0003Lc-Il
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 01:32:46 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40787)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCzPh-0003JO-Dr
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 01:32:45 -0400
Received: by mail-pg1-x543.google.com with SMTP id t24so6246491pgj.7
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 22:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W7riT3PAPCj4pGbZE9tcdq+XHnkSeh42mDhaZviyPs0=;
 b=oeaaXjsizGMiAT8DDQ0rwz9IWqXiXI8Dj4xjc7XLDPQlCFLHYN8wvX4sAmbVs+10EU
 ihahasP6Mf7lERNh/MEi+zuZs9obeCmvuOGjHHL3c2v/ry25SNjfPVwyYrQDHQimoxZf
 iCLjetLU1HkspBDeCnB+Ns0Dd0GoAY8nPu4uVNN5JbhNqli1ZuybysxBv0DoIWcgkAi1
 KaInZAn33iHLSmD7duEbjWbCeNeNbsyTkpfOFHyLsRmz0WaCeutIq2o3MFRZRhwvSInC
 LIWHUB4DD6qM1GWrUSTCZc4HTFHPjtfn2CXVkviDmq+mVjmtquSjrATTu8p+r8MgIxrY
 /SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W7riT3PAPCj4pGbZE9tcdq+XHnkSeh42mDhaZviyPs0=;
 b=U7EMT7qKwzB3Q1jIJ33375fSMvKU2PDQTwTGk0h5AQNQGkiTiojVlK/W/wFxX6gs/X
 BvMATNrXBS83YF6JcKAeIE3popil4K/wNiDe4WeqGCKcw4vKse/l40qz5Llgxdbrdq+9
 0dYtmHpkBEQMffZgna+UMrAnmrAo1+3z5VNBqrqXSg3M63FxnjrzVf3rpj+iA5pFbKwj
 ZzxJk2JfbvMEK8bu9Yqa6mRehTcZrapuTDjZOUZasRzQ8VutzgQ9w6Nzrueo4RxVqTvy
 2O5b0EkoMDoUag2AKRhR1Kuwe/RfplnIWUuJ/oNQ1dFkmJVTin5AcmjKxgwB1wMfI/kX
 x1gg==
X-Gm-Message-State: ANhLgQ10tlv2AZ6qk7/OIcJLNW8GS8AteiDN8xQf0j7Kw47+lAb9dlMP
 bIVvr4QQGu6yYtGz/KHvv2LLEzXhFaU=
X-Google-Smtp-Source: ADFU+vtKXIiMDjwnwK0Pewg+Un9fOHhEwucRjvChXof1RmFtIPXiCAn8AQ9V7ZzVijwRHGKZ8Sy7ZA==
X-Received: by 2002:a63:a361:: with SMTP id v33mr16172059pgn.324.1584163964087; 
 Fri, 13 Mar 2020 22:32:44 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 nl3sm14700519pjb.12.2020.03.13.22.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 22:32:43 -0700 (PDT)
Subject: Re: [PATCH v5 10/60] target/riscv: vector widening integer add and
 subtract
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-11-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a441beff-45d1-21fe-2efb-9614e4d64387@linaro.org>
Date: Fri, 13 Mar 2020 22:32:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-11-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Sat, 14 Mar 2020 05:32:47 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  49 ++++++++
>  target/riscv/insn32.decode              |  16 +++
>  target/riscv/insn_trans/trans_rvv.inc.c | 154 ++++++++++++++++++++++++
>  target/riscv/vector_helper.c            | 112 +++++++++++++++++
>  4 files changed, 331 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


