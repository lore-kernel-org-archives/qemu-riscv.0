Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpZcE-0000Fo-1I
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 11:25:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZcB-0000Bx-Gz
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 11:25:23 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZc9-0007Cu-AX
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 11:25:23 -0500
Received: by mail-pj1-x1032.google.com with SMTP id b5so1920148pjl.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 08:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kaJVsuiZGLpTpUX6LevuWpLqM5gPjTgFJgdqWdpdES8=;
 b=UiL4ENjkCuK+1OYS1gpxDbo0zjvD9j7DvNUNj38CiGvDD3+Ggm0EgYdlzAbGnKpGl7
 ocooWwcajtuR6TkRq+klIu1H+n4ys4HlX/Qz7u7egk6DlhHi0B4yLCXejVkQDm1XmhxX
 QASEJKlEVyDXJpfhhM4TkDXyZkEa+YyK3cSmKji0+L5AiQbC/cTgEzm1IfRHxJkR9Cjs
 tSLir5/oKHn9MhlKfXgr5K/H7U0bu7Gn8PI6ejfQhLGIBi3iCvBtV+M6/KJ9gBSlZNPC
 dw1WzjNV2zdZ9D6+30NMCfuvWpieBOap7IpOrVJTkJ5jF60ZnBbKKXgyJwam++jIhrvR
 YVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kaJVsuiZGLpTpUX6LevuWpLqM5gPjTgFJgdqWdpdES8=;
 b=V6REeAtT3IH/GzhBXw0LmXny+RKU7qDI0RDmIOoOs3ZfMudzQBHa1ZOLQnpPHZmff8
 VJyyEg6KaVvFzi8DMw1va1NUSNqddn0CT5QRLwmPuB4R9Ue7vguEqhcxsJETJpDtsYFQ
 OLyzqm7yUy5nCOBH0b+kO2eGmMGsc7F01SPHh4hbQD/78bMfGigWACOHd8+UYz3B4DX4
 2X2X4UQe6Ebnr2BJisGDr4OzGzSsOoxhhrpRZcVZHqgEVY47Pqh+vtSNwRbe6qm+a8du
 dWGBsVLBz0V+2T2DE/CpDKrWWwSVsrTdX3NxDwPEsSIqlchE6HCBPV216ClVB8tUgzTp
 +EBQ==
X-Gm-Message-State: AOAM5301h5JBN9pkycQHttPtsFhO96Cs3WEgYG0tJ59CUFxEdFSh239U
 LGZ/WVbxFFpL+tuG5uSY/me5wthEecRlyx8j
X-Google-Smtp-Source: ABdhPJxbR1UTyC98l+EQIBSArhFIilUzQPdS4FUGApFAb830/74kaksPgmdMCoanwnhDVsaA0AVa7A==
X-Received: by 2002:a17:90b:3110:: with SMTP id
 gc16mr3746639pjb.83.1608135919793; 
 Wed, 16 Dec 2020 08:25:19 -0800 (PST)
Received: from [192.168.71.34] ([172.58.27.195])
 by smtp.gmail.com with ESMTPSA id s5sm2549219pju.9.2020.12.16.08.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:25:18 -0800 (PST)
Subject: Re: [RFC v2 07/15] target/riscv: rvb: sign-extend instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-8-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fbcfe60-6bad-02cc-27dc-a354794aaec7@linaro.org>
Date: Wed, 16 Dec 2020 10:25:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-8-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 16:25:24 -0000

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> +static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +    return gen_unary(ctx, a, &tcg_gen_ext16s_tl);
> +}
> +
> +{

Stray "{".

Presumably a rebase error fixed up in a later patch?
Anyway, with that fixed,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

