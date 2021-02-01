Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6WS4-0004Vu-L0
	for mharc-qemu-riscv@gnu.org; Mon, 01 Feb 2021 05:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WS2-0004Pc-4P
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 05:28:58 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WRy-0005du-1C
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 05:28:57 -0500
Received: by mail-wm1-x329.google.com with SMTP id f16so12143752wmq.5
 for <qemu-riscv@nongnu.org>; Mon, 01 Feb 2021 02:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JwTn4WzoMydrdklxTHj1fMbf6umpjkFoaoU7rlX4/7I=;
 b=sb9jKvCMu8zczYxsyRq02LBBti/ZOdH5Zwm3f4LD/HySVWzbn5CZ8DcEkI75DEsZCu
 3uJDhUb82cZy5Q89Bvkxv8STJA05I7pthmCvwP8C+tooJiZBXM+J0MQpKODXv1a7cP41
 xDIaCA7AhfsR7Ubos9t4Kehvn/B/B/otolc3khYTg2PYgYDM130LE0tMmtzhgw7V9Lng
 IcHlCE5o+/s/cxUpjYK7jvPHsCNUiqtaEz4+CbcMvHg2w9rkfbtGZHX6UUfPV4GP9GTa
 InAKMaHzZ7OcIMw0SM+KEq2PiF5Prio0S4z2h3S2DOEsRf2PDEFL2A+wNo5xnFagfdgv
 ojbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JwTn4WzoMydrdklxTHj1fMbf6umpjkFoaoU7rlX4/7I=;
 b=F2CJcINuz7ZRgr08HrIv/kVE5Dq71F+fOYaoxLpS/hOru6imiUUd8aRAjORuEUcayT
 IYabos2Qv6sMfcyK1GPCiDl5K78Z9YnUDKn8t9wQ8aea5+Byrb5rLiE9JXMNlTvnbK7z
 Pjc12ugCD97ebyU6wjnbi9FulVrUim5GU1C0ihnr0G0fnbdBd+bS2X5vrsrHZ+B7C02Y
 tydgrtpjAZUggUa1S7ZAmYMeynULquofAQEtB8dw3pP5ArsfkdnKxH0zNcOodvKa1x16
 fq9ml0PuIOZqG+qTxUdY56oJgBw1gYZjvjpeoXK6MCG4SZ1enEFbuAZPXeVPnifGzdsB
 UW+Q==
X-Gm-Message-State: AOAM530mq4oXdTv9MNtYRWkC3T7Gt2kE5IizHKOjh7CLSWdZuxv8FPA/
 Cz4CdVh+FkT3GrWzywB9ztH1cw==
X-Google-Smtp-Source: ABdhPJwl3fFzG7nkZmHc4chDesPBwhjVp5hsHJfAWjAqUQNDmaCHfGwDeOnlgNadntyr/m+LW2Ciaw==
X-Received: by 2002:a1c:9cc5:: with SMTP id
 f188mr13983865wme.171.1612175332590; 
 Mon, 01 Feb 2021 02:28:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v25sm21131150wmh.4.2021.02.01.02.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:28:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC81D1FF7E;
 Mon,  1 Feb 2021 10:28:50 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-3-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Sarah Harris
 <S.E.Harris@kent.ac.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Anthony Green
 <green@moxielogic.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Chris Wulff <crwulff@gmail.com>, Guan Xuetao
 <gxt@mprc.pku.edu.cn>, qemu-riscv@nongnu.org, David Hildenbrand
 <david@redhat.com>, qemu-arm@nongnu.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Michael Walle <michael@walle.cc>, Greg
 Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>, Cornelia
 Huck <cohuck@redhat.com>, Marek Vasut <marex@denx.de>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, =?utf-8?Q?Mar?=
 =?utf-8?Q?c-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 02/10] hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for
 lm32-evr/uclinux boards
Date: Mon, 01 Feb 2021 10:28:44 +0000
In-reply-to: <20210131111316.232778-3-f4bug@amsat.org>
Message-ID: <87pn1kw07x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 01 Feb 2021 10:28:58 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We want to be able to use the 'LM32' config for architecture
> specific features. Introduce CONFIG_LM32_EVR to select the
> lm32-evr / lm32-uclinux boards.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

