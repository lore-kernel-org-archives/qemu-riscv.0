Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtvg5-0004ig-26
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 12:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtvg2-0004fV-G9
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 12:15:07 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtvfy-00056l-KO
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 12:15:04 -0400
Received: by mail-pj1-x1030.google.com with SMTP id f16so2823613pjt.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 09:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5dcMVQboCvcDWlgEiVC28+clgOKPcqp7v4lwPnU26yo=;
 b=J/dZRZxBQdzhi9S/mLnSQV52Uk9UEMedWLfQRhhlbNh/zgqdtdPHUpbYoSU7vTwLDV
 8lJEclAklgJwCjtw8VbRfExvUybseOLw1w08aHHd7s6JZD9SR7YLexogeGPfqnaUNyXl
 4/DUIlgrxaj+F2hpJLpYT7mAnK0tfiDr+89VJn1+ujkmRm1PqdmUVkFmDJu5ZNN0L3gg
 4069EIZDQdSTQ0PyvzicHGF0Y+E3DjnOwU7KyUB5/uAx6NYQf9OoU8eaq0kmhecysIb/
 gwKHRuDFrIDl37/8CLNw7XH8uhq9og79Er3l8Ze1mxVE5ojoODmnUuDirn7UH+CtKecq
 XfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5dcMVQboCvcDWlgEiVC28+clgOKPcqp7v4lwPnU26yo=;
 b=QhHTe9jYLttb5/aiSwe2kKV64mlbgrfIS3k4WKDoLz5KWLZJZS9WozotwlGeUL1nST
 v+KznNBQ/4jsEUGqUXKl/E6yq5YRN+e34fjfiictIWb5ACFsRrmJa9sJ2T7jYGnS0cNJ
 h3Zg1uGfaNOAv9QvRwguRIc1ezc6LyS6TT002Sf1k8a9FNYZN/Hpr6AJlCwQ6vC+vzuk
 dpDYrLgn14R/fmXGYpMSgw30ehvvb1f0dQhkLY65z3T7gjd1NobPqly8PUykmnyw1S2x
 iOft+yeNlbKlZzmdxbbpg4YM5RPiiAIUOcHdLP3BX4E8GzBHmb4CG3D9EqEy8vIs5zYv
 tsCw==
X-Gm-Message-State: AOAM533S4oPGulUJGmUReM6KtAwI1Zn5KRs5xE/iSFkl6rwKuFiaUdXG
 xl6caFJRSUbeUXwGVJq+bizM9g==
X-Google-Smtp-Source: ABdhPJxhkkP/me/4cgTGMWa99EPHIP5wjNYkRm/oqrnF0JmJiyov48gxmxzBbRhfuGfFyI7PwJ1Hnw==
X-Received: by 2002:a17:90b:33c5:: with SMTP id
 lk5mr6632330pjb.181.1594397699104; 
 Fri, 10 Jul 2020 09:14:59 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y80sm6185877pfb.165.2020.07.10.09.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 09:14:58 -0700 (PDT)
Subject: Re: [RFC 03/65] target/riscv: fix return value of do_opivx_widen()
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-4-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <07e07afb-bafa-4027-33fe-669e472de0ff@linaro.org>
Date: Fri, 10 Jul 2020 09:14:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-4-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 16:15:07 -0000

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> do_opivx_widen() should return false if check function returns false.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Alistair, this one should be queued for 5.1 as a bug fix.


r~


