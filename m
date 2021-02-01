Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6WSz-00061a-V0
	for mharc-qemu-riscv@gnu.org; Mon, 01 Feb 2021 05:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WSx-0005zq-2n
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 05:29:55 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6WSt-0006Ch-4A
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 05:29:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d16so15930394wro.11
 for <qemu-riscv@nongnu.org>; Mon, 01 Feb 2021 02:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=NcECgKC4E5kMYzbX8u5Nyim/8yrZcGmkSkDVIhQvIjE=;
 b=vIGcD2D/kiaMjuW9MM+K3GzQm4VqHGXXaZeJmaubEIQ2FOTNDtEi3zZTVW26UpJKJo
 4u4KPimFxZq/BgtrLRSiVadMd13bhm80xx1R5j2lJaKbnbVB008z//bq/D/3tWD1vs1U
 Fb0xXKw9m+V0jZin0en2Yw0K5L+C03+X1etP582TJzwHy+ChE4CNouSUGRcXbGDgZ9nB
 ihMNz9KzX2shhbfY9bAcd7yCXDiPLN51XrBtljOuBFuqJ8T96CHpHCDrmbEM1Zy6bqRy
 fMR0iZ2vl+oDYNXiUfaqeb2rsGX4WCcIQZbmwe9W2Ouny1zirHG+vMfQBg/uPdEwY9qR
 co4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=NcECgKC4E5kMYzbX8u5Nyim/8yrZcGmkSkDVIhQvIjE=;
 b=nVdSOAN+D5T6eYERc6urU9+BO9MrVvDXkGAPYMLlsw0Q2KW3L8gL2/0lTFmX7GeLMp
 n/ajjd0jlkEcUuSTpmHCE6/Up9SeTkwW9qRNPJW8xIb2j4ssDlER0YDE7ufW8N6vz7Ni
 Raixr5JxX//7Dj1A3tE0arn1BE8BOQp5a+cX18MOlFCB9fGiWA6zAHy7aQ6BDMeTBBXg
 d1LIRCpLRDrBCUy7cAtcIJme5IKx6IilwYVUj3PY+JIcyjez4tST6SygOvhVYMMXVL5x
 rAYuS1vbNJZkLlPcCASyzIYzUbiEos/nBWQev5hByHIL/eEl1gcg9fmIsTVKDYb0wLyG
 wxtw==
X-Gm-Message-State: AOAM531GbLahZVbyrICfm7+RvUboeC+cLUMkHuTr0AqelhRdg4AnrXKw
 eGqxOZeMcbEu1U94wIT+CBsuhg==
X-Google-Smtp-Source: ABdhPJzKOXOHkyoRivYEN8apkDCKIVhJ4BFOcTxTqqpRZBqiGpXaRZJFvFzdArasgPOeQ4REFOq8/Q==
X-Received: by 2002:adf:f743:: with SMTP id z3mr17577539wrp.165.1612175389584; 
 Mon, 01 Feb 2021 02:29:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f4sm26791911wrs.34.2021.02.01.02.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:29:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF20B1FF7E;
 Mon,  1 Feb 2021 10:29:47 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-4-f4bug@amsat.org>
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
Subject: Re: [PATCH 03/10] hw/sh4/Kconfig: Rename CONFIG_LM32 ->
 CONFIG_LM32_PERIPHERALS
Date: Mon, 01 Feb 2021 10:29:28 +0000
In-reply-to: <20210131111316.232778-4-f4bug@amsat.org>
Message-ID: <87mtwow06c.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Mon, 01 Feb 2021 10:29:55 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> We want to be able to use the 'LM32' config for architecture
> specific features. As CONFIG_LM32 is only used to select
> peripherals, rename it CONFIG_LM32_PERIPHERALS.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

_DEVICES if you want, either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

