Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puv6J-0008Ea-BY
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 09:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puv6H-0008Dl-RR
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:03:53 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puv6E-0000V5-UH
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 09:03:53 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bcc565280so2651468a12.2
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 06:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683291829; x=1685883829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QK0UNd1kfN5wk9V/fPAD3tDqlCsRltY13R7aPYZ4X2Y=;
 b=Cl2m6Az2KltcHV1XfvlnGq/ZHdEpc2EZkBm0svA8i4altuHb5WPMKZhhqoLafDs2x6
 umOhT6Zke6O69Dt/5N96UHNuqo80xvKTZrf3oQOkGgRGCOa19VUNk6Hct0vZKSSNfdr3
 39uFyf/xDKCjk1vnsuM6RwyPa+2oWloo+E/1lINEm9Ic9pl+FVnCyoCi4ER8shPe7BCQ
 44bukearPI7enxmlDQ9LuCJb+vxrDre30LtPsE5WVprZJPw9ujgDGlThKX+napPMtxVy
 GggMLwirfdmHvplqcfmVl2hzJHGdfnH5paLl0nklt7EwaGUrBNjnR43yF3bBrho5Xsef
 4YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683291829; x=1685883829;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QK0UNd1kfN5wk9V/fPAD3tDqlCsRltY13R7aPYZ4X2Y=;
 b=hboyGkS3Yxyk7M3BKndiXxkvdoJsOIwX4CMd/YSws96fRMmFMLN+ObzUw7iYKL6SNd
 43ne33w0T/v71sBtUC8ZGgUHMsGuQVnRfqdvdPzKDZv1akEjIge1yUPgcegvTSDiH3Fj
 Noxe2T0jf1qugbp1fhm6VyZRm0Kw/AF7LcessueWFxOYCZzwJsFV3eg8wFJPPgdYjT8N
 4O6Ilb1GT8D0tE4YUTm18OE2ophvX4+UXFbNr4SwIl7jTymyNm/+YciPKp3767MLcNV0
 8JNAaMB5vYRJaciO785WpQPLuVcaFosqFLmgFgsVKZOWpA0U3EUF9ksdfuNutpHzt4Km
 xRCg==
X-Gm-Message-State: AC+VfDw0YbdV/NVWX9Pu4WyD5qG/KRYxM+lKFJX5NoSVHUwYeoVDfbLY
 c2Z8wZxRfIsD/+LRxI71fXZRYFlGSH9sTQrirrHhMQ==
X-Google-Smtp-Source: ACHHUZ7PuEf6IbBVOSjl/QQkkB+MHYmJcIqIW9Rky4DR4JvisE6O1YZltaO5GIZP1Asmv4abzwyvDXdPmMKSy1LowiQ=
X-Received: by 2002:a50:fb92:0:b0:50b:d270:6b6f with SMTP id
 e18-20020a50fb92000000b0050bd2706b6fmr1527638edq.4.1683291829189; Fri, 05 May
 2023 06:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-43-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:03:38 +0100
Message-ID: <CAFEAcA9Auu565OavkHTxYyhtLviTPE_XU34ien7z0sb-r0ZQ7w@mail.gmail.com>
Subject: Re: [PATCH v4 42/57] tcg: Introduce atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-List-Received-Date: Fri, 05 May 2023 13:03:54 -0000

On Wed, 3 May 2023 at 08:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Examine MemOp for atomicity and alignment, adjusting alignment
> as required to implement atomicity on the host.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

