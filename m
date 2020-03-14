Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCvik-0005Mj-57
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 21:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvih-0005LS-SG
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:36:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCvig-0005kv-L3
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:36:07 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:35248)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCvig-0005kD-DU
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 21:36:06 -0400
Received: by mail-pl1-x644.google.com with SMTP id g6so5157587plt.2
 for <qemu-riscv@nongnu.org>; Fri, 13 Mar 2020 18:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IV7e6pR/kWjyWJzEvmBm9Y6YrhPG/uI9G+yxH6w/iPk=;
 b=cP+rrAR+Nc0zC7LRPpMs50YArwVkYAUVdMxVcgQToiPYSGHWR9uMikHd9pD0RdUK7U
 vlVP6hK8nN/gny0ssrlyTG5OqdybLHLgmGQQApiiBI5GGTUSMzjvwC20FjtZ73W7hL8a
 VM0b8DV7XBTfcBrvI0UcECvLtzaL1mkB5Xt2WqZXE4r6v8vMxDk+x4cDtzookT/cnebg
 zhcB4nAJYQsFua6Ldg8rMn+0fE2ZK7L0XvN8X60Bnx1iWzby8P6pnvJIkgz227JIyjm+
 UiEOB0zhTC4XJKTVdkJdGm327alLL3tmtB/TbD99OnJQwCBAgDKCpjKOYTKSAXbMOhj4
 9SYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IV7e6pR/kWjyWJzEvmBm9Y6YrhPG/uI9G+yxH6w/iPk=;
 b=plEREcGjp444XAUE9gcaLEDABrIi3BkqZyKIO/281vRz0s1lhYWjTIflhi3TkEqtY+
 DoY1xTs3DV1+gIN1vEEzo6eOy7LmkLbVR7X8xYJvCLFk7nAXLJC6VGMs8qxOzYlb0lbo
 MGui7cKpdIXZxUziJQbZHp39j4GoA04v4I38JFbMBjh4aOwxVJHgjUc1SSqtSnYcFZV7
 P/BcXnivJf33nnvDnBB0oCawDVb0TUFqC+0XoMk9cy/0460p2mDSEgWe1+9smPRPcboN
 XBLmlld56wfjRY+6MWoZmc3zn8WQST2Cv+3c4CSpsI+h11cXL0W8/YtnAvRiXd4iaDH6
 qoog==
X-Gm-Message-State: ANhLgQ0KV0a//AtI7iEhOAdOeq4E6APagOmjGdj8zbcK8neXxdsLWxEt
 vfvtJdq0Idkcmz1hwvrYet8Grjyhgho=
X-Google-Smtp-Source: ADFU+vuxXyFbiBcI//V2MTPUQjKpmKV7z9GV3ibkx/bVC4/AdF69Ce8r0rYfFjwA5sXnMTy6rZiPlg==
X-Received: by 2002:a17:90a:ead6:: with SMTP id
 ev22mr13271734pjb.66.1584149764406; 
 Fri, 13 Mar 2020 18:36:04 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 p9sm12909404pjo.28.2020.03.13.18.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 18:36:03 -0700 (PDT)
Subject: Re: [PATCH v5 05/60] target/riscv: add vector stride load and store
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-6-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a7dbdc9b-3b27-c399-1c56-cf8db7c4f734@linaro.org>
Date: Fri, 13 Mar 2020 18:36:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-6-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Sat, 14 Mar 2020 01:36:09 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Vector strided operations access the first memory element at the base address,
> and then access subsequent elements at address increments given by the byte
> offset contained in the x register specified by rs2.
> 
> Vector unit-stride operations access elements stored contiguously in memory
> starting from the base effective address. It can been seen as a special
> case of strided operations.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.h                      |   6 +
>  target/riscv/helper.h                   | 105 ++++++
>  target/riscv/insn32.decode              |  32 ++
>  target/riscv/insn_trans/trans_rvv.inc.c | 340 ++++++++++++++++++++
>  target/riscv/translate.c                |   7 +
>  target/riscv/vector_helper.c            | 406 ++++++++++++++++++++++++
>  6 files changed, 896 insertions(+)

With the changes for has_ext,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



