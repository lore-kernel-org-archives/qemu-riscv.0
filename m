Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1puuoJ-0002lZ-RU
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 08:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuoH-0002jw-Qb
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:45:17 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuoG-0000jg-54
 for qemu-riscv@nongnu.org; Fri, 05 May 2023 08:45:17 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bc37e1525so3283191a12.1
 for <qemu-riscv@nongnu.org>; Fri, 05 May 2023 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683290714; x=1685882714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNfk1QD5fFBnKIxIsXqmQGResbmawGI2lSHAgxBoI6Q=;
 b=vpLytoj2TCNHz8id3LF61ZPuGXm/ymlzp0eBzjf1Irh3m5gm/mtxcpzsbj9PrrGY4l
 iQnb8TW0U9NGPdV3PmKGJUD/R47K3JfT7OPbLjpkoBlkJrCoxwYxof9IU9QEZ5Oe0v9W
 fSTWvKb2xlxPCzhuPAOggMjnVCvDUZJJO66Klyfopvz+WPGnq6hLnN9/jZGEcuMAkTKA
 L/aOQtd/YtkmNdmjrsGGPoeRD5e2rvyqpW5Vep8JGm2nq8NA/nDncZAuZ9Rb4pvNlUxD
 mxVEu+DS21WS0k83JIfnbuQVkR3W6E1A56z42htiZOv8MIfGUAftNhcgBelBarWGle7V
 jfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683290714; x=1685882714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNfk1QD5fFBnKIxIsXqmQGResbmawGI2lSHAgxBoI6Q=;
 b=WqmoOtoPgV7xesHe5MawR++Y+uc+7nqPpEPazKu5mwMgtu5ejBaTVnuYbZh+H/8OIX
 OgZhbQ6IEV5bZLqHcPj3u6zUq+4jL9124yYGTVJKvA4o7EjWYWCt3iwUfInsq7gHxhm/
 kn/POISSVInf6RuFNVAJ5+KCpfT2UemUzxZFFJym2YGzwu4kjvl2XVomZLmemEU+ec3r
 EOKjNBQKyx20/b1FYx0C0hXwojBbCbnNXoaV8ctRj4khqNvxMsRNmUa+lzyqlkyGsH92
 t/6avK8J6uxk6KjN1HuBlu2Xg+MaigYyGe6fBkMy8OHEX/l71utmGY/clDxagFhAkGW6
 c2Ig==
X-Gm-Message-State: AC+VfDzdY02gDxmMwHBzqcXijQIBhGAX1Wy7Mao6BNDZGyUMPG0ZDqLi
 0DSHKsPJ1hxqbT4qtJ2RWHAc1AQn3A0oUASffUAqymI20nCVe/jN
X-Google-Smtp-Source: ACHHUZ6gkmigcgDPUc7dnh6HZzs9cO8b5iYhmiBh9G4ulHj5/qQC86q6D2GQZkNJW0OH/eKAdWRUVvgMoZyGrtwqWEk=
X-Received: by 2002:aa7:d686:0:b0:50b:f9d8:ff72 with SMTP id
 d6-20020aa7d686000000b0050bf9d8ff72mr1235617edr.31.1683290714506; Fri, 05 May
 2023 05:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-41-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:45:03 +0100
Message-ID: <CAFEAcA9yr-7zDWJkbxEJVBO+FtRcK=TAOw+PMjsK_pYg06zRww@mail.gmail.com>
Subject: Re: [PATCH v4 40/57] tcg: Add INDEX_op_qemu_{ld,st}_i128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-List-Received-Date: Fri, 05 May 2023 12:45:18 -0000

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add opcodes for backend support for 128-bit memory operations.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

