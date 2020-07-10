Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtwoF-0005ny-TK
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 13:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtwoB-0005kp-95
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:27:35 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtwo7-0006fv-9S
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 13:27:34 -0400
Received: by mail-pl1-x629.google.com with SMTP id x8so2515517plm.10
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 10:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MGw1xnIhMlU3+HyGZ+q0KK/sZgrz0+mONwYEG3A9hmE=;
 b=O/zpWb7dilaa4B9k/DHhXwpxKsU6ltfE8Pwc6SrppMyGw88dbNOrlAqdozfEl37yRh
 mVy6nbhdZ7OSs5j3FTrVNYv80fvRRBP0mvyed4ViX5qMEFHwqgEtB0ofyxJKIsO6GTi/
 bpx3VTtek7FCaYzgFFuV+704Dd2np1AfLCEs9iqJVGql7AaoSkiGb+flYb2cruUBhpN9
 DVFeCoZgaIKOLUdBgvET6AgHvWcPCI1ZQ9eDYRi2srrFNhFOmGUAZqn/P7YkEBbnjxci
 +LkWqbv/8k/tvcRGFKqWS4KxwwJx3iAPYG/ljXbyVS70975Egm3m+ttUf7hWVRGlZVwc
 lX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MGw1xnIhMlU3+HyGZ+q0KK/sZgrz0+mONwYEG3A9hmE=;
 b=Ij6MalObED/xohG7EX6+leueaZe6HB3Kx5KHDG4n4oRBmHXDsI3pCZjk5R3nG8+7fG
 VptQowKr9g8YXqnfaDS90YtJB0jrurva10l0S5UhYAYACF0l4cmL/O1dkgETyAFmeHIN
 MajfF/yJBU7r0S2QBtWgV74R3cC3AAZfLUdG0pDD+36Vcmmxh+A4ai6IbBqyIaqvbaYW
 tFKb66v+ib8RE6CaDP5bXK7DgcB/dzzXGUiyF9ZzFOPtouqfT6gJSzgmqCkHaQ7xWleL
 fBiogdWtg9OQYQqyD9dVxyak2hboPFFBYXCzFQAUi1jFkM+QzPblhD+QF9GRr9gJp/Fx
 BpnQ==
X-Gm-Message-State: AOAM530RMYOrusX3/Z+XCRcw5SUwIRCgNPRWl87PmRw7aTNCG5SHOsb8
 IEPxsM4vv9Mt95jFCHxWbvyZHA==
X-Google-Smtp-Source: ABdhPJzo7HaYnOJlSXveXMoQH8G7sNhEagbCrbuMGjPmGg7dIrbFcVpLDNxImBnoqakxCJ3Nm8viYQ==
X-Received: by 2002:a17:902:c411:: with SMTP id
 k17mr56177688plk.165.1594402049873; 
 Fri, 10 Jul 2020 10:27:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id g8sm6338215pgr.70.2020.07.10.10.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 10:27:29 -0700 (PDT)
Subject: Re: [RFC 07/65] target/riscv: rvv-0.9: add vector context status
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-8-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52547eb2-4bda-e97a-3c5e-8565da3579de@linaro.org>
Date: Fri, 10 Jul 2020 10:27:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200710104920.13550-8-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 17:27:35 -0000

On 7/10/20 3:48 AM, frank.chang@sifive.com wrote:
> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/cpu.h                      |  4 ++
>  target/riscv/cpu_bits.h                 |  1 +
>  target/riscv/cpu_helper.c               | 13 ++++++
>  target/riscv/csr.c                      | 25 ++++++++++-
>  target/riscv/insn_trans/trans_rvv.inc.c | 57 +++++++++++++++++++++----
>  target/riscv/translate.c                | 32 ++++++++++++++
>  6 files changed, 123 insertions(+), 9 deletions(-)

BTW, I think this should be split.

One patch for the csr.c changes, another for the translate changes.


r~

