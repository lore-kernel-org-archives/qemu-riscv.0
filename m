Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6WHT-0001zY-QF
	for mharc-qemu-riscv@gnu.org; Sat, 17 Dec 2022 07:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6WHQ-0001xH-K9; Sat, 17 Dec 2022 07:27:04 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6WHO-0007uF-Ui; Sat, 17 Dec 2022 07:27:04 -0500
Received: by mail-ej1-x632.google.com with SMTP id kw15so11850601ejc.10;
 Sat, 17 Dec 2022 04:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8aRbhXy9tIzrGl/bEMD2TEHuE+lr9h8q/D7habQUvi0=;
 b=ODYAirCg+VwrcNaTnOqr9bW3U9Rnax75L6uWISGLT9MezMslDqDg/5uhTk8OSvYIi+
 YtU+tQ2RO0EPUsGA9pHL82Y/wiMfWL5PTIAKf4/BdlbvwmdMzJEQLT97bDfK7TVFRetM
 HqDUKoxNJHcmE7pwuz9uqqvcmYaVI6XB5uiIrVXAERsHUYUuOoKYIhiFwTBqsL1QsE20
 8mazR9PRgIA+Jteks9uevZlzmjBmFu9eOdlJ6b/02UqjS7mjzJe8IHMFUyVGTAfZ8nQ1
 SiWFCd6b4yRRmYXTQTgrjIGGQWE/F22v0jl3W6l9O4ZIAOu2zDwbaDYfz8LGltp5fCc4
 GBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8aRbhXy9tIzrGl/bEMD2TEHuE+lr9h8q/D7habQUvi0=;
 b=o6ItaVw6HpIkkoT5GmQywNZIGlx+iXrVfP+S6BWapN1RpVZUQrD5tOcx/bWooMqRBF
 ZX7Zt7h2V5xdyyihzAFpmCAX1Yye88wA3Ek6wEibI0vnpixoc40ufU68EfpHg0l/4tfg
 I0cY4zkIHY5YR78Cws4QcDEeinXEbBPXM9dW9k7JizxiJbTGfW89XK7c4ZTfgTfHIzVx
 xARmxZwYgYEQgjiyhi36ULQuI7Y43JaclL4+cKQrtofSRai/Cv3CKclgr7pmRP95i4d4
 e5URia80PDwX+kuxZZXoLk1cno9fvnocUSe5/mJmV76DB15SWSSyNRpdqp0rU5edVXUu
 u/8w==
X-Gm-Message-State: AFqh2koUmVyZsJDxEj0EU2PlZoKUtNJ1rDc77Smzbtq/Y/R5aqAI+gOz
 4vaBgr2WA5V38I26VCmoTlVXFBVWZrA=
X-Google-Smtp-Source: AMrXdXshT7B94nqh9ixHiZjpkriJCvqkuWTVrd/ilEekEGT7SyMwgMasaudTeo1QP1jyRG2vwgmDQQ==
X-Received: by 2002:a17:907:a092:b0:7e6:bae:fa0f with SMTP id
 hu18-20020a170907a09200b007e60baefa0fmr5101064ejc.58.1671280020015; 
 Sat, 17 Dec 2022 04:27:00 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-115-237.77.191.pool.telefonica.de.
 [77.191.115.237]) by smtp.gmail.com with ESMTPSA id
 ux12-20020a170907cf8c00b0073c10031dc9sm1913855ejc.80.2022.12.17.04.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 04:26:59 -0800 (PST)
Date: Sat, 17 Dec 2022 12:26:53 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_03/10=5D_target/loongarch/?=
 =?US-ASCII?Q?cpu=3A_Remove_unused_=22sysbus=2Eh=22_header?=
In-Reply-To: <20221216220539.7065-4-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-4-philmd@linaro.org>
Message-ID: <58744897-B124-49DA-9EA1-79403F319038@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 17 Dec 2022 12:27:06 -0000



Am 16=2E Dezember 2022 22:05:32 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>Nothing requires SysBus declarations here=2E
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> target/loongarch/cpu=2Eh | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/target/loongarch/cpu=2Eh b/target/loongarch/cpu=2Eh
>index e15c633b0b=2E=2Ec8612f5466 100644
>--- a/target/loongarch/cpu=2Eh
>+++ b/target/loongarch/cpu=2Eh
>@@ -13,7 +13,6 @@
> #include "hw/registerfields=2Eh"
> #include "qemu/timer=2Eh"
> #include "exec/memory=2Eh"
>-#include "hw/sysbus=2Eh"
> #include "cpu-csr=2Eh"
>=20
> #define IOCSRF_TEMP             0

https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-09/msg02628=2Eht=
ml

\o/

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

