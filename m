Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pX46G-0002vy-GN
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 12:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX467-0002up-9p
 for qemu-riscv@nongnu.org; Tue, 28 Feb 2023 12:49:10 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX465-0003BX-PG
 for qemu-riscv@nongnu.org; Tue, 28 Feb 2023 12:49:07 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so6390536wmq.2
 for <qemu-riscv@nongnu.org>; Tue, 28 Feb 2023 09:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RyEex2E9ykEwAlmfrLz3IQ7ozOV+CYM8LCRwylGuTKs=;
 b=bNB9LPU59hrLYiEIVeOXSw7YjFRPK2vHxiLGI5hHxyU+lRLVTNXqkoPtv7GDq25Czy
 8ObwegsAubGHUM1MhIOfREwMRBThk99dVZtR2RX+PPqeJQC9Gsarq8FBw6Ko9zgLfDsm
 xk6YbQGdvtcfkP3Jjr8W+R7ZB3H8auUzl4WtvfDbN6JVBPTRMu70BRFjcCeFTg7S8L8Y
 lcTp7tTkZHYI0+vKtG69pGuptq4aUjwoD/anzuWdagn444zru0CeMeQkeGzByuMjfb1a
 cA4U56XcesegpfjbFe3f3ewuoe+Ln6yaL+eBoyMNYZHNdOWD8O9BqwdyfvCdCcvaXx1o
 FnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RyEex2E9ykEwAlmfrLz3IQ7ozOV+CYM8LCRwylGuTKs=;
 b=xdtAjTXiqGhK2RYCIs8lyfqD7YHk7xUD+lZ8jHWzvIqddS0hpCQ1RMSIFYITVjUOZd
 agFAp0Mi+2W6v6oyWIbwNdCYMpQFY3t3kvGphLYHNhbpyOXXo9nbZF7VfF50RtereAQY
 WaQsPsFp0Y4iyVqrohjPo6cd8ym2lEfbPrEQMSUWL9ZpBax+xx9K86ciRkkIpArgYgpP
 AkDBRyKUhQZhAD3UagrfyZ7ZRdOqWsYSb9Y5t4hFgRGUOF7XzIVlzAlknYxRX1TkuKpx
 Ms7B2EdrMVDDQihQlzQ3vNutRq7ot86h2/p2wpiXJk157tkVJNfvGn9OWL0tQrNUgoVP
 a4XQ==
X-Gm-Message-State: AO0yUKUkGtXx6fbF7dehczlvPx3nTexEa0pdh74BdjvhsH8OizV83cpD
 bNTfTb/+kU29ZE8pyEx8xr5Fnw==
X-Google-Smtp-Source: AK7set9oFQVtxamAy9B0ii5JKs1rwpymJFdELEIbXGZQQTOOppGtaFES43+vzdp4hN5wtljnOduBuw==
X-Received: by 2002:a05:600c:4f92:b0:3eb:246d:7efd with SMTP id
 n18-20020a05600c4f9200b003eb246d7efdmr10164329wmq.2.1677606541035; 
 Tue, 28 Feb 2023 09:49:01 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e209b45f6bsm18020644wmq.29.2023.02.28.09.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 09:49:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4ABD31FFB7;
 Tue, 28 Feb 2023 17:49:00 +0000 (GMT)
References: <20230227053701.368744-1-richard.henderson@linaro.org>
 <20230227053701.368744-18-richard.henderson@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v4 17/31] tcg: Don't re-use TEMP_TB temporaries
Date: Tue, 28 Feb 2023 17:48:52 +0000
In-reply-to: <20230227053701.368744-18-richard.henderson@linaro.org>
Message-ID: <87zg8xel4j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 28 Feb 2023 17:49:10 -0000


Richard Henderson <richard.henderson@linaro.org> writes:

> Reusing TEMP_TB interferes with detecting whether the
> temp can be adjusted to TEMP_EBB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

