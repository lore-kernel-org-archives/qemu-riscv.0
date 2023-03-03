Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYAQb-0004eE-BE
	for mharc-qemu-riscv@gnu.org; Fri, 03 Mar 2023 13:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAQX-0004bw-QP
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:46:46 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAQW-0000fP-AE
 for qemu-riscv@nongnu.org; Fri, 03 Mar 2023 13:46:45 -0500
Received: by mail-pf1-x42a.google.com with SMTP id z11so2186497pfh.4
 for <qemu-riscv@nongnu.org>; Fri, 03 Mar 2023 10:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869203;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/txNBzKUNPlIfCBCAUqq4/5RrscUJOndhFld9L0QpLA=;
 b=N2upLABscZLAgOCnyJh9VokjzNhrtfLlel6t0bLhJlDbxDpQp09e5Or7f3fgj1hydA
 Kvqu9TjlPjiagkovIOTMby8R3dqehIfqCxiSmtK9Ht2BNNKaHMuadiASiGn8hawtIrIS
 X7UbjoPLJmDRKWiT9pg0lzgnjtZ3h9NKlKFjcODtQaUf8VDmDJTTpdv/iAdkU/rUf56P
 mKi4+hBmK4O74Yi8CPDDQXnMlfhsQsPDMdaYP/5jyW4GwEK8aP1vOZ4lFRcx27oI+mUq
 f3pX8ccYEd1Z36d0QxAjrv6+Yw5pCP6Yj+PFvcakJUMjVGimOYU8G/SWmpA8WSH7doyt
 dYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869203;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/txNBzKUNPlIfCBCAUqq4/5RrscUJOndhFld9L0QpLA=;
 b=wHcsL69aH6XJqcQaPJY/hjM9o53E6MSyStjlLN+y7JkQRNCZwnX6dwfFTgIJE0SV1l
 05zlwqfw3YVTDpnYtRrP1CDZBy2iWHp5Nq9wx8ZIpVnMkNir/5XrHsYKMNn9jMx4K9zu
 BgqAoeoTXsveXZNylbpN9bUvvIikos7vjY5ecZHCuJ+D4ExC+SEMF4xobewVvCNBnnWE
 kl2wzNmeoB2EmVWSae9ZySzulRR2GYZgStk7AxLmdFkYBYUB1Ip0KLVVM7Ay9QY9qYXm
 E/KS82oZMyCw5szjnAtM4Heoht94kzE49WURWgW0MR6tak5d59G/mnkh749s8nhE3F/H
 wztA==
X-Gm-Message-State: AO0yUKWY7HHfiIv7lg3Yr0nkCfKsj7NXaokhLhKjONsBeD2273lz2Qtn
 nJ+mOpHMbgKUjyBo3QqkbtBodXvNpr0RR+lT0Tu4Uw==
X-Google-Smtp-Source: AK7set9WbtpkawGxYvCFwOG2Y584fZLU+q+7YUgWEFackEpfbfF9dHrwFE3c4uGBsFUj+D4NWOITipwTtvSZ0i5tHuk=
X-Received: by 2002:a63:135f:0:b0:503:130c:aca2 with SMTP id
 31-20020a63135f000000b00503130caca2mr2351271pgt.5.1677869202996; Fri, 03 Mar
 2023 10:46:42 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-22-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:46:31 +0000
Message-ID: <CAFEAcA-44S55OsA=hHk4RJcqctBpnr4nOE=8OupoUk00AXPRMA@mail.gmail.com>
Subject: Re: [PATCH v2 21/76] target/cris: Drop cris_alu_free_temps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Fri, 03 Mar 2023 18:46:46 -0000

On Mon, 27 Feb 2023 at 05:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c | 20 --------------------
>  1 file changed, 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

