Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD2Nv-0004yU-TN
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 04:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2Nt-0004xT-0N
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:43:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2Ns-0000CB-2T
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:43:04 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD2Nr-00009N-Ti
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 04:43:04 -0400
Received: by mail-pl1-x642.google.com with SMTP id f16so5458505plj.4
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 01:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zg2niRARe9to89GeVFUpp4dqwtoOwqCM/pC87M+AflQ=;
 b=sX1Vk/XgOA9hQhJlEYVMwAAKiCwK7aEoWsGYR4jm/JvdFpa2cE1lRq+TCdmT8jLNHK
 XWSqtzvTmQVIbGa6zE/vz6va5d+wJ91ncbGX6pnSsr2LFgnL5HhvarBtBkGB906vgzNH
 W6LwsFLOh43Q/B+1DOs7uw6MDiN+1+GZSBSnu9TlUgKVbT8+DKkAhzQ4BK4NU7rnnbgz
 HuCfo/V6IAxDvKf4BiPQxD9DBBnn7o5aJcyrWzfQV5nLuVKWw27yn+i+GdXrhnVEzm4I
 Y1JKVRB8FTqVdqWhKxZqe39wlmnI3VRNh6sKHszOHhSSU59WhLPK6vroeFNUvbDPLCEC
 Dh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zg2niRARe9to89GeVFUpp4dqwtoOwqCM/pC87M+AflQ=;
 b=EH0XAp7ylPQ4pXlpqpqK7qM1G+L9KNS++U/Fiy1Q+8/S735DmQCoayMi4cR6VCb0nX
 IkZH+tSpPs7yz6V3dIYBA1BBN9pQ8Ie35mxJxm2Oa/FBr4dCfvVEqSnfkskfg5FF3q6g
 8cGmbAzvBTZ6AEMQ/MrOoxmq4SOVkx5nXLtl/e798Dp5FXo52sTMwLqGtlQVR4406j+F
 5FANVq0Joc2t32ujw5L96fKiHMyRfnQj2QaaA5xg0xp6WeHCTQ7RqR3/LTiSY49k+QzY
 s9GV1r0wZBZ8nOLS6QbiylSRiRO4BHNLfmZnSs9UaVzm7798JVlQPsy/lEgMTMWzta+x
 4tyg==
X-Gm-Message-State: ANhLgQ16XGCSkJWrNaxQKnRYtYqu48HwK0Gq5vKor7KvbNAqPI2dHKxo
 TU0De5/ypKhajCQcd76BGm0LR3YAlfA=
X-Google-Smtp-Source: ADFU+vuxic+0A1RgDtkjA9HUIfnixL0Wtwk9OQppjyd0Wvcnt9qmh3LOt9SHJvWxEWk9+ytxAiNJ4w==
X-Received: by 2002:a17:902:9a45:: with SMTP id
 x5mr16154300plv.296.1584175382756; 
 Sat, 14 Mar 2020 01:43:02 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 l26sm28470589pff.136.2020.03.14.01.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 01:43:02 -0700 (PDT)
Subject: Re: [PATCH v5 30/60] target/riscv: vector widening floating-point
 add/subtract instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-31-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f3ba3725-6afa-4c23-2503-53ef7375d3ac@linaro.org>
Date: Sat, 14 Mar 2020 01:43:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-31-zhiwei_liu@c-sky.com>
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
X-List-Received-Date: Sat, 14 Mar 2020 08:43:06 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  17 +++
>  target/riscv/insn32.decode              |   8 ++
>  target/riscv/insn_trans/trans_rvv.inc.c | 131 ++++++++++++++++++++++++
>  target/riscv/vector_helper.c            |  77 ++++++++++++++
>  4 files changed, 233 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

