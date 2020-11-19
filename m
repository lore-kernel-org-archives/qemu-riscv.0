Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfrd9-0006Tv-UG
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 16:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrd8-0006TW-GH
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 16:38:14 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:36844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfrd6-0005na-U3
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 16:38:14 -0500
Received: by mail-pf1-x434.google.com with SMTP id a18so5769589pfl.3
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 13:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tQHCzHEgyZnzT2riSzwbYqkuCnU6VbH/EVmIN6nPuVY=;
 b=SAdm3QZ3eo0gyR4jFGWq3XvZs4Zi5SmWfqKR51pjOPDvcBNn464indRvHkXlrl4Vtf
 HJpjUvbyoBe/T8IcwtFqflo52xZa2NBCkbRvi1/d/RBswNqgsoy2wJ10kejTIm+Uhn+z
 doU42jWcoj+e8C7i+3OXWaZHzMMU6/PCKWFFoyf3NX9bsWyVv4b0CNXGc4vb0CP8kTkT
 Tf3GoubZIT6YtxI7grNfwDiSTgLzTvvLhG4b/spzixCkpw7nIwhiJuzxntPE/F8J3zbA
 0gcac4caFwbgx+kbINIJz6DPL+zuBnphr2Kxw2Ac/4FhuIk74mnZ8XG8WpJM0PzQEjB2
 V/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tQHCzHEgyZnzT2riSzwbYqkuCnU6VbH/EVmIN6nPuVY=;
 b=PS/d2kiuoflK6RFgo6Wbgq2/DKPY+aeCh48TSPokunH09ZtZ/ggBuR01ILpJ2poVWt
 qa82mNkB76kzY5sZd0EDGgPBdddAx5CpvTMRWk0QqxESXI1z01EUr7tBI5l+MtgHtk7G
 cRUrJcq6cWKXQRbqtz12jQveHIYE90ID/L8TFsr1FAL5VL2mDoOkPH5im5zD7f8JfcUb
 kDWgjbegKaIduvUOn4LrieelhDushceCmXAL38/C5O2xHsPNStQT0f3Ib7obW4mAGpSU
 k4KLLAtxML4eSfkvg+jn7uuYYbTF2K6FxP2uT0e8lmmbIO5HTsxjQonxpApyo0m9iiwi
 LQOw==
X-Gm-Message-State: AOAM530OGggI8IaHosjfRQnzM0cZ+3Uq7mMVxqUh7MjyifBz+6p7UVfT
 A2M1JDHp2FSCBD7hqIATjvsx0A==
X-Google-Smtp-Source: ABdhPJzrICKRqEsTZAXeNqJvYm1+N5636B8sjhrIdCthi/v8YF99drgQdrcAqT5CxNWNYejxSgYBsw==
X-Received: by 2002:a17:90a:6283:: with SMTP id
 d3mr6453486pjj.96.1605821891327; 
 Thu, 19 Nov 2020 13:38:11 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t9sm731119pjo.4.2020.11.19.13.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 13:38:10 -0800 (PST)
Subject: Re: [RFC 13/15] target/riscv: rvb: address calculation
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-14-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d0cbc48-a405-b26e-d34e-2fe6512f494e@linaro.org>
Date: Thu, 19 Nov 2020 13:38:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-14-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 19 Nov 2020 21:38:14 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  3 +++
>  target/riscv/insn32.decode              |  3 +++
>  target/riscv/insn_trans/trans_rvb.c.inc | 23 +++++++++++++++++
>  target/riscv/translate.c                | 33 +++++++++++++++++++++++++
>  4 files changed, 62 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


