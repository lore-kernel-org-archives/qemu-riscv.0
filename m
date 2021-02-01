Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6XnW-0003qk-JL
	for mharc-qemu-riscv@gnu.org; Mon, 01 Feb 2021 06:55:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XnU-0003pY-Hv
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 06:55:12 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XnS-0004II-TE
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 06:55:12 -0500
Received: by mail-wm1-x330.google.com with SMTP id u14so12385748wml.4
 for <qemu-riscv@nongnu.org>; Mon, 01 Feb 2021 03:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OnTcVhFxVtAZGcp2sDtq2la1CmCDjKQOlS+vEZuYjgM=;
 b=CGRC3A+GzLeScGe85nIxZsYPGKP9DECxpDYHn1q+xbb7iaBudDCnYHMDyi/2XjC2xy
 zSFpAavzvCxEx6i1xcJ3QnSnt50jvvqVd1Tse3B4/xbzn7B212Sg6lVK10aLvk40HH38
 A0ZIMxjwnMmHWkM+1ErcCcKMIQoZDsaDaDZqV+RfVAH0bYdDq1tiiBDfQtCJmvrvWS+i
 /Rhpv1mb2hOE8MLSM6wAh5csIyhe4imJiwMyKg8Hw9AZDoixL7Sz39/BT3DgBfKbxqRE
 SOqqE40s0DXko5DrOSRDR9e0/FXwqSHTWSYnCSIskZmUhHMel5vVzJ1TRPiyuPCDWSaE
 wPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OnTcVhFxVtAZGcp2sDtq2la1CmCDjKQOlS+vEZuYjgM=;
 b=ZU+jLLqJQGkPvqrNJvYQr3t5KFKmiPT+O//eAZs/gWN+x2jk2QrJa2f9iGj+jqzY2w
 rvPeqd7z8RTI/+bONNAvb/fUJLFHQBWafaBHGPDDX+FGMB2amEHjd9qX/uR6cyam6v7h
 YAyhR2/mH07XjFxYrg0AHfHh5X+0TLTJI8CxIqPTMQQc0F5CCyMEXzxMM2zcvfCMjFAM
 U4FeThTCfkSlFTsL61ADjIXiCP1IB9aqte5pvy4SyWu72JNAHA5fSftm+HxHzLGmz/wn
 p5F4W+xlzFM4b9S/2qoX5lHLgjZ4o359+42NQHgalfuSRIsagFaN0tEPpSg4hjxWzM2Z
 HODw==
X-Gm-Message-State: AOAM532Zg47y239iu7yGJhsnLdrHRKEUEIWjBAO4xYbmY+Od1OXIeu7Z
 lOPfNtpt2I2DeXwbEeSDmEc6uA==
X-Google-Smtp-Source: ABdhPJxIc9GWoaa6gAKJVd6W5jAQy1yC0E6SQIMbukevjSBegTI7INclf0ufqOMstWX1pCyeO2+7kg==
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr12547619wmg.11.1612180509455; 
 Mon, 01 Feb 2021 03:55:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n193sm21181325wmb.0.2021.02.01.03.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:55:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C6331FF7E;
 Mon,  1 Feb 2021 11:55:07 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-10-f4bug@amsat.org>
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
Subject: Re: [PATCH 09/10] target: Move ARM_COMPATIBLE_SEMIHOSTING feature
 to target Kconfig
Date: Mon, 01 Feb 2021 11:54:55 +0000
In-reply-to: <20210131111316.232778-10-f4bug@amsat.org>
Message-ID: <875z3cvw85.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Mon, 01 Feb 2021 11:55:12 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> ARM_COMPATIBLE_SEMIHOSTING is an architecture feature, move its
> declaration to each target/ARCH/.
>
> Note, we do not modify the linux-user targets, as user-mode builds
> don't use Kconfig.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

