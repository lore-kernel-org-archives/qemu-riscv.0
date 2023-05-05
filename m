Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puvHa-0004dP-9M
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 09:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvHY-0004Zc-Rd
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:15:32 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvHV-0005Pn-WE
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:15:32 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc075d6b2so3376574a12.0
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292527; x=1685884527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UJfpiI/BusVIoGn22BVs1aP0RIeUKUfatkmR/TQCDxw=;
 b=vKMG8Q3RdXfgKfEJw1opUK9Oa2+2gv6MxQ/ZVAKbfMW40Z7riFuKFev+D3GH/GjJfp
 NP6n9j3vX16W5w+uxnbuv4G8jxOkuQcXHjZlhrJAtU0e9oCQXkQsuvJOBCnWqwNuHvLh
 F9C5YeRirypXubGtLiB1vz6IMGPVpD89G17HqEReXtg/XmBNAJdQLSGSvbmKFA071wD8
 djiZ3sztKubkardC5LMgUwT+/XdXL8ULkb/hjNMXdmTDCb5nk7IO2U0CrTeGnov8/qT2
 JPCiGcZTavAWFpyNGeBSgaoGudLuVCq1iouvvc69O1r9z8yRvlxItX07S1rfwsa8AC3H
 Nj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292527; x=1685884527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UJfpiI/BusVIoGn22BVs1aP0RIeUKUfatkmR/TQCDxw=;
 b=MHvctp6Qxv9nZEviSa04BxmicULBJGE+xq6R94w+kSWBw1B6TaY4mL/3gbRvWBAh+h
 4eYfQkgicIdIckUao2vs0vANYV8UnhpzKfcAWFpT6ntjnCzSONqikhqySxiNQDHUA8Az
 /li7KfRdLUcv4yJfH8QP7BMj62DSBMhu7v8dzEjdEr9AobyzVtMCt50qbC5nvGPBC5y/
 xWEfqQbYFWaNm4dV09lP/k4CzCmWGg6Cm7N9D7tKdztaUEuM+q4yIlGKuSMKuE6QhmE2
 LHSWy5fCxJJvgGWre4N2Zui/k7DpYTt+hyXLFf+q8RAc3T+5xBiJocDPA0Zr1ZBy3b7J
 fXWw==
X-Gm-Message-State: AC+VfDwSxW4lvHaNDmLt8PvgoXKTzKogqpfQCbKMHqmJTOahHoy8tJJx
 crMcU+LTH+SvngOslb5jLaD8+/EzKsvzBzwzJDhnxA==
X-Google-Smtp-Source: ACHHUZ6ibs+//7vJTHSF7xMiLaFT3gaJ1fMdadKcVsuytYi/5kxw6KqDqmtsaoW4amxOak/zJCIEMywvtxBlwDCXao8=
X-Received: by 2002:a05:6402:1343:b0:50b:caf9:4b85 with SMTP id
 y3-20020a056402134300b0050bcaf94b85mr1278854edw.18.1683292527550; Fri, 05 May
 2023 06:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-45-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:15:16 +0100
Message-ID: <CAFEAcA9a8L=FgECxpdk=4N9Uu_p-Ah=s2wa5bLsEebX6oijC+g@mail.gmail.com>
Subject: Re: [PATCH v4 44/57] tcg/aarch64: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-List-Received-Date: Fri, 05 May 2023 13:15:33 -0000

On Wed, 3 May 2023 at 08:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 38 +++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 18 deletions(-)
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

