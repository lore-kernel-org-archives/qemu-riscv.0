Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puvIN-00063L-Hc
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 09:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvIL-0005xt-4T
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:16:21 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvI8-0005dV-JG
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:16:20 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc37e1525so3358364a12.1
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 06:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292567; x=1685884567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ksokDlqGyof+YvdYVqLNg/mcRdiA2tk9KOt1P1Hhccc=;
 b=mxWyVOIJqGRKzXytHMDvB+IXMOHN0IC9asjSTvMtrsYhtuA9NxkB7EQe404unsZ9B4
 gw5lBH0fRTVxqUNaiMm1/1Bh+p+njj0czKnAVxal8SBTRJasao9T4/Zv9A1jGhWxoh3M
 tXrt/83osP9prKUI8X4c1IpsywNEhKPPuyLDEF2dky+p8B6LJa7nzTxqT9XZGyXvMY/S
 XBFr9OewCyTyFdwqBHBUc/359Ej18WBxdUlEl+AZ/0/xhADxzHVn3GfhxTrryGywTcME
 MxkMo+FgfuVk/nP5uX4cMUHWgdYiPRU+9ncumAyHVBmyAhKE6q7IjCYN1nrgfgdadV3s
 NhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292567; x=1685884567;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ksokDlqGyof+YvdYVqLNg/mcRdiA2tk9KOt1P1Hhccc=;
 b=OHhVzvqRJWbeQMlvnXq9iTtioiv2Lw388qZW8T2NvTrDnOrZWN7fTB3uDUHosjpx94
 cB3KRaW6Jt78czFr5X5AxCoqWjrb6aBNk+FlyNVBiT/Ld3OYrc/gXkFJs4OKUusVUSyY
 X6JVDlkB0ut3sMIio5obUeF8i6Smrb77s3VDgGSCVZv6LeUwSH254QUhEMgKMksPv4d8
 2TUDGNfNG6/EgHyuay/PWTWg43lrAc1GwXvQB700wAVXVrqLD+j1BG+y00thU6NtqxsX
 Ny2OEe2zapVBum1L0Eh1DL50XpSUFaH6ISAZWJSIAPNbqtb1q0JdJsm6eWT93yZrzwCm
 xRsg==
X-Gm-Message-State: AC+VfDzLQ9kPnEbC0c9DAaesqxN8uzMt52HFhFim0fSUb3jTmnvYPkbi
 5FrTJ+WXns9NF/RMoWy0a8Z3xszMP1g90AJ4MQ5iYg==
X-Google-Smtp-Source: ACHHUZ6+f+9RfiSaOW4cr2QUW40jNT2x3ggEfvM6/Ix/m5yMPghZ8m7PVyRmA8i40GhXUYkwm1YHWDCbAvTOnCXOk24=
X-Received: by 2002:a50:ed06:0:b0:504:8014:1554 with SMTP id
 j6-20020a50ed06000000b0050480141554mr1208785eds.28.1683292567007; Fri, 05 May
 2023 06:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-46-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-46-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:15:56 +0100
Message-ID: <CAFEAcA8g0Bpy00C1iAGRMYGCg4GtjNrYVw_L=vhxR_WyK8H5+w@mail.gmail.com>
Subject: Re: [PATCH v4 45/57] tcg/arm: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 May 2023 13:16:21 -0000

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> No change to the ultimate load/store routines yet, so some atomicity
> conditions not yet honored, but plumbs the change to alignment through
> the relevant functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

