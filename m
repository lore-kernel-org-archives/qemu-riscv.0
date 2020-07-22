Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyI43-0005NK-2y
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 12:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyI42-0005NA-J1
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:57:54 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jyI41-0002bu-1T
 for qemu-riscv@nongnu.org; Wed, 22 Jul 2020 12:57:54 -0400
Received: by mail-pj1-x1031.google.com with SMTP id k5so1706461pjg.3
 for <qemu-riscv@nongnu.org>; Wed, 22 Jul 2020 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+xMRlomMMreYNH9g+CBtP1EcPZQpFodNZxsWowSy44s=;
 b=nIC1M0p1dQ2dAagTelRmIh19kvrPtDAK0C1eUpCqyDVJ7YHxJKZmAiu6wqo6x/bTrY
 ZbyXeO4gRDxQrlda0yYmEaJGW/97Xz/Wy3AkonA6k+yJgbfeAV42P6m85v8aoWYIJ/tR
 HllvNYwAI6MqDGZEvLcnMNCONNjqbsXzs9kveXcYLI1MDj0xi8e9GEI5qTUk9QC0FXXD
 WzlvCOfSdctzuVr4F8JoA8TpmAbrjMQ8XDXRN6cTwa+F33PWAfFCtt1JfLzJe6WNXIP/
 jsPhtFdO6Qcc23PVAXI+OCyFQFpG+wBYk2/VcLOZavc9FmMbVyrysfry1pgUF1Tt/Zxi
 FcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+xMRlomMMreYNH9g+CBtP1EcPZQpFodNZxsWowSy44s=;
 b=mF3ef33DlFJy99oDm94o5R97wTecpgDQ6i2O4Dh43q7Hr/Y7labf8uchU1S4lj//Wv
 n+kUpIJXskB6gIinYcPAyUCdn1dav+UZWLjqnJwwxgtq4+pYLVZkg7poYdXx9LpOx/ev
 vbwI4KfMmURqP7itGzbJ4JPgq2JTw8gU/cqZy0YvCjGuttGweP6mnhiTcrj1uLx5MWU9
 x94iSL5BGgJf/to75mGvHnFh9L1eYbvsjvMmiL+z1a1ilDuts/R0gmCGh/VoNxxTgrz1
 Qgp3oVMgHnjKGNet3QEkp07VAkZOYqcEHXM3L7ECN2UdqtyFSBHH3ngF9rMQcVSTH0SH
 8xZA==
X-Gm-Message-State: AOAM533dRGDpeSNSPtMkPLq0+lfjT1rJsSzIA4w1IhXZY1/w1dbtwMT1
 i43mFAJZveo/Lw/R74AwSq7hCA==
X-Google-Smtp-Source: ABdhPJzAM3nvDiZgkgjbCCk+sZMIBOno6cPhG4UnkNREO3pHrABh7/MPDm6y3cxt5H3xR625D6qsWg==
X-Received: by 2002:a17:90a:7441:: with SMTP id o1mr319788pjk.71.1595437071610; 
 Wed, 22 Jul 2020 09:57:51 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 t20sm128143pfc.158.2020.07.22.09.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 09:57:50 -0700 (PDT)
Subject: Re: [RFC v2 12/76] target/riscv: rvv-0.9: add vcsr register
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-13-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96bb7e36-2198-8f89-a171-5a7d924e0455@linaro.org>
Date: Wed, 22 Jul 2020 09:57:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-13-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 22 Jul 2020 16:57:54 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu_bits.h |  7 +++++++
>  target/riscv/csr.c      | 21 +++++++++++++++++++++
>  2 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


