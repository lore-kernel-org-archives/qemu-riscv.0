Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puswo-0004AP-CV
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 06:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puswm-00049I-8E
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:45:56 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puswj-00083X-DO
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 06:45:56 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso2853798a12.3
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 03:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683283551; x=1685875551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E7xonDZGDCeV3oLF8XSfgab3ZnmrIzSTPzUuiuuyqYM=;
 b=zu94BxhbU3+mUH/3bX0rj42w5l+H0JyLnTrAh7man231kBQsDRDWj7/gwluGyI0Ssf
 6jhMSpAVZYNmj/DkAt1s/kcWDjVnbPnUG7of+dMy5VGaF3MdGnj7tgFtLdpmfNcmOaBH
 NxkO18ZCwaxkdq30/vaC5oyJopeZZxNiqGtkMT1yBf/YCIKKHgG09SK5/4J82dLFfMKL
 lBkOHzRE3dm85NKNkcKhLuBrE9aeVz2bO6svPXWGvJHqMROPvQzqqmxHlOn5iTCLpgRZ
 rByTvf7bx3RC415MUJybWKyHDClLrOC/XzvIJ4SjNvwSHLHnqLBU/0Tmd5rHbSQLdXUD
 TXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683283551; x=1685875551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E7xonDZGDCeV3oLF8XSfgab3ZnmrIzSTPzUuiuuyqYM=;
 b=X08xw8UGGlt5QOe6/Y4REG4BDECbFmcjVnXd7tNbDA//UvYboQLE2BL5hYx6afI+f5
 0cBrvMFQ0bHiAYXwL/FarXNVi2gDozCwGz45NiZIZrz2rktBzmiDXwKygMsSROiu/dfK
 Jc8buR8WO/wtt97VQSLbJ3JoYRY3RbnEEm5YU9jTUUGuJZTlaJT+8XRlFttAaU2Qt7Gg
 mZlWvmGCp+dKyNqmfKXr0G+w2fWuTKqdvZXLZ3wbxLXzvFvg0HgQXQdmRl/dUy9fHT+y
 iSST0SZ+Z5iH1sTb5Iht2JY7WrGcFLqixeQZ2yJnTd+vexSLlxjmDNhlsHDSETlNXmPT
 tGJQ==
X-Gm-Message-State: AC+VfDzC5+ClBm2hzgxSvgejrGB1dzhGFvMYrCVyeVwDSOABfF0Kf8Yq
 oyqsSJBztfh0uvBwhTX0rhrPxswambihrb/SDksynQ==
X-Google-Smtp-Source: ACHHUZ7Np56xc3y1xd/Fmy7MgJ1/IXze/y4NKzCQnsQSNosYDWoWx9VmvW2ERpXI4HJsmzCiDehylEIOsNmogsL8fSQ=
X-Received: by 2002:aa7:d355:0:b0:50b:d5d1:7409 with SMTP id
 m21-20020aa7d355000000b0050bd5d17409mr911227edr.23.1683283551476; Fri, 05 May
 2023 03:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-21-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:45:40 +0100
Message-ID: <CAFEAcA9finDiFy5c3iZvUNuBdc=3GSp7jAUk6_gfk7=0dVFUsA@mail.gmail.com>
Subject: Re: [PATCH v4 20/57] tcg: Introduce TCG_OPF_TYPE_MASK
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Fri, 05 May 2023 10:45:56 -0000

On Wed, 3 May 2023 at 08:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reorg TCG_OPF_64BIT and TCG_OPF_VECTOR into a two-bit field so
> that we can add TCG_OPF_128BIT without requiring another bit.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

