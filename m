Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHyeq-0004nC-Hc
	for mharc-qemu-riscv@gnu.org; Fri, 27 Mar 2020 19:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60764)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHyeo-0004mu-3J
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 19:44:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHyen-0004Oc-0T
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 19:44:57 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:34965)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHyem-0004Mb-Qk
 for qemu-riscv@nongnu.org; Fri, 27 Mar 2020 19:44:56 -0400
Received: by mail-pj1-x1044.google.com with SMTP id g9so4414068pjp.0
 for <qemu-riscv@nongnu.org>; Fri, 27 Mar 2020 16:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2WTAWF4le0G+TbYuWabOhqh7r925WzsQ91b5JU0P/2o=;
 b=lrbyiQTGN+d9vQrZbGp5VIsgDfXb5eLMKy9uIJ8xxqwMWO/E5ZhPBgDRH1JFXO70n/
 5l6rSiM2rwluVFn4g2Q0xvlp0SwOEuJWB/N6HEkcUgd7zODXPHpDuK8nM9v2HOEadI+k
 dQRZkrct13q5KvNbHocxF9EoCRFE0lRbiWdfauUZYsYaRz/1bddEXOL1esV4qu8JXl44
 XwIZK2M7vAd0RFyfaS9HMrBVMRiRT3ZipZyUJGEeFvMqVZ38ZhhqkxxbNRcB4GexMKCl
 +lzRUIk6okgf1wcjIM32KkILq+kIYEOE5U8TU0V/HtF1rZjamKk+KoOLpaw2cFimP62b
 Jk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2WTAWF4le0G+TbYuWabOhqh7r925WzsQ91b5JU0P/2o=;
 b=CWKWO3ymzhPSjyWM0QRK2WiaUAoA5zbXsXprXoRHb1pnlW4+JEnplknVnhDBdORwqv
 x3KoOKYOeLXaIKa7jh+wMI45aqr4AoCiaf+yepGltDGaC2XfmUx0MsQaB0y9SpRFkGH0
 U21Fu2UK8V/s/Eajry0fXYBmSKWARcWtDOoqXvm3bdC0ULmEe+ug10+h784O2ElLaTN3
 iTPWrEulUgr6kLkGj8gLKl6iYmyf2UpEmSFDUuixygIJRHjaE/rCOluQwPfCTonwanYR
 MU5SRPasFO9IBt/Zv+XCKBxhiQOUYugcKtm94CFbq9SxsnPwuj/3KWCzoz/0+X7w9zuB
 OhnQ==
X-Gm-Message-State: ANhLgQ3Yj7PDpaIIinzKKKaxW2n4SzBrBvVLZb2YTNO+qVHnZU4SS3k/
 0gXhdore3QjkV/7GuULlmUGIQtKxEsM=
X-Google-Smtp-Source: ADFU+vvBbc56HFS3qNuqUo9no+E0MlBrDzAgEkP7j2DktYxHst36NGngdmqu52gWDNikTo25wdWBWQ==
X-Received: by 2002:a17:902:788b:: with SMTP id
 q11mr1489722pll.20.1585352694866; 
 Fri, 27 Mar 2020 16:44:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id j4sm4988483pfg.133.2020.03.27.16.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 16:44:54 -0700 (PDT)
Subject: Re: [PATCH v6 09/61] target/riscv: add vector amo operations
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-10-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5f6b9948-833c-fea8-caa8-045a696b91b1@linaro.org>
Date: Fri, 27 Mar 2020 16:44:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317150653.9008-10-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
X-List-Received-Date: Fri, 27 Mar 2020 23:44:59 -0000

On 3/17/20 8:06 AM, LIU Zhiwei wrote:
> Vector AMOs operate as if aq and rl bits were zero on each element
> with regard to ordering relative to other instructions in the same hart.
> Vector AMOs provide no ordering guarantee between element operations
> in the same vector AMO instruction
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  29 +++++
>  target/riscv/insn32-64.decode           |  11 ++
>  target/riscv/insn32.decode              |  13 +++
>  target/riscv/insn_trans/trans_rvv.inc.c | 134 ++++++++++++++++++++++
>  target/riscv/internals.h                |   1 +
>  target/riscv/vector_helper.c            | 143 ++++++++++++++++++++++++
>  6 files changed, 331 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


