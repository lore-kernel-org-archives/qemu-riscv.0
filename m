Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1FhB-0001Fr-Ig
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 17:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1Fh7-0001FL-Ia
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 17:02:29 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1Fh5-0000YS-16
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 17:02:29 -0400
Received: by mail-pl1-x62e.google.com with SMTP id p1so15301784pls.4
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 14:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5Ycd4hMHAF13+V2uRqeO1a9ARPRIJzDKulk0mG2Bz9I=;
 b=WYorpeGvBYz0DJ5vrR425i9gV3kamma1ds5E63bDoXXctUdtEGiqD247mAzvF3rqB3
 Uid5SppJU0aLSjmhb/F9P1pluv+7vJXmlSTXIUNnU0oHTLrOcpO/BDBKVZMqMjJqSF+9
 37eVh4pcvUTQEQco5AsntgcNSjGXW6DyODp7PnVrQv980WdDTMmaaL4HS8wN8UhNKE8m
 Fil3WHjmtaUpSmkxlT29EU064rWX7H5bg2G/u6xWgALBZBQdY+Oi1fW2R3eOmPtiCA/0
 SkYUAxN+SbNnjyLlUUy1cAekTuV64OkrnvflJIQY3xcHkWQfRVrefFfvhAMzsXD+Gwf/
 4bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Ycd4hMHAF13+V2uRqeO1a9ARPRIJzDKulk0mG2Bz9I=;
 b=SqEnKELIw6dunsaXZKK/AsN5Ngh0hR5Swwa5KQIbIb4J/xSRRD4hA2VVkTX9V1NOFh
 so2ND1agG/WZPbdAF9RldRYyAQFZn7gjfqVlJpmEttr5PD79hknvSkjNN9XRv5n5xy74
 ePoU4JGmo589M/Xcc7pgXrXwNVEAytKzp2KeIDWo7ca34aTXNW73D21pMk8E4z07nQgN
 RXUxOSsUeUAJjNRRa+MWVRyBNN5zo8k20q6cl8px4cBpHkHRj0m9vjVsnpqm0qK02SbK
 XKvfKiupHD/V0q8yHwzAlW9G/RYDAK/rtUn1ZUIxAaCnxTgL7TXWp2BbUpWoA5855BCl
 fPMQ==
X-Gm-Message-State: AOAM531HSUEa+jR/TbUeNN9R+SLHunukLkbOwCyotA+j+64UeVgktPqp
 nbzOg2Oq7rsbzP/YhFFR/sRTvw==
X-Google-Smtp-Source: ABdhPJz7/+JKc3TB2Q/qQb1CXQhleEooIXgWa7udF82Kp4OvUFA5qgGNW3HOjVhbL1G1TaqZY/Pg/w==
X-Received: by 2002:a17:90a:8d0b:: with SMTP id
 c11mr970853pjo.196.1596142945352; 
 Thu, 30 Jul 2020 14:02:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id s68sm6584196pfb.103.2020.07.30.14.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 14:02:24 -0700 (PDT)
Subject: Re: [RFC v2 47/76] target/riscv: rvv-0.9: narrowing integer right
 shift instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-48-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <556f1864-b96e-8137-a423-b25aa9a6fa02@linaro.org>
Date: Thu, 30 Jul 2020 14:02:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-48-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 30 Jul 2020 21:02:29 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   | 24 ++++++++++----------
>  target/riscv/insn32.decode              | 12 +++++-----
>  target/riscv/insn_trans/trans_rvv.inc.c | 30 ++++++++++++-------------
>  target/riscv/vector_helper.c            | 24 ++++++++++----------
>  4 files changed, 45 insertions(+), 45 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

