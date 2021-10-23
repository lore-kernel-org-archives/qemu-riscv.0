Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meL7B-0004jB-BQ
	for mharc-qemu-riscv@gnu.org; Sat, 23 Oct 2021 13:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1meL78-0004ii-6q
 for qemu-riscv@nongnu.org; Sat, 23 Oct 2021 13:47:26 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1meL76-0004Fr-5Q
 for qemu-riscv@nongnu.org; Sat, 23 Oct 2021 13:47:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id r7so2033439wrc.10
 for <qemu-riscv@nongnu.org>; Sat, 23 Oct 2021 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=x3nJx3i/ymRaIWbAmzYiDl5l+/PUnvso+x4f//vgvyE=;
 b=arl96Tl8cBVBWh1L+s3/wpFgY2dgZG+CBSY8mfYYwBzykp3sbeSUCGzMuL6oPIzAW6
 t73k2bGZOpbw4dnJFxNuK6vzbkZ9ik79Vo1lRJz1WMc79Y/FbtYQ83qapxH46mv8CuWH
 5P9MPBpC4OIlCboI4ugHG6YZJyRUttwp71h6N8HUd5FvbfiG8XaojbAL+UZAuGVMdX0a
 lvFfX7EPz8EfV4Nso/Xv2XW63wR2wOp1DZwK0hkKuYk7JrE1dVxqmY6iTYfHQipRDEU7
 aKIOXM+QqblTDBzGtlFV0yqDA824wmoN/M8AD6IB3zwZ8JI8cnb0vygKUP5jjykbVWqV
 CcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=x3nJx3i/ymRaIWbAmzYiDl5l+/PUnvso+x4f//vgvyE=;
 b=Fugdeaxs/J+kAsA/cVtbaJ/0NrdSFLCSih65whubJRWVVvGa72vf+FGJplBsqMkbKS
 cJnM1J8OLZCUKuDeMq3XPTpJPpJvf+otQzP4U0NQuzxz+qktfFnZNeTxn++vHzLW8Kte
 Eg1KacRyNX6P+Hxkje+yA7DjFUdI4c3UanlEsw1jSE74lnIf5cXwd5A1JVAUzbs8S4JF
 /3heNW01+m27HE6CdlqazWQpqx3+jztymIT8Cd+Dcyppg/bccu8iZ7G0lIlnYDPXUtGG
 50OPkzOuVhBXYQO7S50DiNbRmbNezwex9+qUbZcFQMnpb5tWgOrsms/zBevuygQHljA2
 zsPQ==
X-Gm-Message-State: AOAM531+NW83omu4JkBqLqWummxAQ36tseT00RxWYoZWPEuX0hIIMs0U
 6E82wfzLqpfjZbxsYkpcYheTFg==
X-Google-Smtp-Source: ABdhPJxiZ8aDh8jYYKCANU2fAsNXuCwPzZCtt6V2Mlwsc4iFbGDr8sxjzsNLp8OswUWbEB+kRdqpMA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr9493640wrs.84.1635011241285;
 Sat, 23 Oct 2021 10:47:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f10sm12545858wri.84.2021.10.23.10.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 10:47:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1AA651FF96;
 Sat, 23 Oct 2021 18:47:19 +0100 (BST)
References: <20211023164329.328137-1-f4bug@amsat.org>
User-agent: mu4e 1.7.3; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Matheus Ferst
 <matheus.ferst@eldorado.org.br>, qemu-riscv@nongnu.org
Subject: Re: [PATCH] tests/tcg: Fix some targets default cross compiler path
Date: Sat, 23 Oct 2021 18:47:12 +0100
In-reply-to: <20211023164329.328137-1-f4bug@amsat.org>
Message-ID: <875ytnd461.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 23 Oct 2021 17:47:28 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We do not want a shell command substitution, but a parameter
> substitution (with assignment). Replace $() -> ${}, otherwise
> the expanded command return an empty string and the $cross_cc
> variable is not set.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

