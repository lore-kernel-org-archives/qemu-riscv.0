Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC7OO-0001IM-Il
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 16:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7OM-0001EV-OA
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:24:02 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC7OL-00088H-2R
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 16:24:02 -0400
Received: by mail-pg1-x52d.google.com with SMTP id i10so2150499pgk.1
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 13:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0B65qnkHdehDe3WaVfdLTw1Sw4msC7n+KjZA/enc+qw=;
 b=W2gYq2BjNJEAOaG0UZSUZnz+kRhGbWUhQDpRl4C5aiU/NmyhVjSIEHUNoNwYZ45Ojs
 7QTLjfJ2TDZrNO9i2LmtyTxSyBuFTbwfxZ5GX2e4iyuwHQST2CNYX2/zA4NHcm7FP8Rz
 tvc6SR9ZTZQZ4CSSepNuzQY40qsO7xWoeYroRW3quNnOthLYH60FAY9jzLmJyKR/SnJ8
 QlINj4A1RWk7urqrKyX8+V0sOH8w6OhdRUzXglX6PQwDLYbvco3DqCQOu80PwCRCADxV
 fdCGSRoIj3HUh2HUyOW86Jj/DYkAHqm3asIli3Ge00qQNUhHWIbDA9ZG5EgXE1YrK1il
 Enmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0B65qnkHdehDe3WaVfdLTw1Sw4msC7n+KjZA/enc+qw=;
 b=HAbNiNT9TfCnO6TBIR3aWPBnfOXqUdbFC3DtwlDEZ3+00JAcPCV9nxi/8fFh8P8n5S
 XXoUblnn4vS35NTks2s0jRXj9WjWBj+gY3doOrg+UJ36PJY0eXOiFj4rYe1aeosq2ib/
 DApjN6uTxlBxIZaj1ULFzs0+L3Ib/WTUjqM759CoW2YyGQCdBgcGlZInRrSIRQaifb38
 otP+0ymBoYnpXUYgOkQVlmd43O+982yHRtucqNqlgOCTNfbDxpBvKBIq1CZOaunF/qBv
 7ZtafKJanjkxYWr6pz0HCv6X1FvL5x3wxKD6W4lXuTbpqbbl+MpH5E40eUCDcw0+eFFd
 Qo5w==
X-Gm-Message-State: AOAM530r92G6jtgtDRwbliMZx1VrhhV1F2vGP2f9E2LOEoaGb59xG4bV
 jdvOplsz8zkVT59yZgj8yUbdlQ==
X-Google-Smtp-Source: ABdhPJylT7Vt2RX7PEqS0BydORQ2fiGtd4KhtdSvBMxnYrPVoXD3zuALTjd/5FOxhIu24Gi4w+6dYQ==
X-Received: by 2002:a62:31c7:: with SMTP id x190mr4082947pfx.100.1598732639582; 
 Sat, 29 Aug 2020 13:23:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id v6sm3224589pgf.55.2020.08.29.13.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 13:23:58 -0700 (PDT)
Subject: Re: [RFC v4 48/70] target/riscv: rvv-1.0: integer comparison
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-49-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <09a3b3ee-2ec5-d61d-64ee-68e16a7f2499@linaro.org>
Date: Sat, 29 Aug 2020 13:23:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-49-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 20:24:03 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> * Sign-extend vmselu.vi and vmsgtu.vi immediate values.
> * Remove "set tail elements to zeros" as tail elements can be unchanged
>   for either VTA to have undisturbed or agnostic setting.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn_trans/trans_rvv.inc.c | 4 ++--
>  target/riscv/vector_helper.c            | 8 --------
>  2 files changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

