Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1YQO-0006Qo-6z
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 13:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YQN-0006QW-HT
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:02:27 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1YQI-0004VJ-Qr
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 13:02:27 -0400
Received: by mail-pf1-x436.google.com with SMTP id k18so7544731pfp.7
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 10:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JlFAGtqbK3x9r76yBteOvIjBOWzwUcJOpWdwUyCk0ak=;
 b=uFPz6PqqaecCU64+tbJvUXeuBwoY0WVyjeFffhhyB+HRhVyTZVawAcl1XNzno2ttfi
 5DrdbGrk4Ng+d2NzeR5tlYRj0UOKksgWjk/rX1La65Mn6MCyO1rpasazJUB26hmXqWJJ
 0RtPfeor6fr44h90zdwn2SLvyHF8AvUmtu70YUXRoG0M589N0nD0yAGJCVwrXUT9WULE
 K5sIMATAMwX2CAMeBZA+D9pKpKSxODDsOkimqx33r/4TkJUFqvS/clUI2c8n7QELosF7
 x2cdW3Gg/ljSV76xDzncrXFYAmlvsT5XRWOTX6ZbrXbd5kyHnSiqoloWqbH4m8sIRQME
 IDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JlFAGtqbK3x9r76yBteOvIjBOWzwUcJOpWdwUyCk0ak=;
 b=CUtvKsBk7/hFNZ9qJBbEOgfzCVsVZMD2zEunXr86O7ZetKMl5yhreQxnolPIlzOElp
 aPxyf0MlTnO73vhwjZ4hrSFOaHj5NNn9Uc6wmSJZH8e11jrHzBcHsJFZ2kLPdtjeBJ6o
 QI5dpUbHo6oQ7g5hR2ZlqMTeoDrTQUbkkzotfpg/Wfh5PH1vvU42jHel4c+mn40T0TAE
 i1RM14y073KWsI3evoIQ1GudGSQgYwrMK/shxuRQt/OFCqJUqrItm89IIq04FIxLqt9K
 7F1alknW7j5Bf6Gb8P912DurHyPsAoL6mmJfWmfIhyfUt0JTAw9n1+G/anOYU5AWLB9u
 LMUQ==
X-Gm-Message-State: AOAM531uXPjklU7XStmAL+8kYAjtNpbzvoNqxjBV+bTt8X4AHI31toWq
 EnmMmNpF0M8tTlHlxZJI6OBlwQ==
X-Google-Smtp-Source: ABdhPJyJ3lGksi96RHQjYfXRWLO52ErKkbRIRHuoL8XyIEJ+QvQoCsm+YJH23/AeamdgIjnUQJm+pw==
X-Received: by 2002:a63:a05f:: with SMTP id u31mr4544998pgn.4.1596214939051;
 Fri, 31 Jul 2020 10:02:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id lr1sm11045306pjb.27.2020.07.31.10.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 10:02:18 -0700 (PDT)
Subject: Re: [RFC v2 65/76] target/riscv: rvv-0.9: remove widening saturating
 scaled multiply-add
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-66-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <863e4297-648a-d40f-1270-9abf7580150f@linaro.org>
Date: Fri, 31 Jul 2020 10:02:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-66-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-List-Received-Date: Fri, 31 Jul 2020 17:02:27 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   |  22 ---
>  target/riscv/insn32.decode              |   7 -
>  target/riscv/insn_trans/trans_rvv.inc.c |   9 --
>  target/riscv/vector_helper.c            | 205 ------------------------
>  4 files changed, 243 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

