Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAVu-0003bM-Cp
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAVs-0003ai-GA
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:52:16 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAVp-0002vB-Ts
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:52:16 -0500
Received: by mail-pj1-x102c.google.com with SMTP id l1so3553083pjt.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tp5TZu9VT6ivsJzAdWz1St/BEwsgSK6X0Masrs8K4dw=;
 b=ej8U60bKGtWB1JksTNw67/kpFGq7l43FsffPZYsDl6JYfZRsikMWs5kHdQtKRAB1lE
 mWBvgggcGnbY3sdUzQh6Ym0bJS2HIBV+JPwdfA9JLb1vjyTS8m1NJB+3+NHpYZ3TbKrL
 92/E2O+BGJG7YgbZkHNIyq6soJKmte3XLoV/VOjA3xQQ+YqzbEuWjniCUYaZl5+3R76u
 Jd0sGEx6mF1ttR1qygIO9dZSlQHEy4hipkF88+7HQeRe1jyEppF6pD4mwLzIQrlHvrUR
 7fS1dWxlhyMrxk7e/sYjl4bRsz5iQFRAc6fO9UJB+HEe5rTe37PwGGh8x+gecYf6ITAm
 iQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tp5TZu9VT6ivsJzAdWz1St/BEwsgSK6X0Masrs8K4dw=;
 b=6vTqKkT/s7rAsQpYO317stDtxFSsUPsU5sPGFvxrULkiOJXqrhP4AIKkPI1VFP5UPO
 kf4JMHGadQOOWF9CwdVFuT3psV9WTveZtXfKoLGHlfuhcvNXcSVeaZveCjdKaa58PXwn
 lXZutPEPwEYxMNzOLJ+ZTecADhHYkPQplLTWW/QgcsVIzdf1z1Sdy/Rr/FOb2aKFQx1q
 7Uv1XZMzCvMj9O8LH8EQTiAL+QGgCc+fIiMiD1U7WUitYnh2sK4kbTPN82tXxa3PAvKt
 X0IWRUWedv+ZvJrNlmioPKQxsjCTzo9LD05fadTo4R71CVpRZH0/DJafz2armneyyYfz
 BUPA==
X-Gm-Message-State: AO0yUKVtu3C+97b8YKmkC5BDC0rlNFqfxKmZWiWSrQ2rJnbMstOMTIGq
 dA2KLQNJISpO5HWPSVMGUcfHN6/rbfgCgijW13YqZw==
X-Google-Smtp-Source: AK7set/cYuQvB0F20WedOYE7EKrfHNg8zTg/kCzYAB8T7egzM05yQqPSpyaLg9xmf+m41hbvNJ5o19/QjiNEu56yuCI=
X-Received: by 2002:a17:90b:241:b0:237:ea76:41ed with SMTP id
 fz1-20020a17090b024100b00237ea7641edmr1012358pjb.0.1677869532626; Fri, 03 Mar
 2023 10:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-50-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-50-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:52:01 +0000
Message-ID: <CAFEAcA-z6qz=w5uLySG=F_OQ7MEJnJ7_K=Md9-GTYVvtC9t2Aw@mail.gmail.com>
Subject: Re: [PATCH v2 49/76] target/openrisc: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:52:16 -0000

On Mon, 27 Feb 2023 at 05:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/openrisc/translate.c | 39 -------------------------------------
>  1 file changed, 39 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

