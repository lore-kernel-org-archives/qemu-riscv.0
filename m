Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuMI-0000hu-Gt
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuM4-0000SF-Bq
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:16:08 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuM2-0007yZ-PQ
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:16:08 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc2feb320so2675412a12.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288965; x=1685880965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+HTByYkTJururojW+BljJrcTMEUN8AhXjRN+CMC4/ao=;
 b=tTdYKPwl+d+P1oTgDqIyWNxhru+VYl2zoEKkzA85IXtkD2tn5aLdNwbUuNjqYvnXjE
 hwksGKKrfz+IXAeIpkjPmsLNvf3GTV+KN3YZHtYQa5/c19LDcoJpr+HDwhPpavrsDtV/
 6vXGeTkyvD0htoRDu2xXudWoB2TrTtpBXPiM3zDpuDY5bhyStj2/EmLJTPQ9sMWdUob6
 YVjKYbf8kieG8Te530EG0Eny/qqrRglNTDurepQHABrHH+MV8W3/cijlp/q4MEDGohTX
 oGAFzYdv524gGBk1qtuuE9SKodEyiMXePSC3te1KhgmORbwR7NG/Ju7VdkDsq5Zox6Pv
 GXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288965; x=1685880965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+HTByYkTJururojW+BljJrcTMEUN8AhXjRN+CMC4/ao=;
 b=hJAbYVks6+Hq3H48uccEo0aomJPPSHZ3SnIoOPhen6/86H/aTo/7A7KYyxfbrSQEXd
 u7uRdcFN4ZgCQYpueZBBpK5O6T7PgYLnJc0JLS2G2Ei3DpmHETdpwz/31CNDm8PCW30D
 jInl55hj59o0cAsrYLzPCVWsSx2m102cizU7qClccvtX6SUEjkGjt9qn41PtBX5/4JqT
 OB9oJZCgOhCiGeGq3pd/iBAowj+e+BwKe84fV39g6/A760SZKfbUKQFIafNoMgkVtg3L
 WWXrr+TdGb0UB++31iGp7Jge4q9WURR8gr7hL+RtHQPq1mtxEcZUhCw9u8PQ1E1YXUHe
 ghMQ==
X-Gm-Message-State: AC+VfDxOIdXq68RHgFsMEgT0LepdlJQLfBPekFamIpZqTTGWl13mWBK/
 +y8GLYWByI+j6xUGmWbUqkUTOCWGJqLKDxhVPXtdAQ==
X-Google-Smtp-Source: ACHHUZ5Zt+53RBdJfD1kl0CDGHsAYaE73AMD6JH1Yr+8+/5u3MlISOT9Mpwxi7zRkKZXwT6Wcx+SzePmlCFj8Y/z7EM=
X-Received: by 2002:a05:6402:182:b0:50b:f929:c6d3 with SMTP id
 r2-20020a056402018200b0050bf929c6d3mr1334097edv.1.1683288965409; Fri, 05 May
 2023 05:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-29-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:15:54 +0100
Message-ID: <CAFEAcA_f2OFM30FiUorrK=G3e8uAaS=UDUD5HEwvzzi1-iDeTQ@mail.gmail.com>
Subject: Re: [PATCH v4 28/57] tcg/mips: Use full load/store helpers in
 user-only mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 05 May 2023 12:16:08 -0000

On Wed, 3 May 2023 at 08:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
> This will allow the fast path to increase alignment to implement atomicity
> while not immediately raising an alignment exception.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

