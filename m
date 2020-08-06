Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3pUd-0004RL-NV
	for mharc-qemu-riscv@gnu.org; Thu, 06 Aug 2020 19:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3pUb-0004PL-BV
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 19:40:13 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3pUY-0003jw-FO
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2020 19:40:13 -0400
Received: by mail-pf1-x435.google.com with SMTP id 17so1785pfw.9
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2020 16:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Pu5JVFagrRVBjr/hibm2XKkPJpvwuFmYkoVZXrjX/M=;
 b=W57kqSl3I/MAQ4LDdaWxmNRyV+xX7VY6N1yTuT9hX3sgBATWgDIQ50CRu+b+arKmT6
 lyissyESELgnIzoEDTf4urZlWjzQ+9DXPi65HwLtgGdsYrg10WRRlhpNBC5m/iSRURiU
 Y8KFd+zEj80aDwsnSDl8MKQ1JvgSeGJskkh3nxBrWbnWiycx7xTdajZt+06n+gW+iKc5
 kPJCyrOYU7UZQ+zfeFwaXly7OLa2ZDBm7Qs0+TdJYfbWtmSJr/6ZKhnebI9SEkTSA/rM
 H+Rc5ICrZus8UHcGK//i6XPD94/kUzXL6amEopCjZZXDpSdKdLLQRfaFWQjlyS8s6I63
 SGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Pu5JVFagrRVBjr/hibm2XKkPJpvwuFmYkoVZXrjX/M=;
 b=sSMVrEHzUjLc4NpGSv7HiI3nwhML1TXpQTd5kBD41P7D1hS+4PIR4RzrvmHvj9fbWe
 Ez8/0gelTlUK9kl6MiJFciolhobSQxbeuPIhWnSDA3L8TJno5SpZEZeUbP1qGglBCZnD
 EVnXG4FeiCEowNpuY02utwCtVNKxWStgu1u7HTPR3QhreUrNu2dRPP1IbLVABK7f/eai
 7raXmw9WmjuYxNnb8XsVPtOuAJW/yYoqZXL0bSCSChBqB3rGrGci+IQr2G/wvtjrr4jM
 A18Q+I9IsivBgvKqeyFWb8tMLUVtODiqUgqGvv1kEd7TMvgf1magRXzGHC4HYNqtO/oQ
 lwpg==
X-Gm-Message-State: AOAM5305vIJ6FniMeSYIYihSR7UkAvT/wtbCs3ouNo/hEIVZMin4QIJz
 1V7CJhwAI3TmbKBOGBxQ49UGtw==
X-Google-Smtp-Source: ABdhPJwbZ1/1TuRq12GAgYo6KIjR05Kut928Y5OcCYtKTrt0ZjIONyo2g+UZ2R7ubNF0LjXptOGT4Q==
X-Received: by 2002:a62:7ac2:: with SMTP id
 v185mr10691206pfc.277.1596757208773; 
 Thu, 06 Aug 2020 16:40:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l12sm8244892pjq.31.2020.08.06.16.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 16:40:07 -0700 (PDT)
Subject: Re: [RFC v3 19/71] target/riscv: rvv-1.0: configure instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-20-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <11ad5e9d-58be-510e-d238-5404e239182a@linaro.org>
Date: Thu, 6 Aug 2020 16:40:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-20-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Thu, 06 Aug 2020 23:40:13 -0000

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 12 ++++++++----
>  target/riscv/vector_helper.c            | 14 +++++++++++++-
>  2 files changed, 21 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

