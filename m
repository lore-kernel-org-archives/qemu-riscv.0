Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puvc9-00057S-Se
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 09:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvc7-00056L-Tc
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:36:47 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvby-0004NF-27
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:36:47 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc22805d3so2753468a12.1
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683293795; x=1685885795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yHnlK3/J9vA42bspGNYsFHRqnY9V+IBOeoRMFxL1uR8=;
 b=rx//uw6FEWFZ9JiYZR2qlBMYfEHo03KXB7+P01GDnnldV+moGhsF/3x35SqGd9z3DY
 PU3Lug66/vKO1zMg3hvXbLRJlbXuRBJv9FTuzooRT82T32GiLJuuov6DNDBAPWpXYZNq
 CkwD5mO25jjLs+gOYbiB3cCcpY3e9IFF7xxbPL1qc9fxpwqq5iNoOz4dLPS9yWBXT4JF
 W4JsWyFnElHhhELdH3ehnoYG85Vh9pejJMZKTGJvyFZH6djzNQuEbDQ9rmNGT+H1p0xP
 smicvlWBoMdrTwmrg/vWAVslbG/LOe0xa3IxszM2FMU1dVP4IaeUJMhM+s+z2u1tlTsn
 bDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683293795; x=1685885795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yHnlK3/J9vA42bspGNYsFHRqnY9V+IBOeoRMFxL1uR8=;
 b=CnjTHCMiNeynHUxfnYddApsyhj2BGvWeEi8UP/QAwhfgcO3Iiz8UC07XeuecVyRaue
 NhnX5A8r2e4hmEshJEE+C6rPCl7M2NNG64lLzaVvod1GI+E2k6PpSeuMgJUnF9G6tEDt
 njr8t3PyTFyLCHwQlRaiW75Sf7ieI5afRnzcsi9QfRBBD6rhb7ewssKW2nLf4nm6uljX
 iB5Lo4aIEOzNvdrUOonmv1/ix8/iAtqVfSbpzHmMbGrzdzsx1FQJWY3zCOX8wdTdDC9P
 1gVfxNFzLhX0M8rAhg6YOXv861ivplP4y1SrVe70Fvr8JndMQRPA/Wpaw4aM9TNxF01k
 DfAw==
X-Gm-Message-State: AC+VfDwCr/OTEg4JeFsnT/rJ9N9iLIL25c3kzvgk+8kt9+BL+c6E7OQx
 Wl/4U4J9PY5+mcFQKgNCxEIGgp/DjNvz02zk8Zknxg==
X-Google-Smtp-Source: ACHHUZ5I5CkON9eMVXcoj/794f6VtZjYZpg0AiBhWIXtFFud6/LuIjiCh7eXmzv8d5Ux1Jp6U8cx5wcTpSpIDaX47Yg=
X-Received: by 2002:a50:e601:0:b0:509:c10d:b53d with SMTP id
 y1-20020a50e601000000b00509c10db53dmr1575897edm.23.1683293794708; Fri, 05 May
 2023 06:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-55-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:36:23 +0100
Message-ID: <CAFEAcA9jskOmO3GNjnGqs_PUN_H=sFYUHywWb07Mx-AfHUGueA@mail.gmail.com>
Subject: Re: [PATCH v4 54/57] tcg/aarch64: Rename temporaries
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 05 May 2023 13:36:48 -0000

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will need to allocate a second general-purpose temporary.
> Rename the existing temps to add a distinguishing number.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

