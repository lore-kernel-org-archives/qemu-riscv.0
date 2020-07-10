Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtx5e-0001i3-Db
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 13:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtx5d-0001hO-50
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:45:37 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtx5a-0000YF-On
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:45:36 -0400
Received: by mail-pl1-x635.google.com with SMTP id p1so2544256pls.4
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 10:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GSamje9+j3xshv2eABaYdnW8SBQFYC8RNnPL2NHuyRo=;
 b=KTN+kOuQua+whkKtSfhl3jXmEGHdrvhzq9CVf6Z7tb8wflK2GU/XGhsz1+8TeCtZuf
 O/WtKHbPACZlzX6LOOjgDDDAcBiJ4fi7/9EdwRvLBx8mcC9930zHCY1OZrSOWrcwrG49
 boJCNuSsSu5ylRf7oWl/Iy5dqc3uleVxwNg3ZkM1Qje0Vqk8AOqNDb71JgHpeHDYmXr2
 lRtCabK2etRqLP6OTxz53B+f6WCONyeZsVhZi6uw91Fui4DG8d2lrvcTDfb1S7L8PkLz
 v9UOi17jHu09Db8CwAy3OZpYP36O0t6TgHv0YWRC7v5dJExRORjFkoy07Z+iaMfe17Wc
 kH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GSamje9+j3xshv2eABaYdnW8SBQFYC8RNnPL2NHuyRo=;
 b=Rs8wC+PLgsUJDWF/cDHwfLUgzamRIUoK26gBB6cZxz15mEEpGpsnu99FUNxDmVhJS3
 7NntgEH5zbRpYu+y533b2//wqaJl9y9WJOwLHDhGxiUhuScuqi/puAJIiUbn/RId+VIE
 rC+JUxCfkk5oxoTLdw44lYqr0NbyIjEQJz1vjO7Fs07hy91B1MUL6EHGjLU8eGn49WVr
 RrCk/wEDVgsMMUu7+KxX8TXJFLVAK9NhvAdrOVmmOqAfur6w4W5tN4Au+LbDjEY9AtgF
 AbM1vp0cPHJJyU8eBeOSix1qwr0z1Rekm3yrPhs1rCnxNURWY3i4jibQARTsuzsItAzb
 3ldw==
X-Gm-Message-State: AOAM532wC9x3a+ECAr34Se4p9sF0rhm+VnetPmf3d3GRQXCJGMe+7khq
 zlV2ZWy2pAOnZpCDMIXzxig+Cg==
X-Google-Smtp-Source: ABdhPJzm9jWNopkgbhWDop6XVMtsjln6Dg5sUYlp7rMoaQfoZIliJ7EwDUKu8az6I2pp8MIE05d7Gw==
X-Received: by 2002:a17:90b:46d0:: with SMTP id
 jx16mr6503111pjb.222.1594403132790; 
 Fri, 10 Jul 2020 10:45:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o26sm6706364pfp.219.2020.07.10.10.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 10:45:32 -0700 (PDT)
Subject: Re: [RFC 11/65] target/riscv: rvv-0.9: add fractional LMUL, VTA and
 VMA
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-12-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f5582c2-928e-39b2-3566-e4f3ee9f6ade@linaro.org>
Date: Fri, 10 Jul 2020 10:45:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-12-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 17:45:37 -0000

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> -static void vext_clear(void *tail, uint32_t cnt, uint32_t tot)
> +static void vext_clear(void *tail, uint32_t vta, uint32_t cnt, uint32_t tot)
>  {
> +    /* tail element undisturbed */
> +    if (vta == 0) {
> +        return;
> +    }
> +
>      memset(tail, 0, tot - cnt);
>  }

First, this patch is doing too much.  LMUL should definitely be split from
VTA/VMA; they are not functionally related.

Second, it would be in-spec to simply do nothing for VTA/VMA, except validate
their setting within VTYPE.

Third, the spec talks about setting "agnostic" values to 1s, not 0s as you are
doing here.  So there's definitely something wrong.


r~

