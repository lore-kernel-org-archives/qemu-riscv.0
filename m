Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuww-00052t-Is
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuwv-00052Q-J2
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:54:13 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuwt-000599-Gg
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:54:12 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc070c557so3318384a12.0
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683291249; x=1685883249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gIaB6wxaHA8JX27HckklAFPn5k8+MPI9gGbFFNuzkfo=;
 b=ALsoxFt8FoBKtvQ+ysp7go2iTs5HqNxBNsQd7SrhDCqCPdrRTUsaS2/BxT38BLygrs
 XMVYH8AstKJwtTNyLd8DXrloaC+mqUlfGYvKvwM8ON6PkNwvjkt56jtt64hdzAyOqHy2
 LwRmdo9yq6j1rTYkeF/oiIkNeLmBPE1AyKv4HL6JG6YHkmV5u6oSePsew3hVIdRSCA6W
 s+xbJ0DYB/vHvjsoZ14S7kFYdVjJIGj6HwKItFMGvitnosEvKZw01TVV3aCt9CmnyD8s
 ZwlOVpZOQRvJh6gZiZ/maISPksHSjI/EtVpGfBcIzQ0JcO5yHN+6px3PzaCTvQCbqBuX
 t/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683291249; x=1685883249;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gIaB6wxaHA8JX27HckklAFPn5k8+MPI9gGbFFNuzkfo=;
 b=RrR5uFBRBO1JizzdtKS/8fH+Rt4dEUA9uOpgU+SDvlBdMrs3IaM6ChcbSZoNOuMgtp
 wQ3xujqP5JcJ/Jaz4KwCPLSUACMTu7cEQBxiQyFQaByO33dHXDFZ9XO6Hfzsypx/xs9k
 wCPJtYOPCkzxNwXjqmOz3RcnUqCQWBwx3+7hIFlIYBnLe/+mkgJ0SA+5VhB0o2Vvo/Ad
 wLiWaQM7BSKGoU8W788i5BYK+ogqql3TG8v0mPTDiyPCjOMKSBmmbz3ivZ/SdxpowtRE
 uZBB0HR+bNL/e/Pl4xzOijZV4v2aUZxpya/QKr1qbTPK0xLZp5KmvZjmcp72QtbTFTJJ
 C2dw==
X-Gm-Message-State: AC+VfDyULir9WkkWKINo99BXnYe3feWQ4rAW2uydDdNq+ivVS329+uFg
 /iWH4fsoMYvctzoPcLhF5EVep6l+6UtOfXeVAlSVXw==
X-Google-Smtp-Source: ACHHUZ46J6X4PgQpkAgNX/6du05GIQ2727ddfU09NQhmS69Olk3kB/WuiSJqqJCfFmaE6HRWOhLz6Vem23Of036uEio=
X-Received: by 2002:aa7:dd0f:0:b0:50c:4b1:8912 with SMTP id
 i15-20020aa7dd0f000000b0050c04b18912mr1286060edv.15.1683291248738; Fri, 05
 May 2023 05:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-42-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:53:58 +0100
Message-ID: <CAFEAcA8PfOFt6+VfanS+hAhtugSmXo+V8KQd=z-P8vKFN8WZgg@mail.gmail.com>
Subject: Re: [PATCH v4 41/57] tcg: Support TCG_TYPE_I128 in tcg_out_{ld,
 st}_helper_{args, ret}
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
X-List-Received-Date: Fri, 05 May 2023 12:54:13 -0000

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

