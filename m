Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mRzjr-00082W-5I
	for mharc-qemu-riscv@gnu.org; Sun, 19 Sep 2021 12:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRzjo-0007zX-Ut
 for qemu-riscv@nongnu.org; Sun, 19 Sep 2021 12:32:20 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:42663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRzjn-0007aW-Hq
 for qemu-riscv@nongnu.org; Sun, 19 Sep 2021 12:32:20 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 p12-20020a17090adf8c00b0019c959bc795so5328350pjv.1
 for <qemu-riscv@nongnu.org>; Sun, 19 Sep 2021 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VyugTWabctRMZ2vsiFbFmgENwJB32PozHOFkVgUiM/I=;
 b=M6i0cCSPoiVCrrGBIWpebuaymFDqgQgtohB0u/wY67odpkoZVqNRnFDof4spQ90EM/
 hSd25eG5oUhEBNVWpL6nlQeLdLGPP7RmV6iLboQiPzxvEbvqkllwM2Etsd5o96lggoSo
 ZzLbI3CmLFQZfIc+We5I9A0NCFfgdVESF5lGcJCj681OLK3EA5WvDHB+L4Uozx/caHX/
 tsWS/rDIQZZTb/KId2BKOgwCdFLknb4YyU2rSDE6Q9n+WAirc+RmVrGxa2Zg6j+EiA+o
 Wlxd5tN++7tmaq4f+vPwwyv3gXYKRlRatPlATfocafxTpZivmCnDebDCDaBjVfwr7xk/
 fBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VyugTWabctRMZ2vsiFbFmgENwJB32PozHOFkVgUiM/I=;
 b=zQ+SxSwPYy2AS3TGy8dZRm0AfrnznAzuHMSP8v32kpLddtfZPAZtpGI8+xcImuOtKP
 Gm7FqP+CrRLpf7YzQIK+jKnqOqJPEEaseQngSwH8ee1nBDNoSySW6wBu29Q3mRbKgVU/
 soCfQ8kGTzdWX9LOUVPAiV+AV/UsOxsgvjW2vGWz/Prt/wYs6NSUJ9RGO4qHI6J4sxxJ
 l/qTo9tHpORu30O/b/CthHLT8cYBpViti8ELnZAjw80jzi2y54DbAiw2ZusQsoXqAI8z
 n8B8hNNoWzeyEx8j45AsYAx2NFrd1extVadpNBIiH2RE59BXimj1b3oGR/OtxJGlnV4x
 8ThQ==
X-Gm-Message-State: AOAM531CwPur4IQ1pa+OWiOHRhHv9anVhRCkcNjqf92+ySM0tQbgIEAH
 lFzWiIvo9rLebTytK7abM+a7QA==
X-Google-Smtp-Source: ABdhPJzMWzCto7wASHLsP/RzW5I4BrjGqH5zGTHg6t5rojCcragtm9egsR1B0wSLQw42IpyExc/rMQ==
X-Received: by 2002:a17:90b:2344:: with SMTP id
 ms4mr33469770pjb.3.1632069137607; 
 Sun, 19 Sep 2021 09:32:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t6sm15805007pjr.36.2021.09.19.09.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 09:32:17 -0700 (PDT)
Subject: Re: [PATCH RESEND v2] target/riscv: Set mstatus_hs.[SD|FS] bits if
 Clean and V=1 in mark_fs_dirty()
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20210917093153.4067812-1-frank.chang@sifive.com>
 <93e9a615-94fb-3958-9560-111910668768@linaro.org>
 <CAE_xrPh+CzNK-nnsO6NSk+FKowXW2Tbva9abhpgAD13xfPak4A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b642e26-aff5-912e-721b-1d808f0f6eea@linaro.org>
Date: Sun, 19 Sep 2021 09:32:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPh+CzNK-nnsO6NSk+FKowXW2Tbva9abhpgAD13xfPak4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sun, 19 Sep 2021 16:32:21 -0000

On 9/18/21 7:54 PM, Frank Chang wrote:
> Do you mean it's better to change to code sequence to something like:
> 
> static void mark_fs_dirty(DisasContext *ctx)
> {
>      .....
> 
>      if (ctx->virt_enabled && ctx->mstatus_hs_fs != MSTATUS_FS) {
>          /* Remember the stage change for the rest of the TB. */
>          ctx->mstatus_hs_fs = MSTATUS_FS;
>          .....
>      }
> 
>      if (ctx->mstatus_fs != MSTATUS_FS) {
>           /* Remember the state change for the rest of the TB.  */
>          ctx->mstatus_fs = MSTATUS_FS;
>          .....
>       }
> }
> 
> If so, I can update and send out the v3 patch.

Yes, something like that.

r~

