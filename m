Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pY9Kg-0003Nm-Rh
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 12:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9Kf-0003Ku-9g
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:36:37 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY9Kd-0001k5-6n
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 12:36:37 -0500
Received: by mail-pl1-x62b.google.com with SMTP id p20so3423402plw.13
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 09:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677864994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GQ6a3NDdKNcX9UM5wDiIzLHvAyafoQztXwgMXUDzcyE=;
 b=NWcy53CzX7Zp88K5c4Dv0eEp1hbsyeTy5lCRzZ8v2x8o860UXHgQkLulal/+3oUXpx
 klo8QhzJ23bxxyqU4e305vIgP9wg/Et99UuPtxolE1NhEcXR9Xa1oL2IG9vcLHY9Woiw
 ehFLN3cmcGNpF2qFOKIi19XZV+/9ANDQgf3Ndw+Pfxm4htXIRpwrwG6ryn8Y3hj/Ke6t
 nRjrNXdRbmiqVRK8gUHDMpmqFfUSilPdLVo59+rj+9hdpeUa1lY5MP8xT+Kb5ZejSF4V
 cCgeLEgHIBwobH4JVD3LT9GkOwsXgqvW5FbgICYCOXnO98wakWEEYSS3ITaRtPrRdKLq
 28Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GQ6a3NDdKNcX9UM5wDiIzLHvAyafoQztXwgMXUDzcyE=;
 b=hpxD3OAxhbjT9g07H2Az5FZATPGyMqLhXFZV5XEy6yGDOC1S3DuVorjeHF/eC2v8XJ
 1YPQ3daBWONjBlvl56aL6j7hZ1RTa4TwD9iSJjXXlBh2VSGuABIYdZnNgSuilSn3YciW
 YVhQPwf6b5ApE2mAf1yTUdaLaAg017Dx3GSyg2L5d11PKRExMBGiyZQ51noD8mGf0lQ4
 dRiQ1V3MlBE4KXzCnjAFea4VcQrEaFlle5DYKABWBCUBFO0jdDTt9JC8PqOVcaGQ3rqf
 mFCfgB0rb0JxXs0DeLNajvRsJbcV0bduBOnY6a1zMpN7Pwb2UIJXAYWM+Z9x5i/4RCEK
 hqjA==
X-Gm-Message-State: AO0yUKVk3UG6ZPNxfDY50tVO2AzgjMI4TnV+2MCre9n/GvYSyAqNA8VB
 lJS1FKJq6McyuWU+ujeIMOUP+CoKkNG5qic7d5CFYA==
X-Google-Smtp-Source: AK7set8XaC0uqazcFq9TEmg8Bh9CRxOVJuv6Tqek5N0jsIoPL7aWbDsjfskpnifmIptUz660H3nmOfe3HXZJe1uyViA=
X-Received: by 2002:a17:902:a3c6:b0:19b:8cbb:30fe with SMTP id
 q6-20020a170902a3c600b0019b8cbb30femr986145plb.13.1677864993986; Fri, 03 Mar
 2023 09:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-12-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 17:36:22 +0000
Message-ID: <CAFEAcA_P6N5TBLH=ZB=kL=HDnG+yuLa9op=yOBWAZnVdQe7KJg@mail.gmail.com>
Subject: Re: [PATCH v2 11/76] target/arm: Drop tcg_temp_free from
 translator-m-nocp.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 17:36:37 -0000

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-m-nocp.c | 20 --------------------
>  1 file changed, 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

