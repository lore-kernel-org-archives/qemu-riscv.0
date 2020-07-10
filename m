Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtwtP-00054I-VZ
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 13:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtwtO-00052V-49
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:32:58 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtwtM-0007TZ-Ci
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:32:57 -0400
Received: by mail-pl1-x62b.google.com with SMTP id b9so2527672plx.6
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 10:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dpERKSrC5Ld7XZhm4Ee4haRxev/yowN/xBhmr4Zedbw=;
 b=CEDzPWEqlTihIuLGj+mtikQDygj6cygYUqqfor8lnA86/3O8aWGJKq7S+/cMUH6yrt
 dsa+k0R6GYtfPTDCWBLq/KUwMZ7Qgp0f82Qa/bViYRvhGqpoKnypnLD2DhXzvgCrf9L5
 l72nN+14uZK+KrNDcCg2GsAwV+K/1ePnO14L3hZcdqlFK8gS5/I8uae+6EWfjsGbX3jb
 t4rBfik0GD/TuqOCeH1P5Mxp17ClY1Ckqp5ZS2PmohJRuaU/2l7PqTrW90moMls9j7tW
 mG3GNQQ5bwTtEcPeC96M2KCgNWBOVj2HogfNas+Ati53mTCMUgO7UYEL0Do1E/TPEJ+v
 J7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dpERKSrC5Ld7XZhm4Ee4haRxev/yowN/xBhmr4Zedbw=;
 b=ln6zAP/Hvx/2MQSQPHBpyDVv4ANk25oF12brV7aO4ULTF3iwCgPI0v5QyMwMUYVeJ6
 BN/Ahc5bmeFHMY1Ec/qFMTStDOs2Sk5I0NKNtGa0BCp7zb22AjrPgWzh4CJEglrH5bwp
 uRsrhW+/X5vzEGx2i+uuOX/JcSCw9rWX6GcbT5RKD0M/r6Rq1FokTYI4YEKBNq+PsAQ1
 pt/Ro8Yr9EoEKgYtADv4Qis/CDXOzCjMDB688gGcjXdShHuOzwivvdOmailj4ZvG2/SV
 M+lcKon8k5v5LgklMNWtSGlKFiTzaPtBYuHjGo1h4IS8etOa9AJkPc+VKIkOchvuhdm1
 2aEg==
X-Gm-Message-State: AOAM532Pck6MvMJAiIIlNUWtXQUau6lXMThCZyBw/A1M3PLgK8ghDgyi
 HsfxcWxa5hG0s9LjnE55ldqmlA==
X-Google-Smtp-Source: ABdhPJyjCaQ613F2vRafFSFDb27kfTi5y4JYMtVDvbz2R2irYGhkBMneRXklfx/ZSWkxg9z7bKKNKw==
X-Received: by 2002:a17:90a:de94:: with SMTP id
 n20mr6974563pjv.125.1594402374907; 
 Fri, 10 Jul 2020 10:32:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 144sm6687449pfb.31.2020.07.10.10.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 10:32:54 -0700 (PDT)
Subject: Re: [RFC 10/65] target/riscv: rvv-0.9: remove MLEN calculations
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-11-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78689d02-8def-262b-5e62-316faf8dad1b@linaro.org>
Date: Fri, 10 Jul 2020 10:32:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-11-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 17:32:58 -0000

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> As in RVV 0.9 design, MLEN is hardcoded with value 1 (Section 4.5).
> Thus, remove all MLEN related calculations.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c |  44 +----
>  target/riscv/internals.h                |   9 +-
>  target/riscv/translate.c                |   2 -
>  target/riscv/vector_helper.c            | 252 ++++++++++--------------
>  4 files changed, 116 insertions(+), 191 deletions(-)

You can't do this until you remove 0.7.1 support.


r~

