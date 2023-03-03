Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYATd-0000Qr-44
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYATP-0008RG-MD
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:49:47 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYATO-0001wu-8S
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:49:43 -0500
Received: by mail-pj1-x1034.google.com with SMTP id bo22so3523050pjb.4
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JMXMQWpbHwQR/8T8b/ZkNg7ZuKGeta3yefHrf8HK2kY=;
 b=Zi3oonlcqyi/jQysMJN93ra5NWvnw1kL4A/cYavudQir/EFE+nIUQEqB1aCu8KutRJ
 l5+bNEnuqZnAIFPKP4qYflLkTI/0abZriAQyQbHI+YiALOzgcHBvDBP9lD118ZDFE37f
 ZkCyYxtCYlTKCzKG+5C/+ubShoI3AJwG7MFjxTzmR124gbrkQGCDpO/Y57v4KlljgaxW
 ZiZCC53bzShOwJnvov5WVSmYCHpEKk3/yLtuZYIVFpuGUBm8Wp5yh/DdCSpBU6IQwUgN
 /Cl9CRIP6rV9r2AcSNQFuktF7T5ShqlU6QL9lCkXHLBW2G4dmuxNmGjMFGqVfwECrqQw
 OM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JMXMQWpbHwQR/8T8b/ZkNg7ZuKGeta3yefHrf8HK2kY=;
 b=o4lxjhYnRXDMjcXVqlZ4DhD27Owny3c09L0E+/ny/gZm64TASxiSdIKPt9y9CL4LT+
 rw9Eq2NzodFlH5/SZZ5aB16u8HuU7/WaLGrSxDjRzDG64FOzD6AT/3e0kveQQhCu2Reb
 9Fdl4JbCrIC0CEfKGKOrHjuIlQMhUY6rHce4KCAx/dLzSXLGkuoiExe8MBz3AXlGrm77
 XiobKh2NzleP9lQy0ffjFx2CfErWp3EE8q3R15N6aU9tb1Wvlao5cwOaQ/9tboHQn3aV
 HPII3hLHeXcE9BHYjuBDrXY8/CNEsVo22RC68H7QGygI6FiZlgtlmRWwW+sE4pgWgovW
 jmag==
X-Gm-Message-State: AO0yUKXJ1irxy7RCTc+Ewa26/EJ8xc0d9tOIC0cJ9wA7j+XLBASNeDSZ
 SDFn1C3XsEUiogIc+tIHZusLIfTeGgmXEcrmT8Wg1w==
X-Google-Smtp-Source: AK7set+KTXrqyqDjgII56ckuWDX6s7lruGQdHdtbcmKSCEwvSpmurnoBiuKLtEVDtR0Nq30roMnzqUdo84IH9ZWyUy8=
X-Received: by 2002:a17:90b:241:b0:237:ea76:41ed with SMTP id
 fz1-20020a17090b024100b00237ea7641edmr1009984pjb.0.1677869380983; Fri, 03 Mar
 2023 10:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-49-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:49:29 +0000
Message-ID: <CAFEAcA9dfv-HXvO8u8xNd06AkFOXosjPuzmuGiQyzTWQmE5B2g@mail.gmail.com>
Subject: Re: [PATCH v2 48/76] target/nios2: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:49:55 -0000

On Mon, 27 Feb 2023 at 05:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

