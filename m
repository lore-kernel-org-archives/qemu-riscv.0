Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzCWg-0007PL-3d
	for mharc-qemu-riscv@gnu.org; Tue, 12 Jan 2021 00:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCWd-0007MG-N6
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 00:47:27 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzCWZ-000587-7p
 for qemu-riscv@nongnu.org; Tue, 12 Jan 2021 00:47:27 -0500
Received: by mail-pg1-x52d.google.com with SMTP id n10so701837pgl.10
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 21:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q8QxIQHsHuPxP6eL6hGGKq2QhesS5z6WDNIeuQYABjk=;
 b=BAVN2kxDLR3BcDEJA6XBGmY/cd00ER1wVkl42h+nX4T0+C4pqBBJFzVR5CYHtm9rcY
 IK9RfSnJUaiRdC+/aqtitAtrFvECaSKOLLWwyeXMOsrNSrPm50Bqd6mXyksfFnn60s4a
 ICHNV5Z6pumkM8Sdjd9Na2lQRhJKSI3Kb1RrMH4fUzccFTsNJJ3RKmXPhYaPrUdoDHFQ
 s1tjG+9QoJhHUlRNSbctv5kScJaxC5DTiOSEM5pwBacShC+L8/8DQveI0cMJ7SwiPMFx
 ZxNHtTR7OOR2dNvg1PXRsuOjXUMqlEDvNGBVJgVLL4VHY+yaOmGe1ZTTQYE237pBcXL2
 cQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q8QxIQHsHuPxP6eL6hGGKq2QhesS5z6WDNIeuQYABjk=;
 b=f+nHUfRN5EgIB06vtZVAHrRo1Oa0qUNqY7g8zbdFv0kmkVWqCxtuu+sEH7iFh6WKP8
 VuwIUQoyBOcwz58TXl+/YXklxH9Hkr3Pf0ipMwDseSUm1wgii6b7clpyycwHslkSE7S3
 nVemsX9mkZDntbcmQ29AO9kjIfCK4AI3C72/FIfakUMUtd/pqOI8eKQ9MvuE+EYlV9M9
 /U90d36tYDvH/H86ivAUGHVQBtkdelZNOp56nVACUXdsVhTCNJLBV0qcr3h6Rbjqclio
 fKJkwWZP+qMjaot0MNtijuu1lyEpI5PR8VPWSKYYyWFjcJg2OdvgveYQDPmCz6rFu0RK
 WW3g==
X-Gm-Message-State: AOAM530d8mMuftH3DLqEmn6NfkwxEkDtNONl8qHPu15Omaimaaa6oOZP
 R5cilvcBQc6bBuHWZHT4NRJVZA==
X-Google-Smtp-Source: ABdhPJxpkrxTCZnAI1uismNrbFj/FZyB20FyxjIevgIozl0WGIG22Z8kZPPhn1OCexeMLMeACreT8A==
X-Received: by 2002:a62:1b16:0:b029:19e:238:8627 with SMTP id
 b22-20020a621b160000b029019e02388627mr3081699pfb.52.1610430441744; 
 Mon, 11 Jan 2021 21:47:21 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id p22sm1952947pgk.21.2021.01.11.21.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 21:47:21 -0800 (PST)
Subject: Re: [RFC v3 13/16] target/riscv: rvb: generalized or-combine
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
 <20210112022001.20521-14-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8711dca9-7617-77d4-4aa5-368c3129f43a@linaro.org>
Date: Mon, 11 Jan 2021 19:47:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112022001.20521-14-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Tue, 12 Jan 2021 05:47:28 -0000

On 1/11/21 4:19 PM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/bitmanip_helper.c          | 31 +++++++++++++++++++++++++
>  target/riscv/helper.h                   |  2 ++
>  target/riscv/insn32-64.decode           |  2 ++
>  target/riscv/insn32.decode              |  2 ++
>  target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++++++++++++
>  target/riscv/translate.c                |  6 +++++
>  6 files changed, 67 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

