Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9LM-0004x0-35
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9LL-0004vL-5f
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:37:19 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9LI-0001zA-GD
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:37:18 -0500
Received: by mail-pg1-x532.google.com with SMTP id s18so1959914pgq.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677865035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hu2ySv+s0ME25NP8rUSj2eMw2O7Zk+8hzmVMllciejQ=;
 b=gosqHzQSTN7QojeLtpuwxAP7ml1TRAY/426ZE88DOaSZyAm+qdtVYULQzqurFFKP4u
 0uNDtkI5qulJLCYGMGA8KKuseyR25Hh3vk+geN5itKo6/FTBDZGtR372c71vOf/hcfqn
 X6euEGMDM+Ou6crSl9J5J8JJVJhyk+yUo98bFUQxgaxydiQtHsNhQGEv6AW05bVvW4ny
 C8Vnb1KJLy14tbCmFwEDFyTTDeZK6CsMfYz5wljeEd3H4qgvSuchVDhqCssBNe6mp3E3
 DQev4jDjfh+GOiDWOoHyEexGke4kLtG9iqhqplJtkhli3Wg4kXtovu9s3ZqAqw/LNDcI
 JlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677865035;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hu2ySv+s0ME25NP8rUSj2eMw2O7Zk+8hzmVMllciejQ=;
 b=hvAyRlfQD3mVbajl1u+1rXozuTPWz1BpgvqI6m5/ixoykxizOrlSXe0KHMYL+E2Gmg
 gBFhKB7ZEkC8xxYi8ociCc0dfkZgUm9aYvHJWdfnPmc7ESfA4iWeDgUGuvBC87RyPsGD
 zLtfM3rpQwmFXDq3CShzH29u2Tk3PphamefP1yiZWdNyhCHPwWkVwq+wfHZQmQM/6Pow
 T1KjZs/+66uB2sabWWT45PvLsDaslzlQK2I09pMqGsOfc8EG5qhpuqU09dHqCfk9BRMo
 WpKcApL9UEADxlhr0yhuwNLLFPPIhg6PWKD4k7UOWBWb56C2Ex10jUDRHEYMQtKTbwAK
 WF7w==
X-Gm-Message-State: AO0yUKViiFzqtlVpzRyojyPj+5CgwmL9DFA2U8xvCQeqdMSpmR58WAha
 u66RdEDue0jxUz65Z5Yd4PO/zEBkw13GJrhoj9qzXA==
X-Google-Smtp-Source: AK7set9XsBhdU1Tge1X0DniiCg0p9jcC05LYyHXM6RyMhzfuwbsHKRkk7Fm+9hX3hoO6/5LKiJBICcnEoU8vwz9Bvw4=
X-Received: by 2002:a63:291e:0:b0:503:77ce:a1ab with SMTP id
 bt30-20020a63291e000000b0050377cea1abmr753261pgb.9.1677865034940; Fri, 03 Mar
 2023 09:37:14 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-13-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:37:03 +0000
Message-ID: <CAFEAcA-65PHOBWYwErsoMx0vfP8yYEdZAEVN_C9nH+xt0tuF3Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/76] target/arm: Drop tcg_temp_free from
 translator-mve.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Mar 2023 17:37:19 -0000

On Mon, 27 Feb 2023 at 05:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-mve.c | 52 --------------------------------------
>  1 file changed, 52 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

