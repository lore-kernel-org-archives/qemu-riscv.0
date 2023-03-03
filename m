Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYARB-0005i4-09
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAR3-0005Nt-4L
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:47:19 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAQx-0000jc-E8
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:47:13 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so3183918pjz.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+SIMPEwRhLB0F9/Y03oPnThC5qqtRO8qJVAcuzylTDQ=;
 b=pj8EIGbrSe/n0I+x96yXQp+vA/DQ0jch6GAgYgTQbJPZSykJnmS5SgwOj5GuLiJstP
 3O/pIo21PSf6jDuWH36OK0/97WwCkmTpPRTIP0/bPSnivdVx9W5R1gjtjnE0l8L2wl4E
 wPPWAtc4+9Kpx8buds+ieWRJqpHNUJGLRNZm6HEF9g/uD/GOchW91et/UMB97xlt3urA
 gke7MY9t82UKoEI4555MYag77pEoVwis6wVmzxDZJVThOLONShXcGhDCo/gkKFLIKdf0
 WjU9SDwboNtytfy//g95UAsBrhrFroeNVi6wBMSgWwr307gmGHPAl5di40ITYM1vHEC2
 0ULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+SIMPEwRhLB0F9/Y03oPnThC5qqtRO8qJVAcuzylTDQ=;
 b=5ry+VEybUwaKdzpD3JJRvwWse2Pg8H8z+o2LhY/I2syQwbo0dQs2ZvnTSIWhIOzVem
 48GyuVT/pUnZj3nz74OuSNy0OKHb59hmtEGHnp8tjMIFctmc4nbURb65DrRdS7XdpbeS
 65x3vzn04PTVeo4xgO0Mv9yiaNGuFQOcI/8elRrsQo9OxDCRkWNQlQRUdjZ51WrfayBM
 4H6Vr97EXuCyCr5HJRMSJAuY+zZlZQPhtFiBszqS4LneIZp55EUo8TlV7HkyKTX0UWkK
 WmwNFZS6Ubl3wNFyyZGqXiaeL2sGiJDhwnYfpDbEx0JkPh9xdURh/ZKQS0dqV/4wGCC7
 xJwQ==
X-Gm-Message-State: AO0yUKVBRP9xcPEOgfStlltCNL9ho4d9OzhU/XJhua5ysABoIu0Ci2N9
 ZK9biOnAw7KxrYY/tm7lbS5AYXGJJbtJaaJyapkCcg==
X-Google-Smtp-Source: AK7set8QZa3mpn/nJ0yJjMV8Wtmf29eqDOyIlH1rIMXhXy09Q6oK+piANgTHVo0TVxVz0gjcbSAqcRrXu8ac67ukiBk=
X-Received: by 2002:a17:90a:a888:b0:236:a1f9:9a9d with SMTP id
 h8-20020a17090aa88800b00236a1f99a9dmr2833482pjq.2.1677869229818; Fri, 03 Mar
 2023 10:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-23-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:46:58 +0000
Message-ID: <CAFEAcA9Mv=CRWmQUho=HhRmVBcZ9w5cqry7LDwyLnEHWt3yOQw@mail.gmail.com>
Subject: Re: [PATCH v2 22/76] target/cris: Drop cris_alu_m_free_temps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:47:19 -0000

On Mon, 27 Feb 2023 at 05:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c         | 23 -----------------------
>  target/cris/translate_v10.c.inc |  4 ----
>  2 files changed, 27 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

