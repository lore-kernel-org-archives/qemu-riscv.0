Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtroK-0003Ep-Ga
	for mharc-qemu-riscv@gnu.org; Fri, 10 Jul 2020 08:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jtroI-0003Bv-JP
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 08:07:22 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jtroG-0000hS-NT
 for qemu-riscv@nongnu.org; Fri, 10 Jul 2020 08:07:22 -0400
Received: by mail-wm1-x32c.google.com with SMTP id l17so5932771wmj.0
 for <qemu-riscv@nongnu.org>; Fri, 10 Jul 2020 05:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=/vmzPUVe7zubGfFwwM3N45gsH+S+fJ9JECe2KqAuA7E=;
 b=eIF8aYoDlgyZE2K/+z5iUwFKTDJ1DuiFqyqROoKMTAJHeoPICdBui0aREJuDYd0M7v
 Pshw3U+09JC6E1XU3dXpW2wKJMDdIuj9iSSOeYDu79KKCSuR8o/PS6RtxEn/UGXZ/WYL
 TrEP4ZVo1qQFRpwiqmHmp2ofj0DWCkzJIJ/NLuCEBMyjaMX98V36pA9K/qRbBka+CYZB
 uXP2PpXABmGY7/KzwBlnnfRXP2wRs1fLl2Gk6UeeQ1ApXfv4+y2yzg+gEPZbddAy+9tI
 DFx2DxQeJPwkXLnBiMLSuA7UlFLO43pScD8Jn7/GM5/o5clpcB8OqulsCV/tefGOvJO9
 IEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=/vmzPUVe7zubGfFwwM3N45gsH+S+fJ9JECe2KqAuA7E=;
 b=Wp0nrfw61Jq4o5WhlOHXjNoInThZyKcWEK4lO78wYWLNcYzzm8gQhnCMmb06JUaeCj
 1uYB5boZDXeNuOH+k+N3cqY/HyxorWWtLN0+RYEx684VAvHbsxDOCCBjjPyG0x8lXpHb
 bEJLQY2PXrkaynWd/R6F1xVBz9q71PFMbQAj8ntG797EMRaqN/8QXAiMtcJOO/UDjg3T
 oXKD44m2eEftRbsx7k22b+Wj/bB9AVwXxs1NU08dhYWhbCGxka7tl5huduayhz/gZ2LX
 g0lcbpp33nDxHYVOmcVUvGG6IPSBLXqR7ZVT0GVgnyjH9AwxzD9paMUDQgBFTA9suuMW
 PQqg==
X-Gm-Message-State: AOAM531ietcRzGEGBB9f2BzWZIn8W3k3ue5zvwUyHR6bKGRYo/7mht5w
 MqZE5GAEAF1NVKYRb94utXzZ0Q==
X-Google-Smtp-Source: ABdhPJwuK2KrRxTRnHFChBdXb1f06tyNcvoZvIjrFaQXgIT6GamMExVRhPlBBMNFSPRCinzCtdo72g==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr5236009wmc.106.1594382838803; 
 Fri, 10 Jul 2020 05:07:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r10sm9904879wrm.17.2020.07.10.05.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 05:07:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2772C1FF7E;
 Fri, 10 Jul 2020 13:07:15 +0100 (BST)
References: <20200710104920.13550-1-frank.chang@sifive.com>
 <20200710104920.13550-61-frank.chang@sifive.com>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Aurelien Jarno
 <aurelien@aurel32.net>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC 60/65] softfloat: add fp16 and uint8/int8 interconvert
 functions
In-reply-to: <20200710104920.13550-61-frank.chang@sifive.com>
Date: Fri, 10 Jul 2020 13:07:14 +0100
Message-ID: <87k0zblgjx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Fri, 10 Jul 2020 12:07:22 -0000


frank.chang@sifive.com writes:

> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Did I miss the rest of the series somewhere?

Otherwise this looks fine to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

