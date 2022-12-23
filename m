Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8rfV-00014r-DZ
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 18:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p8rfR-00014B-82
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 18:41:33 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p8rfO-0000As-2A
 for qemu-riscv@nongnu.org; Fri, 23 Dec 2022 18:41:32 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bs20so3639019wrb.3
 for <qemu-riscv@nongnu.org>; Fri, 23 Dec 2022 15:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5gpahDuJWUWdaHB7Nl9lRsGkTTBRbFH14rQ90vY17Ws=;
 b=leq/XOSsqU3H3pWFPfCLChVmN9OPPKvfNtJG8JIDYYGGcaDOueZ56Gh4uB51WdW87o
 rjTJVLa4eQM8evhgL1wv0brgJKNlA6riit3qB34PB/iUvjJXFQ+XILoPhLu7K4TZuXT4
 eCMUogTdRYCI46Ew6Nz4INVRW/N4UM0Xbxg+1YszZICgjoBMwhWzAxVOS/x+9GdpguI4
 jk6QNYPQyMmqM5R45W4nvxpiM+n3EcxtO8zardKytTkiO39HpxhDXaGZ3/dd9jRD2E9X
 KdEYLWAuytLCaV2LEF4mpoxrJCTkp9FLAh7uX0MfIARfzqRr1APyGgK8iU1ou/jD6dLX
 PkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5gpahDuJWUWdaHB7Nl9lRsGkTTBRbFH14rQ90vY17Ws=;
 b=bOLouI5rCsxeJ4Tre8TX5Fg0qxbLvN4IdAHEoBNVBQXD0Bm2reN2eAn87JH2M8CrNc
 uXcENViVLM2vcb4MrQdy1Oah47aDJbG2qDS1hj93KfbPWmTEZJxNCypy8RDDY8z/tjJ2
 nNexBPtwA0z+Vo6jD3BsXAgukSh2z/XRu8bcIK/KrQtvemrfzeeV+tGFAHieZOhkn8fC
 q5VdiPrjRvqvfGYl9hHMYoXeDQ6Pkh8nRFZHYvi0+3VdzpkRfFR4kjbvB6pBfkqSt9Ub
 6GLXZoBKr89mIvRzszqrWsryEuTRisH3MwnDDfJRy6kE8F6wMl606Q2SnY0TrQojN/FA
 EtfQ==
X-Gm-Message-State: AFqh2kqIXv3CEdSRiidScq7yniC9drK9UKpk6m4u/EqCEjdHjeudeKW6
 8WPsvc39zIIYvbgAzQkFtvVXxQ==
X-Google-Smtp-Source: AMrXdXsWPKlA8uq/kEblFcIK2UwQ4uD5wsx56+qqkzEYhjxfD6w5PTOmg6o/0QflIrYbN3R0GSNfcw==
X-Received: by 2002:a5d:4b03:0:b0:254:1039:a2b5 with SMTP id
 v3-20020a5d4b03000000b002541039a2b5mr7044350wrq.54.1671838887863; 
 Fri, 23 Dec 2022 15:41:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adfe704000000b00241b5af8697sm4172574wrm.85.2022.12.23.15.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 15:41:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 959141FFB7;
 Fri, 23 Dec 2022 23:41:26 +0000 (GMT)
References: <20221222120813.727830-1-armbru@redhat.com>
 <20221222120813.727830-5-armbru@redhat.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, laurent@vivier.eu,
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, marcel.apfelbaum@gmail.com,
 yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 richard.henderson@linaro.org, deller@gmx.de, jasowang@redhat.com,
 vikram.garhwal@amd.com, francisco.iglesias@amd.com, clg@kaod.org,
 kraxel@redhat.com, marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, crwulff@gmail.com,
 marex@denx.de, Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 4/4] docs/devel: Rules on #include in headers
Date: Fri, 23 Dec 2022 23:41:08 +0000
In-reply-to: <20221222120813.727830-5-armbru@redhat.com>
Message-ID: <87cz89y9g9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
X-List-Received-Date: Fri, 23 Dec 2022 23:41:34 -0000


Markus Armbruster <armbru@redhat.com> writes:

> Rules for headers were proposed a long time ago, and generally liked:
>
>     Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
>
> Wortk them into docs/devel/style.rst.

nit: spelling Work

>
> Suggested-by: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  docs/devel/style.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index 7ddd42b6c2..68aa776930 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -293,6 +293,13 @@ that QEMU depends on.
>  Do not include "qemu/osdep.h" from header files since the .c file will h=
ave
>  already included it.
>=20=20
> +Headers should normally include everything they need beyond osdep.h.
> +If exceptions are needed for some reason, they must be documented in
> +the header.  If all that's needed from a header is typedefs, consider
> +putting those into qemu/typedefs.h instead of including the header.
> +
> +Cyclic inclusion is forbidden.
> +
>  C types
>  =3D=3D=3D=3D=3D=3D=3D


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

