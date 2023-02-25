Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVr4B-0004X5-L5
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 04:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pVr42-0004Pi-RL; Sat, 25 Feb 2023 04:41:59 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pVr41-0004u3-Ew; Sat, 25 Feb 2023 04:41:58 -0500
Received: by mail-pf1-x434.google.com with SMTP id g12so906703pfi.0;
 Sat, 25 Feb 2023 01:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n9JR0G2b3ZucdkbGwObfu+VY6dxMh9dg8P76bEkz+qg=;
 b=dftx+a7bIINEPC8OetyB1rKFZZJESBW851fBnIlnfzyYOfOrhWJ7xtlvaNz8MU5/6C
 HM2Txhf7qp3Sw+jYdBnTLlNmFYDtY3lRabQhqam9gJY0hqxP/moxjDiThjT+IbO69i1N
 DN+jakWabO5mqE+UweAREA5NfdFrvMTdrk/Yv7fhEaLrFyQ33D1FhBeAaUpY1iMUAcFx
 MU9b3ns8OYIGwmsAur97wCsJyBM0Sc6RWdE/cD+Vpte+trTsIJZbC7tZm51AXDI4Tsrr
 tVPEMKQP/hpo47UDF8vqQSOy6q7Ats11x52ZhZY7wb/ja63gggSB7n0Er1jPIAvuQpOr
 9JSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n9JR0G2b3ZucdkbGwObfu+VY6dxMh9dg8P76bEkz+qg=;
 b=efI50/DYs++zdvrYzdL+Fss4Vjbhpv+cicCfFofOokIOKHQuI2qwKVQqtP5ouRTmZE
 1qNG6qW7bOu3wf1kQCKAsSb+QUD4qeTFy4PKLSu02/fuB3SCa/6Un8R4AL2UKi3ebkqW
 5XXg+L22QgY3GC4iPBxwKmYyiW55aUEQgyT0GIZ53htS06uSLQMO4mlQAUxwxz6Pd5uK
 XWkos4dl2bqhqW5R/A5nR4xiAHCw4m8TpjfndK8RcRBzRsP0iZzUxvfKD+yfey0GJZso
 rezenZ5h6h1+UQoZY4vHNdWoIS5YsIVWxxOE6S0AyA97Q1TH3/adNfltZIFvh5/bbFOg
 zg1Q==
X-Gm-Message-State: AO0yUKXj6WQpiEXI8gPW3JJ3T1drqTLUM6NQF6PvsJDlwv7fWSMvIhYl
 8NJv6vPaiShg9Gzdm41TaGKxic/snpF2Inb1pMQ=
X-Google-Smtp-Source: AK7set+6fsCFm8DwNMkxd9P9lWDy9b+9lMk2YpTVPYmmEAOCIMQMe9YDoBDvm+WItqcg298oQmM5qqEGFQMixgiHx10=
X-Received: by 2002:a65:6e4e:0:b0:4f1:1bbc:be70 with SMTP id
 be14-20020a656e4e000000b004f11bbcbe70mr816586pgb.6.1677318114717; Sat, 25 Feb
 2023 01:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-73-richard.henderson@linaro.org>
In-Reply-To: <20230225091427.1817156-73-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 25 Feb 2023 01:41:43 -0800
Message-ID: <CAMo8BfKrkZUkCjGZOGnJ6h-FwE2AMOCJJeizh0KBmXCkN0z4EQ@mail.gmail.com>
Subject: Re: [PATCH 72/76] target/xtensa: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 25 Feb 2023 09:42:00 -0000

On Sat, Feb 25, 2023 at 1:20=E2=80=AFAM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 107 --------------------------------------
>  1 file changed, 107 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

