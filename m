Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPQBs-0004LG-5j
	for mharc-qemu-riscv@gnu.org; Mon, 05 Oct 2020 09:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kPQBq-0004Kr-K5
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2020 09:06:06 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:35759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kPQBm-0002JV-10
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2020 09:06:06 -0400
Received: by mail-oi1-x22b.google.com with SMTP id w141so8614969oia.2
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2020 06:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bpWquIJSNiI3Sxy1voZo12eqZ+ws0k7ffZc0FeI3WfA=;
 b=Y2uFc7yqrgFITuCypUWS8TnLnrnTbvXTu9SjFmE9deMOJZc/zljQtRzH7izXfIqEQG
 Pjn/96SUMBXnz1wvVECI4oah2sYrUOFc6LgC+JVIivnHKVEhePbPq7xazX8r2x1FjSqQ
 gFmMgG0SNg7aW0NUs0bztyJqp0u8TApKz8HoEaiYaoZOpKN3ZTB4NVCwkltwresUiIwU
 0cpB558OqV2NBvOuMaq8mcFSb4EhcVZxQWMzRHnYzg3AheSNs8mcAsBhXUfU4ma2oHL4
 XxFOpoYCQJv7vgZk69uoUR3p3S9USAVY+E2Z1NkacrkRlNJs+zi1Qeq8qh5LOLmsXN7c
 aW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bpWquIJSNiI3Sxy1voZo12eqZ+ws0k7ffZc0FeI3WfA=;
 b=DPQT4EFXAYVwbGQYES5RwRiR9lOvG/SDHFDjYfGfk4BMUt/9/MQmnrNB7Vi/sgUzSZ
 Bnl1S8eYSNPwOSN4c+6xQxnTo3R4/nb/F5PbiJa0XXVZ8eBpMhpPwOF6GFPSGnE0Mjju
 ZrMAZ3OEu2v1JKEnqd6i90cJVYjwnf3fUMmiA3kg2bhmBSJKXYhkw8pi0SmG8HlK02kJ
 SBTL60mrU1zdpS5gYjNR1QKE7dOZTNfBYB6A5TZR/5kBl0T58mk4mGf6QWXRbnk4ON7U
 YYjUyIedBcXS9328KuglSBVkV2oXvaouqbXEvOak4YFp92P4k1oPXTeZV6lO+eBscV+o
 kIGQ==
X-Gm-Message-State: AOAM533Iubaw+pCR2whW3WtGhNUV5jGp77UPL3cJf1U8zyaIol5w7L+t
 tBiRCf8splja5H+9hauOdzhKhg==
X-Google-Smtp-Source: ABdhPJy7U9tG4KfetVwO6Xo9DhMClQfhe3z+S9/aVwZuTcNMR8oblvmuode4VcAI0L0slkkCM5+nfA==
X-Received: by 2002:aca:57c3:: with SMTP id l186mr1064238oib.133.1601903160101; 
 Mon, 05 Oct 2020 06:06:00 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 91sm2849350ott.55.2020.10.05.06.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 06:05:58 -0700 (PDT)
Subject: Re: Pointer Masking prototype for RISC-V QEMU
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: qemu-riscv@nongnu.org, Dave Smith <kupokupokupopo@gmail.com>
References: <CAFukJ-Cra_MELxo6Xr=g2S90UvpNg=m6XLjNWQs1hF4iK3mmYA@mail.gmail.com>
 <a4b32e0e-04d5-58fa-3afc-b429b2b3f3dd@linaro.org>
 <CAFukJ-ALCqCon3=EhDec2SX_sGVCeLSMz6+fgYheC-v4V6Jt=Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <291b1b75-d86a-2675-c7da-057d1a16bb44@linaro.org>
Date: Mon, 5 Oct 2020 08:05:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFukJ-ALCqCon3=EhDec2SX_sGVCeLSMz6+fgYheC-v4V6Jt=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 05 Oct 2020 13:06:06 -0000

On 10/5/20 1:48 AM, Alexey Baturo wrote:
> Richard, thank you for the reply!
> 
>>See https://wiki.qemu.org/Contribute/SubmitAPatch
>>Experimental features (i.e. non-ratified isa extensions) are acceptable, but
> they need to be off by default
> So, if I got you right, I could put my changes under an experimental extension
> knob and submit a patch into the mailing list, and it could be accepted, while
> the extension itself is under development?

Yes.  That's what we did for the V extension.


r~

